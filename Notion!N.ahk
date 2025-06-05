; 定义 Notion 的进程名和路径
notionProcess := "Notion.exe"
notionPath := "C:\Users\luowei\AppData\Local\Programs\Notion\Notion.exe"

; 监听 Alt + N
!N::
    ; 检查 Notion 是否在运行
    if WinExist("ahk_exe " . notionProcess)
    {
        if WinActive("ahk_exe " . notionProcess)
            WinMinimize  ; 最小化窗口
        else
            WinActivate  ; 激活窗口
    }
    else
    {
        ; Notion 未运行，尝试启动
        try {
            Run, %notionPath%,, UseErrorLevel
            if (ErrorLevel = "ERROR")
                MsgBox, 无法启动Notion，请检查路径：%notionPath%
        }
        catch e {
            MsgBox, 启动出错：%e%
        }
        
        ; 等待 Notion 启动，最多等 3 秒
        Loop 30
        {
            Sleep, 100
            if WinExist("ahk_exe " . notionProcess)
                break
        }
        
        ; 如果 Notion 没有成功启动，则打开记事本
        if !WinExist("ahk_exe " . notionProcess)
            Run, notepad.exe
    }
return