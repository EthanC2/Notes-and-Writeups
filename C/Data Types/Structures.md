# Structures in C
Structures (colloquially called a 'struct') are a user-defined datatype that serve as a collection of variables. 
They are defined as a block of code prefaced with the [_struct_ keyword](https://www.educative.io/edpresso/what-is-a-c-struct) and end with a semi-colon.
Unlike in C++, structs in C cannot contain methods (however they can contain function pointers, which effectively emulate methods).
```C
struct Person
{
    char name[257];           // 256 is the max length of 'Display-Name' in Active Directory (256 char + '\0')
    char phone_number[15];   // 1 (country code) + 3 (area code) + 7 (telephone number) + 3 (dashes) + '\0'
};
// ^ Note the semi-colon. A struct is a definition of a datatype and so needs a semi-colon

int main(void)
{
    // Declaring an instance of 'Person'
    struct Person henry = {"Henry", "540-321-2080"};

    // Print contents of struct 'henry'
    printf("Name: %s\n", henry.name);                 
    printf("Phone number: %s\n", henry.phone_number);
    // ^ C does not name access modifiers (private, public, etc.) so everything is public

    return 0;
}
```
> Prints: <br />
> Name: Henry <br />
> Phone number: 540-321-2080 <br />
>
> 'phone_number' is of type _char_ so you can regulate the length easily (source: [random phone number generator](https://www.randomphonenumbers.com/)). <br />

## Simplifying Struct Usage with _typedef_
The [_typedef_](https://www.tutorialspoint.com/cprogramming/c_typedef.htm) keyword allows the programmer to create aliases for datatypes. If you make the definition of your
struct an alias, you won't have to write _struct_ constantly when declaring or using the struct. In larger programs, you should be careful when using _typedef_ because it 
tends to pollute the global namespace when overused; however, using _typedef_ poses no harm in smaller programs and makes your code cleaner.
```C
// Format of typedef: 'typedef <datatype> <alias>'
typedef struct Person
{
    char name[257];           // 256 is the max length of 'Display-Name' in Active Directory (256 char + '\0')
    char phone_number[15];   // 1 (country code) + 3 (area code) + 7 (telephone number) + 3 (dashes) + '\0'
} Person;

int main(void)
{
    // Declaring an instance of 'Person'
    Person henry = {"Henry", "540-321-2080"};
    // ^ No 'struct' keyword before declaration (allows for C++-like declaration)

    printf("Name: %s\n", henry.name);
    printf("Phone number: %s\n", henry.phone_number);

    return 0;
}
```

## Designed Initializers
Designed initializers all you to initialize specific members of the struct and/or initialize them in a specific order.
    
```C
#include <stdio.h>

// Format of typedef: 'typedef <datatype> <alias>'
typedef struct Person
{
    char name[257];           // 256 is the max length of 'Display-Name' in Active Directory (256 char + '\0')
    char phone_number[15];   // 1 (country code) + 3 (area code) + 7 (telephone number) + 3 (dashes) + '\0'
} Person;

int main(void)
{
    // Declaring an instance of 'Person'
    Person henry = { .phone_number = "540-321-2080", .name = "Henry" };
    // ^ No 'struct' keyword before declaration (C++-like declaration)

    printf("Name: %s\n", henry.name);
    printf("Phone number: %s\n", henry.phone_number);

    return 0;
}
```
> Prints: <br />
> Name: Henry <br />
> Phone number: 540-321-2080 <br />

## Returning Multiple Values with Structs
A function can only return one variable, but nothing's to say that the variable can't be a struct that contains 5 different variables.

```C
#include <stdio.h>
#define SIZE(array) sizeof(array) / sizeof(array[0])

// A struct of two integers (mimics tuple)
typedef struct Tuple
{
    int min;
    int max;
} Tuple;

Tuple findMinMax(int array[], int size)
{
    int min, max;

    // Initialize for comparisions
    min = max = array[0];

    // Compare all elements
    for(int i=0; i < size; i++)
    {
        // If new min.
        if (min > array[i])
            min = array[i];

        // If new max.
        if (max < array[i])
            max = array[i];
    }

    // Return an anonymous tuple
    Tuple temp = {min, max};
    return temp;
}

// DRIVER CODE
int main(void)
{
    // An array of 5 integers
    int array[5] = {35, 14, 31, 21, 6};
    Tuple minMax;

    // Find the minimum and maximum values of the array
    minMax = findMinMax(array, SIZE(array));

    // Print the min and max
    printf("Minimum: %d\n", minMax.min);
    printf("Maximum: %d\n", minMax.max);
}
```
    
## Structs within Structs
Structures can contain other structs as one of their members. As C does not have inheritance, C often uses composition is mimic inheritance; however, this only goes so far as
C does not have abstract structs nor virtual methods (or methods at all for that matter). If you find yourself using structs within structs constantly, you might want to
consider writing the project in C++.
```C
#include <stdio.h>

// Typedef enumerated types, for ease of use
typedef enum  State { Off, Idle, On } State;
typedef enum Condition { New, Good, Fair, Poor } Condition;
// ^ Always have the safest state as the first (default)

// 'Engine' struct
typedef struct Engine
{
    char manufacturer[50];
    State state;             // Engine state (Off, Idle, On)   
} Engine;

// 'Wheels' struct
typedef struct Wheels
{
    char brand[50];
    Condition condition;    // Tire condition (New, Good, Fair, Poor)
} Wheels;

// 'Car' struct
typedef struct Car
{
    // Car name
    char brand[50];

    // Nested structs as composition
    Engine engine;
    Wheels wheels;
} Car;


// DRIVER CODE \\

int main(void)
{
    // Declare and initialize a 'Car' struct
    Car tesla = {
                    .brand  = "Tesla",                              // Initialize brand
                    .engine = {"General Motors", Off},             // Initialize 'Engine' struct
                    .wheels = {"Michelin", New}                   // Initialize 'Wheels' struct
                };

    // Brand
    printf("Car brand: %s\n\n", tesla.brand);

    // Engine
    printf("Engine manufacturer: %s\n", tesla.engine.manufacturer);
    printf("Engine state: %d (Off)\n\n", tesla.engine.state);

    // Wheels
    printf("Wheel brand: %s\n", tesla.wheels.brand);
    printf("Wheel condition: %d (New)\n", tesla.wheels.condition);

    return 0;
}
```
> Prints: <br />
> Car brand: Tesla <br />
>
> Engine manufacturer: General Motors <br />
> Engine state: 0 (Off) <br />
>
> Wheel brand: Michelin <br />
> Wheel condition: 0 (New) <br />

## Struct 'Methods' via Function Pointers
Structs cannot define methods, only data; however, they can contain pointers that point to existing methods via a [function pointer](https://www.codeproject.com/Tips/800474/Function-Pointer-in-C-Struct).
Declaring a function pointer takes the format `return_type (*function_name)(parameters);` where the parameter list only contains the datatype of the arguments and not their
name. Like any other data member, function pointers must be initialized by assigning it the memory location of the function (via `&function_name`). Function pointers can be changed during runtime, allowing a single function pointer to execute many different functions. After parsing
through a number of articles, the best explanation I found on this was [_this video_](https://www.youtube.com/watch?v=cwvdT-4HT9o) by CodeVault.

```C
#include <stdio.h>

// Typedef enumerated types, for ease of use
typedef enum State { Off, Idle, On } State;
typedef enum Condition { New, Good, Fair, Poor } Condition;
// ^ Always have the safest state as the first (default)

// 'Engine' method declaration
void drive_car();

// 'Engine' struct
typedef struct Engine
{
    char manufacturer[50];
    State state;             // Engine state (Off, Idle, On)
} Engine;

// 'Wheels' struct
typedef struct Wheels
{
    char brand[50];
    Condition condition;    // Tire condition (New, Good, Fair, Poor)
} Wheels;

// 'Car' struct
typedef struct Car
{
    // Car name
    char brand[50];

    // Nested structs as composition
    Engine engine;
    Wheels wheels;

    // 'Methods'
    void (*drive)();    // Return type, pointer followed by name, then the (empty) parameter list.
    // ^ If the parameter list were not empty, then you would only put the datatype (without the names; e.g. '(int, int)')

} Car;


// *** DRIVER CODE *** \\

int main(void)
{
    // Declare and initialize a 'Car' struct (MUST be in order!)
    Car tesla = {
                    .brand  = "Tesla",                       // Initialize brand
                    .engine = {"General Motors", Off},      // Initialize 'Engine' struct
                    .wheels = {"Michelin", New},           // Initialize 'Wheels' struct
                    .drive  = &drive_car                  // 'drive' method references the 'drive_car' function
                };

    // Brand
    printf("Car brand: %s\n\n", tesla.brand);

    // Engine
    printf("Engine manufacturer: %s\n", tesla.engine.manufacturer);
    printf("Engine state: %d (Off)\n", tesla.engine.state);
    tesla.drive();      // Invoking the function pointer as if it were a method

    // Wheels
    printf("Wheel brand: %s\n", tesla.wheels.brand);
    printf("Wheel condition: %d (New)\n", tesla.wheels.condition);

    return 0;
}


// 'drive_car' method implementation
void drive_car()
{
    puts("Driving the car!\n");
}
```
> Prints: <br />
> Car brand: Tesla <br />
>
> Engine manufacturer: General Motors <br />
> Engine state: 0 (Off) <br />
> Driving the car! <br />
> 
> Wheel brand: Michelin <br />
> Wheel condition: 0 (New) <br />
