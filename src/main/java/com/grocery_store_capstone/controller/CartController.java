package com.grocery_store_capstone.controller;

import com.grocery_store_capstone.database.entity.Product;
import com.grocery_store_capstone.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.util.Map;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    @GetMapping
    public String viewCart(Model model) {
        Map<Product, Integer> cartItems = cartService.getCartItems();
        double cartTotal = cartService.calculateTotal();

        model.addAttribute("cartItems", cartItems);
        model.addAttribute("cartTotal", cartTotal);

        return "cart";
    }

    @PostMapping("/add")
    public String addToCart(@RequestParam("productId") Long productId, @RequestParam("quantity") int quantity) {
        cartService.addProductToCart(productId, quantity);
        return "redirect:/cart";
    }

    @PostMapping("/update")
    public String updateCart(@RequestParam("productId") Long productId, @RequestParam("quantity") int quantity) {
        cartService.updateProductQuantity(productId, quantity);
        return "redirect:/cart";
    }

    @PostMapping("/remove")
    public String removeFromCart(@RequestParam("productId") Long productId) {
        cartService.removeProductFromCart(productId);
        return "redirect:/cart";
    }
}
