; 定义记事本的进程名和路径
notepadProcess := "notepad.exe"
notepadPath := "C:\Windows\System32\notepad.exe"

; 监听 Alt + P
!P::
    ; 检查记事本是否在运行
    if WinExist("ahk_exe " . notepadProcess)
    {
        if WinActive("ahk_exe " . notepadProcess)
            WinMinimize  ; 最小化窗口
        else
            WinActivate  ; 激活窗口
    }
    else
    {
        ; 记事本未运行，尝试启动
        try {
            Run, %notepadPath%,, UseErrorLevel
            if (ErrorLevel = "ERROR")
                MsgBox, 无法启动记事本，请检查路径：%notepadPath%
        }
        catch e {
            MsgBox, 启动出错：%e%
        }
        
        ; 等待记事本启动，最多等 3 秒
        Loop 30
        {
            Sleep, 100
            if WinExist("ahk_exe " . notepadProcess)
                break
        }
        
        ; 如果记事本没有成功启动，则显示错误信息
        if !WinExist("ahk_exe " . notepadProcess)
            MsgBox, 无法启动记事本，请检查系统设置
    }
return