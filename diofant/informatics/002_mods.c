#include<math.h>
#include<time.h>

int MAX=1000000;

void solve();

int main() {
	
	time_t before = time(0);
	solve();
	double diff = difftime(time(0), before);
	
	printf("Time is %f\n", diff);
	
	return 0;
}

void solve() {
	int current=1;
	int mods_count = 0;
	int prev_mods_count = 0;
	int i = 0;
	
	while(current<MAX) {
	
		mods_count = 0;
		int sqr = sqrt(current);
		for(i=1; i<sqr; i++) {
			
			if(current%i == 0)
				mods_count++;
		}
		
		if(mods_count > prev_mods_count) {
			printf("%8d Mods count: %4d\n", current, mods_count);
			prev_mods_count = mods_count;
		}
		
		current++;
	}
}
