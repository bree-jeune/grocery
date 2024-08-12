package com.grocery_store_capstone.database.dao;

import com.grocery_store_capstone.database.entity.Order;
import com.grocery_store_capstone.database.entity.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer> {
    @Query("SELECT od FROM OrderDetail od WHERE od.order.id = :orderId AND od.product.id = :productId")
    OrderDetail findProductInCart(@Param("orderId") Long orderId, @Param("productId") Integer productId);

    List<OrderDetail> findByOrder(Order order);


}
