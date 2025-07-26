package com.example.Hotel.Management.System.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "services")
public class Service {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private double cost;

    @ManyToOne
    @JoinColumn(name = "reservation_id")
    private Reservation reservation;
}
