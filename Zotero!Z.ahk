; 定义 Zotero 的进程名
ZoteroProcess := "zotero.exe"

; 监听 Alt + Z
!z::
    ; 检查 Zotero 是否在运行
    if WinExist("ahk_exe " . ZoteroProcess)
    {
        if WinActive("ahk_exe " . ZoteroProcess)
            WinMinimize  ; 最小化窗口
        else
            WinActivate  ; 激活窗口
    }
    else
    {
        ; Zotero 未运行，尝试启动
        Run, %ZoteroProcess%
        
        ; 等待 Zotero 启动，最多等 3 秒
        Loop 30
        {
            Sleep, 100
            if WinExist("ahk_exe " . ZoteroProcess)
                break
        }
        
        ; 如果 Zotero 没有成功启动，则打开记事本
        if !WinExist("ahk_exe " . ZoteroProcess)
            Run, notepad.exe
    }
return
