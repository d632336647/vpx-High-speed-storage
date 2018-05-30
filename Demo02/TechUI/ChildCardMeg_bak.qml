import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQml.Models 2.2

import "Inc.js" as Com
Item {
    id:root
    state: "HIDE"
    width: parent.width
    height: parent.height - 33
    property color borderColor: "#A00AFFFC"
    property color shadowColor: "#0AFFFC"
    //过渡动画
    states: [
        State {
            name: "HIDE"
            PropertyChanges { target: root; scale: 0}
            onCompleted:{

            }
        },
        State {
            name: "SHOW"
            PropertyChanges { target: root; scale: 1}
            onCompleted: {
                lineGrow.state = "SHOW"
                leftRightLine.state = "SHOW"
            }
        }
    ]
    transitions: [
         Transition {
             from: "SHOW"
             to: "HIDE"
             PropertyAnimation { properties: "scale"; duration: 300; easing.type: Easing.Linear }
         },
         Transition {
             from: "HIDE"
             to: "SHOW"
             PropertyAnimation { properties: "scale"; duration: 300; easing.type: Easing.Linear }
         }
    ]


    Rectangle{
        id:back
        color: "black"
        anchors.fill: parent
    }
    Canvas{
        id:leftRightLine
        state: "HIDE"
        anchors.fill: parent
        onPaint: {
            var ctx = getContext('2d')
            //ctx.save();
            ctx.clearRect(0, 0, leftRightLine.width, leftRightLine.height);
            ctx.beginPath();
            ctx.lineWidth = 1.5
            //ctx.lineJoin = "round"
            ctx.lineCap = "round"
            ctx.strokeStyle = borderColor;
            ctx.moveTo(15,5)
            ctx.lineTo(5,15)
            ctx.lineTo(5,root.height-15)
            ctx.lineTo(15, root.height-5)

            ctx.moveTo(root.width-15,5)
            ctx.lineTo(root.width-5,15)
            ctx.lineTo(root.width-5,root.height-15)
            ctx.lineTo(root.width-15, root.height-5)

            ctx.stroke()
        }
        //过渡动画
        states: [
            State {
                name: "HIDE"
                PropertyChanges { target: leftRightLine; scale: 0}
                onCompleted:{
                    root.state = "HIDE"
                }
            },
            State {
                name: "SHOW"
                PropertyChanges { target: leftRightLine; scale: 1}
                onCompleted: {
                    deviceSN.state = "SHOW"
                    card.state = "SHOW"
                    msg1r.state ="SHOW"
                    msg2r.state ="SHOW"
                    msg3r.state ="SHOW"
                    msg4r.state ="SHOW"
                    listView.state ="SHOW"

                }
            }
        ]
        transitions: [
             Transition {
                 from: "SHOW"
                 to: "HIDE"
                 PropertyAnimation { properties: "scale"; duration: 1000; easing.type: Easing.OutBounce }
             },
             Transition {
                 from: "HIDE"
                 to: "SHOW"
                 PropertyAnimation { properties: "scale"; duration: 1000; easing.type: Easing.InBounce }
             }
        ]
    }
    Glow {
        id:lineGrow
        state: "HIDE"
        source: leftRightLine
        anchors.fill: leftRightLine
        cached: true
        fast: true
        radius: 10
        samples: 14
        color: shadowColor
        spread: 0.6
        opacity: 0.8

        //过渡动画
        states: [
            State {
                name: "HIDE"
                //PropertyChanges { target: root; opacity: 0;}
                PropertyChanges { target: lineGrow; scale: 0}
                onCompleted:{

                }
            },
            State {
                name: "SHOW"
                //PropertyChanges { target: root; opacity: 1}
                PropertyChanges { target: lineGrow; scale: 1}
                onCompleted: {

                }
            }
        ]

        transitions: [
             Transition {
                 from: "SHOW"
                 to: "HIDE"
                 PropertyAnimation { properties: "scale"; duration: 300; easing.type: Easing.OutBounce }
             },
             Transition {
                 from: "HIDE"
                 to: "SHOW"
                 PropertyAnimation { properties: "scale"; duration: 300; easing.type: Easing.InBounce }
             }
        ]

    }

    Text {
        id: deviceSN
        state: "HIDE"
        color: "#DA7B0B"
        text: "CARD-ONE"
        font.pixelSize: 40
        font.family: Com.deviceFont
        anchors.left: parent.left
        anchors.top:  parent.top
        anchors.margins: 10

        //过渡动画
        states: [
            State {
                name: "HIDE"
                PropertyChanges { target: deviceSN; opacity: 0}
                onCompleted:{

                }
            },
            State {
                name: "SHOW"
                PropertyChanges { target: deviceSN; opacity: 1}
                onCompleted: {

                }
            }
        ]

        transitions: [
             Transition {
                 from: "SHOW"
                 to: "HIDE"
                 PropertyAnimation { properties: "opacity"; duration: 1000; easing.type: Easing.Linear }
             },
             Transition {
                 from: "HIDE"
                 to: "SHOW"
                 PropertyAnimation { properties: "opacity"; duration: 1000; easing.type: Easing.Linear }
             }
        ]
    }
    CardImage{
        id:card
        state: "HIDE"
        anchors.top: deviceSN.bottom
        anchors.left: deviceSN.left
        width: imagew
        anchors.margins: 3
        //过渡动画
        states: [
            State {
                name: "HIDE"
                PropertyChanges { target: card; opacity: 0}
                //PropertyChanges { target: card; width:imagew}
                onCompleted:{

                }
            },
            State {
                name: "SHOW"
                PropertyChanges { target: card; opacity: 1}
                //PropertyChanges { target: card; width: 0}
                onCompleted: {

                }
            }
        ]

        transitions: [
             Transition {
                 from: "SHOW"
                 to: "HIDE"
                 PropertyAnimation { properties: "opacity"; duration: 1000; easing.type: Easing.Linear }
             },
             Transition {
                 from: "HIDE"
                 to: "SHOW"
                 PropertyAnimation { properties: "opacity"; duration: 1000; easing.type: Easing.Linear }
             }
        ]
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            drag.target: parent
            onClicked: {
                console.log("sdadfqwefdedsa")
                //leftRightLine.state ="HIDE"
                listView.state = "HIDE"
            }
        }
    }

    MsgBox{
        id:msg1r
        state: "HIDE"
        anchors.top: deviceSN.top
        anchors.left: deviceSN.right
        anchors.topMargin: 15
        anchors.leftMargin: 3
        setTitle.text: "温度 28 ℃"
    }
    MsgBox{
        id:msg2r
        state: "HIDE"
        anchors.top: deviceSN.top
        anchors.left: msg1r.right
        anchors.topMargin: 15
        anchors.leftMargin: 3
        anchors.margins: 3
        setTitle.text: "传输速率 1G"
    }
    MsgBox{
        id:msg3r
        state: "HIDE"
        anchors.top: deviceSN.top
        anchors.left: msg2r.right
        anchors.topMargin: 15
        anchors.leftMargin: 3
        anchors.margins: 3
        setTitle.text: "使用率 34 %"
    }

    MsgBox{
        id:msg4r
        state: "HIDE"
        anchors.top: deviceSN.top
        anchors.left: msg3r.right
        anchors.topMargin: 15
        anchors.leftMargin: 3
        anchors.margins: 3
        setTitle.font.pixelSize:20
        setTitle.text: "anchors.right: parent.right\n\ranchors.rightMargin: 10\n\ranchors.verticalCenter: parent"
        width: 480
    }

    DelegateModel
    {
        id:visualModel
        model:
            ListModel {
                id:listModel;
                ListElement{name:qsTr("文件名");path:"地址";value:"重要性";size:"文件大小"}
                ListElement{name:qsTr("文件1");path:"D:\work\spectrumAnalyzer\soft\pc";value:"\ue60a";size:"11M"}
                ListElement{name:qsTr("文件2");path:"D:\work\spectrumAnalyzer\soft\pc";value:"\ue60a";size:"12M"}
                ListElement{name:qsTr("文件3");path:"D:\work\spectrumAnalyzer\soft\pc";value:"\ue60a";size:"13M"}
                ListElement{name:qsTr("文件4");path:"D:\work\spectrumAnalyzer\soft\pc";value:"\ue60a";size:"14M"}
                ListElement{name:qsTr("文件5");path:"D:\work\spectrumAnalyzer\soft\pc";value:"\ue60a";size:"15M"}
                ListElement{name:qsTr("文件6");path:"D:\work\spectrumAnalyzer\soft\pc";value:"\ue60a";size:"16M"}

            }
        delegate:
            Rectangle{
                id:item
                height:80
                width:root.width-40
                color: "#00000000"
                ContentBorder{
                    id:borderp4
                    anchors.fill: parent
                    visible: listView.currentIndex == index? true:false
                    text: ""
                    cornerWidth: 2
                }
                Item{
                    id:listtext1
                    width: 80
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.margins: 10
                    Text {
                        font.family: "themify"
                        font.pixelSize: 20;
                        text:name
                        color: "white"
                        anchors.centerIn: parent
                    }
                }
                Item{
                    id:listtext2
                     width: 400
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: listtext1.right
                    anchors.margins: 2
                    Text {

                        font.family: "themify"
                        font.pixelSize: 20;
                        text:path
                        color: "white"
                        elide: Text.ElideMiddle
                        anchors.centerIn: parent
                    }
                }
                Item {
                    id:listtext3
                    width: 100
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: listtext2.right
                    anchors.margins: 2
                    Text {

                        font.family: "themify"
                        font.pixelSize: 20;
                        text:value
                        color: "white"
                        anchors.centerIn: parent
                    }
                }
                Item
                {
                    id:listtext4
                    width: 100
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: listtext3.right
                    anchors.margins: 2
                    Text {
                        font.family: "themify"
                        font.pixelSize: 20;
                        text:size
                        color: "white"
                        anchors.centerIn: parent

                    }
                }
                Rectangle{
                    id:buttom1
                    radius: 15
                    color: "black"
                    border.color: "#DA7B0B"
                    width: 100
                    height: 30
                    anchors.right: buttom2.left
                    anchors.rightMargin: 20
                    anchors.verticalCenter: parent.verticalCenter

                    Text{
                        color: "white"
                        text:"重命名"
                        font.pixelSize: 20;
                        anchors.centerIn: parent
                        font.family: Com.deviceFont
                    }
                }
                Rectangle{
                    id:buttom2
                    radius: 15
                    color: "black"
                    border.color: "#DA7B0B"
                    width: 100
                    height: 30
                    anchors.right: buttom3.left
                    anchors.rightMargin: 20
                    anchors.verticalCenter: parent.verticalCenter

                    Text{
                        color: "white"
                        text:"删除"
                        font.pixelSize: 20;
                        anchors.centerIn: parent
                        font.family: Com.deviceFont
                    }
                }
                Rectangle{
                    id:buttom3
                    radius: 15
                    color: "black"
                    border.color: "#DA7B0B"
                    width: 100
                    height: 30
                    anchors.right: progressRect.left
                    anchors.rightMargin: 20
                    anchors.verticalCenter: parent.verticalCenter

                    Text{
                        color: "white"
                        text:"下载"
                        font.pixelSize: 20;
                        anchors.centerIn: parent
                        font.family: Com.deviceFont
                    }
                }
                ProgressRect{
                    id:progressRect
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    valuePercent: 25
                    setWidth: 100
                    setHeight: 10
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: listView.currentIndex = index    //实现点击选中
                }
            }
    }
    ListView{
        id:listView
        state: "HIDE"
        width:root.width-40
        height:root.height-120
        anchors.top: card.bottom
        anchors.left: parent.left
        anchors.leftMargin: 20
        model: visualModel
        //interactive: false    //禁用拖到滚动
        focus: true
        clip: true

        //过渡动画
        states: [
            State {
                name: "HIDE"
                PropertyChanges { target: listView; opacity:0}
                PropertyChanges { target: listView; height:0}
                onCompleted:{
                    deviceSN.state = "HIDE"
                    card.state = "HIDE"
                    msg1r.state ="HIDE"
                    msg2r.state ="HIDE"
                    msg3r.state ="HIDE"
                    msg4r.state ="HIDE"
                    leftRightLine.state = "HIDE"
                }
            },
            State {
                name: "SHOW"
                PropertyChanges { target: listView; opacity:1}
                PropertyChanges { target: listView; height:root.height-120}
                onCompleted: {
                        listModel.append({"name":"文件3","path":"sss","value":"\ue60a","size":"16M"})
                    listModel.append({"name":"文件3","path":"sss","value":"\ue60a","size":"16M"})
                    listModel.append({"name":"文件3","path":"sss","value":"\ue60a","size":"16M"})
                    listModel.append({"name":"文件3","path":"sss","value":"\ue60a","size":"16M"})
                    listModel.append({"name":"文件3","path":"sss","value":"\ue60a","size":"16M"})
                    listModel.append({"name":"文件3","path":"sss","value":"\ue60a","size":"16M"})
                    listModel.append({"name":"文件3","path":"sss","value":"\ue60a","size":"16M"})
                }
            }
        ]
        transitions: [
             Transition {
                 from: "SHOW"
                 to: "HIDE"
                 PropertyAnimation { properties: "opacity,height"; duration: 1500; easing.type: Easing.Linear }
             },
             Transition {
                 from: "HIDE"
                 to: "SHOW"
                 PropertyAnimation { properties: "opacity,height"; duration: 1500; easing.type: Easing.Linear }
             }
        ]
    }
    Rectangle{
        id:scrollbar
        anchors.left: listView.right
        y:listView.visibleArea.yPosition*listView.height +(root.height-listView.height)
        width: 6
        radius: 3
        height: listView.visibleArea.heightRatio*(listView.height-10)
        color: "#0afffc"
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            //拖拽 对象 范围
            drag.target: parent
            drag.minimumY: (root.height-listView.height)
            drag.maximumY: root.height - height-10
            onPressed: {
                scrollbar.focus= true
                listView.focus = false
            }
            onReleased: {
                scrollbar.focus= false
                listView.focus = true
            }
        }
        onYChanged:
        {
            if(scrollbar.focus)
            {
                listView.contentY = (y-(root.height-listView.height))/(listView.height-10) *(80 *listModel.count)
            }
        }
    }
}
