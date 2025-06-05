; 定义 幕布 的进程名和路径
mubuProcess := "幕布.exe"
mubuPath := "D:\Mubu\幕布.exe"

; 监听 Alt + M
!M::
    ; 检查 幕布 是否在运行
    if WinExist("ahk_exe " . mubuProcess)
    {
        if WinActive("ahk_exe " . mubuProcess)
            WinMinimize  ; 最小化窗口
        else
            WinActivate  ; 激活窗口
    }
    else
    {
        ; 幕布 未运行，尝试启动
        try {
            Run, %mubuPath%,, UseErrorLevel
            if (ErrorLevel = "ERROR")
                MsgBox, 无法启动幕布，请检查路径：%mubuPath%
        }
        catch e {
            MsgBox, 启动出错：%e%
        }
        
        ; 等待 幕布 启动，最多等 3 秒
        Loop 300
        {
            Sleep, 100
            if WinExist("ahk_exe " . mubuProcess)
                break
        }
        
        ; 如果 幕布 没有成功启动，则打开记事本
        if !WinExist("ahk_exe " . mubuProcess)
            Run, notepad.exe
    }
return