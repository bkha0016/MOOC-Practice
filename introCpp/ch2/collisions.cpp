#include <iostream> // imports the declaration of std::cout into the global scope

void foo(int x) // foo is defined in the global scope, x is defined within scope of foo()
{
	//braces used to delineate nested scope region for fn foo()
	std::cout << x << '\n';
	// x goes out of scope here

}

int main()
{
	// braces used to delineate nested scope region for fn main()
	foo(5);
	int x { 6 }; // x is defined within the scope of main()
	std::cout << x << '\n';

	return 0;

} // x goes out of scope here
// foo and main (and std::cout) go out of scope here (the end of the file)

