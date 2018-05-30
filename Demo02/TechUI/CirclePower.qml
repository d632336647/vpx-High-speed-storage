import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Particles 2.0
import "Inc.js" as Com
Item {
    id:root
    state: "HIDE"
    clip: true
    property color bgColor: "black"
    property color borderColor: Com.borderColor
    property color shadowColor: Com.shadowColor
    property int   iw: 18
    property int   circleWidth: 8
    property real  percent: 0.65

//    Text {
//        id: showPercent
//        font.family: "幼圆"
//        text: "VPX"
//        anchors.centerIn: parent
//        verticalAlignment: Text.AlignVCenter
//        horizontalAlignment: Text.AlignHCenter
//        color: Com.deviceFontColor
//        font.pixelSize:  parent.width * 0.1
//        visible: true
//    }

    Item{
        id:pannel
        anchors.fill: parent
        //粒子部分
        ParticleSystem{
            id:particles
        }
        ImageParticle{
            id:sss
            system: particles
            source:"qrc:/rc/img/xx.png"
              color: "#0affff"
            colorVariation: 0
            rotationVariation: 55            //角度误差
            rotationVelocityVariation: 15   //旋转速度误差
//            entryEffect:ImageParticle.Scale   //出生死亡效果
            opacity: 0.1
        }
        Emitter{
            id:emitter
            anchors.right: cir1.right
            anchors.rightMargin: 2
            anchors.verticalCenter: cir1.verticalCenter
            anchors.centerIn: parent
            width: 400
            height: 400

            system: particles
            emitRate: 4       //发射量
            maximumEmitted:10
            lifeSpan: 4000
            lifeSpanVariation: 100
            size: 25
            sizeVariation: 100
            endSize: 40
//            //速度
//            velocity: AngleDirection {
//                angle: 90            //角度
//                angleVariation: 360
//                magnitude: 80      //速度
//                //magnitudeVariation: 10
//            }
//            acceleration:AngleDirection {
//                angle: 90            //角度
//                angleVariation: 360
//                magnitude:10      //速度
//                //magnitudeVariation: 10
//            }
        }
        //粒子部分 end
        Image {
            id: cir1
            state:"HIDE"
            width: 411
            height: 411
            anchors.centerIn: parent
            source: "qrc:/rc/img/yuan/cir1.png"

            //过渡动画
            states: [
                State {
                    name: "HIDE"
                    PropertyChanges { target: cir1; rotation: 180}
                    onCompleted:{
                       // cir1.state ="SHOW"
//                       backlineRec.state  = "SHOW"
                    }
                },
                State {
                    name: "SHOW"
                    PropertyChanges { target: cir1; rotation: 0}
                    onCompleted: {
                        cir1.state ="HIDE"
                    }
                }
            ]

            transitions: [
                 Transition {
                     from: "SHOW"
                     to: "HIDE"
                     PropertyAnimation { properties: "rotation"; duration: 2000; easing.type: Easing.Linear }
                 },
                 Transition {
                     from: "HIDE"
                     to: "SHOW"
                     PropertyAnimation { properties: "rotation"; duration: 1000; easing.type: Easing.Linear }
                 }
            ]
            //Component.onCompleted: {cir1.state="SHOW"}
        }
        Image {
            id: cir2
            state:"HIDE"
            width: 411
            height: 411
            anchors.centerIn: parent
            source: "qrc:/rc/img/yuan/cir2.png"
            //过渡动画
            states: [
                State {
                    name: "HIDE"
                    PropertyChanges { target: cir2; rotation: 60}
                    onCompleted:{
                        //cir2.state ="SHOW"
                    }
                },
                State {
                    name: "SHOW"
                    PropertyChanges { target: cir2; rotation: 270}
                    onCompleted: {
                        cir2.state ="HIDE"
                    }
                }
            ]

            transitions: [
                 Transition {
                     from: "SHOW"
                     to: "HIDE"
                     PropertyAnimation { properties: "rotation"; duration: 2000; easing.type: Easing.Linear }
                 },
                 Transition {
                     from: "HIDE"
                     to: "SHOW"
                     PropertyAnimation { properties: "rotation"; duration: 1000; easing.type: Easing.Linear }
                 }
            ]
            //Component.onCompleted: {cir2.state="SHOW"}
        }
        Image {
            id: cir3
            state:"HIDE"
            width: 411
            height: 411
            anchors.centerIn: parent
            source: "qrc:/rc/img/yuan/cir33.png"
            //过渡动画
            states: [
                State {
                    name: "HIDE"
                    PropertyChanges { target: cir3; rotation: 180}
                    onCompleted:{
                       // cir3.state ="SHOW"
                    }
                },
                State {
                    name: "SHOW"
                    PropertyChanges { target: cir3; rotation: 360}
                    onCompleted: {
                        cir3.state ="HIDE"
                    }
                }
            ]

            transitions: [
                 Transition {
                     from: "SHOW"
                     to: "HIDE"
                     PropertyAnimation { properties: "rotation"; duration: 1000; easing.type: Easing.Linear }
                 },
                 Transition {
                     from: "HIDE"
                     to: "SHOW"
                     PropertyAnimation { properties: "rotation"; duration: 2000; easing.type: Easing.Linear }
                 }
            ]
            //Component.onCompleted: {cir3.state="SHOW"}
        }
        Image {
            id: cir4
            state:"HIDE"
            width: 411
            height: 411
            anchors.centerIn: parent
            source: "qrc:/rc/img/yuan/cir44.png"
            //过渡动画
            states: [
                State {
                    name: "HIDE"
                    PropertyChanges { target: cir4; rotation: 360}
                    onCompleted:{
                       // cir4.state ="SHOW"
                    }
                },
                State {
                    name: "SHOW"
                    PropertyChanges { target: cir4; rotation: 180}
                    onCompleted: {
                        cir4.state ="HIDE"
                    }
                }
            ]

            transitions: [
                 Transition {
                     from: "SHOW"
                     to: "HIDE"
                     PropertyAnimation { properties: "rotation"; duration: 1500; easing.type: Easing.Linear }
                 },
                 Transition {
                     from: "HIDE"
                     to: "SHOW"
                     PropertyAnimation { properties: "rotation"; duration: 1500; easing.type: Easing.Linear }
                 }
            ]
            //Component.onCompleted: {cir4.state="SHOW"}
        }
        Image {
            id: cir5
            state:"HIDE"
            width: 411
            height: 411
            anchors.centerIn: parent
            source: "qrc:/rc/img/yuan/cir5.png"
            //过渡动画
            states: [
                State {
                    name: "HIDE"
                    PropertyChanges { target: cir5; rotation: 0}
                    onCompleted:{
                       // cir5.state ="SHOW"
                    }
                },
                State {
                    name: "SHOW"
                    PropertyChanges { target: cir5; rotation: 270}
                    onCompleted: {
                        cir5.state ="HIDE"
                    }
                }
            ]

            transitions: [
                 Transition {
                     from: "SHOW"
                     to: "HIDE"
                     PropertyAnimation { properties: "rotation"; duration: 1500; easing.type: Easing.Linear }
                 },
                 Transition {
                     from: "HIDE"
                     to: "SHOW"
                     PropertyAnimation { properties: "rotation"; duration: 1500; easing.type: Easing.Linear }
                 }
            ]
            //Component.onCompleted: {cir5.state="SHOW"}
        }

        Image {
            id: in1
            state:"HIDE"
            width: 411
            height: 411
            anchors.centerIn: parent
            source: "qrc:/rc/img/yuan/in1.png"
            Text {
                font.family: "幼圆"
                text: "电源"
                anchors.centerIn: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: -40
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -40
//                color: Com.deviceFontColor
                color:"black"
                font.pixelSize:  parent.width * 0.05
            }
            //过渡动画
            states: [
                State {
                    name: "HIDE"
                    PropertyChanges { target: in1; rotation: 0}
                    onCompleted:{
                       // in1.state ="SHOW"
                    }
                },
                State {
                    name: "SHOW"
                    PropertyChanges { target: in1; rotation: 360}
                    onCompleted: {
                        in1.state ="HIDE"
                    }
                }
            ]

            transitions: [
                 Transition {
                     from: "SHOW"
                     to: "HIDE"
                     PropertyAnimation { properties: "rotation"; duration: 1500; easing.type: Easing.Linear }
                 },
                 Transition {
                     from: "HIDE"
                     to: "SHOW"
                     PropertyAnimation { properties: "rotation"; duration: 1500; easing.type: Easing.Linear }
                 }
            ]
            //Component.onCompleted: {in1.state="SHOW"}
        }
        Image {
            id: in2
            state:"HIDE"
            width: 411
            height: 411
            anchors.centerIn: parent
            source: "qrc:/rc/img/yuan/in2.png"
            Text {
                font.family: "幼圆"
                text: "电压"
                //anchors.centerIn: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 40
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -40
//                color: Com.deviceFontColor
                color:"black"
                font.pixelSize:  parent.width * 0.05
            }
            //过渡动画
            states: [
                State {
                    name: "HIDE"
                    PropertyChanges { target: in2; rotation: 0}
                    onCompleted:{
                       // in2.state ="SHOW"
                    }
                },
                State {
                    name: "SHOW"
                    PropertyChanges { target: in2; rotation: 270}
                    onCompleted: {
                        in2.state ="HIDE"
                    }
                }
            ]

            transitions: [
                 Transition {
                     from: "SHOW"
                     to: "HIDE"
                     PropertyAnimation { properties: "rotation"; duration: 1500; easing.type: Easing.Linear }
                 },
                 Transition {
                     from: "HIDE"
                     to: "SHOW"
                     PropertyAnimation { properties: "rotation"; duration: 1500; easing.type: Easing.Linear }
                 }
            ]
            //Component.onCompleted: {in2.state="SHOW"}
        }
        Image {
            id: in3
            state:"HIDE"
            width: 411
            height: 411
            anchors.centerIn: parent
            source: "qrc:/rc/img/yuan/in3.png"
            Text {
                font.family: "幼圆"
                text: "网络"
                anchors.centerIn: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 40
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: 40
//                color: Com.deviceFontColor
                color:"black"
                font.pixelSize:  parent.width * 0.05
            }
            //过渡动画
            states: [
                State {
                    name: "HIDE"
                    PropertyChanges { target: in3; rotation: 0}
                    onCompleted:{
                       // in3.state ="SHOW"
                    }
                },
                State {
                    name: "SHOW"
                    PropertyChanges { target: in3; rotation: 180}
                    onCompleted: {
                        in3.state ="HIDE"
                    }
                }
            ]

            transitions: [
                 Transition {
                     from: "SHOW"
                     to: "HIDE"
                     PropertyAnimation { properties: "rotation"; duration: 1500; easing.type: Easing.Linear }
                 },
                 Transition {
                     from: "HIDE"
                     to: "SHOW"
                     PropertyAnimation { properties: "rotation"; duration: 1500; easing.type: Easing.Linear }
                 }
            ]
            //Component.onCompleted: {in3.state="SHOW"}
        }
        Image {
            id: in4
            state:"HIDE"
            width: 411
            height: 411
            anchors.centerIn: parent
            source: "qrc:/rc/img/yuan/in4.png"
            Text {
                font.family: "幼圆"
                text: "交换"
                anchors.centerIn: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: -40
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: 40
//                color: Com.deviceFontColor
                color:"black"
                font.pixelSize:  parent.width * 0.05
            }
            //过渡动画
            states: [
                State {
                    name: "HIDE"
                    PropertyChanges { target: in4; rotation: 0}
                    onCompleted:{
                       // in4.state ="SHOW"
                    }
                },
                State {
                    name: "SHOW"
                    PropertyChanges { target: in4; rotation: 90}
                    onCompleted: {
                        in4.state ="HIDE"
                    }
                }
            ]

            transitions: [
                 Transition {
                     from: "SHOW"
                     to: "HIDE"
                     PropertyAnimation { properties: "rotation"; duration: 1500; easing.type: Easing.Linear }
                 },
                 Transition {
                     from: "HIDE"
                     to: "SHOW"
                     PropertyAnimation { properties: "rotation"; duration: 1500; easing.type: Easing.Linear }
                 }
            ]
            //Component.onCompleted: {in4.state="SHOW"}
        }
    }

    //过渡动画
    states: [
        State {
            name: "HIDE"
            //PropertyChanges { target: cricleMask; d: 0}
            PropertyChanges { target: root; opacity: 0}
            onCompleted:{
                //root.visible = false
            }
        },
        State {
            name: "SHOW"
            //PropertyChanges { target: cricleMask; d: (2*Math.PI) * percent}
            PropertyChanges { target: root; opacity: 1}
            onCompleted: {

            }
        }
    ]

    transitions: [
         Transition {
             from: "SHOW"
             to: "HIDE"
             PropertyAnimation { properties: "d,opacity"; duration: 1500; easing.type: Easing.OutCubic }
         },
         Transition {
             from: "HIDE"
             to: "SHOW"
             PropertyAnimation { properties: "d,opacity"; duration: 1500; easing.type: Easing.OutCubic }
         }
    ]

    onStateChanged:
    {
        //pannel.state = state
            cir1.state ="SHOW"
            cir2.state ="SHOW"
            cir3.state ="SHOW"
            cir4.state ="SHOW"
            cir5.state ="SHOW"
            in1.state="SHOW"
            in2.state="SHOW"
            in3.state="SHOW"
            in4.state="SHOW"
    }


    Component.onCompleted:
    {
        root.state = "SHOW"
    }

}
