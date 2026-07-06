// Arrays can be used to provide O(1) searches using indexes
// Direct addressing would require huge array to store numbers
// Memory of most of the array elements will remain un-utilized and wasted.
// Hashing is a technique used for storing, retrieving and removing information as quick as possible
// It's a process of converting a arbitary size key into fixed sized value. The conversion is done via special function called as Hash function
// The operations supported by hasing such as storing, retrieving and removing information have average runtime complexity of O(1)

public class Hash {
    // A Hash function simply takes an arbitary size key and provides fixed size value also called as index
    // KEY ----> HASH FUNCTION ----> [index]
    // A Modular hash function simply takes a key and size, returns remainder by dividing key by size
    // The remainder is used as an index to store the key in an array of provided size

    // What is a Hash Table?
    // Its a generalized form of an array
    // It stores the data in form of key-value pair
    // It converts key to an index using hash function
    // Taking the index we store key-value in array
    // The primary operations supported by HashTable are 
    // -- put(key, value) - adds key-value pair against unique key
    // -- get(key) - get value for the provided key
    // -- remove(key) - removes the key-value pair from HashTable
    // Average running time is of O(1)
    // Java collections framework has HashMap class - if we wawnt to deal with
    // key-value pair and HashSet class if we want to deal with only keys

    // Collision Resolution Technique (Separate Chaining)
    



    public static void main(String[] args) {
        
    }
    
}
