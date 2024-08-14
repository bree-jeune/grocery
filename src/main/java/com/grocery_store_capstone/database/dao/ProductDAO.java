package com.grocery_store_capstone.database.dao;

import com.grocery_store_capstone.database.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductDAO extends JpaRepository<Product, Long> {

    @Query(value = "SELECT * FROM product p WHERE p.product_category_id = :categoryId", nativeQuery = true)
    List<Product> findProductsByCategory(@Param("categoryId") Long categoryId);
}
