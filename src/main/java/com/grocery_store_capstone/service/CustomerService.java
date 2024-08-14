package com.grocery_store_capstone.service.employeemanagementsystem;

import com.grocery_store_capstone.database.dao.CustomerDAO;
import com.grocery_store_capstone.database.entity.Customer;
import com.grocery_store_capstone.form.CreateCustomerFormBean;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Slf4j
@Service
public class CustomerService {

    @Autowired
    private CustomerDAO customerDao;

    public Customer createCustomer(CreateCustomerFormBean form) {
        Customer customer = new Customer();

        customer.setCustomerName(form.getCustomerName());
        customer.setContactFirstname(form.getContactFirstname());
        customer.setContactLastname(form.getContactLastname());
        customer.setPhone(form.getPhone());
        customer.setAddressLine1(form.getAddressLine1());
        customer.setAddressLine2(form.getAddressLine2());
        customer.setCity(form.getCity());
        customer.setState(form.getState());
        customer.setPostalCode(form.getPostalCode());
        customer.setCountry(form.getCountry());

        customerDao.save(customer);

        return customer;
    }

    public Customer updateCustomer(Integer customerId, CreateCustomerFormBean form) {
        Customer customer = customerDao.findById(customerId).orElseThrow(() -> new RuntimeException("Customer not found"));

        customer.setCustomerName(form.getCustomerName());
        customer.setContactFirstname(form.getContactFirstname());
        customer.setContactLastname(form.getContactLastname());
        customer.setPhone(form.getPhone());
        customer.setAddressLine1(form.getAddressLine1());
        customer.setAddressLine2(form.getAddressLine2());
        customer.setCity(form.getCity());
        customer.setState(form.getState());
        customer.setPostalCode(form.getPostalCode());
        customer.setCountry(form.getCountry());

        customerDao.save(customer);

        return customer;
    }

    public Customer findCustomerById(Integer customerId) {
        return customerDao.findById(customerId).orElseThrow(() -> new RuntimeException("Customer not found"));
    }

    public List<Customer> getAllCustomers() {
        return customerDao.findAll();
    }


    public void deleteCustomer(Integer customerId) {
        Customer customer = customerDao.findById(customerId).orElseThrow(() -> new RuntimeException("Customer not found"));
        customerDao.delete(customer);
    }
}
