#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Jasatai

 Script Function:
	autoclicker der langsame inputs macht

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <AutoItConstants.au3>
$exitButton = InputBox("button mapping", "exit button")
$startButton = InputBox("button mapping", "start autoclicker button")
$stopButton = InputBox("button mapping", "stop autoclicker button")

If $exitButton == "" Then
	$exitButton = "{ESC}"
EndIf
If $startButton == "" Then
	$startButton = "1"
EndIf
If $stopButton == "" Then
	$stopButton = "2"
EndIf

HotKeySet($exitButton, "_Terminate")
HotKeySet($startButton, "on")
HotKeySet($stopButton, "off")

$ttip = $exitButton & " to Exit" & @CRLF & $startButton & " to start" & @CRLF & $stopButton & " to stop"
ToolTip($ttip,0,0,"Stoped")

Func _Terminate()
	Exit
EndFunc   ;==>_Terminate

$onOff = 0
$lastPosition = MouseGetPos()
$lastPosition = mousegetpos()

$sleepTime = InputBox("Delay Input", "time in milliseconds to wait between the clicks")

Func on()
	ToolTip($ttip,0,0,"Running...")
	$onOff = 1
	$lastPosition = mousegetpos()
	While ($onOff == 1)
		If ($lastPosition[0] == mousegetpos()[0]) And ($lastPosition[1] == MouseGetPos()[1]) Then
			ConsoleWrite($lastPosition[0] & ", " & $lastPosition[1] & @TAB & " is equal to " & mousegetpos()[0] & ", " & mousegetpos()[1] & @CRLF)
			MouseDown($MOUSE_CLICK_LEFT) ; Set the left mouse button state as down.
			MouseUp($MOUSE_CLICK_LEFT) ; Set the left mouse button state as up.EndFunc
			Sleep($sleepTime)
		Else
			off()
		EndIf
	WEnd
EndFunc
Func off()
	$onOff = 0
	ToolTip($ttip,0,0,"Stoped")
EndFunc

While 1
	Sleep(1000)
WEnd