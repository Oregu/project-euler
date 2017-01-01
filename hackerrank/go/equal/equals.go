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

	for level := 0; level < 100000000; level++ { 
		smallest := chocolates[0]
		secondSmallest := smallest
		secondSmallestIntern := 1
		for i := 1; i < len(chocolates); i++ {
			if chocolates[i] != smallest {
				secondSmallest = chocolates[i]
				secondSmallestIntern = i
				break
			}
		}

		// Finished!
		if secondSmallest == smallest {
			return level
		}

		difference := secondSmallest - smallest
		level += splitRounds(difference)

		nextRound(chocolates, secondSmallestIntern, difference)
	}

	return 0
}

func splitRounds(difference int) int {
	fives := difference/5
	fivesLeftover := difference % 5
	twos := fivesLeftover >> 1
	twosLeftOver := fivesLeftover % 2
	return fives + twos + twosLeftOver - 1
}

func nextRound(chocolates []int, intern int, chocoNum int) {
	for i := 0; i < len(chocolates); i++ {
		if i != intern {
			chocolates[i] += chocoNum
		}
	}
}