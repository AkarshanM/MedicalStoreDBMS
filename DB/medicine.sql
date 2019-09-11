-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 29, 2018 at 07:37 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medicine`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `Proc`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc` (IN `supplier_name` VARCHAR(20), IN `supplier_address` VARCHAR(20), IN `supplier_contact1` VARCHAR(10), IN `supplier_contact2` VARCHAR(10))  BEGIN
INSERT INTO supplier_details(supplier_name,supplier_address,supplier_contact1,supplier_contact2) VALUES(@supplier_name,@supplier_address,@supplier_contact1,@supplier_contact2);
END$$

DROP PROCEDURE IF EXISTS `Sel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sel` (OUT `supp_id` INT(10), OUT `supplier_name` VARCHAR(20), OUT `supplier_address` VARCHAR(20), OUT `supplier_contact1` VARCHAR(10), OUT `supplier_contact2` VARCHAR(10))  BEGIN
SELECT * from supplier_details;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

DROP TABLE IF EXISTS `customer_details`;
CREATE TABLE IF NOT EXISTS `customer_details` (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(20) NOT NULL,
  `cus_address` varchar(20) NOT NULL,
  `cus_contact1` int(20) NOT NULL,
  `cus_contact2` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
CREATE TABLE IF NOT EXISTS `product_details` (
  `prod_id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_name` varchar(20) DEFAULT NULL,
  `company` varchar(10) DEFAULT '',
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2417 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`prod_id`, `product_name`, `company`) VALUES
(1, 'Livosize-M', 'Systopic'),
(2, 'paracetamol', 'cipla'),
(3, 'Acelofenac', 'Reddy labs'),
(4, 'sdfa', 'abc'),
(5, 'asdf', 'qwer'),
(6, 'asdf', 'qwre'),
(7, 'paracetamol', 'cipla'),
(9, 'citrizine', 'cipla'),
(24, 'asdf', 'fdbn');

-- --------------------------------------------------------

--
-- Table structure for table `stock_avail`
--

DROP TABLE IF EXISTS `stock_avail`;
CREATE TABLE IF NOT EXISTS `stock_avail` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `stock_name` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_details`
--

DROP TABLE IF EXISTS `stock_details`;
CREATE TABLE IF NOT EXISTS `stock_details` (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(20) NOT NULL,
  `add_quantity` int(20) DEFAULT NULL,
  `avail_quantity` int(20) NOT NULL,
  `cost` int(20) NOT NULL,
  `selling_price` int(20) DEFAULT NULL,
  `date` date NOT NULL,
  `expire_date` date NOT NULL,
  `tod` varchar(20) DEFAULT NULL,
  `product_name` varchar(20) NOT NULL,
  `supplier_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_details`
--

INSERT INTO `stock_details` (`id`, `batch_no`, `add_quantity`, `avail_quantity`, `cost`, `selling_price`, `date`, `expire_date`, `tod`, `product_name`, `supplier_name`) VALUES
(2, '5', 4, 18, 123, NULL, '2018-12-16', '2020-12-14', NULL, 'Livosize-M', 'akarshan'),
(4, '7', 6, 648, 321, NULL, '2020-12-12', '2023-12-16', NULL, 'asdf', 'afdsasdg'),
(5, '7', 50, 600, 10000, NULL, '2018-11-02', '2020-11-02', NULL, 'paracetamol', 'balaji'),
(6, '9', 50, 50, 4, NULL, '2018-11-04', '2020-11-04', NULL, 'citrizine', 'manjula'),
(7, '17', 6, 648, 10, NULL, '2018-02-27', '2018-09-27', NULL, 'asdf', 'qwr');

-- --------------------------------------------------------

--
-- Table structure for table `stock_sales`
--

DROP TABLE IF EXISTS `stock_sales`;
CREATE TABLE IF NOT EXISTS `stock_sales` (
  `s_id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(20) NOT NULL,
  `date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `product_name` varchar(20) NOT NULL,
  `add_quantity` int(20) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `subtotal` decimal(20,0) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_sales`
--

INSERT INTO `stock_sales` (`s_id`, `customer_name`, `date`, `product_name`, `add_quantity`, `cost`, `subtotal`) VALUES
(1, 'akarshan', '2018-11-27 00:00:00', 'asdf', 6, '321.00', '1926');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_details`
--

DROP TABLE IF EXISTS `supplier_details`;
CREATE TABLE IF NOT EXISTS `supplier_details` (
  `supp_id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(20) NOT NULL,
  `supplier_address` varchar(25) NOT NULL,
  `supplier_contact1` varchar(10) NOT NULL,
  `supplier_contact2` varchar(10) NOT NULL,
  PRIMARY KEY (`supp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_details`
--

INSERT INTO `supplier_details` (`supp_id`, `supplier_name`, `supplier_address`, `supplier_contact1`, `supplier_contact2`) VALUES
(1, 'Biotic life science', 'nlp', '9784847484', '9648498949'),
(2, 'Life Guard', 'GHY', '7887998899', '8878878878'),
(3, 'nlp', 'khelmati', '1234', '4321'),
(5, 'akarshan', 'blr', '1234567891', '2134567895'),
(10, 'chandan', 'hir', '9876453219', '1234567983'),
(11, 'balaji', 'blr', '3216549872', '1234567891'),
(12, 'manjula', 'dvg', '1234567891', '9876543211'),
(14, 'aku', 'xcvb', '321654', '9876354'),
(15, 'qwr', 'savc', '1234', '3456');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `USERNAME` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`USERNAME`) VALUES
('asdf'),
('gat');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(2, 'admin', 'admin'),
(8, 'akarshan', 'akarshan'),
(12, 'asdfasfd', 'asdf'),
(20, 'asdf', 'asdf'),
(21, 'gat', 'gat');

--
-- Triggers `users`
--
DROP TRIGGER IF EXISTS `Login`;
DELIMITER $$
CREATE TRIGGER `Login` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
    INSERT INTO user SET USERNAME = NEW.username;
  END
$$
DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
