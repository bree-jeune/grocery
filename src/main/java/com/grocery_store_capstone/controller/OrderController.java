package com.grocery_store_capstone.controller;

import com.grocery_store_capstone.database.dao.OrderDAO;
import com.grocery_store_capstone.database.dao.OrderDetailDAO;
import com.grocery_store_capstone.database.entity.Order;
import com.grocery_store_capstone.database.entity.OrderDetail;
import com.grocery_store_capstone.form.OrderForm;
import com.grocery_store_capstone.security.AuthenticatedUserUtilities;
import com.grocery_store_capstone.service.employeemanagementsystem.OrderService;
import com.grocery_store_capstone.database.entity.User;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
public class OrderController {

    @Autowired
    private OrderDAO orderDao;

    @Autowired
    private OrderDetailDAO orderDetailDao;

    @Autowired
    private OrderService orderService;

    @Autowired
    private AuthenticatedUserUtilities authenticatedUserUtilities;

    @GetMapping("/order/orderdetail")
    public ModelAndView orderDetail() {
        ModelAndView response = new ModelAndView("order/orderdetail");

        User user = authenticatedUserUtilities.getCurrentUser();

        Order order = orderDao.findOrderInCartStatus(user.getId());

        if (order != null) {
            List<OrderDetail> orderDetails = orderDetailDao.findByOrder(order);
            response.addObject("orderDetails", orderDetails);

            Double orderTotal = orderDao.getOrderTotal(order.getId());
            response.addObject("orderTotal", orderTotal);
        }

        return response;
    }

    @GetMapping("/order")
    public String showOrderForm(Model model) {
        model.addAttribute("order", new OrderForm());
        return "orderForm";
    }

    @PostMapping("/order")
    public String submitOrder(@Valid @ModelAttribute OrderForm orderForm, BindingResult result) {
        if (result.hasErrors()) {
            return "orderForm";
        }

        Order order = new Order();
        orderService.processOrder(order);
        return "orderSuccess";
    }


    @GetMapping("/order/{orderId}")
    public String viewOrder(@PathVariable Long orderId, Model model) {
        Order order = orderService.findOrderById(orderId);
        model.addAttribute("order", order);
        return "orderDetails";
    }
}
