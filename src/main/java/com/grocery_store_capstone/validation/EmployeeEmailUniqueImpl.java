package com.grocery_store_capstone.validation;

import com.grocery_store_capstone.database.dao.EmployeeDAO;
import com.grocery_store_capstone.database.entity.Employee;
import jakarta.validation.*;
import lombok.extern.slf4j.*;
import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.util.*;

public class EmployeeEmailUniqueImpl implements ConstraintValidator<EmployeeEmailUnique, String> {
    public static final Logger LOG = LoggerFactory.getLogger(EmployeeEmailUniqueImpl.class);

    @Autowired
    private EmployeeDAO employeeDao;


    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {

        if (StringUtils.isEmpty(value)) {
            return true;
        }

        Employee employee = employeeDao.findByEmailIgnoreCase(value);

        return (employee == null);
    }


}