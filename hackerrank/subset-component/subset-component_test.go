package main

import "testing"

func TestSubsetComponent(t *testing.T) {
	numbers := []uint64{2, 5, 9}

	compons := countSubsetComponents(numbers)
	if compons != 504 {
		t.Error("Expected 504, got ", compons)
	}
}

func TestSubsetComponentEdge(t *testing.T) {
	numbers := []uint64{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	compons := countSubsetComponents(numbers)
	if compons != 67108864 {
		t.Error("Expected 67108864, got ", compons)
	}
}

func BenchmarkSearchEqualAlgo(b *testing.B) {
	numbers := []uint64{2, 5, 9}

	for n := 0; n < b.N; n++ {
		countSubsetComponents(numbers)
	}
}
