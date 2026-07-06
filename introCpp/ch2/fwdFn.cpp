#include <iostream>

int add(int x, int y); // forward declaration of add() by using fn declaration

int main() {

	std::cout << "The sum of 3 and 4 is: " << add(3, 4) << '\n'; // this works because we foward declared add() above
	return 0;
}

// even though the body of add() isn't defined until here
int add(int x, int y) {

	return x + y;
}
