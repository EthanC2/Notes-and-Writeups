# A Quick Reference for Powershell Commands
> Quick Reference: <br />
> [Getting Help](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Powershell/Command%20Reference.md#getting-help) <br />

Anything in quotation marks comes directly from the built-in documentation, which is avalilable with `Get-Help -Name <commandlet>`.

# Getting Help

## Get-Command
> Aliases: gcm

"The `Get-Command` cmdlet gets all commands that are installed on the computer, including cmdlets, aliases, functions, filters, scripts, and applications."

| Option | Function | Example |
| ------ | -------- | ------- |
|  |  |  |
|  |  |  |
|  |  |  |

---

## Get-Member
> Aliases: gm

" The `Get-Member` cmdlet gets the members, the properties and methods, of objects."

| Option | Function | Example |
| ------ | -------- | ------- |
|  |  |  |
|  |  |  |
|  |  |  |

---

## Get-Help
> Aliases: man, help

"`Get-Help` gets the help content that it displays from help files on your computer. Without the help files, `Get-Help` displays only basic information about cmdlets."

| Option | Function | Example |
| ------ | -------- | ------- |
| `-Name <command>` | shows help files for a given command | `Get-Help -Name Get-ComputerInfo` |
| `-Full`, `-Detailed`, `-Examples`, <br /> `-Online`, `-Parameter <parameter>`, <br /> `-ShowWindow` | specify help info/format | `Get-Help -Name Get-Alias -ShowWindow` |

---

## Get-Alias
> Aliases: gal

| Option | Function | Example |
| ------ | -------- | ------- |
| `-Name <alias>` | lists commands related to the given name (the given alias) | `Get-Alias -Name sl*` |
| `-Definition <command>` | lists aliases related to a given cmdlet | `Get-Alias -Definition Sort-Object` |
| `-Exclude <alias>` | excludes related aliases from the search results | `Get-Alias g* -Exclude gp*` |

# Information

## Get-Service

## Get-Member

## Get-ComputerInfo

# Manipulating Information

## Sort-Object
> Aliases: 

## 