import QtQuick 2.7
import QtGraphicalEffects 1.0

import "Inc.js" as Com

Item {
    id:root
    state: "HIDE"
    clip: true
    property color bgColor: "black"
    property color borderColor: Com.borderColor
    property color shadowColor: Com.shadowColor
    property color textColor: Com.channalTextColor
    property int   iw: 14
    property real   ssdUsedPercent: 0.65
    property string ssdStateText: "存储使用率:"+parseInt(ssdUsedPercent*100)+"%"

    property real   temp: 62
    property string tempStateText: "设备温度:"+temp+"℃"
    property real setTempWar: 40
    property alias chNameText: chName.text

    signal click();
    ContentP4{
        id:chName
        anchors.top: parent.top
        anchors.left: parent.left
        height: parent.height
        width: height
        text: "CH1"
        offset: 0
        fontFamily: Com.deviceFont
        fontSize: 20
        cornerWidth: 2
        borderColor:root.borderColor
        shadowColor:root.shadowColor
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                click()
            }
            onEntered:
            {
                root.borderColor = Com.channalBorderEnterColor
                root.shadowColor = Com.channalShadowEnterColor
//                chName.borderColor ="#A0F95F46"
//                chName.shadowColor = "#F95F46"
                chName.borderLine.requestPaint()
                chName.bgline.requestPaint()
                pressedAnim.start()
            }
            onExited:
            {
                root.borderColor = Com.channalBorderExitColor
                root.shadowColor = Com.channalShadowExitColor
//                chName.borderColor ="#A00AFFFC"
//                chName.shadowColor = "#0AFFFC"
                chName.borderLine.requestPaint()
                chName.bgline.requestPaint()
                releasedAnim.start()
            }
            PropertyAnimation {
                id: pressedAnim;
                target: lineGrow;
                property: "opacity";
                to: 0.4;
                duration: 300
            }
            PropertyAnimation {
                id: releasedAnim;
                target: lineGrow;
                property: "opacity";
                to: 0.8
                duration: 300
            }
            PropertyAnimation {
                id: clickAnim;
                target: lineGrow;
                property: "opacity";
                to: 1
                duration: 200
                onStopped: {
                    pressedAnim.start()
                }
            }
Component.onCompleted: {

    //chName.text.y
}
        }

    }

    CircleA {
        id:ssdState
        anchors.top: parent.top
        anchors.left: chName.right
        anchors.leftMargin: 4
        height: parent.height
        width: height
        percent: root.ssdUsedPercent
    }
    ProgressX {
        id:tempState
        anchors.top:parent.top
        anchors.left: ssdState.right
        anchors.right: parent.right
        //width: parent.width - 2*parent.height
        height: parent.height * 0.4
        cubeNumber: 20
        percent: root.temp/100
//        Component.onCompleted:
//        {
//            if(percent > 0.8)
//            {
//                tempState.shadowColor ="#F95F46"
//                tempState.cubeColor = "#772928"
//            }
//        }
        onPercentChanged: {
            if(percent >= root.setTempWar/100)
            {
                tempState.shadowColor = Com.channalValueWarShaColor
                tempState.cubeColor   = Com.channalValueWarShaColor
            }
            else
            {
                tempState.shadowColor = Com.channalValueNorShaColor
                tempState.cubeColor   = Com.channalValueNorCubColor
            }
        }
    }
    Canvas{
        id:topLine
        anchors.fill: parent
        onPaint: {
            var ctx = getContext('2d')
            //ctx.save();
            ctx.clearRect(0, 0, topLine.width, topLine.height);

            ctx.beginPath();
            ctx.lineWidth = 1.5
            //ctx.lineJoin = "round"
            ctx.lineCap = "round"
            ctx.strokeStyle = borderColor;
            ctx.moveTo(tempState.x+6, tempState.y + 0.5*tempState.height)
            ctx.lineTo(tempState.x, tempState.y + 0.7*tempState.height)
            ctx.lineTo(tempState.x, tempState.y + 1.0*tempState.height)
            ctx.lineTo(tempState.x+6, tempState.y + 1.2*tempState.height)
            ctx.stroke()

            ctx.moveTo(ssdState.x + 0.5*ssdState.width +8, ssdState.y + 0.5*ssdState.height + 8)
            ctx.lineTo(tempState.x, ssdState.height - ssdState.iw)
            ctx.lineTo(tempState.x+tempState.width-iw, ssdState.height - ssdState.iw)
            ctx.stroke()
        }
    }
    Glow {
        id:lineGrow
        source: topLine
        anchors.fill: topLine
        cached: true
        fast: true
        radius: 10
        samples: 14
        color: shadowColor
        spread: 0.6
        opacity: 0.8
    }

    Text {
        id: tempText
        anchors.top: tempState.bottom
        //anchors.horizontalCenter: tempState.horizontalCenter
        anchors.left: tempState.left
        anchors.leftMargin: tempState.iw
        color: textColor
        text: root.tempStateText
        font.pixelSize: 14
        font.family: Com.mainFont
    }

    Text {
        id: ssdText
        anchors.bottom: ssdState.bottom
        anchors.bottomMargin: ssdState.iw + 2
        //anchors.horizontalCenter: tempState.horizontalCenter
        anchors.left: tempState.left
        anchors.leftMargin: tempState.iw
        color: textColor
        text: root.ssdStateText
        font.pixelSize: 14
        font.family: Com.mainFont
    }

    //过渡动画
    states: [
        State {
            name: "HIDE"
            PropertyChanges { target: root; opacity: 0}
            onCompleted:{

            }
        },
        State {
            name: "SHOW"
            PropertyChanges { target: root; opacity: 1}
            onCompleted: {

            }
        }
    ]

    transitions: [
         Transition {
             from: "SHOW"
             to: "HIDE"
             PropertyAnimation { properties: "opacity"; duration: 1500; easing.type: Easing.InElastic }
         },
         Transition {
             from: "HIDE"
             to: "SHOW"
             PropertyAnimation { properties: "opacity"; duration: 1500; easing.type: Easing.InBounce }
         }
    ]

    onStateChanged:
    {
        chName.state = state
        ssdState.state = state
        tempState.state = state
    }
    Component.onCompleted:
    {
        root.state = "SHOW"
    }

}

