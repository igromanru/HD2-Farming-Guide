##RequireAdmin

#include <AutoItConstants.au3>

Const $iPickUpsCount = 15

HotKeySet("o", "PickUpLoop") ; Hotkey to start the pick up loop
HotKeySet("^q", "_CancelMacro") ; Ctrl + Q to cancel the macro

Const $sScriptName = "Helldivers 2 SC PickUp Macro by Igromanru"
Const $sGameWindow = "HELLDIVERS™ 2"
Global $bCancelMacro = False

AutoItSetOption("SendKeyDelay", 10)
AutoItSetOption("SendKeyDownDelay", 20)

Func _CancelMacro()
    $bCancelMacro = True
EndFunc

Func PickUpLoop()
    For $i = 1 To $iPickUpsCount
        If $bCancelMacro Then
            $bCancelMacro = False
            ExitLoop
        EndIf
        ; Pick up 13 times
        BlockInput($BI_DISABLE)
        For $s = 1 To 13
            If $bCancelMacro Then
                ExitLoop
            EndIf
            Send("F")
            Sleep(1000)
        Next
        BlockInput($BI_ENABLE)
        ; Sleep loop with ability to cancel
        if $i < $iPickUpsCount Then
            For $s = 1 To 600
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