import QtQuick 2.7
import QtGraphicalEffects 1.0
import "Inc.js" as Com
//4角高亮 控件
Item {
    id:root
    state: "HIDE"
    clip: true
    visible : true
    property color  bgColor: "black"
    property color  borderColor: Com.borderColor
    property color  shadowColor: Com.shadowColor
    property int    iw: 2
    property real   scaleRate: 0
    property color  textColor: "#C0C0C0"
    property string text: "D1"
    property string fontFamily: Com.mainFont
    property int    fontSize: 16
    property int    offset: 8
    property real   cornerWidth: 3.5
    property alias logArea: logArea

    BorderL {
        id:bgLine
        anchors.fill: parent
        showGrow: false
    }


    Rectangle {
        id:logArea
        anchors.fill: parent
        color: "#00FFFFFF"
        //transform: Scale { origin.x: width/2; origin.y: height/2; xScale: scaleRate; yScale: scaleRate}
        Canvas{
            id:borderLine
            anchors.fill: parent
            onPaint: {
                var ctx = getContext('2d')
                //ctx.save();
                ctx.clearRect(0, 0, width, height);
                ctx.beginPath();
                ctx.lineWidth = cornerWidth
                //ctx.lineJoin = "round"
                ctx.lineCap = "square"
                ctx.strokeStyle = borderColor;
                ctx.moveTo(iw, 2*iw+offset)
                ctx.lineTo(iw, iw)
                ctx.lineTo(2*iw+offset, iw)
                ctx.stroke()

                ctx.moveTo(width-2*iw-offset, iw)
                ctx.lineTo(width-iw, iw)
                ctx.lineTo(width-iw, 2*iw+offset)
                ctx.stroke()

                ctx.moveTo(width-iw, height - 2*iw- offset)
                ctx.lineTo(width-iw, height - iw)
                ctx.lineTo(width-2*iw-offset, height - iw)
                ctx.stroke()

                ctx.moveTo(2*iw+offset, height - iw)
                ctx.lineTo(iw, height - iw)
                ctx.lineTo(iw, height - 2*iw - offset)
                ctx.stroke()
            }
        }

        Glow {
            id:lineGrow
            source: borderLine
            anchors.fill: borderLine
            cached: true
            fast: true
            radius: 6
            samples: 10
            color: shadowColor
            spread: 0.4
            opacity: 0.8
        }

        Text {
            id: btnText
            anchors.fill: parent
            anchors{leftMargin: 2*iw; rightMargin: 2*iw; topMargin: 2*iw; bottomMargin: 2*iw}
            color: textColor
            text: root.text
            font.pixelSize: 16
            font.family: fontFamily
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            //font.family: "themify"
        }
    }




    //过渡动画
    states: [
        State {
            name: "HIDE"
            PropertyChanges { target: logArea; opacity: 0}
            onCompleted:{

            }
        },
        State {
            name: "SHOW"
            PropertyChanges { target: logArea; opacity: 1}
            onCompleted: {

            }
        }
    ]

//    transitions: [
//         Transition {
//             from: "SHOW"
//             to: "HIDE"
//             PropertyAnimation { properties: "opacity"; duration: 1500; easing.type: Easing.InBounce }
//         },
//         Transition {
//             from: "HIDE"
//             to: "SHOW"
//             PropertyAnimation { properties: "opacity"; duration: 800; easing.type: Easing.InBounce }//OutBounce
//         }
//    ]

    onVisibleChanged:
    {
        root.state = (visible == true) ? "SHOW":"HIDE"
        bgLine.state = (visible == true) ? "SHOW":"HIDE"


    }
    Component.onCompleted:
    {
        root.state = "SHOW"
    }

}
