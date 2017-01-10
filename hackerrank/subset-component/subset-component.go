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
	return 0
}
