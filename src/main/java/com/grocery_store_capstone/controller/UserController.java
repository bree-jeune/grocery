package com.grocery_store_capstone.controller;

import com.grocery_store_capstone.database.dao.UserDAO;
import com.grocery_store_capstone.database.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/users")
public class UserController {

    @Autowired
    private UserDAO userDAO;

    @GetMapping
    public String listUsers(Model model) {
        model.addAttribute("users", userDAO.findAll());
        return "user_list";
    }

    @GetMapping("/create")
    public String showCreateUserForm() {
        return "create_user";
    }

    @PostMapping("/create")
    public String createUser(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam("email") String email,
            @RequestParam("role") String role) {

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setRole(role);

        userDAO.save(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/dashboard")
    public String showDashboard(Model model) {
        int totalUsers = userDAO.getTotalUsers();
        model.addAttribute("totalUsers", totalUsers);
        return "admin_dashboard";
    }

    @GetMapping("/register")
    public String showRegisterPage() {
        return "register";
    }
}
