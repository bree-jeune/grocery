package com.grocery_store_capstone.database.dao;

import org.springframework.data.jpa.repository.*;
import com.grocery_store_capstone.database.entity.UserRole;

import java.util.*;

public interface UserRoleDAO extends JpaRepository<UserRole, Long> {


    List<UserRole> findByUserId(Integer userId);

}