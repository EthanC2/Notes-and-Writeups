# Exception Handling in C#

## Checked Keyword
The _checked_ keyword defines a statement block in which variables cannot exceed their _MaxValue_ without resulting a [_System.OverflowException_](https://docs.microsoft.com/en-us/dotnet/api/system.overflowexception?view=net-5.0) runtime error. Typically, exceeding the maximum value just begins at the minimum value again and continue, but the _checked_
keyword forces an exception to be thrown. Conversely, there is also an _unchecked_ keyword, which allows data to overflow within its block.

### Format
```C#
checked 
{
    //Body
}
```
> Reference: [C# Documentation: Checked Keyword](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/checked) <br />
> Reference: [C# Documentation: Unchecked Keyword](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/unchecked) <br />
 
### Example
```C#
checked 
{
  int maximumInteger = Int32.MaxValue;     //Int32.MaxValue == 2_147_483_647
  maximumInteger += 1;                    //Exceed the max value by 1 (throws an error)
  
  Console.WriteLine(maximumInteger);     
}
```
> Would wrap around and print -2_147_483_648, but the _checked_ block forces a _System.OverflowException_ exception
