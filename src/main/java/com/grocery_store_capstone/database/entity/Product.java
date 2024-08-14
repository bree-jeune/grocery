package com.grocery_store_capstone.database.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.Set;

import java.math.BigDecimal;

@Setter
@Getter
@Entity
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "product_category_id", nullable = false)
    private Category category;

    @Setter
    @Getter
    @Column(name = "product_code", nullable = false)
    private String productCode;

    @Getter
    @Setter
    @Column(name = "product_title", nullable = false)
    private String productTitle;

    @Setter
    @Getter
    @Column(name = "product_price_per_item", columnDefinition = "DECIMAL(10, 2)", nullable = false)
    private BigDecimal productPricePerItem;

    @Column(name = "product_stock", columnDefinition = "INT", nullable = false)
    private Integer productStock;

    @Column(name = "product_description", columnDefinition="TEXT")
    private String productDescription;

    @Column(name = "product_mfd_date")
    private String productMfdDate;

    @Column(name = "product_exp_date")
    private String productExpDate;

    @Column(name = "product_company")
    private String productCompany;

    @Setter
    @Getter
    @Column(name = "product_image_url")
    private String productImageUrl;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "product_category",
            joinColumns = @JoinColumn(name = "product_id"),
            inverseJoinColumns = @JoinColumn(name = "category_id")
    )
    private Set<Category> categories;


    public Product(String productCode, String productTitle, BigDecimal productPricePerItem, Integer productStock, String productDescription, String productMfdDate, String productExpDate, String productCompany, String productImageUrl, Category category) {
        this.productCode = productCode;
        this.productTitle = productTitle;
        this.productPricePerItem = productPricePerItem;
        this.productStock = productStock;
        this.productDescription = productDescription;
        this.productMfdDate = productMfdDate;
        this.productExpDate = productExpDate;
        this.productCompany = productCompany;
        this.productImageUrl = productImageUrl;
        this.category = category;
    }

}
