^+!c::
    SendInput, ^c ; Simulate Ctrl+C to copy the selected text

    ClipWait ; Wait for the clipboard to contain data

    ; Get the directory path of the AutoHotkey script
    scriptDir := A_ScriptDir

    ; Construct the relative path to the PowerShell script
    scriptPath := scriptDir "\Add_Prefix_And_Suffix.ps1"

    ; Run the PowerShell script to modify the copied text
    RunWait, powershell.exe -ExecutionPolicy Bypass -File "%scriptPath%"

    return
