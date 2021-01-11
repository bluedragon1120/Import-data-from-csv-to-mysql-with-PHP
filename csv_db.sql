-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2020 at 11:04 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `csv_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `capabilities`
--

CREATE TABLE `capabilities` (
  `capability_id` bigint(20) NOT NULL,
  `capability_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` bigint(20) NOT NULL,
  `car_brand` varchar(20) NOT NULL,
  `car_model` varchar(20) NOT NULL,
  `car_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `company_id` bigint(20) NOT NULL,
  `company_nr` datetime NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_image` varchar(50) DEFAULT NULL,
  `company_street` varchar(50) NOT NULL,
  `company_streetnr` int(10) NOT NULL,
  `company_postcode` int(10) NOT NULL,
  `company_city` varchar(20) NOT NULL,
  `company_country` varchar(20) NOT NULL,
  `company_traderegister` varchar(20) NOT NULL,
  `company_vatnr` varchar(20) DEFAULT NULL,
  `company_taxnr` varchar(20) DEFAULT NULL,
  `company_bankname` varchar(20) NOT NULL,
  `company_bankcode` varchar(20) NOT NULL,
  `company_iban` int(20) NOT NULL,
  `company_bic` varchar(20) DEFAULT NULL,
  `company_telephone` int(20) NOT NULL,
  `company_email` varchar(100) DEFAULT NULL,
  `company_url` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `contract_id` bigint(20) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `contract_nr` bigint(20) NOT NULL,
  `contract_date` datetime NOT NULL,
  `contract_type` int(10) NOT NULL,
  `contract_kind` int(10) DEFAULT NULL,
  `contract_start_station_id` varchar(20) DEFAULT NULL,
  `contract_start_customer_id` bigint(20) NOT NULL,
  `contract_start_street` varchar(20) NOT NULL,
  `contract_start_streetnr` int(10) NOT NULL,
  `contract_start_postcode` int(10) NOT NULL,
  `contract_start_city` varchar(20) NOT NULL,
  `contract_start_country` varchar(20) NOT NULL,
  `contract_start_startdate` datetime NOT NULL,
  `contract_start_enddate` datetime NOT NULL,
  `contract_start_time` datetime NOT NULL,
  `contract_end_station_id` varchar(20) NOT NULL,
  `contract_end_customer_id` bigint(20) NOT NULL,
  `contract_end_street` varchar(20) NOT NULL,
  `contract_end_streetnr` int(10) NOT NULL,
  `contract_end_postcode` int(10) NOT NULL,
  `contract_end_city` varchar(20) NOT NULL,
  `contract_end_country` varchar(20) NOT NULL,
  `contract_end_startdate` datetime NOT NULL,
  `contract_end_enddate` datetime NOT NULL,
  `contract_end_time` datetime NOT NULL,
  `contract_requirements` text NOT NULL,
  `contract_numberplate` varchar(20) NOT NULL,
  `contract_carnumber` varchar(50) NOT NULL,
  `contract_color` varchar(20) NOT NULL,
  `contract_comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` bigint(20) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `customer_date` datetime NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_street` varchar(20) NOT NULL,
  `customer_streetnr` int(10) NOT NULL,
  `customer_postcode` int(10) NOT NULL,
  `customer_city` varchar(20) NOT NULL,
  `customer_additional` varchar(50) DEFAULT NULL,
  `customer_country` varchar(20) NOT NULL,
  `customer_telephone` int(20) NOT NULL,
  `customer_email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `group_id` bigint(20) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `groud_date` datetime NOT NULL,
  `group_parent` bigint(20) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `group_description` longtext DEFAULT NULL,
  `group_location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `lead_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `lead_date` datetime NOT NULL,
  `lead_comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` bigint(20) NOT NULL,
  `notification_subject` text NOT NULL,
  `notification_source` bigint(20) NOT NULL,
  `notification_destination` bigint(20) NOT NULL,
  `notification_details` text NOT NULL,
  `notification_date` datetime NOT NULL,
  `notification_dismiss` tinyint(1) NOT NULL,
  `notification_level` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `ntemplate_id` bigint(20) NOT NULL,
  `ntemplate_subject` text NOT NULL,
  `ntemplate_details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` bigint(20) NOT NULL,
  `role_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_capabilities`
--

CREATE TABLE `role_has_capabilities` (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `capability_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_has_capabilities`
--

CREATE TABLE `user_has_capabilities` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `capability_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_has_roles`
--

CREATE TABLE `user_has_roles` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `capabilities`
--
ALTER TABLE `capabilities`
  ADD PRIMARY KEY (`capability_id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`contract_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`ntemplate_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `role_has_capabilities`
--
ALTER TABLE `role_has_capabilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_has_capabilities`
--
ALTER TABLE `user_has_capabilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_has_roles`
--
ALTER TABLE `user_has_roles`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
