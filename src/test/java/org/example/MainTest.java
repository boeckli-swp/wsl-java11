package org.example;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class MainTest {

    @Test
    void greet() {
        String actual = Main.greet("Fridolin");
        assertEquals("Hallo Fridolin", actual);
    }
}
