import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtMultimedia 5.12
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Window 2.12
import QtQml 2.12
import QtWebView 1.1
import QtWebSockets 1.1

ApplicationWindow {
    id: window


    width: 640
    height: 480

    visible: true
    title: qsTr("Stack")

    header:


        ToolBar {
        layer.smooth: true
        layer.enabled: true
        layer.mipmap: true
        contentHeight: toolButton.implicitHeight


        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6

            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height





        Text {
            id: descript
            text: "Мобильный клиент новостей"
            anchors.top: column.parent
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 18
            font.bold: true


        }

        Image
        {
            id: polytech_label
            height: 280
            width: parent.width
            anchors.bottom: parent.bottom
            source: "logo.png"



        }


        Text {
            id: exam
            anchors.bottom: polytech_label.top
            text: "Экзаменационное задание по дисциплине:"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 13
        }

        Text {
            id: exam1
            text: "Разработка безопасных мобильных приложений."
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: exam.bottom
            font.pixelSize: 13
            anchors.topMargin: 5

        }


        Text{

            id: lablel1
            text: "Автор: yurin.daniil@inbox.ru"
            anchors.left: parent.left
            anchors.top: exam1.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.leftMargin: 15
            anchors.topMargin: 5
            font.pixelSize: 13
        }

        Text{

            id: lablel2
            text: "GIT репозиторий: "
            //anchors.left: parent.left
            anchors.top: lablel1.bottom
            //anchors.leftMargin: 15
              anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 5
            font.pixelSize: 13
        }

        Label{

            id: lablel3
            onLinkActivated: Qt.openUrlExternally("https://github.com/DaniilKKK/Exam_Web-2021")
            text: "<a href='https://github.com/DaniilKKK/Exam_Web-2021'> https://github.com/DaniilKKK/Exam_Web-2021</a>"
            //anchors.left: parent.left
            anchors.top: lablel2.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            //anchors.leftMargin: 15
            anchors.topMargin: 5
            font.pixelSize: 13

        }



        Column {
            id: column
            anchors.fill: parent
            anchors.topMargin: 50
            ItemDelegate {
                text: qsTr("Новости")

                width: parent.width
                onClicked: {
                    stackView.push("News.qml")

                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Page 2")
                width: parent.width
                onClicked: {
                    stackView.push("Page2Form.ui.qml")
                    drawer.close()
                }
            }




        }

    }




    StackView {
        id: stackView
        initialItem: "Home.qml"
        anchors.fill: parent
        font.preferShaping: true
        layer.smooth: true
        layer.format: ShaderEffectSource.RGB
        layer.mipmap: true
        wheelEnabled: false

    }


}
