import QtQuick
import QtQuick.Controls.iOS

ToolBar {
    id: toolbar
    width: parent.width
    anchors.top: parent.top

    property Flickable flickable
    property StackView stackView: root.stackView
    property Popup popup
    property var previousItem: stackView.get(parent.StackView.index - 1)

    property alias addNewButton: addNewButton
    property alias editingFinishedButton: editingFinishedButton

    background.visible: !flickable.atYBeginning

    // Back button
    ToolButton {
        anchors.left: parent.left
        display: Qt.ToolButtonTextBesideIcon
        icon.source: "qrc:/back-light"

        visible: stackView.depth >= 2
        text: previousItem ? previousItem.title : ""
        onClicked: stackView.pop()
    }


    // Title
    Label {
        anchors.centerIn: parent
        font.styleName: "Semibold"
        text: stackView.currentItem.title
        visible: toolbar.background.visible
    }

        ToolButton {
            id: addNewButton
            display: Qt.ToolButtonIconOnly
            icon.source: "qrc:/images/add-new.png"
            anchors.right: parent.right
            onClicked: popup.open()
        }

        ToolButton {
            id: editingFinishedButton
            display: Qt.ToolButtonTextOnly
            text: qsTr("Done")
            visible: false
            anchors.right: parent.right
        }

}
