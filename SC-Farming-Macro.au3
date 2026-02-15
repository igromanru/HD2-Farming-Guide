#RequireAdmin

; How many loops of 13 pick-ups will be run
Global Const $iPickUpsCount = 15
; Change to the interaction key that you use in the game
Global Const $sInteractionKey = "e"
; Hotkey to start the macro (default: F3)
Global Const $sMacroHotKey = "{F3}"
; Hotkey to cancel the macro (default: F4)
Global Const $sMacroCancelHotKey = "{F4}"
; Exit the script (default: F10)
Global Const $sExitScriptHotKey = "{F10}"

; Your Stratagem keys (default: z for opening the menu, and arrow keys for selection)
Global Const $sOpenStratagemListKey = "z"
Global Const $UP = "{UP}"
Global Const $DOWN = "{DOWN}"
Global Const $LEFT = "{LEFT}"
Global Const $RIGHT = "{RIGHT}"
; Stratagem selection sequence (default: Orbital Precision Strike)
Global Const $aStratagemToCall[] = [$RIGHT, $RIGHT, $UP]
; Stratagem selection sequence (default: Resupply pod)
; Global Const $aStratagemToCall[] = [$DOWN, $DOWN, $UP, $RIGHT]

; -- Don't touch the code below unless you know what you're doing --
Global Const $sScriptName = "Helldivers 2 SC Farming Macro by Igromanru"
Global Const $sGameWindow = "[TITLE:HELLDIVERS™ 2; CLASS:stingray_window]"

Global $bCancelMacro = False

#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
#include <Misc.au3>

If _Singleton($sScriptName, 1) = 0 Then
    MsgBox($MB_SYSTEMMODAL + $MB_ICONINFORMATION, "Helldivers 2 SC Farming Macros", "The script is already running.")
    Exit
EndIf

AutoItSetOption("SendKeyDelay", 10)
AutoItSetOption("SendKeyDownDelay", 20)

HotKeySet($sMacroHotKey, "_StartMacro") ; Hotkey to start the macro
HotKeySet($sMacroCancelHotKey, "_CancelMacro") ; Hotkey to cancel the macro
HotKeySet($sExitScriptHotKey, "_Exit") ; Hotkey to close the script

Func _CancelMacro()
    $bCancelMacro = True
EndFunc

Func _Exit()
    Exit(0)
EndFunc

Func PressKey($key)
    If IsString($key) Then
        Send($key)
        Sleep(15)
    EndIf
EndFunc

Func PressSequence($keySequence)
    If IsArray($keySequence) Then
        For $key In $keySequence
            PressKey($key)
        Next
    ElseIf IsString($keySequence) Then
        PressKey($keySequence)
    EndIf
EndFunc

Func OpenStratagemMenu()
    PressKey($sOpenStratagemListKey)
EndFunc

Func CallStratagem($keySequence)
    OpenStratagemMenu()
    Sleep(200)
    PressSequence($keySequence)
EndFunc

Func _StartMacro()
    If Not WinActive($sGameWindow) Then
        Return
    EndIf

    For $i = 1 To $iPickUpsCount
        If $bCancelMacro Or WinExists($sGameWindow) = 0 Then
            $bCancelMacro = False
            ExitLoop
        EndIf
        WinActivate($sGameWindow)
        CallStratagem($aStratagemToCall)
        Sleep(1000) ; Wait for the stratagem to be called
        ; Pick up 13 times
        For $s = 1 To 13
            If $bCancelMacro Or WinExists($sGameWindow) = 0 Then
                ExitLoop
            EndIf
            Send($sInteractionKey)
            Sleep(1000)
        Next

        MsgBox($MB_SYSTEMMODAL, $sScriptName, "Loop " & $i & " of " & $iPickUpsCount & " finished", 2)
        ; Sleep loop with ability to cancel
        if $i < $iPickUpsCount Then
            For $s = 1 To 450 ; 45 seconds interaction sleep
                If $bCancelMacro Then
                    ExitLoop
                EndIf
                Sleep(100)
            Next
        EndIf
    Next
    MsgBox($MB_SYSTEMMODAL + $MB_ICONINFORMATION, $sScriptName, "SC Farming loop finished")
EndFunc

While 1
    Sleep(100)
WEnd