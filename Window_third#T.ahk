#t::  ; Win + T 在屏幕上三分之二和下三分之一之间切换
{
    ; 获取当前窗口状态和位置
    WinGet, WindowState, MinMax, A
    if (WindowState = 1)
        WinRestore, A
    
    ; 获取屏幕尺寸
    SysGet, MonitorWorkArea, MonitorWorkArea
    ScreenWidth := MonitorWorkAreaRight - MonitorWorkAreaLeft
    ScreenHeight := MonitorWorkAreaBottom - MonitorWorkAreaTop
    
    ; 获取当前窗口位置
    WinGetPos, WinX, WinY, WinWidth, WinHeight, A
    
    ; 如果窗口在上方，则移到下方；否则移到上方
    if (WinY < ScreenHeight / 2)
    {
        ; 移动到下三分之一
        NewWidth := ScreenWidth
        NewHeight := ScreenHeight / 3
        NewX := MonitorWorkAreaLeft
        NewY := MonitorWorkAreaBottom - NewHeight
    }
    else
    {
        ; 移动到上三分之二
        NewWidth := ScreenWidth
        NewHeight := (ScreenHeight * 2) / 3
        NewX := MonitorWorkAreaLeft
        NewY := MonitorWorkAreaTop
    }
    
    WinMove, A, , NewX, NewY, NewWidth, NewHeight
}
return