-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2026 at 11:37 AM
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

--
-- Dumping data for table `aircrafts`
--

INSERT INTO `aircrafts` (`Aircraft_ID`, `Manufacturer`, `Model`, `Total_Capacity`, `Date_Of_Manufacture`, `Airline_ID`) VALUES
(1, 'Airbus', 'A320', 250, '2016-04-01', 1),
(2, 'Boeing', '777', 320, '2021-02-12', 1),
(3, 'Boeing', '747', 230, '2025-10-13', 2);

-- --------------------------------------------------------

--
-- Table structure for table `airlines`
--

CREATE TABLE `airlines` (
  `Airline_ID` int(10) NOT NULL,
  `Airline_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `airlines`
--

INSERT INTO `airlines` (`Airline_ID`, `Airline_Name`) VALUES
(1, 'PIA'),
(2, 'Qatar Airways');

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `Airport_ID` int(10) NOT NULL,
  `Airport_Name` varchar(50) NOT NULL,
  `City` varchar(20) NOT NULL,
  `TimeZone` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`Airport_ID`, `Airport_Name`, `City`, `TimeZone`) VALUES
(1, 'Jinnah International Karachi', 'Karachi', '2026-04-25 14:51:03.000000'),
(2, 'Dubai International Airport', 'Dubai', '2026-04-25 15:12:06.000000'),
(3, 'Allama Iqbal International', 'Lahore', '0000-00-00 00:00:00.000000'),
(4, 'Hamad International', 'Doha', '2026-05-10 06:05:28.231000');

-- --------------------------------------------------------

--
-- Table structure for table `baggage`
--

CREATE TABLE `baggage` (
  `Baggage_Tag_ID` int(10) NOT NULL,
  `Weight` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baggage`
--

INSERT INTO `baggage` (`Baggage_Tag_ID`, `Weight`) VALUES
(1, 20),
(2, 12.5),
(3, 22),
(4, 22),
(5, 23),
(6, 4),
(7, 7),
(8, 6.8),
(9, 6.8),
(10, 7.7),
(12, 3.31);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `Customer_ID` int(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Nationality` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`Customer_ID`, `Name`, `Nationality`) VALUES
(1, 'Anam Qureshi', 'Pakistani'),
(13, 'Yousuf', 'Croatian'),
(123, 'Usman', 'Pakistani'),
(999, 'Ahmed', 'Pakistani'),
(1111, 'Amna', 'Pakistani'),
(3018, 'Hadi', 'Chinese'),
(3056, 'Burhan', 'Packistani'),
(3070, 'Aleem', 'Pakistani'),
(3098, 'Hassan', 'Pakistani'),
(5617, 'Bilal', 'Pakistani');

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `Flight_ID` int(11) NOT NULL,
  `Flight_Type` varchar(25) DEFAULT NULL,
  `Arrival_Time` datetime DEFAULT NULL,
  `Departure_Time` datetime DEFAULT NULL,
  `Airline_ID` int(11) DEFAULT NULL,
  `Aircraft_ID` int(11) DEFAULT NULL,
  `Departure_Airport_Id` int(11) DEFAULT NULL,
  `Arrival_Airport_Id` int(11) DEFAULT NULL,
  `Terminal_ID` int(11) DEFAULT NULL,
  `Duration` time GENERATED ALWAYS AS (timediff(`Arrival_Time`,`Departure_Time`)) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`Flight_ID`, `Flight_Type`, `Arrival_Time`, `Departure_Time`, `Airline_ID`, `Aircraft_ID`, `Departure_Airport_Id`, `Arrival_Airport_Id`, `Terminal_ID`) VALUES
(1, 'International', '2026-04-25 22:13:03', '2026-04-25 20:13:03', 1, 1, 1, 2, 1),
(2, 'Domestic', '2026-04-26 19:18:06', '2026-04-26 15:18:06', 1, 2, 3, 1, 2),
(3, 'International', '2026-05-10 22:08:40', '2026-05-10 14:08:40', 2, 3, 4, 1, 3);

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
  `Customer_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passports`
--

INSERT INTO `passports` (`Passport_ID`, `Passport_Expiry`, `Customer_ID`) VALUES
(10000124, '2029-12-06', 123),
(10000125, '2032-03-09', 1111),
(10000126, '2032-02-22', 999),
(10000127, '2026-09-01', 13);

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

--
-- Dumping data for table `pilot`
--

INSERT INTO `pilot` (`Pilot_ID`, `Pilot_Name`, `Hours_Worked`) VALUES
(1, 'Ali', 20),
(2, 'Hassan', 35),
(3, 'Ahsan', 12),
(4, 'Fatima', 4),
(5, 'Mohammad', 9),
(6, 'Maryam', 40),
(7, 'Mehdi', 65),
(8, 'Zara', 35),
(9, 'Fatima', 25),
(10, 'James', 42),
(11, 'Sarah', 58),
(12, 'Omar', 31),
(13, 'Emily', 67),
(14, 'Daniel', 19),
(15, 'Sophia', 53),
(16, 'Marcus', 38),
(17, 'Layla', 62),
(18, 'Ethan', 45),
(19, 'Amelia', 27),
(20, 'Hassan', 50);

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

--
-- Dumping data for table `recordstable`
--

INSERT INTO `recordstable` (`Baggage_ID`, `Pilot_ID`, `Ticket_ID`, `Flight_ID`) VALUES
(5, 2, 4, 1),
(6, 3, 5, 1),
(8, 5, 7, 1),
(7, 4, 6, 2),
(9, 6, 8, 2),
(10, 7, 9, 2),
(12, 9, 11, 3);

-- --------------------------------------------------------

--
-- Table structure for table `terminals`
--

CREATE TABLE `terminals` (
  `Terminal_ID` int(11) NOT NULL,
  `Terminal_Name` varchar(255) DEFAULT NULL,
  `Airport_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `terminals`
--

INSERT INTO `terminals` (`Terminal_ID`, `Terminal_Name`, `Airport_ID`) VALUES
(1, 'Primary Terminal - A', 1),
(2, 'Secondary Terminal - Domestic Flights', 1),
(3, 'International Terminal - Doha', 4);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `Ticket_ID` int(10) NOT NULL,
  `Customer_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`Ticket_ID`, `Customer_ID`) VALUES
(11, 13),
(4, 123),
(5, 123),
(6, 123),
(9, 123),
(8, 999),
(7, 1111);

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
  MODIFY `Aircraft_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `airlines`
--
ALTER TABLE `airlines`
  MODIFY `Airline_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `airport`
--
ALTER TABLE `airport`
  MODIFY `Airport_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `baggage`
--
ALTER TABLE `baggage`
  MODIFY `Baggage_Tag_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `Customer_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5618;

--
-- AUTO_INCREMENT for table `passports`
--
ALTER TABLE `passports`
  MODIFY `Passport_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000128;

--
-- AUTO_INCREMENT for table `pilot`
--
ALTER TABLE `pilot`
  MODIFY `Pilot_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `recordstable`
--
ALTER TABLE `recordstable`
  MODIFY `Pilot_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `Ticket_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
