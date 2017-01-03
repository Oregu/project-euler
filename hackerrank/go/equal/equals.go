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
		sort.Ints(data[i])
		rounds := searchEqualAlgo(data[i])
		fmt.Println(rounds)
	}
}

func searchEqualAlgo(chocolates []int) int {
	// Give to everybody except second smallest, until smallest will match.
	// Continue until biggest.
	rounds := 0
	for i := 0; i < len(chocolates)-1; i++ { 
		rounds += splitRounds(chocolates[i+1] - chocolates[i])
	}
	return rounds
}

func splitRounds(difference int) int {
	fives := difference/5
	fivesLeftover := difference % 5
	twos := fivesLeftover >> 1
	twosLeftOver := fivesLeftover % 2
	return fives + twos + twosLeftOver
}
