!uikit: error(This demo is only supported on iOS)
QT += quick

SOURCES += \
        main.cpp

resources.files = main.qml 
resources.prefix = /$${TARGET}
RESOURCES += resources \
    resources.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = .

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    HomePage.qml \
    NavBar.qml \
    SettingsPage.qml \
    TaskPage.qml

HEADERS += \
    qdatetimepicker.h


LIBS += -framework UIKit
OBJECTIVE_SOURCES += \
qdatetimepicker.mm
