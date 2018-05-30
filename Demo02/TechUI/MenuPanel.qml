import QtQuick 2.7
import QtGraphicalEffects 1.0
import "./Inc.js"as Com
Item {
    id:root
    state: "HIDE"
    clip: true
    property color bgColor: "black"
    property color borderColor: Com.borderColor
    property color shadowColor: Com.shadowColor
    property int   iw: 14

    ContentA {
        id:menuBox1
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -0.35*height
        anchors.left: parent.left
        width: parent.width * 0.4
        height: parent.height * 0.5
        text: "用户管理"
        onClicked: {
            console.log("用户管理 0")
            idUserMeg.state ="SHOW"

        }
    }
    ContentA {
        id:menuBox2
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 0.35*height
        anchors.left: parent.left
        width: parent.width * 0.4
        height: parent.height * 0.5
        r2l:false
        rotation: 180
        text: "子卡管理"
        onClicked: {
            idChileCard.visible = true
            idChileCard.state ="SHOW"

        }
    }

    ContentA {
        id:menuBox3
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -0.35*height
        anchors.right: parent.right
        width: parent.width * 0.4
        height: parent.height * 0.5
        r2l:false
        text: "系统管理"
    }
    ContentA {
        id:menuBox4
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 0.35*height
        anchors.right: parent.right
        width: parent.width * 0.4
        height: parent.height * 0.5
        rotation: 180
        text: "退出系统"
        //property bool readyQuit: Com.readyQuit
        onClicked: {
            readyQuit = true
            console.log("readyQuit00:::"+readyQuit)
            var cs = "SHOW"
            if(menuPanel.state === "SHOW")
            cs = "HIDE"
            menuPanel.state = cs
            moudleState1.state = cs
            moudleState2.state = cs
            moudleState3.state = cs
            moudleState4.state = cs
            moudleState5.state = cs
            moudleState6.state = cs
            backlineRec.state  = cs
            logBox.state = cs
            centerPower.state = cs
            deviceInfo.state  = cs
        }
    }

    ContentB {
        id:menuBox5
        anchors.top: menuBox1.top
        anchors.bottom: menuBox2.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width*0.3
        text: "总览"
        onClicked:
        {
            var cs = "SHOW"
            if(menuPanel.state === "SHOW")
                cs = "HIDE"

            menuPanel.state = cs
            moudleState1.state = cs
            moudleState2.state = cs
            moudleState3.state = cs
            moudleState4.state = cs
            moudleState5.state = cs
            moudleState6.state = cs
            backlineRec.state  = cs
            logBox.state = cs
            centerPower.state = cs
            deviceInfo.state  = cs
        }
    }


/*

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
             PropertyAnimation { properties: "x"; duration: 1500; easing.type: Easing.OutCubic }
         },
         Transition {
             from: "HIDE"
             to: "SHOW"
             PropertyAnimation { properties: "x"; duration: 1500; easing.type: Easing.OutCubic }
         }
    ]
*/
    onStateChanged:
    {
        menuBox1.state = state
        menuBox2.state = state
        menuBox3.state = state
        menuBox4.state = state
        menuBox5.state = state
    }
    Component.onCompleted:
    {
        root.state = "SHOW"
    }

}
