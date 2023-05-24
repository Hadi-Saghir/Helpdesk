Add-Type -AssemblyName System.Windows.Forms

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


# Find the index of the first occurrence of "<html>"
$index = $clipboardContent.IndexOf("<html")

# Check if the "<html>" tag is found
if ($index -ge 0) {
    # Remove the unwanted text before "<html>"
    $cleanedContent = $clipboardContent.Substring($index)

    # Find the index of the first occurrence of "<html>"
    $index = $clipboardContent.IndexOf("</body>")

    # Check if the "<html>" tag is found
    if ($index -ge 0) {

        # Remove the unwanted text before "<html>"
        $toReplace = $clipboardContent.Substring($index + 1)


        # Remove the closing </html> tag
        $cleanedContent = $cleanedContent -replace "toReplace", ""
    }

    # Read the content of the prefix.html and suffix.html files
    $prefix = Get-Content -Path ".\prefix.html" -Encoding UTF8
    $suffix = Get-Content -Path "C:\Users\hadis\Documents\GitHub\Helpdesk\suffix.html" -Encoding UTF8

    # Combine the prefix, cleaned content, and suffix
    $modifiedText = $prefix + $cleanedContent + $suffix

    # Set the modified text back to the clipboard as HTML format
    Set-ClipboardData $modifiedText $modifiedText

    Write-Host "Modified text has been copied to the clipboard:"
    Write-Host $modifiedText
} else {
    Write-Host "The '<html>' tag was not found in the clipboard content."
}
