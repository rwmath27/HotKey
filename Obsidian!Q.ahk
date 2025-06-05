; 定义 Obsidian 的进程名和路径
obsidianProcess := "Obsidian.exe"
obsidianPath := "D:\Obsidian\Obsidian.exe"

; 监听 Alt + Q
!Q::
    ; 检查 Obsidian 是否在运行
    if WinExist("ahk_exe " . obsidianProcess)
    {
        if WinActive("ahk_exe " . obsidianProcess)
            WinMinimize  ; 最小化窗口
        else
            WinActivate  ; 激活窗口
    }
    else
    {
        ; Obsidian 未运行，尝试启动
        try {
            Run, %obsidianPath%,, UseErrorLevel
            if (ErrorLevel = "ERROR")
                MsgBox, 无法启动Obsidian，请检查路径：%obsidianPath%
        }
        catch e {
            MsgBox, 启动出错：%e%
        }
        
        ; 等待 Obsidian 启动，最多等 3 秒
        Loop 30
        {
            Sleep, 100
            if WinExist("ahk_exe " . obsidianProcess)
                break
        }
        
        ; 如果 Obsidian 没有成功启动，则打开记事本
        if !WinExist("ahk_exe " . obsidianProcess)
            Run, notepad.exe
    }
return