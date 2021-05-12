SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `fact2_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `AU_ID` decimal(7,0) NOT NULL,
  `AU_FNAME` varchar(30) NOT NULL,
  `AU_LNAME` varchar(30) NOT NULL,
  `AU_BIRTHYEAR` decimal(4,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`AU_ID`, `AU_FNAME`, `AU_LNAME`, `AU_BIRTHYEAR`) VALUES
('185', 'Benson', 'Reeves', '1990'),
('218', 'Rachel', 'Beatney', '1983'),
('229', 'Carmine', 'Salvadore', NULL),
('251', 'Hugo', 'Bruer', '1972'),
('262', 'Xia', 'Chiang', NULL),
('273', 'Reba', 'Durante', '1969'),
('284', 'Trina', 'Tankersly', '1961'),
('383', 'Neal', 'Walsh', '1980'),
('394', 'Robert', 'Lake', '1982'),
('438', 'Perry', 'Pearson', '1986'),
('460', 'Connie', 'Paulsen', '1983'),
('559', 'Rachel', 'McGill', NULL),
('581', 'Manish', 'Aggerwal', '1984'),
('592', 'Lawrence', 'Sheel', '1976'),
('603', 'Julia', 'Palca', '1988');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `BOOK_NUM` decimal(10,0) NOT NULL,
  `BOOK_TITLE` varchar(120) NOT NULL,
  `BOOK_YEAR` decimal(4,0) DEFAULT NULL,
  `BOOK_COST` decimal(8,2) DEFAULT NULL,
  `BOOK_SUBJECT` varchar(120) DEFAULT NULL,
  `PAT_ID` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`BOOK_NUM`, `BOOK_TITLE`, `BOOK_YEAR`, `BOOK_COST`, `BOOK_SUBJECT`, `PAT_ID`) VALUES
('5235', 'Beginner\'s Guide to JAVA', '2014', '59.95', 'Programming', NULL),
('5236', 'Database in the Cloud', '2014', '79.95', 'Cloud', NULL),
('5237', 'Mastering the database environment', '2015', '89.95', 'Database', NULL),
('5238', 'Conceptual Programming', '2015', '59.95', 'Programming', '1229'),
('5239', 'J++ in Mobile Apps', '2015', '49.95', 'Programming', NULL),
('5240', 'iOS Programming', '2015', '79.95', 'Programming', '1212'),
('5241', 'JAVA First Steps', '2015', '49.95', 'Programming', NULL),
('5242', 'C# in Middleware Deployment', '2015', '59.95', 'Middleware', '1228'),
('5243', 'DATABASES in Theory', '2015', '129.95', 'Database', NULL),
('5244', 'Cloud-based Mobile Applications', '2015', '69.95', 'Cloud', NULL),
('5245', 'The Golden Road to Platform independence', '2016', '119.95', 'Middleware', NULL),
('5246', 'Capture the Cloud', '2016', '69.95', 'Cloud', '1172'),
('5247', 'Shining Through the Cloud: Sun Programming', '2016', '109.95', 'Programming', NULL),
('5248', 'What You Always Wanted to Know About Database, But Were Afraid to Ask', '2016', '49.95', 'Database', NULL),
('5249', 'Starlight Applications', '2016', '69.95', 'Cloud', '1207'),
('5250', 'Reengineering the Middle Tier', '2016', '89.95', 'Middleware', NULL),
('5251', 'Thoughts on Revitalizing Ruby', '2016', '59.95', 'Programming', NULL),
('5252', 'Beyond the Database Veil', '2016', '69.95', 'Database', '1229'),
('5253', 'Virtual Programming for Virtual Environments', '2016', '79.95', 'Programming', NULL),
('5254', 'Coding Style for Maintenance', '2017', '49.95', 'Programming', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `CHECK_NUM` decimal(15,0) NOT NULL,
  `BOOK_NUM` decimal(10,0) DEFAULT NULL,
  `PAT_ID` decimal(10,0) DEFAULT NULL,
  `CHECK_OUT_DATE` date DEFAULT NULL,
  `CHECK_DUE_DATE` date DEFAULT NULL,
  `CHECK_IN_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `checkout`
--

INSERT INTO `checkout` (`CHECK_NUM`, `BOOK_NUM`, `PAT_ID`, `CHECK_OUT_DATE`, `CHECK_DUE_DATE`, `CHECK_IN_DATE`) VALUES
('91001', '5235', '1165', '2017-03-31', '2017-04-14', '2017-04-09'),
('91002', '5238', '1209', '2017-03-31', '2017-04-07', '2017-04-05'),
('91003', '5240', '1160', '2017-03-31', '2017-04-14', '2017-04-09'),
('91004', '5237', '1160', '2017-03-31', '2017-04-14', '2017-04-03'),
('91005', '5236', '1202', '2017-03-31', '2017-04-07', '2017-04-08'),
('91006', '5235', '1203', '2017-04-05', '2017-04-12', '2017-04-13'),
('91007', '5244', '1174', '2017-04-05', '2017-04-12', '2017-04-08'),
('91008', '5248', '1181', '2017-04-05', '2017-04-12', '2017-04-06'),
('91009', '5242', '1170', '2017-04-05', '2017-04-19', '2017-04-09'),
('91010', '5235', '1161', '2017-04-05', '2017-04-19', '2017-04-05'),
('91011', '5236', '1181', '2017-04-05', '2017-04-12', '2017-04-11'),
('91012', '5249', '1181', '2017-04-08', '2017-04-15', '2017-04-12'),
('91013', '5240', '1160', '2017-04-10', '2017-04-24', '2017-04-19'),
('91014', '5236', '1204', '2017-04-11', '2017-04-18', '2017-04-19'),
('91015', '5237', '1204', '2017-04-11', '2017-04-18', '2017-04-13'),
('91016', '5236', '1183', '2017-04-13', '2017-04-27', '2017-04-14'),
('91017', '5240', '1184', '2017-04-14', '2017-04-21', '2017-04-22'),
('91018', '5236', '1170', '2017-04-14', '2017-04-28', '2017-04-14'),
('91019', '5246', '1171', '2017-04-14', '2017-04-21', '2017-04-17'),
('91020', '5254', '1185', '2017-04-16', '2017-04-23', '2017-04-23'),
('91021', '5238', '1185', '2017-04-16', '2017-04-23', '2017-04-21'),
('91022', '5252', '1171', '2017-04-16', '2017-04-23', '2017-04-19'),
('91023', '5249', '1207', '2017-04-16', '2017-04-23', '2017-04-19'),
('91024', '5235', '1209', '2017-04-21', '2017-04-28', '2017-04-29'),
('91025', '5246', '1172', '2017-04-21', '2017-04-28', '2017-04-27'),
('91026', '5254', '1161', '2017-04-21', '2017-05-04', '2017-04-26'),
('91027', '5243', '1161', '2017-04-21', '2017-05-04', '2017-04-26'),
('91028', '5236', '1183', '2017-04-22', '2017-05-05', '2017-04-30'),
('91029', '5244', '1203', '2017-04-22', '2017-04-29', '2017-04-26'),
('91030', '5242', '1207', '2017-04-22', '2017-04-29', '2017-04-30'),
('91031', '5252', '1165', '2017-04-23', '2017-05-06', '2017-04-30'),
('91032', '5238', '1172', '2017-04-23', '2017-04-30', '2017-04-26'),
('91033', '5235', '1174', '2017-04-23', '2017-04-30', '2017-04-23'),
('91034', '5240', '1185', '2017-04-23', '2017-04-30', '2017-05-01'),
('91035', '5248', '1165', '2017-04-24', '2017-05-07', '2017-04-25'),
('91036', '5237', '1202', '2017-04-24', '2017-04-30', '2017-04-28'),
('91037', '5235', '1210', '2017-04-28', '2017-05-04', '2017-05-01'),
('91038', '5238', '1215', '2017-04-28', '2017-05-04', '2017-04-30'),
('91039', '5240', '1222', '2017-04-28', '2017-05-04', '2017-05-06'),
('91040', '5237', '1228', '2017-04-28', '2017-05-04', '2017-05-05'),
('91041', '5236', '1211', '2017-04-28', '2017-05-04', '2017-04-30'),
('91042', '5235', '1220', '2017-04-29', '2017-05-05', '2017-05-05'),
('91043', '5244', '1226', '2017-04-29', '2017-05-05', '2017-05-07'),
('91044', '5248', '1219', '2017-04-30', '2017-05-07', '2017-05-08'),
('91045', '5242', '1210', '2017-04-30', '2017-05-07', '2017-05-04'),
('91046', '5235', '1225', '2017-04-30', '2017-05-07', '2017-05-03'),
('91047', '5236', '1218', '2017-04-30', '2017-05-07', '2017-05-07'),
('91048', '5249', '1229', '2017-05-04', '2017-05-11', '2017-05-06'),
('91049', '5240', '1214', '2017-05-04', '2017-05-11', '2017-05-04'),
('91050', '5236', '1220', '2017-05-08', '2017-05-15', '2017-05-13'),
('91051', '5237', '1222', '2017-05-08', '2017-05-15', '2017-05-15'),
('91052', '5236', '1213', '2017-05-08', '2017-05-15', '2017-05-08'),
('91053', '5240', '1212', '2017-05-09', '2017-05-16', NULL),
('91054', '5236', '1221', '2017-05-09', '2017-05-16', '2017-05-11'),
('91055', '5246', '1221', '2017-05-09', '2017-05-16', '2017-05-10'),
('91056', '5254', '1224', '2017-05-10', '2017-05-17', '2017-05-15'),
('91057', '5238', '1224', '2017-05-10', '2017-05-17', '2017-05-11'),
('91058', '5252', '1171', '2017-05-10', '2017-05-17', '2017-05-15'),
('91059', '5249', '1207', '2017-05-10', '2017-05-17', NULL),
('91060', '5235', '1209', '2017-05-15', '2017-05-22', '2017-05-18'),
('91061', '5246', '1172', '2017-05-15', '2017-05-22', NULL),
('91062', '5254', '1223', '2017-05-15', '2017-05-22', '2017-05-16'),
('91063', '5243', '1223', '2017-05-15', '2017-05-22', '2017-05-20'),
('91064', '5236', '1183', '2017-05-17', '2017-05-31', '2017-05-21'),
('91065', '5244', '1210', '2017-05-17', '2017-05-24', '2017-05-17'),
('91066', '5242', '1228', '2017-05-19', '2017-05-26', NULL),
('91067', '5252', '1229', '2017-05-24', '2017-05-31', NULL),
('91068', '5238', '1229', '2017-05-24', '2017-05-31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patron`
--

CREATE TABLE `patron` (
  `PAT_ID` decimal(10,0) NOT NULL,
  `PAT_FNAME` varchar(20) NOT NULL,
  `PAT_LNAME` varchar(20) NOT NULL,
  `PAT_TYPE` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patron`
--

INSERT INTO `patron` (`PAT_ID`, `PAT_FNAME`, `PAT_LNAME`, `PAT_TYPE`) VALUES
('1160', 'robert', 'carter', 'Faculty'),
('1161', 'Kelsey', 'Koch', 'Faculty'),
('1165', 'Cedric', 'Baldwin', 'Faculty'),
('1166', 'Vera', 'Alvarado', 'Student'),
('1167', 'Alan', 'Martin', 'FACULTY'),
('1170', 'Cory', 'Barry', 'faculty'),
('1171', 'Peggy', 'Marsh', 'STUDENT'),
('1172', 'Tony', 'Miles', 'STUDENT'),
('1174', 'Betsy', 'Malone', 'STUDENT'),
('1180', 'Nadine', 'Blair', 'STUDENT'),
('1181', 'Allen', 'Horne', 'Student'),
('1182', 'Jamal', 'Melendez', 'STUDENT'),
('1183', 'Helena', 'Hughes', 'Faculty'),
('1184', 'Jimmie', 'Love', 'StudenT'),
('1185', 'Sandra', 'Yang', 'student'),
('1200', 'Lorenzo', 'Torres', 'Student'),
('1201', 'Shelby', 'Noble', 'Student'),
('1202', 'Holly', 'Anthony', 'Student'),
('1203', 'Tyler', 'Pope', 'STUDENT'),
('1204', 'Thomas', 'Duran', 'Student'),
('1205', 'Claire', 'Gomez', 'student'),
('1207', 'Iva', 'Ramos', 'Student'),
('1208', 'Ollie', 'Cantrell', 'Student'),
('1209', 'Rena', 'Mathis', 'Student'),
('1210', 'Keith', 'Cooley', 'STUdent'),
('1211', 'Jerald', 'Gaines', 'Student'),
('1212', 'Iva', 'McClain', 'Student'),
('1213', 'Desiree', 'Rivas', 'Student'),
('1214', 'Marina', 'King', 'Student'),
('1215', 'Maureen', 'Downs', 'Student'),
('1218', 'Angel', 'Terrell', 'Student'),
('1219', 'Desiree', 'Harrington', 'Student'),
('1220', 'Carlton', 'Morton', 'Student'),
('1221', 'Gloria', 'Pitts', 'Student'),
('1222', 'Zach', 'Kelly', 'Student'),
('1223', 'Jose', 'Hays', 'Student'),
('1224', 'Jewel', 'England', 'Student'),
('1225', 'Wilfred', 'Fuller', 'Student'),
('1226', 'Jeff', 'Owens', 'Student'),
('1227', 'Alicia', 'Dickson', 'Student'),
('1228', 'Homer', 'Goodman', 'Student'),
('1229', 'Gerald', 'Burke', 'Student'),
('1237', 'Brandi', 'Larson', 'Student'),
('1238', 'Erika', 'Bowen', 'Student'),
('1239', 'Elton', 'Irwin', 'Student'),
('1240', 'Jan', 'Joyce', 'Student'),
('1241', 'Irene', 'West', 'Student'),
('1242', 'Mario', 'King', 'Student'),
('1243', 'Roberto', 'Kennedy', 'Student'),
('1244', 'Leon', 'Richmond', 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `writes`
--

CREATE TABLE `writes` (
  `BOOK_NUM` decimal(10,0) NOT NULL,
  `AU_ID` decimal(7,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `writes`
--

INSERT INTO `writes` (`BOOK_NUM`, `AU_ID`) VALUES
('5235', '273'),
('5236', '383'),
('5237', '185'),
('5238', '603'),
('5239', '229'),
('5239', '460'),
('5239', '592'),
('5240', '218'),
('5241', '460'),
('5241', '559'),
('5242', '581'),
('5243', '251'),
('5244', '262'),
('5244', '284'),
('5245', '394'),
('5246', '251'),
('5247', '394'),
('5248', '229'),
('5249', '262'),
('5250', '383'),
('5250', '438'),
('5251', '460'),
('5252', '262'),
('5253', '185'),
('5254', '559');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`AU_ID`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`BOOK_NUM`),
  ADD KEY `PAT_ID` (`PAT_ID`);

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`CHECK_NUM`),
  ADD KEY `BOOK_NUM` (`BOOK_NUM`),
  ADD KEY `PAT_ID` (`PAT_ID`);

--
-- Indexes for table `patron`
--
ALTER TABLE `patron`
  ADD PRIMARY KEY (`PAT_ID`);

--
-- Indexes for table `writes`
--
ALTER TABLE `writes`
  ADD PRIMARY KEY (`BOOK_NUM`,`AU_ID`),
  ADD KEY `WRITES_AU_ID_FK` (`AU_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`PAT_ID`) REFERENCES `patron` (`PAT_ID`);

--
-- Constraints for table `checkout`
--
ALTER TABLE `checkout`
  ADD CONSTRAINT `checkout_ibfk_1` FOREIGN KEY (`BOOK_NUM`) REFERENCES `book` (`BOOK_NUM`),
  ADD CONSTRAINT `checkout_ibfk_2` FOREIGN KEY (`PAT_ID`) REFERENCES `patron` (`PAT_ID`);

--
-- Constraints for table `writes`
--
ALTER TABLE `writes`
  ADD CONSTRAINT `WRITES_AU_ID_FK` FOREIGN KEY (`AU_ID`) REFERENCES `author` (`AU_ID`),
  ADD CONSTRAINT `WRITES_BOOK_NUM_FK` FOREIGN KEY (`BOOK_NUM`) REFERENCES `book` (`BOOK_NUM`);
COMMIT;