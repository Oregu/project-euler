package main

import "testing"

func TestCountSwaps(t *testing.T) {
	numbers := [][2]int{{2, 0}, {5, 1}, {3, 2}, {1, 3}}

	swaps := countSwaps(numbers)
	if swaps != 2 {
		t.Error("Expected 2, got ", swaps)
	}
}
