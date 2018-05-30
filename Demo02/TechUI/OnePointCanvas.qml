import QtQuick 2.0
import "Inc.js" as Com

Item{
    id:root
   //anchors.fill: parent
    property alias pointCanvas: pointCanvas
    property bool  showstate :true
    property real  pointx: pointradius
    property real  pointy: pointradius
    property real  pointradius: 1
    property int   pointangleSta: 0
    property int   pointangleEnd: 0
    property var   pointcolor: "#33a8af"
   width: pointradius*2
   height: pointradius*2

    Canvas{
        id:pointCanvas
        width: parent.width
        height: parent.height
        enabled: showstate
        visible: showstate
        onPaint: {
            var ctx = getContext("2d")
            ctx.lineWidth = 1
            ctx.strokeStyle = pointcolor
            ctx.clearRect(0,0,parent.width,parent.height)
            ctx.opacity =0.8
            ctx.fillStyle = pointcolor
            ctx.beginPath()
            ctx.moveTo(pointx,pointy)
            ctx.arc(pointx,pointy,pointradius,pointangleSta,Math.PI*2*(pointangleEnd/360))
            ctx.fill()
            ctx.stroke()
            //console.log("pointCanvas:"+parent.width)
        }
           Component.onCompleted: console.log(root.width+",,,,,"+root.height)
    }
    BreathGlow{
        id:pointglow
        visible: showstate
        rsource: pointCanvas
        color: "#00f0ff"
    }
}

