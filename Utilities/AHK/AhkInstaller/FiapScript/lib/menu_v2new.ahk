principal := Menu()

fiap := CreateFullMenu("fiap", "C:\Users\augus\FIAP", True)

alura := CreateFullMenu("alura", "C:\Users\augus\Alura", True)

principal.Add("Alura", alura)
principal.Add("Fiap", fiap)
principal.Add("Rainha", MenuHandler)
principal.Add("Python", MenuHandler)
principal.Add("Javascript", MenuHandler)
principal.Add("AHK", MenuHandler)

; Create another menu destined to become a submenu of the above menu.

; Create a submenu in the first menu (a right-arrow indicator). When the user selects it, the second menu is displayed.

num := 60

principal.SetIcon("Fiap", A_ScriptDir . "\lib\img\icons\fiap.ico", , num)
principal.setIcon("Rainha", A_ScriptDir . "\lib\img\icons\rainha.ico", , num)
principal.setIcon("Python", A_ScriptDir . "\lib\img\icons\python.ico", , num)
principal.setIcon("Javascript", A_ScriptDir . "\lib\img\icons\jsofficial.ico", , num)
principal.setIcon("AHK", A_ScriptDir . "\lib\img\icons\ahk.ico", , num)

VsCodeHandler(FilePath, Item, ItemPos, MyMenu)
{
    Run("`"C:\Program Files\Microsoft VS Code\Code.exe`"" . FilePath)
}

FiapHandler(Item, ItemPos, MyMenu)
{
    Run("`"C:\Program Files\Microsoft VS Code\Code.exe`" C:\Users\augus\FIAP\" . Item)
}

MenuHandler(Item, ItemPos, MyMenu)
{    ; V1toV2: Added bracket
    If (Item = "Fiap") {
        Run("`"C:\Program Files\Microsoft VS Code\Code.exe`" C:\Users\augus\FIAP")
    } else If (Item = "Rainha") {
        Run("`"C:\Program Files\Microsoft VS Code\Code.exe`" C:\Users\augus\Code\Projetos\Rainha")
    } else If (Item = "Python") {
        Run("`"C:\Program Files\Microsoft VS Code\Code.exe`" C:\Users\augus\Udemy\Python")
    } else If (Item = "Javascript") {
        Run("`"C:\Program Files\Microsoft VS Code\Code.exe`" C:\Users\augus\Udemy\JavaTypeScript")
    } else If (Item = "Flutter") {
        Run("`"C:\Program Files\Microsoft VS Code\Code.exe`" C:\Users\augus\Udemy\Flutter\teste")
    } else If (Item = "AHK") {
        Run("`"C:\Program Files\Microsoft VS Code\Code.exe`" C:\Users\augus\Utilities\Scripts\Testes")
    }
}    ; V1toV2: Added Bracket before hotkey or Hotstring

#u::
{    ; V1toV2: Added bracket
    principal.Show()
}    ; V1toV2: Added bracket in the end
