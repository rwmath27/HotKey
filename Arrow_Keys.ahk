; Alt+IJKL 映射为方向键
; I = 上箭头
; J = 左箭头
; K = 下箭头
; L = 右箭头
; Space = Page Up

!i::Send {Up}     ; Alt+I 映射为上箭头键
!j::Send {Left}   ; Alt+J 映射为左箭头键
!k::Send {Down}   ; Alt+K 映射为下箭头键
!l::Send {Right}  ; Alt+L 映射为右箭头键
!Space::Send {PgUp} ; Alt+Space 映射为Page Up键

; 页面导航键映射 - Ctrl+Alt+IJKL 
^!i::Send {PgUp}   ; Ctrl+Alt+I 映射为Page Up
^!j::Send {Home}   ; Ctrl+Alt+J 映射为Home
^!k::Send {PgDn}   ; Ctrl+Alt+K 映射为Page Down
^!l::Send {End}    ; Ctrl+Alt+L 映射为End

+^!I::Send ^{Home}  ; Shift+Ctrl+Alt+I 移动到文档开头
+^!K::Send ^{End}   ; Shift+Ctrl+Alt+K 移动到文档末尾
+^!J::Send !{Left}  ; Shift+Ctrl+Alt+J 映射为 Alt+Left (通常是“后退”功能)
+^!L::Send !{Right} ; Shift+Ctrl+Alt+L 映射为 Alt+Right (通常是“前进”功能)