import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import "UIFrame/TechDark/"
import "TechUI/"

import "UIFrame/TechDark/Styles.js" as FlatDark
import "Skin.js" as Skin

Item{
    id: rootBorder
    width: 1440+20
    height: 900+20
    property var chooseCardIndex : 1

    Rectangle{
        id:rootShadow
        anchors.centerIn: parent
        width: parent.width - 20
        height: parent.height - 20
        color: FlatDark.MainBgColor
        border.color: FlatDark.WindowShadowColor
        z:1
    }
    Glow {
        id:windShadow
        source: rootShadow
        anchors.fill: rootShadow
        cached: true
        fast: true
        radius: 13
        samples: 25
        color: "black"
        spread: 0
    }

    Rectangle{
        clip:true
         id:root
         anchors.centerIn: parent
         width: rootShadow.width - 2
         height: rootShadow.height - 2
         color: FlatDark.MainBgColor
         z:2
         WindTitle{
             id:windTitle
             anchors.top: parent.top
             height: 32
             btnWidth: 32
             btnHeight: 32
             btnIconSize: 16
             onWindowMoved: {
                 rootWindow.setX(rootWindow.x+offset.x) //rootWindow main.cpp导入的view对象
                 rootWindow.setY(rootWindow.y+offset.y)
             }
             onClosed:{
                 Qt.quit()
             }
             onNormal: {
                 rootWindow.showNormal()
                 root.width = rootShadow.width - 2
                 root.height = rootShadow.height - 2
                 windShadow.visible = true
             }
             onMaximized: {
                 windShadow.visible = false
                 rootWindow.showMaximized()
                 root.width = rootBorder.width
                 root.height = rootBorder.height
             }
             onMinimized: {
                 rootWindow.showMinimized()
             }
         }
         Rectangle{
             id:topLine
             anchors.top: windTitle.bottom
             color: FlatDark.MainBgColor
             width: parent.width
             height: 1
         }

         LeftMenu{
             id:leftMenu
             x:0
             y:windTitle.height+topLine.height
             z:1
             height: parent.height-y
             width: 180
             state: "SHOW"
             onCurrentIndexChanged: {
                windowLoader.state = "HIDE"
                setMenuSelect(currentIndex)
                 switch(currentIndex)
                 {
                 case 0:
                     windowLoader.source = "TechUI/main.qml"
                     break;
                 case 1:
                     windowLoader.source = "TechUI/ChildCardMeg.qml"
                     break;
                 case 2:
//                     windowLoader.source = "PageSignalAnalyse.qml"
                     windowLoader.source = "TechUI/UserMeg.qml"
                     break;
                 case 3:
                     windowLoader.source = "TechUI/SystemMeg.qml"
                     break;
                 default:
                     windowLoader.source = "PageSysOverview.qml"
                     break;
                 }
                 windowLoader.state = "SHOW"
             }
         }//end leftMenu


         //动态加载
         Item {
             id:rightWindow
             anchors.top: topLine.bottom
             anchors.left: leftMenu.right
             anchors.right: parent.right
             anchors.bottom: stateWindow.top

             Loader {
                 state: "HIDE"
                 id: windowLoader
//                 anchors.fill: parent
                 width: parent.width
                 height: parent.height
                 x:0
                 onLoaded: {
                     focus = true
                 }
                 //过渡动画
                 states: [
                     State {
                         name: "HIDE"
                         PropertyChanges { target: windowLoader; x: -parent.width}
                         onCompleted:{
                         }
                     },
                     State {
                         name: "SHOW"
                         PropertyChanges { target: windowLoader; x: 0}
                         onCompleted: {
                         }
                     }
                 ]

                 transitions: [
//                      Transition {
//                          from: "SHOW"
//                          to: "HIDE"
//                          PropertyAnimation { properties: "x"; duration: 1; easing.type: Easing.OutCubic }
//                      },
                      Transition {
//                          from: "HIDE"
                          to: "SHOW"
                          PropertyAnimation { properties: "x"; duration: 1500; easing.type: Easing.OutCubic }
                      }
                 ]
                 Component.onCompleted: {
                    windowLoader.state = "SHOW"
                 }
             }
         }
         Rectangle{
             id:stateWindow
             anchors.bottom: parent.bottom
             anchors.left: leftMenu.right
             anchors.right: parent.right
             height: 32
             color: FlatDark.SecondBgColor
             Rectangle{
                 anchors.left: parent.left;
                 anchors.top: parent.top
                 width: 1
                 height: parent.height
                 color: FlatDark.MainBgColor
             }
         }

         Component.onCompleted: {
             windowLoader.source = "TechUI/main.qml"
             windowLoader.state = "SHOW"
         }

    }///end root
}
