import QtQuick 2.7
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import "Inc.js" as Com
//import an.qt.GetFileList 1.0
Item {
    visible: true
    anchors.fill: parent
    property bool readyQuit: false
    objectName: "rootWindow"
    property real rsetTempWar: 50       //设定的温度告警
    property real rsetUseWar: 75        //设定的使用率告警

    Image{
        state: "HIDE"
        property int cardnum: 0
        id:devicePic
        anchors.bottom: logBox.top
        anchors.right: parent.right
        anchors.rightMargin: 100
        width:  300
        height: 240
        //source: "qrc:/rc/img/vpx1.png"
        fillMode: Image.PreserveAspectFit
//        opacity: 0.8
        //visible: false
        onCardnumChanged:
        {
            if(cardnum <=6)
            devicePic.source = "qrc:/rc/img/vpx"+cardnum+".png"
        }
        //过渡动画
        states: [
            State {
                name: "HIDE"
                PropertyChanges { target: devicePic; cardnum: 1}
                onCompleted:{
                    devicePic.state ="SHOW"
                }
            },
            State {
                name: "SHOW"
                PropertyChanges { target: devicePic; cardnum: 7}
                onCompleted: {
                    devicePic.state ="HIDE"

                }
            }
        ]
        transitions: [
             Transition {
                 from: "SHOW"
                 to: "HIDE"
                 PropertyAnimation { properties: "cardnum"; duration: 6000; easing.type: Easing.Linear }
             },
             Transition {
                 from: "HIDE"
                 to: "SHOW"
                 PropertyAnimation { properties: "cardnum"; duration: 6000; easing.type: Easing.Linear }
             }
        ]
        Component.onCompleted: {devicePic.state  = "SHOW"}
    }
    LogBox{
        id:logBox
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width-80
        height: 0.2 * parent.height
    }
    Image {
        anchors.fill: parent
        anchors.top: parent.top
        id: backline
        source: "qrc:/rc/img/backline2.png"
//        z:-1
        Rectangle{
            id:backlineRec
            state: "HIDE"
            color: "black"
            width: 450
            height: parent.height
            anchors.horizontalCenter: parent.horizontalCenter
            //过渡动画
            states: [
                State {
                    name: "HIDE"
                    PropertyChanges { target: backlineRec; width: 450}
                    onCompleted:{
//                        backlineRec.state ="SHOW"
                        console.log("backlineRec1:"+backlineRec.state)
                    }
                },
                State {
                    name: "SHOW"
                    PropertyChanges { target: backlineRec; width: 0}
                    onCompleted: {
//                        backlineRec.state ="HIDE"
                        console.log("backlineRec2:"+backlineRec.state)
                    }
                }
            ]
            transitions: [
                 Transition {
                     from: "SHOW"
                     to: "HIDE"
                     PropertyAnimation { properties: "width"; duration: 1500; easing.type: Easing.Linear }
                 },
                 Transition {
                     from: "HIDE"
                     to: "SHOW"
                     PropertyAnimation { properties: "width"; duration: 3000; easing.type: Easing.Linear }
                 }
            ]
            Component.onCompleted: {}
        }
        Component.onCompleted: {
            console.log(parent.width)
            backlineRec.state  = "SHOW"

        }
    }
    Item{
        id:deviceInfo
        state:"HIDE"
        width: 500
        height: 400
        anchors.top:parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 30
//        Text {
//            id: deviceSN
//            color: Com.deviceFontColor
//            text: "QF67201"
//            font.pixelSize: 80
//            font.family: Com.deviceFont
//        }
        Text {
            id: deviceName
//            anchors.top:deviceSN.bottom
//            anchors.topMargin: 10
            color: "#c0c0c0"
            text: "VPX大容量高速存储阵列"
            font.pixelSize: 40
            font.family: Com.deviceFont
            anchors.top: parent.top
            anchors.topMargin: 30
        }
        Text {
            id: deviceSN2
            anchors.top:deviceName.bottom
            anchors.topMargin: 20
            color: Com.deviceFontColor
            text: "QF67201"
            font.pixelSize: 80
            font.family: Com.deviceFont
        }

        //过渡动画
        states: [
            State {
                name: "HIDE"
                PropertyChanges { target: deviceInfo; opacity: 0}
                onCompleted:{
                }
            },
            State {
                name: "SHOW"
                PropertyChanges { target: deviceInfo; opacity: 1}
                onCompleted: {
                }
            }
        ]

        transitions: [
             Transition {
                 from: "SHOW"
                 to: "HIDE"
                 PropertyAnimation { properties: "opacity"; duration: 1500; easing.type: Easing.Linear }
             },
             Transition {
                 from: "HIDE"
                 to: "SHOW"
                 PropertyAnimation { properties: "opacity"; duration: 1500; easing.type: Easing.Linear }
             }
        ]
        Component.onCompleted: {
            deviceInfo.state  = "SHOW"
        }
    }


    CirclePower{
        id:centerPower
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 50
        width: parent.width * 0.4
        height: width
    }


    ChannelState{
        id:moudleState1
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.right: parent.right
        anchors.rightMargin: 30
        width: 400
        height: 100
        ssdUsedPercent: 0.81
        temp: 86
        setTempWar: rsetTempWar
        chNameText:"CH1"
        onClick: {
//            idChileCard.visible = true
//            idChileCard.state ="SHOW"
//            idChileCard.cardName="CARD-[1]"
            rootBorder.chooseCardIndex = 1
            leftMenu.currentIndex =1
        }
    }

    ChannelState{
        id:moudleState2
        anchors.top: moudleState1.bottom
        anchors.topMargin: 45
        anchors.right: parent.right
        anchors.rightMargin: 30
        width: 400
        height: 100
        ssdUsedPercent: 0.32
        temp: 42
        setTempWar: rsetTempWar
        chNameText:"CH2"
        onClick: {
//            idChileCard.visible = true
//            idChileCard.state ="SHOW"
//            idChileCard.cardName="CARD-[2]"
            rootBorder.chooseCardIndex = 2
            leftMenu.currentIndex =1
        }
    }

    ChannelState{
        id:moudleState3
        anchors.top: moudleState2.bottom
        anchors.topMargin: 40
        anchors.right: parent.right
        anchors.rightMargin: 30
        width: 400
        height: 100
        ssdUsedPercent: 0.59
        temp: 52
        setTempWar: rsetTempWar
        chNameText:"CH3"
        onClick: {
//            idChileCard.visible = true
//            idChileCard.state ="SHOW"
//            idChileCard.cardName="CARD-[3]"
            rootBorder.chooseCardIndex = 3
            leftMenu.currentIndex =1
        }
    }

    ChannelStateLeft{
        id:moudleState4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 200
        anchors.left: parent.left
        anchors.leftMargin: 30
        width: 400
        height: 100
        ssdUsedPercent: 0.21
        temp: 57
        setTempWar: rsetTempWar
        chNameText:"CH6"
        onClick: {
//            idChileCard.visible = true
//            idChileCard.state ="SHOW"
//            idChileCard.cardName="CARD-[6]"
            rootBorder.chooseCardIndex = 6
            leftMenu.currentIndex =1
        }
    }

    ChannelStateLeft{
        id:moudleState5
        anchors.bottom: moudleState4.top
        anchors.bottomMargin: 35
        anchors.left: parent.left
        anchors.leftMargin:30
        width: 400
        height: 100
        ssdUsedPercent: 0.92
        temp: 86
        setTempWar: rsetTempWar
        chNameText:"CH5"
        onClick: {
//            idChileCard.visible = true
//            idChileCard.state ="SHOW"
//            idChileCard.cardName="CARD-[5]"
            rootBorder.chooseCardIndex = 5
            leftMenu.currentIndex =1
        }
    }

    ChannelStateLeft{
        id:moudleState6
        anchors.bottom: moudleState5.top
        anchors.bottomMargin: 40
        anchors.left: parent.left
        anchors.leftMargin: 30
        width: 400
        height: 100
        ssdUsedPercent: 0.39
        temp: 47
        setTempWar: rsetTempWar
        chNameText:"CH4"
        onClick: {
//            idChileCard.visible = true
//            idChileCard.state ="SHOW"
//            idChileCard.cardName="CARD-[4]"
            rootBorder.chooseCardIndex = 4
            leftMenu.currentIndex =1
        }
    }
/*
    ProgressA{
        id:progress
        anchors.top: menuPanel.bottom
        anchors.left: parent.left
        anchors.leftMargin: 20
        width: 40
        height: 200
    }

    ProgressX{
        id:progressx
        anchors.top: progress.bottom
        anchors.left: parent.left
        anchors.leftMargin: 20
        width: 200
        height: 40
    }

    ContentL{
        id:cotent
        anchors.top: progress.bottom
        anchors.left: parent.left
        anchors.leftMargin: 20
        width: 200
        height: 100
        bgColor: "black"

    }
*/
//    //屏蔽层
//    Rectangle{
//        id: mask
//        anchors.top: windTitle.bottom
//        anchors.left: parent.left
//        anchors.right: parent.right
//        anchors.bottom: parent.bottom
//        color: "black"
//        opacity: 0.6

//        MouseArea{
//            anchors.fill: parent
//            hoverEnabled: true
//            preventStealing: true
//        }
//    }

//	ChildCardMeg{
//        id:idChileCard
//        state: "HIDE"
//        anchors.left: parent.left
//        anchors.top: parent.top
//        anchors.topMargin: 33
//        cardName:"CARD-ONE"
//    }
//    UserMeg{
//        id:idUserMeg
//        state: "HIDE"
//        anchors.left: parent.left
//        anchors.top: parent.top
//        anchors.topMargin: 33
//    }
}
