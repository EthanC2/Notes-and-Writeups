# Output Operations in C#

## Console.Write()
_Console.Write()_ displays the given string/value to the console.
```C#
//Print "Console.Write() leaves the cursor where it is" to the screen
Console.Write("Console.Write() leaves the cursor where it is");
```

## Console.WriteLine()
_Console.WriteLine()_ writes the given string/vaue to the console, ending the line after it finishes.
```C#
//Print "Console.WriteLine implicitly ends the line" and then end the line
Console.WriteLine("Console.WriteLine implicitly ends the line");
```
> Note: Use a _Console.WriteLine("")_ as a newline as [the newline character behaves differently on different operating systems](https://support.nesi.org.nz/hc/en-gb/articles/218032857-Converting-from-Windows-style-to-UNIX-style-line-endings)

## Console.Clear()
_Console.Clear()_ clears the screen.
```C#
using System.Threading;

Console.WriteLine("Some text...");
Thread.Sleep(1000);  //wait for 1s

Console.WriteLine("Clearing the screen!");
Thread.Sleep(1000);  //wait for 1s

Console.Clear();   //clear the screen
```
> The _Sleep()_ method is under the _System.Threading_. The time is measured in milliseconds, so 1000 is 1 second, 2000 is 2 seconds, etc.

## Formatting Strings with Variables
Strings can be formatted with the contents of variables by providing the variables (set off by commas) after the string. <br />
Put the ordinal position of the variable inside of curly braces (_{ }_) to replace said expression with the variable's content. <br />
Alternatively, you can use [interpolated strings](https://github.com/EthanC2/Notes-and-Writeups/blob/main/C%23/DataTypes/Strings.md) (the mordern, more common way). <br />
```C#
//Variables
string name = "human";
string creature = "person";

//Print a string, replacing the {num} with the variable contents
Console.WriteLine("Hello, my name is {0}, and I am a {1}", name, creature);
Console.WriteLine("Hello, I am a {1} and my name is {0}", name, creature)

//Using interpolated strings
Console.WriteLine($"Hello, my name is {name} and I am a {creature}");  //Note the $ at the beginning of the string
```
