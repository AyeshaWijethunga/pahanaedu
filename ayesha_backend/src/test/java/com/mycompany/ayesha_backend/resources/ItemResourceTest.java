package com.mycompany.ayesha_backend.resources;

import com.mycompany.ayesha_backend.model.Item;
import jakarta.ws.rs.core.Response;
import org.junit.jupiter.api.*;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class ItemResourceTest {

    private static ItemResource instance;
    private static int testItemId;

    @BeforeAll
    public static void setUpClass() {
        instance = new ItemResource();
    }

    @AfterAll
    public static void tearDownClass() {
        // Cleanup if needed
    }

    @BeforeEach
    public void setUp() {
        // Setup before each test if needed
    }

    @AfterEach
    public void tearDown() {
        // Cleanup after each test if needed
    }

    @Test
    @Order(1)
    public void testAddItem() {
        Item item = new Item();
        item.setName("Test Book");
        item.setPrice(123.45);
        item.setQuantity(10);

        Item result = instance.addItem(item);
        assertNotNull(result);
        assertTrue(result.getId() > 0);
        assertEquals("Test Book", result.getName());
        assertEquals(123.45, result.getPrice());
        assertEquals(10, result.getQuantity());
        testItemId = result.getId();
    }

    @Test
    @Order(2)
    public void testGetItems() {
        List<Item> result = instance.getItems("");
        assertNotNull(result);
        boolean found = result.stream().anyMatch(i -> i.getId() == testItemId);
        assertTrue(found);
    }

    @Test
    @Order(3)
    public void testUpdateItem() {
        Item update = new Item();
        update.setName("Updated Book");
        update.setPrice(456.78);
        update.setQuantity(5);

        Item result = instance.updateItem(testItemId, update);
        assertNotNull(result);
        assertEquals(testItemId, result.getId());
        assertEquals("Updated Book", result.getName());
        assertEquals(456.78, result.getPrice());
        assertEquals(5, result.getQuantity());
    }

    @Test
    @Order(4)
    public void testDeleteItem() {
        Response result = instance.deleteItem(testItemId);
        assertEquals(Response.Status.OK.getStatusCode(), result.getStatus());

        List<Item> afterDelete = instance.getItems("");
        boolean found = afterDelete.stream().anyMatch(i -> i.getId() == testItemId);
        assertFalse(found);
    }
}