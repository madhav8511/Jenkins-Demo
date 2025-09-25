package org.example;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class MainTest {

    @Test
    void testAddition() {
        int a = 2, b = 3;
        int sum = a + b;
        assertEquals(5, sum, "2 + 3 should equal 5");
    }

    @Test
    void testLoopOutput() {
        int n = 5;
        int[] expected = {1,2,3,4,5};
        int[] actual = new int[n];
        for (int i = 0; i < n; i++) {
            actual[i] = i+1;
        }
        assertArrayEquals(expected, actual, "Loop output should match");
    }
}
