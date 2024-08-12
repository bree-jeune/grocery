package com.grocery_store_capstone.controller;

import com.grocery_store_capstone.database.dao.OrderDAO;
import com.grocery_store_capstone.database.dao.OrderDetailDAO;
import com.grocery_store_capstone.database.dao.ProductDAO;
import com.grocery_store_capstone.database.entity.Order;
import com.grocery_store_capstone.database.entity.OrderDetail;
import com.grocery_store_capstone.database.entity.Product;
import com.grocery_store_capstone.security.AuthenticatedUserUtilities;
import com.grocery_store_capstone.database.entity.User;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Slf4j
@Controller
@RequestMapping("/orderDetail")
public class OrderDetailController {

    @Autowired
    private OrderDAO orderDao;

    @Autowired
    private OrderDetailDAO orderDetailDao;

    @Autowired
    private ProductDAO productDao;

    @Autowired
    private AuthenticatedUserUtilities authenticatedUserUtilities;

    @GetMapping("/list")
    public ModelAndView listOrderDetails() {
        ModelAndView response = new ModelAndView("order/orderdetail");

        User user = authenticatedUserUtilities.getCurrentUser();
        Order order = orderDao.findOrderInCartStatus(user.getId());

        if (order != null) {
            List<Map<String, Object>> orderDetails = orderDao.getOrderDetails(order.getId());
            response.addObject("orderDetails", orderDetails);

            Double orderTotal = orderDao.getOrderTotal(order.getId());
            response.addObject("orderTotal", orderTotal);
        }

        return response;
    }

    @PostMapping("/add")
    public ModelAndView addProductToCart(@RequestParam Long productId, @RequestParam Integer quantity) {
        ModelAndView response = new ModelAndView("redirect:/orderDetail/list");

        Optional<Product> productOpt = productDao.findById(productId);
        User user = authenticatedUserUtilities.getCurrentUser();

        if (productOpt.isPresent()) {
            Product product = productOpt.get();
            Order order = orderDao.findOrderInCartStatus(user.getId());

            if (order == null) {
                order = new Order();
                order.setUser(user);
                order.setOrderDate(new Date());
                order.setStatus("CART");
                orderDao.save(order);
            }

            OrderDetail orderDetail = orderDetailDao.findProductInCart(order.getId(), Math.toIntExact(productId));
            if (orderDetail == null) {
                orderDetail = new OrderDetail();
                orderDetail.setOrder(order);
                orderDetail.setProduct(Optional.of(product));
                orderDetail.setQuantityOrdered(quantity);
                orderDetailDao.save(orderDetail);
            } else {
                orderDetail.setQuantityOrdered(orderDetail.getQuantityOrdered() + quantity);
                orderDetailDao.save(orderDetail);
            }
        }

        return response;
    }

    @PostMapping("/update")
    public ModelAndView updateOrderDetail(@RequestParam Long orderDetailId, @RequestParam Integer quantity) {
        ModelAndView response = new ModelAndView("redirect:/orderDetail/list");

        Optional<OrderDetail> orderDetailOpt = orderDetailDao.findById(Math.toIntExact(orderDetailId));
        if (orderDetailOpt.isPresent()) {
            OrderDetail orderDetail = orderDetailOpt.get();
            orderDetail.setQuantityOrdered(quantity);
            orderDetailDao.save(orderDetail);
        }

        return response;
    }


    @PostMapping("/delete")
    public ModelAndView deleteOrderDetail(@RequestParam Long orderDetailId) {
        ModelAndView response = new ModelAndView("redirect:/orderDetail/list");

        Optional<OrderDetail> orderDetailOpt = orderDetailDao.findById(Math.toIntExact(orderDetailId));
        orderDetailOpt.ifPresent(orderDetailDao::delete);

        return response;
    }

    @PostMapping("/checkout")
    public ModelAndView checkoutOrder() {
        ModelAndView response = new ModelAndView("redirect:/orderDetail/list");

        User user = authenticatedUserUtilities.getCurrentUser();
        Order order = orderDao.findOrderInCartStatus(user.getId());

        if (order != null) {
            order.setStatus("COMPLETE");
            orderDao.save(order);
        }

        return response;
    }
}
