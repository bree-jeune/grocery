package com.grocery_store_capstone.form;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

public class OrderForm {
    @NotNull
    private Long productId;

    @Min(1)
    private Integer quantity;
}
