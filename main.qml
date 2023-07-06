import QtQuick
import QtQuick.Controls.iOS

ApplicationWindow {
    id: root
    width: 390
    height: 844
    visible: true
    title: qsTr("To Do List")

    property alias stackView: stackView

    StackView {
        id: stackView
        width: parent.width
        height: parent.height
        initialItem: "qrc:/HomePage.qml"
    }

    footer: TabBar {
        TabButton {
            text: "To Do"
            icon.source: "qrc:/images/list.png"
            onClicked: stackView.replace("qrc:/HomePage.qml")
        }

        TabButton {
            text: "Settings"
            icon.source: "qrc:/images/settings.png"
            onClicked: stackView.replace("qrc:/SettingsPage.qml")
        }
    }
}
