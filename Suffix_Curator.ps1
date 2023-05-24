# Get the current clipboard content
$clipboardContent = Get-Clipboard -TextFormatType Html

# Find the index of the first occurrence of "<html>"
$index = $clipboardContent.IndexOf("<html")

# Check if the "<html>" tag is found
if ($index -ge 0) {
    # Remove the unwanted text before "<html>"
    $cleanedContent = $clipboardContent.Substring($index)

    # Remove the closing </html> tag
    $cleanedContent = $cleanedContent -replace "</html>", ""

    # Set the modified suffix text back to the clipboard as HTML format
    $cleanedContent | Set-Clipboard -TextFormatType Html

    Write-Host "Modified suffix has been copied to the clipboard:"
    Write-Host $cleanedContent

} else {
    Write-Host "The '<html>' tag was not found in the clipboard content."
}
