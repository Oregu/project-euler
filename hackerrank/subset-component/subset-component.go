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
	numbers := make([]uint64, N)
	for i := 0; i < N; i++ {
		fmt.Fscanf(reader, "%d", &numbers[i])
	}

	compons := countSubsetComponents(numbers)
	fmt.Println(compons)
}

func countSubsetComponents(numbers []uint64) uint64 {
	totalComponents := uint64(0)
	for _, subset := range subsets(numbers) {
		var components, bits, totalBitsCount uint64 = 0, 0, 0
		for i := 0; i < len(subset); i++ {
			if subset[i] == 0 { continue }
			prevBitsCount := totalBitsCount
			bits |= subset[i]
			subsetBitsCount := countBits(subset[i])
			totalBitsCount = countBits(bits)
			if totalBitsCount == prevBitsCount + subsetBitsCount {
				// If some bits would collide, that would mean some components intersected.
				components++
			}
		}
		totalComponents += uint64(64) - totalBitsCount + components
	}
	return totalComponents
}

func subsets(numbers []uint64) [][]uint64 {
	var subsetSize uint64 = 2 << uint64(len(numbers)-1)
	subsets := make([][]uint64, subsetSize)
	for i := uint64(0); i < subsetSize; i++ {
		subsets[i] = subset(numbers, i)
	}
	return subsets
}

func countBits(bits uint64) uint64 {
	var bitsCount, i uint64 = 0, 0
	for bits > 0 {
		if bits & 1 == 1 {
			bitsCount++
		}
		bits >>= 1; i++
	}
	return bitsCount
}

func subset(numbers []uint64, bits uint64) []uint64 {
	subset := make([]uint64, 0, 20)
	i := uint64(0)
	for bits > 0 {
		if bits & 1 == 1 {
			subset = append(subset, numbers[i])
		}
		bits >>= 1; i++
	}
	return subset
}
