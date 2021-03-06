# Best Practices in C#

## Checking for Null
When checking for null, always use '_is null_' instead of '_== null_' because '_== null_' has more overhead (is less efficient) and is susceptible to being overloaded,
which could result in unexpected behavior and in some cases incorrect results.
> Reference: [Jax's Code Hole: "_is null_" Versus "_== null_" in C# ](https://www.gullberg.tk/blog/is-null-versus-null-in-c/) <== Read this, seriously. <br />
> Note: The '_IL_' he refers to in the article is [_Microsoft Intermediate Language_](https://en.wikipedia.org/wiki/Common_Intermediate_Language), which is the byte-code that C# compiles to.

## Handling Sensitive Information (Passwords, SSNs, etc.)
Any time you would store sensitive information as a string, store it in a SecureString (or char array in other languages). 
To understand why strings are a security threat, you have to understand the underlying implementation. 
Strings are immutable, which means they cannot be changed after they have been declared. 
Every time you perform some string-altering process on a string, C# just creates a new string and returns that. 
The previous string is still sitting in memory until the the [garbage collector](https://docs.microsoft.com/en-us/previous-versions/dotnet/articles/ms973837(v=msdn.10)?redirectedfrom=MSDN#dotnetgcbasics_topic5) frees it,
marking it as safe to be overwritten. But that's the thing - the sensitive contents of the string aren't overwritten until that memory is used for something else. 
The sensitive contents of the string continue to sit in memory, leaving that information vulnerable to memory-imaging techniques.
The best way to avoid this problem is to simple overwrite the contents of the string like the Linux command [shred](https://en.wikipedia.org/wiki/Shred_(Unix)) does, but, again, strings aren't mutable.
The only real option to securely handle sensitive information is to use a mutable datatype and then _immediately_ overwrite its contents after you're done using it.
This process is called [data sanitization](https://www.lifewire.com/data-sanitization-methods-2626133). Luckily, C# provides a _SecureString_ class to do just that.
Out of all the techniques, personally I recommend [zero-writing](https://www.lifewire.com/data-sanitization-methods-2626133#write-zero)
as not only is it more efficient than overwriting with random characters, but it is also easy to verify that the data has been erased. <br />
> [C# Documentation: SecureString](https://docs.microsoft.com/en-us/dotnet/api/system.security.securestring?view=net-5.0). <br />
> <br />
> Reference: [C# Documentation: _SecureString.Dispose()_](https://docs.microsoft.com/en-us/dotnet/api/system.security.securestring.dispose?view=net-5.0#remarks) <br />
> The _SecureString.Dispose()_ method "writes binary zeroes to the allocated memory that contains the value of this SecureString object, then frees the allocated memory."  <br />
