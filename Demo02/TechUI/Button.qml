import QtQuick 2.0
import "Inc.js" as Com
Button{
    id:buttom3
    radius: 15
    color: "black"
    border.color: Com.deviceFontColor
    width: 100
    height: 30
    anchors.right: progressRect.left
    anchors.rightMargin: 20
    anchors.verticalCenter: parent.verticalCenter

    Text{
        color: Com.bootButtonColor
        text:"下载"
        font.pixelSize: 20;
        anchors.centerIn: parent
        font.family: Com.deviceFont
    }
}
