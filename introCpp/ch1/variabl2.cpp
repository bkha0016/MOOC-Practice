#include <iostream>

int main()
{
	int width; // define a variable named width
	width = 5; // copy assignment of value 5 into variable width

	std::cout << width; // prints 5
	// variable width now has value 5

	width = 7; // change value stored in variabled width to 7

	std::cout << width; // prints 7

	// Different forms of initialization
	int a; // default-intialization (no initializer)

	// Traditional initialization forms:
	int b = 5; // copy-initialization (initial value after equals sign)
	int c ( 6 ); // direct-initialization (initial value in parenthesis)

	// modern initialization forms (preferred):
	int d { 7 }; // direct-list-initialization (initial value in braces)
	int e {}; // value-initialization (empty braces)

	// [[maybe_unusde]] attribute, allows the compiler tells that we're okay with a variable being unused
	[[maybe_unused]] double pi { 3.14159 }; // Don't complaun if pi is unused
	[[maybe_unused]] double gravity { 9.8 }; // Don't complain if gavity is unused
	[[maybe_unused]] double phi { 1.61803 }; // Don't complain if phi is unused

	std::cout << pi << '\n';
	std::cout << phi << '\n';

	// The compiler will no longer warn about gravity not being used

	return 0;

}
