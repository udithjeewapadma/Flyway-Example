package com.example.Hotel.Management.System.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;

@Entity
@Data
@Table(name = "invoices")
public class Invoice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String invoiceNumber;
    private LocalDate dateIssued;
    private double totalAmount;

    @OneToOne
    @JoinColumn(name = "reservation_id")
    private Reservation reservation;
}
