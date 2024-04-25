import QtQuick 2.15
import QtQuick.Controls 2.15

Window {
    visible: true
    width: 800
    height: 600
    title: "Simple Web Browser"
    id: root

    Rectangle {
        id: mainRect
        width: parent.width * 0.6
        height: parent.height * 0.8
        color: "#DDFFDD"
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2

        Column {
            anchors.centerIn: parent
            spacing: 50

            Text {
                text: "Let me teach you the Internet, senpai~"
                    + "\n\n\n\tNyaa"
                    + "\n\n\t\t>_<"
                font.bold: true
                font.pointSize: 20
                wrapMode: Text.WordWrap
                width: mainRect.width * 0.8
                color: "pink"
            }

            Row {
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    text: "Start Browsing"
                    onClicked: {
                        // Close the initial window and open the main browser window
                        // Replace with appropriate action
                    }
                }

                Button {
                    text: "Get a Quick Introduction"
                    background: Rectangle {
                        color: "lightblue"
                        radius: 10
                    }
                    onClicked: {
                        mainRect.x = -mainRect.width
                        introRect.x = (root.width - introRect.width) / 2
                        introRect.visible = true
                    }
                }
            }
        }

        Behavior on x {
            NumberAnimation {
                duration: 500
                easing.type: Easing.OutCubic
            }
        }
    }

    Rectangle {
        id: introRect
        width: parent.width * 0.6
        height: parent.height * 0.8
        color: "#FFDDDD"
        visible: false
        x: parent.width
        y: (parent.height - height) / 2

        Column {
            anchors.centerIn: parent
            spacing: 50

            Text {
                text: "Internet is full of kawaii things!"
                    + "\n\nBut also dangerous things!"
                    + "\n\nBe careful, senpai~"
                font.bold: true
                font.pointSize: 20
                wrapMode: Text.WordWrap
                width: introRect.width * 0.8
                color: "lightblue"
            }

            Button {
                text: "Back to Main"
                onClicked: {
                    mainRect.x = (root.width - mainRect.width) / 2
                    introRect.x = root.width
                }
            }
        }

        Behavior on x {
            NumberAnimation {
                duration: 500
                easing.type: Easing.OutCubic
            }
        }
    }
}
