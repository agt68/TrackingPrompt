import QtQuick 2.14
import QtQuick.Controls 2.14

Item {
    id: plugin

    // Wird ausgeführt sobald ein Projekt geladen wird
    Connections {
        target: iface
        function onLoadProjectEnded() {
            trackingDialog.open()
        }
    }

    // Der Dialog der aufpoppt
    Dialog {
        id: trackingDialog
        parent: iface.mainWindow()
        title: "GPS-Tracking"
        modal: true
        anchors.centerIn: parent

        // Text im Dialog
        Label {
            text: "Möchtest du das Tracking starten?"
            wrapMode: Text.WordWrap
        }

        // Buttons: Ja und Nein
        standardButtons: Dialog.Yes | Dialog.No

        // Wenn "Ja" geklickt
        onAccepted: {
            iface.startPositionTracking()
        }

        // Wenn "Nein" geklickt passiert nichts
        onRejected: {
            trackingDialog.close()
        }
    }
}
