// https://www.hackerrank.com/challenges/equal

package main

import (
	"bufio"
	"fmt"
	"sort"
	"os"
)

func main() {
	reader := bufio.NewReader(os.Stdin)

	var testcases int
	fmt.Fscanf(reader, "%d\n", &testcases)
	data := make([][]int, testcases)

	for i := 0; i < testcases; i++ {
		var cointerns int
		fmt.Fscanf(reader, "%d\n", &cointerns)
		chocolates := make([]int, cointerns)
		for j := 0; j < cointerns; j++ {
			fmt.Fscanf(reader, "%d", &chocolates[j])
		}
		fmt.Fscanf(reader, "\n")
		data[i] = chocolates
	}

	for i := 0; i < len(data); i++ {
		// No need to sort, just find smallest during load.
		sort.Ints(data[i])
		rounds := searchEqualAlgo(data[i])
		fmt.Println(rounds)
	}
}

func searchEqualAlgo(chocolates []int) int {
	// Give to everybody except second smallest, until smallest will match.
	// Continue until biggest.

	// Following solution gives only minimum number of chocolates!
	// But we want to get shortest number of rounds instead.
	// So there can be more chocolates in the end, but less steps taken.
	// E.g. steps(5) == 1, but steps(3) == 2 (2, 1)
	//
	// for i := 0; i < len(chocolates)-1; i++ {
	//     rounds += steps(chocolates[i] - chocolates[0] + shift)
	// }
	//
	// So instead we want to try raising everybody chocolates to
	// biggest, biggest+1, biggest+2, biggest+3

	minRounds := 1<<31 - 1
	for i := 0; i <= 4; i++ {
		if chocolates[0] < i { break }
		rounds := rounds(chocolates, i)
		if minRounds > rounds { minRounds = rounds }
	}
	return minRounds
}

func rounds(chocolates []int, shift int) int {
	rounds := 0
	for i := 0; i < len(chocolates); i++ {
		rounds += steps(chocolates[i] - chocolates[0] + shift)
	}
	return rounds
}

func steps(difference int) int {
	fives := difference/5
	fivesLeftover := difference % 5
	twos := fivesLeftover >> 1
	twosLeftOver := fivesLeftover & 1
	return fives + twos + twosLeftOver
}
