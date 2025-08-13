import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

ApplicationWindow {
    visible: true
    width: 1280
    height: 720
    color: "#222"

    // Top bar
    Row {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 32
        spacing: 32

        Rectangle {
            width: 60; height: 28; radius: 8
            color: "#333"
            border.color: "#00b894"
            border.width: 2
            Row {
                anchors.centerIn: parent
                spacing: 4
                Rectangle {
                    width: 20; height: 16; radius: 4
                    color: "#00b894"
                }
                Text {
                    text: "50%"
                    color: "#fff"
                    font.pixelSize: 18
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }

        Item { width: 32 }

        Text {
            text: "32°C"
            color: "#fff"
            font.pixelSize: 22
            anchors.verticalCenter: parent.verticalCenter
        }

        Item { width: 32 }

        Item {
            width: 600
            Column {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 2
                Text { text: Qt.formatDate(new Date(), "d/M/yyyy"); color: "#fff"; font.pixelSize: 20 }
                Text { text: Qt.formatTime(new Date(), "hh:mm"); color: "#fff"; font.pixelSize: 20 }
            }
        }
    }

    // Main content
    Item {
        anchors.fill: parent

        // Speed gauge center (analog style)
        Item {
            width: 500; height: 500
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Canvas {
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.clearRect(0, 0, width, height)

                    // Gradient arc
                    var grad = ctx.createLinearGradient(0, 0, width, height)
                    grad.addColorStop(0, "#00eaff")
                    grad.addColorStop(0.5, "#a86fff")
                    grad.addColorStop(1, "#ff00c8")
                    ctx.strokeStyle = grad
                    ctx.lineWidth = 24
                    ctx.beginPath()
                    ctx.arc(width/2, height/2, 210, Math.PI*0.75, Math.PI*0.25, false)
                    ctx.stroke()

                    // Draw ticks and numbers
                    ctx.save()
                    ctx.translate(width/2, height/2)
                    var minAngle = Math.PI*0.75
                    var maxAngle = Math.PI*0.25
                    var maxSpeed = 180
                    for (var i = 0; i <= maxSpeed; i += 10) {
                        var angle = minAngle + (maxAngle-minAngle)*i/maxSpeed
                        var x1 = Math.cos(angle)*180
                        var y1 = Math.sin(angle)*180
                        var x2 = Math.cos(angle)*210
                        var y2 = Math.sin(angle)*210
                        ctx.strokeStyle = "#fff"
                        ctx.lineWidth = (i % 20 === 0) ? 4 : 2
                        ctx.beginPath()
                        ctx.moveTo(x1, y1)
                        ctx.lineTo(x2, y2)
                        ctx.stroke()
                    }
                    ctx.font = "bold 32px sans-serif"
                    ctx.fillStyle = "#fff"
                    for (var i = 0; i <= maxSpeed; i += 20) {
                        var angle = minAngle + (maxAngle-minAngle)*i/maxSpeed
                        var nx = Math.cos(angle)*140-18
                        var ny = Math.sin(angle)*140+12
                        ctx.fillText(i.toString(), nx, ny)
                    }
                    ctx.restore()

                    // Draw needle
                    var speed = robotModel.motorSpeed || 0
                    var needleAngle = minAngle + (maxAngle-minAngle)*speed/maxSpeed
                    ctx.save()
                    ctx.translate(width/2, height/2)
                    ctx.rotate(needleAngle)
                    ctx.strokeStyle = "#ff00c8"
                    ctx.lineWidth = 8
                    ctx.beginPath()
                    ctx.moveTo(0, 0)
                    ctx.lineTo(0, -170)
                    ctx.stroke()
                    // Center circle
                    ctx.beginPath()
                    ctx.arc(0, 0, 14, 0, 2*Math.PI)
                    ctx.fillStyle = "#222"
                    ctx.fill()
                    ctx.strokeStyle = "#fff"
                    ctx.lineWidth = 3
                    ctx.stroke()
                    ctx.restore()
                }
            }

            // Speed value in center
            Text {
                text: robotModel.motorSpeed + " KM/H"
                anchors.centerIn: parent
                font.pixelSize: 64
                color: "#fff"
                font.bold: true
            }
        }

        // Car images left/right (logo xe)
        Image {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 120
            width: 220
            height: 110
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/car_left.png"
        }
        Image {
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 120
            width: 300
            height: 110
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/car_right.png"
        }

        // ODO & BAT bottom
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 48
            spacing: 120
            Text { text: "ODO: 17256 KM"; color: "#00eaff"; font.pixelSize: 28 }
            Text { text: "BAT: 000426 KM"; color: "#ff00c8"; font.pixelSize: 28 }
        }

        // Logo bottom
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 16
            text: "THANH NGUYEN"
            color: "#fff"
            font.pixelSize: 24
            font.bold: true
        }
    }
}