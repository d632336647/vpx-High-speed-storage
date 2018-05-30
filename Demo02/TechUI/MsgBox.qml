import QtQuick 2.0
import "Inc.js" as Com
Item{
    id:msg1r
    state: "HIDE"
    width: 200
    height: 80
    anchors.margins: 3
    property alias setTitle: title
    Rectangle{
    anchors.fill: parent
    color: "black"
    //z:1
    }
    Text {
//        width: parent.width
//        height: parent.height
        id: title
        state: "HIDE"
        color: Com.deviceFontColor
        text: "温度 67 ℃"
        font.pixelSize: 30
        anchors.centerIn: parent
        //过渡动画
        states: [
            State {
                name: "HIDE"
                PropertyChanges { target: title; opacity:0}
                onCompleted:{
                }
            },
            State {
                name: "SHOW"
                PropertyChanges { target: title; opacity: 1}
                onCompleted: {
                }
            }
        ]

        transitions: [
             Transition {
                 from: "SHOW"
                 to: "HIDE"
                 PropertyAnimation { properties: "opacity"; duration: 1000; easing.type: Easing.Linear }
             },
             Transition {
                 from: "HIDE"
                 to: "SHOW"
                 PropertyAnimation { properties: "opacity"; duration: 1000; easing.type: Easing.Linear }
             }
        ]
    }


    Canvas{

        id:msg1
        anchors.fill: parent
        onPaint: {
            var ctx = getContext('2d')
            //ctx.save();
            ctx.clearRect(0, 0, msg1.width, msg1.height);
            ctx.beginPath();
            ctx.lineWidth = 1.5
            //ctx.lineJoin = "round"
            ctx.lineCap = "round"
            ctx.strokeStyle = Com.deviceFontColor;
            ctx.moveTo(15,5)
            ctx.lineTo(5,15)
            ctx.lineTo(5,msg1r.height-15)
            ctx.lineTo(15, msg1r.height-5)

            ctx.moveTo(msg1r.width-15,5)
            ctx.lineTo(msg1r.width-5,15)
            ctx.lineTo(msg1r.width-5,msg1r.height-15)
            ctx.lineTo(msg1r.width-15, msg1r.height-5)

            ctx.stroke()
        }
    }
    //过渡动画
    states: [
        State {
            name: "HIDE"
            PropertyChanges { target: msg1r; height:0}
            onCompleted:{

            }
        },
        State {
            name: "SHOW"
            PropertyChanges { target: msg1r; height: 80}
            onCompleted: {

            }
        }
    ]

    transitions: [
         Transition {
             from: "SHOW"
             to: "HIDE"
             PropertyAnimation { properties: "height"; duration: 1000; easing.type: Easing.Linear }
         },
         Transition {
             from: "HIDE"
             to: "SHOW"
             PropertyAnimation { properties: "height"; duration: 1000; easing.type: Easing.Linear }
         }
    ]
    onStateChanged: {
        title.state =msg1r.state
    }
}
