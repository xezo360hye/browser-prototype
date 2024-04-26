import QtQuick 2.15
import QtQuick.Controls 2.15

Window {
    visible: true
    width: 400
    height: 300
    title: "Manager Window"
    id: root

    Column {
        spacing: 35
        anchors.centerIn: parent
        width: parent.width - 50
        height: parent.height - 50

        Button {
            text: "Initial Screen"
            font.pixelSize: 20
            width: 200
            height: 50
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                var component = Qt.createComponent("Initial.qml");
                if (component.status === Component.Ready) {
                    var windowObject = component.createObject(root);
                    windowObject.show();
                }
            }
        }

        Button {
            text: "Main Screen"
            font.pixelSize: 20
            width: 200
            height: 50
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                var component = Qt.createComponent("Browser.qml");
                if (component.status === Component.Ready) {
                    var windowObject = component.createObject(root);
                    windowObject.show();
                }
            }
        }

        Button {
            text: "Plugins Screen"
            font.pixelSize: 20
            width: 200
            height: 50
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                var component = Qt.createComponent("Plugins.qml");
                if (component.status === Component.Ready) {
                    var windowObject = component.createObject(root);
                    windowObject.show();
                }
            }
        }
    }
}
