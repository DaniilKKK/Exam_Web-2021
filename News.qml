import QtQuick 2.12
import QtQuick.Controls 2.5

Page {


    title: qsTr("Новости")

    Rectangle {
        anchors.fill: parent
        anchors.rightMargin: 01
        anchors.leftMargin: 0
        color: "#EBEBEB"

        ListModel {
            id: notesList

            ListElement {
                title: "Заголовок 1"
                image: "logo.png"
                date: "16 июня 2021"

            }

            ListElement {
                title: "Заголовок 2"
                image: "logo.png"
                date: "23 июня 2021"
            }

            ListElement {
                title: "Заголовок 3"
                image: "logo2.jpg"
                date: "13 июля 2021"
            }
            ListElement {
                title: "Заголовок 4"
                image: "logo3.jpg"
                date: "16 июля 2021"
            }
        }

        GridView {
            anchors.top: parent.top

            anchors.left: parent.left
            anchors.leftMargin: 21
            anchors.topMargin: 25
            width: parent.width*0.95
            height: parent.height*0.85

            model: notesList

            cellWidth: 250;
            cellHeight: 250 // Ширина, высота ячейки.

            delegate: noteDelegate
            // Создаем делегат (шаблон) для нашего списка.
            Component {
                id: noteDelegate
                Rectangle {
                    id: noteElement
                    width: 235
                    height: 235
                    color: "#C3C7D2"
                    Label {
                        id: noteLabel
                        text: "<font color='white'><strong>"+title+"</strong></font>"
                        background: Rectangle {
                            color: "#9CA2B0"
                            radius: 4
                        }
                        width: parent.width
                        height: 20
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignHCenter
                    }


                    Image
                    {
                        id: noteImage
                        anchors.top: noteLabel.bottom
                        width: parent.width
                        height: 150
                        source: image
                    }

                    Label {
                        id: noteText     //время
                        anchors.top: noteImage.bottom
                        width: parent.width
                        height: 40
                        anchors.topMargin: 20
                        //anchors.horizontalCenter: parent.horizontalCenter
                        horizontalAlignment: Text.AlignHCenter
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        color: "white"
                        text: date

                    }


                }
            }
        }
    }
}
