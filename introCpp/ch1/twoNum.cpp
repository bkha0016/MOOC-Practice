#include <iostream>

int main()
{
    std::cout << "Enter an integer: " << std::endl;
    int num1;
    int num2;

    std::cin >> num1;

    std::cout << "Enter another integer: " << std::endl;
    std::cin >> num2;

    std::cout << num1 << " + " << num2 << " = " << (num1 + num2) << "\n";
    std::cout << num1 << " - " << num2 << " = " << (num1 - num2) << "\n";

    return 0;
}
