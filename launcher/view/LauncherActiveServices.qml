import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import linarcx.gnulium.launcher 1.0

import "qrc:///util/qml/"
import "/util/js/TableCreator.js" as JS
import "strings/LauncherStrings.js" as Str
import "qrc:/strings/CoreStrings.js" as CStr

Column {
    id: mLauncherActiveServices
    spacing: 5
    width: (parent.width / 4) * 1
    height: (parent.height / 3)

    property variant mTable: ({})
    property int mIamgeSize: Str.imageSize

    Launcher{
        id: mLauncher
    }

    Row{
        Image{
            id: imgActiveServices
            width: mIamgeSize
            height: mIamgeSize
            antialiasing: true

            source: CStr.imgService
            property string toolTip

            ToolTiper {
                toolTip: CStr.referesh
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mLauncher.execActiveServices();
                    console.log(Str.activeServicetitle);
                }
            }
        }

        Rectangle{
            width: mLauncherActiveServices.width - imgActiveServices.width
            height: imgActiveServices.height
            color: CStr.transparent
            Text {
                text: qsTr(Str.activeServicetitle)
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Component{
            id: tblHardDisk
            TableView{
                width: parent.width
                height: parent.height - mIamgeSize
                sortIndicatorVisible: true
                z: Str.zTable
                TableViewColumn{
                    role: CStr.firstValue; title: qsTr(Str.lasFirst); width: parent.width / 2;
                }
                TableViewColumn{
                    role: CStr.secondValue; title: qsTr(Str.lasSecond); width: parent.width / 2;
                }
            }
        }

        Connections{
            target: mLauncher
            onModelReady:{
                JS.createTable(model, mLauncherActiveServices, mTable, JS.createTwoModel);
            }
        }

        Component.onCompleted: {
            mTable = tblHardDisk.createObject(mLauncherActiveServices);
            mLauncher.execActiveServices();
        }
    }
}
