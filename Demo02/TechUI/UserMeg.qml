import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQml.Models 2.2

import "Inc.js" as Com
Item {
    id:root
    visible: false
    state: "HIDE"
    anchors.fill: parent
    property color borderColor: Com.borderColor
    property color shadowColor: Com.shadowColor
    Component.onCompleted: {
        root.state ="SHOW"
    }
    //过渡动画
    states: [
        State {
            name: "HIDE"
            PropertyChanges { target: root; scale: 0}
            onCompleted:{
                root.visible = false
            }
        },
        State {
            name: "SHOW"
            PropertyChanges { target: root; scale: 1}
            onCompleted: {
                root.visible = true
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
                    deviceSN.state ="SHOW"
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
    Item {
        id: userroot
        width: spacing.width
        height: 200
        anchors.centerIn: parent
        Image {
            id: spacing
            source: "qrc:/rc/img/spacing.png"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 20
            anchors.topMargin: 20
        }
        Text {
            id: username
            color: Com.deviceFontColor
            text: "前锋信息"
            font.pixelSize: 30
            font.family: Com.themify
            anchors.left: parent.left
            anchors.verticalCenter: spacing.verticalCenter
            anchors.verticalCenterOffset: 20
            anchors.leftMargin: 80
        }
        Text {
            id: deviceSN
            state: "HIDE"
            color: Com.deviceFontColor
            text: "\ue602 用户管理 "
            font.pixelSize: 40
            font.family: Com.themify
            anchors.verticalCenter: spacing.verticalCenter
            anchors.verticalCenterOffset: -20
            anchors.right: spacing.right
            anchors.rightMargin: 10
        }
        BootButton{
            id:changeuser
            width: 150
            height: 60
            anchors.left: spacing.left
            anchors.top:username.bottom
            anchors.margins: 5
            bottomRadius:10
            bottomText:"切换用户"
            onClick: {
                console.log("切换用户 clicked")
            }
        }
        BootButton{
            id:changekey
            width: 150
            height: 60
            anchors.left: changeuser.right
            anchors.top:username.bottom
            anchors.margins: 5
            bottomRadius:10
            bottomText:"修改密码"
            onClick: {
                console.log("修改密码 clicked")
            }
        }
        BootButton{
            id:deleteuser
            width: 150
            height: 60
            anchors.left: changekey.right
            anchors.top:username.bottom
            anchors.margins: 5
            bottomRadius:10
            bottomText:"权限管理"
            onClick: {
                console.log("权限管理 clicked")
            }
        }

    }
    BootButton{
        id:closeview
        width: 150
        height: 60
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 15
        bottomRadius:10
        bottomText:"返回主菜单"
        onClick: {
            console.log("返回主菜单 clicked")
            lineGrow.state = "HIDE"
            leftRightLine.state = "HIDE"
            root.state = "HIDE"
        }
    }
}
