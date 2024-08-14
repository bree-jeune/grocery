package com.grocery_store_capstone.service.employeemanagementsystem;

import com.grocery_store_capstone.database.dao.CategoryDAO;
import com.grocery_store_capstone.database.dao.ProductDAO;
import com.grocery_store_capstone.database.entity.Category;
import com.grocery_store_capstone.database.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductDAO productDao;

    @Autowired
    private CategoryDAO categoryDao;

    public void createProductWithCategories(Product product, List<Long> categoryIds) {
        HashSet<Category> categories = new HashSet<>(categoryDao.findAllById(categoryIds));
        product.setCategories(categories);
        productDao.save(product);
    }

    public List<Product> getProductsByCategory(Long categoryId) {
        return productDao.findProductsByCategory(categoryId);
    }
}
