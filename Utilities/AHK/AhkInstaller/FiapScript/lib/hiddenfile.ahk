RegRead, ValorHidden, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden 
if ValorHidden = 2 
  RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1 
else 
  RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2 

WinActivate, ahk_class CabinetWClass
Send, !xo
Send, ^{TAB}
ControlClick, Button17, ahk_class CabinetWClass
Send, {F5}
KeyWait, h
