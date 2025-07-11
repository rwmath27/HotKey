; 定义 Chrome 的进程名
chromeProcess := "D:\Chrome_doc\Chrome\App\chrome_doc.exe"

; 监听 Alt + D
!D::
    ; 检查 Chrome 是否在运行
    if WinExist("ahk_exe " . chromeProcess)
    {
        if WinActive("ahk_exe " . chromeProcess)
            WinMinimize  ; 最小化窗口
        else
            WinActivate  ; 激活窗口
    }
    else
    {
        ; Chrome 未运行，尝试启动
        Run, %chromeProcess%
        
        ; 等待 Chrome 启动，最多等 3 秒
        Loop 30
        {
            Sleep, 100
            if WinExist("ahk_exe " . chromeProcess)
                break
        }
        
        ; 如果 Chrome 没有成功启动，则打开记事本
        if !WinExist("ahk_exe " . chromeProcess)
            Run, notepad.exe
    }
return
