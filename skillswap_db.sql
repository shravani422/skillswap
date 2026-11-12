-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2026 at 04:15 PM
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
-- Database: `skillswap_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `connections`
--

CREATE TABLE `connections` (
  `id` int(11) NOT NULL,
  `user1_id` int(11) DEFAULT NULL,
  `user2_id` int(11) DEFAULT NULL,
  `connected_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `connections`
--

INSERT INTO `connections` (`id`, `user1_id`, `user2_id`, `connected_on`) VALUES
(4, 8, 2, '2026-06-07 18:00:09'),
(5, 8, 11, '2026-06-09 05:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `connection_notes`
--

CREATE TABLE `connection_notes` (
  `note_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `note_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `connection_notes`
--

INSERT INTO `connection_notes` (`note_id`, `sender_id`, `receiver_id`, `note_text`, `created_at`) VALUES
(1, 2, 11, 'heyy', '2026-06-06 18:08:17'),
(2, 11, 2, 'hii', '2026-06-06 18:18:10'),
(3, 8, 2, 'hii\r\n', '2026-06-08 12:03:13'),
(4, 8, 2, '', '2026-06-08 12:03:15'),
(5, 8, 11, 'Hii Sunita , happy to connect with you', '2026-06-09 05:34:10'),
(6, 11, 8, 'Me too !!', '2026-06-09 05:34:57');

-- --------------------------------------------------------

--
-- Table structure for table `connection_requests`
--

CREATE TABLE `connection_requests` (
  `request_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `status` varchar(20) DEFAULT 'PENDING'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `connection_requests`
--

INSERT INTO `connection_requests` (`request_id`, `sender_id`, `receiver_id`, `status`) VALUES
(1, 2, 5, 'ACCEPTED'),
(2, 2, 5, 'ACCEPTED'),
(3, 2, 4, 'REJECTED'),
(4, 2, 6, 'ACCEPTED'),
(5, 2, 9, 'REJECTED'),
(8, 2, 8, 'ACCEPTED'),
(9, 8, 2, 'ACCEPTED'),
(10, 11, 5, 'PENDING'),
(11, 8, 11, 'ACCEPTED'),
(12, 7, 8, 'PENDING');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `reviewed_user_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `review_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `reviewer_id`, `reviewed_user_id`, `rating`, `review_text`) VALUES
(1, 2, 4, 5, 'She is such a great teacher ,working with her was a nice experience');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `learning` text DEFAULT NULL,
  `certificate_title` varchar(255) DEFAULT NULL,
  `certificate_issuer` varchar(255) DEFAULT NULL,
  `certificate_description` text DEFAULT NULL,
  `certificate_file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `city`, `bio`, `skills`, `learning`, `certificate_title`, `certificate_issuer`, `certificate_description`, `certificate_file`) VALUES
(2, 'shravani', 'shravani123@gmail.com', '123168', 'csn', 'Beginner creative learner who enjoys trying new things, meeting people, and developing practical skills in her free time.', 'Basic Sketching\r\nCanva Design\r\nBasic Cooking', 'Photography\r\nYoga\r\nGuitar\r\nVideo Editing\r\nBaking', 'Creative Skills Foundation Certificate', 'BrightPath Learning Academy', 'This certification demonstrates foundational skills in creativity, communication, visual design basics, and practical problem-solving through hands-on learning activities.', 'certificate3.jpg'),
(4, 'Neha Kulkarni', 'neha123@gmail.com', 'neha123', 'Mumbai', 'Passionate Bharatanatyam performer who loves storytelling through dance and helping beginners discover confidence on stage.', 'Bharatanatyam (Advanced),\r\nStage Performance & Expression,\r\nChoreography,\r\nRhythm & Movement Control', 'Photography,\r\nContent Creation for Social Media,\r\nBasic Video Editing', 'Certificate in Performing Arts Excellence', 'National School of Dance Arts', 'Recognizes proficiency in choreography, stage presentation, and classical dance theory.', 'certificate-template-41.jpg'),
(5, 'Kabir Malhotra', 'kabir123@gmail.com', 'kabir123', 'Ahmedabad', 'Fitness coach dedicated to helping people build strength, healthy habits, and a positive lifestyle.', 'Strength Training\r\nPersonal Fitness Coaching\r\nNutrition Basics\r\nWorkout Planning', 'Cooking (Healthy Gourmet Food)\r\nPsychology\r\nPublic Speaking', 'Certified Personal Fitness Trainer', 'FitCore Institute', 'Covers balanced diet planning, macro/micronutrients, and fitness-oriented nutrition strategies.', 'certificate-template-41.jpg'),
(6, 'Asha Patil', 'asha123@gmail.com', 'asha123', 'Pune', 'Loves cooking for her family and learning new hobbies from people around her.', 'Basic Indian Cooking\r\nPickle Making\r\nHousehold Budgeting', 'Spoken English\r\nSocial media\r\nYoga', 'Home Cooking Basics Certificate', 'Community Learning Center', 'Demonstrates basic knowledge of food preparation, kitchen hygiene, and everyday cooking techniques.', 'certificate3.jpg'),
(7, 'Akash Patil ', 'akash123@gmail.com', 'aksh123', 'Pune', 'I am Always curious to learn new things and I believe everyone has something valuable to teach.', 'Basic Excel\r\nPowerPoint\r\nCricket Coaching for Beginners', 'Cooking\r\nGuitar\r\nPublic Speaking', 'Student Productivity Skills Certificate', 'Youth Learning Forum', 'Demonstrates basic proficiency in presentations, organization, and study planning.', 'certificate2.jpg'),
(8, 'Kavya Deshmukh ', 'kavya123@gmail.com', 'kavya123', 'Nagpur', 'Creative student who loves art and enjoys learning fun new skills.', 'Drawing Basics,\r\nCraft Making,\r\nSchool Presentation Design', 'Calligraphy,\r\nDance,\r\nStory Writing', 'Young Creators Certificate', 'Kids Talent Club', 'Recognizes participation in creative arts and craft activities.', 'certificate-template-41.jpg'),
(9, 'Priya Verma', 'priya123@gmail.com', 'priya123', 'Delhi', 'Creative homemaker who enjoys crafts and is always excited to learn something new.', 'Rangoli Design\r\nGift Wrapping\r\nBasic Sewing', 'Baking\r\nCanva Design\r\nSpoken English', ' Creative Crafts Certificate', 'Local Women\'s Development Center', 'Demonstrates basic skills in handmade crafts, decoration, and creative projects.', 'certificate-template-41.jpg'),
(10, 'Suresh Nair', 'suresh123@gmail.com', 'suresh123', 'Hyderabad', 'I Enjoy helping people manage money and want to stay updated with modern technology.', 'Personal Budgeting\r\nSaving Habits\r\nBasic Financial Planning', 'Social Media\r\nGardening\r\nBasic Home Repairs', 'Financial Literacy Certificate', 'Community Development Academy', 'Demonstrates knowledge of personal finance, budgeting, and savings management.', 'certificate-template-41.jpg'),
(11, 'Sunita Joshi ', 'sunita123@gmail.com', 'sunita123', 'Pune', 'I Love knitting and spending time with people who share hobbies and experiences.', 'Knitting\r\nCrochet Basics\r\nTraditional Embroidery', 'Video Calling Apps\r\nYoga\r\nDigital Skills', 'Handcraft Skills Certificate', 'Heritage Crafts Association', 'Recognizes foundational skills in knitting, embroidery, and handmade textile crafts.', 'certificate3.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `connections`
--
ALTER TABLE `connections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `connection_notes`
--
ALTER TABLE `connection_notes`
  ADD PRIMARY KEY (`note_id`);

--
-- Indexes for table `connection_requests`
--
ALTER TABLE `connection_requests`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_review` (`reviewer_id`,`reviewed_user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `connections`
--
ALTER TABLE `connections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `connection_notes`
--
ALTER TABLE `connection_notes`
  MODIFY `note_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `connection_requests`
--
ALTER TABLE `connection_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
