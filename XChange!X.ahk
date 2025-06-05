; 定义 PDF-XChange Editor 的进程名和路径
pdfxEditProcess := "D:\Tracker_Software\PDF Editor\PDFXEdit.exe"
pdfxEditPath := "D:\Tracker_Software\PDF Editor\PDFXEdit.exe"

; 监听 Alt + X
!X::
    ; 检查 PDF-XChange Editor 是否在运行
    if WinExist("ahk_exe " . pdfxEditProcess)
    {
        if WinActive("ahk_exe " . pdfxEditProcess)
            WinMinimize  ; 最小化窗口
        else
            WinActivate  ; 激活窗口
    }
    else
    {
        ; PDF-XChange Editor 未运行，尝试启动
        try {
            Run, %pdfxEditPath%,, UseErrorLevel
            if (ErrorLevel = "ERROR")
                MsgBox, 无法启动PDF-XChange Editor，请检查路径：%pdfxEditPath%
        }
        catch e {
            MsgBox, 启动出错：%e%
        }
        
        ; 等待 PDF-XChange Editor 启动，最多等 3 秒
        Loop 30
        {
            Sleep, 100
            if WinExist("ahk_exe " . pdfxEditProcess)
                break
        }
        
        ; 如果 PDF-XChange Editor 没有成功启动，则打开记事本
        if !WinExist("ahk_exe " . pdfxEditProcess)
            Run, notepad.exe
    }
return