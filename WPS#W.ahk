; 定义 WPS 的进程名
wpsProcess := "wps.exe"

; 监听 Win + W
#W::
    ; 检查 WPS 是否在运行
    if WinExist("ahk_exe " . wpsProcess)
    {
        if WinActive("ahk_exe " . wpsProcess)
            WinMinimize  ; 最小化窗口
        else
            WinActivate  ; 激活窗口
    }
    else
    {
        ; WPS 未运行，尝试启动
        Run, %wpsProcess%
        
        ; 等待 WPS 启动，最多等 3 秒
        Loop 30
        {
            Sleep, 100
            if WinExist("ahk_exe " . wpsProcess)
                break
        }
        
        ; 如果 WPS 没有成功启动，则打开记事本
        if !WinExist("ahk_exe " . wpsProcess)
            Run, notepad.exe
    }
return
