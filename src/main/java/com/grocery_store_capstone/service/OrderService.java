package com.grocery_store_capstone.service;

import com.grocery_store_capstone.database.dao.OrderDAO;
import com.grocery_store_capstone.database.entity.Customer;
import com.grocery_store_capstone.database.entity.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

@Service
public class OrderService {
    private static final Logger logger = LoggerFactory.getLogger(OrderService.class);
    private final OrderDAO orderDAO;

    public OrderService(OrderDAO orderDAO) {
        this.orderDAO = orderDAO;
    }

    public void processOrder(Order order) {
        logger.info("Order processed: " + order.getId());
    }

    public void processLargeOrders() {
        List<Order> orders = orderDAO.findAll();
        orders.stream()
                .filter(order -> calculateOrderTotal(order).compareTo(BigDecimal.valueOf(100)) > 0)
                .forEach(order -> System.out.println("Large Order ID: " + order.getId()));
    }

    public Order findOrderById(Long orderId) {
        return orderDAO.findById(orderId).orElse(null);
    }

    private BigDecimal calculateOrderTotal(Order order) {
        return order.getOrderDetails().stream()
                .map(od -> BigDecimal.valueOf(od.getQuantityOrdered()).multiply(od.getProduct().getProductPricePerItem()))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

        public void createOrder(Customer customer) {
            Order order = new Order();

            LocalDate localDate = LocalDate.now();
            Date date = Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
            order.setOrderDate(date);

            orderDAO.save(order);
        }

}
