package com.example.Hotel.Management.System.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "payments")
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private double amount;
    private String paymentMethod;
    private LocalDateTime paymentDate;

    @OneToOne
    @JoinColumn(name = "reservation_id")
    private Reservation reservation;
}
