package com.grocery_store_capstone.database.entity;

import jakarta.persistence.*;
import lombok.*;

@Setter
@Getter
@Entity
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "employee")
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "employee_id")
    private Long id;

    @Column(name = "employee_first_name", nullable = false)
    private String firstName;

    @Column(name = "employee_last_name", nullable = false)
    private String lastName;

    @Column(name = "employee_title", nullable = false)
    private String jobTitle;

    @Column(name = "email", nullable = false)
    private String email;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "department_id", nullable = false)
    private Department department;

    @Column(name = "profile_image_url")
    private String profileImageUrl;

    @Setter
    @Getter
    @Column(name = "reports_to")
    private Long reportsTo;

    public void setName(String johnDoe) {
    }

    public void setPosition(String developer) {
    }
}
