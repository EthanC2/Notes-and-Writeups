# Operators in Powershell
> [Arithmetic Operators](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Powershell/Operators.md#arithmetic-operators) <br />
> [Assignment Operators](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Powershell/Operators.md#assignment-operators) <br />
> [Comparison Operators](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Powershell/Operators.md#comparison-operators) <br />
> [Logical Operators](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Powershell/Operators.md#logical-operators) <br />
> [Matching Operators](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Powershell/Operators.md#matching-operators) <br />
> [Container Operators](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Powershell/Operators.md#container-operators) <br />
> [Redirection Operators](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Powershell/Operators.md#redirection-operators) <br />
> [Split and Join Operators](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Powershell/Operators.md#split-and-join-operators) <br />
> [Type Operators](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Powershell/Operators.md#type-operators) <br />
> [Miscellaneous Operators](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Powershell/Operators.md#miscellaneous-operators) <br />

"An operator is a language element that you can use in a command or expression. PowerShell supports several types of operators to help you manipulate values."
\- Powershell Documentation: [about\_Operators, long description](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-7.2#long-description)

---

# [Arithmetic Operators](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_arithmetic_operators?view=powershell-7.2)
Arithmetic operators preform calculations (addition, subtraction, multiplication...)

| Operator | Function | Example | 
| -------- | -------- | ------- | 
| `+` | addition; string concatenation | `"Hello, " + "world!"` |
| `-` | subtraction | `10 - 5` |
| `*` | multiplication; string multiplication | `"^-^ "*3` |
| `/` | division | `3 / 2` |
| `%` | modulus | `7 % 2` |
| `-band` | bitwise AND | `5 -band 0` |
| `-bnot` | bitwise NOT | `-bnot 1` |
| `-bor` | bitwise OR | `5 -bor 0` |
| `-bxor` | bitwise XOR | `5 -bxor 5` |
| `-shl` | shift bits left | `5 -shl 2` |
| `-shr` | shift bits right | `5 -shr 2` |
> For integer division, don't just cast to `[int]`, since that rounds; use [math]::Floor()

---

# [Assignment Operators](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_assignment_operators?view=powershell-7.2)
Assignment operators assign a value to a variable. The assignment operator `=` can be combined with arithmetic operators to create compound operators such
as `+=`, which adds the value of the right expression to the variable instead of overwriting it.

| Operator | Function | Example | 
| -------- | -------- | ------- | 
| `=` | assigns a value to a variable | `$today = Get-Date` |
| `+=` | adds the right expression to the variable | `$count += 5` |
| `-=` | subtracts the right expression from the variable | `$total -= 5` |
| `*=` | multiplies the variable by the right expression | `$x *= 3` |
| `/=` | divides the right expression into the variable | `$digits /= 10` |
| `%=` | mods the variable by the right expression | `$index %= length` |
| `++` | increments the variable by 1 | `$count++` |
| `--` | decrements the variable by 1 | `$timer--` |

---

# [Comparison Operators](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comparison_operators?view=powershell-7.2)
Comparison operators return a boolean based on a comparison of two items.

| Operator | Function | Example | 
| -------- | -------- | ------- | 
| `-eq` | true if equals | `1 -eq 2` |
| `-ne` | true if not equal | `1 -ne 2` |
| `-gt` | true if greater than | `1 -gt 2` |
| `-ge` | true if greater than or equal to | `1 -ge 1` |
| `-lt` | true if less than | `1 -lt 2` |
| `-le` | true if less than or equal to | `1 -le 1` |

---

# [Logical Operators](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_logical_operators?view=powershell-7.2)
Logical operators are used for creating logical expressions, which may be composed of other expressions like comparisons.

| Operator | Function | Example | 
| -------- | -------- | ------- | 
| `-and` | true if _a_ and _b_ are true | `$true -and $true` |
| `-or` | true if _a_ or _b_ is true | `$true -or $false` |
| `-xor` | true if only _a_ or only _b_ is true | `$true -xor $true` |
| `-not` | inverts a boolean | `-not $false` |
| `!` | shorthand for `-not` | - |

---

# [Matching Operators](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comparison_operators?view=powershell-7.2)
Matching operators use wildcards and regular expressions to compare elements.

| Operator | Function | Example | 
| -------- | -------- | ------- | 
| `-like` | true if matches wildcard pattern | `"Hello, world!" -like "*world*"` |
| `-notlike` | true if does not match wildcard pattern | `"sourcecode.cpp" -notlike "*.txt"` |
| `-match` | true if matches regex | `if ($num -match "[0-9]{3}-[0-9]{3}-[0-9]{4}") {$valid = $true}` |
| `-notmatch` | true if does not match regex | `if ($num -notmatch "[0-9]{3}") {Write-Host "not a 3-digit number"}` |
| `-replace` | replaces regex pattern with value | `"Hello, world!" -replace "hell","****"` |
> What are [wildcards](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_wildcards?view=powershell-7.2) and [regex](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_regular_expressions?view=powershell-7.2)? <br />

---

# [Container Operators](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comparison_operators?view=powershell-7.2)
A subcategory of comparison operators, container operators determine whether or not an object is in a container. These operators are _very_ strict and virtually
only return true when an element is a complete character-for-character match to the search item. If you want a less strict option, you may want to try `-match`.

| Operator | Function | Example | 
| -------- | -------- | ------- | 
| `-contains` | true if element in collection | `$greetings -contains "hi"` |
| `-notcontains` | true if element not in collection | `$languages -notcontains "klingon"` |
| `-in` | true if element in collection | `5 -in $array` |
| `-notin` | true if element not in collection | `"charlie" -in $roster` |
> Klingon is not a language, nerd.

---

# [Type Operators](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_type_operators?view=powershell-7.2)
A subcategory of comparison operators, type operators allow you to compare type info at runtime.

| Operator | Function | Example | 
| -------- | -------- | ------- | 
| `-is` | true if _a_ and _b_ are the same type | `"hello" -is "System.String"` |
| `-isnot` | true if _a_ and _b_ are different types | `1234 -isnot "System.DateTime"` |

---

# [Redirection Operators](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_redirection?view=powershell-7.2)
Redirection allows you to control what kind of output ends up where – as well as how.

| Operator | Function | Example | 
| -------- | -------- | ------- | 
| `>` | send stream to file | `(Invoke-WebRequest "https://leetcode.com/").Content > contents.html` |
| `>>` | append stream to file | `900..999 >> numbers.txt` |
| `num>&1` | redirect stream to success stream | `Do-SomethingComplex *>&1` |
> Reference: [redirectable output streams](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_redirection?view=powershell-7.2#redirectable-output-streams)

---

# [Split and Join Operators](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Powershell/Operators.md#split-and-join-operators)
> [about\_Split](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_split?view=powershell-7.2) <br />
> [about\_Join](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_join?view=powershell-7.2) <br />

Split and join text to/from strings.

| Operator | Function | Example | 
| -------- | -------- | ------- | 
| `-split` | splits a string into substrings | `"192.168.1.1" -split "\."` |
| `-join` | joins a collection as a string | `("fname", "mname", "lname") -join " "` |

---

# [Miscellaneous Operators](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-7.2#special-operators)
A collection of operators that do not fit in any given category.

| Operator | Function | Example | 
| -------- | -------- | ------- | 
| `()` | grouping; changes precedence | `(2+2) * 4` |
| `$()` | denotes a [subexpression](https://www.youtube.com/watch?v=EYS2m4KGR0g) | `Write-Host "Array elements: $((1,2,3,4,5) -join ", ")"` |
| `@()` | denotes an array subexpression | `$firewallCommands = @(Get-Command -Name *firewall*)` |
| `@{}` | denotes a hash table subexpression | `$pet_count = @{"cow"=12; "sheep"=4; "pig"=1}` |
| `&` (prefix) | interprets a string as a command | `& "Get-ChildItem"` |
| `&` (postfix) | starts a job in the background | `Get-ChildItem &` |
| `[]` | typecasts | `[int][math]::pi` |
| `,` | declares or appends to arrays | `$arr = @(1, 2, 3)` |
| `.` | instance member access | `(Invoke-WebRequest "https://jisho.org/").Content` |
| `::` | static member access | `$pi = [math]::pi` |
| `-f` | formats a string | `"Cute {0}! I want a {1} one." -f $pet,$adjective` |
| `[]` | index access | `$arr[0] -lt $arr[1]` |
| `\|` | pipeline | `Get-Process \| SELECT processname,cpu \| WHERE cpu -ne $null \| sort` |
| `&&` | run command if prior succeeds | `Update-Help && Write-Information "Successfully updated help"` |
| `\|\|` | run command if prior fails | `Update-Help \|\| Write-Error "$(Get-Date): failed to update help"` |
| `..` | indicates range of values | `Write-Host $(1..10)` |
| `? :` | ternary: returns left if expression is true, else right | `$num -lt 20 ? "$num is less than 20" : "$num is greater than 20"` |
| `??` | returns left value if not null, otherwise right | `Write-Host "$($total ?? 0) records recovered"` |
| `??=` | assigns to left value if null | `$num ??= 0` |
| `?.` | conditional member access | `$player = $null; Write-Host $player?.Health ` |
| `?[]` | conditional subscript | `if (${arr}?[$index] -eq $null) {Write-Host "index $index has no value"}` |
> The `..` operator can also be used to slice arrays.

---

# Sources
- Powershell Documentation: [about\_Operators](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-7.2)
- Powershell Documentation: [about\_Arithmetic\_Operators](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_arithmetic_operators?view=powershell-7.2)
- Powershell Documentation: [about\_Assignment\_Operators](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_assignment_operators?view=powershell-7.2)
- Powershell Documentation: [about\_Comparison\_Operators](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comparison_operators?view=powershell-7.2)
- Powershell Documentation: [about\_Logical\_Operators](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_logical_operators?view=powershell-7.2)
- Powershell Documentation: [about\_Redirection](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_redirection?view=powershell-7.2)
- Powershell Documentation: [about\_Split](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_split?view=powershell-7.2)
- Powershell Documentation: [about\_Join](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_join?view=powershell-7.2)
- Powershell Documentation: [about\_Type_Operators](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_type_operators?view=powershell-7.2)
- MindMajix: [Powershell Operators](https://mindmajix.com/powershell-operators)
