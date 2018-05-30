import QtQuick 2.0
import QtGraphicalEffects 1.0
import "./Inc.js" as Com
Item {
    property alias bottomText: bottomText.text
    property alias bottomRadius: bottom.radius
    property var bottomBorderColor: Com.deviceFontColor
    id:root
    width: 100
    height: 30
    signal click();

    Rectangle{
         id: bottom
         width: parent.width
         height: parent.height-parent.height*0.1
         anchors.verticalCenter: parent.verticalCenter
         radius: height/4
         color: "black"
         border.color: bottomBorderColor
         focus: true
         Text {
             id:bottomText
             color: Com.bootButtonColor
             anchors.centerIn: parent
             font.family: Com.fontFamily
             font.pixelSize: 15;
             text: "下载"
         }

         MouseArea{
             id: btnMouseArea;
             anchors.fill: parent;
             hoverEnabled: true;
             onClicked:
             {
//                 console.log("buttom0 clicked")
                 click()
             }
             onEntered:
             {
                 root.focus = true
                 pressedAnim.start()
                 releasedAnim.stop()
             }
             onExited:
             {
                 root.focus = false
                 releasedAnim.start()
                 pressedAnim.stop()
             }
             PropertyAnimation {
                 id: pressedAnim;
                 target: bottom;
                 property: "color";
                 to: "#cdcdcd";
                 duration: Com.animationSpeed
             }
             PropertyAnimation {
                 id: releasedAnim;
                 target: bottom;
                 property: "color";
                 to: "#000000"
                 duration: Com.animationSpeed
             }
         }
    }
}
