#include <iostream>
#include <cmath>

using namespace std;

int main()

{
	const double x = -4.8;
	const double y = 17.5;
	const double z = 3.2;

	const auto a = (y*z*x*x) - z / sin(2 * (x / y));
	const auto b = z * exp(-sqrt(z))*(cos(y*x / z)*cos(y*x / z));

	cout << a << ' ' << b;
}
