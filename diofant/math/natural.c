#include<math.h>

#define MX 100000

int main() {
	int a = 1;
	int b = 1;
	double n;
	double temp;
	
	for(a = 1; a < MX; a++) {
		for(b = 1; b < MX; b++) {
			
			n = a*a*a + b*b*b;
			temp = sqrt(n);
			if(temp == floor(temp)) {
				n = a*a + b*b;
				temp = pow(n, 1.0/3.0);
				if(temp == floor(temp)) {
					printf("Possible values: %i and %i\n", a, b);
				}
			}
		}
	}
	
	printf("Ok");
	return 0;
}
