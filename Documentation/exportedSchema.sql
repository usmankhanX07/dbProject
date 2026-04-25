-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2026 at 02:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `aircrafts`
--

CREATE TABLE `aircrafts` (
  `Aircraft_ID` int(10) NOT NULL,
  `Manufacturer` varchar(10) NOT NULL,
  `Model` varchar(20) NOT NULL,
  `Total_Capacity` int(3) NOT NULL,
  `Date_Of_Manufacture` date NOT NULL,
  `Airline_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `airlines`
--

CREATE TABLE `airlines` (
  `Airline_ID` int(10) NOT NULL,
  `Airline_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `Airport_ID` int(10) NOT NULL,
  `Airport_Name` int(50) NOT NULL,
  `City` int(20) NOT NULL,
  `TimeZone` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `baggage`
--

CREATE TABLE `baggage` (
  `Baggage_Tag_ID` int(10) NOT NULL,
  `Weight` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `Customer_ID` int(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Nationality` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `Flight_ID` int(11) NOT NULL,
  `Flight_Type` varchar(255) DEFAULT NULL,
  `Arrival_Time` datetime DEFAULT NULL,
  `Departure_Time` datetime DEFAULT NULL,
  `Duration` datetime DEFAULT NULL,
  `Airline_ID` int(11) DEFAULT NULL,
  `Aircraft_ID` int(11) DEFAULT NULL,
  `Departure_Airport_Id` int(11) DEFAULT NULL,
  `Arrival_Airport_Id` int(11) DEFAULT NULL,
  `Terminal_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateway`
--

CREATE TABLE `gateway` (
  `Gateway_ID` int(11) NOT NULL,
  `Gateway_Name` int(11) DEFAULT NULL,
  `Regulator` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `passports`
--

CREATE TABLE `passports` (
  `Passport_ID` int(11) NOT NULL,
  `Passport_Expiry` date DEFAULT NULL,
  `Customer_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_ID` int(11) NOT NULL,
  `Payment_Type` int(11) DEFAULT NULL,
  `Gateway_ID` int(11) DEFAULT NULL,
  `Ticket_ID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pilot`
--

CREATE TABLE `pilot` (
  `Pilot_ID` int(10) NOT NULL,
  `Pilot_Name` varchar(20) NOT NULL,
  `Hours_Worked` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recordstable`
--

CREATE TABLE `recordstable` (
  `Baggage_ID` int(11) NOT NULL,
  `Pilot_ID` int(11) NOT NULL,
  `Ticket_ID` int(11) NOT NULL,
  `Flight_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terminals`
--

CREATE TABLE `terminals` (
  `Terminal_ID` int(11) NOT NULL,
  `Terminal_Name` varchar(255) DEFAULT NULL,
  `Airport_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `Ticket_ID` int(10) NOT NULL,
  `Customer_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aircrafts`
--
ALTER TABLE `aircrafts`
  ADD PRIMARY KEY (`Aircraft_ID`),
  ADD KEY `fk_airlineID` (`Airline_ID`);

--
-- Indexes for table `airlines`
--
ALTER TABLE `airlines`
  ADD PRIMARY KEY (`Airline_ID`);

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`Airport_ID`);

--
-- Indexes for table `baggage`
--
ALTER TABLE `baggage`
  ADD PRIMARY KEY (`Baggage_Tag_ID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`Flight_ID`),
  ADD KEY `Airline_ID` (`Airline_ID`),
  ADD KEY `Departure_Airport_Id` (`Departure_Airport_Id`),
  ADD KEY `Arrival_Airport_Id` (`Arrival_Airport_Id`),
  ADD KEY `Aircraft_ID` (`Aircraft_ID`),
  ADD KEY `Terminal_ID` (`Terminal_ID`);

--
-- Indexes for table `gateway`
--
ALTER TABLE `gateway`
  ADD PRIMARY KEY (`Gateway_ID`);

--
-- Indexes for table `passports`
--
ALTER TABLE `passports`
  ADD PRIMARY KEY (`Passport_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `Gateway_ID` (`Gateway_ID`),
  ADD KEY `fk_ticketID` (`Ticket_ID`);

--
-- Indexes for table `pilot`
--
ALTER TABLE `pilot`
  ADD PRIMARY KEY (`Pilot_ID`);

--
-- Indexes for table `recordstable`
--
ALTER TABLE `recordstable`
  ADD PRIMARY KEY (`Baggage_ID`,`Pilot_ID`,`Ticket_ID`),
  ADD KEY `Pilot_ID` (`Pilot_ID`),
  ADD KEY `Ticket_ID` (`Ticket_ID`),
  ADD KEY `Flight_ID` (`Flight_ID`);

--
-- Indexes for table `terminals`
--
ALTER TABLE `terminals`
  ADD PRIMARY KEY (`Terminal_ID`),
  ADD KEY `Airport_ID` (`Airport_ID`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`Ticket_ID`),
  ADD KEY `fk_custID` (`Customer_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aircrafts`
--
ALTER TABLE `aircrafts`
  MODIFY `Aircraft_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `airlines`
--
ALTER TABLE `airlines`
  MODIFY `Airline_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `airport`
--
ALTER TABLE `airport`
  MODIFY `Airport_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `baggage`
--
ALTER TABLE `baggage`
  MODIFY `Baggage_Tag_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `Customer_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pilot`
--
ALTER TABLE `pilot`
  MODIFY `Pilot_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `Ticket_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aircrafts`
--
ALTER TABLE `aircrafts`
  ADD CONSTRAINT `fk_airlineID` FOREIGN KEY (`Airline_ID`) REFERENCES `airlines` (`Airline_ID`);

--
-- Constraints for table `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`Airline_ID`) REFERENCES `airlines` (`Airline_ID`),
  ADD CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`Departure_Airport_Id`) REFERENCES `airport` (`Airport_ID`),
  ADD CONSTRAINT `flights_ibfk_3` FOREIGN KEY (`Arrival_Airport_Id`) REFERENCES `airport` (`Airport_ID`),
  ADD CONSTRAINT `flights_ibfk_4` FOREIGN KEY (`Aircraft_ID`) REFERENCES `aircrafts` (`Aircraft_ID`),
  ADD CONSTRAINT `flights_ibfk_5` FOREIGN KEY (`Terminal_ID`) REFERENCES `terminals` (`Terminal_ID`);

--
-- Constraints for table `passports`
--
ALTER TABLE `passports`
  ADD CONSTRAINT `passports_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_ticketID` FOREIGN KEY (`Ticket_ID`) REFERENCES `ticket` (`Ticket_ID`),
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Gateway_ID`) REFERENCES `gateway` (`Gateway_ID`);

--
-- Constraints for table `recordstable`
--
ALTER TABLE `recordstable`
  ADD CONSTRAINT `recordstable_ibfk_1` FOREIGN KEY (`Baggage_ID`) REFERENCES `baggage` (`Baggage_Tag_ID`),
  ADD CONSTRAINT `recordstable_ibfk_2` FOREIGN KEY (`Pilot_ID`) REFERENCES `pilot` (`Pilot_ID`),
  ADD CONSTRAINT `recordstable_ibfk_3` FOREIGN KEY (`Ticket_ID`) REFERENCES `ticket` (`Ticket_ID`),
  ADD CONSTRAINT `recordstable_ibfk_4` FOREIGN KEY (`Flight_ID`) REFERENCES `flights` (`Flight_ID`),
  ADD CONSTRAINT `recordstable_ibfk_5` FOREIGN KEY (`Baggage_ID`) REFERENCES `baggage` (`Baggage_Tag_ID`) ON DELETE CASCADE;

--
-- Constraints for table `terminals`
--
ALTER TABLE `terminals`
  ADD CONSTRAINT `terminals_ibfk_1` FOREIGN KEY (`Airport_ID`) REFERENCES `airport` (`Airport_ID`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_custID` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
