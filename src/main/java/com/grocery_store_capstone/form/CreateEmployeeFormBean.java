package com.grocery_store_capstone.form;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CreateEmployeeFormBean {
    private Long employeeId;
    private String lastName;
    private Long reportsTo;
    private Long departmentId;

    @NotNull(message = "First name is required")
    private String firstName;

    @Email(message = "Email should be valid")
    @NotNull(message = "Email is required")
    private String email;



}
