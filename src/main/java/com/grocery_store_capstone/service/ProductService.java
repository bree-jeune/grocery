package com.grocery_store_capstone.service;

import com.grocery_store_capstone.database.dao.CategoryDAO;
import com.grocery_store_capstone.database.dao.ProductDAO;
import com.grocery_store_capstone.database.entity.Category;
import com.grocery_store_capstone.database.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class ProductService {

    private static final Logger logger = LoggerFactory.getLogger(ProductService.class);

    public void createProduct(Product product) {
        if (product.getProductCode() == null || product.getProductCode().isEmpty()) {
            product.setProductCode("PRD-" + UUID.randomUUID().toString().substring(0, 8));
        }
        productDao.save(product);
    }

    @Autowired
    private ProductDAO productDao;

    @Autowired
    private CategoryDAO categoryDao;

    public void addProductWithCategories() {
        // Create some categories
        Category dairy = new Category("Dairy", "Dairy products like milk, cheese, etc.");
        Category bakery = new Category("Bakery", "Bakery items like bread, cakes, etc.");

        // Save the categories
        categoryDao.save(dairy);
        categoryDao.save(bakery);

        // Create a new product
        Product milk = new Product();
        milk.setProductCode("MILK001");  // Set a unique product code
        milk.setProductCompany("DairyLand");  // Set the company
        milk.setProductTitle("Milk");
        milk.setProductDescription("A gallon of milk");
        milk.setProductPricePerItem(new BigDecimal("3.99"));
        milk.setProductImageUrl("https://example.com/milk.jpg");

        // Add categories to the product
        milk.getCategories().add(dairy);
        milk.getCategories().add(bakery);

        // Save the product
        productDao.save(milk);
    }


    public void createProductWithCategories(Product product, List<Long> categoryIds) {
        HashSet<Category> categories = new HashSet<>(categoryDao.findAllById(categoryIds));
        product.setCategories(categories);
        productDao.save(product);
    }

    public List<Product> getProductsByCategory(Long categoryId) {
        return productDao.findProductsByCategory(categoryId);
    }

    public void processProduct(Product product) {
        logger.info("Processing product with ID: {}", product.getId());
    }
}
