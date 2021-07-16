import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtMultimedia 5.12
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick 2.0
import QtQuick.Window 2.12
import QtQml 2.12
import QtWebView 1.1
import QtWebSockets 1.1


Page {
    id: page
    width: 600
    height: 400

    title: qsTr("Главная")

    Connections {
        target: httpController // Указываем целевой объект для соединения

        onTokenToQml: {
            tokenShow.text = token // Устанавливаем аву
        }

        onDataToQml: {
            base64data.text = pageContent;
        }
    }



GridLayout {
    id: mainLayout
    anchors.rightMargin: 1
    anchors.leftMargin: -1
    anchors.topMargin: 1
    columns: 2

    rowSpacing: 5
    columnSpacing: 5

    anchors {
        top: parent.top;
        left: parent.left
        right: parent.right
    }

    Label {
        id: loginLabel

        anchors.left: parent.left
        anchors.leftMargin: 15
        font.pixelSize: 18
        font.bold: true
        text: "Логин"


    }

    TextField {
        id: login

        anchors.left: loginLabel.right
        anchors.leftMargin: 20
        //anchors.horizontalCenter: parent.horizontalCenter
        Material.accent: "#1262cb"
        font.pixelSize: 20
         anchors.right:parent.right
    }

    Label {
        id: passwordLabel
        font.pixelSize: 18
        font.bold: true
        anchors.left: parent.left
        anchors.leftMargin: 15
        anchors.topMargin:  60
        anchors.top: login.bottom

        text: "Пароль"
    }

    TextField {
        id: password

        anchors.left: passwordLabel.right
        anchors.leftMargin: 20
        anchors.topMargin:  60
        anchors.top: login.bottom
        //anchors.horizontalCenter: parent.horizontalCenter
         anchors.right:parent.right
        Material.accent: "#1262cb"
        font.pixelSize: 20
        echoMode: TextInput.Password
    }

    Button{
        id: send

        anchors.left: parent.left
        anchors.leftMargin: 15
        anchors.right:  parent.right
        anchors.rightMargin:  15
        anchors.top: password.bottom
        anchors.topMargin: 30
        font.pixelSize: 18
        font.bold: true
        layer.enabled: true
        layer.mipmap: true
        text: "Авторизация"
        background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        color: "#3DD283"
        border.width: 1
        radius: 5
        }

        onClicked:{
            httpController.logIN(login.text, password.text);

            if (login.text == "mail@mail.ru" && password.text==="123456" )
            {

            stackView.push("News.qml")
            }
        }
    }
}

ScrollView {
    anchors.top: mainLayout.bottom
    anchors.topMargin: 83

    anchors.left: parent.left
    anchors.leftMargin: 15

    anchors.right: parent.right
    anchors.rightMargin: 12

    anchors.bottom: parent.bottom
    anchors.bottomMargin: 15

    clip:  true

   TextArea{
        id: base64data
        textFormat: Text.RichText
        objectName: "textArea"
        readOnly: true
        anchors.fill: parent
        color: "#FC6262"
    }

   background: Rectangle {
       id: news
       color: "#ffffff"
       visible: true
   }
}

}
