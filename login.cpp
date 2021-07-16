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
    qDebug() << "Login" << login;
    qDebug() << "Password" << password;



    if (login == "mail@mail.ru" && password == "123456"){

        qDebug() << "Вы вошли под именем: " << login;

    }


    getData();


}

void HttpController::getData(){
    if (JWT_token.length() > 0){

        qDebug() << "Вы вошли";

    }
    else{
        QString replyString = "<h1 style = 'text-align: center' >Login incorrect</h1>";
        dataToQml(replyString);
    }
}

