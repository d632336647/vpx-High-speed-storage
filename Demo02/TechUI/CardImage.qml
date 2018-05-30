import QtQuick 2.0
import "Inc.js" as Com
Item {
    width: image.width
    height: image.height

    property bool lightstate1: true
    property bool lightstate2: true
    property var colorOn: Com.bootTextColor
    property var colorOff: "#00000000"
    property alias imagew: image.width
    signal clicked()
    //property bool showstate: true
    //visible: showstate
//    Rectangle
//    {
//    anchors.fill: parent
//    color: "black"
//    z:1
//    }
    Image {
        id:image
        source: "qrc:/rc/img/card152rr.png"
        width: 152
        height: 76

        Rectangle{
            id:rect1
            radius: 3*2
            width:14*2
            height:8*2
            x:47*2
            y:16*2-1
            color: lightstate1 == true ? colorOn:colorOff
            border.color: lightstate1 == true ? colorOn:colorOff
//            z:0
        }
        BreathGlow{
            id:rect1glow
            rsource: rect1
            color: lightstate1 == true ? colorOn:colorOff
        }

        Rectangle{
            id:rect2
            radius: 3*2
            width:14*2
            height:8*2
            x:32*2
            y:16*2-1
            color:lightstate2 == true ? colorOn:colorOff
            border.color: lightstate2 == true ? colorOn:colorOff
//            z:1
        }
        BreathGlow{
            id:rect2glow
            rsource: rect2
            color: lightstate2 == true ? colorOn:colorOff
        }
    }

}
