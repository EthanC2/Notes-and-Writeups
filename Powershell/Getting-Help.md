# Getting Help in Powershell
> [Getting Command Definition (man)](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Powershell/Getting-Help.md#get-help) <br />
> [Search for Commands](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Powershell/Getting-Help.md#get-command) <br />
> [Get Command Properties and Methods](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Powershell/Getting-Help.md#get-member) <br />
> [Get Command Aliases](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Powershell/Getting-Help.md#get-alias) <br /> 

## [Get-Help](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-help?view=powershell-7.2)
> Aliases: help, man

"`Get-Help` gets the help content that it displays from help files on your computer. Without the help files, `Get-Help` displays only basic information about cmdlets."

| Option | Function | Example |
| ------ | -------- | ------- |
| `-Name <command>` | shows help files for a given command | `Get-Help -Name Get-ComputerInfo` |
| `-Full`, `-Detailed`, `-Online`, `-ShowWindow` | specify help info/format | `Get-Help -Name Get-Alias -ShowWindow` |
| `-Parameter <parameter>` | shows help for a parameter of a command | `Get-Help -Name Set-Timezone -Parameter Id` |
| `-Examples` | show examples for a command | `Get-Help Write-Output -Examples` |

---

## [Get-Command](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-command?view=powershell-7.2)
> Aliases: gcm

"The `Get-Command` cmdlet gets all commands that are installed on the computer, including cmdlets, aliases, functions, filters, scripts, and applications."

| Option | Function | Example |
| ------ | -------- | ------- |
| `-Noun <noun>` | list commands related to \<noun\> concept | `Get-Command -Noun *adapter*` |
| `-Verb <verb>` | list commands related to \<verb\> action | `Get-Command -Verb Enable*` |
| `-Type <type>` | list commands of type \<type\> (e.g. cmdlet, function...) | `Get-Command -Type Script` |
| `-Module <module>` | list commands from a specific module | `Get-Command -Module Microsoft.PowerShell.Security` |
| `(Get-Command <cmdlet>).ModuleName` | list module a command is from | `(Get-Command Get-ComputerInfo).ModuleName` |
> You can list all modules with `Get-Module -ListAvailable`.

---

## [Get-Member](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-member?view=powershell-7.2)
> Aliases: gm

"The `Get-Member` cmdlet gets the members, the properties and methods, of objects."; to use `Get-Member`, you have to pipe something into it.

| Option | Function | Example |
| ------ | -------- | ------- |
| `-Force` | ... | `...` |
| `-InputObject` | ... | `...` |
| `-MemberType` | ... | `...` |
| `-Name` | ... | `...` |
| `-Static` | ... | `...` |
| `-View` | ... | `...` |

---

## [Get-Alias](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-alias?view=powershell-7.2)
> Aliases: gal

"The `Get-Alias` cmdlet gets the aliases in the current session."

| Option | Function | Example |
| ------ | -------- | ------- |
| `-Name <alias>` | lists commands related to the given name (the given alias) | `Get-Alias -Name sl*` |
| `-Definition <command>` | lists aliases related to a given cmdlet | `Get-Alias -Definition Sort-Object` |
| `-Exclude <alias>` | excludes related aliases from the search results | `Get-Alias g* -Exclude gp*` |
