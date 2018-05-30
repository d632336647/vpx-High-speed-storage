import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Particles 2.0
import "Inc.js" as Com
Item{
    id:root
    width: 600
    height: 20
    property color backgroundstart: Com.backgroundstart
    property color backgroundend  : Com.backgroundend
    property color progressstart  : Com.progressstart
    property color progressend    : Com.progressend
    ProgressBar {
        anchors.fill: parent
      property var value1: value
      id:prog
      value: 0.5
      style:ProgressBarStyle{
        background:Rectangle{
            id:outbackground
            color: Com.backgroundstart
            radius: root.height/4
            clip: true
            //渐变部分
            LinearGradient{
                width: parent.width
                height: parent.height
                start: Qt.point(0,0)
                end: Qt.point(parent.width,0)
                source:outbackground
                gradient: Gradient{
                    GradientStop{position: 0.0;color: backgroundstart}
                    GradientStop{position: 1.0;color: backgroundend}
                }
            }
        }
        progress: Rectangle{
            id:inprogress
            color: progressstart
            radius: root.height/4
            clip: true
            //渐变部分
            LinearGradient{
                width: parent.width
                height: parent.height
                start: Qt.point(0,0)
                end: Qt.point(parent.width,0)
                source:inprogress
                gradient: Gradient{
                    GradientStop{position: 0.0;color: progressstart}
                    GradientStop{position: 1.0;color: progressend}
                }
            }
            //粒子部分
            ParticleSystem{
                id:particles
            }
            ImageParticle{
                system: particles
                source:"qrc:/rc/img/xx.png"
              color: 'yellow'
                colorVariation: 0.1
                rotationVariation: 5            //角度误差
                rotationVelocityVariation: 15   //旋转速度误差
                //entryEffect: ImageParticle.Scale
            }
            Emitter{
                id:emitter
                anchors.right: inprogress.right
                anchors.rightMargin: 2
                anchors.verticalCenter: inprogress.verticalCenter
                width: 1
                height: root.height/2
                system: particles
                emitRate: 10       //发射量
                maximumEmitted:60
                lifeSpan: 2000
                lifeSpanVariation: 10
                size: 5
                endSize: 2
                //速度
                velocity: AngleDirection {
                    angle: 180            //角度
                    //angleVariation: 360
                    magnitude: 20      //速度
                    //magnitudeVariation: 10
                }
            }
        }

      }

      NumberAnimation {
              id:valueChange
              target: prog
              to:prog.value1
              property: "value"
              duration: 300
              easing.type: Easing.Linear
          }
    }
    MouseArea{
    anchors.fill: prog
    onClicked: {
        prog.value1 +=0.1
        if(prog.value1 > 1)
        {
            prog.value1 =0
        }
        valueChange.start()
    }
    }
}

