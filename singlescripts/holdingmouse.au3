#include <GUIConstantsEx.au3>
#include <EditConstants.au3>

Opt("GUIOnEventMode", 1)  ; Change to OnEvent mode
$mainwindow = GUICreate("Nhan va giu chuot", 300, 100)
GUICtrlCreateLabel("Vi tri chuot", 10, 10)
GUICtrlCreateLabel("F3 de luu chuot", 10, 50)
GUICtrlCreateLabel("F4 de bat dau", 10, 70)
GUICtrlCreateLabel("Esc de dung giu chung", 190, 50)
$editMousePos1x = GUICtrlCreateEdit ("", 120,10, 40, 20, $ES_NUMBER)
$editMousePos1y = GUICtrlCreateEdit ("", 170,10, 40, 20, $ES_NUMBER)
GUICtrlSetState ($editMousePos1x, $GUI_DISABLE)
GUICtrlSetState ($editMousePos1y, $GUI_DISABLE)
$x = 0
$y = 0
$storedX = 0
$storedY = 0
HotKeySet("{F3}", "captureMousePos")

GUISetOnEvent($GUI_EVENT_MOUSEMOVE, "mouseMoved")
GUISetOnEvent($GUI_EVENT_CLOSE, "CLOSEClicked")
$okbutton = GUICtrlCreateButton("Exit", 120, 60, 60)
GUICtrlSetOnEvent($okbutton, "CLOSEClicked")

GUICtrlCreateLabel("Thoi gian giu chuot", 10, 30)
GUICtrlCreateLabel("(5giay*1000)", 230, 30)
$editDowntime = GUICtrlCreateEdit ("5000", 120,30, 100, 20, $ES_NUMBER)
HotKeySet("{F4}", "startMouseDown")
HotKeySet("{ESC}", "stopMouseDown")

GUISetState(@SW_SHOW)

While 1
  Sleep(1000)  ; Idle around
WEnd

Func CLOSEClicked()
  Exit
EndFunc

Func mouseMoved()
	$x = MouseGetPos ( 0 )
	$y = MouseGetPos ( 1 )
	GUICtrlSetData($editMousePos1x, $x)
	GUICtrlSetData($editMousePos1y, $y)
EndFunc
;~ MsgBox (0,"ca","ture")
Func captureMousePos()
	$storedX = MouseGetPos ( 0 )
	$storedY = MouseGetPos ( 1 )
	GUICtrlCreateLabel($storedX & ", " & $storedY, 220, 10)
EndFunc

Func startMouseDown()
	$time = GUICtrlRead($editDowntime)
	MouseMove($storedX, $storedY, 10)
	MouseDown("left" )
	Sleep($time)
	stopMouseDown()
EndFunc

Func stopMouseDown()
	MouseUp("left")
EndFunc	
