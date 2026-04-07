import QtQuick 2.14
import QtQuick.Controls 2.14
import QtPositioning 5.14

Item {
    id: plugin

    // GPS-Quelle (QField-kompatibel)
    PositionSource {
        id: positionSource
        active: false
    }

    // Wird beim Laden des Plugins ausgeführt (statt onProjectOpened)
    Component.onCompleted: {
        trackingDialog.open()
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
            positionSource.active = true
        }

        onRejected: {
            trackingDialog.close()
        }
    }
}
