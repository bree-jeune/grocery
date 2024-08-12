package com.grocery_store_capstone.database.dao;

import com.grocery_store_capstone.database.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO extends JpaRepository<User, Integer> {

    User findByUsername(String username);

    @Query("SELECT COUNT(u) FROM User u")
    int getTotalUsers();

    @Query("SELECT COUNT(p) FROM Product p")
    int getTotalProducts();

    @Query("SELECT COUNT(o) FROM Order o")
    int getTotalOrders();

    User findByEmailIgnoreCase(String username);
}
