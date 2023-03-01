package org.example;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class PojoTest {

    @Test
    void greet() {
        Pojo actual = new Pojo();
        assertEquals("Hallo Fridolin", actual.greet("Fridolin"));
    }
}
