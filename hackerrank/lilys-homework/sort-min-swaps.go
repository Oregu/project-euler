// https://www.hackerrank.com/challenges/lilys-homework

package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
)

type ByFirstIndex [][2]int

func (s ByFirstIndex) Len() int {
    return len(s)
}
func (s ByFirstIndex) Swap(i, j int) {
    s[i], s[j] = s[j], s[i]
}
func (s ByFirstIndex) Less(i, j int) bool {
    return s[i][0] < s[j][0]
}

func main() {
	reader := bufio.NewReader(os.Stdin)

	var N int
	fmt.Fscanf(reader, "%d\n", &N)
	numbers := make([][2]int, N)

	for i := 0; i < N; i++ {
		var num int
		fmt.Fscanf(reader, "%d", &num)
		numbers[i] = [2]int{num, i}
	}

	sort.Sort(ByFirstIndex(numbers))
	swaps := countSwaps(numbers)

	sort.Sort(sort.Reverse(ByFirstIndex(numbers)))
	reverseSwaps := countSwaps(numbers)

	if reverseSwaps < swaps { swaps = reverseSwaps }
	fmt.Println(swaps)
}

func countSwaps(numbers [][2]int) int {

	swaps := 0
	visited := make([]bool, len(numbers))
	for i := 0; i < len(numbers); i++ {
		if visited[i] || numbers[i][1] == i { continue }
		cycles := 0
		j := i
		for !visited[j] {
			visited[j] = true
			j = numbers[j][1];
            cycles++;
		}
		swaps += (cycles - 1);
	}
	return swaps
}