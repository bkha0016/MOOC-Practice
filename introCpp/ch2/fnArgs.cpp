#include <iostream>

// This function takes no parameters
// it does not rely on the caller for anything
void doPrint(){
	std::cout << "In doPrint()\n";
}

// This function takes one integer parameter named x
// This caller will supply the value of x
void printValue(int x){

	std::cout << x << '\n';
}

// This fn has two int parameters, one named x, and one named y
// The caller will supply the value of both x and y
int add(int x, int y) {
	return x + y;
}


// This fn has two int parameters, one named x, and one named y
// The values of x and y are passed in by the caller
void printValues(int x, int y){
	std::cout << x << '\n';
	std::cout << y << '\n';
}

int main() {
	printValues(6, 7); //This fn call has two args, 6 and 7
	return 0;
}
