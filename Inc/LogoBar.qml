import QtQuick 2.15

Row {
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 16
    spacing: 120

    Image {
        source: "qrc:/images/car_left.png"
        width: 120
        height: 60
        fillMode: Image.PreserveAspectFit
    }

    Image {
        source: "qrc:/images/car_right.png"
        width: 180
        height: 60
        fillMode: Image.PreserveAspectFit
    }
}