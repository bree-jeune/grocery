package com.grocery_store_capstone;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.grocery_store_capstone"})
public class GroceryStoreCapstoneApplication {

	public static void main(String[] args) {
		SpringApplication.run(GroceryStoreCapstoneApplication.class, args);
	}

}
