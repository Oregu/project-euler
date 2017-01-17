// https://www.hackerrank.com/challenges/matrix

package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	reader := bufio.NewReader(os.Stdin)

	var N, K int
	fmt.Fscanf(reader, "%d %d\n", &N, &K)

	roads := make([][]int, N)
	for i := 0; i < N-1; i++ {
		// From, To, Cost
		roads[i] = make([]int, 3)
		for j := 0; j < 3; j++ {
			fmt.Fscanf(reader, "%d", &roads[i][j])
		}
		fmt.Fscanf(reader, "\n")
	}

	badGuys := make([]int, K)
	for i := 0; i < K; i++ {
		fmt.Fscanf(reader, "%d\n", badGuys[i])
	}

	destroyCost := neoDestroy(N, roads, K, badGuys)
	fmt.Println(destroyCost)
}

func neoDestroy(N int, roads [][]int, K int, badGuys []int) int {
	return 0
}
