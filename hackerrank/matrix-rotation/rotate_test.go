package main

import "testing"
import "reflect"

func TestRotate(t *testing.T) {
	matrix := [][]int{{1, 2, 3, 4}, {7, 8, 9, 10}, {13, 14, 15, 16}, {19, 20, 21, 22}, {25, 26, 27, 28}}
	expect := [][]int{{28, 27, 26, 25}, {22, 9, 15, 19}, {16, 8, 21, 13}, {10, 14, 20, 7}, {4, 3, 2, 1}}
	rotate(matrix, 7)

	if !reflect.DeepEqual(expect, matrix) {
		t.Error("\nExpected", expect, "\ngot", matrix)
	}
}
