; AutoHotkey v1 脚本 - 按键功能互换
; Win+Tab 与 Ctrl+Tab 功能互换
; Win+` 相当于原来的 Ctrl+Shift+Tab
; Win+数字键 与 Ctrl+数字键 功能互换

#NoEnv
#SingleInstance Force
#InstallKeybdHook
#UseHook On

; ============================================
; Win+Tab 与 Ctrl+Tab 功能互换
; ============================================

; Win+Tab 发送 Ctrl+Tab (切换标签页)
#Tab::
    SendInput {Ctrl down}{Tab}{Ctrl up}
return

; Ctrl+Tab 发送 Win+Tab (任务视图)
^Tab::
    SendInput {LWin down}{Tab}{LWin up}
return

; ============================================
; Win+` 相当于原来的 Ctrl+Shift+Tab
; ============================================

; Win+` 发送 Ctrl+Shift+Tab (反向切换标签页)
#`::
    SendInput {Ctrl down}{Shift down}{Tab}{Shift up}{Ctrl up}
return

; ============================================
; Win+数字键 与 Ctrl+数字键 功能互换
; ============================================

; Win+数字键 发送 Ctrl+数字键 (选择标签页)
#1::
    SendInput {Ctrl down}1{Ctrl up}
return

#2::
    SendInput {Ctrl down}2{Ctrl up}
return

#3::
    SendInput {Ctrl down}3{Ctrl up}
return

#4::
    SendInput {Ctrl down}4{Ctrl up}
return

#5::
    SendInput {Ctrl down}5{Ctrl up}
return

#6::
    SendInput {Ctrl down}6{Ctrl up}
return

#7::
    SendInput {Ctrl down}7{Ctrl up}
return

#8::
    SendInput {Ctrl down}8{Ctrl up}
return

#9::
    SendInput {Ctrl down}9{Ctrl up}
return

#0::
    SendInput {Ctrl down}0{Ctrl up}
return

; Ctrl+数字键 发送 Win+数字键 (启动任务栏程序)
^1::
    SendInput {LWin down}1{LWin up}
return

^2::
    SendInput {LWin down}2{LWin up}
return

^3::
    SendInput {LWin down}3{LWin up}
return

^4::
    SendInput {LWin down}4{LWin up}
return

^5::
    SendInput {LWin down}5{LWin up}
return

^6::
    SendInput {LWin down}6{LWin up}
return

^7::
    SendInput {LWin down}7{LWin up}
return

^8::
    SendInput {LWin down}8{LWin up}
return

^9::
    SendInput {LWin down}9{LWin up}
return

^0::
    SendInput {LWin down}0{LWin up}
return

; ============================================
; 脚本启动提示
; ============================================

; 脚本启动时显示提示
TrayTip, 按键互换脚本, 按键功能互换已启用, 3