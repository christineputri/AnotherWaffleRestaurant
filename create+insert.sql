-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2022 at 04:30 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `another_waffle_restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` char(5) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_address` varchar(50) NOT NULL,
  `customer_gender` varchar(6) NOT NULL,
  `customer_dob` date NOT NULL,
  `joined_date` date NOT NULL
) ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_address`, `customer_gender`, `customer_dob`, `joined_date`) VALUES
('CU001', 'Nick Lorenzo', '21 Bradford Street', 'Male', '1998-09-11', '2022-03-14'),
('CU002', 'Sue Coulson', '808 Harrison Street', 'Female', '1989-03-21', '2022-05-27'),
('CU003', 'Justine Cornish', '437 Thorne Court', 'Male', '2000-08-18', '2021-06-21'),
('CU004', 'Georgia Lealobos', '1 Walnut Drive', 'Female', '1974-01-12', '2021-08-01'),
('CU005', 'Mirian Gamble', '288 Marlborough Street', 'Male', '1991-12-25', '2022-09-05'),
('CU006', 'Levi Hitchston', '10 Oak Street', 'Male', '1993-10-07', '2021-11-03'),
('CU007', 'Iqrah Waller', '199 Golden Star Boulevard', 'Female', '1990-07-13', '2022-02-14'),
('CU008', 'Thelma Callahan', '587 Silver Spear Street', 'Female', '2001-04-26', '2022-04-29'),
('CU009', 'Mahima Conelly', '31 Brookside Drive', 'Female', '1996-11-27', '2022-05-01'),
('CU010', 'Umayr Croft', '3 Joy Ridge Drive', 'Male', '1989-01-25', '2021-12-09');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` char(5) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_type_id` char(5) NOT NULL
) ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_type_id`) VALUES
('PR001', 'Root Beer', 16000, 'PT001'),
('PR002', 'Cranberry Juice', 21000, 'PT004'),
('PR003', 'New York-Style Hot Dogs', 42999, 'PT003'),
('PR004', 'Chocolate Ice Cream Waffle', 61299, 'PT005'),
('PR005', 'Impossible Burger', 52999, 'PT010'),
('PR006', 'Beef Carbonara', 49999, 'PT009'),
('PR007', 'Chicken Risotto', 37999, 'PT007'),
('PR008', 'Quarter Pounder Burger', 38900, 'PT006'),
('PR009', 'Caesar Salad', 34900, 'PT002'),
('PR010', 'Doctor Pepper', 21000, 'PT001');

-- --------------------------------------------------------

--
-- Table structure for table `product_types`
--

CREATE TABLE `product_types` (
  `product_type_id` char(5) NOT NULL,
  `product_type_name` varchar(50) DEFAULT NULL,
  `is_vegan` varchar(3) DEFAULT NULL
) ;

--
-- Dumping data for table `product_types`
--

INSERT INTO `product_types` (`product_type_id`, `product_type_name`, `is_vegan`) VALUES
('PT001', 'Soda', 'yes'),
('PT002', 'Salad', 'yes'),
('PT003', 'Hot Dogs', 'no'),
('PT004', 'Juice', 'yes'),
('PT005', 'Waffle', 'yes'),
('PT006', 'Burger', 'no'),
('PT007', 'Rice', 'no'),
('PT008', 'Noodle', 'no'),
('PT009', 'Pasta', 'no'),
('PT010', 'Veggie Burger', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `staff_id` char(5) NOT NULL,
  `staff_name` varchar(50) DEFAULT NULL,
  `staff_gender` varchar(6) DEFAULT NULL,
  `staff_address` varchar(50) DEFAULT NULL,
  `staff_employment_type` varchar(50) DEFAULT NULL,
  `staff_salary` int(10) DEFAULT NULL
) ;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`staff_id`, `staff_name`, `staff_gender`, `staff_address`, `staff_employment_type`, `staff_salary`) VALUES
('ST001', 'Muhamed Kouma', 'Male', '41 Winchester Dr.', 'Full-Time', 6200000),
('ST002', 'Jerome Carver', 'Male', '991 E. Garden Court', 'Part-Time', 3150000),
('ST003', 'Jad Warner', 'Male', '787 NE. Fairview Ave.', 'Part-Time', 2800000),
('ST004', 'Vernon Lowe', 'Female', '729 W. Washington St.', 'Full-Time', 5725000),
('ST005', 'Kathryn Sullivan', 'Female', '7348 Purple Finch Ave.', 'Full-Time', 8160000),
('ST006', 'Katarina Garza', 'Female', '201 Tailwater Lane', 'Part-Time', 3050000),
('ST007', 'Buddy Houghton', 'Male', '199 Newbridge Street', 'Full-Time', 16750000),
('ST008', 'Gianni Armstrong', 'Male', '374 E. Walnutwood Ave.', 'Full-Time', 12100000),
('ST009', 'Darcie-Mae Pacheco', 'Female', '7775 Wayne St.', 'Full-Time', 45420000),
('ST010', 'Daisy-Mae Roman', 'Female', '8598 North Hawthorne Avenue', 'Full-Time', 19100000);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_details`
--

CREATE TABLE `transaction_details` (
  `transaction_id` char(5) NOT NULL,
  `product_id` char(5) NOT NULL,
  `quantity` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_details`
--

INSERT INTO `transaction_details` (`transaction_id`, `product_id`, `quantity`) VALUES
('TR001', 'PR002', 1),
('TR001', 'PR005', 4),
('TR002', 'PR003', 7),
('TR002', 'PR006', 9),
('TR003', 'PR009', 3),
('TR004', 'PR001', 1),
('TR004', 'PR007', 1),
('TR004', 'PR010', 1),
('TR005', 'PR003', 3),
('TR005', 'PR005', 1),
('TR006', 'PR004', 4),
('TR006', 'PR009', 5),
('TR007', 'PR001', 1),
('TR007', 'PR002', 2),
('TR007', 'PR003', 6),
('TR008', 'PR002', 1),
('TR009', 'PR002', 1),
('TR010', 'PR009', 3),
('TR010', 'PR010', 4),
('TR011', 'PR001', 1),
('TR011', 'PR003', 2),
('TR012', 'PR005', 1),
('TR013', 'PR007', 3),
('TR014', 'PR003', 2),
('TR015', 'PR008', 4);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_headers`
--

CREATE TABLE `transaction_headers` (
  `transaction_id` char(5) NOT NULL,
  `customer_id` char(5) NOT NULL,
  `staff_id` char(5) NOT NULL,
  `transaction_date` date NOT NULL
) ;

--
-- Dumping data for table `transaction_headers`
--

INSERT INTO `transaction_headers` (`transaction_id`, `customer_id`, `staff_id`, `transaction_date`) VALUES
('TR001', 'CU001', 'ST010', '2022-01-14'),
('TR002', 'CU003', 'ST004', '2022-01-21'),
('TR003', 'CU007', 'ST007', '2022-03-18'),
('TR004', 'CU004', 'ST002', '2022-05-25'),
('TR005', 'CU002', 'ST006', '2022-06-03'),
('TR006', 'CU009', 'ST009', '2022-06-08'),
('TR007', 'CU010', 'ST006', '2022-06-21'),
('TR008', 'CU006', 'ST005', '2022-07-14'),
('TR009', 'CU003', 'ST006', '2022-08-01'),
('TR010', 'CU006', 'ST007', '2022-08-02'),
('TR011', 'CU002', 'ST003', '2022-08-13'),
('TR012', 'CU001', 'ST004', '2022-09-02'),
('TR013', 'CU008', 'ST008', '2022-09-13'),
('TR014', 'CU005', 'ST001', '2022-09-14'),
('TR015', 'CU003', 'ST005', '2022-09-16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_type_id` (`product_type_id`);

--
-- Indexes for table `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`product_type_id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD PRIMARY KEY (`transaction_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `transaction_headers`
--
ALTER TABLE `transaction_headers`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_types` (`product_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD CONSTRAINT `transaction_details_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction_headers` (`transaction_id`),
  ADD CONSTRAINT `transaction_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `transaction_headers`
--
ALTER TABLE `transaction_headers`
  ADD CONSTRAINT `transaction_headers_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_headers_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
