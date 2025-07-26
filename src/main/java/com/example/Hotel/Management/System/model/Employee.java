package com.example.Hotel.Management.System.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "employees")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String role;
    private String email;

    @ManyToOne
    @JoinColumn(name = "hotel_id")
    private Hotel hotel;
}
