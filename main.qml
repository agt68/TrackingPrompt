import QtQuick 2.14
import QtQuick.Controls 2.14

Item {
    id: plugin

    Connections {
        target: iface
        function onProjectOpened() {
            trackingDialog.open()
        }
    }

    Dialog {
        id: trackingDialog
        parent: iface.mainWindow()
        title: "GPS-Tracking"
        modal: true
        anchors.centerIn: parent

        Label {
            text: "Möchtest du das Tracking starten?"
            wrapMode: Text.WordWrap
        }

        standardButtons: Dialog.Yes | Dialog.No

        onAccepted: {
            iface.startPositionTracking()
        }

        onRejected: {
            trackingDialog.close()
        }
    }
} 

