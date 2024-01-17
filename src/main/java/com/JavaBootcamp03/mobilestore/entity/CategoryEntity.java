package com.JavaBootcamp03.mobilestore.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.util.List;

@Data
@Entity(name = "category")
public class CategoryEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "categoryName")
    private String name;

    @OneToMany(mappedBy = "category")
    private List<ProductEntity> products;
}
