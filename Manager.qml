import QtQuick 2.15
import QtQuick.Controls 2.15

Window {
    visible: true
    width: 400
    height: 200
    title: "Manager Window"
    id: root

    Row {
        spacing: 10

        Button {
            text: "Initial Screen"
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
