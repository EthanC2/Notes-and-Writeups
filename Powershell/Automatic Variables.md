# [Automatic Variables](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_automatic_variables?view=powershell-7.2)

Automatic variables are maintained by Powershell and change based on the state of the environment; <br /> this is not a comprehensive list, just a short list of ones I use often.

| Variable | Contains | Example |
| -------- | -------- | ------- |
| `$_`/`$PSItem` | represents the current object in the pipeline | `Get-Process \| ForEach-Object {$_.CPU}` |
| `$true` | contains _true_ | `$condition = $true` |
| `$false` | contains _false_ | `$condition = $false` |
| `$null` | contains _null_ | `if ($DoesNotExist -eq $null) {Write-Host "bad var"}` |
| `$?` | true if that last command succeeded, false otherwise | `Write-Host --ThisOptionDoesNotExist; Write-Host $?` |
| `$^` | first word of the last line received | `Get-ChildItem -Attributes Hidden+Directory; Write-Host $^` |
| `$$` | last word of the last line received | `Get-ChildItem -Attributes Hidden+Directory; Write-Host $$` |
| `$LastExitCode` | contains exit status of last program | `if ($LastExitCode -eq 0) {Write-Host "EXIT_SUCCESS"}` |
| `$PWD` | full path of current directory | `$PWD -split "\\" | Select-Object -Last 1` |
| `$HOME` | full path of the user's home directory | `Get-ChildItem -Path $HOME` |
| `$Host` | the current host applications | `$Host.UI.RawUI.CursorPosition.ToString()` |
> ^ and $ represent the beginning and ends of lines <br />

# Sources
- Microsoft Powershell Documentation: [Automatic Variables](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_automatic_variables?view=powershell-7.2)
- SS64: [Powershell Automatic Variables](https://ss64.com/ps/syntax-automatic-variables.html)
- JavaTPoint: [Powershell Automatic Variables](https://www.javatpoint.com/powershell-automatic-variables)
