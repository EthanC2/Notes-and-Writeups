# Exception Handling in C++
Exceptions are errors that occur during runtime, like a failure to allocate heap memory because there wasn't enough memory left ([_bad\_alloc_](https://www.cplusplus.com/reference/new/bad_alloc/)); exceptions can be managed through a process called _exception handling_. Exception handling allows you to deal
with errors in a way that allows the program to continue running seamlessly (hopefully). Sometimes, an exception cannot be truly 'recovered' from, but can only be dealt with,
in which case exception handing allows a graceful solution to be achieved.

Exception handling is preferable to only error checking (C-style error handling) as exception handling is distinct from the rest of the code and cannot be confused with
standard control flow; moreover, exception handling does not require the programmer to implcitly know that some generic _if_ statment is meant to handle an error because
the exception handling makes it abundently apparent.

## Basic Error Handling with _try_ and _catch_
Exception handling is fundamentally built upon two keywords: _try_ and _catch_. _try_ defines a block of code within which the programmer expects
an error may occur and _catch_ catches the error, defining a block that runs after the error occurs. When an exception is raised, the program immediately
exits the _try_ block and jumps to the relevant _catch_ block; the remaining statement in the _try_ block are ignored.

In the following example, the _catch_ statement catches a built-in error [_bad\_alloc_](https://www.cplusplus.com/reference/new/bad_alloc/),
which is implicitly thrown when `new int[9223372036854775]` fails. If there were no catch _try_/_catch_ block, then the program would have crashed
with the following message: <br />

_"terminate called after throwing an instance of 'std::bad_alloc'. <br />
what():  std::bad\_alloc.  <br />
Aborted (core dumped)"_ <br />

```C++
try
{
  //Always fails, array size is too large (~9.223 quadrillion bytes or 8 petabytes)
  int* massiveArray = new int[9223372036854775];
}
catch(bad_alloc)  //Fatal error caught, now the program won't crash.
{
  clog << "Error: array could not be allocated...\n";   //Report the error
}
```

## Manually Throwing Errors with _throw_
If you want to catch anything other than an error thrown by the program itself, you'll have to do it manually with the _throw_ keyword. If you know Python,
think of _throw_ as the [_raise_](https://stackoverflow.com/questions/2052390/manually-raising-throwing-an-exception-in-python) keyword. You can throw any datatype 
in C++, integers, doubles, strings, classes, but you cannot have two catch blocks with the same datatype; if you do, then the second one will never be executed.
This problem is solved by exception classes, which you can read about [here](https://github.com/EthanC2/Notes-and-Writeups/blob/main/C%2B%2B/Exception%20Handling/Exception%20Classes.md).

This program catches a division by zero error (floating point exception), which would have crashed the program and caused a core dump. <br />
When the _throw_ statement is executed, the execution immediately jumps to the appropriate _catch_ block.
```C++
#include <iostream>
#include <string>
using namespace std;

int main()
{
    double numerator, denominator, result;

    //Get the numerator and denominator from the user
    cout << "Enter the numerator and denominator: ";
    cin >> numerator >> denominator;

    /*
        User enters '10' for the numerator
        and '0' for the denominator.
    */

    try
    {
        //Throw error?
        if (denominator == 0)
            throw string("you cannot divide by zero.");  //'string' is a class and has a constructor

        //Never executed since denominator is thrown
        result = numerator / denominator;
    }
    catch(const string& errMsg)   //Catch ANY thrown string
    {
        //Error message, so use clog instead of cout
        clog << "Error: " << errMsg << '\n'; 
        result = 0;
    }

    //Print result of the division
    cout << "Result: " << result << '\n';

    return 0;
}
```

## _try_ and _catch_ Blocks and Scope
_try_ and _catch_ blocks apply to anything that happens within the _try_ block, even if an error is thrown within a function in the _try_ block. Be careful with this, 
as calling a function that has a _throw_ statement in it without having it in a _try_ block may result in an unhandled exception, crashing the program.

```C++
#include <iostream>
using namespace std;

void print100(int argument)
{
    if (argument != 100)
        throw invalid_argument("argument was not 100");

    //If valid (100), print the argument
    cout << argument << '\n';
}

int main()
{
    try
    {
        //Throws 'invalid_argument' from inside 'print100()'
        print100(97);
    }
    catch(const invalid_argument& e)  //Catches 'invalid_argument' from 'print100()'
    {
        cout << "Error: " << e.what() << '\n';
    }

    return 0;
}
```

## Catching All Errors with an Elipsis
The ellipsis operator, ..., can be used as a general catch-all. Think of it as Python's [_except Exception_](https://docs.python.org/3/tutorial/errors.html) 
or Java's [_Throwable_](https://www.geeksforgeeks.org/throwable-class-in-java-with-examples/). <br />
If you are in CSC-1720, this will be on your test.

```C++
#include <iostream>
#include <string>
using namespace std;

int main()
{
    double numerator, denominator, result;

    //Get the numerator and denominator from the user
    cout << "Enter the numerator and denominator: ";
    cin >> numerator >> denominator;

    /*
        User enters '10' for the numerator
        and '0' for the denominator.
    */

    try
    {
        //Throw error?
        if (denominator == 0)
            throw string("you cannot divide by zero.");  //'string' is a class and has a constructor

        //Never executed since denominator is thrown
        result = numerator / denominator;
    }
    catch(...)   //Catch ANYTHING
    {
        //Error message, so use clog instead of cout
        clog << "An error has occured...\n";
        result = 0;
    }

    //Print result of the division
    cout << "Result: " << result << '\n';

    return 0;
}
```


## Sources
cplusplus.com: [_Exceptions_](https://www.cplusplus.com/doc/tutorial/exceptions/) <br />
cplusplus.com: [_std::exception_](https://www.cplusplus.com/reference/exception/exception/) <br />
TutorialsPoint: [_C++ Exception Handling_](https://www.tutorialspoint.com/cplusplus/cpp_exceptions_handling.htm) <br />
GeeksforGeeks: [_Exception Handling in C++_](https://www.geeksforgeeks.org/exception-handling-c/) <br />
Microsoft C++ Documentation: [_Modern C++ best practices for exceptions and error handling (2020)_](https://docs.microsoft.com/en-us/cpp/cpp/errors-and-exception-handling-modern-cpp?view=msvc-160) <br />
isocpp.org: [_Exceptions and Error Handling_](https://isocpp.org/wiki/faq/exceptions) <br />
cplusplus.com: [_assert_](https://www.cplusplus.com/reference/cassert/assert/) <br />
StackOverflow: [_Why should I use asserts?_](https://stackoverflow.com/questions/1081409/why-should-i-use-asserts) <br />
TutorialCup: [_Exception Handling in C++_](https://www.tutorialcup.com/cplusplus/exception-handling.htm) <br />
CPPReference: [_std::exception_](https://en.cppreference.com/w/cpp/error/exception) <br />
