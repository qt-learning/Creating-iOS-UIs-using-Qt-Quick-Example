#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "qdatetimepicker.h"


int main(int argc, char *argv[])
{

    qmlRegisterType<QDateTimePicker>("DateTimePicker", 1, 0, "DateTimePicker");

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/QtWS_iOSStyle/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
