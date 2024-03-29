# String Methods in Python
Python is all about strings. So, naturally they have a host of methods for manipulating them. <br />
There are very few methods I left out here (like _maketrans()_ and _translate()_) because they seem too circumstantial.

Here's a quick reference for all [Python string methods](https://www.w3schools.com/python/python_ref_string.asp).

## Categories
All the string methods can be broken down into the following categories: <br />

- [Searching Strings](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Python/Data%20and%20Datatypes/String%20Methods.md#searching-strings)
- [Modifying Strings](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Python/Data%20and%20Datatypes/String%20Methods.md#modifying-strings)
- [Formatting Strings](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Python/Data%20and%20Datatypes/String%20Methods.md#formatting-strings)
- [Altering Case](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Python/Data%20and%20Datatypes/String%20Methods.md#altering-case)
- [Classifying Strings](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Python/Data%20and%20Datatypes/String%20Methods.md#classifying-strings)
- [Breaking Strings by Section and Joining Them](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Python/Data%20and%20Datatypes/String%20Methods.md#breaking-strings-by-section)
- [Miscellaneous](https://github.com/EthanC2/Notes-and-Writeups/blob/main/Python/Data%20and%20Datatypes/String%20Methods.md#miscellaneous)

## Searching Strings

### _.find()_
_.find()_ returns the index of a substring. If the string is not found, _.find()_ returns -1. <br />
Optionally, you can specify a start and end index as integers. 

```Python
text = "Arma virumque cano, Troiae qui primus ab oris..."

if text.find("goejagiae this is not a valid substring") == -1:
    print("Hmm... guess that substring wasn't in the text...")
```

### _.index()_
_.index()_ returns the index of a substring. If the string is not found, an [ValueError](https://docs.python.org/3/library/exceptions.html#ValueError) is thrown. <br />
Optionally, you can specify a start and end index as integers. 

```Python
text = "Arma virumque cano, Troiae qui primus ab oris..."

try:
    print("The index of the word 'mouse' is: ", text.index("mouse"))
except ValueError:
    print("Whoops, looks like '.index()' threw an ValueError...")
```

### _.rfind()_
_.rfind()_ returns the index of the last occurance of a substring. If the string is not found, _.find()_ returns -1. <br />
Optionally, you can specify a start and end index as integers. 

```Python
text = "this is a sentence about a sentence — isn't it a strange sentence?"

print(text.rfind("sentence"))
```

### _.rindex()_
_.rindex()_ returns the index of the last occurance of a substring. If the string is not found, an [ValueError](https://docs.python.org/3/library/exceptions.html#ValueError) is thrown.
Optionally, you can specify a start and end index as integers. 

```Python
text = "this is a sentence about a sentence — isn't it a strange sentence?"

try:
    print(text.rfind("sentence"))  # Doesn't throw
except ValueError:
    print("Hmm... looks like the sentence doesn't cointain 'sentence'") # False
```

### _.startswith()_
_.startswith()_ returns _True_ if the string starts with the given substring. <br />
Optionally, you can specify a start and end index as integers. 

```Python
sentence = "This sentence ends with the word apple"

if sentence.endswith("This"):
    print("The sentence ends with 'This'")
```

### _.endswith()_
_.endswith()_ returns _True_ if the string ends with the given substring. <br />
Optionally, you can specify a start and end index as integers. 

```Python
sentence = "This sentence ends with the word apple"

if sentence.endswith("apple"):
    print("The sentence ends with 'apple'")
```

### _.count()_
_.count()_ returns the amount of times a substring occurs in the string. <br />
You can also specify a start and end index as optional arguments.

```Python
sentence = "This is a sentence about a needle in a haystack. How many needles are in this haystack? Well, as many needles as there are."

count = sentence.count("needle")

print(f"The amount of times the word 'needle' appears in the sentence is: {count}")
```

## Modifying Strings

### _.replace()_
_.replace()_ replaces one substring with another. <br />
If the amount of substitutions is not specified, it will replace all occurances.

```Python
sentence = "This is a sentence about a needle in a haystack. How many needles are in this haystack? Well, as many needles as there are."

print(sentence.replace("needle", "shoe"))
```

## Formatting Strings

### _.strip()_, _.lstrip()_, and _.rstrip()_
Returns a new string without the whitespace on either side of the string. <br />
_.lstrip()_ and _.rstrip()_ only strip the whitespace from the left or right side of the string respectively.

```Python
text = "      this has a lot of whitespace....          "

print(text.strip())
```

### _.format()_
The _.format()_ method is the pre-Python 3.6 way to format strings. <br />
You should always use [f-strings](https://www.programiz.com/python-programming/string-interpolation) for string interpolation. <br />
_.format()_ works very much like [_printf()_](https://www.tutorialspoint.com/c_standard_library/c_function_printf.htm) from C. 

```Python
name = input("Enter your name: ")

greeting = "Hello, {}! How are you today :)?".format(name) # 'name' replaces '{}'
```

### _.format\_map()_
_.format\_map()_ formats a string automatically using a dictionary.

```Python
person_dict = {"name":"Cthulhu", "occupation":"construction worker"}

greeting =  "Hello, my name is {name} and my I am a {occupation}".format(**person_dict)
```

### _.center()_
_.center()_ returns a new string with the text centered in the middle of the amount of characters specified. <br />
Providing a character as the second argument will fill the blank space with the given character.

```Python
event = "showdown"

event = event.center(10, '.')
```

### _.ljust()_ and _.rjust()_
_.ljust()_ and _.rjust()_ left/right-justifies a string (aligns it to the left/right) to the amount of characters provided as an integer, filling any extra with spaces.
Optionally, you can provide a character as the second argument to change the character used to fill the space.

```Python
text = "some text"

print(text.ljust(50, '.'))
```

### _.zfill()_
_.zfill()_ (short for 'zero fill') pads a number with zeros until it reaches the given length.

```Python
for num in range(100):
    print(str(num).zfill(3))  # 001, 010, 100
```

### _.expandtabs()_
_.expandtabs()_ takes an integer that represents the amount of characters a space will be printed as for that strings.

```Python
tabbedstring = "\tThis\tis\ttabbed\ttext"

print(tabbedstring)                   # Default tab (8 chars)
print(tabbedstring.expandtabs())      # Default tab
print(tabbedstring.expandtabs(2))     # Two characters
print(tabbedstring.expandtabs(5))     # Five characters
```

## Altering Case

### _.capitalize()_
Returns a new string, capitalizing the first letter in the string.

```Python
sentence = "this is not a proper sentence because the first letter is not capitalized."

sentence = sentence.capitalize()
```

### _.upper()_
Returns a new string that is entirely uppercase.

```Python
text = "this is some text"

print(f"Uppercase version: {text.upper()}")
```

### _.lower()_ 
Returns a new string that is entirely lowercase.

```Python
text = "THIS IS SOME TEXT"

print(f"Lowercase version: {text.lower()}")
```

### _.swapcase()_
Changes the case of each character in the string.

```Python
text = "Mount Everest is in Nepal"

print(text.swapcase())
```

### _.title()_
Capitalized the first letter of each word.

```Python
text = "make this string a title"

print(text.title())
```

### _.casefold()_
_.casefold()_ returns a new string that is entirely lowercase. <br />
Unlike _.lower()_, _.casefold()_ works with unicode capitals.

```Python
surname = "Weißflog"

surname = surname.casefold() # Changed to 'weissflog'
```

## Classifying Strings

### _.isalpha()_
Returns _True_ if the string is alphabetic (letters a-zA-Z)

```Python
letters = "abcdefg"

if letters.isalpha():
    print("The string is alphabetic")
```

### _.isdecimal()_
_.isdecimal()_ is the most strict numeric classifier, only returning _True_ when all the characters are 0-9.

```Python
if "5599928814".isdecimal(): # True
    print("Phone numbers are considered decimal")
```

### _.isdigit()_
Returns _True_ if the number is
_.isdigit()_ is less restrictive than _.isdecimal()_ and supports some miscellaneous unicode characters like superscript 2 (², [\U+00B2](https://unicode-table.com/en/00B2/)). 

```Python
if "²".isdigit(): # True
    print("Superscript 2 is a valid digit type")
```

### _.isnumeric()_
_.isnumeric()_ is even broader and considers stuff like vulgar fractions (e.g. ½, [U+00BD](https://www.compart.com/en/unicode/U+00BD)) numeric. <br />
Though it's the broadest, even _.isnumeric()_ does not consider "-1" and "0.5" numeric since they have non-numeric characters (the minus sign and decimal point).

```Python
if "½".isnumeric(): # True
    print("Vulgar fractions are numeric characters")
```

### _.isalnum()_
Returns _True_ if both _.isalpha()_ and _.isdecimal()_ are true (if the string is alphanumeric).

```Python
num = "jeiaojg1238130751a"

if num.isalnum():
    print("The string is alphanumeric")
```

### _.islower()_
Returns _True_ if the string is entirely lowercase.

```Python
text = "This sentence is not entirely lowercase"

if not text.islower():
    print("The text is not entirely lowercase...")
```

### _.isupper()_
Returns _True_ if the string is entirely uppercase.

```Python
sentence = "HURR DE DURR YELLING"

if sentence.isupper():
    print("Stop yelling, I can't see your face and hear your voice at the same time.")
```

### _.isprintable()_
Returns _True_ if the string does not contain [unprintable characters](https://flaviocopes.com/non-printable-ascii-characters/).

```Python
text = "\0\0\0"    # '\0' is the NULL character (not printable)

if not text.isprintable():
    print("The text is not printable...")
```

### _.isspace()_
Returns _True_ if the string is entirely whitespace (tabs, newlines, spaces, etc.).

```Python
text = "\t\n " # '\t','\n', and ' ' are all whitespace

if text.isspace():
    print("The text is all whitespace")
```

### _.istitle()_
Returns _True_ if the string is lowercase except for the first letter of each word, like in a title. <br />
Only alphabetic characters on considered when evaluating whether a string _.istitle()_.

```Python
title = "Catch-22"

if title.istitle():  # True
    print("The title is a valid title...")
```

### _.isidentifier()_
Returns _True_ if the string is a valid [identifier](https://www.tutorialspoint.com/what-are-python-identifiers#:~:text=A%20Python%20identifier%20is%20a,digits%20(0%20to%209).)

```Python
var_name = "this_is_not_a_valid variable name"

if var_name.isidentifier():
    print("The string is a valid identifier")
```

## Breaking Strings by Section

### _.split()_
Another one of my favorite methods, _.split()_ splits a string into an array based on a substring (usually a single character) that you provide. By default, the string
it split on whitespace. Optionally, you can provide a max number of elements to split the string into (starting from the left).

```Python
text = "this is a short sentence."

print(text.split())
```

### _.rsplit()_
_.rsplit()_ functions like _split()_, but when it accepts a max number of elements to split the string into, it splits from the right.

```Python
text = "this is a sentence about a sentence — isn't it a strange sentence?"

print(text.rsplit("sentence", 2))
```

### _.join()_
This is easily my favorite string method. <br />
_.join()_ joins the members of an iterable object (like a list, tuple, or range) using the given string as a separator. 

```Python
countries = ["Turkey", "Sweeden", "Greece", "India", "Samoa"]

# Make 'countries' a comma-separated string
as_string = ', '.join(countries)
```

### _.splitlines()_
_.splitlines()_ splits a string into a list based on [linebreaks](https://www.programiz.com/python-programming/methods/string/splitlines) (like '\n' and '\f'). <br />
By default, _.splitlines()_ discards these characters, but you can keep them with by providing '_True_' as an argument.

```Python
text = "This is a\nmulti-line sentence"

print(text.splitlines())      # Discards '\n'
print(text.splitlines(True))  # Keeps '\n'
```

### _.partition()_
_.partition()_ splits a string into a three-part tuple based on a substring to search for. The middle of the tuple is the substring,
the first part is anything before the substring, and the last part is anything after the substring. If the substring is the beginning/end
of the string, then the first/last string of the tuple will be blank ('').

```Python
text = "aaa bbb ccc"
print(text.partition("bbb"))
```

### _.partition()_
_.rpartition()_ functions exactly like _.partition()_ but it finds the last instance of the substring.

```Python
text = "aaa bbb ccc aaa bbb"
print(text.rpartition("aaa"))
```

## Miscellaneous

### _.encode()_
_.encode()_ returns a new string, converting unicode characters to ASCII.
The way the string is encoded depends on the second argument, _errors_, which can be set to any of a set of [replacement protocols](https://www.w3schools.com/python/ref_string_encode.asp) for properly translating unicode characters.

```Python
surname = "Weißflog"

ascii_name = surname.encode()
```
