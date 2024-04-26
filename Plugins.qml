import QtQuick 2.15
import QtQuick.Controls 2.15

Window {
    visible: true
    width: 800
    height: 600
    title: "Simple Web Browser - Plugins"
    id: root

    ListView {
        id: pluginListView
        width: parent.width
        height: parent.height
        clip: true
        model: pluginModel

        delegate: Item {
            width: parent.width
            height: 180
            Rectangle {
                color: "#f0f0f0"
                radius: 10
                anchors.fill: parent
                anchors.margins: 15
                id: pluginItem

                MouseArea {
                    anchors.fill: parent
                    onClicked: showPluginDetails(model)
                }

                Row {
                    spacing: 10

                    Image {
                        source: model.logo
                        width: 60
                        height: 60
                        //fillMode: Image.PreserveAspectFit
                    }

                    Column {
                        Text {
                            text: model.name
                            font.bold: true
                            font.pixelSize: 64
                        }
                        Text {
                            text: model.description
                            font.pixelSize: 24
                            width: pluginItem.width - 80
                            wrapMode: Text.Wrap
                        }
                    }
                }
            }
        }
    }

    ListModel {
        id: pluginModel
        ListElement {
            name: "Adblocker"
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            rating: "★★★★★"
            logo: "resources/plugin-1.png"
        }
        ListElement {
            name: "No tracking"
            description: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
            rating: "★★★★☆"
            logo: "resources/plugin-2.png"
        }
        // Add more plugins as needed
    }

    Popup {
        id: pluginDetailsPopup
        width: 400
        height: 300
        x: (root.width - width) / 2
        y: root.height + height
        contentItem: Rectangle {
            color: "#f0f0f0"
            radius: 10
            anchors.fill: parent

            Column {
                anchors.fill: parent
                spacing: 10
                padding: 10

                Text {
                    text: "Plugin Details"
                    font.bold: true
                    font.pointSize: 32
                }
                Text {
                    text: "Name: " + pluginDetails.name
                    font.pointSize: 18
                }
                Text {
                    text: "Description: " + pluginDetails.description
                    font.pointSize: 18
                    wrapMode: Text.Wrap
                    width: parent.width - 20
                }
                Text {
                    text: "Rating: " + pluginDetails.rating
                    font.pointSize: 18
                }
                Button {
                    text: "Download"
                    onClicked: {
                    }
                }
            }
        }

        focus: true
        modal: true
        visible: false

        Behavior on y {
            NumberAnimation {
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }

        onOpened: {
            y = (root.height - height) / 2
        }

        onClosed: {
            y = root.height + height
        }
    }

    function showPluginDetails(plugin) {
        pluginDetails = plugin
        pluginDetailsPopup.open()
    }

    property var pluginDetails: {}
}

