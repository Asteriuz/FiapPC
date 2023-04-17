#Requires AutoHotkey v2.0-a
#SingleInstance Force

CreateFullMenu(menuName, mainPath, openThisFolder := False) {
    menuName := Menu()
    if (openThisFolder == True) {
        menuName.Add("Open This Folder", MenuExplorerHandler.Bind(mainPath))
        menuName.Default := "Open This Folder"
    }

    FileList := ""
    Loop Files, mainPath . "\*", "FD"
    {
        if A_LoopFileAttrib ~= "[H]"    ; Skip any file that is either H (Hidden), R (Read-only), or S (System). See ~= operator.
            continue    ; Skip this file and move on to the next one.
        if SubStr(A_LoopFileName, 1, 1) = "."    ; Skip any file that begins with a period.
            continue    ; Skip this file and move on to the next one.


        subMenu := Menu()
        if (InStr(FileExist(A_LoopFilePath), "D")) {
            Loop Files, A_LoopFilePath . "\*", "FD" {
                if A_Index == 1 {
                    subMenu.Add("Open This Folder", MenuExplorerHandler.Bind(A_LoopFileDir))
                }
                subMenu2 := Menu()
                if (InStr(FileExist(A_LoopFilePath), "D")) {
                    Loop Files, A_LoopFilePath . "\*", "FD" {
                        if A_Index == 1 {
                            subMenu2.Add("Open This Folder", MenuExplorerHandler.Bind(A_LoopFileDir))
                        }
                        if A_LoopFileName == "desktop.ini"
                            continue

                        subMenu3 := Menu()
                        if (InStr(FileExist(A_LoopFilePath), "D")) {
                            if A_Index == 1 {
                                subMenu2.Add("Open This Folder", MenuExplorerHandler.Bind(A_LoopFileDir))
                            }
                            Loop Files, A_LoopFilePath . "\*", "FD" {
                                if A_Index == 1 {
                                    subMenu3.Add("Open This Folder", MenuExplorerHandler.Bind(A_LoopFileDir))
                                }
                                if A_LoopFileName == "desktop.ini"
                                    continue
                                CreateFile(A_LoopFilePath, A_LoopFileName, subMenu3)
                            }
                            CreateMenu(A_LoopFilePath, A_LoopFileName, subMenu2, subMenu3)
                        }
                        CreateFile(A_LoopFilePath, A_LoopFileName, subMenu2)
                    }
                    if A_LoopFileName == "desktop.ini"
                        continue
                    CreateMenu(A_LoopFilePath, A_LoopFileName, subMenu, subMenu2)
                    continue
                }
                if A_LoopFileName == "desktop.ini"
                    continue
                CreateFile(A_LoopFilePath, A_LoopFileName, subMenu)
            }
        }
        CreateMenu(A_LoopFilePath, A_LoopFileName, menuName, subMenu)
    }
    return menuName
}


CreateMenu(path, name, mainMenu, childMenu) {
    filePath := path
    iconIndex := 0
    hIcon := DllCall("Shell32\ExtractAssociatedIcon", "Ptr", 0, "Str", filePath, "ShortP", iconIndex, "Ptr")
    mainMenu.Add(name, childMenu)
    mainMenu.setIcon(name, "HICON:" hIcon, , 30)
    try {
        childMenu.add("Open This Folder", MenuExplorerHandler.Bind(path))
        childMenu.Default := "Open This Folder"
    }
    catch Error as e {

    }
}

CreateFile(path, name, mainMenu) {
    filePath := path
    iconIndex := 0
    hIcon := DllCall("Shell32\ExtractAssociatedIcon", "Ptr", 0, "Str", filePath, "ShortP", iconIndex, "Ptr")
    fn := MenuExplorerHandler.Bind(A_LoopFilePath)
    mainMenu.Add(name, fn)
    mainMenu.setIcon(name, "HICON:" hIcon, , 30)
}

MenuExplorerHandler(FilePath, Item, ItemPos, MyMenu)
{
    if (IsCtrlDown := GetKeyState("ctrl")) {
        Run("C:\Program Files\Microsoft VS Code\Code.exe " . FilePath)
    }
    else if (IsCtrlDown := GetKeyState("shift")) {
        Sleep(150)
        Run("wt -d " . FilePath)
    }
    else if (IsCtrlDown := GetKeyState("del")) {
        Sleep(150)
        if (InStr(FileExist(FilePath), "D")) {
            MsgBox("Are you sure you want to delete this folder?")
            DirDelete(FilePath, 1)
            MyMenu.Delete(Item)
            MsgBox("Folder deleted")
        }
        if (InStr(FileExist(FilePath), "A")) {
            MsgBox("Are you sure you want to delete this file?")
            FileDelete(FilePath)
            MyMenu.Delete(Item)
            MsgBox("File deleted")
        }
    }
    else {
        Run(FilePath)
    }
}

principalExplorer := CreateFullMenu("principalExplorer", "C:\Users\logonrmlocal\Downloads")


#m::
{    ; V1toV2: Added bracket
    principalExplorer.Show()
}    ; V1toV2: Added bracket in the end
