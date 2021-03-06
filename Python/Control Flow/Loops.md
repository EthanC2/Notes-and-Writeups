# Loops in Python
Python is simple, so it doesn't have a _do...while()_ or traditional _for()_ loop. <br />
All other loops are just variations of _for_ and _while_ loops, so you just have to modify them a bit to get different types of loops.

## _for_ Loops
In Python, for loops work a bit differently. If you wrote `for num in [1, 2, 3]` then _num_ would actually take on the values of 1, 2, and 3 while it iterated over the list.
This is what makes Python's for-loops distinct — the fact that they take on the value of element at the index in an object (1, 2, 3) instead of the value of the index itself (0, 1, 2)

Iterating over a collection like a list or a tuple
```Python
items = ["A Backpack", "A Map", "A Sword", "Boots (the monkey)", "A leopard-print bookshelf (ew)"]

# Loop over the items, where 'item' is the current item
for item in items:
    print(item)
```

Iterating over a string is done just like a list since it's also a sequence.
```Python
word = "Arrow"

for char in word:  # For every character in the word
    print(char)    # Print the current character
```

## Traditional For-loops with _range()_
The _range()_ function returns a list of integers that can be iterated over and is used for traditional for-loops. <br />
Optionally, you can provide a range of numbers and even a step if needed.

**NOTE**: _range()_ stops BEFORE the end number and does not count it. You have to add 1 to include the end number.
```Python
# Traditional For-loop
for num in range(10):  # 0-9
    print(num)
    
# Loop Starting at Non-Zero Number
for num in range(50, 61): # 50-60
    print(num)

# Looping with a Step
for num in range(10, 21, 2): # 10-20, counting by 2s
    print(num)
```

## The _enumerate()_ Function
The _enumerate()_ function is a basic _for_-loop with a counter built into it. <br />

```Python
items = ["An apple", "A bananna", "A fiddle", "A spoonful of sugar"]

for count, item in enumerate(items):
    print(f"{count}: {item}")
```

## _while_ Loops
Unlike a _for_-loop, which always has a set amount of iterations, a _while_ loop is meant to be used when the amount of iterations is unknown and should be based
on a condition instead.

```Python
response = None

# Continue the game until the user decides otherwise
while response != "no":
    print("Continuing the game...")
    response = input("Continue the game?: ")
```

## Infinite Loops with _while True:_
Putting _True_ for the condition of a loop will make an infinite loop. <br />
To stop an infinite loop, you must either use a [break](https://www.programiz.com/python-programming/break-continue) statement, or terminate the program with _ctrl_ + _c_.

```Python
i = 0

# Infinite loop
while True:
    print(i)
    i += 1
    
    # Stop the infinite loop if the number is greater than 500
    if i > 500:
        break
```
