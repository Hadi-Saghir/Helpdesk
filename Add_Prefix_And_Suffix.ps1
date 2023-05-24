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

       # Define the regular expression pattern
    $pattern = '(?ms)(?<=<!--StartFragment-->).*?(?=<!--EndFragment-->)'

    # Extract the content between the HTML comments
    $content = [regex]::Match($clipboardContent, $pattern).Value

    # Output the extracted content
    $content

    # Get the current working directory
    $currentDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path

    # Specify the relative paths to the files
    $prefixPath = Join-Path -Path $currentDirectory -ChildPath "prefix.html"
    $suffixPath = Join-Path -Path $currentDirectory -ChildPath "suffix.html"

    # Read the file contents using relative paths
    $prefix = Get-Content -Path $prefixPath -Encoding UTF8
    $suffix = Get-Content -Path $suffixPath -Encoding UTF8

    # Combine the prefix, cleaned content, and suffix
    $modifiedText = $prefix + $content + $suffix

    # Set the modified text back to the clipboard as HTML format
    Set-ClipboardData $modifiedText $modifiedText

    Write-Host "Modified text has been copied to the clipboard:"
    Write-Host $modifiedText
} else {
    Write-Host "The '<html>' tag was not found in the clipboard content."
}
