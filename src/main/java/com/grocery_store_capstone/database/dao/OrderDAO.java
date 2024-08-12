package com.grocery_store_capstone.database.dao;

import com.grocery_store_capstone.database.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

@Repository
public interface OrderDAO extends JpaRepository<Order, Long> {

    @Query("SELECT new map(od.id as orderDetailId, p.productTitle as productTitle, od.quantityOrdered as quantityOrdered, " +
            "p.productPricePerItem as pricePerItem, (od.quantityOrdered * p.productPricePerItem) as totalAmount) " +
            "FROM OrderDetail od " +
            "JOIN od.product p " +
            "WHERE od.order.id = :orderId")
    List<Map<String, Object>> getOrderDetails(@Param("orderId") Long orderId);

    @Query("SELECT SUM(od.quantityOrdered * p.productPricePerItem) " +
            "FROM OrderDetail od " +
            "JOIN od.product p " +
            "WHERE od.order.id = :orderId")
    Double getOrderTotal(@Param("orderId") Long orderId);

    @Query("SELECT o FROM Order o WHERE o.status = :status")
    Order findOrderInCartStatus(@Param("status") Integer status);

}
