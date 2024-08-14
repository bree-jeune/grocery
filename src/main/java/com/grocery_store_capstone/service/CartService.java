package com.grocery_store_capstone.service;

import com.grocery_store_capstone.database.dao.ProductDAO;
import com.grocery_store_capstone.database.entity.Product;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.math.BigDecimal;


@Service
public class CartService {

    @Autowired
    private ProductDAO productDAO;



    @Getter
    private Map<Product, Integer> cartItems = new HashMap<>();

    public void addProductToCart(Long productId, int quantity) {
        Product product = findProductById(productId);
        cartItems.put(product, cartItems.getOrDefault(product, 0) + quantity);
    }

    public void updateProductQuantity(Long productId, int quantity) {
        Product product = findProductById(productId);
        cartItems.put(product, quantity);
    }

    public void removeProductFromCart(Long productId) {
        Product product = findProductById(productId);
        cartItems.remove(product);
    }

    public double calculateTotal() {
        return cartItems.entrySet().stream()
                .map(entry -> entry.getKey().getPrice().multiply(BigDecimal.valueOf(entry.getValue())))
                .reduce(BigDecimal.ZERO, BigDecimal::add)
                .doubleValue();
    }

    private Product findProductById(Long productId) {
        return productDAO.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found with ID: " + productId));
    }
}
