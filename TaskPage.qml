import QtQuick
import QtQuick.Controls.iOS
import QtQuick.Layouts

Page {
    id: page
    title: qsTr(projectName)
    topPadding: 20

    required property ListModel projectsModel
    required property int projectIndex
    required property string projectName
    required property string projectNote
    required property int completedTasks
    required property int totalTasks

    header: NavBar {
        id: navbar
        flickable: flickable
        popup: addTaskPopup
    }

    Flickable {
        id: flickable
        width: parent.width
        height: parent.height
        contentHeight: 900

        ScrollIndicator.vertical: ScrollIndicator {}

        ColumnLayout {
            id: titleRow
            spacing: 4
            Label {
                id: projectNameLabel
                text: projectName
                font.pointSize: 34
                font.styleName: "Bold"
                Layout.leftMargin: 20
            }

            Label {
                id: progressLabel
                text: completedTasks + " / " + totalTasks
                Layout.leftMargin: 20
            }

            ProgressBar {
                id: progressBar
                from: 0
                value: completedTasks
                to: totalTasks
                Layout.leftMargin: 20
            }
        }

        ColumnLayout {
            width: parent.width
            height: parent.height

            TextArea {
                id: textArea

                Layout.fillWidth: true
                Layout.preferredHeight: 80
                Layout.topMargin: titleRow.height + 20

                leftPadding: 15
                bottomPadding: 10
                topPadding: 10
                placeholderText: qsTr("Write a note...")
                text: projectNote
                wrapMode: TextArea.Wrap
                clip: true

                onPressed: {
                    navbar.editingFinishedButton.visible = true
                    navbar.addNewButton.visible = false
                }

                onEditingFinished: {
                    projectsModel.setProperty(projectIndex, "note", textArea.text)
                    navbar.editingFinishedButton.visible = false
                    navbar.addNewButton.visible = true
                }
            }

            ListView {
                id: taskListView
                model: taskModel
                clip: true

                width: parent.width
                height: parent.height
                Layout.topMargin: 30

                ListModel {
                    id: taskModel
                    ListElement {
                        title: "Task 1"
                        done: true
                    }
                    ListElement {
                        title: "Task 2"
                        done: true
                    }
                    ListElement {
                        title: "Task 3"
                        done: false
                    }
                    ListElement {
                        title: "Task 4"
                        done: false
                    }
                }

                delegate: CheckDelegate {
                    id: taskList
                    width: taskListView.width
                    checked: done
                    text: title

                    onClicked: {
                        taskModel.setProperty(index, "done", checked)
                        if (done)
                            completedTasks++
                        else
                            completedTasks--
                        projectsModel.setProperty(projectIndex, "completedTasks", completedTasks)
                    }
                }
            }
        }
    }
    Popup {
        id: addTaskPopup
        parent: root
        anchors.centerIn: parent
        height: 200
        modal: true
        focus: true

        ColumnLayout {
            anchors.fill: parent

            Label {
                text: qsTr("Add New Task")
                font.pointSize: 17
                font.styleName: "Semibold"
                Layout.alignment: Qt.AlignHCenter
            }

            TextField {
                id: newTaskNameTextField
                placeholderText: qsTr("Enter task name")
                font.pointSize: 17

                Layout.fillWidth: true
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                Layout.alignment: Qt.AlignHCenter
            }

            Button {
                id: addTaskButton
                text: qsTr("Add task")
                flat: true
                enabled: newTaskNameTextField.length > 0

                Layout.alignment: Qt.AlignHCenter

                onClicked: {
                    taskModel.append({
                        "title": newTaskNameTextField.text, "done": false
                    })
                    projectsModel.setProperty(projectIndex, "totalTasks", taskListView.count)
                    totalTasks++
                    addTaskPopup.close()
                }

             }
        }
    }
}
