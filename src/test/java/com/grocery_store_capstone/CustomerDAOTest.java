package com.grocery_store_capstone;

import com.grocery_store_capstone.database.dao.CustomerDAO;
import com.grocery_store_capstone.database.entity.Customer;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
@Transactional
public class CustomerDAOTest {
    @Autowired
    private CustomerDAO customerDao;

    @Test
    public void testCreateCustomer() {
        Customer customer = new Customer();
        customer.setCustomerName("John Doe");
        customer.setEmail("john.doe@example.com"); // Set the email
        customer.setPhone("555-555-5555");

        Customer savedCustomer = customerDao.save(customer);

        assertNotNull(savedCustomer);
        assertEquals("john.doe@example.com", savedCustomer.getEmail()); // Verify the email
    }

}
