#ifndef DISPATCHER_H
#define DISPATCHER_H

#include <QGuiApplication>
#include <QObject>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "modules/dispatcher/macros/dispatcherMacro.h"

class Dispatcher : public QObject {
    Q_OBJECT

    Q_PROPERTY(QString appVer READ appVer CONSTANT)

public:
    Dispatcher(QGuiApplication&, QObject* parent = nullptr);
    Dispatcher(QObject* parent = nullptr);
    QString appVer() const { return APP_VER; }

    static Dispatcher* getInstance()
    {
        static Dispatcher* instance;
        if (!instance)
            instance = new Dispatcher();
        return instance;
    }

    static QQmlApplicationEngine* getEngine()
    {
        static QQmlApplicationEngine* engine;
        if (!engine) {
            engine = new QQmlApplicationEngine();
        }
        return engine;
    }

    static QQmlContext* getContext()
    {
        static QQmlContext* context;
        if (!context)
            context = getEngine()->rootContext();
        return context;
    }

    //    static QGuiApplication* getApp()
    //    {
    //        return app;
    //    }

    void registerTypes();
    void setTitleBar();

private:
    // static QGuiApplication* app;
};

#endif // DISPATCHER_H
