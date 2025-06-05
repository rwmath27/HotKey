; 定义 edge 的进程名
edgeProcess := "D:\Edge\Edge\msedge.exe"

; 监听 Alt + B
!B::
    ; 检查 edge 是否在运行
    if WinExist("ahk_exe " . edgeProcess)
    {
        if WinActive("ahk_exe " . edgeProcess)
            WinMinimize  ; 最小化窗口
        else
            WinActivate  ; 激活窗口
    }
    else
    {
        ; edge 未运行，尝试启动
        Run, %edgeProcess%
        
        ; 等待 edge 启动，最多等 3 秒
        Loop 30
        {
            Sleep, 100
            if WinExist("ahk_exe " . edgeProcess)
                break
        }
        
        ; 如果 edge 没有成功启动，则打开记事本
        if !WinExist("ahk_exe " . edgeProcess)
            Run, notepad.exe
    }
return
