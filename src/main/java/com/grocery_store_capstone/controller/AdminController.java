package com.grocery_store_capstone.controller;

import com.grocery_store_capstone.database.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/dashboard")
public class AdminController {

    @Autowired
    private UserDAO userDAO;

    @GetMapping
    public String showDashboard(Model model) {
        int totalUsers = userDAO.getTotalUsers();
        int totalProducts = userDAO.getTotalProducts();
        int totalOrders = userDAO.getTotalOrders();

        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("totalProducts", totalProducts);
        model.addAttribute("totalOrders", totalOrders);

        return "admin_dashboard";
    }
}
