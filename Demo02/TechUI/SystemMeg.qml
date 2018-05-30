import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQml.Models 2.2

import "Inc.js" as Com
Item {
    id:root
    state: "HIDE"
    anchors.fill: parent
//    width: parent.width
//    height: parent.height
    property color borderColor: "#A00AFFFC"
    property color shadowColor: "#0AFFFC"
    Component.onCompleted: {
        root.state = "SHOW"
        deviceSN.state = "SHOW"
    }
    //过渡动画
    states: [
        State {
            name: "HIDE"
            PropertyChanges { target: root; scale: 0}
            onCompleted:{

            }
        },
        State {
            name: "SHOW"
            PropertyChanges { target: root; scale: 1}
            onCompleted: {
                lineGrow.state = "SHOW"
                leftRightLine.state = "SHOW"
            }
        }
    ]
    transitions: [
         Transition {
             from: "SHOW"
             to: "HIDE"
             PropertyAnimation { properties: "scale"; duration: 300; easing.type: Easing.Linear }
         },
         Transition {
             from: "HIDE"
             to: "SHOW"
             PropertyAnimation { properties: "scale"; duration: 300; easing.type: Easing.Linear }
         }
    ]

    Rectangle{
        id:back
        color: "black"
        anchors.fill: parent
    }
    Canvas{
        id:leftRightLine
        state: "HIDE"
        anchors.fill: parent
        onPaint: {
            var ctx = getContext('2d')
            //ctx.save();
            ctx.clearRect(0, 0, leftRightLine.width, leftRightLine.height);
            ctx.beginPath();
            ctx.lineWidth = 1.5
            //ctx.lineJoin = "round"
            ctx.lineCap = "round"
            ctx.strokeStyle = borderColor;
            ctx.moveTo(15,5)
            ctx.lineTo(5,15)
            ctx.lineTo(5,root.height-15)
            ctx.lineTo(15, root.height-5)

            ctx.moveTo(root.width-15,5)
            ctx.lineTo(root.width-5,15)
            ctx.lineTo(root.width-5,root.height-15)
            ctx.lineTo(root.width-15, root.height-5)

            ctx.stroke()
        }
        //过渡动画
        states: [
            State {
                name: "HIDE"
                PropertyChanges { target: leftRightLine; scale: 0}
                onCompleted:{
                    root.state = "HIDE"
                }
            },
            State {
                name: "SHOW"
                PropertyChanges { target: leftRightLine; scale: 1}
                onCompleted: {

                }
            }
        ]
        transitions: [
             Transition {
                 from: "SHOW"
                 to: "HIDE"
                 PropertyAnimation { properties: "scale"; duration: 1000; easing.type: Easing.OutBounce }
             },
             Transition {
                 from: "HIDE"
                 to: "SHOW"
                 PropertyAnimation { properties: "scale"; duration: 1000; easing.type: Easing.InBounce }
             }
        ]
    }
    Glow {
        id:lineGrow
        state: "HIDE"
        source: leftRightLine
        anchors.fill: leftRightLine
        cached: true
        fast: true
        radius: 10
        samples: 14
        color: shadowColor
        spread: 0.6
        opacity: 0.8

        //过渡动画
        states: [
            State {
                name: "HIDE"
                //PropertyChanges { target: root; opacity: 0;}
                PropertyChanges { target: lineGrow; scale: 0}
                onCompleted:{

                }
            },
            State {
                name: "SHOW"
                //PropertyChanges { target: root; opacity: 1}
                PropertyChanges { target: lineGrow; scale: 1}
                onCompleted: {

                }
            }
        ]

        transitions: [
             Transition {
                 from: "SHOW"
                 to: "HIDE"
                 PropertyAnimation { properties: "scale"; duration: 300; easing.type: Easing.OutBounce }
             },
             Transition {
                 from: "HIDE"
                 to: "SHOW"
                 PropertyAnimation { properties: "scale"; duration: 300; easing.type: Easing.InBounce }
             }
        ]

    }

    Text {
        id: deviceSN
        state: "HIDE"
        color: Com.deviceFontColor
        text: "\ue60f 系统管理"
        font.pixelSize: 40
        font.family: Com.themify
//        font.bold: true         //粗体
//        font.italic: true       //斜体
//        font.underline: true    //下划线
//        font.strikeout: true    //删除线
        style: Text.Raised      //立体效果
        //        font.family: Com.themify
//        anchors.left: parent.left
//        anchors.top:  parent.top
//        anchors.margins: 10
        anchors.centerIn: parent

        //过渡动画
        states: [
            State {
                name: "HIDE"
                PropertyChanges { target: deviceSN; opacity: 0}
                onCompleted:{
                }
            },
            State {
                name: "SHOW"
                PropertyChanges { target: deviceSN; opacity: 1}
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

    ProgramSelf{
        width: 400
        height: 25
        anchors.top: deviceSN.bottom
        anchors.horizontalCenter: deviceSN.horizontalCenter
    }

}
