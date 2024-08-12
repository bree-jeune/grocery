package com.grocery_store_capstone.form;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateCustomerFormBean {

    private Integer customerId;

    @NotEmpty(message = "Customer name is required")
    private String customerName;

    @NotEmpty(message = "First name is required")
    private String contactFirstname;

    @NotEmpty(message = "Last name is required")
    private String contactLastname;

    @NotEmpty(message = "Phone number is required")
    private String phone;

    private String addressLine1;
    private String addressLine2;
    private String city;
    private String state;
    private String postalCode;
    private String country;

}
