import QtQuick 2.9
import QtQuick.Controls 2.3
import linarcx.gnulium.DashBoard 1.0
import linarcx.gnulium.sortFilterProxyModel 0.1
import linarcx.gnulium.Processes 1.0

import "qrc:/components/qml/"
import "qrc:/components/js/ElementCreator.js" as JS
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/strings/DashBoardStrings.js" as Str

Column {
    id: mParent
    property int init: 0

    Processes {
        id: mProc
    }

    FontLoader {
        id: mFont
        source: CStr.fontCaviarDreams
    }

    ////// Popup
    LinArcxPopUp {
        id: mPopUp
        mWidth: appWidth / 2
        mHeight: appHeight / 2
        mImage: CStr.imgRam
        mTitle: qsTr(Str.topMemoryTitle)
        mBody: qsTr(Str.topMemoryPopUp)
    }

    ////// Content
    Rectangle {
        width: parent.width
        height: 30
        color: CStr.transparent

        Image {
            id: mLogo
            property string toolTip
            source: CStr.imgRam
            sourceSize.width: parent.height
            sourceSize.height: parent.height
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 5
            antialiasing: true

            ToolTiper {
                toolTip: CStr.referesh
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    JS.toogleGif(mGiffy, true, mTable, 0.5)
                    mProc.execTopMemory()
                    //console.log(Str.topMemoryTitle);
                }
            }
        }

        LinArcxTextField {
            id: searchBox
            width: parent.width - (mLogo.width + searchBox.anchors.leftMargin)
            height: parent.height
            anchors.top: parent.top
            anchors.left: mLogo.right
            anchors.margins: 5
            placeholderText: qsTr(Str.topMemoryTitle)
        }

        //        TableProcesses {
        //            id: mTable
        //            width: mParent.width
        //            height: mParent.height - (mLogo.height + 10)
        //            sortIndicatorVisible: true
        //            anchors.left: parent.left
        //            anchors.top: mLogo.bottom
        //            anchors.topMargin: 5
        //            z: CStr.mOne

        //            //            firstTitle: qsTr(Str.lmFirst)
        //            //            secondTitle: qsTr(Str.lmSecond)
        //            //            thirdTitle: qsTr(Str.lmThird)
        //            MouseArea {
        //                anchors.fill: parent
        //                acceptedButtons: Qt.RightButton
        //                onClicked: contextMenu.popup()
        //                Menu {
        //                    id: contextMenu
        //                    Action {
        //                        text: "Clear"
        //                        onTriggered: {
        //                            if (mTable.model) {
        //                                mTable.model.source = null
        //                            }
        //                        }
        //                        icon {
        //                            source: CStr.imgSweep
        //                            width: 20
        //                            height: 20
        //                        }
        //                    }
        //                    Action {
        //                        text: "What's This?"
        //                        onTriggered: mPopUp.open()
        //                        icon {
        //                            source: CStr.imgQuestionMark
        //                            width: 20
        //                            height: 20
        //                        }
        //                    }
        //                }
        //            }
        //        }

        //        SortFilterProxyModel {
        //            id: proxyModel
        //            sortOrder: mTable.sortIndicatorOrder
        //            sortCaseSensitivity: Qt.CaseInsensitive
        //            filterString: "*" + searchBox.text + "*"
        //            filterSyntax: SortFilterProxyModel.Wildcard
        //            filterCaseSensitivity: Qt.CaseInsensitive
        //        }

        //        Component{
        //            id : mTimer
        //            Timer {
        //                interval: Str.interval; running: true; repeat: true
        //                onTriggered:{
        //                    //JS.toogleGif(mGiffy, true, mTable, 0.5);
        //                    mProc.execProc()
        //                    //console.log(Str.topMemoryTitle);
        //                }
        //            }
        //        }

        //        Connections{
        //            target: mProc
        //            onModelReady:{
        //                JS.toogleGif(mGiffy, false, mTable, 1);
        //                var sourceModel = JS.createThreeModel(model, mParent);
        //                mTable.model = JS.createProxyModel(sourceModel, proxyModel, mTable);
        //            }
        //        }
        //        AnimatedImage {
        //            id: mGiffy
        //            z: 1
        //            width: 50
        //            height: 50
        //            opacity: 1
        //            visible: false
        //            source: CStr.gifLoader
        //            anchors.centerIn: mTable
        //        }
        Connections {
            target: mProc
            onNumChanged: {
                console.log(mProc.num)
            }
        }

        Component.onCompleted: {
            //JS.toogleGif(mGiffy, true, mTable, 0.5);
            mProc.execProc()
            console.log(mProc.num)
            //mTimer.createObject(mParent);
        }
    }
}
