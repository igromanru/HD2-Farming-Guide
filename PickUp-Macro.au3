#RequireAdmin

#include <AutoItConstants.au3>

; How many loops of 13 pick-ups will be run
Global Const $iPickUpsCount = 4
; Change to the interaction key that you use in the game
Global Const $sInteractionKey = "F"
; Hotkey to start the pick up loop (default: F4)
Global Const $sMacroHotKey = "{F4}"
; Hotkey to cancel the macro (default: Ctrl + Q)
Global Const $sMacroCancelHotKey = "^q"
; Exit the script (default: F10)
Global Const $sExitScriptHotKey = "{F10}"

; -- Don't touch the code below unless you know what you're doing --
Global Const $sScriptName = "Helldivers 2 PickUp Macro by Igromanru"
Global Const $sGameWindow = "HELLDIVERS™ 2"
Global $bCancelMacro = False

AutoItSetOption("SendKeyDelay", 10)
AutoItSetOption("SendKeyDownDelay", 20)

HotKeySet($sMacroHotKey, "PickUpLoop") ; Hotkey to start the pick up loop
HotKeySet($sMacroCancelHotKey, "_CancelMacro") ; Ctrl + Q to cancel the macro
HotKeySet($sExitScriptHotKey, "_Exit")

Func _CancelMacro()
    $bCancelMacro = True
    BlockInput($BI_ENABLE)
EndFunc

Func _Exit()
    BlockInput($BI_ENABLE)
    Exit(0)
EndFunc

Func PickUpLoop()
    If Not WinActive($sGameWindow) Then
        Return
    EndIf

    For $i = 1 To $iPickUpsCount
        If $bCancelMacro Then
            $bCancelMacro = False
            ExitLoop
        EndIf
        ; Pick up 13 times
        BlockInput($BI_DISABLE)
        WinActivate($sGameWindow)
        For $s = 1 To 13
            If $bCancelMacro Then
                ExitLoop
            EndIf
            Send($sInteractionKey)
            Sleep(1000)
        Next
        BlockInput($BI_ENABLE)
        ; Sleep loop with ability to cancel
        if $i < $iPickUpsCount Then
            For $s = 1 To 500 ; 50 seconds + 1 from interaction sleep
                If $bCancelMacro Then
                    ExitLoop
                EndIf
                Sleep(100)
            Next
        EndIf
    Next
    MsgBox(0, $sScriptName, "PickUpLoop finished")
EndFunc

While 1
    Sleep(100)
WEnd