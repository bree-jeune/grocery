package com.grocery_store_capstone.controller;

import com.grocery_store_capstone.database.dao.ProductDAO;
import com.grocery_store_capstone.database.entity.Product;
import com.grocery_store_capstone.form.CreateProductFormBean;
import com.grocery_store_capstone.service.ProductService;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {

    private final ProductService productService;
    private final ProductDAO productDao;

    @GetMapping("/product/list")
    public String showProductList(Model model) {
        // Add products to the model and return the view name
        return "productList"; // Ensure "productList" is the correct view template
    }


    @GetMapping("/addProductWithCategories")
    public String addProductWithCategories() {
        productService.addProductWithCategories();
        return "redirect:/product/list"; // Redirect to product listing page after adding
    }

    @Autowired
    public ProductController(ProductService productService, ProductDAO productDao) {
        this.productService = productService;
        this.productDao = productDao;
    }

    // Method to get products by category
    @GetMapping("/byCategory")
    public String getProductsByCategory(@RequestParam("categoryId") Long categoryId, Model model) {
        List<Product> products = productService.getProductsByCategory(categoryId);
        model.addAttribute("products", products);
        return "product/list";
    }

    // Display the form to create a new product
    @GetMapping("/create")
    public String showCreateProductForm(Model model) {
        CreateProductFormBean form = new CreateProductFormBean();
        model.addAttribute("form", form);
        return "product/create";
    }

    // Handle the form submission for creating a new product
    @PostMapping("/create")
    public String submitCreateProductForm(@Valid @ModelAttribute("form") CreateProductFormBean form, BindingResult result) {
        if (result.hasErrors()) {
            return "product/create";
        }

        Product product = new Product();
        product.setProductTitle(form.getName());
        product.setProductDescription(form.getDescription());
        product.setProductPricePerItem(form.getPrice());
        product.setProductImageUrl(form.getImageUrl());

        productDao.save(product);

        return "redirect:/product/list";
    }

    // Display the form to edit an existing product
    @GetMapping("/edit")
    public ModelAndView editProduct(@RequestParam(required = false) Long id) {
        ModelAndView response = new ModelAndView("product/create");

        CreateProductFormBean formBean = new CreateProductFormBean();

        if (id != null) {
            Product product = productDao.findById(id).orElse(null);
            if (product != null) {
                formBean.setId(product.getId());
                formBean.setName(product.getProductTitle());
                formBean.setDescription(product.getProductDescription());
                formBean.setPrice(product.getProductPricePerItem());
                formBean.setImageUrl(product.getProductImageUrl());
            } else {
                response.addObject("errorMessage", "Product not found for this id :: " + id);
            }
        }

        response.addObject("form", formBean);
        return response;
    }

    // Handle the form submission for updating an existing product
    @PostMapping("/editSubmit")
    public ModelAndView editProductSubmit(@Valid @ModelAttribute("form") CreateProductFormBean form, BindingResult bindingResult) {
        ModelAndView response = new ModelAndView("product/create");

        if (bindingResult.hasErrors()) {
            response.addObject("form", form);
            response.addObject("bindingResult", bindingResult);
            return response;
        }

        Product product = productDao.findById(form.getId()).orElse(new Product());
        product.setProductTitle(form.getName());
        product.setProductDescription(form.getDescription());
        product.setProductPricePerItem(form.getPrice());
        product.setProductImageUrl(form.getImageUrl());

        productDao.save(product);

        response.setViewName("redirect:/product/list");
        return response;
    }
}
