-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2025 at 08:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


--
-- Database: `shopee`
--
CREATE DATABASE SHOPEE;
USE SHOPEE;
--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `item_id`) VALUES
(14, 1, 9),
(23, 1, 17);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `item_id` int(11) NOT NULL,
  `item_brand` varchar(200) NOT NULL,
  `item_catagory` char(20) DEFAULT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_price` double(10,2) NOT NULL,
  `item_image` varchar(255) NOT NULL,
  `item_register` datetime DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4  ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`item_id`, `item_brand`, `item_catagory`, `item_name`, `item_price`, `item_image`, `item_register`, `seller_id`) VALUES
(1, 'Samsung', 'Mobile', 'Samsung Galaxy 10', 152.00, './assets/products/1.png', '2020-03-28 11:08:57', 1),
(2, 'Redmi', 'Mobile', 'Redmi Note 7', 122.00, './assets/products/2.png', '2020-03-28 11:08:57', 2),
(3, 'Redmi', 'Mobile', 'Redmi Note 6', 122.00, './assets/products/3.png', '2020-03-28 11:08:57', 3),
(4, 'Redmi', 'Mobile', 'Redmi Note 5', 122.00, './assets/products/4.png', '2020-03-28 11:08:57', 1),
(5, 'Redmi', 'Mobile', 'Redmi Note 4', 122.00, './assets/products/5.png', '2020-03-28 11:08:57', 4),
(6, 'Redmi', 'Mobile', 'Redmi Note 8', 122.00, './assets/products/6.png', '2020-03-28 11:08:57', 3),
(7, 'Redmi', 'Mobile', 'Redmi Note 9', 122.00, './assets/products/8.png', '2020-03-28 11:08:57', 5),
(8, 'Redmi', 'Mobile', 'Redmi Note', 122.00, './assets/products/10.png', '2020-03-28 11:08:57', 3),
(9, 'Samsung', 'Mobile', 'Samsung Galaxy S6', 152.00, './assets/products/11.png', '2020-03-28 11:08:57', 2),
(10, 'Samsung', 'Mobile', 'Samsung Galaxy S7', 152.00, './assets/products/12.png', '2020-03-28 11:08:57', 2),
(11, 'Apple', 'Mobile', 'Apple iPhone 5', 152.00, './assets/products/13.png', '2020-03-28 11:08:57', 1),
(12, 'Apple', 'Mobile', 'Apple iPhone 6', 152.00, 'https://img.tttcdn.com/product/xy/2000/2000/p/gu1/P/8/PF0008GY-US-128/PF0008GY-US-128-1-fa9d-CVm7.jpg', '2020-03-28 11:08:57', 5),
(13, 'Apple', 'Mobile', 'Apple iPhone 15', 152.00, 'https://th.bing.com/th/id/OIP.yF1rY0-KHz7_my3rES0APwHaHa?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', '2020-03-28 11:08:57', 5),
(14, 'Apple', 'Mobile', 'Apple iPhone 7', 152.00, './assets/products/15.png', '2020-03-28 11:08:57', 5),
(15, 'Samsung', 'Mobile', 'Samsung Galaxy S7', 152.00, './assets/products/12.png', '2020-03-28 11:08:57', 2),
(17, 'Nokia', 'Mobile', 'Nokia1210', 1199.99, 'https://images.priceoye.pk/nokia-105-simba-pakistan-priceoye-cugfs.jpg', '2025-08-12 21:21:04', 1),
(18, 'samsung', 'Mobile', 'galaxy a71', 900.00, './assets/products/1.png', '2025-08-12 21:21:04', 1),
(20, 'Toyota', 'Vehicle', 'Toyata X-Corolla 2008', 12000.00, 'https://tse4.mm.bing.net/th/id/OIP.HltN9KBD1uqoIhJJ4O2eVQHaFj?rs=1&pid=ImgDetMain&o=7&rm=3', '2025-08-12 21:21:04', 1),
(21, 'Dhaka Publishers', 'Book', 'Bishad Shinhdu', 34.00, 'https://th.bing.com/th/id/OIP.shKdNvLrYzePpIHYvYhRSgHaLC?w=204&h=305&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', '2025-08-12 21:20:04', 1),
(23, 'HarperCollins', 'Book', 'To Kill a Mockingbird', 10.50, 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1612238791i/56916837.jpg', '2025-08-12 21:21:04', 1),
(24, 'Bloomsbury', 'Book', 'Harry Potter and the Sorcerer\'s Stone', 15.99, 'https://images-na.ssl-images-amazon.com/images/I/81YOuOGFCJL.jpg', '2025-08-12 21:21:04', 1),
(25, 'Random House', 'Book', 'The Da Vinci Code', 9.99, 'https://th.bing.com/th/id/OIP.Zlt1wn_aRt_eRwxvf82Q0wHaLj?w=200&h=312&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', '2025-08-12 21:21:04', 1),
(26, 'Simon & Schuster', 'Book', 'The Alchemist', 11.99, 'https://images-na.ssl-images-amazon.com/images/I/71aFt4+OTOL.jpg', '2025-08-12 21:21:04', 1),
(27, 'Apple', 'Mobile', 'iPhone 13', 799.00, 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-13-select-2021?wid=940&hei=1112&fmt=png-alpha&.v=1645572315986', '2025-08-12 21:21:04', 1),
(28, 'Samsung', 'Mobile', 'Galaxy S21', 699.00, 'https://mobizoo.com.br/wp-content/uploads/2021/01/samsung-galaxy-s21-1.jpg', '2025-08-12 21:21:04', 3),
(29, 'Xiaomi', 'Mobile', 'Redmi Note 10', 199.00, 'https://tse4.mm.bing.net/th/id/OIP.PxNADFuECPii0APvvZZdowHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', '2025-08-12 21:21:04', 4),
(30, 'OnePlus', 'Mobile', 'OnePlus 9', 729.00, 'https://th.bing.com/th/id/OIP.dTvNicx6vWIlYC7MvanUNgHaHa?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', '2025-08-12 21:21:04', 4),
(31, 'Google', 'Mobile', 'Pixel 6', 599.00, 'https://store.google.com/product-images/module-pixel_6_kinda_coral.png', '2025-08-12 21:21:04', 1),
(32, 'Honda', 'Vehicle', 'Honda Civic 2020', 20000.00, 'https://th.bing.com/th/id/OIP.0PbpzrA1L-s2qg6SNQtsHwHaEK?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', '2025-08-12 21:21:04', 2),
(33, 'Toyota', 'Vehicle', 'Toyota Corolla 2021', 21000.00, 'https://tse1.mm.bing.net/th/id/OIP.O-HhW1W-krlyHtrZlT-8uwHaFj?w=825&h=618&rs=1&pid=ImgDetMain&o=7&rm=3', '2025-08-12 21:21:04', 3),
(34, 'Yamaha', 'Vehicle', 'Yamaha R15', 1500.00, 'https://motortrade.com.ph/wp-content/uploads/2021/09/1-5.jpg', '2025-08-12 21:21:04', 3),
(35, 'Fresh', 'Food', '5L Fresh Oil', 50.00, 'https://tse1.mm.bing.net/th/id/OIP.2zEWs_jsUV7uvUVPffw0MQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', '2025-08-12 21:21:04', 5),
(36, 'Suzuki', 'Vehicle', 'Suzuki Swift', 18000.00, 'https://th.bing.com/th/id/OIP.iU35e9_5IQH-RADhSfU1wAHaGI?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', '2025-08-12 21:21:04', 5),
(37, 'Sony', 'Electronics', 'Sony WH-1000XM4 Headphones', 349.99, 'https://m.media-amazon.com/images/I/71o8Q5XJS5L._AC_SL1500_.jpg', '2025-08-12 21:21:04', 2),
(38, 'LG', 'Electronics', 'LG 55-inch 4K TV', 499.99, 'https://th.bing.com/th/id/R.5a7afed01a26a9c789237f96ce0c6a94?rik=Wd%2fBxGpOcPou1w&pid=ImgRaw&r=0', '2025-08-12 21:21:04', 2),
(39, 'Canon', 'Electronics', 'Canon EOS M50 Camera', 649.99, 'https://m.media-amazon.com/images/I/914hFeTU2-L._AC_SL1500_.jpg', '2025-08-12 21:21:04', 3),
(40, 'Apple', 'Mobile', 'iPad Air', 599.00, 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-air-select-202009?wid=444&hei=556&fmt=png-alpha&.v=1599066778000', '2025-08-12 21:21:04', 1),
(41, 'Bose', 'Electronics', 'Bose SoundLink Speaker', 129.00, 'https://th.bing.com/th/id/R.0349b7d5a5b71360bc5f736c55e1863a?rik=5gIVwRfQUcxF8g&pid=ImgRaw&r=0', '2025-08-12 21:21:04', 4),
(42, 'Toyota', 'Vehicle', 'Toyata X-Corolla 2013', 1220000.00, 'https://images.unsplash.com/photo-1617531653332-bd46c24f2068?q=80&w=1215&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', '2025-08-12 21:21:04', 4),
(43, 'ACI PURE', 'Food', 'Ata', 0.00, 'https://th.bing.com/th/id/R.9385c7ae6616c4326ef29caaa9ea798d?rik=X7xD1sVEYRCrWg&pid=ImgRaw&r=0&sres=1&sresct=1', '2025-08-12 21:21:05', 5),
(44, 'Google', 'Mobile', 'google pixel 7', 300.00, 'https://tse3.mm.bing.net/th/id/OIP.Kz7YK3nqAITvq74Q9C-l1AHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 8),
(46, 'Honar', 'Mobile', 'Honar 200', 200.00, 'https://tse2.mm.bing.net/th/id/OIP.1deGX0f6HCvcKJ9FyQaMSQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 9);

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `seller_id` int(11) NOT NULL,
  `seller_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `register_date` datetime DEFAULT current_timestamp(),
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4  ;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`seller_id`, `seller_name`, `email`, `password`, `register_date`, `phone`) VALUES
(1, 'David', 'david@gmail.com', '$2y$10$fCWghnOWD5O9dyHDds1yV.vCPgdPVNw2ahrWbwW4X8MoApHDAgacm', '2025-08-04 19:21:58', '01999008179'),
(3, 'Trevor', 'trevor@gmail.com', '$2y$10$WgLW7hNBaALPEzA6a9UMneJRbrMZXc2VwmzWQlHvyFwcKReCQmcFG', '2025-08-04 20:03:13', '01999007165'),
(4, 'Hassan', 'hassan@gmail.com', '$2y$10$f78q3W2YtA2fxURtkXsKTewzbFKR.NR3P5PtnG8VPucifELflc9p2', '2025-08-12 21:35:09', '01847477364'),
(5, 'Abu Hasan', 'abu@gmail.com', '$2y$10$H7tfId82JhdEZ9.kwqELVOIa/cVCfdljtGAr5WcJX.P0IOKRbRnv6', '2025-08-12 21:50:51', '01712345678'),
(6, 'Husam', 'husam@gamil.com', '$2y$10$clVLaDNuvJJOxPG2XLkCJe090/xwuzqUDFmfodeCzT4f7wJYpKWQe', '2025-08-12 22:45:38', '01999007166'),
(7, 'Yamin', 'yamin@gamil.com', '$2y$10$8UHBqRC3e6QPoj5tIIIrQuipRkv2AZzaU.f09GmA02BR0wfnY5AMy', '2025-08-12 23:09:17', '0199997890'),
(8, 'Salman', 'salman@gmail.com', '$2y$10$Q9UoXrv6pHAX.awei13D8.QmMe0JIY6yHNR1HWU4Yy8JxMQSxSCzy', '2025-08-12 23:13:43', '01999007169'),
(9, 'Naim', 'naim@gmail.com', '$2y$10$dHBxV0JYLgwC98F9q0ZYmOa9syYIlZcrFNsAoVHt.LGFphq4HyS1G', '2025-08-12 23:44:07', '01732913524');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `register_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4  ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `register_date`) VALUES
(1, 'Daily', 'Tuition', '2020-03-28 13:07:17'),
(2, 'Akshay', 'Kashyap', '2020-03-28 13:07:17');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4  ;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`cart_id`, `user_id`, `item_id`) VALUES
(15, 1, 20),
(10, 1, 11),
(19, 1, 21),
(21, 1, 11),
(2, 1, 3),
(11, 1, 3),
(9, 1, 13),
(22, 1, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`seller_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
