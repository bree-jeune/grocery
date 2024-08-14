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
            Category savedCategory = categoryDao.saveAndFlush(category); // Save and flush to ensure persistence

            // Capture the generated ID
            generatedId = savedCategory.getId();
            System.out.println("Category saved: " + savedCategory);
        }
    }



    @Test
    @Order(1)
    public void testCreateCategory() {
        // Create a new Category
        Category category = new Category("Dairy", "Dairy products like milk, cheese, etc.");
        Category savedCategory = categoryDao.save(category);

        // Verify the category was saved correctly
        assertNotNull(savedCategory, "Saved category should not be null");
        assertEquals("Dairy", savedCategory.getName(), "The category name should be 'Dairy'");
    }

    @Test
    @Order(2)
    public void testReadCategory() {
        // Read the Category by its generated ID
        Optional<Category> retrievedCategory = categoryDao.findById(generatedId);

        // Verify the category was retrieved correctly
        assertTrue(retrievedCategory.isPresent(), "Category with ID " + generatedId + " should exist");
        assertEquals("Dairy", retrievedCategory.get().getName(), "The category name should be 'Dairy'");
    }


    @Test
    @Order(3)
    public void testUpdateCategory() {
        // Use the captured ID
        Optional<Category> categoryOptional = categoryDao.findById(generatedId);
        assertTrue(categoryOptional.isPresent(), "Category with ID " + generatedId + " should exist");

        // Update the Category
        Category category = categoryOptional.get();
        category.setDescription("Updated Dairy products description");
        Category updatedCategory = categoryDao.save(category);

        // Fetch the updated Category
        Optional<Category> updatedCategoryOptional = categoryDao.findById(generatedId);
        assertTrue(updatedCategoryOptional.isPresent(), "Category with ID " + generatedId + " should exist after update");

        // Verify the category was updated correctly
        assertEquals("Updated Dairy products description", updatedCategory.getDescription(), "The category description should be updated");
        assertEquals("Updated Dairy products description", updatedCategoryOptional.get().getDescription(), "The category description should be updated in the database");
    }


    @Test
    @Order(4)
    public void testDeleteCategory() {
        // Delete the Category
        categoryDao.deleteById(1L);

        // Verify the category was deleted correctly
        Optional<Category> deletedCategory = categoryDao.findById(1L);
        assertFalse(deletedCategory.isPresent(), "Category with ID 1 should not exist after deletion");
    }
}
