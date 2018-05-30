import QtQuick 2.0

Item {
    width: 244
    height: 306
    Row{
        spacing: 20
        Column{
            //anchors.right:  changer.left
            spacing: 0
            CardImage{
                id:card1
                rotation: 180
            }
            CardImage{
                id:card2
                rotation: 180
            }
            CardImage{
                id:card3
                rotation: 180
               // visible: false
            }
        }

        Image {
            id:changer
            //anchors.top: parent.top
            //anchors.left: parent.left
            //anchors.leftMargin: 200
            source: "qrc:/rc/img/changer152r.png"
            width: 92
            height: 230
        }
        Column{
           // anchors.left:  changer.right
            spacing: 0
            CardImage{
                id:card4
                lightstate1 :false
                lightstate2 :false
            }
            CardImage{
                id:card5
                lightstate1 :true
                lightstate2 :false
//                colorOn: "red"
//                colorOff: "green"
            }
            CardImage{
                id:card6
                lightstate1 :false
                lightstate2 :false
//                colorOff: "#ff9900"
            }
        }
    }
}
