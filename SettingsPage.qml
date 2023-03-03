import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.iOS

Page {
    id: settingsPage
    title: qsTr("Settings")
    topPadding: 20

    property var delegateComponentMap: {
        "Font Size": sliderComponent,
        "Show Completed Tasks": switchDelegateComponent,
        "Maximum Tasks per Project": spinBoxComponent,
        "Delete Projects After": radioDelegateComponent
    }

    header: NavBar {
        flickable: flickable
        addNewButton.visible: false
    }

    Flickable {
        id: flickable
        width: parent.width
        height: parent.height
        contentHeight: 900

        ScrollIndicator.vertical: ScrollIndicator {}

        Label {
            id: label
            text: title
            font.pointSize: 34
            font.styleName: "Bold"
            leftPadding: 20
            bottomPadding: 17
        }

        Component {
            id: sliderComponent

            ItemDelegate {
                Layout.fillWidth: true

            RowLayout {
                anchors.fill: parent
                spacing: 12
                anchors.leftMargin: 15
                anchors.rightMargin: 15

                Label {
                    text: qsTr("A")
                    font.pointSize: 15
                    font.weight: 400
                }

                Slider {
                    snapMode: Slider.SnapAlways
                    stepSize: 1
                    from: 15
                    value: 17
                    to: 21

                    Layout.fillWidth: true
                }

                Label {
                    text: qsTr("A")
                    font.pointSize: 21
                    font.weight: 400
                }
            }

            }
        }

        Component {
            id: switchDelegateComponent

            SwitchDelegate {
                id: toggleTasksSwitch
                text: labelText
        }
    }

        Component {
            id: spinBoxComponent
            ItemDelegate {
                text: labelText
                indicator: SpinBox {
                    x: parent.width - width - parent.rightPadding
                    y: parent.topPadding + (parent.availableHeight - height) / 2
                    from: 0
                    value: 50
                    to: 100
                }
            }
        }

        ButtonGroup {
            id: radioButtonGroup
        }
        Component {
            id: radioDelegateComponent
            RadioDelegate {
                text: labelText
                ButtonGroup.group: radioButtonGroup
            }
        }

        ColumnLayout {
            id: column
            spacing: 40
            width: parent.width
            height: parent.height

            ListView {
                id: listView
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.topMargin: label.height + 20
                clip: true
                model: ListModel {
                    ListElement { category: "Font Size"; text: "Font Size"; type: "sliderComponent" }
                    ListElement { category: "Show Completed Tasks"; text: "Show"; type: "checkDelegateComponent" }
                    ListElement { category: "Maximum Tasks per Project"; text: "Tasks per Project"; type: "spinBoxComponent" }
                    ListElement { category: "Delete Projects After"; text: "1 month"; type: "radioDelegateComponent" }
                    ListElement { category: "Delete Projects After"; text: "1 year"; type: "radioDelegateComponent" }
                    ListElement { category: "Delete Projects After"; text: "Never"; type: "radioDelegateComponent" }
                }

                section.property: "category"
                section.delegate: Pane {
                    width: listView.width
                    height: sectionLabel.implicitHeight + 20

                    Label {
                        id: sectionLabel
                        text: section
                        font.pointSize: 15
                        font.capitalization: Font.AllUppercase
                        color: palette.placeholderText
                    }
                }

                delegate: Loader {
                    id: delegateLoader
                    width: listView.width
                    sourceComponent: delegateComponentMap[category]

                    property string labelText: text
                    property ListView view: listView
                    property int ourIndex: index
            }
        }
    }
}
}
