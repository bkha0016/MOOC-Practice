#include <iostream>

// int is the return type
// A return type of int means the fn will return some integer value to the caller (the specific value is not specified here)

int returnFive(){

	// the return statement provides the value that will be returned
	return 5; // return the value 5 bacak to the caller
}

int main() {

	std::cout << returnFive() << '\n'; // prints 5
	std::cout << returnFive() + 2 << '\n'; // prints 7

	returnFive(); // Okay, the val 5 is returned, but is ignored since main() doesnt do anything with it

	return 0;
}
