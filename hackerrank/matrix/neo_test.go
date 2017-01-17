package main

import "testing"
import "reflect"

func TestNeoDestroy(t *testing.T) {
	roads := [][]int{{2, 1, 8}, {1, 0, 5}, {2, 4, 5}, {1, 3, 4}}
	badGuys := []int{2, 4, 0}

	cost := neoDestroy(5, roads, badGuys, 3)

	if cost != 10 {
		t.Error("\nExpected 10 got", cost)
	}
}
