# Get the current clipboard content
$clipboardContent = Get-Clipboard -TextFormatType Html

# Find the index of the first occurrence of "<html"
$index = $clipboardContent.IndexOf("<html")

# Check if the "<html" tag is found
if ($index -ge 0) {
    # Remove the unwanted text before "<html"
    $prefix = $clipboardContent.Substring($index)


    # Remove the closing </html> tag
    $prefix = $prefix -replace "</html>", ""

    # Set the modified suffix text back to the clipboard as HTML format
    $prefix | Set-Clipboard -TextFormatType Html

    Write-Host "Modified prefix has been copied to the clipboard:"
    Write-Host $prefix

} else {
    Write-Host "The '<html>' tag was not found in the clipboard content."
}


Write-Host "Modified prefix has been copied to the clipboard:"
Write-Host $prefix