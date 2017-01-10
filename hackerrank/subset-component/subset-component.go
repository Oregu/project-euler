// https://www.hackerrank.com/challenges/subset-component

package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	reader := bufio.NewReader(os.Stdin)

	var N int
	fmt.Fscanf(reader, "%d\n", &N)
	numbers := make([]int, N)
	for i := 0; i < N; i++ {
		fmt.Fscanf(reader, "%d", &numbers[i])
	}

	compons := countSubsetComponents(numbers)
	fmt.Println(compons)
}

func countSubsetComponents(numbers []int) int {
	totalComponents := 0
	for _, subset := range subsets(numbers) {
		fmt.Println(subset)
	}
	return totalComponents
}

func subsets(numbers []int) [][]int {
	subsetSize := 2 << uint64(len(numbers)-1)
	subsets := make([][]int, subsetSize)
	for i := 0; i < subsetSize; i++ {
		subsets[i] = make([]int, 0, 20)
		bitWalking(i, func(bitIndex int) {
			subsets[i] = append(subsets[i], numbers[bitIndex])
		})
	}
	return subsets
}

func bitWalking(bits int, process func(int)) {
	i := 0
	for bits > 0 {
		if bits & 1 == 1 {
			process(i)
		}
		bits >>= 1; i++
	}
}
