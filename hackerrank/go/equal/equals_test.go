package main

import "testing"
import "sort"

func BenchmarkSearchEqualAlgo(b *testing.B) {
	// run the searchEqualAlgo function b.N times
	chocolates := []int{53, 361, 188, 665, 786, 898, 447, 562, 272, 123, 229, 629, 670, 848, 994, 54, 822, 46, 208, 17, 449, 302, 466, 832, 931, 778, 156, 39, 31, 777, 749, 436, 138, 289, 453, 276, 539, 901, 839, 811, 24, 420, 440, 46, 269, 786, 101, 443, 832, 661, 460, 281, 964, 278, 465, 247, 408, 622, 638, 440, 751, 739, 876, 889, 380, 330, 517, 919, 583, 356, 83, 959, 129, 875, 5, 750, 662, 106, 193, 494, 120, 653, 128, 84, 283, 593, 683, 44, 567, 321, 484, 318, 412, 712, 559, 792, 394, 77, 711, 977, 785, 146, 936, 914, 22, 942, 664, 36, 400, 857}
	sort.Ints(chocolates)

	b.ResetTimer()
	for n := 0; n < b.N; n++ {
		searchEqualAlgo(chocolates)
	}
}

func TestSearchEqualAlgo(t *testing.T) {
	// run the searchEqualAlgo function b.N times
	chocolates := []int{53, 361, 188, 665, 786, 898, 447, 562, 272, 123, 229, 629, 670, 848, 994, 54, 822, 46, 208, 17, 449, 302, 466, 832, 931, 778, 156, 39, 31, 777, 749, 436, 138, 289, 453, 276, 539, 901, 839, 811, 24, 420, 440, 46, 269, 786, 101, 443, 832, 661, 460, 281, 964, 278, 465, 247, 408, 622, 638, 440, 751, 739, 876, 889, 380, 330, 517, 919, 583, 356, 83, 959, 129, 875, 5, 750, 662, 106, 193, 494, 120, 653, 128, 84, 283, 593, 683, 44, 567, 321, 484, 318, 412, 712, 559, 792, 394, 77, 711, 977, 785, 146, 936, 914, 22, 942, 664, 36, 400, 857}

	sort.Ints(chocolates)
	rounds := searchEqualAlgo(chocolates)
	if rounds != 10605 {
		t.Error("Expected 10605, got ", rounds)
	}
}

func TestSearchEqualAlgoRepeat(t *testing.T) {
	chocolates := []int{5, 5, 7}
	rounds := searchEqualAlgo(chocolates)
	if rounds != 1 {
		t.Error("Expected 1, got ", rounds)
	}
}

func TestSearchEqualAlgoSame(t *testing.T) {
	chocolates := []int{5, 5, 5}
	rounds := searchEqualAlgo(chocolates)
	if rounds != 0 {
		t.Error("Expected 0, got ", rounds)
	}
}

func TestSearchEqualAlgoTricky(t *testing.T) {
	chocolates := []int{1, 5, 5}
	rounds := searchEqualAlgo(chocolates)
	if rounds != 3 {
		t.Error("Expected 3, got ", rounds)
	}
}

func TestSearchEqualAlgoTricky2(t *testing.T) {
	chocolates := []int{2, 5, 5, 5, 5, 5}
	rounds := searchEqualAlgo(chocolates)
	if rounds != 6 {
		t.Error("Expected 6, got ", rounds)
	}
}

func TestSearchEqualAlgoTricky3(t *testing.T) {
	chocolates := []int{1, 5, 5, 10, 10}
	rounds := searchEqualAlgo(chocolates)
	if rounds != 7 {
		t.Error("Expected 7, got ", rounds)
	}
}
