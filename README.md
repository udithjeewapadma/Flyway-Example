
### 📄 Project Overview

**Hotel Management System**

This project demonstrates a full entity relationship mapping using **Spring Boot**, **JPA**, and **Hibernate** for a hotel management system.

#### 📦 Core Entities:
- Hotel, Room, Guest
- Reservation, Payment, Invoice
- Employee, RoomType, Service

Each entity is annotated using JPA (`@OneToOne`, `@OneToMany`, `@ManyToOne`) to reflect real-world relationships.

#### 🛠️ Tools Used:
- **Flyway** for managing database versioning and migrations. Example migration file: `V1__init.sql`.
- Tight coupling between backend logic and schema evolution to ensure data consistency.

#### 🎯 Purpose:
- Showcase real-world use of JPA relationships.
- Support Flyway-based schema migration.
- Serve as a solid backend foundation for a hotel management system.
