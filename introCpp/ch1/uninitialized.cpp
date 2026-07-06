#include <iostream>

// using it to trick the compiler into thinking varibale x is used
void doNothing(int&) {}


int main()
{
	// define an integer variable named x
	int x; // this variable is unintialized because we haven't given it a value

	doNothing(x); // make the compiler think we're assigning a value to this variable
	// print the value of x to the screen
	std::cout << x << '\n'; // who knows what we'll get, because x is unintialized

	return 0;

}
