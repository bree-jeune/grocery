package com.grocery_store_capstone;

import com.grocery_store_capstone.database.dao.ProductDAO;
import com.grocery_store_capstone.database.entity.Category;
import com.grocery_store_capstone.database.dao.CategoryDAO;
import com.grocery_store_capstone.database.entity.Product;
import com.grocery_store_capstone.service.ProductService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import java.time.LocalDate;
import java.math.BigDecimal;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
public class ProductServiceTest {

    @Autowired
    private CategoryDAO categoryDao;


    @Autowired
    private ProductService productService;

    @Autowired
    private ProductDAO productDao;

    @Test
    public void testCreateProductWithSingleCategory() {
        Category dairy = new Category("Dairy", "Dairy products like milk, cheese, etc.");
        categoryDao.save(dairy);

        Product milk = new Product();
        milk.setProductCode("MILK001");
        milk.setProductCompany("DairyLand");  // Set the company
        milk.setProductTitle("Milk");
        milk.setProductDescription("A gallon of milk");
        milk.setProductPricePerItem(new BigDecimal("3.99"));
        milk.setProductMfdDate(LocalDate.now());  // Set the manufacturing date
        milk.setProductStock(100);  // Set the stock quantity
        milk.setImageUrl("https://example.com/milk.jpg");

        milk.getCategories().add(dairy);
        productDao.save(milk);

        Product savedProduct = productDao.findById(milk.getId()).orElse(null);
        assertNotNull(savedProduct);
        assertTrue(savedProduct.getCategories().contains(dairy));
    }

    @Test
    public void testCreateProductWithMultipleCategories() {
        Category dairy = new Category("Dairy", "Dairy products like milk, cheese, etc.");
        Category bakery = new Category("Bakery", "Bakery items like bread, cakes, etc.");
        categoryDao.save(dairy);
        categoryDao.save(bakery);

        Product milk = new Product();
        milk.setProductCode("MILK001");
        milk.setProductCompany("DairyLand");  // Set the company
        milk.setProductTitle("Milk");
        milk.setProductDescription("A gallon of milk");
        milk.setProductPricePerItem(new BigDecimal("3.99"));
        milk.setProductMfdDate(LocalDate.now());  // Set the manufacturing date
        milk.setProductStock(100);  // Set the stock quantity
        milk.setImageUrl("https://example.com/milk.jpg");

        milk.getCategories().add(dairy);
        milk.getCategories().add(bakery);
        productDao.save(milk);

        Product savedProduct = productDao.findById(milk.getId()).orElse(null);
        assertNotNull(savedProduct);
        assertTrue(savedProduct.getCategories().contains(dairy));
        assertTrue(savedProduct.getCategories().contains(bakery));
    }
}





