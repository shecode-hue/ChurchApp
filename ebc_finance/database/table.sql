--
-- Table structure for table `ChurchFinances`
--

CREATE TABLE `ChurchFinances` (
  `TransactionID` int(11) NOT NULL,
  `TransactionDate` date NOT NULL,
  `PastoralFund` decimal(10,2) DEFAULT 0.00,
  `Offerings` decimal(10,2) DEFAULT 0.00,
  `Thanksgiving` decimal(10,2) DEFAULT 0.00,
  `Tithe` decimal(10,2) DEFAULT 0.00,
  `Membership` decimal(10,2) DEFAULT 0.00,
  `Stationary` decimal(10,2) DEFAULT 0.00,
  `Devotions` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ChurchFinances`
--

INSERT INTO `ChurchFinances` (`TransactionID`, `TransactionDate`, `PastoralFund`, `Offerings`, `Thanksgiving`, `Tithe`, `Membership`, `Stationary`, `Devotions`) VALUES
(1, '2022-08-31', 460.00, 1465.50, 642.00, 4923.00, 780.00, 0.00, 0.00),
(2, '2022-08-31', 460.00, 1465.50, 642.00, 4923.00, 780.00, 0.00, 0.00),
(3, '2022-09-30', 0.00, 1465.50, 271.00, 235.00, 460.00, 0.00, 0.00),
(4, '2022-10-30', 360.00, 2377.00, 1725.00, 9950.00, 560.00, 0.00, 0.00),
(6, '2022-12-31', 240.00, 1126.00, 400.00, 3432.00, 0.00, 0.00, 0.00),
(7, '2023-01-31', 820.00, 1574.00, 1029.00, 5210.00, 280.00, 0.00, 0.00),
(8, '2023-02-28', 120.00, 1910.00, 1232.00, 4079.00, 1240.00, 20.00, 0.00),
(9, '2023-03-31', 120.00, 1682.60, 848.00, 9672.60, 800.00, 0.00, 0.00),
(10, '2023-04-30', 0.00, 1704.50, 1431.00, 4510.00, 710.00, 0.00, 0.00),
(11, '2023-05-31', 0.00, 1428.60, 557.00, 2780.00, 310.00, 0.00, 0.00),
(12, '2023-06-30', 360.00, 1566.50, 272.00, 8800.00, 470.00, 0.00, 0.00),
(13, '2023-07-31', 240.00, 982.00, 505.00, 1450.00, 260.00, 0.00, 0.00),
(14, '2024-05-11', 2346.00, 1234.00, 643.00, 1349.00, 346.00, 2468.00, 1378.00),
(16, '2024-05-18', 4567.00, 2457.00, 345.00, 3567.00, 3567.00, 46.00, 45.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ChurchFinances`
--
ALTER TABLE `ChurchFinances`
  ADD PRIMARY KEY (`TransactionID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ChurchFinances`
--
ALTER TABLE `ChurchFinances`
  MODIFY `TransactionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;