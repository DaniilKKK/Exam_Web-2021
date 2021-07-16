#include "login.h"
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QDebug>
#include <QEventLoop>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QtWidgets/QTableView>
#include <QCryptographicHash>


HttpController::HttpController(QObject *QMLObject) : showHttp(QMLObject)
{
    nam = new QNetworkAccessManager(this); // создаем менеджер
}


void HttpController::logIN(QString login, QString password){
    qDebug() << "****************" << login;
    qDebug() << "****************" << password;

    QNetworkRequest request(QUrl("http://lab81.std-1120.ist.mospolytech.ru/api/auth/login"));

    QByteArray body = "email=mail@mail.ru&password=123456";

    request.setRawHeader("Content-Type","application/x-www-form-urlencoded");
    request.setRawHeader("Accept","application/json");

    if (login == "mail@mail.ru" && password == "123456"){
        QEventLoop loop;

        nam = new QNetworkAccessManager();

        QObject::connect(nam, SIGNAL(finished(QNetworkReply*)), &loop, SLOT(quit()));

        QNetworkReply *reply = nam->post(request, body);
        loop.exec();
        auto reply_body = reply->readAll();
        qDebug() << "************" << reply_body;


        QJsonDocument document = QJsonDocument::fromJson(reply_body);
        QJsonObject root = document.object();
        QJsonValue itog = root.value("access_token");

        //qDebug() << "token************" << JWT_token;
        QString token = itog.toString();
        JWT_token = token;
        qDebug() << "token************" << JWT_token;
        emit tokenToQml(token);
    }
    getData();
    JWT_token = "";

}

void HttpController::getData(){
    if (JWT_token.length() > 0){
        QNetworkRequest request;
        request.setUrl(QUrl("http://lab81.std-1120.ist.mospolytech.ru/JwtAPI"));
        //qDebug() << request.url();
        QNetworkReply * reply;
        QEventLoop evntLoop;
        connect(nam, &QNetworkAccessManager::finished, &evntLoop, &QEventLoop::quit);
        reply = nam->get(request);
        evntLoop.exec();
        QString replyString = reply->readAll();
        qDebug() << "ДААААААААААААААААААААААААААААААААААААААААННННННННННННННННННННННЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЕЕЕЕЕЕЕЕЕЕЕЕЕЕЕ" << replyString;
        dataToQml(replyString);
    }
    else{
        QString replyString = "<h1 style = 'text-align: center'>Login incorrect</h1>";
        qDebug() << "***************************" << replyString;
        dataToQml(replyString);
    }
}

