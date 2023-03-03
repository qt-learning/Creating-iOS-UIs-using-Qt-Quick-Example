import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.iOS

Page {
    id: homePage
    title: qsTr("To Do")
    topPadding: 20

    header: NavBar {
        flickable: flickable
        popup: newProjectPopup
    }

    Flickable {
        id: flickable
        width: parent.width
        height: parent.height
        contentHeight: listView.height

        Label {
            id: label
            text: title
            font.pointSize: 34
            font.styleName: "Bold"
            leftPadding: 20
            bottomPadding: 17
        }

        ListView {
            id: listView
            anchors.fill: parent
            anchors.topMargin: label.height
            model: ListModel {
                id: projectsModel
                ListElement {
                    title: "Project 1"
                    note: "Project Note"
                    completedTasks: 2
                    totalTasks: 4
                }
                ListElement {
                    title: "Project 2"
                    note: "Project Note"
                    completedTasks: 2
                    totalTasks: 4
                }
                ListElement {
                    title: "Project 3"
                    note: "Project Note"
                    completedTasks: 2
                    totalTasks: 4
                }
                ListElement {
                    title: "Project 4"
                    note: "Project Note"
                    completedTasks: 2
                    totalTasks: 4
                }
                ListElement {
                    title: "Project 5"
                    note: "Project Note"
                    completedTasks: 2
                    totalTasks: 4
                }
                ListElement {
                    title: "Project 6"
                    note: "Project Note"
                    completedTasks: 2
                    totalTasks: 4
                }
                ListElement {
                    title: "Project 7"
                    note: "Project Note"
                    completedTasks: 2
                    totalTasks: 4
                }
                ListElement {
                    title: "Project 8"
                    note: "Project Note"
                    completedTasks: 2
                    totalTasks: 4
                }
                ListElement {
                    title: "Project 9"
                    note: "Project Note"
                    completedTasks: 2
                    totalTasks: 4
                }
                ListElement {
                    title: "Project 10"
                    note: "Project Note"
                    completedTasks: 2
                    totalTasks: 4
                }
            }
            delegate: ItemDelegate {
                width: listView.width
                text: model.title

                indicator: Image {
                    source: Qt.styleHints.colorScheme === Qt.Dark
                            ? "qrc:/images/arrow-indicator-dark.png"
                            : "qrc:/images/arrow-indicator-light.png"

                    anchors.verticalCenter: parent.verticalCenter
                    x: parent.width - width - parent.rightPadding
                }

                onPressed: {
                    let project = projectsModel.get(index)
                    root.stackView.push("TaskPage.qml", {
                        "projectsModel": projectsModel,
                        "projectIndex": index,
                        "projectName": project.title,
                        "projectNote": project.note,
                        "completedTasks": project.completedTasks,
                        "totalTasks": project.totalTasks
                    })
                }
            }
        }
    }

    Popup {
        id: newProjectPopup
        anchors.centerIn: parent
        height: 200
        modal: true

        ColumnLayout {
            anchors.fill: parent

            Label {
                text: qsTr("Project Name")
                font.styleName: "Semibold"

                Layout.alignment: Qt.AlignHCenter
            }

            TextField {
                id: newProjectTextField
                placeholderText: qsTr("Enter project name")

                Layout.fillWidth: true
                Layout.leftMargin: 10
                Layout.rightMargin: 10

                Keys.onReturnPressed: {
                    if (createProjectButton.enabled)
                        createProjectButton.clicked()
                }
            }

            Button {
                id: createProjectButton
                text: qsTr("Create project")
                flat: true

                Layout.alignment: Qt.AlignHCenter

                onClicked: {
                    projectsModel.append({
                        title: newProjectTextField.text,
                        totalTasks: 0,
                        completedTasks: 0,
                        note: ""
                    })
                    newProjectPopup.close()
                }
            }
        }
    }
}
