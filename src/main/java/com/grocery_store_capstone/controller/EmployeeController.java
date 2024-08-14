package com.grocery_store_capstone.controller;

import com.grocery_store_capstone.database.dao.DepartmentDAO;
import com.grocery_store_capstone.database.dao.EmployeeDAO;
import com.grocery_store_capstone.database.entity.Department;
import com.grocery_store_capstone.database.entity.Employee;
import com.grocery_store_capstone.form.CreateEmployeeFormBean;
import com.grocery_store_capstone.service.EmployeeService;
import jakarta.annotation.*;
import jakarta.validation.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.*;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeDAO employeeDAO;

    @Autowired
    private DepartmentDAO departmentDAO;

    @Autowired
    private EmployeeService employeeService;

    @PostConstruct
    public void init() {

    }

    @GetMapping("/detail")
    public ModelAndView detail(@RequestParam Long employeeId) {
        ModelAndView response = new ModelAndView("employee/detail");

        Employee employee = employeeDAO.findById(employeeId).orElse(null);
        if (employee != null) {
            response.addObject("employee", employee);
            response.addObject("department", employee.getDepartment());
        } else {
            response.addObject("errorMessage", "Employee not found.");
        }

        return response;
    }

    @GetMapping("/create")
    public ModelAndView create() {
        ModelAndView response = new ModelAndView("employee/create");
        loadDropdowns(response);
        return response;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(required = false) Long employeeId) {
        ModelAndView response = new ModelAndView("employee/create");

        loadDropdowns(response);

        if (employeeId != null) {
            Employee employee = employeeDAO.findById(employeeId).orElse(null);
            if (employee != null) {
                CreateEmployeeFormBean form = new CreateEmployeeFormBean();
                form.setEmployeeId(employee.getId());
                form.setEmail(employee.getEmail());
                form.setFirstName(employee.getFirstName());
                form.setLastName(employee.getLastName());
                form.setReportsTo(employee.getReportsTo());
                form.setDepartmentId((long) employee.getDepartment().getId());
                response.addObject("form", form);
            } else {
                response.addObject("errorMessage", "Employee not found.");
            }
        }

        return response;
    }

    @RequestMapping(value = "/createSubmit", method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView createSubmit(@Valid CreateEmployeeFormBean form, BindingResult bindingResult) {
        ModelAndView response = new ModelAndView();

        if (form.getEmployeeId() == null) {
            Employee existingEmployee = employeeDAO.findByEmailIgnoreCase(form.getEmail());
            if (existingEmployee != null) {
                bindingResult.rejectValue("email", "email", "This email is already in use.");
            }
        }

        if (bindingResult.hasErrors()) {
            for (ObjectError error : bindingResult.getAllErrors()) {
                log.debug("Validation error: " + ((FieldError) error).getField() + " = " + error.getDefaultMessage());
            }
            loadDropdowns(response);
            response.addObject("bindingResult", bindingResult);
            response.addObject("form", form);
            response.setViewName("employee/create");
            return response;
        } else {
            Employee employee = employeeService.createEmployee(form);
            response.setViewName("redirect:/employee/detail?employeeId=" + employee.getId());
            return response;
        }
    }

    private void loadDropdowns(ModelAndView response) {
        List<Employee> reportsToEmployees = employeeDAO.findAll();
        response.addObject("reportsToEmployees", reportsToEmployees);

        List<Department> departments = departmentDAO.findAll();
        response.addObject("departments", departments);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Employee> getEmployeeById(@PathVariable Long id) {
        Employee employee = employeeService.getEmployeeById(id);
        if (employee == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(employee);
    }

}
