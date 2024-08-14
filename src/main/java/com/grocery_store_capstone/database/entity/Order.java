package com.grocery_store_capstone.database.entity;

import jakarta.persistence.*;
import lombok.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "orders")
public class Order {


    @Getter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;

    @ManyToOne(fetch = FetchType.LAZY, optional = true)
    @JoinColumn(name = "employee_id", nullable = true)
    private Employee employee;

    @Column(name = "order_date", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date orderDate;

    @Column(name = "required_date")
    @Temporal(TemporalType.DATE)
    private Date requiredDate;

    @Column(name = "shipped_date")
    @Temporal(TemporalType.DATE)
    private Date shippedDate;

    @Column(name = "status", nullable = false)
    private String status;

    @Column(name = "comments", columnDefinition = "TEXT")
    private String comments;

    @OneToMany(mappedBy = "order", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<OrderDetail> orderDetails;

    public void setUser(User user) {

    }


    public BigDecimal getTotal() {
        return orderDetails.stream()
                .map(od -> BigDecimal.valueOf(od.getQuantityOrdered()).multiply(od.getProduct().getProductPricePerItem()))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }





}
