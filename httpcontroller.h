#ifndef HTTPCONTROLLER_H
#define HTTPCONTROLLER_H

#include <QObject>

class HttpController : public QObject
{
    Q_OBJECT
public:
    explicit HttpController(QObject *parent = nullptr);

signals:

};

#endif // HTTPCONTROLLER_H
