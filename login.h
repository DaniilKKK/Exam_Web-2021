#ifndef QHTTPCONTROLLER_H
#define QHTTPCONTROLLER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QCryptographicHash>

class HttpController : public QObject

{
    Q_OBJECT
public:
    explicit HttpController(QObject *parent = nullptr);

    QNetworkAccessManager *nam;
    QString m_accessToken; // полученный access_token
    QString session_secr; //получение секрета
     QString JWT_token;

signals:
     void tokenToQml(QString token);
     void dataToQml(QString pageContent);

public slots:
    void logIN(QString login, QString password);
    void getData();


protected:
    QObject *showHttp;

};

#endif // QHTTPCONTROLLER_H
