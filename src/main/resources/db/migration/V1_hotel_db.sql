CREATE TABLE `hotels` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `address` varchar(255) DEFAULT NULL,
                          `name` varchar(255) DEFAULT NULL,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `room_types` (
                              `id` bigint NOT NULL AUTO_INCREMENT,
                              `price` double NOT NULL,
                              `type` varchar(255) DEFAULT NULL,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `guests` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `email` varchar(255) DEFAULT NULL,
                          `full_name` varchar(255) DEFAULT NULL,
                          `phone` varchar(255) DEFAULT NULL,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `payments` (
                            `id` bigint NOT NULL AUTO_INCREMENT,
                            `amount` double NOT NULL,
                            `payment_date` datetime(6) DEFAULT NULL,
                            `payment_method` varchar(255) DEFAULT NULL,
                            `reservation_id` bigint DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `UKe7qdxh4fch1yfisduker8j6w2` (`reservation_id`),
                            CONSTRAINT `FKp8yh4sjt3u0g6aru1oxfh3o14` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ;

CREATE TABLE `invoices` (
                            `id` bigint NOT NULL AUTO_INCREMENT,
                            `date_issued` date DEFAULT NULL,
                            `invoice_number` varchar(255) DEFAULT NULL,
                            `total_amount` double NOT NULL,
                            `reservation_id` bigint DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `UK6t7ctxgwv5ahht8vtcn3fxow5` (`reservation_id`),
                            CONSTRAINT `FKkga8j6hh54xf5hl3qiovlsa4l` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `employees` (
                             `id` bigint NOT NULL,
                             `email` varchar(255) DEFAULT NULL,
                             `name` varchar(255) DEFAULT NULL,
                             `role` varchar(255) DEFAULT NULL,
                             `hotel_id` bigint DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             KEY `FKl6mewl85djruoxecubfwwn07u` (`hotel_id`),
                             CONSTRAINT `FKl6mewl85djruoxecubfwwn07u` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `services` (
                            `id` bigint NOT NULL AUTO_INCREMENT,
                            `cost` double NOT NULL,
                            `name` varchar(255) DEFAULT NULL,
                            `reservation_id` bigint DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            KEY `FKrsok8yk712cipirtrjk5wl2rv` (`reservation_id`),
                            CONSTRAINT `FKrsok8yk712cipirtrjk5wl2rv` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rooms` (
                         `id` bigint NOT NULL AUTO_INCREMENT,
                         `is_available` bit(1) NOT NULL,
                         `room_number` varchar(255) DEFAULT NULL,
                         `hotel_id` bigint DEFAULT NULL,
                         `room_type_id` bigint DEFAULT NULL,
                         PRIMARY KEY (`id`),
                         KEY `FKp5lufxy0ghq53ugm93hdc941k` (`hotel_id`),
                         KEY `FKh9m2n1paq5hmd3u0klfl7wsfv` (`room_type_id`),
                         CONSTRAINT `FKh9m2n1paq5hmd3u0klfl7wsfv` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`),
                         CONSTRAINT `FKp5lufxy0ghq53ugm93hdc941k` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `reservations` (
                                `id` bigint NOT NULL AUTO_INCREMENT,
                                `check_in_date` date DEFAULT NULL,
                                `check_out_date` date DEFAULT NULL,
                                `guest_id` bigint DEFAULT NULL,
                                `room_id` bigint DEFAULT NULL,
                                PRIMARY KEY (`id`),
                                KEY `FKa0e6sbbuw25f8cwciqaune89n` (`guest_id`),
                                KEY `FKljt6q1tp205b0h26eiegc5mx6` (`room_id`),
                                CONSTRAINT `FKa0e6sbbuw25f8cwciqaune89n` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`id`),
                                CONSTRAINT `FKljt6q1tp205b0h26eiegc5mx6` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;