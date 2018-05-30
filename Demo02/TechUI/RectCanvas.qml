import QtQuick 2.0
import "./Inc.js" as Com

Item {
    id:root
    state: "SHOW"
    anchors.fill: parent
    property alias rectCanvas: rectCanvas
    property alias pointsCanvas: points.pointCanvas     //顶点
    property alias pointsShowState: points.showstate    //顶点
    property int lineWidth: 1                           //线宽
    property bool centerViewRectState : false           //右下角
    property bool rightbottomRectState : true           //右下角
    property alias lineGlowStatet: breathGlow.visible   //呼吸灯效果
    property real setRotation: 0
    Canvas{
        rotation: setRotation
        id:rectCanvas
        property real percent: 1
        width: parent.width
        height: parent.height
                onPaint: {
                    var ctx = getContext("2d")
                    var i =0
                    ctx.lineWidth =lineWidth
                    ctx.strokeStyle = "#33a8af"
                    ctx.opacity =0.5
                    ctx.clearRect(0,0,rectCanvas.width,rectCanvas.height)       //先清除，再重新描绘一个稍微短点的图
                    ctx.beginPath()
                    if(!centerViewRectState)
                    {
                        ctx.moveTo(0,0)
                        ctx.lineTo(parent.width*percent,0)
                        ctx.lineTo((parent.width-parent.height)*percent,parent.height*percent)
                        ctx.lineTo(parent.height*percent,parent.height*percent)
                        ctx.moveTo(0,0)
                        ctx.lineTo(parent.height*percent,parent.height*percent)
                    }
                    if(centerViewRectState)
                    {
                    //绘制主框
                        for(i=0;i<Com.pointarr.length-1;i++)
                        {
                            ctx.moveTo(parseInt(parent.width*Com.pointarr[i][0] ),parseInt(parent.height*Com.pointarr[i][1]))
                            ctx.lineTo(parseInt(parent.width*Com.pointarr[i][0]+(parent.width*Com.pointarr[i+1][0]-parent.width*Com.pointarr[i][0])*percent),
                                       parseInt(parent.height*Com.pointarr[i][1]+(parent.height*Com.pointarr[i+1][1]-parent.height*Com.pointarr[i][1])*percent))
                        }
                            ctx.moveTo(parseInt(parent.width*Com.pointarr[Com.pointarr.length-1][0] ),parseInt(parent.height*Com.pointarr[Com.pointarr.length-1][1]))
                            ctx.lineTo(parseInt(parent.width*Com.pointarr[Com.pointarr.length-1][0]+(parent.width*Com.pointarr[0][0]-parent.width*Com.pointarr[Com.pointarr.length-1][0])*percent),
                                       parseInt(parent.height*Com.pointarr[Com.pointarr.length-1][1]+(parent.height*Com.pointarr[0][1]-parent.height*Com.pointarr[Com.pointarr.length-1][1])*percent))
                    }
                    //绘制右下角
                    if(rightbottomRectState)
                    {
                        for(i=0;i<Com.pointarr2.length-1;i++)
                        {
                            ctx.moveTo(parseInt(parent.width*Com.pointarr2[i][0] ),parseInt(parent.height*Com.pointarr2[i][1]))
                            ctx.lineTo(parseInt(parent.width*Com.pointarr2[i][0]+(parent.width*Com.pointarr2[i+1][0]-parent.width*Com.pointarr2[i][0])*percent),
                                       parseInt(parent.height*Com.pointarr2[i][1]+(parent.height*Com.pointarr2[i+1][1]-parent.height*Com.pointarr2[i][1])*percent))
                        }
                            ctx.moveTo(parseInt(parent.width*Com.pointarr2[Com.pointarr2.length-1][0] ),parseInt(parent.height*Com.pointarr2[Com.pointarr2.length-1][1]))
                            ctx.lineTo(parseInt(parent.width*Com.pointarr2[Com.pointarr2.length-1][0]+(parent.width*Com.pointarr2[0][0]-parent.width*Com.pointarr2[Com.pointarr2.length-1][0])*percent),
                                       parseInt(parent.height*Com.pointarr2[Com.pointarr2.length-1][1]+(parent.height*Com.pointarr2[0][1]-parent.height*Com.pointarr2[Com.pointarr2.length-1][1])*percent))
                    }
                    ctx.stroke()
                }
        onPercentChanged: {

            requestPaint()
        }

    }
    onRightbottomRectStateChanged: {
           rectCanvas.requestPaint()
           points.rightbottomPointState=rightbottomRectState
    }
    //呼吸灯
    BreathGlow{
        rotation: setRotation
        id:breathGlow
        rsource: rectCanvas
        color: Com.glowColor
        time:2000
        visible: true
    }

    //过渡动画
    states: [
         State {
             name: "SHOW"
             PropertyChanges { target: rectCanvas; percent: 1}
             onCompleted:{
                                root.state = "HIDE"
                 //rightbottomRectState =false
             }
         },
         State {
             name: "HIDE"
             PropertyChanges { target: rectCanvas; percent: 0}
             onCompleted: {
                                root.state = "SHOW"
                 //rightbottomRectState =true
             }
         }
    ]

    transitions: [
         Transition {
             to: "HIDE"
             PropertyAnimation { properties: "percent"; duration: 2000; easing.type: Easing.OutCubic }
         },
         Transition {
             to: "SHOW"
             PropertyAnimation { properties: "percent"; duration: 2000; easing.type: Easing.OutCubic }
         }
    ]

    //画全部点 这里是
    PointCanvas{
        id:points
        showstate:false
        rightbottomPointState:rightbottomRectState
    }

//    MouseArea{
//        anchors.fill: parent
//        onClicked: {
//            console.log("mousepressed"+"1"+root.state.toString())
//            root.state = root.state == "HIDE"? "SHOW":"HIDE"
//            console.log("mousepressed"+"2"+root.state.toString())
//            clicked()
//        }
//    }
}
