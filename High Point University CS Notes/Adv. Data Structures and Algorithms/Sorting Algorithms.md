# Sorting Algorithms
> By complexity: <br />
> [O(n²)](https://github.com/EthanC2/Notes-and-Writeups/blob/main/High%20Point%20University%20CS%20Notes/Adv.%20Data%20Structures%20and%20Algorithms/Sorting%20Algorithms.md#on-complexity) <br />
> [O(n log n)](https://github.com/EthanC2/Notes-and-Writeups/blob/main/High%20Point%20University%20CS%20Notes/Adv.%20Data%20Structures%20and%20Algorithms/Sorting%20Algorithms.md#on-log-n-complexity) <br />

# O(n²) Complexity

## Exchange Sort
Time Complexity: O(n²) <br />
Stable?: <br />
Best Case: <br />
Worst Case: <br />
 
```C++
template <typename T>
void Swap(T& a, T& b) noexcept  //Cannot be 'swap' (lowercase) since it's a pre-defined function
{
    T temp(move(a));
    a = move(b);
    b = move(temp);
}

//Exchange sort
template <typename T>
void exchangeSort(T array[], const size_t size)
{
    //For every element in the array
    for(size_t i=0; i < size-1; i++)
    {
        //Compare every element after it to the current element (i), swapping if needed
        for(size_t j=i+1; j < size; j++)
        {
            if (array[i] > array[j])
                Swap<T>(array[i], array[j]);
        }
    }
}
```

## Selection Sort
Time Complexity: O(n²) <br />
Stable?: <br />
Best Case: <br />
Worst Case: <br />

```C++
template <typename T>
void Swap(T& a, T& b) noexcept
{
    T temp(move(a));
    a = move(b);
    b = move(temp);
}

//Selection sort
template <typename T>
void selectionSort(T array[], const size_t size)
{
    //To keep track of the smallest number in the array
    size_t min;

    //For every element in the array
    for(size_t i=0; i < size-1; ++i)
    {
        //Set the 'smallest' number to the current index
        min = i;

        //Starting at the current index, iterate over the rest of the indices until the array is exhausted
        for(size_t j=i+1; j < size; ++j)
        {
            //If you come across a smaller number while iterating, set it to the smallest number
            if (array[j] < array[min])
                min = j;
        }

        //Swap the current index with the smallest number found
        Swap<T>(array[i], array[min]);
    }

}
```

## Bubble Sort
Time Complexity: O(n²) <br />
Stable?: Yes <br />
Best Case: <br />
Worst Case: <br />

 
```C++
//Swap function
template <typename T>
void Swap(T& a, T& b) noexcept
{
    T temp(move(a));
    a = move(b);
    b = move(temp);
}

//Bubble sort
template <typename T>
void bubbleSort(T array[], const size_t size)
{
    //For each element in the array
    for(size_t i=0; i < size-1; ++i)
    {
        //Loop over each element in the array (starting at the beginning!)
        for(size_t j=0; j < size-1; ++j)
        {
            //If you following element is smaller than the current, swap them
            if (array[j] > array[j + 1])
                Swap<T>(array[j], array[j+1]);
        }
    }
}
```

## Insertion Sort
Time Complexity: O(n²) <br />
Stable?: <br />
Best Case: <br />
Worst Case: <br />

Hah, insertion.
```C++
//Insertion sort
template <typename T>
void insertionSort(T array[], const size_t size)
{
    T key; 
    size_t iter;

    //For every element in the array (beyond the first)
    for(size_t i=1; i < size; ++i)
    {
        //Store the value of the current index in the key, and its predecessor in iter
        key = array[i];
        iter = i-1;

        //Move all the elements between the key and its spot back by 1
        while(key < array[iter] and iter >= 0)
        {
            array[iter + 1] = array[iter];
            --iter;
        }

        //Assign the extracted value (the key) to its spot
        array[iter+1] = key;
    }
}
```

# O(n log n) Complexity

## Merge Sort
Time Complexity: O(n log n) <br />
Stable?: Yes <br />
Best Case: <br />
Worst Case: <br />

```C++
//Merge
template <typename T>
void merge(T array[], const size_t l, const size_t m, const size_t r)
{
   //Declare three iterators (to span across for loops)
   size_t i, j, k;

   //Size of left and right sub-arrays
   size_t size_left = m-l+1, size_right = r-m;

   //Declare the two sub arrays
   T left[size_left], right[size_right];

   //Copy array[l...mid] into left[l..length]
   for(i = 0; i < size_left; i++)
      left[i] = array[l+i];

   //Copy array[mid+1..r] into right[1..length]
   for(j = 0; j < size_right; j++)
      right[j] = array[m+1+j];

   //Reset the counters
   i = 0; j = 0; k = l;

   //Merge temp arrays (left + right) into the to real array
   while(i < size_left and j < size_right)
   {
      //Select an element from the left or right subarray
      if(left[i] <= right[j])
      {
         array[k] = left[i];
         i++;
      }
      else
      {
         array[k] = right[j];
         j++;
      }

      //Proceed to the next element
      k++;
   }

   //Copy elements from the new sorted array into the main array
   while(i < size_left)  
   {
      array[k] = left[i];
      i++;
      k++;
   }
   while(j < size_right)
   {
      array[k] = right[j];
      j++;
      k++;
   }
}


//Merge sort
template <typename T>
void mergeSort(T array[], const size_t l, const size_t r)
{
   if(l < r)   // if (size > 1)
   {
      //Calculate the midpoint
      size_t m = l+(r-l)/2;

      //Sort first and second arrays
      mergeSort<T>(array, l, m);
      mergeSort<T>(array, m+1, r);

      //Merge
      merge<T>(array, l, m, r);
   }
}
```

## Quicksort
Time Complexity: O(n log n) <br />
Stable?: <br />
Worst Case: sorted or reveresed <br />
Best Case: Randomized <br />

Recursively divides and sorts two halves of an array based on a central 'pivot point'.
```C++
//Swap function
template <typename T>
void Swap(T& a, T& b) noexcept
{
    T temp(move(a));
    a = move(b);
    b = move(temp);
}


//Declare a pivot point -- put all smaller values before it and all larger values after it
template <typename T>
void partition(T array[], const size_t low, const size_t high, size_t& pivotpoint)
{
    //Pivotitem = given element, j = given index
    T pivotitem = array[low];
    size_t j = low;

    //Iterate over all the following elements
    for(size_t i=low+1; i <= high; i++)
    {
        //If the current element is less than the pivotitem
        if (array[i] < pivotitem)
        {
            //Increment j and swap the elements
            j++;
            Swap<T>(array[i], array[j]);
        }
    }

    //Move pivotitem to pivotpoint
    pivotpoint = j;
    Swap(array[low], array[pivotpoint]);
}


//Quicksort
template <typename T>
void quickSort(T array[], const size_t low, const size_t high)
{
    size_t pivotpoint;

    if (low < high)  //Stop sorting
    {
        //Sort the array into left and right halves
        partition<T>(array, low, high, pivotpoint);

        //Sort the left half
        quickSort<T>(array, low, pivotpoint-1);

        //Sort the right half
        quickSort<T>(array, pivotpoint+1, high);
    }
}
```
