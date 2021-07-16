#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QNetworkReply>
#include "login.h"

int main(int argc, char *argv[])
{
    //Вызов независимой функции
    //в составе класса QCoreApplication (без создания экземпляров класса)
    //просто настройка масштабирования экрана.
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    //Создается базовое приложение с графической областью
    //QtWebEngine::initialize();

    QGuiApplication app(argc, argv);
    QCoreApplication::setOrganizationName(QStringLiteral("MobDev"));
    QCoreApplication::setOrganizationDomain(QStringLiteral("qt"));

    HttpController httpController;
    //Создание браузерного движка
    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();
    context->setContextProperty("httpController", &httpController);
       //преобразование пути стартовой страницы из char в Qurl

       //подлючение слота, срабатывающего после создания objectCreated
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QObject::connect(engine.rootObjects().first(), SIGNAL(restRequest()),
    &httpController, SLOT(restRequest()));


    QObject::connect(engine.rootObjects().first(), SIGNAL(showToken(QString)),
    &httpController, SLOT(showToken(QString)));


    QObject* main = engine.rootObjects()[0];
     HttpController sendtoqml(main);
    engine.rootContext()->setContextProperty("_send", &sendtoqml);

    return app.exec();//запуск бесконечного цикла обработки сообщений и слотов/сигналов
}
