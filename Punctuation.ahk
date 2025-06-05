!,:: ; Alt+, 实现中文逗号
    clipboard_backup := ClipboardAll ; 备份当前剪贴板内容
    Clipboard := "，" ; 将中文逗号放入剪贴板
    ClipWait, 0.5 ; 等待剪贴板包含数据，最多等待0.5秒
    if ErrorLevel ; 如果等待超时
    {
        MsgBox, 无法将逗号放入剪贴板。
        Return
    }
    Send, ^v ; 发送 Ctrl+V (粘贴)
    Sleep, 200 ; 短暂等待粘贴操作完成
    Clipboard := clipboard_backup ; 恢复原始剪贴板内容
    clipboard_backup := "" ; 清空备份变量
Return

^.:: ; Ctrl+. 实现中文句号
    clipboard_backup := ClipboardAll ; 备份当前剪贴板内容
    Clipboard := "。" ; 将中文句号放入剪贴板
    ClipWait, 0.5 ; 等待剪贴板包含数据，最多等待0.5秒
    if ErrorLevel ; 如果等待超时
    {
        MsgBox, 无法将句号放入剪贴板。
        Return
    }
    Send, ^v ; 发送 Ctrl+V (粘贴)
    Sleep, 200 ; 短暂等待粘贴操作完成
    Clipboard := clipboard_backup ; 恢复原始剪贴板内容
    clipboard_backup := "" ; 清空备份变量
Return

^;:: ; Ctrl+; 实现中文冒号
    clipboard_backup := ClipboardAll ; 备份当前剪贴板内容
    Clipboard := "：" ; 将中文冒号放入剪贴板
    ClipWait, 0.5 ; 等待剪贴板包含数据，最多等待0.5秒
    if ErrorLevel ; 如果等待超时
    {
        MsgBox, 无法将冒号放入剪贴板。
        Return
    }
    Send, ^v ; 发送 Ctrl+V (粘贴)
    Sleep, 200 ; 短暂等待粘贴操作完成
    Clipboard := clipboard_backup ; 恢复原始剪贴板内容
    clipboard_backup := "" ; 清空备份变量
Return

