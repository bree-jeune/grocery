package com.grocery_store_capstone;

import com.grocery_store_capstone.database.dao.ProductDAO;
import com.grocery_store_capstone.database.entity.Product;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
public class ProductDAOTest {

    @Autowired
    private ProductDAO productDAO;

    @BeforeEach
    public void setup() {
        // You can initialize some common setup data here if needed
    }

    @AfterEach
    public void cleanup() {
        // Clean up the database after each test to maintain isolation
        productDAO.deleteAll();
    }

    @Test
    public void testCreateMultipleProducts() {
        // Create and save a product
        Product product1 = new Product();
        product1.setProductCode("P001");
        product1.setProductCompany("Company A");
        product1.setProductDescription("Description for Product 1");
        product1.setProductExpDate(LocalDate.now().plusDays(30));
        product1.setProductMfdDate(LocalDate.now().minusDays(10));
        product1.setProductPricePerItem(BigDecimal.valueOf(10.99));
        product1.setProductStock(100);
        product1.setProductTitle("Product 1");

        Product product2 = new Product();
        product2.setProductCode("P002");
        product2.setProductCompany("Company B");
        product2.setProductDescription("Description for Product 2");
        product2.setProductExpDate(LocalDate.now().plusDays(60));
        product2.setProductMfdDate(LocalDate.now().minusDays(20));
        product2.setProductPricePerItem(BigDecimal.valueOf(15.99));
        product2.setProductStock(50);
        product2.setProductTitle("Product 2");

        // Save the products
        productDAO.save(product1);
        productDAO.save(product2);

        // Fetch and assert
        List<Product> products = productDAO.findAll();
        assertEquals(2, products.size());
        assertNotNull(products.get(0).getProductId());
        assertNotNull(products.get(1).getProductId());
    }

    @Test
    public void testStreamExample() {
        // Create and save a product
        Product product = new Product();
        product.setProductCode("P003");
        product.setProductCompany("Company C");
        product.setProductDescription("Description for Product 3");
        product.setProductExpDate(LocalDate.now().plusDays(90));
        product.setProductMfdDate(LocalDate.now().minusDays(5));
        product.setProductPricePerItem(BigDecimal.valueOf(20.99));
        product.setProductStock(200);
        product.setProductTitle("Product 3");

        productDAO.save(product);

        // Fetch products and use stream example
        List<Product> products = productDAO.findAll();
        products.stream()
                .filter(p -> p.getProductStock() > 100)
                .forEach(p -> System.out.println(p.getProductTitle()));

        assertTrue(!products.isEmpty());
    }
}
