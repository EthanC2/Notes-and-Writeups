#include <iostream>
#include <random>                       

/* Randomly selects an element from an array using an array of probability where elem 'i' in probs represents the weight for element 'i' in the array of values */
template <typename T>
T weightedRandomSelection(T values[], float probs[], std::size_t n)  //One n because 'values' and 'chance' necessarily share a size
{
    //Create + seed random number generator
    static std::random_device rd;
    static std::mt19937 RNG(rd());           
    
    //Apply a distrubtion of 0.0f-1.0f (inclusive)
    std::uniform_real_distribution<float> dist(0.0f, 1.0f);

    //Generate a random number 0.0-1.0
    float chance = dist(RNG);                      
    
    //Loop over the probabilities until you reach 0, then return whatever you land on
    for(std::size_t i=0; i < n; ++i)
    {
        //Reduce the chance by the current probability
        chance -= probs[i];      
        
        //If reached 0, return that value
        if (chance <= 0)
            return values[i];
    }
    
    //If you exhausted the loop without returning an item due to errors with floating-point rounding, return the last element
    return values[n-1];
}
