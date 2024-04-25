import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtWebView

Window {
    visible: true
    width: 800
    height: 600
    title: "Simple Web Browser"
    id: root

    function prependHttp(url) {
        if (url.substring(0, 4) !== "http") {
            return "https://" + url
        }
        return url
    }

    function getWebViewHeight() {
        return (searchBar.visible ?
        root.height - searchBar.height - tabs.height :
        root.height)
    }

    function addNewTab() {
        var newTabWebView = webViewComponent.createObject(root)
        newTabWebView.url = "https://ddg.gg"
        tabList.push(newTabWebView)
        webViewContainer.children = [newTabWebView]
        currentTab = tabList.length - 1
    }

    function getCurrentTab() {
        return tabList[currentTab]
    }

    Rectangle {
        id: searchBar
        color: "#f0f0f0"
        height: 40
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        TextField {
            id: searchInput
            placeholderText: "Enter URL"
            onAccepted: getCurrentTab().url = prependHttp(searchInput.text)
            width: parent.width - backButton.width - forwardButton.width - 50
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: forwardButton.right
            leftPadding: 10
        }

        Button {
            id: backButton
            text: "<"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            onClicked: getCurrentTab().goBack()
        }

        Button {
            id: forwardButton
            text: ">"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: backButton.right
            onClicked: getCurrentTab().goForward()
        }

        Button {
            text: "Go"
            onClicked: getCurrentTab().url = prependHttp(searchInput.text)
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            rightPadding: 10
        }
    }

    property var currentTab: 0
    property list<WebView> tabList: []
    Component.onCompleted: addNewTab()
    Row {
        id: tabs
        spacing: 5
        height: 20
        width: parent.width
        anchors.top: searchBar.bottom

        Repeater {
            anchors.fill: parent
            model: tabList.length
            delegate: Rectangle {
                width: tabs.width / tabList.length
                height: tabs.height
                color: (index === currentTab) ? "lightblue" : "lightgray"
                Text {
                    text: tabList[index].title
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        currentTab = index
                        webViewContainer.children = [tabList[index]]
                    }
                }
            }
        }
    }

    Item {
        id: webViewContainer
        anchors {
            top: tabs.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }

    Component {
        id: webViewComponent
        WebView {
            id: webView
            anchors.fill: webViewContainer
            url: "https://ddg.gg"
        }
    }

    Shortcut {
        sequence: "Ctrl+H"
        onActivated: {
            searchBar.visible = !searchBar.visible;
            tabs.visible = !tabs.visible;
            webView.height = getWebViewHeight();
        }
    }

    Shortcut {
        sequence: "Ctrl+L"
        onActivated: {
            searchInput.forceActiveFocus();
            searchInput.selectAll();
        }
    }

    Shortcut {
        sequence: "Ctrl+T"
        onActivated: addNewTab()
    }
}
