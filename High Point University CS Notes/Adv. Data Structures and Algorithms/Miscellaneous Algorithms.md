# Miscellaneous Algorithms

## Fibonacci Sequence (Iterative)

```C++
//Alias: 'ULL' is a shorthand for 'unsigned long long'
using ULL = unsigned long long;

ULL fib(ULL n = 0)
{
    ULL previous = 1, current = 1, next;

    //If 'n' is 0 or 1, return the appropriate number
    if (n <= 1)
        return n;

    //Calculate the Fibonacci number
    for(int i = 3; i <= n; i++)  //Starting at the third iteration (skips the first two)
    {
        next = previous + current;
        previous = current;
        current = next;
    }

    return next;
}
```

## Fibonacci Sequence (Recursive)

```C++
//Alias: 'ULL' is a shorthand for 'unsigned long long'
using ULL = unsigned long long;

ULL fib(ULL n = 0)
{
    //If reached the beginning of the Fibonacci sequence
    if (n < 2)
        return n;

    //Calculate the previous two steps in the Fibonacci sequence
    return fib(n-1) + fib(n-2);
}
```
