create database host_sepay;
create user 'host_sepay'@'localhost' identified by 'doanmanhtat';
grant all privileges on host_sepay.* to  'host_sepay'@'localhost' identified by 'doanmanhtat';

use host_sepay;
CREATE TABLE `tb_transactions` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `gateway` varchar(100) NOT NULL,
    `transaction_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    `account_number` varchar(100) DEFAULT NULL,
    `sub_account` varchar(250) DEFAULT NULL,
    `amount_in` decimal(20,2) NOT NULL DEFAULT 0.00,
    `amount_out` decimal(20,2) NOT NULL DEFAULT 0.00,
    `accumulated` decimal(20,2) NOT NULL DEFAULT 0.00,
    `code` varchar(250) DEFAULT NULL,
    `transaction_content` text DEFAULT NULL,
    `reference_number` varchar(255) DEFAULT NULL,
    `body` text DEFAULT NULL,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

CREATE TABLE `tb_orders` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `total` decimal(20,2) NOT NULL DEFAULT 0.00,
    `payment_status` enum('Unpaid','Paid','Cancelled','Refunded') NOT NULL DEFAULT 'Unpaid',
    `name` varchar(250),
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;