; 定义 VSCode 的进程名和路径
VSCodeProcess := "Code.exe"
VSCodePath := "D:\Microsoft VS Code\Code.exe"

; 监听 Alt + C
!C::
    ; 检查 VSCode 是否在运行
    if WinExist("ahk_exe " . VSCodeProcess)
    {
        if WinActive("ahk_exe " . VSCodeProcess)
            WinMinimize  ; 最小化窗口
        else
            WinActivate  ; 激活窗口
    }
    else
    {
        ; VSCode 未运行，尝试启动
        try {
            Run, %VSCodePath%,, UseErrorLevel
            if (ErrorLevel = "ERROR")
                MsgBox, 无法启动VSCode，请检查路径：%VSCodePath%
        }
        catch e {
            MsgBox, 启动出错：%e%
        }
        
        ; 等待 VSCode 启动，最多等 3 秒
        Loop 30
        {
            Sleep, 100
            if WinExist("ahk_exe " . VSCodeProcess)
                break
        }
        
        ; 如果 VSCode 没有成功启动，则打开记事本
        if !WinExist("ahk_exe " . VSCodeProcess)
            Run, notepad.exe
    }
return