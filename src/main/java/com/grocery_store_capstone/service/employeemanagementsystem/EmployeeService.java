package com.grocery_store_capstone.service.employeemanagementsystem;

import com.grocery_store_capstone.database.entity.Department;
import com.grocery_store_capstone.form.CreateEmployeeFormBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.grocery_store_capstone.database.dao.EmployeeDAO;
import com.grocery_store_capstone.database.entity.Employee;
import com.grocery_store_capstone.database.dao.DepartmentDAO;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeDAO employeeDAO;

    @Autowired
    private DepartmentDAO departmentDAO;

    public List<Employee> getAllEmployees() {
        return employeeDAO.findAll();
    }

    public Employee createEmployee(CreateEmployeeFormBean form) {
        Employee employee;
        if (form.getEmployeeId() != null) {
            employee = employeeDAO.findById(form.getEmployeeId()).orElse(new Employee());
        } else {
            employee = new Employee();
        }

        employee.setFirstName(form.getFirstName());
        employee.setLastName(form.getLastName());
        employee.setEmail(form.getEmail());
        employee.setReportsTo(form.getReportsTo());

        Department department = departmentDAO.findById(form.getDepartmentId()).orElse(null);
        if (department != null) {
            employee.setDepartment(department);
        }

        employee = employeeDAO.save(employee);
        return employee;
    }
}
