#m::  ; Win + M 在合适的窗口大小位置与最大化窗口之间切换
{
    ; 其他窗口保持原有的 2/3 大小调整逻辑
    WinGet, WindowState, MinMax, A
    if (WindowState = 1)
    {
        WinRestore, A
        SysGet, MonitorWorkArea, MonitorWorkArea
        NewWidth := (MonitorWorkAreaRight - MonitorWorkAreaLeft) * 0.67
        NewHeight := (MonitorWorkAreaBottom - MonitorWorkAreaTop) * 0.67
        NewX := (A_ScreenWidth - NewWidth) / 2
        NewY := (A_ScreenHeight - NewHeight) / 2
        WinMove, A, , NewX, NewY, NewWidth, NewHeight
    }
    else
    {
        WinMaximize, A
    }
}
return