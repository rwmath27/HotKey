; 定义 Cursor 的进程名和路径
cursorProcess := "Cursor.exe"
cursorPath := "C:\Users\luowei\AppData\Local\Programs\cursor\Cursor.exe"

; 监听 Alt + T
!T::
    ; 检查 Cursor 是否在运行
    if WinExist("ahk_exe " . cursorProcess)
    {
        if WinActive("ahk_exe " . cursorProcess)
            WinMinimize  ; 最小化窗口
        else
            WinActivate  ; 激活窗口
    }
    else
    {
        ; Cursor 未运行，尝试启动
        try {
            Run, %cursorPath%,, UseErrorLevel
            if (ErrorLevel = "ERROR")
                MsgBox, 无法启动Cursor，请检查路径：%cursorPath%
        }
        catch e {
            MsgBox, 启动出错：%e%
        }
        
        ; 等待 Cursor 启动，最多等 3 秒
        Loop 30
        {
            Sleep, 100
            if WinExist("ahk_exe " . cursorProcess)
                break
        }
        
        ; 如果 Cursor 没有成功启动，则打开记事本
        if !WinExist("ahk_exe " . cursorProcess)
            Run, notepad.exe
    }
return 