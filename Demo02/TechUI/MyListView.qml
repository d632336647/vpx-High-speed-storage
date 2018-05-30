//import QtQuick 2.7
//import QtGraphicalEffects 1.0
//import QtQuick.Controls 1.4
//import QtQml.Models 2.2
//Item {
//    id: root

//DelegateModel
//{
//    id:visualModel
//    model:
//        ListModel {
//            id:listModel;
//            ListElement{sequence:qsTr("1");name:"3ds max1";mode:"模式";size:"11M";time:"2018/3/30 15:10"}
//            ListElement{sequence:qsTr("2");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"12M";time:"2018/3/30 15:10"}
//            ListElement{sequence:qsTr("3");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"13M";time:"2018/3/30 15:10"}
//            ListElement{sequence:qsTr("4");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"14M";time:"2018/3/30 15:10"}
//            ListElement{sequence:qsTr("5");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"15M";time:"2018/3/30 15:10"}
//            ListElement{sequence:qsTr("6");name:"D:\work\spectrumAnalyzer\soft\pc";mode:"模式";size:"16M";time:"2018/3/30 15:10"}
//        }
//    delegate:
//        Rectangle {
//            id:item
//            property alias progressRect: progressRect
//            property bool checked: false
//            height:Com.listItemHeight
//            width:root.width-40
//            color: "#00000000"
//            ContentBorder{
//                id:borderp4
//                anchors.fill: parent
//                //visible: listView.currentIndex == index? true:false
//                visible: item.checked
//                text: ""
//                cornerWidth: 2
//            }
//            Item{
//                id:listtext1
//                width: 40
//                anchors.verticalCenter: parent.verticalCenter
//                anchors.left: parent.left
//                anchors.leftMargin: 10
//                anchors.margins: 2
//                Text {
//                    id:sequencetext
//                    font.family: "themify"
//                    font.pixelSize: Com.listviewFontPix;
//                    text:sequence
//                    color: "white"
//                    anchors.centerIn: parent
//                }
//            }
//            Item{
//                id:listtext2
//                 width: 400
//                anchors.verticalCenter: parent.verticalCenter
//                anchors.left: listtext1.right
//                anchors.margins: 2
//                Text {
//                    id:nametext
//                    font.family: "themify"
//                    font.pixelSize: Com.listviewFontPix;
//                    text:name
//                    color: "white"
//                    elide: Text.ElideMiddle
//                    anchors.centerIn: parent
//                }
//            }
//            Item {
//                id:listtext3
//                width: 100
//                anchors.verticalCenter: parent.verticalCenter
//                anchors.left: listtext2.right
//                anchors.margins: 2
//                Text {
//                    id:modetext
//                    font.family: "themify"
//                    font.pixelSize: Com.listviewFontPix;
//                    text:mode
//                    color: "white"
//                    anchors.centerIn: parent
//                }
//            }

//            Item
//            {
//                id:listtext4
//                width: 100
//                anchors.verticalCenter: parent.verticalCenter
//                anchors.left: listtext3.right
//                anchors.margins: 2
//                Text {
//                    id:sizetext
//                    font.family: "themify"
//                    font.pixelSize: Com.listviewFontPix;
//                    text:size
//                    color: "white"
//                    anchors.centerIn: parent

//                }
//            }
//            Item{
//                id:listtext5
//                width: 200
//                anchors.verticalCenter: parent.verticalCenter
//                anchors.left: listtext4.right
//                anchors.margins: 2
//                focus: true
//                Text {
//                    id:timetext
//                    font.family: "themify"
//                    font.pixelSize: Com.listviewFontPix;
//                    text:time
//                    color: "white"
//                    anchors.centerIn: parent
//                }
//            }
//            BootButton{
//                id:buttom1
//                width: 70
//                height: Com.listItemHeight-2
//                anchors.right: buttom2.left
//                anchors.rightMargin: 20
//                anchors.verticalCenter: parent.verticalCenter
//                bottomText:"重命名"
//                onClick: {
//                    console.log("重命名 clicked")

//                    GetFileList.n_indexlist = 1
//                }
//            }
//            BootButton{
//                id:buttom2
//                width: 50
//                height: Com.listItemHeight-2
//                anchors.right: buttom3.left
//                anchors.rightMargin: 20
//                anchors.verticalCenter: parent.verticalCenter
//                bottomText:"删除"
//                onClick: {
//                    console.log("删除 clicked")
//                }
//            }
//            BootButton{
//                id:buttom3
//                //radius: 15
//                //color: "black"
//                //border.color: Com.deviceFontColor
//                width: 50
//                height: Com.listItemHeight-2
//                anchors.right: progressRect.left
//                anchors.rightMargin: 20
//                anchors.verticalCenter: parent.verticalCenter
//                bottomText:"下载"
//                onClick: {
//                    console.log("下载 clicked",listView.currentItem)
////                        if(progressRect.current == true && progressRect.valuePercent != 100)
////                        {
////                            progressRect.visible = true
////                        }
////                        progressRect.valuePercent  += 5
////                        if(progressRect.valuePercent  >= 100)
////                        {
////                            progressRect.valuePercent  =0
////                        }
//                }
//            }
//            ProgressRect{
//                id:progressRect
//                property bool current: false
//                anchors.right: parent.right
//                anchors.rightMargin: 20
//                anchors.verticalCenter: parent.verticalCenter
//                valuePercent: 25
//                setWidth: 100
//                setHeight: 10
//                visible: false
//                onValuePercentChanged: {
//                    if(valuePercent >= 100)
//                    {
//                        visible = false
//                    }
//                }
//            }
//            MouseArea{
//                id:itemMouse
//                anchors.fill: parent
//                propagateComposedEvents: true
//                acceptedButtons: Qt.LeftButton | Qt.RightButton // 激活右键（别落下这个）
//                onClicked:
//                {
//                    listView.currentIndex = index    //实现点击选中
//                    progressRect.current = true
////                        item.checked = item.checked == true? false: true
//                    mouse.accepted = false
//                    if (mouse.button == Qt.RightButton && checked === true) { // 右键菜单
//                            //
//                            contentMenu.popup()
//                    }
//                }
//                    Menu { // 右键菜单
//                        //title: "Edit"
//                        id: contentMenu

//                        MenuItem {
//                            text: "下载"
//                            shortcut: "Ctrl+X"
//                            onTriggered: {GetFileList.SendIndexFromList()}
//                        }

//                        MenuItem {
//                            text: "删除"
//                            shortcut: ""
//                            onTriggered: {}
//                        }
//                    }
//                }
//        }
//}


//    ListView{
//        id:listView
////        state: "HIDE"
////        width:root.width-40
////        height:root.height-182-Com.listItemHeight
////        anchors.top: listViewTitle.bottom
////        anchors.left: parent.left
////        anchors.leftMargin: 20
//        anchors.fill: root
//        property var mouseYbegin
//        property var mouseYend
//        property bool mousePressed
//        property var currentindex


//        model: visualModel
//        interactive: false    //禁用拖到滚动
//        focus: true
//        clip: true

////        //过渡动画
////        states: [
////            State {
////                name: "HIDE"
////                PropertyChanges { target: listView; opacity:0}
////                PropertyChanges { target: listView; height:0}
////                onCompleted:{
////                    deviceSN.state = "HIDE"
////                    card.state = "HIDE"
////                    msg1r.state ="HIDE"
////                    msg2r.state ="HIDE"
////                    msg3r.state ="HIDE"
////                    msg4r.state ="HIDE"
////                    leftRightLine.state = "HIDE"
////                }
////            },
////            State {
////                name: "SHOW"
////                PropertyChanges { target: listView; opacity:1}
////                PropertyChanges { target: listView; height:root.height-120}
////                onCompleted: {
////                    listModel.append({"sequence":"3","name":"sss","mode":"模式","size":"16M","time":"2018"})
////                    listModel.append({"sequence":"3","name":"sss","mode":"模式","size":"16M","time":"2018"})
////                    listModel.append({"sequence":"3","name":"sss","mode":"模式","size":"16M","time":"2018"})
////                    listModel.append({"sequence":"3","name":"sss","mode":"模式","size":"16M","time":"2018"})
////                    listModel.append({"sequence":"3","name":"sss","mode":"模式","size":"16M","time":"2018"})
////                    listModel.append({"sequence":"3","name":"sss","mode":"模式","size":"16M","time":"2018"})
////                    listModel.append({"sequence":"3","name":"sss","mode":"模式","size":"16M","time":"2018"})
////                    //downloadview.state = "SHOW"
////                    //scrollbar.height = (1.1 - listView.visibleArea.heightRatio) * scrollbar.length
////                    //console.log("listView.height:",listView.height, "  listView.contentHeight:", listView.contentHeight , " height:", height)
////                }
////            }
////        ]
////        transitions: [
////             Transition {
////                 from: "SHOW"
////                 to: "HIDE"
////                 PropertyAnimation { properties: "opacity,height"; duration: 1500; easing.type: Easing.Linear }
////             },
////             Transition {
////                 from: "HIDE"
////                 to: "SHOW"
////                 PropertyAnimation { properties: "opacity,height"; duration: 1500; easing.type: Easing.Linear }
////             }
////        ]
//        onContentYChanged:
//        {
//            if(!scrollbar.focus){
//                scrollbar.y = scrollbar.offsetY + contentY/contentHeight * (scrollbar.length) - scrollbar.iw
//            }
//            if(listView.mousePressed)
//            {
//                for(var j =0; j< listView.contentHeight ;j+=Com.listItemHeight)
//                {

//                   listView.itemAt(0,j).checked = false
//                }

//                listView.mouseYend = listviewMouse.mouseY+listView.contentY

//                if(listView.mouseYend >= listView.mouseYbegin)
//                {
//                    for(var i =listView.mouseYbegin; i<= listView.mouseYend ;i+=Com.listItemHeight/3)
//                    {
//                        if(listView.itemAt(0,i) !== null )
//                        {
//                            //按下鼠标移动 锁定选中状态
//                            listView.itemAt(0,i).checked = true
//                        }
//                    }
//                }
//                else
//                {
//                    for(i =listView.mouseYend; i<= listView.mouseYbegin ;i+=Com.listItemHeight/3)
//                    {
//                        if(listView.itemAt(0,i) !== null )
//                        {
//                            listView.itemAt(0,i).checked = true
//                        }
//                    }
//                }
//            }
//        }
//        MouseArea{
//            id:listviewMouse
//            anchors.fill: parent
//            propagateComposedEvents: downloadview.state === "HIDE"?  true:false
//            //滚轮事件
//            onWheel: {
//                    if(wheel.angleDelta.y > 0 && downloadview.state === "HIDE")
//                    {
//                        listView.contentY -=10
//                        if(listView.contentY <= 0)
//                        {
//                            listView.contentY =0
//                        }
//                    }else
//                    {
//                        if(scrollbar.length <= listView.contentHeight && downloadview.state == "HIDE")
//                        {
//                            listView.contentY +=10
//                            if(listView.contentY >=listView.contentHeight-scrollbar.length- scrollbar.iw )
//                            {
//                                listView.contentY = listView.contentHeight-scrollbar.length- scrollbar.iw
//                            }
//                        }
//                       // scrollbar.y = scrollbar.offsetY + listView.contentY/contentHeight * (scrollbar.length) - scrollbar.iw
//                    }
//            }
//            onPressed: {
//    //                listView.childAt(mouse.x,mouse.y).checked =true
//                //listView.itemAt(mouse.x+listView.contentX,mouse.y+listView.contentY).checked = true
//                if (mouse.button === Qt.LeftButton) { // 左键
//                    listView.mousePressed =true
//                    listView.mouseYbegin = mouse.y+listView.contentY
//                    GetFileList.ClearIndexToList()
//                }
//            }
//            onMouseYChanged: {
//                if(listView.mousePressed)
//                {

//                    for(var j =0; j< listView.contentHeight ;j+=Com.listItemHeight)
//                    {
//                       listView.itemAt(0,j).checked = false
//                    }
//                    listView.mouseYend = mouse.y+listView.contentY

//                    if(listView.mouseYend >= listView.mouseYbegin)
//                    {
//                        for(var i =listView.mouseYbegin; i<= listView.mouseYend ;i+=Com.listItemHeight/3)
//                        {
//                            if(listView.itemAt(0,i) !== null )
//                            {
//                                listView.itemAt(0,i).checked = true
//                            }
//                        }
//                    }
//                    else
//                    {
//                        for(i =listView.mouseYend; i<= listView.mouseYbegin ;i+=Com.listItemHeight/3)
//                        {
//                            if(listView.itemAt(0,i) !== null )
//                            {
//                                listView.itemAt(0,i).checked = true
//                            }
//                        }
//                    }
//                }
//            }
//            onReleased: {
//                listView.mousePressed =false

//                listView.mouseYend = mouse.y+listView.contentY

//                if(listView.mouseYend >= listView.mouseYbegin)
//                {
//                    for(var i =listView.mouseYbegin; i<= listView.mouseYend ;i+=Com.listItemHeight/3)
//                    {
//                        if(listView.itemAt(0,i) !== null )
//                        {
//                            if(listView.itemAt(0,i) !== null )
//                            {
//                                if(listView.indexAt(0,i) !== listView.currentindex)
//                                {
//                                    //console.log("listView.currentindex:",listView.currentindex)
//                                    listView.currentindex = listView.indexAt(0,i)
//                                    GetFileList.AppendIndexToList(listView.currentindex);
//                                }
//                            }
//                        }
//                    }
//                }
//                else
//                {
//                    for(i =listView.mouseYend; i<= listView.mouseYbegin ;i+=Com.listItemHeight/3)
//                    {
//                       if(listView.itemAt(0,i) !== null )
//                       {
//                           if(listView.indexAt(0,i) !== listView.currentindex)
//                           {
//                               //console.log("listView.currentindex:",listView.currentindex)
//                               listView.currentindex = listView.indexAt(0,i)
//                               GetFileList.AppendIndexToList(listView.currentindex);
//                           }
//                       }
//                    }
//                }
//                listView.currentindex = undefined       //很重要，一轮选中后应当还原标识符 否则出现bug
//                GetFileList.SendIndexFromList()
//            }

//        }
//    }
//}
