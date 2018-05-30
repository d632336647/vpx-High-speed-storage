import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQml.Models 2.2
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import "Inc.js" as Com
Item {
    clip: true
    visible: false
    id:root
    state: "HIDE"
    anchors.fill: parent
//    width: parent.width
//    height: parent.height-200
    property color borderColor: Com.borderColor
    property color shadowColor: Com.shadowColor
    property var cardName : "CARD-[1]"
    Component.onCompleted: {
        visible =true
        root.state = "SHOW"
        cardName = "CARD-["+chooseCardIndex+"]"
    }
    //过渡动画
    states: [
        State {
            name: "HIDE"
            PropertyChanges { target: root; scale: 0}
            onCompleted:{
                root.visible = false
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
    onVisibleChanged: {
        if(root.visible == false)
        {
            listLoader.sourceComponent = undefined
            downloadview.loadSource =undefined
        }else
        {
            listLoader.sourceComponent = listComponent
            downloadview.loadSource =downloadview.listComponent
            GetFileList.touchUpdateList(Com.OpDL)
        }
    }

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
                    listLoader.item.listView.state ="SHOW"
                    listViewTitle.state ="SHOW"

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
        color: Com.deviceFontColor
        text: cardName
        verticalAlignment : Text.AlignVCenter
        font.pixelSize: 40
        font.family: Com.deviceFont
//        font.family: "themify"
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
//        MouseArea{
//            anchors.fill: card
//            //hoverEnabled: true
//            //drag.target: parent
//            onClicked: {
//                console.log("sdadfqwefdedsa")
//                downloadview.state = "HIDE"
//                listLoader.item.listView.state = "HIDE"
//                listViewTitle.state = "HIDE"
//            }
//        }
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
        setTitle.font.pixelSize:26
//        setTitle.text: "111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"
        setTitle.text:"无下载项"
        width: 460

//        setTitle.width: msg4r.width-10
//        setTitle.wrapMode: Text.WrapAnywhere
//        setTitle.verticalAlignment : Text.AlignHCenter
        Connections{
            target: GetFileList
            onListDCountChanged:{
                console.log("下载总数：")
                msg4r.setTitle.text = "下载总数："+GetFileList.GetlistCountD() + " 已下载：" + "0" + " 未下载：" + GetFileList.GetlistCountD()
            }
        }
        Component.onCompleted: msg4r.setTitle.text = "下载总数："+GetFileList.GetlistCountD() + " 已下载：" + "0" + " 未下载：" + GetFileList.GetlistCountD()
    }

    DelegateModel
    {
        id:visualModelT
        model:
            ListModel {
                id:listModelT;
                ListElement{sequence:qsTr("序号 ");name:"文件名";mode:"模式";size:"文件大小";time:"创建时间" }
            }
        delegate:

            Rectangle{
                id:itemT
                height:Com.listItemHeight
                width:root.width-40
                color: "#00000000"
//                ContentBorderListV{
//                    id:borderp4T
//                    anchors.fill: parent
//                    visible: listView.currentIndex == index? true:false
//                    text: ""
//                    cornerWidth: 2
//                }
                Item{
                    id:listtext1T
                    width: 40
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.margins: 2
                    Text {
                        id:sequencetextT
                        font.family: "themify"
                        font.pixelSize: Com.listTitleFontPix;
                        text:sequence
                        color: "white"
                        anchors.centerIn: parent
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                if(listViewTitle.currentIndex == 0)
                                {
                                   sequencetextT.text = " 序号↓"
                                   nametextT.text = "文件名"
                                   modetextT.text = "模式"
                                   timetextT.text = "创建日期"
                                }
                                GetFileList.setSe(Com.SeInd)
                                GetFileList.SortList()
                            }
                        }
                    }
                }
                Item{
                    id:listtext2T
                     width: 400
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: listtext1T.right
                    anchors.margins: 2
                    Text {
                        id:nametextT
                        font.family: "themify"
                        font.pixelSize:  Com.listTitleFontPix;
                        text:name
                        color: Com.listTextColor
                        elide: Text.ElideMiddle
                        anchors.centerIn: parent
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                if(listViewTitle.currentIndex == 0)
                                {
                                   sequencetextT.text = "序号"
                                   nametextT.text = " 文件名↓"
                                   modetextT.text = "模式"
                                   timetextT.text = "创建日期"
                                }
                                GetFileList.setSe(Com.SeNam)
                                GetFileList.SortList()
                            }
                        }
                    }
                }
                Item {
                    id:listtext3T
                    width: 100
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: listtext2T.right
                    anchors.margins: 2
                    Text {
                        id:modetextT
                        font.family: "themify"
                        font.pixelSize:  Com.listTitleFontPix;
                        text:mode
                        color: Com.listTextColor
                        anchors.centerIn: parent
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                if(listViewTitle.currentIndex == 0)
                                {
                                   sequencetextT.text = "序号"
                                   nametextT.text = "文件名"
                                   modetextT.text = " 模式↓"
                                   timetextT.text = "创建日期"
                                }
                                GetFileList.setSe(Com.SeMod)
                                GetFileList.SortList()
                            }
                        }
                    }
                }

                Item
                {
                    id:listtext4T
                    width: 100
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: listtext3T.right
                    anchors.margins: 2
                    Text {
                        id:sizetextT
                        font.family: "themify"
                        font.pixelSize:  Com.listTitleFontPix;
                        text:size
                        color: Com.listTextColor
                        anchors.centerIn: parent
                        }
                }
                Item
                {
                    id:listtext5T
                    width: 200
                    height: Com.listItemHeight
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: listtext4T.right
                    anchors.margins: 2
                    focus: true
                    Text {
                        id:timetextT
                        font.family: "themify"
                        font.pixelSize:  Com.listTitleFontPix;
                        text:time
                        color: Com.listTextColor
                        anchors.centerIn: parent
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                if(listViewTitle.currentIndex == 0)
                                {
                                   sequencetextT.text = "序号"
                                   nametextT.text = "文件名"
                                   modetextT.text = "模式"
                                   timetextT.text = " 创建日期↓"
                                }
                                GetFileList.setSe(Com.SeTim)
                                GetFileList.SortList()
                            }
                        }
                    }
                }
                Item {
                    id: batchDownload
                    width:600
                    height: Com.listItemHeight
                    anchors.left: listtext5T.right
                    anchors.verticalCenter: listtext5T.verticalCenter
                    anchors.verticalCenterOffset: 5
                    anchors.margins: 2
                    property var rangemin :0
                    property var rangemax :GetFileList.GetlistCount()-1
                    focus: true
                        Row{
                            height: parent.height
                            Text {
                                id:batchText
                                font.family: "themify"
                                font.pixelSize:  Com.listTitleFontPix;
                                text:"\ue74e序号范围："
                                color: Com.listTextColor
                                width: 100
                            }
                            Text {
                                id:batchText3
                                font.family: "themify"
                                font.pixelSize:  Com.listTitleFontPix;
                                width: 10
        //                        text:"\ue67a\ue679"
                                text: "["
                                color: Com.listTextColor
                            }
                            TextInput {
                                text: "0"
                                id: input
        //                        anchors.horizontalCenter: parent.horizontalCenter
                                horizontalAlignment: Text.AlignHCenter
                                width: 50
                                font.pixelSize: Com.listTitleFontPix
        //                        passwordCharacter:"*"
                                selectByMouse: true //是否可以选择文本
                                selectionColor: Com.listTextColor
                                selectedTextColor: "blue"
                                color: Com.listTextColor

//                                validator:RegExpValidator{regExp: /[+-]?\d+[\.]?\d+$/}
                                validator:IntValidator{
                                            bottom: batchDownload.rangemin
                                            top:batchDownload.rangemax
                                          }
                                //inputMask: "####"
                                activeFocusOnPress: true
                            }
                            Text {
                                id:batchText2
                                font.family: "themify"
                                font.pixelSize:  Com.listTitleFontPix;
                                width: 50
        //                        text:"\ue67a\ue679"
                                text: "]---["
                                color: Com.listTextColor
                            }
                            TextInput {
                                id: input2
                                text: batchDownload.rangemax
        //                        anchors.horizontalCenter: parent.horizontalCenter
                                horizontalAlignment: Text.AlignHCenter
                                width: 50
                                font.pixelSize: Com.listTitleFontPix
        //                        passwordCharacter:"*"
                                selectByMouse: true //是否可以选择文本
                                selectionColor: Com.listTextColor
                                selectedTextColor: "blue"
                                color: Com.listTextColor
        //                        validator:RegExpValidator{regExp: /[+-]?\d+[\.]?\d+$/}
                                validator:IntValidator{
                                    bottom: Number(input.text)
                                    top:batchDownload.rangemax
                                    }
        //                        inputMask: "####"
                                activeFocusOnPress: true
                            }
                            Text {
                                id:batchText4
                                font.family: "themify"
                                font.pixelSize:  Com.listTitleFontPix;
                                width: 10
        //                        text:"\ue67a\ue679"
                                text: "]"
                                color: Com.listTextColor
                            }
                            BootButton{
                                width: 80
                                height: 20
                                bottomText:"批量下载"
                                bottomBorderColor: Com.listTextColor
                                bottomRadius: 0
                                onClick: {
                                    GetFileList.ClearIndexToList(Com.OpFL)
                                    for(var i=Number(input.text) ;i<=Number(input2.text);i++)
                                    {
                                        GetFileList.AppendIndexToList(i,Com.OpFL);
                                    }
                                    GetFileList.SendIndexFromList(Com.OpFL)
                                }
                            }
                    }
                    Connections{
                        target: GetFileList
                        onListCountChanged:{
                            rangemin = 0
                            rangemax = GetFileList.GetlistCount()-1
                        }
                    }
                }

//                MouseArea{
//                    anchors.fill: parent
//                    propagateComposedEvents: true
//                    onClicked:
//                    {
//                        //listViewTitle.currentIndex = index    //实现点击选中
//                        mouse.accepted = false
//                    }
//                }
            }
    }
    ListView{
        id:listViewTitle
        state: "HIDE"
        width:root.width-40
        height:Com.listItemHeight
        anchors.top: card.bottom
        anchors.left: parent.left
        anchors.leftMargin: 20
        model: visualModelT

        interactive: false    //禁用拖到滚动
        clip: true
        //过渡动画
        states: [
            State {
                name: "HIDE"
                PropertyChanges { target: listViewTitle; opacity:0}
                PropertyChanges { target: listViewTitle; height:0}
                onCompleted:{
                }
            },
            State {
                name: "SHOW"
                PropertyChanges { target: listViewTitle; opacity:1}
                PropertyChanges { target: listViewTitle; height:Com.listItemHeight}
                onCompleted: {
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
    Loader{
        id:listLoader
        state: "HIDE"
//        width:root.width-40
//        height:root.height-182-Com.listItemHeight
        anchors.top: listViewTitle.bottom
        anchors.left: parent.left
        anchors.leftMargin: 20
        sourceComponent:listComponent
        onLoaded: {
            //item.listView.state = "SHOW"
        }
    }
Component{
    id:listComponent
    Item{
        id:listViewItem
        property alias listView: listView
        width:root.width-40
        height:root.height-175
        ListView{
            id:listView
            state: "HIDE"
            anchors.fill: parent
            property var mouseYbegin
            property var mouseYend
            property var mouseIdxBegin
            property var mouseIdxEnd
            property bool mousePressed
            property var currentindex
            model: visualModel
            interactive: false    //禁用拖到滚动
            focus: true
            clip: true
            ScrollBar.vertical: ScrollBar{
                id:scrollBar
                active : true
                onActiveChanged:
                {
                    active = true
                }
                width :10
                contentItem:Rectangle {
                    id:handle
                    radius:3
                    color: "#0afffc"
                    MouseArea{
                        id:handlemMouse
                        hoverEnabled: true
                        anchors.fill: parent
//                        preventStealing: true             //防止截获
//                        propagateComposedEvents: true     //传递
                        onPressed: {
//                            handle.color= Com.ScrollPressColor
                            mouse.accepted = false
                        }
//                        onReleased: {
//                            handle.color= Com.ScrollEnterColor
//                        }
                        onEntered:
                        {
                            handle.color= Com.ScrollEnterColor
                        }
                        onExited:
                        {
                            handle.color= Com.ScrollExiteColor
                        }
//                        onCanceled: {
//                            preventStealing= true
//                            console.log("12313")
//                        }
                    }
                }
                background: Rectangle {
                    radius:3
                    color: "#000000"
                    border.color: Com.ScrollEnterColor
                }
            }

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
            Connections{
                target: GetFileList;
                onUpdateList:{
                    var temp1 = listView.contentY/listView.contentHeight
                    listView.currentIndex = 0
                    listModel.clear()
                    //console.log("current:",GetFileList.GetlistCount())
                    for(var current = 0;current<GetFileList.GetlistCount();current++)
                    {
                       // console.log("current:",current)
                        listModel.append({"sequence":GetFileList.GetlistIndex(current),"name":GetFileList.GetlistName(current),"mode":GetFileList.GetlistMode(current),"size":GetFileList.GetlistSize(current),"time":GetFileList.GetlistTime(current)})
                    }
                    listView.contentY = temp1*listView.contentHeight
                   // scrollBar.visible = true
                }
            }
            onContentYChanged:
            {
//                if(listView.mousePressed)
//                {
//                    for(var j =0; j< listView.contentHeight ;j+=Com.listItemHeight)
//                    {
//                       listView.itemAt(0,j).checked = false
//                    }
//                    listView.mouseYend = listviewMouse.mouseY+listView.contentY

                if(listView.mousePressed)
                {

                    for(var i=0 ; i<listModel.count;i++)
                    {
                        listModel.get(i).checked =false
//                                console.log(listModel.get(i).checked)
                    }

                    listView.mouseYend = listviewMouse.mouseY+contentY
                    listView.mouseIdxEnd = listView.indexAt(0,listView.mouseYend)
                    if(listView.mouseIdxBegin <= listView.mouseIdxEnd)
                    {
                        for(i=listView.mouseIdxBegin; i<=listView.mouseIdxEnd ;i++)
                        {
                            if(listModel.get(i)!== undefined && listModel.get(i).checked !== true)
                                listModel.get(i).checked =true
                        }
                    }else{
                        for(i=listView.mouseIdxEnd; i<=listView.mouseIdxBegin ;i++)
                        {
                            if(listModel.get(i)!== undefined && listModel.get(i).checked !== true)
                                listModel.get(i).checked =true
                        }
                    }
                }
            }
            MouseArea{
                id:listviewMouse
                Keys.forwardTo: [scrollBar]
                anchors.fill: parent
                propagateComposedEvents: downloadview.state == "HIDE"?  true:false

                //滚轮事件
                onWheel: {
//                  scrollbar.y = scrollbar.offsetY + listView.contentY/contentHeight * (scrollbar.length) - scrollbar.iw
                    contentMenu.visible = false
                    if(wheel.angleDelta.y > 0 && downloadview.state == "HIDE")
                    {
                        scrollBar.position -= 1/listModel.count
                        if(scrollBar.position < 0)
                        {
                            scrollBar.position = 0
                        }
                    }
                    else
                    {
                        if( downloadview.state == "HIDE")
                        {
                            scrollBar.position += 1/listModel.count
                            if(scrollBar.position > 1-scrollBar.size)
                            {
                                scrollBar.position =1-scrollBar.size
                            }
                        }
                       // scrollbar.y = scrollbar.offsetY + listView.contentY/contentHeight * (scrollbar.length) - scrollbar.iw
                    }
                }
                onPressed: {
                    console.log("listPressed")
                    if (mouse.button === Qt.LeftButton) { // 左键
                        listView.mousePressed =true
                        listView.mouseYbegin = mouse.y+listView.contentY
                        listView.mouseIdxBegin = listView.indexAt(0,listView.mouseYbegin)
                        GetFileList.ClearIndexToList()
                        contentMenu.visible = false
                    }
                }

                onMouseYChanged: {
                    if(listView.mousePressed)
                    {

                        for(var i=0 ; i<listModel.count;i++)
                        {
                            listModel.get(i).checked =false
//                                console.log(listModel.get(i).checked)
                        }

                        listView.mouseYend = mouse.y+listView.contentY
                        listView.mouseIdxEnd = listView.indexAt(0,listView.mouseYend)
                        if(listView.mouseIdxEnd !== -1 && listView.mouseIdxBegin !== -1)
                        {
                            if(listView.mouseIdxBegin <= listView.mouseIdxEnd)
                            {
                                for(i=listView.mouseIdxBegin; i<=listView.mouseIdxEnd ;i++)
                                {
                                    if(listModel.get(i)!== undefined && listModel.get(i).checked !== true)
                                    listModel.get(i).checked =true
                                }
                            }else{
                                for(i=listView.mouseIdxEnd; i<=listView.mouseIdxBegin ;i++)
                                {
                                    if(listModel.get(i)!== undefined && listModel.get(i).checked !== true)
                                    listModel.get(i).checked =true
                                }
                            }
                        }
                    }
                }
                onReleased: {
                    console.log("listRelease")
                    listView.mousePressed =false
                    listView.mouseYend = mouse.y+listView.contentY
                    listView.mouseIdxEnd = listView.indexAt(0,listView.mouseYend)
                    if(listView.mouseIdxEnd !== -1 && listView.mouseIdxBegin !== -1)
                    {
                        if(listView.mouseIdxEnd < listView.mouseIdxBegin)
                        {
                            //保持begin为较小值 方便后面的反序取数
                            var temp = listView.mouseIdxEnd
                            listView.mouseIdxEnd = listView.mouseIdxBegin
                            listView.mouseIdxBegin = temp
                        }
                        //反序添加入c++表列
                        for(var i=listView.mouseIdxEnd ; i>=listView.mouseIdxBegin ;i--)
                        {
                            GetFileList.AppendIndexToList(i,Com.OpFL)
                        }
                        console.log("mouseIdxEnd"+listView.mouseIdxEnd+" "+"mouseIdxBegin"+listView.mouseIdxBegin)
                    }
                    listView.currentindex = undefined       //很重要，一轮选中后应当还原标识符 否则出现bug
                   // GetFileList.SendIndexFromList()
                }

            }
            Rectangle{
                id:contentMenu
                //color: "black"
                //width: 52
                //height: 62
                visible: false
                border.color: Com.borderColor
                Column{
                    BootButton{
                        width: 50
                        height: 30
                        bottomText:"下载"
                        bottomBorderColor: Com.borderColor
                        bottomRadius: 0
                        onClick: {
                            GetFileList.SendIndexFromList()
                            contentMenu.visible = false
                        }
                    }
                    BootButton{
                        width: 50
                        height: 30
                        bottomText:"删除"
                        bottomBorderColor: Com.borderColor
                        bottomRadius: 0
                        onClick: {
                            contentMenu.visible = false
                        }
                    }
                }
            }
        }

        DelegateModel
        {
            id:visualModel
            model:
                ListModel {
                    id:listModel;
//                    ListElement{sequence:qsTr("1");name:"3ds max1";mode:"模式";size:"11M";time:"2018/3/30 15:10"}
//                    ListElement{sequence:qsTr("2");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"12M";time:"2018/3/30 15:10"}
//                    ListElement{sequence:qsTr("3");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"13M";time:"2018/3/30 15:10"}
//                    ListElement{sequence:qsTr("4");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"14M";time:"2018/3/30 15:10"}
//                    ListElement{sequence:qsTr("5");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"15M";time:"2018/3/30 15:10"}
//                    ListElement{sequence:qsTr("6");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"16M";time:"2018/3/30 15:10"}
//                    ListElement{sequence:qsTr("1");name:"3ds max1";mode:"模式";size:"11M";time:"2018/3/30 15:10"}
//                    ListElement{sequence:qsTr("2");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"12M";time:"2018/3/30 15:10"}
//                    ListElement{sequence:qsTr("3");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"13M";time:"2018/3/30 15:10"}
//                    ListElement{sequence:qsTr("4");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"14M";time:"2018/3/30 15:10"}
//                    ListElement{sequence:qsTr("5");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"15M";time:"2018/3/30 15:10"}
//                    ListElement{sequence:qsTr("6");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"16M";time:"2018/3/30 15:10"}
//                    ListElement{sequence:qsTr("1");name:"3ds max1";mode:"模式";size:"11M";time:"2018/3/30 15:10"}
//                    ListElement{sequence:qsTr("2");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"12M";time:"2018/3/30 15:10"}
//                    ListElement{sequence:qsTr("3");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"13M";time:"2018/3/30 15:10"}
//                    ListElement{sequence:qsTr("4");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"14M";time:"2018/3/30 15:10"}
//                    ListElement{sequence:qsTr("5");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"15M";time:"2018/3/30 15:10"}
//                    ListElement{sequence:qsTr("6");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"16M";time:"2018/3/30 15:10"}
                Component.onCompleted: {
                    for(var current = 0;current<GetFileList.GetlistCount();current++)
                    {
                        listModel.append({"checked":false,"sequence":GetFileList.GetlistIndex(current),"name":GetFileList.GetlistName(current),"mode":GetFileList.GetlistMode(current),"size":GetFileList.GetlistSize(current),"time":GetFileList.GetlistTime(current)})
                    }
                }
            }
            delegate:
                Rectangle {
                    id:item
                    property alias progressRect: progressRect
                    //property bool checked: false
                    height:Com.listItemHeight
                    width:root.width-40
                    color: "#00000000"
                    ContentBorderListV{
                        id:borderp4
                        anchors.fill: parent
                        //visible: listView.currentIndex == index? true:false
                        visible: checked
                        text: ""
                        cornerWidth: 2
                    }
                    Item{
                        id:listtext1
                        width: 40
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.margins: 2
                        Text {
                            id:sequencetext
                            font.family: "themify"
                            font.pixelSize: Com.listviewFontPix;
                            text:sequence
                            color: Com.listTextColor
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
                            id:nametext
                            font.family: "themify"
                            font.pixelSize: Com.listviewFontPix;
                            text:name
                            color: Com.listTextColor
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
                            id:modetext
                            font.family: "themify"
                            font.pixelSize: Com.listviewFontPix;
                            text:mode
                            color: Com.listTextColor
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
                            id:sizetext
                            font.family: "themify"
                            font.pixelSize: Com.listviewFontPix;
                            text:size
                            color: Com.listTextColor
                            anchors.centerIn: parent

                        }
                    }
                    Item{
                        id:listtext5
                        width: 200
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: listtext4.right
                        anchors.margins: 2
                        focus: true
                        Text {
                            id:timetext
                            font.family: "themify"
                            font.pixelSize: Com.listviewFontPix;
                            text:time
                            color: Com.listTextColor
                            anchors.centerIn: parent
                        }
                    }
                    BootButton{
                        id:buttom1
                        width: 70
                        height: Com.listItemHeight-2
                        anchors.right: buttom2.left
                        anchors.rightMargin: 20
                        anchors.verticalCenter: parent.verticalCenter
                        bottomText:"重命名"
                        onClick: {
                            console.log("重命名 clicked")

                            GetFileList.n_indexlist = 1
                        }
                    }
                    BootButton{
                        id:buttom2
                        width: 50
                        height: Com.listItemHeight-2
                        anchors.right: buttom3.left
                        anchors.rightMargin: 20
                        anchors.verticalCenter: parent.verticalCenter
                        bottomText:"删除"
                        onClick: {
                            console.log("删除 clicked")
                            listModel.clear()
                        }
                    }
                    BootButton{
                        id:buttom3
                        //radius: 15
                        //color: "black"
                        //border.color: Com.deviceFontColor
                        width: 50
                        height: Com.listItemHeight-2
                        anchors.right: progressRect.left
                        anchors.rightMargin: 20
                        anchors.verticalCenter: parent.verticalCenter
                        bottomText:"下载"
                        onClick: {
                            console.log("下载 clicked",listView.currentItem)
//                            //进度条增长
//                            progressRect.valuePercent  += 5


                        }
                    }
                    ProgressRect{
                        id:progressRect
                        property bool current: false
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        anchors.verticalCenter: parent.verticalCenter
                        valuePercent: 25
                        setWidth: 100
                        setHeight: 10
                        visible: false
                        onValuePercentChanged: {
                            if(valuePercent >= 100)
                            {
                                visible = false
                            }
                        }
                    }
                    MouseArea{
                        id:itemMouse
                        anchors.fill: parent
                        propagateComposedEvents: true
                        acceptedButtons: Qt.LeftButton | Qt.RightButton // 激活右键（别落下这个）
                        onClicked:
                        {
                            listView.currentIndex = index    //实现点击选中
                            progressRect.current = true
                            mouse.accepted = false
                            if (mouse.button == Qt.RightButton && checked === true) { // 右键菜单
                                    //
                                contentMenu.visible =true
                                contentMenu.x = mouseX+item.x
                                contentMenu.y = mouseY+item.y-listView.contentY
                            }
                        }


                    }
                }
            }
    }
}

    //屏蔽层
    Rectangle{
        id: mask
        anchors.fill: listLoader
        color: "black"
        opacity: 0.2
        visible: downloadview.state === "HIDE"? false: true
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            preventStealing: true
            propagateComposedEvents: false
            onClicked:
            {
                mouse.accepted = true
            }
        }

    }
    //屏蔽层2
    Rectangle{
        id: mask2
        anchors.fill: listViewTitle
        color: "black"
        opacity: 0.2
        visible: downloadview.state === "HIDE"? false: true
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            preventStealing: true
            propagateComposedEvents: false
            onClicked:
            {
                mouse.accepted = true
            }
        }

    }
    DownloadView{
        id:downloadview
        //anchors.fill: listView
        width:root.width-40
        height:root.height-130
        anchors.left: parent.left
        anchors.leftMargin: 20
        //anchors.bottom: parent.bottom
        target: listViewTitle
        y:root.height-30
    }

}


