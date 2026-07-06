// five() is a fn that returns the val 5

#include <iostream>

int five()
{
	return 5;
}


int main()
{
	int a{ 2 }; // initialize var a with literal value 2
	int b{ 2 + 3}; // initialize var b with computed value 5
	int c{ (2 * 3) + 4}; // initialize var c with computer value 10
	int d{ b }; // initialize var d with variable value 5
	int e{ five() }; // initialize var e with a fn return val 5

	std::cout << a << "\n" << b << "\n" << c << '\n' << d << '\n' << e;
	return 0;

}
