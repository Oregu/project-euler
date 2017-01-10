package main

import "testing"

func TestSubsetComponent(t *testing.T) {
	numbers := []int{2, 5, 9}

	compons := countSubsetComponents(numbers)
	if compons != 504 {
		t.Error("Expected 504, got ", swaps)
	}
}
