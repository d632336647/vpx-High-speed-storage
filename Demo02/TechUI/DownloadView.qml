import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQml.Models 2.2
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import "Inc.js" as Com
Item {
    id:back
    property Item target
    state: "HIDE"
    property var loadSource: listComponent
    property alias listComponent: listComponent

    Rectangle{
        id:canvas
        anchors.fill: parent
        color: "black"
        //opacity: 0.9
    }
    Item{
        id:root
        property color borderColor: Com.borderColor
        property color shadowColor: Com.shadowColor
        width: back.width-40
        height: back.height
        anchors.left: back.left
        anchors.leftMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        Canvas{
            id:leftRightLine
            anchors.fill: parent
            onPaint: {
                var ctx = getContext('2d')
                //ctx.save();
                ctx.clearRect(0, 0, leftRightLine.width, leftRightLine.height);
                ctx.beginPath();
                ctx.lineWidth = 2.5
                //ctx.lineJoin = "round"
                ctx.lineCap = "round"
                ctx.strokeStyle = root.borderColor;
                ctx.moveTo(20,30)
                ctx.lineTo(10,40)
                ctx.lineTo(10,root.height-15)
                ctx.lineTo(0, root.height-5)

                ctx.moveTo(root.width-20,30)
                ctx.lineTo(root.width-10,40)
                ctx.lineTo(root.width-10,root.height-15)
                ctx.lineTo(root.width, root.height-5)

                ctx.moveTo(20,30)
                ctx.lineTo(root.width/2 - 80,30)

                ctx.moveTo(root.width/2 + 80,30)
                ctx.lineTo(root.width-20,30)

                ctx.stroke()
            }
        }
        Glow {
            id:lineGrow
            source: leftRightLine
            anchors.fill: leftRightLine
            cached: true
            fast: true
            radius: 10
            samples: 14
            color: root.shadowColor
            spread: 0.6
            opacity: 0.8
        }
        Canvas{
            id:centerCanvas
           // anchors.fill: parent
            width: 160
            height: 30
            anchors.top: leftRightLine.top
            anchors.horizontalCenter: parent.horizontalCenter
            onPaint: {
                var ctx = getContext('2d')
                //ctx.save();
                ctx.clearRect(0, 0, leftRightLine.width, leftRightLine.height);
                ctx.beginPath();
                ctx.lineWidth = 2.5
                //ctx.lineJoin = "round"
                ctx.lineCap = "round"
                ctx.strokeStyle = root.borderColor;

//                ctx.moveTo(root.width/2 - 80,25)
//                ctx.lineTo(root.width/2 - 70,5)
//                ctx.lineTo(root.width/2 + 70,5)
//                ctx.lineTo(root.width/2 + 80,25)
                ctx.moveTo(0,31)
                ctx.lineTo(10,10)
                ctx.lineTo(150,10)
                ctx.lineTo(160,31)
                //ctx.closePath()
                //ctx.fill()
//                ctx.fillStyle = "#808080"

                ctx.stroke()
            }
            MouseArea{
                id: btnMouseArea;
                anchors.fill: parent;

                hoverEnabled: true;
                onClicked: {
                   // clickAnim.start()
                   // root.clicked()
                    //console.log("clickdedads")
//                    if(back.state == "HIDE")
//                    {
//                        listLoader.sourceComponent = listComponent
//                    }
                    if(back.state === "HIDE")
                    {
                        console.log("listComponent--------")
                        loadSource = listComponent
                        GetFileList.touchUpdateList(Com.OpDL)
                    }
                    back.state = back.state == "HIDE"? "SHOW":"HIDE"
//                    if(back.state === "HIDE")
//                    {
//                        console.log("undefined--------")
//                        loadSource = undefined
//                    }

                }
                onEntered:
                {
                    root.borderColor = Com.channalBorderEnterColor
                    root.shadowColor = Com.channalShadowEnterColor
                    leftRightLine.requestPaint()
                    centerCanvas.requestPaint()
                    pressedAnim.start()
                }
                onExited:
                {
                    root.borderColor = Com.channalBorderExitColor
                    root.shadowColor = Com.channalBorderExitColor
                    leftRightLine.requestPaint()
                    centerCanvas.requestPaint()
                    releasedAnim.start()
                }
                PropertyAnimation {
                    id: pressedAnim;
                    target: lineGrow;
                    property: "opacity";
                    to: 0.4;
                    duration: 300
                }
                PropertyAnimation {
                    id: releasedAnim;
                    target: lineGrow;
                    property: "opacity";
                    to: 0.8
                    duration: 300
                }
                PropertyAnimation {
                    id: clickAnim;
                    target: lineGrow;
                    property: "opacity";
                    to: 1
                    duration: 200
                    onStopped: {
                        pressedAnim.start()
                    }
                }
            }
        }

        Glow {
            id:centerCanvasglow
            source: centerCanvas
            anchors.fill: centerCanvas
            cached: true
            fast: true
            radius: 10
            samples: 14
            color: root.shadowColor
            spread: 0.6
            opacity: 0.8
        }
        Text{
            id:showhide
            font.family: "themify"
            anchors.horizontalCenter: centerCanvas.horizontalCenter
            anchors.top: centerCanvas.top
            anchors.topMargin: 12
            text: "\ue663"
            font.pixelSize: 20
            color: root.borderColor
        }
        Glow {
            id:showhideglow
            source: showhide
            anchors.fill: showhide
            cached: true
            fast: true
            radius: 10
            samples: 14
            color: root.shadowColor
            spread: 0.6
            opacity: 0.8
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
                            color: Com.listTextColor
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
                                    GetFileList.SortListD()
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
                                    GetFileList.SortListD()
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
                                    GetFileList.SortListD()
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
                                    GetFileList.SortListD()
                                }
                            }
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        propagateComposedEvents: true
                        onClicked:
                        {
                            listViewTitle.currentIndex = index    //实现点击选中
                            mouse.accepted = false
                        }
                    }
            }
        }
        ListView{
            id:listViewTitle
            state: "HIDE"
            width:root.width-40
            height:Com.listItemHeight
            anchors.top: root.top
            anchors.topMargin: 35
            anchors.left: parent.left
            anchors.leftMargin: 20
            model: visualModelT
            interactive: false    //禁用拖到滚动
            clip: true
        }

        Loader{
            id:listLoader
            anchors.top: listViewTitle.bottom

            anchors.left: parent.left
            anchors.leftMargin: 20
            sourceComponent:loadSource
            focus: true
            onLoaded: {
            }
        }
    Component{
        id:listComponent
        Item{
            id:listViewItem
            property alias listView: listView
            width:root.width-40
            height:root.height-40-Com.listItemHeight
            ListView{
                id:listView
                snapMode: ListView.SnapToItem  //停靠在表列的最开始
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
                            hoverEnabled: true
                            anchors.fill: parent
                            onPressed: {
//                                handle.color= Com.ScrollPressColor
                                mouse.accepted = false
                            }
//                            onReleased:
//                            {
//                                handle.color= Com.ScrollEnterColor
//                            }
                            onEntered:
                            {
                                handle.color= Com.ScrollEnterColor
                            }
                            onExited:
                            {
                                handle.color= Com.ScrollExiteColor
                            }
                        }
                    }
                    background: Rectangle {
                        radius:3
                        color: "#000000"
                        border.color: "#0cbab8"
                    }
                }

                Connections{
                    target: GetFileList;
                    onUpdateListD:{
                        var temp1 = listView.contentY/listView.contentHeight
                        listView.currentIndex = 0
                        listModel.clear()
                        for(var current = 0;current<GetFileList.GetlistCountD();current++)
                        {
                           // console.log("current:",current)
                            listModel.append({"checked":false,"sequence":GetFileList.GetlistIndexD(current),"name":GetFileList.GetlistNameD(current),"mode":GetFileList.GetlistModeD(current),"size":GetFileList.GetlistSizeD(current),"time":GetFileList.GetlistTimeD(current)})
                        }
                        listView.contentY = temp1*listView.contentHeight

                    }
                }

                onContentYChanged:
                {
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
                    anchors.fill: parent
                    propagateComposedEvents: downloadview.state == "SHOW"?  true:false

                    //滚轮事件
                    onWheel: {

                            if(wheel.angleDelta.y > 0 && downloadview.state == "SHOW")
                            {
                                console.log("mouseArea+++")

                                scrollBar.position -= 1/listModel.count
                                if(scrollBar.position < 0)
                                {
                                    scrollBar.position = 0
                                }
                            }
                            else
                            {
                                if( downloadview.state == "SHOW")
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
                        if (mouse.button === Qt.LeftButton) { // 左键
                            listView.mousePressed =true
                            listView.mouseYbegin = mouse.y+listView.contentY
                            listView.mouseIdxBegin = listView.indexAt(0,listView.mouseYbegin)
                            GetFileList.ClearIndexToList(Com.OpDL)
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
                                GetFileList.AppendIndexToList(i,Com.OpDL)
                            }
                            console.log("mouseIdxEnd"+listView.mouseIdxEnd+" "+"mouseIdxBegin"+listView.mouseIdxBegin)
                        }
                        listView.currentindex = undefined       //很重要，一轮选中后应当还原标识符
                        //GetFileList.SendIndexFromList(Com.OpDL)
                    }
                }
                Rectangle{
                    id:contentMenu
                    color: "black"
                    //width: 52
                    //height: 62
                    visible: false
                    Column{
                        BootButton{
                            width: 50
                            height: 30
                            bottomText:"取消"
                            onClick: {
                                contentMenu.visible = false //隐藏自身
                                GetFileList.SendIndexFromList(Com.OpDL)
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
//                        ListElement{sequence:qsTr("1");name:"3ds max1";mode:"模式";size:"11M";time:"2018/3/30 15:10"}
//                        ListElement{sequence:qsTr("2");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"12M";time:"2018/3/30 15:10"}
//                        ListElement{sequence:qsTr("3");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"13M";time:"2018/3/30 15:10"}
//                        ListElement{sequence:qsTr("4");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"14M";time:"2018/3/30 15:10"}
//                        ListElement{sequence:qsTr("5");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"15M";time:"2018/3/30 15:10"}
//                        ListElement{sequence:qsTr("6");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"16M";time:"2018/3/30 15:10"}
//                        ListElement{sequence:qsTr("1");name:"3ds max1";mode:"模式";size:"11M";time:"2018/3/30 15:10"}
//                        ListElement{sequence:qsTr("2");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"12M";time:"2018/3/30 15:10"}
//                        ListElement{sequence:qsTr("3");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"13M";time:"2018/3/30 15:10"}
//                        ListElement{sequence:qsTr("4");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"14M";time:"2018/3/30 15:10"}
//                        ListElement{sequence:qsTr("5");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"15M";time:"2018/3/30 15:10"}
//                        ListElement{sequence:qsTr("6");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"16M";time:"2018/3/30 15:10"}
//                        ListElement{sequence:qsTr("1");name:"3ds max1";mode:"模式";size:"11M";time:"2018/3/30 15:10"}
//                        ListElement{sequence:qsTr("2");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"12M";time:"2018/3/30 15:10"}
//                        ListElement{sequence:qsTr("3");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"13M";time:"2018/3/30 15:10"}
//                        ListElement{sequence:qsTr("4");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"14M";time:"2018/3/30 15:10"}
//                        ListElement{sequence:qsTr("5");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"15M";time:"2018/3/30 15:10"}
//                        ListElement{sequence:qsTr("6");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"16M";time:"2018/3/30 15:10"}
//                        Component.onCompleted: {
//                        for(var current = 0;current<GetFileList.GetlistCountD();current++)
//                        {
//                          listModel.append({"sequence":GetFileList.GetlistIndexD(current),"name":GetFileList.GetlistNameD(current),"mode":GetFileList.GetlistModeD(current),"size":GetFileList.GetlistSizeD(current),"time":GetFileList.GetlistTimeD(current)})
//                        }
//                    }
                }
                delegate:
                    Rectangle {
                        id:item
                        property alias progressRect: progressRect
                        height:Com.listItemHeight
                        width:root.width-40
                        color: "#00000000"
                        ContentBorderListV{
                            id:borderp4
                            anchors.fill: parent
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
                            id:buttom3
                            //radius: 15
                            //color: "black"
                            //border.color: Com.deviceFontColor
                            width: 50
                            height: Com.listItemHeight-2
                            anchors.right: progressRect.left
                            anchors.rightMargin: 20
                            anchors.verticalCenter: parent.verticalCenter
                            bottomText:"取消"
                            onClick: {
                                console.log("取消 clicked",listView.currentItem)
                                GetFileList.SendIndexFromList(Com.OpDL)
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
                            visible: true
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
        //                        item.checked = item.checked == true? false: true
                                mouse.accepted = false
                                if (mouse.button === Qt.RightButton && borderp4.visible === true) { // 右键菜单
                                        //
                                        contentMenu.visible = true
                                    contentMenu.x = mouseX+item.x
                                    contentMenu.y = mouseY+item.y-listView.contentY
                                }
                            }
                        }
                    }
                }
        }
    }

    }
    //过渡动画
    states: [
        State {

            name: "HIDE"
            PropertyChanges { target: back; y: 833-30}
            PropertyChanges { target: back; opacity: 0.2}
            onCompleted:{
                //back.state = "SHOW"
                showhide.text = "\ue660"
                loadSource = undefined

            }
        },
        State {
            name: "SHOW"
            PropertyChanges { target: back; y: 833-root.height}
            PropertyChanges { target: back; opacity: 1}
            onCompleted: {
               // back.state = "HIDE"
                showhide.text = "\ue663"
            }
        }
    ]

    transitions: [
         Transition {
             from: "SHOW"
             to: "HIDE"
             PropertyAnimation { properties: "y,opacity"; duration: 1000; easing.type: Easing.Linear }
         },
         Transition {
             from: "HIDE"
             to: "SHOW"
             PropertyAnimation { properties: "y,opacity"; duration: 1000; easing.type: Easing.Linear }
         }
    ]

}
