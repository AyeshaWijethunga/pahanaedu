package com.mycompany.ayesha_backend.resources;

import com.mycompany.ayesha_backend.model.Customer;
import jakarta.ws.rs.core.Response;
import org.junit.jupiter.api.*;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class CustomerResourceTest {

    private static CustomerResource instance;
    private static int testCustomerId;

    @BeforeAll
    public static void setUpClass() {
        instance = new CustomerResource();
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
    public void testAddCustomer() {
        Customer customer = new Customer();
        customer.setName("Test User");
        customer.setContact("0771234567");

        Customer result = instance.addCustomer(customer);
        assertNotNull(result);
        assertTrue(result.getId() > 0);
        assertEquals("Test User", result.getName());
        assertEquals("0771234567", result.getContact());
        testCustomerId = result.getId();
    }

    @Test
    @Order(2)
    public void testGetCustomers() {
        List<Customer> result = instance.getCustomers("");
        assertNotNull(result);
        // At least one customer should exist (the one we added)
        boolean found = result.stream().anyMatch(c -> c.getId() == testCustomerId);
        assertTrue(found);
    }

    @Test
    @Order(3)
    public void testGetCustomerByPhone() {
        Customer result = instance.getCustomerByPhone("0771234567");
        assertNotNull(result);
        assertEquals(testCustomerId, result.getId());
        assertEquals("Test User", result.getName());
    }

    @Test
    @Order(4)
    public void testUpdateCustomer() {
        Customer update = new Customer();
        update.setName("Updated User");
        update.setContact("0777654321");

        Customer result = instance.updateCustomer(testCustomerId, update);
        assertNotNull(result);
        assertEquals(testCustomerId, result.getId());
        assertEquals("Updated User", result.getName());
        assertEquals("0777654321", result.getContact());
    }

    @Test
    @Order(5)
    public void testDeleteCustomer() {
        Response result = instance.deleteCustomer(testCustomerId);
        assertEquals(Response.Status.OK.getStatusCode(), result.getStatus());

        Customer deleted = instance.getCustomerByPhone("0777654321");
        assertNull(deleted);
    }

}