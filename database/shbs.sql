-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2021 at 04:09 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shbs`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `com_logo` varchar(100) DEFAULT NULL,
  `com_name` varchar(100) NOT NULL,
  `com_email` varchar(60) NOT NULL,
  `com_phone` varchar(15) DEFAULT NULL,
  `com_address` varchar(255) DEFAULT NULL,
  `cur_format` varchar(10) NOT NULL,
  `admin_role` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `username`, `password`, `com_logo`, `com_name`, `com_email`, `com_phone`, `com_address`, `cur_format`, `admin_role`) VALUES
(1, 'admin', 'admin', '7a19a4942dcd9122acf719dac92f294f', NULL, 'Inventory', 'inventory@gmail.com', NULL, NULL, '$', 1);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_title` text NOT NULL,
  `brand_cat` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`, `brand_cat`) VALUES
(14, 'Punjab Textbook Board lahore', 12),
(15, 'Malik Siraj ud din and Sons', 12);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL,
  `products` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `products`) VALUES
(9, 'Madrassa Books', 0),
(10, 'University Books', 0),
(11, 'College Books', 0),
(12, 'School Books', 0),
(13, 'Islami Books', 0),
(14, 'Stories Books', 0),
(15, 'Novels', 0);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `s_no` int(11) NOT NULL,
  `site_name` varchar(100) NOT NULL,
  `site_title` varchar(100) DEFAULT NULL,
  `site_logo` varchar(100) NOT NULL,
  `site_desc` varchar(255) DEFAULT NULL,
  `footer_text` varchar(100) NOT NULL,
  `currency_format` varchar(20) NOT NULL,
  `contact_phone` varchar(15) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `contact_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`s_no`, `site_name`, `site_title`, `site_logo`, `site_desc`, `footer_text`, `currency_format`, `contact_phone`, `contact_email`, `contact_address`) VALUES
(1, 'Second Hand Book Store', 'Buy Old Second hand Books at one place', '16194752481607348871shopping-logo.png', 'Buy and Sell Second hand Books', 'Second hand Book Store Copyright 2021 UOG Marghazar Campus', 'Rs.', '03187848227', 'info@secondhandbookstore.com', 'UOG Marghazar campus');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_id` int(11) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `product_qty` varchar(100) NOT NULL,
  `total_amount` varchar(10) NOT NULL,
  `product_user` int(11) NOT NULL,
  `order_date` varchar(11) NOT NULL,
  `pay_req_id` varchar(100) DEFAULT NULL,
  `confirm` tinyint(4) NOT NULL DEFAULT 0,
  `delivery` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_id`, `product_id`, `product_qty`, `total_amount`, `product_user`, `order_date`, `pay_req_id`, `confirm`, `delivery`) VALUES
(1, '1,2,', '1,1,', '390', 1, '2021-04-30', '4100d69c7e7a4e2aa7b70014495629ea', 0, 1),
(2, '3,', '1,', '250', 2, '2021-05-03', '0fe38dceb7384bb7a3b1432ec7f3193e', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `item_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `txn_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payment_gross` float(10,2) NOT NULL,
  `currency_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `item_number`, `txn_id`, `payment_gross`, `currency_code`, `payment_status`) VALUES
(1, '1,2,', '4100d69c7e7a4e2aa7b70014495629ea', 390.00, '', 'credit'),
(2, '3,', '0fe38dceb7384bb7a3b1432ec7f3193e', 250.00, '', 'credit');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_code` varchar(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_sub_cat` int(11) NOT NULL,
  `product_brand` int(100) DEFAULT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` varchar(100) NOT NULL,
  `product_desc` text NOT NULL,
  `featured_image` text NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `product_keywords` text DEFAULT NULL,
  `product_views` int(11) DEFAULT 0,
  `product_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_code`, `product_cat`, `product_sub_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `featured_image`, `qty`, `product_keywords`, `product_views`, `product_status`) VALUES
(1, '608746e46b277', 12, 1, 14, 'Mathematics Grade 9 (Science Group)', '180', '&lt;span style=&quot;color: rgb(44, 62, 80); font-family: Lato, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px;&quot;&gt;Mathematics 9 is written by Dr. Karamat H. Dar and Prof. Irfan-ul-Haq and this book is published by Carvan Book House, Lahore, Pakistan. This book consist of 302 pages and there are 17 units. Notes of Unit 1 and 3 are provided by&amp;nbsp;&lt;/span&gt;&lt;b style=&quot;color: rgb(44, 62, 80); font-family: Lato, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px;&quot;&gt;&lt;a href=&quot;https://www.mathcity.org/people/moin&quot; class=&quot;wikilink1&quot; title=&quot;people:moin&quot; data-wiki-id=&quot;people:moin&quot; style=&quot;color: rgb(24, 188, 156); text-decoration-line: none;&quot;&gt;Engr. Moin Latif&lt;/a&gt;&lt;/b&gt;&lt;span style=&quot;color: rgb(44, 62, 80); font-family: Lato, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px;&quot;&gt;. We are very thankful to him for providing these notes.&lt;/span&gt;', '1619478244math.jpg', 90, NULL, 7, 1),
(2, '608c49011b61d', 12, 1, 14, 'Physics Grade 9 (Caravan Book House)', '210', '&lt;p style=&quot;margin-bottom: 20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &amp;quot;Open Sans&amp;quot;, sans-serif; vertical-align: baseline; color: rgb(85, 85, 85); background-color: rgb(246, 246, 246);&quot;&gt;Free download the book Physics 9th Class&lt;b style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;&amp;nbsp;&lt;/b&gt;English medium students. This book is by&amp;nbsp;&lt;a href=&quot;http://www.ptb.gop.pk/&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; text-decoration-line: none; color: rgb(227, 87, 38); transition: background-color 0s ease 0s, color 0.2s linear 0s; -webkit-tap-highlight-color: rgb(255, 94, 153);&quot;&gt;Punjab Curriculum and Textbook Board&lt;/a&gt;, Lahore, and published by Caravan Book House, Lahore.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &amp;quot;Open Sans&amp;quot;, sans-serif; vertical-align: baseline; color: rgb(85, 85, 85); background-color: rgb(246, 246, 246);&quot;&gt;The authors of the book are Prof. Tahir Hassan and Prof. Muhammad Naeem Anwar.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &amp;quot;Open Sans&amp;quot;, sans-serif; vertical-align: baseline; color: rgb(85, 85, 85); background-color: rgb(246, 246, 246);&quot;&gt;The Case for Physics&lt;br&gt;Trefil refers back to the “physics first” technique presented through 1988 Nobel Laureate Leon Lederman in his Chicago-based instructional reforms.&lt;/p&gt;', '1619806465physics.jpg', 100, NULL, 2, 1),
(3, '608c4a7fd90c2', 12, 2, 15, 'Physics Grade 10 ( Malik Siraj ud din and Sons)', '250', '&lt;p style=&quot;margin-bottom: 20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &amp;quot;Open Sans&amp;quot;, sans-serif; vertical-align: baseline; color: rgb(85, 85, 85); background-color: rgb(246, 246, 246);&quot;&gt;Free download the Book&amp;nbsp;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(0, 0, 0);&quot;&gt;&lt;b style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;Physics&lt;/b&gt;&lt;/span&gt;&amp;nbsp;is for 10th class. This book is published by Malik Sirajuddin &amp;amp; Sons and authors of the book are Dr. Azmat Iqbal and Dr. Ghulam Murtaza.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &amp;quot;Open Sans&amp;quot;, sans-serif; vertical-align: baseline; color: rgb(85, 85, 85); background-color: rgb(246, 246, 246);&quot;&gt;Ostensibly the best sci-fi “endeavor” of the twentieth century, “Star Trek” has caught the creative energies of millions since it debuted as a TV arrangement in 1966. As we watch the group of the Star-ship Endeavor experience life on different planets and attempt to coexist with outsider species, we start to perceive any reason why Quality Roddenberry’s “Wagon Prepare to the Stars” has produced three extra television arrangement, seven films, and a dedicated, bad-to-the-bone fan base. Star Trek inspires us to consider a future for mankind that is loaded with expectation and potential. It likewise takes advantage of the unconventionally American brand of idealism. From scene to scene, Skippers Kirk and Picard explore the Endeavor and its team out of apparently obstinate circumstances utilizing their creativity and cleverness.&lt;/p&gt;', '1619806847Physics-10th-1-1.jpg', 100, NULL, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_cart`
--

CREATE TABLE `product_cart` (
  `s_no` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `sub_cat_id` int(11) NOT NULL,
  `sub_cat_title` varchar(100) NOT NULL,
  `cat_parent` int(11) NOT NULL,
  `cat_products` int(11) NOT NULL DEFAULT 0,
  `show_in_header` tinyint(4) NOT NULL DEFAULT 1,
  `show_in_footer` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`sub_cat_id`, `sub_cat_title`, `cat_parent`, `cat_products`, `show_in_header`, `show_in_footer`) VALUES
(1, 'Grade 9', 12, 2, 1, 1),
(2, 'Grade 10', 12, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `city` text NOT NULL,
  `user_role` int(11) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `f_name`, `l_name`, `username`, `email`, `password`, `mobile`, `address`, `city`, `user_role`) VALUES
(1, 'Mohsin', 'Riaz', 'mohsinriaz@gmail.com', '', '0d9e90566e81686467710cde1e09831c', '03086556432', 'UOG', 'Gujrat', 1),
(2, 'tooba', 'butt', 'tooba@gmail.com', '', '827ccb0eea8a706c4c34a16891f84e7b', '03147876654', 'UOG Marghazar Gujrat', 'Gujrat', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_cart`
--
ALTER TABLE `product_cart`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`sub_cat_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_cart`
--
ALTER TABLE `product_cart`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `sub_cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
