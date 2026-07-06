#include <iostream>

// void means the fn does not return a val to the caller
void printHi() {
	std::cout << "Hi" << '\n';
}

int main() {
	printHi(); // okay: fn printHI() is called, no val is returned
	//std::cout << printHi(); // compile error
	return 0;
}
