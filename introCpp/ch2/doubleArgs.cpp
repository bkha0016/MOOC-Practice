#include <iostream>

int getValueFromUser(){
	std::cout << "Enter an integer: ";
	int input{};
	std::cin >> input;

	return input;
}

void printDouble(int value){
	std::cout << value << " double is: " << value * 2 << '\n';
}

int main(){
	printDouble(getValueFromUser());
	return 0;
}
