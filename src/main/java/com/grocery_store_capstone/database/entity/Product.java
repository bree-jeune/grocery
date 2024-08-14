package com.grocery_store_capstone.database.entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Entity
@Table(name = "product")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private Long id;

    @Column(name = "product_code", nullable = false)
    private String productCode;

    @Column(name = "product_title", nullable = false)
    private String productTitle;

    @Column(name = "product_price_per_item", columnDefinition = "DECIMAL(10, 2)", nullable = false)
    private BigDecimal productPricePerItem;

    @Column(name = "product_stock", columnDefinition = "INT", nullable = false)
    private Integer productStock;

    @Column(name = "product_description", columnDefinition = "TEXT")
    private String productDescription;

    @Column(name = "product_mfd_date")
    private String productMfdDate;

    @Column(name = "product_exp_date")
    private String productExpDate;

    @Column(name = "product_company")
    private String productCompany;

    @Setter
    @Column(name = "product_image_url")
    private String productImageUrl;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "product_category",
            joinColumns = @JoinColumn(name = "product_id"),
            inverseJoinColumns = @JoinColumn(name = "category_id")
    )
    private Set<Category> categories = new HashSet<>();


    public Product(String productCode, String productTitle, BigDecimal productPricePerItem, Integer productStock, String productDescription, String productMfdDate, String productExpDate, String productCompany, String productImageUrl) {
        this.productCode = productCode;
        this.productTitle = productTitle;
        this.productPricePerItem = productPricePerItem;
        this.productStock = productStock;
        this.productDescription = productDescription;
        this.productMfdDate = productMfdDate;
        this.productExpDate = productExpDate;
        this.productCompany = productCompany;
        this.productImageUrl = productImageUrl;
    }

    @PrePersist
    public void ensureProductCode() {
        if (this.productCode == null || this.productCode.isEmpty()) {
            this.productCode = "PRD-" + UUID.randomUUID().toString().substring(0, 8);
        }
    }

    public void setImageUrl(String imageUrl) {
        this.productImageUrl = imageUrl;
    }

    public void setProductMfdDate(LocalDate mfdDate) {
        this.productMfdDate = mfdDate.format(DateTimeFormatter.ISO_LOCAL_DATE);
    }

    public void setProductExpDate(LocalDate expDate) {
        this.productExpDate = expDate.format(DateTimeFormatter.ISO_LOCAL_DATE);
    }


    public Long getProductId() {
        return id;
    }

    public BigDecimal getPrice() {
        return this.productPricePerItem;
    }

}
