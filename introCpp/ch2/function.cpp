#include <iostream> // for std::cout

// Definition of user-defined function doPrint()
// doPrint() is the called function in this example

void doPrint() {
    std::cout << "In doPrint()\n";
}

// Functions can call fn that call other fn

void doB() {
	std::cout << "In doB()\n";
}

void doA() {
	std::cout << "Starting doA()\n";

	doB();

	std::cout << "Ending doA()\n";
}

// Definiotn of user-defined function main()
int main() {
    std::cout << "Starting main()\n";
    doA();
    // Interrupt main() by making a function call to doPrint(). main() is the caller
    doPrint();
    doPrint(); // second time called
    std::cout << "Ending main()\n"; // This statement is executed after doPrint() ends

    return 0;
    
}

