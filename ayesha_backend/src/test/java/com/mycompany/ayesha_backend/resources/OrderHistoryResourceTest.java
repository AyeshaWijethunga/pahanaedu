package com.mycompany.ayesha_backend.resources;

import com.mycompany.ayesha_backend.model.OrderHistory;
import jakarta.ws.rs.core.Response;
import org.junit.jupiter.api.*;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class OrderHistoryResourceTest {

    private static OrderHistoryResource instance;
    private static int testOrderId;
    private static String testCustomerName = "Test User";
    private static String testFromDate = "1900-01-01";
    private static String testToDate = "2100-01-01";

    @BeforeAll
    public static void setUpClass() {
        instance = new OrderHistoryResource();
        // If you have a way to seed a test order, do it here and set testOrderId
        // Otherwise, these tests will only work if there is at least one order in your DB
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
    public void testGetOrderHistory() {
        List<OrderHistory> result = instance.getOrderHistory(testCustomerName, testFromDate, testToDate);
        assertNotNull(result);
        // For demo, we just check the list was returned, and if any order exists, record its ID
        if (!result.isEmpty()) {
            testOrderId = result.get(0).getId();
        }
        // Optionally, assert some order properties
    }

    @Test
    @Order(2)
    public void testDeleteOrder() {
        // Only run if testOrderId is set (from previous test)
        if (testOrderId > 0) {
            Response result = instance.deleteOrder(testOrderId);
            assertEquals(Response.Status.OK.getStatusCode(), result.getStatus());

            List<OrderHistory> afterDelete = instance.getOrderHistory(testCustomerName, testFromDate, testToDate);
            boolean found = afterDelete.stream().anyMatch(o -> o.getId() == testOrderId);
            assertFalse(found);
        } else {
            // No test order to delete, skip test
            System.out.println("No test order found to delete.");
        }
    }
}