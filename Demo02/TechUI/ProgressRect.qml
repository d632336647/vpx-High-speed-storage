import QtQuick 2.0

Item {
    property real valuePercent: 100
    property real setWidth: 202
    property real setHeight: 32
    id:root
    state: "SHOW"
    width: setWidth
    height: setHeight
    onVisibleChanged: {
        if(visible)
        {
            root.state= "SHOW"
        }
        else
        {
            root.state= "HIDE"
        }
    }
    onValuePercentChanged: {
        progressRect.state = "MIN"
    }

    Rectangle{
        id:outline
        radius: 3
        width:202
        height:32
        color:"#00000000"
        border.color: "#2ff8f6"
        visible: true
        anchors.fill: parent
    }
    Rectangle{
        property real percent: 100
        id:progressRect
        radius: 3
        width:(parent.width-2)/100*percent
        height:parent.height-2
        color:"#2ff8f6"
        border.color: "#2ff8f6"
        //Component.onCompleted: path3Animation.start()
        visible: true
        anchors.left: outline.left
        anchors.leftMargin: 1
        anchors.top: outline.top
        anchors.topMargin: 1

        //过渡动画
        states: [
             State {
                 name: "MAX"
                 PropertyChanges { target: progressRect; percent: valuePercent}
                 onCompleted:{
                      //progressRect.state = "MIN"
                 }
             },
             State {
                 name: "MIN"
                 PropertyChanges { target: progressRect; percent: percent}
                 onCompleted: {
                       progressRect.state = "MAX"
                 }
             }
        ]

        //        transitions: [
        //             Transition {
        //                 to: "MIN"
        //                 PropertyAnimation { properties: "percent"; duration: 1; easing.type: Easing.Linear }
        //             },
        //             Transition {
        //                 to: "MAX"
        //                 PropertyAnimation { properties: "percent"; duration: 1; easing.type: Easing.OutQuart }
        //             }
        //        ]

        MouseArea{
            id:mousea
            anchors.fill: parent
            onPressed: {
                valuePercent+=10
            }
        }

    }
    BreathGlow{
        rsource: outline
        color: "#00f0ff"
        visible: true
    }

    //过渡动画
    states: [
         State {
             name: "SHOW"
             PropertyChanges { target: root; width: setWidth}
             onCompleted:{
                   //root.state = "HIDE"
                   progressRect.state =  "MAX"
             }
         },
         State {
             name: "HIDE"
             PropertyChanges { target: root; width: 0}
             onCompleted: {
                   //root.state = "SHOW"
                   progressRect.state =  "MIN"
             }
         }
    ]

    transitions: [
         Transition {
             to: "HIDE"
             PropertyAnimation { properties: "width"; duration: 2000; easing.type: Easing.OutCubic }
         },
         Transition {
             to: "SHOW"
             PropertyAnimation { properties: "width"; duration: 2000; easing.type: Easing.OutCubic }
         }
    ]

}
