; 定义 Cherry_Studio 的进程名
Cherry_StudioProcess := "D:\Cherry Studio\Cherry Studio.exe"

; 监听 Win + A
#A::
    ; 检查 Cherry_Studio 是否在运行
    if WinExist("ahk_exe " . Cherry_StudioProcess)
    {
        if WinActive("ahk_exe " . Cherry_StudioProcess)
            WinMinimize  ; 最小化窗口
        else
            WinActivate  ; 激活窗口
    }
    else
    {
        ; Cherry_Studio 未运行，尝试启动
        Run, %Cherry_StudioProcess%
        
        ; 等待 Cherry_Studio 启动，最多等 3 秒
        Loop 30
        {
            Sleep, 100
            if WinExist("ahk_exe " . Cherry_StudioProcess)
                break
        }
        
        ; 如果 Cherry_Studio 没有成功启动，则打开记事本
        if !WinExist("ahk_exe " . Cherry_StudioProcess)
            Run, notepad.exe
    }
return
