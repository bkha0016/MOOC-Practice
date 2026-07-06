#include <iostream>

int getValueFromUser() {
	std::cout << "Enter an integer: ";
	int input{};
	std::cin >> input;

	return input; // return the value the user entered back to the caller


}


