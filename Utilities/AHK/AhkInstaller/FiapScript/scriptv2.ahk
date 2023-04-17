; https://github.com/Asteriuz/PCAutomatizerAHK

#Requires AutoHotkey v2.0-a
SetNumlockState("AlwaysOff")
;SetCapsLockState, "AlwaysOff"
SetScrollLockState("AlwaysOff")
#SingleInstance


#Include %A_ScriptDir%\lib\menu_explorer.ahk
; #Include %A_ScriptDir%\lib\menu_v2new.ahk

::]help:: {
    MsgBox("# - Win`n! - Alt`n^ - Ctrl`n+ - Shift")
}

teste := 1
#t:: {
    MsgBox(teste)
    KeyWait("t")
}


#e:: {
    Run("C:\Users\logonrmlocal")
}

#d:: {
    Run("C:\Users\logonrmlocal\Downloads")
}

#HotIf (WinActive("ahk_exe Code.exe") or WinActive("ahk_exe Notepad.exe") or WinActive("ahk_exe Notepad++.exe"))
^s:: {
    Reload
    Send("^{s}")
    KeyWait("s")
}
#HotIf

#Home:: run("taskmgr.exe")

#HotIf !WinActive("ahk_exe League of Legends.exe") && !WinActive("ahk_exe javaw.exe")
^q::
{
    send("!{F4}")
    KeyWait("q")
}

#+g::
{
    Run("https://github.com/Asteriuz/PCAutomatizerAHK/tree/fiap")
    KeyWait("g")
}

#b::
{
    RunWait("C:\Program Files\Google\Chrome\Application\chrome.exe")
    Sleep(50)
    if WinActive("ahk_exe chrome.exe") {
        Sleep(100)
        ControlClick("Chrome_RenderWidgetHostHWND1", "ahk_exe chrome.exe")
    }
    KeyWait("b")
}

#+b::
{
    Run("`"C:\Program Files\Google\Chrome\Application\chrome.exe`" -incognito")
    KeyWait("b")
}

^t::
{
    Send("^t")
    if WinActive("ahk_exe chrome.exe") {
        Sleep(50)
        ControlClick("Chrome_RenderWidgetHostHWND1", "ahk_exe chrome.exe")
    }
    KeyWait("t")
}

#!Home::
{
    run("C:\Program Files\AutoHotkey\WindowSpy.ahk")
}

#Insert::
{
    run("C:\Program Files\Microsoft VS Code\Code.exe " . A_ScriptFullPath)
    KeyWait("Insert")
}

#!Insert::
{
    run("C:\Program Files\Microsoft VS Code\Code.exe " . A_ScriptDir)
    KeyWait("Insert")
}

; #HotIf WinActive("ahk_exe Code.exe")
; #+d:: {
;     run("python C:\Users\logonrmlocal\Utilities\Scripts\PythonScript\terminal.py")    ;,, Hide")
;     KeyWait("d")
; }
; #HotIf

#!v::
{
    run("C:\Users\logonrmlocal\Videos")
    KeyWait("d")
}

; #HotIf WinActive("ahk_exe Code.exe")
; inputChange := 0
; ^.:: {
;     global inputChange
;     Send("^{.}")
;     if inputChange = 0
;         run("python C:\Users\logonrmlocal\Utilities\Scripts\PythonScript\panel.py 1", , "hide")
;     else
;         run("python C:\Users\logonrmlocal\Utilities\Scripts\PythonScript\panel.py 0 ", , "hide")
;     inputChange := !inputChange
;     KeyWait(".")
; }
; #HotIf

#c::
{
    run("C:\Program Files\Microsoft VS Code\Code.exe")
}


#!c::
{
    run("calc")
}


#enter::
{
    if (WinActive("ahk_class CabinetWClass")) {
        explorerpath := ControlGetText("ToolbarWindow323", "ahk_exe explorer.exe", "Address:")
        explorerpath := StrReplace(explorerpath, "Address: ", "")
        if !InStr(explorerpath, "\") {
            Sleep(150)
            run("lib\wt.lnk -d C:\Users\logonrmlocal\" . explorerpath, , , &varpid)
            KeyWait("enter")
        }
        else {
            Sleep(150)
            run("lib\wt.lnk -d " . explorerpath, , , &varpid)
            KeyWait("enter")
        }
    } else {
        Sleep(150)
        run("lib\wt.lnk", , , &varpid)
        KeyWait("enter")
    }
}



#HotIf WinActive("ahk_exe explorer.exe")
^enter::
{
    Send("{F2}")
    KeyWait("enter")
}
#HotIf


#-::
{
    Send("{Volume_Down}")
}


#=::
{
    Send("{Volume_Up}")
}


#!s:: {
    run("powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile C:\Users\logonrmlocal\Utilities\Scripts\FinalScript\lib\changeaudio.ps1", , "hide")

    KeyWait("s")
}

#l::
{
    Sleep 1000
    SendMessage(0x112, 0xF170, 2, , "Program Manager")
}

#!PrintScreen:: {
    run("C:\Users\logonrmlocal\Pictures\Screenshots")
}


#h:: {
    Run(A_ScriptDir . "\lib\hiddenfile.ahk")
    KeyWait("h")
}


;******************************************************************************
;                             Text Replacement
;******************************************************************************

::]s::&nbsp;


::]hm::augustobb@live.com


::]gm::gutocebola@gmail.com


::]nome::Augusto Barcelos Barros


::]fiap::98078


;******************************************************************************
;		                   	Computer information
;******************************************************************************
::]id:: {
    SendInput(A_UserName)
}

; ::]ip::{
; ;   SendInput(A_IPAddress)
; }


::]comp:: {
    SendInput(A_ComputerName)
}


::]adb:: {
    SendInput("192.168.15.5:5555")
}

;******************************************************************************
;		                        	-* lines
;******************************************************************************
::]-10::----------


::]-20::--------------------


::]-30::------------------------------


::]-40::----------------------------------------


::]-50::--------------------------------------------------


::]*10::**********


::]*20::********************


::]*30::******************************


::]*40::****************************************


::]*50::**************************************************


;******************************************************************************
;	                   		Date/Time Stamps
;******************************************************************************
; ::]d::{
;   FormatTime, CurrentDate,, M/d/yyyy
;   SendInput CurrentDate
; }

; ::]dl::{
;   FormatTime(CurrentDate,, dddd, MMMM d, yyyy)
;   SendInput CurrentDate
; }

; ::]t::{
;   FormatTime, Time,, H:mm
;   sendinput Time
; }


::vsf:: {
    sendinput("te amo")
}

;******************************************************************************
;		                    	Programação
;******************************************************************************

::]inp:: {
    sendinput("int(input(`"`")")
}

::]finp:: {
    sendinput(" float(input(`"`"))")
}

::]pytestsize:: {
    A_Clipboard := FileRead(A_ScriptDir . "/lib/pytestsize.txt")
    Send("^v")
}


;******************************************************************************
;		                        Simbolos
;******************************************************************************

::]ohm:: {
    Send("{U+03A9}")
}
