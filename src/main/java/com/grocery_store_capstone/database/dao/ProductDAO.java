package com.grocery_store_capstone.database.dao;

import com.grocery_store_capstone.database.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface ProductDAO extends JpaRepository<Product, Long> {
    @Query("SELECT p FROM Product p WHERE p.productTitle = :title")
    Optional<Product> findByTitle(@Param("title") String title);

    @Query(value = "SELECT * FROM product p WHERE p.product_category_id = :categoryId", nativeQuery = true)
    List<Product> findProductsByCategory(@Param("categoryId") Long categoryId);

    @Query("SELECT p FROM Product p WHERE p.productTitle LIKE %:search% OR p.productCode LIKE %:search%")
    List<Product> searchProductsByTitleOrCode(@Param("search") String search);

    List<Product> findByProductTitleContainingIgnoreCase(String query);
}
