package com.grocery_store_capstone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OffersController {

    @GetMapping("/offers")
    public String offersPage() {
        return "offers";
    }
}
