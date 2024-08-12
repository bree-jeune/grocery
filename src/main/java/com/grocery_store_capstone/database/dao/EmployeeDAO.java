package com.grocery_store_capstone.database.dao;

import com.grocery_store_capstone.database.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmployeeDAO extends JpaRepository<Employee, Integer> {

    Employee findByEmailIgnoreCase(String email);

}
