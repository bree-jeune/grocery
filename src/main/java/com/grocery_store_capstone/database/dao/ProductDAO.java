package com.grocery_store_capstone.database.dao;

import com.grocery_store_capstone.database.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductDAO extends JpaRepository<Product, Long> {

    List<Product> findByProductTitleOrProductCode(String productTitle, String productCode);
}
