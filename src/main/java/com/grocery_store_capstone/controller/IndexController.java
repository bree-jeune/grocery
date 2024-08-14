package com.grocery_store_capstone.controller;

import com.grocery_store_capstone.database.dao.EmployeeDAO;
import com.grocery_store_capstone.database.dao.ProductDAO;
import com.grocery_store_capstone.database.entity.Employee;
import com.grocery_store_capstone.database.entity.Product;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Optional;

@Slf4j
@Controller
@RequestMapping("/products")
public class IndexController {

    @Autowired
    private ProductDAO productDao;

    @Autowired
    private EmployeeDAO employeeDAO;

    @GetMapping("/")
    public ModelAndView index(@RequestParam(required = false) Long id) {
        ModelAndView response = new ModelAndView("index");

        if (id != null) {
            Optional<Optional<Product>> product = Optional.ofNullable(productDao.findById(id));
            product.ifPresent(p -> response.addObject("productKey", p));
        }

        log.info("Accessed index page with id: {}", id);

        response.addObject("message", "Hello World!");
        return response;
    }

    @GetMapping("/index/{id}")
    public ModelAndView indexPathVar(@PathVariable(name = "id") Long productId) {
        ModelAndView response = new ModelAndView("index");

        Optional<Optional<Product>> product = Optional.ofNullable(productDao.findById(productId));
        product.ifPresent(p -> response.addObject("productKey", p));

        response.addObject("message", "Hello World!");
        return response;
    }

    @GetMapping("/page-url")
    public ModelAndView canBeAnyFunctionNameYouWant() {
        return new ModelAndView("another-page");
    }

    @GetMapping("/search")
    public ModelAndView search(@RequestParam(required = false) String search) {
        ModelAndView response = new ModelAndView("search");

        log.debug("The user searched for the term: {}", search);
        response.addObject("search", search);

        List<Product> products = productDao.searchProductsByTitleOrCode(search);



        products.stream().forEach(product -> log.debug("Product: {}", product.getProductTitle()));
        response.addObject("products", products);

        return response;
    }

    @GetMapping("/file-upload")
    public ModelAndView fileUpload(@RequestParam Long employeeId) {
        ModelAndView response = new ModelAndView("file-upload");
        response.addObject("employeeId", employeeId);
        return response;
    }

    @PostMapping("/file-upload")
    public ModelAndView fileUploadSubmit(@RequestParam MultipartFile file, @RequestParam Long employeeId) {
        ModelAndView modelAndView = new ModelAndView("redirect:/employee/detail?employeeId=" + employeeId);

        String filename = file.getOriginalFilename();
        String extension = filename.substring(filename.lastIndexOf(".") + 1).toLowerCase();

        if (!extension.equals("jpg") && !extension.equals("png")) {
            modelAndView.setViewName("file-upload");
            modelAndView.addObject("error", "Invalid file type. Only JPG and PNG are allowed.");
            return modelAndView;
        }

        String saveFilename = "./src/main/webapp/pub/images/" + filename;
        try {
            Files.copy(file.getInputStream(), Paths.get(saveFilename), StandardCopyOption.REPLACE_EXISTING);
        } catch (Exception e) {
            log.error("Unable to finish reading file", e);
            modelAndView.setViewName("file-upload");
            modelAndView.addObject("error", "File upload failed. Please try again.");
            return modelAndView;
        }


        Optional<Employee> employeeOptional = employeeDAO.findById(employeeId);
        if (employeeOptional.isPresent()) {
            Employee employee = employeeOptional.get();
            String url = "/pub/images/" + filename;
            employee.setProfileImageUrl(url);
            employeeDAO.save(employee);
        } else {
            log.error("Employee with ID {} not found.", employeeId);
            modelAndView.setViewName("file-upload");
            modelAndView.addObject("error", "Employee not found. Please try again.");
        }

        return modelAndView;
    }


}
