package com.grocery_store_capstone;

import com.grocery_store_capstone.database.dao.CategoryDAO;
import com.grocery_store_capstone.database.dao.OrderDAO;
import com.grocery_store_capstone.database.dao.CustomerDAO;
import com.grocery_store_capstone.database.entity.Order;
import com.grocery_store_capstone.database.entity.Customer;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Transactional
public class OrderDAOTest {

    @Autowired
    private OrderDAO orderDao;

    @Autowired
    private CategoryDAO categoryDao;

    @Autowired
    private CustomerDAO customerDao;

    @Test
    public void testCreateOrder() {
        Order order = new Order();

        LocalDate localDate = LocalDate.now();
        Date date = Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
        order.setOrderDate(date);

        order.setStatus("Processing");

        Customer customer = new Customer();
        customer.setCustomerName("John Doe");
        customer.setEmail("john.doe@example.com");
        customer.setPhone("555-555-5555");

        Customer savedCustomer = customerDao.saveAndFlush(customer); // Ensure the customer is saved

        order.setCustomer(savedCustomer);

        Order savedOrder = orderDao.save(order);

        assertNotNull(savedOrder);
        assertEquals(order.getStatus(), savedOrder.getStatus());
        assertNotNull(savedOrder.getCustomer());
        assertEquals(savedCustomer.getId(), savedOrder.getCustomer().getId());
    }

    @Test
    public void testReadOrder() {
        Order order = new Order();

        LocalDate localDate = LocalDate.now();
        Date date = Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
        order.setOrderDate(date);
        order.setStatus("Processing");

        Customer customer = new Customer();
        customer.setCustomerName("John Doe");
        customer.setEmail("john.doe@example.com");
        customer.setPhone("555-555-5555");

        Customer savedCustomer = customerDao.saveAndFlush(customer); // Ensure the customer is saved

        order.setCustomer(savedCustomer);

        Order savedOrder = orderDao.save(order);

        Optional<Order> fetchedOrder = orderDao.findById(savedOrder.getId());
        assertTrue(fetchedOrder.isPresent());
        assertEquals(savedOrder.getId(), fetchedOrder.get().getId());
    }

    @Test
    public void testDeleteOrder() {
        orderDao.deleteById(1L);
        Optional<Order> order = orderDao.findById(1L);
        assertFalse(order.isPresent());
    }

    @ParameterizedTest
    @ValueSource(strings = {"Processing", "Shipped", "Delivered"})
    public void testParameterizedOrderCreation(String status) {
        Order order = new Order();

        LocalDate localDate = LocalDate.now();
        Date date = Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
        order.setOrderDate(date);

        order.setStatus(status);

        Customer customer = new Customer();
        customer.setCustomerName("John Doe");
        customer.setEmail("john.doe@example.com");
        customer.setPhone("555-555-5555");

        Customer savedCustomer = customerDao.saveAndFlush(customer); // Ensure the customer is saved

        order.setCustomer(savedCustomer);

        Order savedOrder = orderDao.save(order);

        assertNotNull(savedOrder);
        assertEquals(status, savedOrder.getStatus());
    }
}
