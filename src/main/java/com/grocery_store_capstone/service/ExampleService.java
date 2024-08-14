package com.grocery_store_capstone.service.employeemanagementsystem;

import java.util.Arrays;
import java.util.List;

public class ExampleService {
    public void printNames() {
        List<String> names = Arrays.asList("John", "Jane", "Doe");
        names.forEach(name -> System.out.println(name));
    }
}
