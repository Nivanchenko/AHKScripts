
GetTextMode(Mode){
if (Mode = True) 
    {
        TextMode := "vi"
    }
else 
    {
        TextMode := "normal"
    }
return TextMode
}

NotifyMode(Mode){
    TextMode := GetTextMode(Mode)
    ToolTip, mode %TextMode%
    SetTimer, RemoveToolTip, -1000
}

RemoveToolTip:
ToolTip
return

; True - normal
; False - insert
current_mode := False

!Space::
current_mode := not current_mode
NotifyMode(current_mode)

Return

CapsLock::
current_mode := True
NotifyMode(current_mode)
return

; LAlt::
; current_mode := True
; NotifyMode(current_mode)
; KeyWait, LAlt
; current_mode := False
; NotifyMode(current_mode)
; return

#if (current_mode = True)
h::Left
j::Down
k::Up
l::Right

0::Home
4::End

w::^Right
e::^Right
b::^Left

o::
Send, {End}{Return}
current_mode := False
NotifyMode(current_mode)
return

+o::
Send, {Up}{End}{Return}
current_mode := False
NotifyMode(current_mode)
return

d::Delete

y::^c
p::^v

u::^z

i::
current_mode := False
NotifyMode(current_mode)
return

a::
Send, {Right}
current_mode := False
NotifyMode(current_mode)
return

Return::
Send, {Return}
current_mode := False
NotifyMode(current_mode)
return
