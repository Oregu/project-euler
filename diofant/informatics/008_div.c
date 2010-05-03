#include<math.h>

#define FROM 70000000000755.0
#define TO	100000000000000.0

void solve();
int dsum();

int main() {
	printf("Sum of digits of 70000000000755 is %i", dsum(70000000000755.0));
	solve();
	return 0;
}

void solve() {
	
	double c = FROM;
	
	while(c < TO) {
		
		if(dsum(c) == 123) {
			printf("Possible one: %20.0f ", c);
			printf("OK\n", c);
			break;
		}
		
		c += 1237;
	}
}

int dsum(double c) {

	double rem;
	double summ = 0.0;
	
	while(c != 0) {
		summ += fmod(c, 10);
		c = floor(c/10);
	}
	
	return summ;
}
