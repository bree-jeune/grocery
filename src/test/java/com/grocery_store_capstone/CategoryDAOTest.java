package com.grocery_store_capstone;

import com.grocery_store_capstone.database.dao.CategoryDAO;
import com.grocery_store_capstone.database.entity.Category;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@Transactional
@SpringBootTest
@TestMethodOrder(OrderAnnotation.class)
class CategoryDAOTest {

    @Autowired
    private CategoryDAO categoryDao;

    private Long generatedId;


    @BeforeEach
    public void setup() {
        Optional<Category> existingCategory = categoryDao.findById(1L);
        if (!existingCategory.isPresent()) {
            Category category = new Category();
            category.setName("Dairy");
            category.setDescription("Products derived from milk.");
            Category savedCategory = categoryDao.saveAndFlush(category);

            generatedId = savedCategory.getId();
            System.out.println("Category saved: " + savedCategory);
        }
    }



    @Test
    @Order(1)
    public void testCreateCategory() {
        Category category = new Category("Dairy", "Dairy products like milk, cheese, etc.");
        Category savedCategory = categoryDao.save(category);

        assertNotNull(savedCategory, "Saved category should not be null");
        assertEquals("Dairy", savedCategory.getName(), "The category name should be 'Dairy'");
    }

    @Test
    @Order(2)
    public void testReadCategory() {
        Optional<Category> retrievedCategory = categoryDao.findById(generatedId);

        assertTrue(retrievedCategory.isPresent(), "Category with ID " + generatedId + " should exist");
        assertEquals("Dairy", retrievedCategory.get().getName(), "The category name should be 'Dairy'");
    }


    @Test
    @Order(3)
    public void testUpdateCategory() {
        Optional<Category> categoryOptional = categoryDao.findById(generatedId);
        assertTrue(categoryOptional.isPresent(), "Category with ID " + generatedId + " should exist");

        Category category = categoryOptional.get();
        category.setDescription("Updated Dairy products description");
        Category updatedCategory = categoryDao.save(category);

        Optional<Category> updatedCategoryOptional = categoryDao.findById(generatedId);
        assertTrue(updatedCategoryOptional.isPresent(), "Category with ID " + generatedId + " should exist after update");

        assertEquals("Updated Dairy products description", updatedCategory.getDescription(), "The category description should be updated");
        assertEquals("Updated Dairy products description", updatedCategoryOptional.get().getDescription(), "The category description should be updated in the database");
    }


    @Test
    @Order(4)
    public void testDeleteCategory() {
        categoryDao.deleteById(1L);

        Optional<Category> deletedCategory = categoryDao.findById(1L);
        assertFalse(deletedCategory.isPresent(), "Category with ID 1 should not exist after deletion");
    }
}
