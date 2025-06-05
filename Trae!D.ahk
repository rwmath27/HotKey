; 定义 Trae 的进程名和路径
traeProcess := "Trae.exe"
traePath := "D:\Trae\Trae.exe"

; 监听 Alt + D
!D::
    ; 检查 Trae 是否在运行
    if WinExist("ahk_exe " . traeProcess)
    {
        if WinActive("ahk_exe " . traeProcess)
            WinMinimize  ; 最小化窗口
        else
            WinActivate  ; 激活窗口
    }
    else
    {
        ; Trae 未运行，尝试启动
        try {
            Run, %traePath%,, UseErrorLevel
            if (ErrorLevel = "ERROR")
                MsgBox, 无法启动Trae，请检查路径：%traePath%
        }
        catch e {
            MsgBox, 启动出错：%e%
        }
        
        ; 等待 Trae 启动，最多等 5 秒
        Loop 50
        {
            Sleep, 100
            if WinExist("ahk_exe " . traeProcess)
                break
        }
        
        ; 如果 Trae 没有成功启动，则打开记事本
        if !WinExist("ahk_exe " . traeProcess)
            Run, notepad.exe
    }

