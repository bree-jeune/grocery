package com.grocery_store_capstone.database.dao;


import com.grocery_store_capstone.database.entity.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentDAO extends JpaRepository<Department, Integer> {
    List<Department> findByName(String name);
}
