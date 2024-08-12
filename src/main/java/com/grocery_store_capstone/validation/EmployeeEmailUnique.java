package com.grocery_store_capstone.validation;

import jakarta.validation.*;

import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = EmployeeEmailUniqueImpl.class)
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface EmployeeEmailUnique {

    String message() default "{EmployeeEmailUnique}";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};


}