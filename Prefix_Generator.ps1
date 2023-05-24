# Define a helper function to set clipboard data
function Set-ClipboardData {
    param (
        [string]$htmlData,
        [string]$plainTextData
    )

    [System.Windows.Forms.Clipboard]::Clear()
    $dataObject = New-Object System.Windows.Forms.DataObject
    $dataObject.SetData("HTML Format", $htmlData)
    $dataObject.SetData("Text", $plainTextData)
    [System.Windows.Forms.Clipboard]::SetDataObject($dataObject)
}

# Get the current clipboard content
$clipboardContent = [System.Windows.Forms.Clipboard]::GetText("Html")

# Set the modified text back to the clipboard as HTML format
Set-ClipboardData $clipboardContent $clipboardContent