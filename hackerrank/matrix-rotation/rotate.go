// https://www.hackerrank.com/challenges/matrix-rotation-algo

package main

import (
	"bufio"
	"fmt"
	"os"
	"math"
)

func main() {
	reader := bufio.NewReader(os.Stdin)

	var M, N, R int
	fmt.Fscanf(reader, "%d %d %d\n", &M, &N, &R)
	matrix := make([][]int, M)

	for i := 0; i < M; i++ {
		matrix[i] = make([]int, N)
		for j := 0; j < N; j++ {
			fmt.Fscanf(reader, "%d", &matrix[i][j])
		}
		fmt.Fscanf(reader, "\n")
	}

	rotate(matrix, R)

	for i := 0; i < M; i++ {
		for j := 0; j < N; j++ {
			fmt.Print(matrix[i][j])
			fmt.Print(string(' '))
		}
		fmt.Println()
	}
}

func rotate(matrix [][]int, R int) {
	M, N := len(matrix), len(matrix[0])

	strCount := int(math.Ceil(math.Min(float64(M), float64(N))/2.0))
	for s := 0; s < strCount; s++ {
		strLen := (M - s*2 + N - s*2 - 2)*2 // Perimeter = (M-1 + N-1)*2
		if strLen == 1 || R % strLen == 0 {
			continue
		}

		R = R % strLen
		digits := findString(matrix, M, N, s, strLen)
		rotateString(matrix, M, N, digits, s, R)
	}
}

func findString(matrix [][]int, M int, N int, currentString int, strLen int) []int {
	digits := make([]int, strLen)
	i, j := currentString, currentString
	digitInd := 0
	// Copy top side from left to right
	for j < N - currentString - 1 {
		digits[digitInd] = matrix[i][j]
		digitInd++
		j++
	}
	// Copy right side from top to bottom
	for i < M - currentString - 1 {
		digits[digitInd] = matrix[i][j]
		digitInd++
		i++
	}
	// Copy bottom side from right to left
	for j > currentString {
		digits[digitInd] = matrix[i][j]
		digitInd++
		j--
	}
	// Copy left side from bottom to top
	for i > currentString {
		digits[digitInd] = matrix[i][j]
		digitInd++
		i--
	}
	return digits
}

// Put back shifted digits string, same way as extracting string from matrix
func rotateString(matrix [][]int, M int, N int, digits []int, currentString int, R int) {
	i, j := currentString, currentString
	strLen := len(digits)
	digitInd := 0
	// Copy top side from left to right
	for j < N - currentString - 1 {
		matrix[i][j] = digits[(digitInd + R)%strLen]
		digitInd++
		j++
	}
	// Copy right side from top to bottom
	for i < M - currentString - 1 {
		matrix[i][j] = digits[(digitInd + R)%strLen]
		digitInd++
		i++
	}
	// Copy bottom side from right to left
	for j > currentString {
		matrix[i][j] = digits[(digitInd + R)%strLen]
		digitInd++
		j--
	}
	// Copy left side from bottom to top
	for i > currentString {
		matrix[i][j] = digits[(digitInd + R)%strLen]
		digitInd++
		i--
	}
}