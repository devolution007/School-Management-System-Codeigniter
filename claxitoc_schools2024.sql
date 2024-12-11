-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2024 at 01:04 AM
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
-- Database: `claxitoc_schools2024`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumni_events`
--

CREATE TABLE `alumni_events` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `event_for` varchar(100) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section` varchar(255) NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `note` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `is_active` int(11) NOT NULL,
  `event_notification_message` text NOT NULL,
  `show_onwebsite` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alumni_students`
--

CREATE TABLE `alumni_students` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `current_email` varchar(255) NOT NULL,
  `current_phone` varchar(255) NOT NULL,
  `occupation` text NOT NULL,
  `address` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendence_type`
--

CREATE TABLE `attendence_type` (
  `id` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `key_value` varchar(50) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `attendence_type`
--

INSERT INTO `attendence_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Present', '<b class=\"text text-success\">P</b>', 'yes', '2016-06-23 18:11:37', '0000-00-00'),
(2, 'Late With Excuse', '<b class=\"text text-warning\">E</b>', 'no', '2018-05-29 08:19:48', '0000-00-00'),
(3, 'Late', '<b class=\"text text-warning\">L</b>', 'yes', '2016-06-23 18:12:28', '0000-00-00'),
(4, 'Absent', '<b class=\"text text-danger\">A</b>', 'yes', '2016-10-11 11:35:40', '0000-00-00'),
(5, 'Holiday', 'H', 'yes', '2016-10-11 11:35:01', '0000-00-00'),
(6, 'Half Day', '<b class=\"text text-warning\">F</b>', 'yes', '2016-06-23 18:12:28', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `aws_s3_settings`
--

CREATE TABLE `aws_s3_settings` (
  `id` int(11) NOT NULL,
  `api_key` varchar(250) DEFAULT NULL,
  `api_secret` varchar(250) DEFAULT NULL,
  `bucket_name` varchar(250) DEFAULT NULL,
  `region` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `book_title` varchar(100) NOT NULL,
  `book_no` varchar(50) NOT NULL,
  `isbn_no` varchar(100) NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `rack_no` varchar(100) NOT NULL,
  `publish` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `perunitcost` float(10,2) DEFAULT NULL,
  `postdate` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `available` varchar(10) DEFAULT 'yes',
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_issues`
--

CREATE TABLE `book_issues` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `duereturn_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `is_returned` int(11) DEFAULT 0,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `captcha`
--

CREATE TABLE `captcha` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `captcha`
--

INSERT INTO `captcha` (`id`, `name`, `status`, `created_at`) VALUES
(1, 'userlogin', 0, '2021-01-19 08:10:29'),
(2, 'login', 0, '2021-01-19 08:10:31'),
(3, 'admission', 0, '2021-01-19 04:48:11'),
(4, 'complain', 0, '2021-01-19 04:48:13'),
(5, 'contact_us', 0, '2021-01-19 04:48:15'),
(6, 'guest_login_signup', 0, '2022-12-07 07:11:31');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL,
  `certificate_name` varchar(100) NOT NULL,
  `certificate_text` text NOT NULL,
  `left_header` varchar(100) NOT NULL,
  `center_header` varchar(100) NOT NULL,
  `right_header` varchar(100) NOT NULL,
  `left_footer` varchar(100) NOT NULL,
  `right_footer` varchar(100) NOT NULL,
  `center_footer` varchar(100) NOT NULL,
  `background_image` varchar(100) DEFAULT NULL,
  `created_for` tinyint(1) NOT NULL COMMENT '1 = staff, 2 = students',
  `status` tinyint(1) NOT NULL,
  `header_height` int(11) NOT NULL,
  `content_height` int(11) NOT NULL,
  `footer_height` int(11) NOT NULL,
  `content_width` int(11) NOT NULL,
  `enable_student_image` tinyint(1) NOT NULL COMMENT '0=no,1=yes',
  `enable_image_height` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `certificate_name`, `certificate_text`, `left_header`, `center_header`, `right_header`, `left_footer`, `right_footer`, `center_footer`, `background_image`, `created_for`, `status`, `header_height`, `content_height`, `footer_height`, `content_width`, `enable_student_image`, `enable_image_height`, `created_at`, `updated_at`) VALUES
(1, 'Sample Transfer Certificate', 'This is certify that <b>[name]</b> has born on [dob]  <br> and have following details [present_address] [guardian] [created_at] [admission_no] [roll_no] [class] [section] [gender] [admission_date] [category] [cast] [father_name] [mother_name] [religion] [email] [phone] .<br>We wish best of luck for future endeavors.', 'Reff. No.....1111111.........', 'To Whomever It May Concern', 'Date: _10__/_10__/__2019__', '.................................<br>admin', '.................................<br>principal', '.................................<br>admin', '', 2, 1, 360, 400, 480, 810, 1, 230, '2024-02-22 16:21:31', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `chat_connections`
--

CREATE TABLE `chat_connections` (
  `id` int(11) NOT NULL,
  `chat_user_one` int(11) NOT NULL,
  `chat_user_two` int(11) NOT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `chat_connections`
--

INSERT INTO `chat_connections` (`id`, `chat_user_one`, `chat_user_two`, `ip`, `time`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, NULL, '2023-06-22 09:24:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `chat_user_id` int(11) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `time` int(11) NOT NULL,
  `is_first` int(11) DEFAULT 0,
  `is_read` int(11) NOT NULL DEFAULT 0,
  `chat_connection_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `message`, `chat_user_id`, `ip`, `time`, `is_first`, `is_read`, `chat_connection_id`, `created_at`) VALUES
(1, 'you are now connected on chat', 2, '', 0, 1, 0, 1, NULL),
(2, 'jdsd w', 2, '', 0, 0, 0, 1, '2023-06-22 10:23:21'),
(3, 'skaoe e', 2, '', 0, 0, 0, 1, '2023-06-22 10:23:23');

-- --------------------------------------------------------

--
-- Table structure for table `chat_users`
--

CREATE TABLE `chat_users` (
  `id` int(11) NOT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `create_staff_id` int(11) DEFAULT NULL,
  `create_student_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `chat_users`
--

INSERT INTO `chat_users` (`id`, `user_type`, `staff_id`, `student_id`, `create_staff_id`, `create_student_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'staff', 1, NULL, NULL, NULL, 0, '2023-06-22 09:24:24', NULL),
(2, 'staff', 2, NULL, 1, NULL, 0, '2023-06-22 09:24:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `class` varchar(60) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'JSS 1', 'no', '2023-06-21 22:34:10', NULL),
(2, 'JSS2', 'no', '2023-06-21 22:34:19', NULL),
(3, 'JSS 3', 'no', '2024-03-17 05:24:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_sections`
--

CREATE TABLE `class_sections` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `class_sections`
--

INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'no', '2023-06-21 22:34:10', NULL),
(2, 2, 2, 'no', '2023-06-21 22:34:19', NULL),
(3, 3, 1, 'no', '2024-03-17 05:24:24', NULL),
(4, 1, 2, 'no', '2024-11-28 23:56:41', NULL),
(5, 2, 1, 'no', '2024-11-28 23:56:53', NULL),
(6, 3, 2, 'no', '2024-11-28 23:56:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_section_times`
--

CREATE TABLE `class_section_times` (
  `id` int(11) NOT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_teacher`
--

CREATE TABLE `class_teacher` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `class_teacher`
--

INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES
(5, 19, 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `id` int(11) NOT NULL,
  `complaint_type` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL,
  `action_taken` varchar(200) NOT NULL,
  `assigned` varchar(50) NOT NULL,
  `note` text NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaint_type`
--

CREATE TABLE `complaint_type` (
  `id` int(11) NOT NULL,
  `complaint_type` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `is_public` varchar(10) DEFAULT 'No',
  `class_id` int(11) DEFAULT NULL,
  `cls_sec_id` int(11) DEFAULT NULL,
  `file` varchar(250) DEFAULT NULL,
  `date` date NOT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content_for`
--

CREATE TABLE `content_for` (
  `id` int(11) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content_types`
--

CREATE TABLE `content_types` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_category`
--

CREATE TABLE `course_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `course_category`
--

INSERT INTO `course_category` (`id`, `category_name`, `slug`, `is_active`) VALUES
(1, 'JSS 2', NULL, NULL),
(2, 'English', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_lesson_quiz_order`
--

CREATE TABLE `course_lesson_quiz_order` (
  `id` int(11) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `course_section_id` int(11) DEFAULT NULL,
  `lesson_quiz_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `course_lesson_quiz_order`
--

INSERT INTO `course_lesson_quiz_order` (`id`, `type`, `course_section_id`, `lesson_quiz_id`, `order`) VALUES
(1, 'lesson', 1, 1, NULL),
(3, 'lesson', 3, 3, NULL),
(4, 'lesson', 3, 4, NULL),
(5, 'lesson', 3, 5, NULL),
(6, 'lesson', 3, 7, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_progress`
--

CREATE TABLE `course_progress` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `course_section_id` int(11) DEFAULT NULL,
  `lesson_quiz_id` int(11) DEFAULT NULL,
  `lesson_quiz_type` int(11) DEFAULT NULL COMMENT '1 lesson, 2 quiz'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_quiz_answer`
--

CREATE TABLE `course_quiz_answer` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `course_quiz_id` int(11) DEFAULT NULL,
  `course_quiz_question_id` int(11) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_quiz_question`
--

CREATE TABLE `course_quiz_question` (
  `id` int(11) NOT NULL,
  `course_quiz_id` int(11) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `option_1` varchar(255) DEFAULT NULL,
  `option_2` varchar(255) DEFAULT NULL,
  `option_3` varchar(255) DEFAULT NULL,
  `option_4` varchar(255) DEFAULT NULL,
  `option_5` varchar(255) DEFAULT NULL,
  `correct_answer` varchar(255) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_rating`
--

CREATE TABLE `course_rating` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `rating` varchar(200) NOT NULL,
  `review` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `symbol` varchar(10) DEFAULT NULL,
  `base_price` varchar(10) NOT NULL DEFAULT '1',
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES
(1, 'AED', 'AED', 'AEDf', '1', 0, '2022-12-30 06:19:15'),
(2, 'AFN', 'AFN', '؋', '1', 0, '2022-12-30 06:19:19'),
(3, 'ALL', 'ALL', 'ALL', '1', 0, '2022-12-30 06:19:22'),
(4, 'AMD', 'AMD', 'AMD', '1', 0, '2022-07-22 10:55:15'),
(5, 'ANG', 'ANG', 'ANG', '1', 0, '2022-07-22 10:55:15'),
(6, 'AOA', 'AOA', 'AOA', '1', 0, '2022-07-22 10:55:15'),
(7, 'ARS', 'ARS', 'ARS', '1', 0, '2022-07-22 10:55:15'),
(8, 'AUD', 'AUD', 'AUD', '1', 0, '2022-07-22 10:55:15'),
(9, 'AWG', 'AWG', 'AWG', '1', 0, '2022-07-22 10:55:15'),
(10, 'AZN', 'AZN', 'AZN', '1', 0, '2022-07-22 10:55:15'),
(11, 'BAM', 'BAM', 'BAM', '1', 0, '2022-07-22 10:55:15'),
(12, 'BAM', 'BAM', 'BAM', '1', 0, '2022-07-22 10:55:15'),
(13, 'BDT', 'BDT', 'BDT', '1', 0, '2022-07-22 10:55:15'),
(14, 'BGN', 'BGN', 'BGN', '1', 0, '2022-07-22 10:55:15'),
(15, 'BHD', 'BHD', 'BHD', '1', 0, '2022-07-22 10:55:15'),
(16, 'BIF', 'BIF', 'BIF', '1', 0, '2022-07-22 10:55:15'),
(17, 'BMD', 'BMD', 'BMD', '1', 0, '2022-07-22 10:55:15'),
(18, 'BND', 'BND', 'BND', '1', 0, '2022-07-22 10:55:15'),
(19, 'BOB', 'BOB', 'BOB', '1', 0, '2022-12-30 06:19:29'),
(20, 'BOV', 'BOV', 'BOV', '1', 0, '2022-12-30 06:19:38'),
(21, 'BRL', 'BRL', 'BRL', '1', 0, '2022-07-22 10:55:15'),
(22, 'BSD', 'BSD', 'BSD', '1', 0, '2022-12-30 06:19:40'),
(23, 'BTN', 'BTN', 'BTN', '1', 0, '2022-12-30 06:19:42'),
(24, 'BWP', 'BWP', 'BWP', '1', 0, '2022-07-22 10:55:15'),
(25, 'BYN', 'BYN', 'BYN', '1', 0, '2022-07-22 10:55:15'),
(26, 'BYR', 'BYR', 'BYR', '1', 0, '2022-07-22 10:55:15'),
(27, 'BZD', 'BZD', 'BZD', '1', 0, '2022-07-22 10:55:15'),
(28, 'CAD', 'CAD', 'CAD', '1', 0, '2022-07-22 10:55:15'),
(29, 'CDF', 'CDF', 'CDF', '1', 0, '2022-07-22 10:55:15'),
(30, 'CHE', 'CHE', 'CHE', '1', 0, '2022-07-22 10:55:15'),
(31, 'CHF', 'CHF', 'CHF', '1', 0, '2022-07-22 10:55:15'),
(32, 'CHW', 'CHW', 'CHW', '1', 0, '2022-07-22 10:55:15'),
(33, 'CLF', 'CLF', 'CLF', '1', 0, '2022-07-22 10:55:15'),
(34, 'CLP', 'CLP', 'CLP', '1', 0, '2022-07-22 10:55:15'),
(35, 'CNY', 'CNY', 'CNY', '1', 0, '2022-07-22 10:55:15'),
(36, 'COP', 'COP', 'COP', '1', 0, '2022-07-22 10:55:15'),
(37, 'COU', 'COU', 'COU', '1', 0, '2022-07-22 10:55:15'),
(38, 'CRC', 'CRC', 'CRC', '1', 0, '2022-07-22 10:55:15'),
(39, 'CUC', 'CUC', 'CUC', '1', 0, '2022-07-22 10:55:15'),
(40, 'CUP', 'CUP', 'CUP', '1', 0, '2022-07-22 10:55:15'),
(41, 'CVE', 'CVE', 'CVE', '1', 0, '2022-07-22 10:55:15'),
(42, 'CZK', 'CZK', 'CZK', '1', 0, '2022-07-22 10:55:15'),
(43, 'DJF', 'DJF', 'DJF', '1', 0, '2022-07-22 10:55:15'),
(44, 'DKK', 'DKK', 'DKK', '1', 0, '2022-07-22 10:55:15'),
(45, 'DOP', 'DOP', 'DOP', '1', 0, '2022-07-22 10:55:15'),
(46, 'DZD', 'DZD', 'DZD', '1', 0, '2022-07-22 10:55:15'),
(47, 'EGP', 'EGP', 'EGP', '1', 0, '2022-07-22 10:55:15'),
(48, 'ERN', 'ERN', 'ERN', '1', 0, '2022-07-22 10:55:15'),
(49, 'ETB', 'ETB', 'ETB', '1', 0, '2022-07-22 10:55:15'),
(50, 'EUR', 'EUR', '€', '1', 0, '2022-12-30 06:20:25'),
(51, 'FJD', 'FJD', 'FJD', '1', 0, '2022-07-22 10:55:15'),
(52, 'FKP', 'FKP', 'FKP', '1', 0, '2022-07-22 10:55:15'),
(53, 'GBP', 'GBP', '£', '1', 0, '2022-12-30 06:20:29'),
(54, 'GEL', 'GEL', 'GEL', '1', 0, '2022-07-22 10:55:15'),
(55, 'GHS', 'GHS', 'GHS', '1', 0, '2022-07-22 10:55:15'),
(56, 'GIP', 'GIP', 'GIP', '1', 0, '2022-07-22 10:55:15'),
(57, 'GMD', 'GMD', 'GMD', '1', 0, '2022-07-22 10:55:15'),
(58, 'GNF', 'GNF', 'GNF', '1', 0, '2022-07-22 10:55:15'),
(59, 'GTQ', 'GTQ', 'GTQ', '1', 0, '2022-07-22 10:55:15'),
(60, 'GYD', 'GYD', 'GYD', '1', 0, '2022-07-22 10:55:15'),
(61, 'HKD', 'HKD', 'HKD', '1', 0, '2022-07-22 10:55:15'),
(62, 'HNL', 'HNL', 'HNL', '1', 0, '2022-07-22 10:55:15'),
(63, 'HRK', 'HRK', 'HRK', '1', 0, '2022-07-22 10:55:15'),
(64, 'HTG', 'HTG', 'HTG', '1', 0, '2022-07-22 10:55:15'),
(65, 'HUF', 'HUF', 'HUF', '1', 0, '2022-07-22 10:55:15'),
(66, 'IDR', 'IDR', 'IDR', '1', 0, '2022-12-30 06:20:34'),
(67, 'ILS', 'ILS', 'ILS', '1', 0, '2022-07-22 10:55:15'),
(68, 'INR', 'INR', '₹', '1', 0, '2022-12-30 06:20:37'),
(69, 'IQD', 'IQD', 'IQD', '1', 0, '2022-07-22 10:55:15'),
(70, 'IRR', 'IRR', 'IRR', '1', 0, '2022-07-22 10:55:15'),
(71, 'ISK', 'ISK', 'ISK', '1', 0, '2022-07-22 10:55:15'),
(72, 'JMD', 'JMD', 'JMD', '1', 0, '2022-07-22 10:55:15'),
(73, 'JOD', 'JOD', 'JOD', '1', 0, '2022-07-22 10:55:15'),
(74, 'JPY', 'JPY', 'JPY', '1', 0, '2022-12-30 06:19:56'),
(75, 'KES', 'KES', 'KES', '1', 0, '2022-07-22 10:55:15'),
(76, 'KGS', 'KGS', 'KGS', '1', 0, '2022-07-22 10:55:15'),
(77, 'KHR', 'KHR', 'KHR', '1', 0, '2022-07-22 10:55:15'),
(78, 'KMF', 'KMF', 'KMF', '1', 0, '2022-07-22 10:55:15'),
(79, 'KPW', 'KPW', 'KPW', '1', 0, '2022-07-22 10:55:15'),
(80, 'KRW', 'KRW', 'KRW', '1', 0, '2022-07-22 10:55:15'),
(81, 'KWD', 'KWD', 'KWD', '1', 0, '2022-07-22 10:55:15'),
(82, 'KYD', 'KYD', 'KYD', '1', 0, '2022-07-22 10:55:15'),
(83, 'KZT', 'KZT', 'KZT', '1', 0, '2022-07-22 10:55:15'),
(84, 'LAK', 'LAK', 'LAK', '1', 0, '2022-07-22 10:55:15'),
(85, 'LBP', 'LBP', 'LBP', '1', 0, '2022-07-22 10:55:15'),
(86, 'LKR', 'LKR', 'LKR', '1', 0, '2022-07-22 10:55:15'),
(87, 'LRD', 'LRD', 'LRD', '1', 0, '2022-07-22 10:55:15'),
(88, 'LSL', 'LSL', 'LSL', '1', 0, '2022-07-22 10:55:15'),
(89, 'LYD', 'LYD', 'LYD', '1', 0, '2022-07-22 10:55:15'),
(90, 'MAD', 'MAD', 'MAD', '1', 0, '2022-07-22 10:55:15'),
(91, 'MDL', 'MDL', 'MDL', '1', 0, '2022-07-22 10:55:15'),
(92, 'MGA', 'MGA', 'MGA', '1', 0, '2022-07-22 10:55:15'),
(93, 'MKD', 'MKD', 'MKD', '1', 0, '2022-07-22 10:55:15'),
(94, 'MMK', 'MMK', 'MMK', '1', 0, '2022-07-22 10:55:15'),
(95, 'MNT', 'MNT', 'MNT', '1', 0, '2022-07-22 10:55:15'),
(96, 'MOP', 'MOP', 'MOP', '1', 0, '2022-07-22 10:55:15'),
(97, 'MRO', 'MRO', 'MRO', '1', 0, '2022-07-22 10:55:15'),
(98, 'MUR', 'MUR', 'MUR', '1', 0, '2022-07-22 10:55:15'),
(99, 'MVR', 'MVR', 'MVR', '1', 0, '2022-07-22 10:55:15'),
(100, 'MWK', 'MWK', 'MWK', '1', 0, '2022-07-22 10:55:15'),
(101, 'MXN', 'MXN', 'MXN', '1', 0, '2022-07-22 10:55:15'),
(102, 'MXV', 'MXV', 'MXV', '1', 0, '2022-07-22 10:55:15'),
(103, 'MYR', 'MYR', 'MYR', '1', 0, '2022-07-22 10:55:15'),
(104, 'MZN', 'MZN', 'MZN', '1', 0, '2022-07-22 10:55:15'),
(105, 'NAD', 'NAD', 'NAD', '1', 0, '2022-07-30 09:32:37'),
(106, 'NGN', 'NGN', 'NGN', '1', 1, '2023-06-25 09:11:10'),
(107, 'NIO', 'NIO', 'NIO', '1', 0, '2022-07-22 10:55:15'),
(108, 'NOK', 'NOK', 'NOK', '1', 0, '2022-07-22 10:55:15'),
(109, 'NPR', 'NPR', 'NPR', '1', 0, '2022-07-22 10:55:15'),
(110, 'NZD', 'NZD', 'NZD', '1', 0, '2022-07-22 10:55:15'),
(111, 'OMR', 'OMR', 'OMR', '1', 0, '2022-07-22 10:55:15'),
(112, 'PAB', 'PAB', 'PAB', '1', 0, '2022-07-22 10:55:15'),
(113, 'PEN', 'PEN', 'PEN', '1', 0, '2022-07-22 10:55:15'),
(114, 'PGK', 'PGK', 'PGK', '1', 0, '2022-07-22 10:55:15'),
(115, 'PHP', 'PHP', 'PHP', '1', 0, '2022-07-22 10:55:15'),
(116, 'PKR', 'PKR', 'PKR', '1', 0, '2022-12-30 06:20:19'),
(117, 'PLN', 'PLN', 'PLN', '1', 0, '2022-07-22 10:55:15'),
(118, 'PYG', 'PYG', 'PYG', '1', 0, '2022-07-22 10:55:15'),
(119, 'QAR', 'QAR', 'QAR', '1', 0, '2022-07-22 10:55:15'),
(120, 'RON', 'RON', 'RON', '1', 0, '2022-07-22 10:55:15'),
(121, 'RSD', 'RSD', 'RSD', '1', 0, '2022-07-22 10:55:15'),
(122, 'RUB', 'RUB', 'RUB', '1', 0, '2022-12-30 06:20:16'),
(123, 'RWF', 'RWF', 'RWF', '1', 0, '2022-07-22 10:55:15'),
(124, 'SAR', 'SAR', 'SAR', '1', 0, '2022-07-22 10:55:15'),
(125, 'SBD', 'SBD', 'SBD', '1', 0, '2022-07-22 10:55:15'),
(126, 'SCR', 'SCR', 'SCR', '1', 0, '2022-07-22 10:55:15'),
(127, 'SDG', 'SDG', 'SDG', '1', 0, '2022-07-22 10:55:15'),
(128, 'SEK', 'SEK', 'SEK', '1', 0, '2022-07-22 10:55:15'),
(129, 'SGD', 'SGD', 'SGD', '1', 0, '2022-07-22 10:55:15'),
(130, 'SHP', 'SHP', 'SHP', '1', 0, '2022-07-22 10:55:15'),
(131, 'SLL', 'SLL', 'SLL', '1', 0, '2022-07-22 10:55:15'),
(132, 'SOS', 'SOS', 'SOS', '1', 0, '2022-07-22 10:55:15'),
(133, 'SRD', 'SRD', 'SRD', '1', 0, '2022-07-22 10:55:15'),
(134, 'SSP', 'SSP', 'SSP', '1', 0, '2022-07-22 10:55:15'),
(135, 'STD', 'STD', 'STD', '1', 0, '2022-07-22 10:55:15'),
(136, 'SVC', 'SVC', 'SVC', '1', 0, '2022-07-22 10:55:15'),
(137, 'SYP', 'SYP', 'SYP', '1', 0, '2022-07-22 10:55:15'),
(138, 'SZL', 'SZL', 'SZL', '1', 0, '2022-07-22 10:55:15'),
(139, 'THB', 'THB', 'THB', '1', 0, '2022-07-22 10:55:15'),
(140, 'TJS', 'TJS', 'TJS', '1', 0, '2022-07-22 10:55:15'),
(141, 'TMT', 'TMT', 'TMT', '1', 0, '2022-07-22 10:55:15'),
(142, 'TND', 'TND', 'TND', '1', 0, '2022-07-22 10:55:15'),
(143, 'TOP', 'TOP', 'TOP', '1', 0, '2022-07-22 10:55:15'),
(144, 'TRY', 'TRY', 'TRY', '1', 0, '2022-07-22 10:55:15'),
(145, 'TTD', 'TTD', 'TTD', '1', 0, '2022-07-22 10:55:15'),
(146, 'TWD', 'TWD', 'TWD', '1', 0, '2022-07-22 10:55:15'),
(147, 'TZS', 'TZS', 'TZS', '1', 0, '2022-07-22 10:55:15'),
(148, 'UAH', 'UAH', 'UAH', '1', 0, '2022-07-22 10:55:15'),
(149, 'UGX', 'UGX', 'UGX', '1', 0, '2022-07-22 10:55:15'),
(150, 'USD', 'USD', '$', '1', 1, '2022-07-22 10:55:15'),
(151, 'USN', 'USN', 'USN', '1', 0, '2022-12-30 06:20:03'),
(152, 'UYI', 'UYI', 'UYI', '1', 0, '2022-07-22 10:55:15'),
(153, 'UYU', 'UYU', 'UYU', '1', 0, '2022-07-22 10:55:15'),
(154, 'UZS', 'UZS', 'UZS', '1', 0, '2022-07-22 10:55:15'),
(155, 'VEF', 'VEF', 'VEF', '1', 0, '2022-07-22 10:55:15'),
(156, 'VND', 'VND', 'VND', '1', 0, '2022-07-22 10:55:15'),
(157, 'VUV', 'VUV', 'VUV', '1', 0, '2022-07-22 10:55:15'),
(158, 'WST', 'WST', 'WST', '1', 0, '2022-07-22 10:55:15'),
(159, 'XAF', 'XAF', 'XAF', '1', 0, '2022-07-22 10:55:15'),
(160, 'XAG', 'XAG', 'XAG', '1', 0, '2022-07-22 10:55:15'),
(161, 'XAU', 'XAU', 'XAU', '1', 0, '2022-07-22 10:55:15'),
(162, 'XBA', 'XBA', 'XBA', '1', 0, '2022-07-22 10:55:15'),
(163, 'XBB', 'XBB', 'XBB', '1', 0, '2022-07-22 10:55:15'),
(164, 'XBC', 'XBC', 'XBC', '1', 0, '2022-07-22 10:55:15'),
(165, 'XBD', 'XBD', 'XBD', '1', 0, '2022-07-22 10:55:15'),
(166, 'XCD', 'XCD', 'XCD', '1', 0, '2022-07-22 10:55:15'),
(167, 'XDR', 'XDR', 'XDR', '1', 0, '2022-07-22 10:55:15'),
(168, 'XOF', 'XOF', 'XOF', '1', 0, '2022-07-22 10:55:15'),
(169, 'XPD', 'XPD', 'XPD', '1', 0, '2022-07-22 10:55:15'),
(170, 'XPF', 'XPF', 'XPF', '1', 0, '2022-07-22 10:55:15'),
(171, 'XPT', 'XPT', 'XPT', '1', 0, '2022-07-22 10:55:15'),
(172, 'XSU', 'XSU', 'XSU', '1', 0, '2022-07-22 10:55:15'),
(173, 'XTS', 'XTS', 'XTS', '1', 0, '2022-07-22 10:55:15'),
(174, 'XUA', 'XUA', 'XUA', '1', 0, '2022-07-22 10:55:15'),
(175, 'XXX', 'XXX', 'XXX', '1', 0, '2022-07-22 10:55:15'),
(176, 'YER', 'YER', 'YER', '1', 0, '2022-07-22 10:55:15'),
(177, 'ZAR', 'ZAR', 'ZAR', '1', 0, '2022-12-30 06:20:07'),
(178, 'ZMW', 'ZMW', 'ZMW', '1', 0, '2022-07-30 07:34:00'),
(179, 'ZWL', 'ZWL', 'ZWL', '1', 0, '2022-07-22 10:55:15');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `belong_to` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `bs_column` int(11) DEFAULT NULL,
  `validation` int(11) DEFAULT 0,
  `field_values` text DEFAULT NULL,
  `show_table` varchar(100) DEFAULT NULL,
  `visible_on_table` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `name`, `belong_to`, `type`, `bs_column`, `validation`, `field_values`, `show_table`, `visible_on_table`, `weight`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Color', 'students', 'colorpicker', 12, 0, '', NULL, 0, NULL, 0, '2023-06-25 09:19:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` int(11) NOT NULL,
  `belong_table_id` int(11) DEFAULT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `field_value` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `custom_field_values`
--

INSERT INTO `custom_field_values` (`id`, `belong_table_id`, `custom_field_id`, `field_value`, `created_at`, `updated_at`) VALUES
(13, 20, 1, '#000000', '2024-08-06 12:13:45', NULL),
(14, 21, 1, '#000000', '2024-08-06 12:36:04', NULL),
(15, 22, 1, '#000000', '2024-08-06 12:38:23', NULL),
(16, 23, 1, '#000000', '2024-08-06 12:38:48', NULL),
(17, 24, 1, '#000000', '2024-08-06 12:39:04', NULL),
(18, 25, 1, '#000000', '2024-08-06 12:40:57', NULL),
(19, 26, 1, '#000000', '2024-08-06 12:41:28', NULL),
(20, 27, 1, '#000000', '2024-08-06 12:41:43', NULL),
(21, 28, 1, '#000000', '2024-08-06 12:42:01', NULL),
(22, 29, 1, '#000000', '2024-08-06 12:42:20', NULL),
(23, 30, 1, '#000000', '2024-08-06 12:42:39', NULL),
(24, 31, 1, '#000000', '2024-08-06 12:42:57', NULL),
(25, 32, 1, '#000000', '2024-08-06 12:43:17', NULL),
(26, 33, 1, '#000000', '2024-08-06 12:43:39', NULL),
(27, 34, 1, '#000000', '2024-08-06 12:44:06', NULL),
(28, 35, 1, '#000000', '2024-08-06 12:44:29', NULL),
(29, 36, 1, '#000000', '2024-08-06 12:48:21', NULL),
(30, 37, 1, '#000000', '2024-08-06 12:48:24', NULL),
(31, 38, 1, '#000000', '2024-08-06 12:48:37', NULL),
(32, 39, 1, '#000000', '2024-08-06 12:48:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `daily_assignment`
--

CREATE TABLE `daily_assignment` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) NOT NULL,
  `subject_group_subject_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `evaluated_by` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `evaluation_date` date DEFAULT NULL,
  `remark` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `department_name` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disable_reason`
--

CREATE TABLE `disable_reason` (
  `id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `disable_reason`
--

INSERT INTO `disable_reason` (`id`, `reason`, `created_at`) VALUES
(1, 'Test', '2024-01-11 17:04:52');

-- --------------------------------------------------------

--
-- Table structure for table `dispatch_receive`
--

CREATE TABLE `dispatch_receive` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(50) NOT NULL,
  `to_title` varchar(100) NOT NULL,
  `type` varchar(10) NOT NULL,
  `address` varchar(500) NOT NULL,
  `note` varchar(500) NOT NULL,
  `from_title` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_attachments`
--

CREATE TABLE `email_attachments` (
  `id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `directory` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `attachment_name` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_config`
--

CREATE TABLE `email_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `email_type` varchar(100) DEFAULT NULL,
  `smtp_server` varchar(100) DEFAULT NULL,
  `smtp_port` varchar(100) DEFAULT NULL,
  `smtp_username` varchar(100) DEFAULT NULL,
  `smtp_password` varchar(100) DEFAULT NULL,
  `ssl_tls` varchar(100) DEFAULT NULL,
  `smtp_auth` varchar(10) NOT NULL,
  `api_key` varchar(255) DEFAULT NULL,
  `api_secret` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `email_config`
--

INSERT INTO `email_config` (`id`, `email_type`, `smtp_server`, `smtp_port`, `smtp_username`, `smtp_password`, `ssl_tls`, `smtp_auth`, `api_key`, `api_secret`, `region`, `is_active`, `created_at`) VALUES
(1, 'sendmail', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'yes', '2020-02-28 13:46:03');

-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

CREATE TABLE `email_template` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_template_attachment`
--

CREATE TABLE `email_template_attachment` (
  `id` int(11) NOT NULL,
  `email_template_id` int(11) NOT NULL,
  `attachment` varchar(100) NOT NULL,
  `attachment_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `reference` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `note` text NOT NULL,
  `source` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `assigned` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `no_of_child` varchar(11) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_type`
--

CREATE TABLE `enquiry_type` (
  `id` int(11) NOT NULL,
  `enquiry_type` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `event_title` varchar(200) NOT NULL,
  `event_description` text NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `event_color` varchar(200) NOT NULL,
  `event_for` varchar(100) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `sesion_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_groups`
--

CREATE TABLE `exam_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `exam_type` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_group_class_batch_exams`
--

CREATE TABLE `exam_group_class_batch_exams` (
  `id` int(11) NOT NULL,
  `exam` varchar(250) DEFAULT NULL,
  `passing_percentage` float(10,2) DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `exam_group_id` int(11) DEFAULT NULL,
  `use_exam_roll_no` int(11) NOT NULL DEFAULT 1,
  `is_publish` int(11) DEFAULT 0,
  `is_rank_generated` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_group_class_batch_exam_students`
--

CREATE TABLE `exam_group_class_batch_exam_students` (
  `id` int(11) NOT NULL,
  `exam_group_class_batch_exam_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_session_id` int(11) NOT NULL,
  `roll_no` int(11) DEFAULT NULL,
  `teacher_remark` text DEFAULT NULL,
  `rank` int(11) NOT NULL DEFAULT 0,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_group_class_batch_exam_subjects`
--

CREATE TABLE `exam_group_class_batch_exam_subjects` (
  `id` int(11) NOT NULL,
  `exam_group_class_batch_exams_id` int(11) DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `date_from` date NOT NULL,
  `time_from` time NOT NULL,
  `duration` varchar(50) NOT NULL,
  `room_no` varchar(100) DEFAULT NULL,
  `max_marks` float(10,2) DEFAULT NULL,
  `min_marks` float(10,2) DEFAULT NULL,
  `credit_hours` float(10,2) DEFAULT 0.00,
  `date_to` datetime DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_group_exam_connections`
--

CREATE TABLE `exam_group_exam_connections` (
  `id` int(11) NOT NULL,
  `exam_group_id` int(11) DEFAULT NULL,
  `exam_group_class_batch_exams_id` int(11) DEFAULT NULL,
  `exam_weightage` float(10,2) DEFAULT 0.00,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_group_exam_results`
--

CREATE TABLE `exam_group_exam_results` (
  `id` int(11) NOT NULL,
  `exam_group_class_batch_exam_student_id` int(11) NOT NULL,
  `exam_group_class_batch_exam_subject_id` int(11) DEFAULT NULL,
  `exam_group_student_id` int(11) DEFAULT NULL,
  `attendence` varchar(10) DEFAULT NULL,
  `get_marks` float(10,2) DEFAULT 0.00,
  `note` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_group_students`
--

CREATE TABLE `exam_group_students` (
  `id` int(11) NOT NULL,
  `exam_group_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_schedules`
--

CREATE TABLE `exam_schedules` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `teacher_subject_id` int(11) DEFAULT NULL,
  `date_of_exam` date DEFAULT NULL,
  `start_to` varchar(50) DEFAULT NULL,
  `end_from` varchar(50) DEFAULT NULL,
  `room_no` varchar(50) DEFAULT NULL,
  `full_marks` int(11) DEFAULT NULL,
  `passing_marks` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `exp_head_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `documents` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_head`
--

CREATE TABLE `expense_head` (
  `id` int(11) NOT NULL,
  `exp_category` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feemasters`
--

CREATE TABLE `feemasters` (
  `id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `feetype_id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_discounts`
--

CREATE TABLE `fees_discounts` (
  `id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `percentage` float(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_reminder`
--

CREATE TABLE `fees_reminder` (
  `id` int(11) NOT NULL,
  `reminder_type` varchar(10) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fees_reminder`
--

INSERT INTO `fees_reminder` (`id`, `reminder_type`, `day`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'before', 2, 0, '2020-02-28 13:38:32', NULL),
(2, 'before', 5, 0, '2020-02-28 13:38:36', NULL),
(3, 'after', 2, 0, '2020-02-28 13:38:40', NULL),
(4, 'after', 5, 0, '2020-02-28 13:38:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `feetype`
--

CREATE TABLE `feetype` (
  `id` int(11) NOT NULL,
  `is_system` int(11) NOT NULL DEFAULT 0,
  `feecategory_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_groups`
--

CREATE TABLE `fee_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `is_system` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_groups_feetype`
--

CREATE TABLE `fee_groups_feetype` (
  `id` int(11) NOT NULL,
  `fee_session_group_id` int(11) DEFAULT NULL,
  `fee_groups_id` int(11) DEFAULT NULL,
  `feetype_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `fine_type` varchar(50) NOT NULL DEFAULT 'none',
  `due_date` date DEFAULT NULL,
  `fine_percentage` float(10,2) NOT NULL DEFAULT 0.00,
  `fine_amount` float(10,2) NOT NULL DEFAULT 0.00,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_receipt_no`
--

CREATE TABLE `fee_receipt_no` (
  `id` int(11) NOT NULL,
  `payment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_session_groups`
--

CREATE TABLE `fee_session_groups` (
  `id` int(11) NOT NULL,
  `fee_groups_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filetypes`
--

CREATE TABLE `filetypes` (
  `id` int(11) NOT NULL,
  `file_extension` text DEFAULT NULL,
  `file_mime` text DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `image_extension` text DEFAULT NULL,
  `image_mime` text DEFAULT NULL,
  `image_size` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `filetypes`
--

INSERT INTO `filetypes` (`id`, `file_extension`, `file_mime`, `file_size`, `image_extension`, `image_mime`, `image_size`, `created_at`) VALUES
(1, 'pdf, zip, jpg, jpeg, png, txt, 7z, gif, csv, docx, mp3, mp4, accdb, odt, ods, ppt, pptx, xlsx, wmv, jfif, apk, ppt, bmp, jpe, mdb, rar, xls, svg', 'application/pdf, image/zip, image/jpg, image/png, image/jpeg, text/plain, application/x-zip-compressed, application/zip, image/gif, text/csv, application/vnd.openxmlformats-officedocument.wordprocessingml.document, audio/mpeg, application/msaccess, application/vnd.oasis.opendocument.text, application/vnd.oasis.opendocument.spreadsheet, application/vnd.ms-powerpoint, application/vnd.openxmlformats-officedocument.presentationml.presentation, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, video/x-ms-wmv, video/mp4, image/jpeg, application/vnd.android.package-archive, application/x-msdownload, application/vnd.ms-powerpoint, image/bmp, image/jpeg, application/msaccess, application/vnd.ms-excel, image/svg+xml', 100048576, 'jfif, png, jpe, jpeg, jpg, bmp, gif, svg', 'image/jpeg, image/png, image/jpeg, image/jpeg, image/bmp, image/gif, image/x-ms-bmp, image/svg+xml', 10048576, '2021-01-30 13:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `follow_up`
--

CREATE TABLE `follow_up` (
  `id` int(11) NOT NULL,
  `enquiry_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `next_date` date NOT NULL,
  `response` text NOT NULL,
  `note` text NOT NULL,
  `followup_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_media_gallery`
--

CREATE TABLE `front_cms_media_gallery` (
  `id` int(11) NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `thumb_path` varchar(300) DEFAULT NULL,
  `dir_path` varchar(300) DEFAULT NULL,
  `img_name` varchar(300) DEFAULT NULL,
  `thumb_name` varchar(300) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `file_type` varchar(100) NOT NULL,
  `file_size` varchar(100) NOT NULL,
  `vid_url` text NOT NULL,
  `vid_title` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menus`
--

CREATE TABLE `front_cms_menus` (
  `id` int(11) NOT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `open_new_tab` int(11) NOT NULL DEFAULT 0,
  `ext_url` text NOT NULL,
  `ext_url_link` text NOT NULL,
  `publish` int(11) NOT NULL DEFAULT 0,
  `content_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_menus`
--

INSERT INTO `front_cms_menus` (`id`, `menu`, `slug`, `description`, `open_new_tab`, `ext_url`, `ext_url_link`, `publish`, `content_type`, `is_active`, `created_at`) VALUES
(1, 'Main Menu', 'main-menu', 'Main menu', 0, '', '', 0, 'default', 'no', '2018-04-20 14:54:49'),
(2, 'Bottom Menu', 'bottom-menu', 'Bottom Menu', 0, '', '', 0, 'default', 'no', '2018-04-20 14:54:55');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menu_items`
--

CREATE TABLE `front_cms_menu_items` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `ext_url` text DEFAULT NULL,
  `open_new_tab` int(11) DEFAULT 0,
  `ext_url_link` text DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `publish` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_menu_items`
--

INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES
(1, 1, 'Home', 1, 0, NULL, NULL, NULL, 'home', 1, 0, NULL, 'no', '2019-12-02 22:11:50'),
(2, 1, 'Contact Us', 76, 0, NULL, NULL, NULL, 'contact-us', 4, 0, NULL, 'no', '2019-12-02 22:11:52'),
(3, 1, 'Complain', 2, 0, NULL, NULL, NULL, 'complain', 3, 0, NULL, 'no', '2019-12-02 22:11:52'),
(4, 1, 'Online Admission', 0, 0, '1', NULL, 'http://yourschoolurl.com/online_admission', 'admssion', 2, 0, NULL, 'no', '2019-12-21 15:33:00');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_pages`
--

CREATE TABLE `front_cms_pages` (
  `id` int(11) NOT NULL,
  `page_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_homepage` int(11) DEFAULT 0,
  `title` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `feature_image` varchar(200) NOT NULL,
  `description` longtext DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `publish` int(11) DEFAULT 0,
  `sidebar` int(11) DEFAULT 0,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_pages`
--

INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES
(1, 'default', 1, 'Home', 'page/home', 'page', 'home', '', '', '', '', '<p>home page</p>', '0000-00-00', 1, NULL, 'no', '2019-12-02 15:23:47'),
(2, 'default', 0, 'Complain', 'page/complain', 'page', 'complain', 'Complain form', '                                                                                                                                                                                    complain form                                                                                                                                                                                                                                ', 'complain form', '', '<p>[form-builder:complain]</p>', '0000-00-00', 1, NULL, 'no', '2019-11-13 10:16:36'),
(3, 'default', 0, '404 page', 'page/404-page', 'page', '404-page', '', '                                ', '', '', '<html>\r\n<head>\r\n <title></title>\r\n</head>\r\n<body>\r\n<p>404 page found</p>\r\n</body>\r\n</html>', '0000-00-00', 0, NULL, 'no', '2018-05-18 14:46:04'),
(4, 'default', 0, 'Contact us', 'page/contact-us', 'page', 'contact-us', '', '', '', '', '<section class=\"contact\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<h2 class=\"col-md-12 col-sm-12\">Send In Your Query</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<div class=\"col-md-12 col-sm-12\">[form-builder:contact_us]<!--./row--></div>\r\n<!--./col-md-12--></div>\r\n<!--./row--></div>\r\n<!--./container--></section>\r\n\r\n<div class=\"col-md-4 col-sm-4\">\r\n<div class=\"contact-item\"><img src=\"http://192.168.1.81/repos/smartschool/uploads/gallery/media/pin.svg\" />\r\n<h3>Our Location</h3>\r\n\r\n<p>350 Fifth Avenue, 34th floor New York NY 10118-3299 USA</p>\r\n</div>\r\n<!--./contact-item--></div>\r\n<!--./col-md-4-->\r\n\r\n<div class=\"col-md-4 col-sm-4\">\r\n<div class=\"contact-item\"><img src=\"http://192.168.1.81/repos/smartschool/uploads/gallery/media/phone.svg\" />\r\n<h3>CALL US</h3>\r\n\r\n<p>E-mail : info@abcschool.com</p>\r\n\r\n<p>Mobile : +91-9009987654</p>\r\n</div>\r\n<!--./contact-item--></div>\r\n<!--./col-md-4-->\r\n\r\n<div class=\"col-md-4 col-sm-4\">\r\n<div class=\"contact-item\"><img src=\"http://192.168.1.81/repos/smartschool/uploads/gallery/media/clock.svg\" />\r\n<h3>Working Hours</h3>\r\n\r\n<p>Mon-Fri : 9 am to 5 pm</p>\r\n\r\n<p>Sat : 9 am to 3 pm</p>\r\n</div>\r\n<!--./contact-item--></div>\r\n<!--./col-md-4-->\r\n\r\n<div class=\"col-md-12 col-sm-12\">\r\n<div class=\"mapWrapper fullwidth\"><iframe frameborder=\"0\" height=\"500\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" src=\"http://maps.google.com/maps?f=q&source=s_q&hl=EN&q=time+square&aq=&sll=40.716558,-73.931122&sspn=0.40438,1.056747&ie=UTF8&rq=1&ev=p&split=1&radius=33.22&hq=time+square&hnear=&ll=37.061753,-95.677185&spn=0.438347,0.769043&z=9&output=embed\" width=\"100%\"></iframe></div>\r\n</div>', '0000-00-00', 0, NULL, 'no', '2019-05-04 15:46:41');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_page_contents`
--

CREATE TABLE `front_cms_page_contents` (
  `id` int(11) NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_programs`
--

CREATE TABLE `front_cms_programs` (
  `id` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `event_start` date DEFAULT NULL,
  `event_end` date DEFAULT NULL,
  `event_venue` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `meta_title` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `feature_image` text NOT NULL,
  `publish_date` date DEFAULT NULL,
  `publish` varchar(10) DEFAULT '0',
  `sidebar` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_program_photos`
--

CREATE TABLE `front_cms_program_photos` (
  `id` int(11) NOT NULL,
  `program_id` int(11) DEFAULT NULL,
  `media_gallery_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_settings`
--

CREATE TABLE `front_cms_settings` (
  `id` int(11) NOT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `is_active_rtl` int(11) DEFAULT 0,
  `is_active_front_cms` int(11) DEFAULT 0,
  `is_active_sidebar` int(11) DEFAULT 0,
  `logo` varchar(200) DEFAULT NULL,
  `contact_us_email` varchar(100) DEFAULT NULL,
  `complain_form_email` varchar(100) DEFAULT NULL,
  `sidebar_options` text NOT NULL,
  `whatsapp_url` varchar(255) NOT NULL,
  `fb_url` varchar(200) NOT NULL,
  `twitter_url` varchar(200) NOT NULL,
  `youtube_url` varchar(200) NOT NULL,
  `google_plus` varchar(200) NOT NULL,
  `instagram_url` varchar(200) NOT NULL,
  `pinterest_url` varchar(200) NOT NULL,
  `linkedin_url` varchar(200) NOT NULL,
  `google_analytics` text DEFAULT NULL,
  `footer_text` varchar(500) DEFAULT NULL,
  `cookie_consent` varchar(255) NOT NULL,
  `fav_icon` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_settings`
--

INSERT INTO `front_cms_settings` (`id`, `theme`, `is_active_rtl`, `is_active_front_cms`, `is_active_sidebar`, `logo`, `contact_us_email`, `complain_form_email`, `sidebar_options`, `whatsapp_url`, `fb_url`, `twitter_url`, `youtube_url`, `google_plus`, `instagram_url`, `pinterest_url`, `linkedin_url`, `google_analytics`, `footer_text`, `cookie_consent`, `fav_icon`, `created_at`) VALUES
(1, 'material_pink', NULL, NULL, NULL, './uploads/school_content/logo/1672900975-128524590063b6716fc26ed!front_logo-608ff44a5f8f07.35255544.png', '', '', '[]', '', '', '', '', '', '', '', '', '', '', '', './uploads/school_content/logo/1672900975-63781378463b6716fc2886!front_fav_icon-608ff44a5fdb33.94953981.png', '2023-01-05 06:42:55');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_ins`
--

CREATE TABLE `gateway_ins` (
  `id` int(11) NOT NULL,
  `online_admission_id` int(11) DEFAULT NULL,
  `gateway_name` varchar(50) NOT NULL,
  `module_type` varchar(255) NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  `parameter_details` mediumtext NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateway_ins_response`
--

CREATE TABLE `gateway_ins_response` (
  `id` int(11) NOT NULL,
  `gateway_ins_id` int(11) DEFAULT NULL,
  `posted_data` text DEFAULT NULL,
  `response` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_calls`
--

CREATE TABLE `general_calls` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `call_duration` varchar(50) NOT NULL,
  `note` text NOT NULL,
  `call_type` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gmeet`
--

CREATE TABLE `gmeet` (
  `id` int(11) NOT NULL,
  `purpose` varchar(20) NOT NULL DEFAULT 'class',
  `staff_id` int(11) DEFAULT NULL,
  `created_id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'manual',
  `api_data` text DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `url` text NOT NULL,
  `session_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `timezone` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `gmeet`
--

INSERT INTO `gmeet` (`id`, `purpose`, `staff_id`, `created_id`, `title`, `date`, `type`, `api_data`, `duration`, `subject`, `url`, `session_id`, `description`, `timezone`, `status`, `created_at`) VALUES
(1, 'class', 2, 1, 'English', '2023-06-23 22:36:00', 'manual', NULL, 65, NULL, 'https://meet.google.com/_meet/dhj-zsxw-uwd?ijlm=1687588631003&adhoc=1&hs=187', 19, 'hello', 'UTC', 2, '2023-06-23 21:41:45'),
(2, 'meeting', NULL, 1, 'pop', '2023-06-23 22:37:00', 'manual', NULL, 45, NULL, 'https://meet.google.com/_meet/dhj-zsxw-uwd?ijlm=1687588631003&adhoc=1&hs=187', 19, '', 'UTC', 0, '2023-06-23 21:39:22');

-- --------------------------------------------------------

--
-- Table structure for table `gmeet_history`
--

CREATE TABLE `gmeet_history` (
  `id` int(11) NOT NULL,
  `gmeet_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `total_hit` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gmeet_sections`
--

CREATE TABLE `gmeet_sections` (
  `id` int(11) NOT NULL,
  `gmeet_id` int(11) NOT NULL,
  `cls_section_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `gmeet_sections`
--

INSERT INTO `gmeet_sections` (`id`, `gmeet_id`, `cls_section_id`, `created_at`) VALUES
(1, 1, 2, '2023-06-23 21:38:53');

-- --------------------------------------------------------

--
-- Table structure for table `gmeet_settings`
--

CREATE TABLE `gmeet_settings` (
  `id` int(11) NOT NULL,
  `api_key` varchar(200) DEFAULT NULL,
  `api_secret` varchar(200) DEFAULT NULL,
  `use_api` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gmeet_staff`
--

CREATE TABLE `gmeet_staff` (
  `id` int(11) NOT NULL,
  `gmeet_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `gmeet_staff`
--

INSERT INTO `gmeet_staff` (`id`, `gmeet_id`, `staff_id`, `created_at`) VALUES
(1, 2, 2, '2023-06-23 21:39:22');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(11) NOT NULL,
  `exam_type` varchar(250) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `point` float(10,1) DEFAULT NULL,
  `mark_from` float(10,2) DEFAULT NULL,
  `mark_upto` float(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grade_settings`
--

CREATE TABLE `grade_settings` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `term` varchar(255) DEFAULT NULL,
  `grade` char(1) DEFAULT NULL,
  `min_score` int(11) DEFAULT NULL,
  `max_score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grade_settings`
--

INSERT INTO `grade_settings` (`id`, `class_id`, `term`, `grade`, `min_score`, `max_score`) VALUES
(6, 3, '1st Term', 'C', 65, 75),
(8, 3, '1st Term', 'D', 50, 60),
(11, 3, '1st Term', 'F', 1, 50),
(12, 3, '2nd Term', 'A', 90, 100),
(13, 3, '2nd Term', 'B', 80, 89),
(14, 3, '2nd Term', 'C', 70, 79),
(15, 3, '2nd Term', 'D', 50, 69),
(16, 3, '2nd Term', 'F', 1, 49),
(17, 3, '3rd Term', 'A', 85, 100),
(18, 3, '3rd Term', 'B', 75, 84),
(19, 3, '3rd Term', 'C', 60, 74),
(20, 3, '3rd Term', 'D', 50, 59),
(21, 3, '3rd Term', 'F', 1, 49),
(22, 1, '1st Term', 'A', 90, 100),
(23, 2, '1st Term', 'A', 90, 100),
(31, 1, '3rd Term', 'B', 500, 600),
(32, 2, '3rd Term', 'B', 500, 600),
(33, 1, '1st Term', 'L', 80, 100),
(34, 3, '1st Term', 'K', 80, 90),
(35, 1, '3rd Term', 'E', 60, 90),
(36, 2, '3rd Term', 'E', 60, 90),
(37, 3, '3rd Term', 'E', 60, 90),
(38, 1, '1st Term', 'B', 56, 80),
(39, 2, '1st Term', 'B', 56, 80),
(40, 1, '3rd Term', 'A', 20, 30),
(41, 2, '3rd Term', 'A', 20, 30);

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `id` int(11) NOT NULL,
  `guest_name` varchar(200) NOT NULL,
  `guest_unique_id` varchar(200) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `dob` varchar(200) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `note` text NOT NULL,
  `address` varchar(200) NOT NULL,
  `guest_image` varchar(200) NOT NULL,
  `verification_code` varchar(200) NOT NULL,
  `created_at` date NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `homework`
--

CREATE TABLE `homework` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `subject_group_subject_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `homework_date` date NOT NULL,
  `submit_date` date NOT NULL,
  `marks` float(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `create_date` date NOT NULL,
  `evaluation_date` date DEFAULT NULL,
  `document` varchar(200) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `evaluated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `homework_evaluation`
--

CREATE TABLE `homework_evaluation` (
  `id` int(11) NOT NULL,
  `homework_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `marks` float(10,2) DEFAULT NULL,
  `note` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

CREATE TABLE `hostel` (
  `id` int(11) NOT NULL,
  `hostel_name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `intake` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hostel_rooms`
--

CREATE TABLE `hostel_rooms` (
  `id` int(11) NOT NULL,
  `hostel_id` int(11) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `room_no` varchar(200) DEFAULT NULL,
  `no_of_bed` int(11) DEFAULT NULL,
  `cost_per_bed` float(10,2) DEFAULT 0.00,
  `title` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `id_card`
--

CREATE TABLE `id_card` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `school_name` varchar(100) NOT NULL,
  `school_address` varchar(500) NOT NULL,
  `background` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `sign_image` varchar(100) NOT NULL,
  `enable_vertical_card` int(11) NOT NULL DEFAULT 0,
  `header_color` varchar(100) NOT NULL,
  `enable_admission_no` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_student_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_class` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_fathers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_mothers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_address` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_phone` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_dob` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_blood_group` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_student_barcode` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=disable,1=enable',
  `status` tinyint(1) NOT NULL COMMENT '0=disable,1=enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `id_card`
--

INSERT INTO `id_card` (`id`, `title`, `school_name`, `school_address`, `background`, `logo`, `sign_image`, `enable_vertical_card`, `header_color`, `enable_admission_no`, `enable_student_name`, `enable_class`, `enable_fathers_name`, `enable_mothers_name`, `enable_address`, `enable_phone`, `enable_dob`, `enable_blood_group`, `enable_student_barcode`, `status`) VALUES
(2, 'Sample Student Identity Card Vertical', 'Mount Carmel School', '110 Kings Street, CA  Phone: 456542 Email: mount@gmail.com', 'samplebackground12.png', 'samplelogo12.png', 'samplesign12.png', 1, '#595959', 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `id` int(11) NOT NULL,
  `income_head_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` float(10,2) DEFAULT 0.00,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `documents` varchar(255) DEFAULT NULL,
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income_head`
--

CREATE TABLE `income_head` (
  `id` int(11) NOT NULL,
  `income_category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `is_deleted` varchar(255) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `item_store_id` int(11) DEFAULT NULL,
  `item_supplier_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `item_photo` varchar(225) DEFAULT NULL,
  `description` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `id` int(11) NOT NULL,
  `item_category` varchar(255) NOT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_issue`
--

CREATE TABLE `item_issue` (
  `id` int(11) NOT NULL,
  `issue_type` varchar(15) DEFAULT NULL,
  `issue_to` int(11) NOT NULL,
  `issue_by` int(11) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `note` text NOT NULL,
  `is_returned` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` varchar(10) DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_stock`
--

CREATE TABLE `item_stock` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `symbol` varchar(10) NOT NULL DEFAULT '+',
  `quantity` int(11) DEFAULT NULL,
  `purchase_price` float(10,2) NOT NULL,
  `date` date NOT NULL,
  `attachment` varchar(250) DEFAULT NULL,
  `description` text NOT NULL,
  `is_active` varchar(10) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_store`
--

CREATE TABLE `item_store` (
  `id` int(11) NOT NULL,
  `item_store` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_supplier`
--

CREATE TABLE `item_supplier` (
  `id` int(11) NOT NULL,
  `item_supplier` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_person_name` varchar(255) NOT NULL,
  `contact_person_phone` varchar(255) NOT NULL,
  `contact_person_email` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language` varchar(50) DEFAULT NULL,
  `short_code` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `is_rtl` int(11) NOT NULL,
  `is_deleted` varchar(10) NOT NULL DEFAULT 'yes',
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Azerbaijan', 'az', 'az', 0, 'no', 'no', '2019-11-20 11:23:12', '0000-00-00'),
(2, 'Albanian', 'sq', 'al', 0, 'no', 'no', '2019-11-20 11:42:42', '0000-00-00'),
(3, 'Amharic', 'am', 'am', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(4, 'English', 'en', 'us', 0, 'no', 'no', '2019-11-20 11:38:50', '0000-00-00'),
(5, 'Arabic', 'ar', 'sa', 0, 'no', 'no', '2019-11-20 11:47:28', '0000-00-00'),
(7, 'Afrikaans', 'af', 'af', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(8, 'Basque', 'eu', 'es', 0, 'no', 'no', '2019-11-20 11:54:10', '0000-00-00'),
(11, 'Bengali', 'bn', 'in', 0, 'no', 'no', '2019-11-20 11:41:53', '0000-00-00'),
(13, 'Bosnian', 'bs', 'bs', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(14, 'Welsh', 'cy', 'cy', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(15, 'Hungarian', 'hu', 'hu', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(16, 'Vietnamese', 'vi', 'vi', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(17, 'Haitian', 'ht', 'ht', 0, 'no', 'no', '2021-01-23 07:09:32', '0000-00-00'),
(18, 'Galician', 'gl', 'gl', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(19, 'Dutch', 'nl', 'nl', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(21, 'Greek', 'el', 'gr', 0, 'no', 'no', '2019-11-20 12:12:08', '0000-00-00'),
(22, 'Georgian', 'ka', 'ge', 0, 'no', 'no', '2019-11-20 12:11:40', '0000-00-00'),
(23, 'Gujarati', 'gu', 'in', 0, 'no', 'no', '2019-11-20 11:39:16', '0000-00-00'),
(24, 'Danish', 'da', 'dk', 0, 'no', 'no', '2019-11-20 12:03:25', '0000-00-00'),
(25, 'Hebrew', 'he', 'il', 0, 'no', 'no', '2019-11-20 12:13:50', '0000-00-00'),
(26, 'Yiddish', 'yi', 'il', 0, 'no', 'no', '2019-11-20 12:25:33', '0000-00-00'),
(27, 'Indonesian', 'id', 'id', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(28, 'Irish', 'ga', 'ga', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(29, 'Italian', 'it', 'it', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(30, 'Icelandic', 'is', 'is', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(31, 'Spanish', 'es', 'es', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(33, 'Kannada', 'kn', 'kn', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(34, 'Catalan', 'ca', 'ca', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(36, 'Chinese', 'zh', 'cn', 0, 'no', 'no', '2019-11-20 12:01:48', '0000-00-00'),
(37, 'Korean', 'ko', 'kr', 0, 'no', 'no', '2019-11-20 12:19:09', '0000-00-00'),
(38, 'Xhosa', 'xh', 'ls', 0, 'no', 'no', '2019-11-20 12:24:39', '0000-00-00'),
(39, 'Latin', 'la', 'it', 0, 'no', 'no', '2021-01-23 07:09:32', '0000-00-00'),
(40, 'Latvian', 'lv', 'lv', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(41, 'Lithuanian', 'lt', 'lt', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(43, 'Malagasy', 'mg', 'mg', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(44, 'Malay', 'ms', 'ms', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(45, 'Malayalam', 'ml', 'ml', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(46, 'Maltese', 'mt', 'mt', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(47, 'Macedonian', 'mk', 'mk', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(48, 'Maori', 'mi', 'nz', 0, 'no', 'no', '2019-11-20 12:20:27', '0000-00-00'),
(49, 'Marathi', 'mr', 'in', 0, 'no', 'no', '2019-11-20 11:39:51', '0000-00-00'),
(51, 'Mongolian', 'mn', 'mn', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(52, 'German', 'de', 'de', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(53, 'Nepali', 'ne', 'ne', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(54, 'Norwegian', 'no', 'no', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(55, 'Punjabi', 'pa', 'in', 0, 'no', 'no', '2019-11-20 11:40:16', '0000-00-00'),
(57, 'Persian', 'fa', 'ir', 0, 'no', 'no', '2019-11-20 12:21:17', '0000-00-00'),
(59, 'Portuguese', 'pt', 'pt', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(60, 'Romanian', 'ro', 'ro', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(61, 'Russian', 'ru', 'ru', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(62, 'Cebuano', 'ceb', 'ph', 0, 'no', 'no', '2019-11-20 11:59:12', '0000-00-00'),
(64, 'Sinhala', 'si', 'lk ', 0, 'no', 'no', '2021-01-23 07:09:32', '0000-00-00'),
(65, 'Slovakian', 'sk', 'sk', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(66, 'Slovenian', 'sl', 'sl', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(67, 'Swahili', 'sw', 'ke', 0, 'no', 'no', '2019-11-20 12:21:57', '0000-00-00'),
(68, 'Sundanese', 'su', 'sd', 0, 'no', 'no', '2019-12-03 11:06:57', '0000-00-00'),
(70, 'Thai', 'th', 'th', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(71, 'Tagalog', 'tl', 'tl', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(72, 'Tamil', 'ta', 'in', 0, 'no', 'no', '2019-11-20 11:40:53', '0000-00-00'),
(74, 'Telugu', 'te', 'in', 0, 'no', 'no', '2019-11-20 11:41:15', '0000-00-00'),
(75, 'Turkish', 'tr', 'tr', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(77, 'Uzbek', 'uz', 'uz', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(79, 'Urdu', 'ur', 'pk', 0, 'no', 'no', '2019-11-20 12:23:57', '0000-00-00'),
(80, 'Finnish', 'fi', 'fi', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(81, 'French', 'fr', 'fr', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(82, 'Hindi', 'hi', 'in', 0, 'no', 'no', '2019-11-20 11:36:34', '0000-00-00'),
(84, 'Czech', 'cs', 'cz', 0, 'no', 'no', '2019-11-20 12:02:36', '0000-00-00'),
(85, 'Swedish', 'sv', 'sv', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(86, 'Scottish', 'gd', 'gd', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(87, 'Estonian', 'et', 'et', 0, 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(88, 'Esperanto', 'eo', 'br', 0, 'no', 'no', '2019-11-21 04:49:18', '0000-00-00'),
(89, 'Javanese', 'jv', 'id', 0, 'no', 'no', '2019-11-20 12:18:29', '0000-00-00'),
(90, 'Japanese', 'ja', 'jp', 0, 'no', 'no', '2019-11-20 12:14:39', '0000-00-00'),
(91, 'Polish', 'pl', 'pl', 0, 'no', 'no', '2020-06-15 03:25:27', '0000-00-00'),
(92, 'Kurdish', 'ku', 'iq', 0, 'no', 'no', '2020-12-21 00:15:31', '0000-00-00'),
(93, 'Lao', 'lo', 'la', 0, 'no', 'no', '2020-12-21 00:15:36', '0000-00-00'),
(94, 'Croatia', 'hr', 'hr', 0, 'no', 'no', '2022-06-07 11:48:21', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `subject_group_subject_id` int(11) NOT NULL,
  `subject_group_class_sections_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson_plan_forum`
--

CREATE TABLE `lesson_plan_forum` (
  `id` int(11) NOT NULL,
  `subject_syllabus_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL COMMENT 'staff,student',
  `staff_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `libarary_members`
--

CREATE TABLE `libarary_members` (
  `id` int(11) NOT NULL,
  `library_card_no` varchar(50) DEFAULT NULL,
  `member_type` varchar(50) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `record_id` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `agent` varchar(50) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES
(1, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.70.96', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 10:28:42', NULL),
(2, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.70.68', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 10:29:24', NULL),
(3, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.70.96', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 10:30:08', NULL),
(4, 'Record updated On settings id 1', '1', 1, 'Update', '102.91.5.135', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 10:31:04', NULL),
(5, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.70.96', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 10:31:18', NULL),
(6, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.70.96', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 10:31:25', NULL),
(7, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.70.96', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 10:31:31', NULL),
(8, 'Record updated On settings id 1', '1', 1, 'Update', '102.91.5.29', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 10:34:50', NULL),
(9, 'New Record inserted On course category id 1', '1', 1, 'Insert', '197.210.70.96', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 11:44:48', NULL),
(10, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.70.96', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 11:52:30', NULL),
(11, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.70.96', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 11:53:46', NULL),
(12, 'Record updated On staff id 1', '1', 1, 'Update', '102.91.5.87', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 11:56:42', NULL),
(13, 'Record updated On staff id 1', '1', 1, 'Update', '102.91.5.87', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 11:56:42', NULL),
(14, 'New Record inserted On course category id 2', '2', 1, 'Insert', '197.210.70.96', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 11:57:07', NULL),
(15, 'Record updated On staff id 1', '1', 1, 'Update', '102.91.5.87', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 13:33:03', NULL),
(16, 'Record updated On staff id 1', '1', 1, 'Update', '102.91.5.87', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 13:33:03', NULL),
(17, 'Record updated On staff id 1', '1', 1, 'Update', '102.91.5.29', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 13:33:37', NULL),
(18, 'Record updated On staff id 1', '1', 1, 'Update', '102.91.5.29', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 13:33:37', NULL),
(19, 'Record updated On staff id 1', '1', 1, 'Update', '197.210.70.68', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 15:18:01', NULL),
(20, 'Record updated On staff id 1', '1', 1, 'Update', '197.210.70.68', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 15:18:01', NULL),
(21, 'Record updated On settings id 1', '1', 1, 'Update', '102.91.5.87', 'Windows 10', 'Firefox 114.0', '2023-06-21 15:19:15', NULL),
(22, 'Record updated On settings id 1', '1', 1, 'Update', '102.91.5.87', 'Windows 10', 'Firefox 114.0', '2023-06-21 15:19:33', NULL),
(23, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.70.82', 'Windows 10', 'Firefox 114.0', '2023-06-21 15:20:11', NULL),
(24, 'Record updated On settings id 1', '1', 1, 'Update', '102.91.5.29', 'Windows 10', 'Firefox 114.0', '2023-06-21 15:20:25', NULL),
(25, 'Record updated On settings id 1', '1', 1, 'Update', '102.91.5.29', 'Windows 10', 'Firefox 114.0', '2023-06-21 15:20:39', NULL),
(26, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.71.172', 'Windows 10', 'Firefox 114.0', '2023-06-21 15:33:13', NULL),
(27, 'Record updated On settings id 1', '1', 1, 'Update', '102.91.5.135', 'Windows 10', 'Firefox 114.0', '2023-06-21 15:33:31', NULL),
(28, 'Record updated On settings id 1', '1', 1, 'Update', '102.91.5.135', 'Windows 10', 'Firefox 114.0', '2023-06-21 15:35:58', NULL),
(29, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.71.172', 'Windows 10', 'Firefox 114.0', '2023-06-21 15:37:42', NULL),
(30, 'New Record inserted On sections id 1', '1', 1, 'Insert', '197.210.71.109', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 22:33:45', NULL),
(31, 'New Record inserted On sections id 2', '2', 1, 'Insert', '197.210.71.109', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 22:33:55', NULL),
(32, 'New Record inserted On subject groups id 1', '1', 1, 'Insert', '197.210.71.109', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 22:34:10', NULL),
(33, 'New Record inserted On subject groups id 2', '2', 1, 'Insert', '102.91.5.87', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 22:34:19', NULL),
(34, 'Record updated On settings id 1', '1', 1, 'Update', '102.91.5.87', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 22:39:47', NULL),
(35, 'New Record inserted On students id 1', '1', 1, 'Insert', '102.91.5.87', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 22:39:47', NULL),
(36, 'New Record inserted On  student session id 1', '1', 1, 'Insert', '102.91.5.87', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 22:39:47', NULL),
(37, 'New Record inserted On users id 1', '1', 1, 'Insert', '102.91.5.87', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 22:39:47', NULL),
(38, 'New Record inserted On users id 2', '2', 1, 'Insert', '102.91.5.87', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 22:39:47', NULL),
(39, 'Record updated On students id 1', '1', 1, 'Update', '102.91.5.87', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 22:39:47', NULL),
(40, 'Record updated On notification setting id 1', '1', 1, 'Update', '102.91.5.87', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 22:45:55', NULL),
(41, 'Record updated On settings id 1', '1', 1, 'Update', '102.91.5.135', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 22:49:25', NULL),
(42, 'Record updated On  online_admission_fields id 8', '8', 1, 'Update', '197.210.71.200', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 22:49:39', NULL),
(43, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.70.68', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 22:59:01', NULL),
(44, 'Record updated On staff id 2', '2', 1, 'Update', '197.210.70.68', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 22:59:01', NULL),
(45, 'New Record inserted On class teacher id 1', '1', 1, 'Insert', '197.210.71.109', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 23:07:17', NULL),
(46, 'New Record inserted On  student session id 2', '2', 1, 'Insert', '102.91.5.87', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 23:09:11', NULL),
(47, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.71.73', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 23:39:45', NULL),
(48, 'New Record inserted On class teacher id 2', '2', 1, 'Insert', '197.210.71.200', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 23:40:32', NULL),
(49, 'New Record inserted On subjects id 1', '1', 1, 'Insert', '197.210.71.73', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 23:41:54', NULL),
(50, 'New Record inserted On subjects id 2', '2', 1, 'Insert', '197.210.71.109', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 23:44:33', NULL),
(51, 'New Record inserted On subjects id 3', '3', 1, 'Insert', '197.210.71.109', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 23:44:41', NULL),
(52, 'New Record inserted On subjects id 4', '4', 1, 'Insert', '102.91.5.87', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-21 23:45:05', NULL),
(53, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.52.113', 'Windows 10', 'Firefox 114.0', '2023-06-23 14:37:35', NULL),
(54, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.76.76', 'Windows 10', 'Firefox 114.0', '2023-06-23 14:38:22', NULL),
(55, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.76.76', 'Windows 10', 'Firefox 114.0', '2023-06-23 14:39:10', NULL),
(56, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.76.76', 'Windows 10', 'Firefox 114.0', '2023-06-23 14:40:19', NULL),
(57, 'New Record inserted On gmeet id 1', '1', 1, 'Insert', '197.210.76.213', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-23 21:38:53', NULL),
(58, 'New Record inserted On gmeet id 2', '2', 1, 'Insert', '197.210.76.213', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-23 21:39:22', NULL),
(59, 'Record updated On gmeet id 1', '1', 1, 'Update', '197.210.52.185', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-23 21:39:51', NULL),
(60, 'Record updated On gmeet id 1', '1', 1, 'Update', '197.210.52.185', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-23 21:39:56', NULL),
(61, 'Record updated On gmeet id 1', '1', 1, 'Update', '197.210.52.185', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-23 21:41:45', NULL),
(62, 'Record updated On notification setting id 1', '1', 1, 'Update', '102.91.5.61', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:03:26', NULL),
(63, 'Record updated On notification setting id 1', '1', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(64, 'Record updated On notification setting id 2', '2', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(65, 'Record updated On notification setting id 3', '3', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(66, 'Record updated On notification setting id 4', '4', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(67, 'Record updated On notification setting id 6', '6', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(68, 'Record updated On notification setting id 7', '7', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(69, 'Record updated On notification setting id 8', '8', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(70, 'Record updated On notification setting id 9', '9', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(71, 'Record updated On notification setting id 10', '10', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(72, 'Record updated On notification setting id 11', '11', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(73, 'Record updated On notification setting id 12', '12', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(74, 'Record updated On notification setting id 13', '13', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(75, 'Record updated On notification setting id 14', '14', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(76, 'Record updated On notification setting id 15', '15', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(77, 'Record updated On notification setting id 16', '16', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(78, 'Record updated On notification setting id 17', '17', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(79, 'Record updated On notification setting id 18', '18', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(80, 'Record updated On notification setting id 19', '19', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(81, 'Record updated On notification setting id 20', '20', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(82, 'Record updated On notification setting id 21', '21', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(83, 'Record updated On notification setting id 22', '22', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(84, 'Record updated On notification setting id 23', '23', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(85, 'Record updated On notification setting id 24', '24', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(86, 'Record updated On notification setting id 25', '25', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(87, 'Record updated On notification setting id 26', '26', 1, 'Update', '197.210.71.98', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:04:30', NULL),
(88, 'Record updated On  permission student id 19', '19', 1, 'Update', '102.91.5.61', 'Linux', 'Chrome 114.0.0.0', '2023-06-25 09:12:38', NULL),
(89, 'New Record inserted On custom fields id 1', '1', 1, 'Insert', '102.91.5.61', 'Android', 'Chrome 114.0.0.0', '2023-06-25 09:19:11', NULL),
(90, 'Record updated On settings id 1', '1', 1, 'Update', '102.91.5.61', 'Android', 'Chrome 114.0.0.0', '2023-06-25 09:20:54', NULL),
(91, 'Record updated On settings id 1', '1', 1, 'Update', '102.91.5.207', 'Android', 'Chrome 114.0.0.0', '2023-06-25 10:22:04', NULL),
(92, 'Record updated On settings id 1', '1', 1, 'Update', '102.91.4.10', 'Android', 'Chrome 114.0.0.0', '2023-06-25 10:22:26', NULL),
(93, 'Record updated On staff id 1', '1', 1, 'Update', '102.91.4.10', 'Android', 'Chrome 114.0.0.0', '2023-06-25 10:25:44', NULL),
(94, 'Record updated On staff id 1', '1', 1, 'Update', '102.91.4.10', 'Android', 'Chrome 114.0.0.0', '2023-06-25 10:25:44', NULL),
(95, 'New Record inserted On students id 2', '2', 1, 'Insert', '197.210.77.76', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-28 23:13:42', NULL),
(96, 'New Record inserted On  student session id 3', '3', 1, 'Insert', '197.210.77.76', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-28 23:13:42', NULL),
(97, 'New Record inserted On users id 3', '3', 1, 'Insert', '197.210.77.76', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-28 23:13:42', NULL),
(98, 'New Record inserted On users id 4', '4', 1, 'Insert', '197.210.77.76', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-28 23:13:42', NULL),
(99, 'Record updated On students id 2', '2', 1, 'Update', '197.210.77.76', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-28 23:13:42', NULL),
(100, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.53.110', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-28 23:30:44', NULL),
(101, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.52.214', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-28 23:46:21', NULL),
(102, 'Record updated On staff id 1', '1', 1, 'Update', '197.210.76.178', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-28 23:52:46', NULL),
(103, 'Record updated On staff id 1', '1', 1, 'Update', '197.210.76.178', 'Windows 10', 'Chrome 114.0.0.0', '2023-06-28 23:52:46', NULL),
(104, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.52.214', 'Windows 10', 'Firefox 114.0', '2023-06-29 00:01:16', NULL),
(105, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.76.112', 'Windows 10', 'Firefox 114.0', '2023-06-29 00:01:28', NULL),
(106, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.77.76', 'Windows 10', 'Firefox 114.0', '2023-06-29 00:01:40', NULL),
(107, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.53.110', 'Windows 10', 'Firefox 114.0', '2023-06-29 00:01:55', NULL),
(108, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.77.76', 'Windows 10', 'Firefox 114.0', '2023-06-29 00:02:42', NULL),
(109, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.52.214', 'Windows 10', 'Firefox 114.0', '2023-06-29 00:03:01', NULL),
(110, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.76.239', 'Windows 10', 'Firefox 114.0', '2023-06-29 00:03:27', NULL),
(111, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.53.110', 'Windows 10', 'Firefox 114.0', '2023-06-29 00:06:52', NULL),
(112, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.76.112', 'Windows 10', 'Firefox 114.0', '2023-06-29 00:07:05', NULL),
(113, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.77.76', 'Windows 10', 'Firefox 114.0', '2023-06-29 00:07:18', NULL),
(114, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.77.76', 'Windows 10', 'Firefox 114.0', '2023-06-29 00:09:28', NULL),
(115, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.76.112', 'Windows 10', 'Firefox 114.0', '2023-06-29 00:09:58', NULL),
(116, 'New Record inserted On students id 3', '3', 1, 'Insert', '111.88.84.32', 'Windows 10', 'Chrome 114.0.0.0', '2023-07-03 23:33:45', NULL),
(117, 'New Record inserted On  student session id 4', '4', 1, 'Insert', '111.88.84.32', 'Windows 10', 'Chrome 114.0.0.0', '2023-07-03 23:33:45', NULL),
(118, 'New Record inserted On users id 5', '5', 1, 'Insert', '111.88.84.32', 'Windows 10', 'Chrome 114.0.0.0', '2023-07-03 23:33:45', NULL),
(119, 'New Record inserted On users id 6', '6', 1, 'Insert', '111.88.84.32', 'Windows 10', 'Chrome 114.0.0.0', '2023-07-03 23:33:45', NULL),
(120, 'Record updated On students id 3', '3', 1, 'Update', '111.88.84.32', 'Windows 10', 'Chrome 114.0.0.0', '2023-07-03 23:33:45', NULL),
(121, 'Record updated On staff id 1', '1', 1, 'Update', '124.29.208.93', 'Windows 10', 'Firefox 114.0', '2023-07-04 09:15:49', NULL),
(122, 'Record updated On staff id 1', '1', 1, 'Update', '124.29.208.93', 'Windows 10', 'Firefox 114.0', '2023-07-04 09:15:54', NULL),
(123, 'Record updated On  online_admission_fields id 41', '41', 1, 'Update', '124.29.208.93', 'Windows 10', 'Firefox 114.0', '2023-07-04 09:28:12', NULL),
(124, 'Record updated On  online_admission_fields id 41', '41', 1, 'Update', '124.29.208.93', 'Windows 10', 'Firefox 114.0', '2023-07-04 09:28:31', NULL),
(125, 'Record updated On staff id 1', '1', 1, 'Update', '119.73.97.132', 'Windows 10', 'Chrome 114.0.0.0', '2023-07-04 22:39:51', NULL),
(126, 'Record updated On staff id 1', '1', 1, 'Update', '119.73.97.132', 'Windows 10', 'Chrome 114.0.0.0', '2023-07-04 22:39:54', NULL),
(127, 'New Record inserted On id card id 3', '3', 1, 'Insert', '119.73.97.132', 'Windows 10', 'Chrome 114.0.0.0', '2023-07-04 22:44:04', NULL),
(128, 'Record deleted On id card id 3', '3', 1, 'Delete', '119.73.97.132', 'Windows 10', 'Chrome 114.0.0.0', '2023-07-04 22:44:39', NULL),
(129, 'Record deleted On id card id 1', '1', 1, 'Delete', '119.73.97.132', 'Windows 10', 'Chrome 114.0.0.0', '2023-07-04 22:44:42', NULL),
(130, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-14 09:57:55', NULL),
(131, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-14 17:14:11', NULL),
(132, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-14 17:14:15', NULL),
(133, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-14 17:14:18', NULL),
(134, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-14 17:15:21', NULL),
(135, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-14 17:15:41', NULL),
(136, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-14 17:16:08', NULL),
(137, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-14 17:16:10', NULL),
(138, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-14 17:16:32', NULL),
(139, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-14 17:16:35', NULL),
(140, 'New Record inserted On users id 7', '7', 1, 'Insert', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 08:43:17', NULL),
(141, 'New Record inserted On users id 8', '8', 1, 'Insert', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 08:43:17', NULL),
(142, 'Record updated On students id 4', '4', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 08:43:17', NULL),
(143, 'Record updated On  online admissions id 23', '23', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 08:43:17', NULL),
(144, 'Record updated On  online admissions id 23', '23', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 08:43:21', NULL),
(145, 'Record updated On  online admissions id 22', '22', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 08:44:54', NULL),
(146, 'New Record inserted On users id 9', '9', 1, 'Insert', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 08:45:05', NULL),
(147, 'New Record inserted On users id 10', '10', 1, 'Insert', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 08:45:05', NULL),
(148, 'Record updated On students id 5', '5', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 08:45:05', NULL),
(149, 'Record updated On  online admissions id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 08:45:05', NULL),
(150, 'New Record inserted On users id 11', '11', 1, 'Insert', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 08:45:21', NULL),
(151, 'New Record inserted On users id 12', '12', 1, 'Insert', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 08:45:21', NULL),
(152, 'Record updated On students id 6', '6', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 08:45:21', NULL),
(153, 'Record updated On  online admissions id 24', '24', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 08:45:21', NULL),
(154, 'Record updated On  online admissions id 25', '25', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 09:30:33', NULL),
(155, 'New Record inserted On users id 13', '13', 1, 'Insert', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 09:30:47', NULL),
(156, 'New Record inserted On users id 14', '14', 1, 'Insert', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 09:30:47', NULL),
(157, 'Record updated On students id 7', '7', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 09:30:47', NULL),
(158, 'Record updated On  online admissions id 25', '25', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 09:30:47', NULL),
(159, 'New Record inserted On users id 15', '15', 1, 'Insert', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 10:34:46', NULL),
(160, 'New Record inserted On users id 16', '16', 1, 'Insert', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 10:34:46', NULL),
(161, 'Record updated On students id 8', '8', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 10:34:46', NULL),
(162, 'Record updated On  online admissions id 26', '26', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 10:34:46', NULL),
(163, 'Record updated On students id 8', '8', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 10:34:46', NULL),
(164, 'Record updated On  online admissions id 27', '27', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 10:42:03', NULL),
(165, 'New Record inserted On users id 17', '17', 1, 'Insert', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 10:42:12', NULL),
(166, 'New Record inserted On users id 18', '18', 1, 'Insert', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 10:42:12', NULL),
(167, 'Record updated On students id 9', '9', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 10:42:12', NULL),
(168, 'Record updated On  online admissions id 27', '27', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-09-18 10:42:12', NULL),
(169, 'Record updated On roles id 2', '2', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-10-05 01:13:12', NULL),
(170, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-10-12 08:33:56', NULL),
(171, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-10-12 08:36:15', NULL),
(172, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-10-12 08:36:27', NULL),
(173, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 117.0.0.0', '2023-10-12 08:36:27', NULL),
(174, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-11-27 12:10:17', NULL),
(175, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-11-27 12:10:33', NULL),
(176, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-11-27 12:10:53', NULL),
(177, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-11-27 12:13:06', NULL),
(178, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-11-27 12:14:49', NULL),
(179, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-11-27 13:01:07', NULL),
(180, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-11-27 20:26:38', NULL),
(181, 'Record updated On settings id 1', '1', 1, 'Update', '105.112.213.0', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-02 23:46:11', NULL),
(182, 'Record updated On settings id 1', '1', 1, 'Update', '105.112.213.0', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-02 23:47:03', NULL),
(183, 'New Record inserted On subjects id 5', '5', 1, 'Insert', '105.112.213.0', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-02 23:48:13', NULL),
(184, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.77.19', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-03 13:46:50', NULL),
(185, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.52.74', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-03 14:03:13', NULL),
(186, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.52.74', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-03 14:04:21', NULL),
(187, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.77.19', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-03 14:13:32', NULL),
(188, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.77.19', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-03 14:13:37', NULL),
(189, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.77.19', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-03 14:13:50', NULL),
(190, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.77.19', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-03 14:13:55', NULL),
(191, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.77.19', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-03 14:14:02', NULL),
(192, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.77.19', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-03 14:14:06', NULL),
(193, 'Record updated On  online_admission_fields id 38', '38', 1, 'Update', '197.210.77.19', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-03 14:14:27', NULL),
(194, 'Record updated On settings id 1', '1', 1, 'Update', '197.210.77.19', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-03 14:14:27', NULL),
(195, 'Record updated On  online_admission_fields id 1', '1', 1, 'Update', '197.210.77.19', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-03 14:14:52', NULL),
(196, 'Record updated On  online_admission_fields id 4', '4', 1, 'Update', '197.210.77.19', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-03 14:14:59', NULL),
(197, 'Record updated On  online_admission_fields id 9', '9', 1, 'Update', '197.210.77.19', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-03 14:15:08', NULL),
(198, 'Record updated On  online_admission_fields id 10', '10', 1, 'Update', '197.210.77.19', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-03 14:15:14', NULL),
(199, 'Record updated On  online_admission_fields id 11', '11', 1, 'Update', '197.210.77.19', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-03 14:15:19', NULL),
(200, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-03 22:47:56', NULL),
(201, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-03 22:48:12', NULL),
(202, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-03 22:48:23', NULL),
(203, 'Record updated On staff id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-04 13:22:55', NULL),
(204, 'Record updated On staff id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-04 13:22:55', NULL),
(205, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-04 13:24:19', NULL),
(206, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-04 13:26:10', NULL),
(207, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-04 13:27:57', NULL),
(208, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-04 13:39:42', NULL),
(209, 'New Record inserted On class teacher id 3', '3', 1, 'Insert', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-04 14:09:17', NULL),
(210, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-04 14:52:30', NULL),
(211, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-05 01:38:04', NULL),
(212, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-05 01:38:23', NULL),
(213, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-05 01:39:30', NULL),
(214, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-05 01:43:39', NULL),
(215, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-05 01:44:11', NULL),
(216, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-05 13:10:22', NULL),
(217, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-05 13:17:12', NULL),
(218, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-05 13:38:43', NULL),
(219, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-05 13:39:18', NULL),
(220, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-05 13:39:27', NULL),
(221, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-05 13:42:39', NULL),
(222, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-05 14:21:23', NULL),
(223, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-05 14:21:43', NULL),
(224, 'New Record inserted On online courses id 1', '1', 1, 'Insert', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-06 01:52:18', NULL),
(225, 'New Record inserted On online course class sections id 1', '1', 1, 'Insert', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-06 01:52:18', NULL),
(226, 'Record updated On online c1ourses id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-06 01:52:18', NULL),
(227, 'New Record inserted On online courses id 2', '2', 1, 'Insert', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-06 01:54:11', NULL),
(228, 'New Record inserted On online course class sections id 2', '2', 1, 'Insert', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-06 01:54:11', NULL),
(229, 'Record updated On online c1ourses id 2', '2', 1, 'Update', '::1', 'Windows 10', 'Chrome 119.0.0.0', '2023-12-06 01:54:11', NULL),
(230, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 11:17:36', NULL),
(231, 'Record updated On online c1ourses id 2', '2', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 11:23:15', NULL),
(232, 'New Record inserted On online course section id 1', '1', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 11:23:54', NULL),
(233, 'Record updated On online c1ourses id 2', '2', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 11:23:54', NULL),
(234, 'New Record inserted On online course lesson id 1', '1', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 11:26:12', NULL),
(235, 'New Record inserted On lesson quiz id 1', '1', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 11:26:12', NULL),
(236, 'Record updated On online c1ourses id 2', '2', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 11:26:12', NULL),
(237, 'Record updated On  online course lesson id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 11:26:12', NULL),
(238, 'Record updated On  online course lesson id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 11:26:12', NULL),
(239, 'Record updated On online c1ourses id 2', '2', 0, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 11:26:40', NULL),
(240, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 11:30:34', NULL),
(241, 'Record updated On staff id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 11:41:54', NULL),
(242, 'Record updated On staff id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 11:42:36', NULL),
(243, 'Record updated On staff id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 11:42:36', NULL),
(244, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 22:41:42', NULL),
(245, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 22:43:51', NULL),
(246, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 23:21:47', NULL),
(247, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 23:28:51', NULL),
(248, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 23:36:25', NULL),
(249, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 23:38:19', NULL),
(250, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 23:49:08', NULL),
(251, 'New Record inserted On students id 10', '10', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 23:58:45', NULL),
(252, 'New Record inserted On  student session id 11', '11', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 23:58:45', NULL),
(253, 'New Record inserted On users id 19', '19', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 23:58:45', NULL),
(254, 'New Record inserted On users id 20', '20', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 23:58:45', NULL),
(255, 'Record updated On students id 10', '10', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-06 23:58:45', NULL),
(256, 'New Record inserted On students id 11', '11', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-07 00:04:02', NULL),
(257, 'New Record inserted On  student session id 12', '12', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-07 00:04:03', NULL),
(258, 'New Record inserted On users id 21', '21', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-07 00:04:03', NULL),
(259, 'New Record inserted On users id 22', '22', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-07 00:04:03', NULL),
(260, 'Record updated On students id 11', '11', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-07 00:04:03', NULL),
(261, 'New Record inserted On students id 12', '12', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-07 00:08:12', NULL),
(262, 'New Record inserted On  student session id 13', '13', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-07 00:08:12', NULL),
(263, 'New Record inserted On users id 23', '23', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-07 00:08:12', NULL),
(264, 'New Record inserted On users id 24', '24', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-07 00:08:12', NULL),
(265, 'Record updated On students id 12', '12', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-07 00:08:12', NULL),
(266, 'New Record inserted On online courses id 3', '3', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-07 13:42:40', NULL),
(267, 'New Record inserted On online course class sections id 3', '3', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-07 13:42:40', NULL),
(268, 'Record updated On online c1ourses id 3', '3', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-07 13:42:40', NULL),
(269, 'New Record inserted On online course section id 2', '2', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-07 13:42:58', NULL),
(270, 'Record updated On online c1ourses id 3', '3', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-07 13:42:58', NULL),
(271, 'Record updated On online c1ourses id 3', '3', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-07 13:43:04', NULL),
(272, 'Record updated On online c1ourses id 3', '3', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-07 13:43:41', NULL),
(273, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-13 12:50:10', NULL),
(274, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-13 12:50:33', NULL),
(275, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-13 12:50:49', NULL),
(276, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-13 12:52:59', NULL),
(277, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-14 12:27:08', NULL),
(278, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-14 12:27:38', NULL),
(279, 'Record updated On online c1ourses id 3', '3', 0, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-15 12:37:27', NULL),
(280, 'New Record inserted On online courses id 4', '4', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-19 13:20:58', NULL),
(281, 'New Record inserted On online course class sections id 4', '4', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-19 13:20:58', NULL),
(282, 'Record updated On online c1ourses id 4', '4', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-19 13:20:58', NULL),
(283, 'Record updated On online c1ourses id 4', '4', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-19 13:21:19', NULL),
(284, 'Record updated On online c1ourses id 4', '4', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-19 13:21:58', NULL),
(285, 'New Record inserted On online course section id 3', '3', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-19 13:22:37', NULL),
(286, 'Record updated On online c1ourses id 4', '4', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-19 13:22:37', NULL),
(287, 'New Record inserted On online course lesson id 2', '2', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-20 13:53:26', NULL),
(288, 'New Record inserted On lesson quiz id 2', '2', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-20 13:53:26', NULL),
(289, 'Record updated On online c1ourses id 4', '4', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-20 13:53:26', NULL),
(290, 'New Record inserted On online course lesson id 3', '3', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-20 14:06:29', NULL),
(291, 'New Record inserted On lesson quiz id 3', '3', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-20 14:06:29', NULL),
(292, 'Record updated On online c1ourses id 4', '4', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-20 14:06:29', NULL),
(293, 'New Record inserted On online course lesson id 4', '4', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-20 14:15:09', NULL),
(294, 'New Record inserted On lesson quiz id 4', '4', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-20 14:15:09', NULL),
(295, 'Record updated On online c1ourses id 4', '4', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-20 14:15:09', NULL),
(296, 'New Record inserted On online course lesson id 5', '5', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-20 14:20:35', NULL),
(297, 'New Record inserted On lesson quiz id 5', '5', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-20 14:20:35', NULL),
(298, 'Record updated On online c1ourses id 4', '4', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-20 14:20:35', NULL),
(299, 'Record updated On  online course lesson id 5', '5', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-20 14:20:35', NULL),
(300, 'Record updated On  online course lesson id 5', '5', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-20 14:20:35', NULL),
(301, 'Record deleted On online course lesson quiz id 2', '2', 1, 'Delete', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-20 14:20:58', NULL),
(302, 'Record deleted On online course lesson id 2', '2', 1, 'Delete', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-20 14:20:58', NULL),
(303, 'New Record inserted On online course lesson id 7', '7', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-21 13:55:18', NULL),
(304, 'New Record inserted On lesson quiz id 6', '6', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-21 13:55:18', NULL),
(305, 'Record updated On online c1ourses id 4', '4', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-21 13:55:18', NULL),
(306, 'Record updated On  online course lesson id 7', '7', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-21 13:55:18', NULL),
(307, 'Record updated On  online course lesson id 7', '7', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-21 13:55:18', NULL),
(308, 'New Record inserted On students id 13', '13', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-27 12:01:00', NULL),
(309, 'New Record inserted On  student session id 14', '14', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-27 12:01:00', NULL),
(310, 'New Record inserted On users id 25', '25', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-27 12:01:00', NULL),
(311, 'New Record inserted On users id 26', '26', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-27 12:01:00', NULL),
(312, 'Record updated On students id 13', '13', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-27 12:01:00', NULL),
(313, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-27 12:50:16', NULL),
(314, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2023-12-27 12:50:45', NULL),
(315, 'New Record inserted On disable reason id 1', '1', 1, 'Insert', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2024-01-11 13:04:52', NULL),
(316, 'Record updated On students id 13', '13', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2024-01-11 13:05:32', NULL),
(317, 'Record updated On users id 25', '25', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2024-01-11 13:06:58', NULL),
(318, 'Record updated On students id 13', '13', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2024-01-11 13:07:28', NULL),
(319, 'Record updated On users id 25', '25', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2024-01-11 13:07:57', NULL),
(320, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 120.0.0.0', '2024-01-16 13:38:19', NULL),
(321, 'Record updated On  certificates id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 121.0.0.0', '2024-02-22 12:21:31', NULL),
(322, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 121.0.0.0', '2024-02-23 12:40:54', NULL),
(323, 'New Record inserted On students id 14', '14', 1, 'Insert', '::1', 'Windows 10', 'Chrome 121.0.0.0', '2024-02-25 13:27:14', NULL),
(324, 'New Record inserted On  student session id 15', '15', 1, 'Insert', '::1', 'Windows 10', 'Chrome 121.0.0.0', '2024-02-25 13:27:14', NULL),
(325, 'New Record inserted On users id 27', '27', 1, 'Insert', '::1', 'Windows 10', 'Chrome 121.0.0.0', '2024-02-25 13:27:14', NULL),
(326, 'New Record inserted On users id 28', '28', 1, 'Insert', '::1', 'Windows 10', 'Chrome 121.0.0.0', '2024-02-25 13:27:14', NULL),
(327, 'Record updated On students id 14', '14', 1, 'Update', '::1', 'Windows 10', 'Chrome 121.0.0.0', '2024-02-25 13:27:14', NULL),
(328, 'New Record inserted On students id 15', '15', 1, 'Insert', '::1', 'Windows 10', 'Chrome 121.0.0.0', '2024-02-26 12:45:02', NULL),
(329, 'New Record inserted On  student session id 16', '16', 1, 'Insert', '::1', 'Windows 10', 'Chrome 121.0.0.0', '2024-02-26 12:45:02', NULL),
(330, 'New Record inserted On users id 29', '29', 1, 'Insert', '::1', 'Windows 10', 'Chrome 121.0.0.0', '2024-02-26 12:45:02', NULL),
(331, 'New Record inserted On users id 30', '30', 1, 'Insert', '::1', 'Windows 10', 'Chrome 121.0.0.0', '2024-02-26 12:45:02', NULL),
(332, 'Record updated On students id 15', '15', 1, 'Update', '::1', 'Windows 10', 'Chrome 121.0.0.0', '2024-02-26 12:45:02', NULL),
(333, 'New Record inserted On students id 16', '16', 1, 'Insert', '::1', 'Windows 10', 'Chrome 121.0.0.0', '2024-02-26 12:46:57', NULL),
(334, 'New Record inserted On  student session id 17', '17', 1, 'Insert', '::1', 'Windows 10', 'Chrome 121.0.0.0', '2024-02-26 12:46:57', NULL),
(335, 'New Record inserted On users id 31', '31', 1, 'Insert', '::1', 'Windows 10', 'Chrome 121.0.0.0', '2024-02-26 12:46:57', NULL),
(336, 'New Record inserted On users id 32', '32', 1, 'Insert', '::1', 'Windows 10', 'Chrome 121.0.0.0', '2024-02-26 12:46:57', NULL),
(337, 'Record updated On students id 16', '16', 1, 'Update', '::1', 'Windows 10', 'Chrome 121.0.0.0', '2024-02-26 12:46:57', NULL),
(338, 'Record updated On settings id 1', '1', 1, 'Update', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-12 13:47:35', NULL),
(339, 'New Record inserted On students id 17', '17', 1, 'Insert', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-13 10:20:48', NULL),
(340, 'New Record inserted On  student session id 18', '18', 1, 'Insert', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-13 10:20:48', NULL),
(341, 'New Record inserted On users id 33', '33', 1, 'Insert', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-13 10:20:48', NULL),
(342, 'New Record inserted On users id 34', '34', 1, 'Insert', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-13 10:20:48', NULL),
(343, 'Record updated On students id 17', '17', 1, 'Update', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-13 10:20:48', NULL),
(344, 'Record updated On settings id 1', '1', 1, 'Update', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-13 13:27:26', NULL),
(345, 'New Record inserted On students id 18', '18', 1, 'Insert', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-13 13:29:35', NULL),
(346, 'New Record inserted On  student session id 19', '19', 1, 'Insert', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-13 13:29:35', NULL),
(347, 'New Record inserted On users id 35', '35', 1, 'Insert', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-13 13:29:35', NULL),
(348, 'New Record inserted On users id 36', '36', 1, 'Insert', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-13 13:29:35', NULL),
(349, 'Record updated On students id 18', '18', 1, 'Update', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-13 13:29:35', NULL),
(350, 'Record updated On settings id 1', '1', 1, 'Update', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-13 13:48:42', NULL),
(351, 'Record updated On settings id 1', '1', 1, 'Update', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-13 13:49:05', NULL),
(352, 'Record updated On settings id 1', '1', 1, 'Update', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-13 13:54:21', NULL),
(353, 'Record updated On students id 14', '14', 1, 'Update', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-14 13:43:21', NULL),
(354, 'Record updated On  student session id 15', '15', 1, 'Update', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-14 13:43:21', NULL),
(355, 'Record updated On students id 14', '14', 1, 'Update', '::1', 'Windows 10', 'Chrome 122.0.0.0', '2024-03-14 21:02:02', NULL),
(356, 'Record updated On  student session id 15', '15', 1, 'Update', '::1', 'Windows 10', 'Chrome 122.0.0.0', '2024-03-14 21:02:02', NULL),
(357, 'New Record inserted On subject groups id 3', '3', 1, 'Insert', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-17 01:24:24', NULL),
(358, 'New Record inserted On students id 19', '19', 1, 'Insert', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-17 01:27:13', NULL),
(359, 'New Record inserted On  student session id 20', '20', 1, 'Insert', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-17 01:27:13', NULL),
(360, 'New Record inserted On users id 37', '37', 1, 'Insert', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-17 01:27:13', NULL),
(361, 'New Record inserted On users id 38', '38', 1, 'Insert', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-17 01:27:13', NULL),
(362, 'Record updated On students id 19', '19', 1, 'Update', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-17 01:27:13', NULL),
(363, 'Record updated On students id 19', '19', 1, 'Update', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-17 01:40:20', NULL),
(364, 'Record updated On  student session id 20', '20', 1, 'Update', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-17 01:40:20', NULL),
(365, 'New Record inserted On class teacher id 4', '4', 1, 'Insert', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-17 02:16:54', NULL),
(366, 'Record updated On settings id 1', '1', 1, 'Update', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-17 02:43:30', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES
(367, 'Record updated On settings id 1', '1', 1, 'Update', '127.0.0.1', 'Windows 10', 'Firefox 123.0', '2024-03-18 10:10:55', NULL),
(368, 'Record updated On settings id 1', '1', 1, 'Update', '185.137.164.15', 'Windows 10', 'Firefox 128.0', '2024-08-01 13:42:00', NULL),
(369, 'Record updated On staff id 1', '1', 1, 'Update', '185.137.164.18', 'Windows 10', 'Firefox 128.0', '2024-08-06 08:59:41', NULL),
(370, 'Record updated On staff id 1', '1', 1, 'Update', '185.137.164.18', 'Windows 10', 'Firefox 128.0', '2024-08-06 08:59:43', NULL),
(371, 'Record updated On settings id 1', '1', 1, 'Update', '185.137.164.21', 'Windows 10', 'Firefox 128.0', '2024-08-06 09:05:42', NULL),
(372, 'Record deleted On subjects id 5', '5', 1, 'Delete', '185.137.164.15', 'Windows 10', 'Firefox 128.0', '2024-08-06 09:22:35', NULL),
(373, 'Record deleted On subjects id 4', '4', 1, 'Delete', '185.137.164.15', 'Windows 10', 'Firefox 128.0', '2024-08-06 09:23:22', NULL),
(374, 'Record deleted On subjects id 2', '2', 1, 'Delete', '185.137.164.13', 'Windows 10', 'Firefox 128.0', '2024-08-06 09:23:38', NULL),
(375, 'Record deleted On subjects id 3', '3', 1, 'Delete', '185.137.164.19', 'Windows 10', 'Firefox 128.0', '2024-08-06 09:23:38', NULL),
(376, 'Record deleted On subjects id 1', '1', 1, 'Delete', '185.137.164.12', 'Windows 10', 'Firefox 128.0', '2024-08-06 09:24:38', NULL),
(377, 'Record updated On staff id 3', '3', 1, 'Update', '98.97.79.19', 'Windows 10', 'Firefox 129.0', '2024-08-06 10:15:39', NULL),
(378, 'New Record inserted On class teacher id 5', '5', 1, 'Insert', '98.97.79.19', 'Windows 10', 'Firefox 129.0', '2024-08-06 11:13:59', NULL),
(379, 'Record updated On staff id 4', '4', 1, 'Update', '98.97.79.19', 'Windows 10', 'Firefox 129.0', '2024-08-06 11:21:55', NULL),
(380, 'New Record inserted On students id 20', '20', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:13:45', NULL),
(381, 'New Record inserted On  student session id 21', '21', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:13:45', NULL),
(382, 'New Record inserted On users id 39', '39', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:13:45', NULL),
(383, 'New Record inserted On users id 40', '40', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:13:45', NULL),
(384, 'Record updated On students id 20', '20', 4, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:13:45', NULL),
(385, 'New Record inserted On subjects id 6', '6', 1, 'Insert', '98.97.79.19', 'Windows 10', 'Firefox 129.0', '2024-08-06 12:34:26', NULL),
(386, 'New Record inserted On students id 21', '21', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:36:04', NULL),
(387, 'New Record inserted On  student session id 22', '22', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:36:04', NULL),
(388, 'New Record inserted On users id 41', '41', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:36:04', NULL),
(389, 'New Record inserted On users id 42', '42', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:36:04', NULL),
(390, 'Record updated On students id 21', '21', 3, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:36:04', NULL),
(391, 'New Record inserted On students id 22', '22', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:38:23', NULL),
(392, 'New Record inserted On  student session id 23', '23', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:38:23', NULL),
(393, 'New Record inserted On users id 43', '43', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:38:23', NULL),
(394, 'New Record inserted On users id 44', '44', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:38:23', NULL),
(395, 'Record updated On students id 22', '22', 3, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:38:23', NULL),
(396, 'New Record inserted On students id 23', '23', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:38:48', NULL),
(397, 'New Record inserted On  student session id 24', '24', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:38:48', NULL),
(398, 'New Record inserted On users id 45', '45', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:38:48', NULL),
(399, 'New Record inserted On users id 46', '46', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:38:48', NULL),
(400, 'Record updated On students id 23', '23', 3, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:38:48', NULL),
(401, 'New Record inserted On students id 24', '24', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:39:04', NULL),
(402, 'New Record inserted On  student session id 25', '25', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:39:04', NULL),
(403, 'New Record inserted On users id 47', '47', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:39:04', NULL),
(404, 'New Record inserted On users id 48', '48', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:39:04', NULL),
(405, 'Record updated On students id 24', '24', 3, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:39:04', NULL),
(406, 'New Record inserted On students id 25', '25', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:40:57', NULL),
(407, 'New Record inserted On  student session id 26', '26', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:40:57', NULL),
(408, 'New Record inserted On users id 49', '49', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:40:57', NULL),
(409, 'New Record inserted On users id 50', '50', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:40:57', NULL),
(410, 'Record updated On students id 25', '25', 4, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:40:57', NULL),
(411, 'New Record inserted On students id 26', '26', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:41:28', NULL),
(412, 'New Record inserted On  student session id 27', '27', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:41:28', NULL),
(413, 'New Record inserted On users id 51', '51', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:41:28', NULL),
(414, 'New Record inserted On users id 52', '52', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:41:28', NULL),
(415, 'Record updated On students id 26', '26', 4, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:41:28', NULL),
(416, 'New Record inserted On students id 27', '27', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:41:43', NULL),
(417, 'New Record inserted On  student session id 28', '28', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:41:43', NULL),
(418, 'New Record inserted On users id 53', '53', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:41:43', NULL),
(419, 'New Record inserted On users id 54', '54', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:41:43', NULL),
(420, 'Record updated On students id 27', '27', 4, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:41:43', NULL),
(421, 'New Record inserted On students id 28', '28', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:01', NULL),
(422, 'New Record inserted On  student session id 29', '29', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:01', NULL),
(423, 'New Record inserted On users id 55', '55', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:01', NULL),
(424, 'New Record inserted On users id 56', '56', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:01', NULL),
(425, 'Record updated On students id 28', '28', 4, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:01', NULL),
(426, 'New Record inserted On students id 29', '29', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:20', NULL),
(427, 'New Record inserted On  student session id 30', '30', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:20', NULL),
(428, 'New Record inserted On users id 57', '57', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:20', NULL),
(429, 'New Record inserted On users id 58', '58', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:20', NULL),
(430, 'Record updated On students id 29', '29', 4, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:20', NULL),
(431, 'New Record inserted On students id 30', '30', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:39', NULL),
(432, 'New Record inserted On  student session id 31', '31', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:39', NULL),
(433, 'New Record inserted On users id 59', '59', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:39', NULL),
(434, 'New Record inserted On users id 60', '60', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:39', NULL),
(435, 'Record updated On students id 30', '30', 4, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:39', NULL),
(436, 'New Record inserted On students id 31', '31', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:57', NULL),
(437, 'New Record inserted On  student session id 32', '32', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:57', NULL),
(438, 'New Record inserted On users id 61', '61', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:57', NULL),
(439, 'New Record inserted On users id 62', '62', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:57', NULL),
(440, 'Record updated On students id 31', '31', 4, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:42:57', NULL),
(441, 'New Record inserted On students id 32', '32', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:43:17', NULL),
(442, 'New Record inserted On  student session id 33', '33', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:43:17', NULL),
(443, 'New Record inserted On users id 63', '63', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:43:17', NULL),
(444, 'New Record inserted On users id 64', '64', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:43:17', NULL),
(445, 'Record updated On students id 32', '32', 4, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:43:17', NULL),
(446, 'New Record inserted On students id 33', '33', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:43:39', NULL),
(447, 'New Record inserted On  student session id 34', '34', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:43:39', NULL),
(448, 'New Record inserted On users id 65', '65', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:43:39', NULL),
(449, 'New Record inserted On users id 66', '66', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:43:39', NULL),
(450, 'Record updated On students id 33', '33', 4, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:43:39', NULL),
(451, 'New Record inserted On students id 34', '34', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:44:06', NULL),
(452, 'New Record inserted On  student session id 35', '35', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:44:06', NULL),
(453, 'New Record inserted On users id 67', '67', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:44:06', NULL),
(454, 'New Record inserted On users id 68', '68', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:44:06', NULL),
(455, 'Record updated On students id 34', '34', 4, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:44:06', NULL),
(456, 'New Record inserted On students id 35', '35', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:44:29', NULL),
(457, 'New Record inserted On  student session id 36', '36', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:44:29', NULL),
(458, 'New Record inserted On users id 69', '69', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:44:29', NULL),
(459, 'New Record inserted On users id 70', '70', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:44:29', NULL),
(460, 'Record updated On students id 35', '35', 4, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:44:29', NULL),
(461, 'New Record inserted On subjects id 7', '7', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:45:47', NULL),
(462, 'New Record inserted On students id 36', '36', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:21', NULL),
(463, 'New Record inserted On  student session id 37', '37', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:21', NULL),
(464, 'New Record inserted On users id 71', '71', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:21', NULL),
(465, 'New Record inserted On users id 72', '72', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:21', NULL),
(466, 'Record updated On students id 36', '36', 4, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:21', NULL),
(467, 'New Record inserted On students id 37', '37', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:24', NULL),
(468, 'New Record inserted On  student session id 38', '38', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:24', NULL),
(469, 'New Record inserted On users id 73', '73', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:24', NULL),
(470, 'New Record inserted On users id 74', '74', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:24', NULL),
(471, 'Record updated On students id 37', '37', 3, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:24', NULL),
(472, 'New Record inserted On students id 38', '38', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:37', NULL),
(473, 'New Record inserted On  student session id 39', '39', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:37', NULL),
(474, 'New Record inserted On users id 75', '75', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:37', NULL),
(475, 'New Record inserted On users id 76', '76', 3, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:37', NULL),
(476, 'Record updated On students id 38', '38', 3, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:37', NULL),
(477, 'New Record inserted On students id 39', '39', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:55', NULL),
(478, 'New Record inserted On  student session id 40', '40', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:55', NULL),
(479, 'New Record inserted On users id 77', '77', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:55', NULL),
(480, 'New Record inserted On users id 78', '78', 4, 'Insert', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:55', NULL),
(481, 'Record updated On students id 39', '39', 4, 'Update', '98.97.79.19', 'Windows 10', 'Chrome 127.0.0.0', '2024-08-06 12:48:55', NULL),
(482, 'New Record inserted On subjects id 8', '8', 1, 'Insert', '197.210.53.130', 'Windows 10', 'Firefox 128.0', '2024-08-06 20:38:07', NULL),
(483, 'Record updated On settings id 1', '1', 1, 'Update', '105.112.220.76', 'Windows 10', 'Firefox 129.0', '2024-08-25 21:43:07', NULL),
(484, 'Record updated On online c1ourses id 4', '4', 0, 'Update', '105.112.220.76', 'Windows 10', 'Chrome 128.0.0.0', '2024-08-25 22:19:17', NULL),
(485, 'Record updated On online c1ourses id 3', '3', 0, 'Update', '105.112.220.76', 'Windows 10', 'Chrome 128.0.0.0', '2024-08-25 22:19:41', NULL),
(486, 'New Record inserted On online courses id 5', '5', 1, 'Insert', '105.112.220.76', 'Windows 10', 'Firefox 129.0', '2024-08-25 22:23:09', NULL),
(487, 'New Record inserted On online course class sections id 5', '5', 1, 'Insert', '105.112.220.76', 'Windows 10', 'Firefox 129.0', '2024-08-25 22:23:09', NULL),
(488, 'New Record inserted On online courses id 6', '6', 1, 'Insert', '105.112.220.76', 'Windows 10', 'Firefox 129.0', '2024-08-25 22:23:40', NULL),
(489, 'New Record inserted On online course class sections id 6', '6', 1, 'Insert', '105.112.220.76', 'Windows 10', 'Firefox 129.0', '2024-08-25 22:23:40', NULL),
(490, 'Record updated On online c1ourses id 6', '6', 1, 'Update', '105.112.220.76', 'Windows 10', 'Firefox 129.0', '2024-08-25 22:24:41', NULL),
(491, 'Record updated On staff id 1', '1', 1, 'Update', '51.235.242.6', 'Windows 10', 'Chrome 128.0.0.0', '2024-09-15 19:27:59', NULL),
(492, 'Record updated On staff id 1', '1', 1, 'Update', '51.235.242.6', 'Windows 10', 'Chrome 128.0.0.0', '2024-09-15 19:28:03', NULL),
(493, 'Record updated On staff id 1', '1', 1, 'Update', '51.235.242.6', 'Windows 10', 'Chrome 128.0.0.0', '2024-09-15 19:28:10', NULL),
(494, 'Record updated On staff id 1', '1', 1, 'Update', '51.235.242.6', 'Windows 10', 'Chrome 128.0.0.0', '2024-09-15 19:28:30', NULL),
(495, 'Record updated On settings id 1', '1', 1, 'Update', '51.235.242.6', 'Windows 10', 'Chrome 128.0.0.0', '2024-09-15 19:36:22', NULL),
(496, 'Record updated On settings id 1', '1', 1, 'Update', '105.112.218.45', 'Windows 10', 'Firefox 130.0', '2024-09-15 20:36:55', NULL),
(497, 'Record updated On staff id 1', '1', 0, 'Update', '197.210.52.216', 'Windows 10', 'Firefox 130.0', '2024-09-20 20:18:13', NULL),
(498, 'Record updated On staff id 1', '1', 0, 'Update', '197.210.52.216', 'Windows 10', 'Firefox 130.0', '2024-09-20 20:19:30', NULL),
(499, 'New Record inserted On  questions id 1', '1', 1, 'Insert', '::1', 'Windows 10', 'Chrome 129.0.0.0', '2024-10-14 14:17:18', NULL),
(500, 'New Record inserted On roles id 8', '8', 1, 'Insert', '::1', 'Windows 10', 'Chrome 129.0.0.0', '2024-10-14 15:07:44', NULL),
(501, 'Record updated On roles id 8', '8', 1, 'Update', '::1', 'Windows 10', 'Chrome 129.0.0.0', '2024-10-14 15:25:22', NULL),
(502, 'Record deleted On roles id 8', '8', 1, 'Delete', '::1', 'Windows 10', 'Chrome 129.0.0.0', '2024-10-14 16:09:27', NULL),
(503, 'Record updated On online c1ourses id 6', '6', 0, 'Update', '::1', 'Windows 10', 'Chrome 129.0.0.0', '2024-10-14 18:05:42', NULL),
(504, 'New Record inserted On  questions id 2', '2', 1, 'Insert', '::1', 'Windows 10', 'Chrome 129.0.0.0', '2024-10-15 17:36:06', NULL),
(505, 'Record deleted On questions id 2', '2', 1, 'Delete', '::1', 'Windows 10', 'Chrome 129.0.0.0', '2024-10-15 17:51:08', NULL),
(506, 'New Record inserted On  questions id 3', '3', 1, 'Insert', '::1', 'Windows 10', 'Chrome 129.0.0.0', '2024-10-15 17:54:14', NULL),
(507, 'New Record inserted On  questions id 4', '4', 1, 'Insert', '::1', 'Windows 10', 'Chrome 129.0.0.0', '2024-10-15 17:54:47', NULL),
(508, 'New Record inserted On  questions id 5', '5', 1, 'Insert', '::1', 'Windows 10', 'Chrome 129.0.0.0', '2024-10-15 18:07:24', NULL),
(509, 'New Record inserted On  online exam id 1', '1', 1, 'Insert', '::1', 'Windows 10', 'Chrome 129.0.0.0', '2024-10-16 12:53:19', NULL),
(510, 'New Record inserted On  onlineexam questions id 1', '1', 1, 'Insert', '::1', 'Windows 10', 'Chrome 129.0.0.0', '2024-10-16 12:53:41', NULL),
(511, 'New Record inserted On  onlineexam questions id 2', '2', 1, 'Insert', '::1', 'Windows 10', 'Chrome 129.0.0.0', '2024-10-16 12:53:51', NULL),
(512, 'New Record inserted On  onlineexam questions id 3', '3', 1, 'Insert', '::1', 'Windows 10', 'Chrome 129.0.0.0', '2024-10-16 12:53:52', NULL),
(513, 'Record updated On  online exam id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 129.0.0.0', '2024-10-16 13:12:21', NULL),
(514, 'Record updated On  online exam id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 129.0.0.0', '2024-10-16 13:12:30', NULL),
(515, 'Record updated On  online exam id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 129.0.0.0', '2024-10-16 13:12:49', NULL),
(516, 'Record updated On settings id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 130.0.0.0', '2024-11-12 18:12:28', NULL),
(517, 'Record updated On students id 39', '39', 1, 'Update', '::1', 'Windows 10', 'Chrome 130.0.0.0', '2024-11-28 19:44:32', NULL),
(518, 'Record updated On  student session id 40', '40', 1, 'Update', '::1', 'Windows 10', 'Chrome 130.0.0.0', '2024-11-28 19:44:32', NULL),
(519, 'Record updated On classes id 1', '1', 1, 'Update', '::1', 'Windows 10', 'Chrome 130.0.0.0', '2024-11-28 19:56:41', NULL),
(520, 'Record updated On classes id 2', '2', 1, 'Update', '::1', 'Windows 10', 'Chrome 130.0.0.0', '2024-11-28 19:56:53', NULL),
(521, 'Record updated On classes id 3', '3', 1, 'Update', '::1', 'Windows 10', 'Chrome 130.0.0.0', '2024-11-28 19:56:58', NULL),
(522, 'New Record inserted On  student session id 41', '41', 1, 'Insert', '::1', 'Windows 10', 'Chrome 130.0.0.0', '2024-11-28 20:01:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mark_divisions`
--

CREATE TABLE `mark_divisions` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `percentage_from` float(10,2) DEFAULT NULL,
  `percentage_to` float(10,2) DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `template_id` varchar(100) DEFAULT NULL,
  `email_template_id` int(11) DEFAULT NULL,
  `sms_template_id` int(11) DEFAULT NULL,
  `send_through` varchar(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `send_mail` varchar(10) DEFAULT '0',
  `send_sms` varchar(10) DEFAULT '0',
  `is_group` varchar(10) DEFAULT '0',
  `is_individual` varchar(10) DEFAULT '0',
  `is_class` int(11) NOT NULL DEFAULT 0,
  `is_schedule` int(11) NOT NULL,
  `sent` int(11) DEFAULT NULL,
  `schedule_date_time` datetime DEFAULT NULL,
  `group_list` text DEFAULT NULL,
  `user_list` text DEFAULT NULL,
  `schedule_class` int(11) DEFAULT NULL,
  `schedule_section` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_roles`
--

CREATE TABLE `notification_roles` (
  `id` int(11) NOT NULL,
  `send_notification_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_setting`
--

CREATE TABLE `notification_setting` (
  `id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `is_mail` varchar(10) DEFAULT '0',
  `is_sms` varchar(10) DEFAULT '0',
  `is_notification` int(11) NOT NULL DEFAULT 0,
  `display_notification` int(11) NOT NULL DEFAULT 0,
  `display_sms` int(11) NOT NULL DEFAULT 1,
  `is_student_recipient` int(11) DEFAULT NULL,
  `is_guardian_recipient` int(11) DEFAULT NULL,
  `is_staff_recipient` int(11) DEFAULT NULL,
  `display_student_recipient` int(11) DEFAULT NULL,
  `display_guardian_recipient` int(11) DEFAULT NULL,
  `display_staff_recipient` int(11) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `template_id` varchar(100) NOT NULL,
  `template` longtext NOT NULL,
  `variables` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `notification_setting`
--

INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES
(1, 'student_admission', '1', '0', 0, 0, 1, 1, 1, 0, 1, 1, NULL, 'Student Admission', '', 'Dear {{student_name}} your admission is confirm in Class: {{class}}, Section:  {{section}}, for Session: {{current_session_name}}. For more \r\ndetail\r\n contact\r\n The School\r\n {{class}} {{section}} {{admission_no}} {{roll_no}} {{admission_date}} {{mobileno}} {{email}} {{dob}} {{guardian_name}} {{guardian_relation}} {{guardian_phone}} {{father_name}} {{father_phone}} {{blood_group}} {{mother_name}} {{gender}} {{guardian_email}}', '{{student_name}} {{class}}  {{section}}  {{admission_no}}  {{roll_no}}  {{admission_date}}   {{mobileno}}  {{email}}  {{dob}}  {{guardian_name}}  {{guardian_relation}}  {{guardian_phone}}  {{father_name}}  {{father_phone}}  {{blood_group}}  {{mother_name}}  {{gender}} {{guardian_email}} {{current_session_name}} ', '2023-06-25 09:04:30'),
(2, 'exam_result', '1', '0', 0, 1, 1, 1, 0, 0, 1, 1, NULL, 'Exam Result', '', 'Dear {{student_name}} - {{exam_roll_no}}, your {{exam}} result has been published.', '{{student_name}} {{exam_roll_no}} {{exam}}', '2023-06-25 09:04:30'),
(3, 'fee_submission', '1', '0', 0, 1, 1, 1, 1, 0, 1, 1, NULL, 'Fee Submission', '', 'Dear parents, we have received Fees Amount {{fee_amount}} for  {{student_name}}  by Your School Name \r\n{{class}} {{section}} {{fine_type}} {{fine_percentage}} {{fine_amount}} {{fee_group_name}} {{type}} {{code}} {{email}} {{contact_no}} {{invoice_id}} {{sub_invoice_id}} {{due_date}} {{amount}} {{fee_amount}}', '{{student_name}} {{class}} {{section}} {{fine_type}} {{fine_percentage}} {{fine_amount}} {{fee_group_name}} {{type}} {{code}} {{email}} {{contact_no}} {{invoice_id}} {{sub_invoice_id}} {{due_date}} {{amount}} {{fee_amount}}', '2023-06-25 09:04:30'),
(4, 'absent_attendence', '1', '0', 0, 1, 1, 1, 1, 0, 1, 1, NULL, 'Absent Attendence', '', 'Absent Notice :{{student_name}}  was absent on date {{date}} in period {{subject_name}} {{subject_code}} {{subject_type}} from Your School Name', '{{student_name}} {{mobileno}} {{email}} {{father_name}} {{father_phone}} {{father_occupation}} {{mother_name}} {{mother_phone}} {{guardian_name}} {{guardian_phone}} {{guardian_occupation}} {{guardian_email}} {{date}} {{current_session_name}} {{time_from}} {{time_to}} {{subject_name}} {{subject_code}} {{subject_type}}  ', '2023-06-25 09:04:30'),
(6, 'homework', '1', '0', 0, 1, 1, 1, 0, 0, 1, 1, NULL, 'Homework', '', 'New Homework has been created for \r\n{{student_name}} at\r\n\r\n\r\n\r\n{{homework_date}} for the class {{class}} {{section}} {{subject}}. kindly submit your\r\n\r\n\r\n homework before {{submit_date}} .Thank you', '{{homework_date}} {{submit_date}} {{class}} {{section}} {{subject}} {{student_name}} {{admission_no}} ', '2023-06-25 09:04:30'),
(7, 'fees_reminder', '1', '0', 0, 1, 1, 1, 1, 0, 1, 1, NULL, 'Fees Reminder', '', 'Dear parents, please pay fee amount Rs.{{due_amount}} of {{fee_type}} before {{due_date}} for {{student_name}}  from smart school (ignore if you already paid)', '{{fee_type}}{{fee_code}}{{due_date}}{{student_name}}{{school_name}}{{fee_amount}}{{due_amount}}{{deposit_amount}} ', '2023-06-25 09:04:30'),
(8, 'forgot_password', '1', '0', 0, 0, 0, 1, 1, 1, 1, 1, 1, 'Forgot Password', '', 'Dear  {{name}} , \r\n    Recently a request was submitted to reset password for your account. If you didn\'t make the request, just ignore this email. Otherwise you can reset your password using this link <a href=\'{{resetPassLink}}\'>Click here to reset your password</a>,\r\nif you\'re having trouble clicking the password reset button, copy and paste the URL below into your web browser. your username {{username}}\r\n{{resetPassLink}}\r\n Regards,\r\n {{school_name}}', '{{school_name}}{{name}}{{username}}{{resetPassLink}} ', '2022-12-28 09:52:24'),
(9, 'online_examination_publish_exam', '1', '0', 0, 1, 1, 1, 0, 0, 1, 1, NULL, 'Online Examination Publish Exam', '', 'A new exam {{exam_title}} has been created for  duration: {{time_duration}} min, which will be available from:  {{exam_from}} to  {{exam_to}}.', '{{exam_title}} {{exam_from}} {{exam_to}} {{time_duration}} {{attempt}} {{passing_percentage}}', '2023-06-25 09:04:30'),
(10, 'online_examination_publish_result', '1', '0', 0, 1, 1, 1, 0, 0, 1, 1, NULL, 'Online Examination Publish Result', '', 'Exam {{exam_title}} result has been declared which was conducted between  {{exam_from}} to   {{exam_to}}, for more details, please check your student portal.', '{{exam_title}} {{exam_from}} {{exam_to}} {{time_duration}} {{attempt}} {{passing_percentage}}', '2023-06-25 09:04:30'),
(11, 'online_admission_form_submission', '1', '0', 0, 1, 1, 1, 1, 0, 1, 1, NULL, 'Online Admission Form Submission', '', 'Dear {{firstname}}  {{lastname}} your online admission form is Submitted successfully  on date {{date}}. Your Reference number is {{reference_no}}. Please remember your reference number for further process.', ' {{firstname}} {{lastname}} {{date}} {{reference_no}}', '2023-06-25 09:04:30'),
(12, 'online_admission_fees_submission', '0', '0', 0, 1, 1, 1, 1, 0, 1, 1, NULL, 'Online Admission Fees Submission', '', 'Dear {{firstname}}  {{lastname}} your online admission form is Submitted successfully and the payment of {{paid_amount}} has recieved successfully on date {{date}}. Your Reference number is {{reference_no}}. Please remember your reference number for further process.', ' {{firstname}} {{lastname}} {{date}} {{paid_amount}} {{reference_no}}', '2023-06-25 09:04:30'),
(13, 'student_login_credential', '1', '1', 0, 0, 1, 1, 1, 0, 1, 1, NULL, 'Student Login Credential', '1707163291685208209', 'Hello {{display_name}} your login details for Url: {{url}} Username: {{username}}  Password: {{password}} admission No: {{admission_no}}', '{{url}} {{display_name}} {{username}} {{password}} {{admission_no}}', '2022-08-06 05:34:41'),
(14, 'staff_login_credential', '1', '1', 0, 0, 1, 0, 0, 1, NULL, NULL, 1, 'Staff Login Credential', '1707163291685208209', 'Hello {{first_name}} {{last_name}} your login details for Url: {{url}} Username: {{username}}  Password: {{password}} Employee ID: {{employee_id}}', '{{url}} {{first_name}} {{last_name}} {{username}} {{password}} {{employee_id}}', '2021-12-23 11:59:13'),
(15, 'fee_processing', '1', '1', 1, 1, 1, 1, 1, 0, 1, 1, NULL, 'Fee processing', '1707163291301326898', 'Dear parents, we have received Fees Amount {{fee_amount}} for  {{student_name}}  by Your School Name \r\n{{class}} {{section}} {{email}} {{contact_no}}\r\n\r\n{{student_name}} {{class}} {{section}} {{email}} {{contact_no}} transaction_id :{{transaction_id}} {{fee_amount}}', '{{student_name}} {{class}} {{section}} {{email}} {{contact_no}} {{transaction_id}} {{fee_amount}}', '2021-12-22 10:15:42'),
(16, 'online_admission_fees_processing', '1', '1', 1, 1, 1, 1, 1, 0, 1, 1, NULL, 'Online Admission Fees Processing', '', 'Dear {{firstname}}  {{lastname}} your online admission form is Submitted successfully and the payment of {{paid_amount}} has processing on date {{date}}. Your Reference number is {{reference_no}} and your transaction id {{transaction_id}}. Please remember your reference number for further process.', ' {{firstname}} {{lastname}} {{date}} {{paid_amount}} {{reference_no}} {{transaction_id}}', '2022-08-06 11:09:47'),
(17, 'student_apply_leave', '1', '1', 0, 0, 1, 0, 1, 1, NULL, 1, 1, 'Student Apply Leave ( {{student_name}} - {{admission_no}} )', '', 'My Name is {{student_name}} Class {{class}} section {{section}}. I have to apply leave on {{apply_date}}and from {{from_date}} to {{to_date}}. {{message}} please provide.', '{{message}} {{apply_date}} {{from_date}} {{to_date}} {{student_name}} {{class}} {{section}}', '2022-03-12 11:58:37'),
(18, 'email_pdf_exam_marksheet', '1', '0', 0, 0, 0, 1, 1, 0, 1, 1, NULL, 'Email PDF Exam Marksheet ( {{student_name}} - {{admission_no}} )', '', 'Dear {{student_name}} ({{admission_no}}) {{class}} Section {{section}}. We have mailed you the marksheet of Exam {{exam}} Roll no.{{roll_no}}', '{{student_name}} {{class}}  {{section}}  {{admission_no}}  {{roll_no}} {{exam}} {{admit_card_roll_no}} ', '2022-03-12 12:24:42'),
(19, 'online_course_publish', '1', '1', 0, 1, 1, 1, 0, 0, 1, 1, NULL, 'Online Course Publish', '', 'Dear student, a new online course {{title}} and price {{price}} with discount {{discount}}% for {{class}} {{section}} is {{paid_free}} now available and assign to {{assign_teacher}}.', '{{title}} {{class}} {{section}} {{price}} {{discount}} {{paid_free}} {{assign_teacher}}\r\n ', '2023-06-25 09:04:30'),
(20, 'online_course_purchase', '1', '1', 0, 1, 1, 1, 0, 0, 1, 1, NULL, 'Online Course Purchase', '', 'Thanks for purchasing course {{title}} amount {{price}} purchase date {{purchase_date}} class {{class}} section {{section}} and assign for {{assign_teacher}}  discount {{discount}}%', '{{title}} {{class}} {{section}} {{price}} {{discount}}  \r\n{{purchase_date}}', '2023-06-25 09:04:30'),
(21, 'online_course_purchase_for_guest_user', '1', '1', 0, 0, 1, 1, 0, 0, 1, NULL, NULL, 'Online Course Purchase For Guest', '', 'Thanks for purchasing course {{title}} discount {{discount}} amount {{price}} purchase date {{purchase_date}}', '{{title}} {{price}} {{discount}} {{purchase_date}}', '2023-06-25 09:04:30'),
(22, 'online_course_guest_user_sign_up', '1', '0', 0, 0, 0, 1, 0, 0, 1, NULL, NULL, 'Online Course Guest User Sign Up', '', 'Dear {{guest_user_name}} you have successfully sign up with Email: {{email}} Url {{url}}', '{{guest_user_name}} {{email}} {{url}}', '2023-06-25 09:04:30'),
(23, 'gmeet_online_classes', '1', '1', 1, 1, 1, 1, 1, 0, 1, 1, NULL, 'Gmeet Live Classes', '', 'Dear student, your live class {{title}} has been scheduled on {{date}} for the duration of {{duration}} minute, please do not share the link to any body.', '{{title}} {{date}} {{duration}}', '2022-07-13 05:25:28'),
(24, 'gmeet_online_meeting', '1', '1', 0, 0, 1, 0, 0, 1, NULL, NULL, 1, 'Gmeet Live Meeting', '', 'Dear staff, your live meeting {{title}} has been scheduled on {{date}} for the duration of {{duration}} minute, please do not share the link to any body.', '{{title}} {{date}} {{duration}} {{employee_id}} {{department}} {{designation}} {{name}} {{contact_no}} {{email}}', '2022-07-13 05:25:28'),
(25, 'gmeet_online_classes_start', '1', '1', 1, 1, 1, 1, 1, 0, 1, 1, NULL, 'Gmeet  Live Classes Start', '', 'Dear student, your live class {{title}} has been started  for the duration of {{duration}} minute.', '{{title}} {{date}} {{duration}}', '2022-07-13 05:25:28'),
(26, 'gmeet_online_meeting_start', '1', '1', 0, 0, 1, 0, 0, 1, NULL, NULL, 1, 'Gmeet Live Meeting Start', '', 'Dear {{name}},  your live meeting {{title}} has been started  for the duration of {{duration}} minute.', '{{title}} {{date}} {{duration}} {{employee_id}} {{department}} {{designation}} {{name}} {{contact_no}} {{email}}', '2022-07-13 05:25:28');

-- --------------------------------------------------------

--
-- Table structure for table `offline_fees_payments`
--

CREATE TABLE `offline_fees_payments` (
  `id` int(11) NOT NULL,
  `invoice_id` varchar(50) DEFAULT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `student_fees_master_id` int(11) DEFAULT NULL,
  `fee_groups_feetype_id` int(11) DEFAULT NULL,
  `student_transport_fee_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `bank_from` varchar(200) DEFAULT NULL,
  `bank_account_transferred` varchar(200) DEFAULT NULL,
  `reference` varchar(200) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `approve_date` datetime DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `reply` text DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `onlineexam`
--

CREATE TABLE `onlineexam` (
  `id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `exam` text DEFAULT NULL,
  `attempt` int(11) NOT NULL,
  `exam_from` datetime DEFAULT NULL,
  `exam_to` datetime DEFAULT NULL,
  `is_quiz` int(11) NOT NULL DEFAULT 0,
  `auto_publish_date` datetime DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `duration` time NOT NULL,
  `passing_percentage` float NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `publish_result` int(11) NOT NULL DEFAULT 0,
  `answer_word_count` int(11) NOT NULL DEFAULT -1,
  `is_active` varchar(1) DEFAULT '0',
  `is_marks_display` int(11) NOT NULL DEFAULT 0,
  `is_neg_marking` int(11) NOT NULL DEFAULT 0,
  `is_random_question` int(11) NOT NULL DEFAULT 0,
  `is_rank_generated` int(11) NOT NULL DEFAULT 0,
  `publish_exam_notification` int(11) NOT NULL,
  `publish_result_notification` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `onlineexam`
--

INSERT INTO `onlineexam` (`id`, `session_id`, `exam`, `attempt`, `exam_from`, `exam_to`, `is_quiz`, `auto_publish_date`, `time_from`, `time_to`, `duration`, `passing_percentage`, `description`, `publish_result`, `answer_word_count`, `is_active`, `is_marks_display`, `is_neg_marking`, `is_random_question`, `is_rank_generated`, `publish_exam_notification`, `publish_result_notification`, `created_at`, `updated_at`) VALUES
(1, 19, 'test', 1, '2024-10-16 22:14:00', '2024-10-16 22:52:00', 1, NULL, NULL, NULL, '23:58:00', 80, 'hi this is me&nbsp;', 0, -1, '1', 1, 1, 1, 0, 1, 0, '2024-10-16 17:12:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `onlineexam_attempts`
--

CREATE TABLE `onlineexam_attempts` (
  `id` int(11) NOT NULL,
  `onlineexam_student_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `onlineexam_questions`
--

CREATE TABLE `onlineexam_questions` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `onlineexam_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `marks` float(10,2) NOT NULL DEFAULT 0.00,
  `neg_marks` float(10,2) DEFAULT 0.00,
  `is_active` varchar(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `onlineexam_questions`
--

INSERT INTO `onlineexam_questions` (`id`, `question_id`, `onlineexam_id`, `session_id`, `marks`, `neg_marks`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 3, 1, NULL, 1.00, 0.25, '0', '2024-10-16 16:53:41', NULL),
(2, 4, 1, NULL, 1.00, 0.25, '0', '2024-10-16 16:53:51', NULL),
(3, 5, 1, NULL, 1.00, 0.25, '0', '2024-10-16 16:53:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `onlineexam_students`
--

CREATE TABLE `onlineexam_students` (
  `id` int(11) NOT NULL,
  `onlineexam_id` int(11) DEFAULT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `is_attempted` int(11) NOT NULL DEFAULT 0,
  `rank` int(11) DEFAULT 0,
  `quiz_attempted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `onlineexam_students`
--

INSERT INTO `onlineexam_students` (`id`, `onlineexam_id`, `student_session_id`, `is_attempted`, `rank`, `quiz_attempted`, `created_at`, `updated_at`) VALUES
(1, 1, 21, 0, 0, 0, '2024-10-16 16:56:09', NULL),
(2, 1, 22, 0, 0, 0, '2024-10-16 16:56:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `onlineexam_student_results`
--

CREATE TABLE `onlineexam_student_results` (
  `id` int(11) NOT NULL,
  `onlineexam_student_id` int(11) NOT NULL,
  `onlineexam_question_id` int(11) NOT NULL,
  `select_option` longtext DEFAULT NULL,
  `marks` float(10,2) NOT NULL DEFAULT 0.00,
  `remark` text DEFAULT NULL,
  `attachment_name` text DEFAULT NULL,
  `attachment_upload_name` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_admissions`
--

CREATE TABLE `online_admissions` (
  `id` int(11) NOT NULL,
  `admission_no` varchar(100) DEFAULT NULL,
  `roll_no` varchar(100) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `admission_date` date DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `middlename` varchar(255) NOT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `rte` varchar(20) NOT NULL DEFAULT 'No',
  `image` varchar(255) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `cast` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT 0,
  `route_id` int(11) NOT NULL,
  `school_house_id` int(11) DEFAULT NULL,
  `blood_group` varchar(200) NOT NULL,
  `vehroute_id` int(11) NOT NULL,
  `hostel_room_id` int(11) DEFAULT NULL,
  `adhar_no` varchar(100) DEFAULT NULL,
  `samagra_id` varchar(100) DEFAULT NULL,
  `bank_account_no` varchar(100) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `ifsc_code` varchar(100) DEFAULT NULL,
  `guardian_is` varchar(100) NOT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `father_phone` varchar(100) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `mother_phone` varchar(100) DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_relation` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(100) DEFAULT NULL,
  `guardian_occupation` varchar(150) NOT NULL,
  `guardian_address` text DEFAULT NULL,
  `guardian_email` varchar(100) NOT NULL,
  `father_pic` varchar(255) NOT NULL,
  `mother_pic` varchar(255) NOT NULL,
  `guardian_pic` varchar(255) NOT NULL,
  `is_enroll` int(11) DEFAULT 0,
  `previous_school` text DEFAULT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `note` text NOT NULL,
  `form_status` int(11) NOT NULL,
  `paid_status` int(11) NOT NULL,
  `measurement_date` date DEFAULT NULL,
  `app_key` text DEFAULT NULL,
  `document` text DEFAULT NULL,
  `submit_date` date DEFAULT NULL,
  `disable_at` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `online_admissions`
--

INSERT INTO `online_admissions` (`id`, `admission_no`, `roll_no`, `reference_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `class_section_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_enroll`, `previous_school`, `height`, `weight`, `note`, `form_status`, `paid_status`, `measurement_date`, `app_key`, `document`, `submit_date`, `disable_at`, `created_at`, `updated_at`) VALUES
(1, 'ETSA045021', '', '519781', NULL, 'hello', '', 'world', 'No', NULL, '9544400719', 'hello1212313@gmail.com', NULL, NULL, NULL, '', '', '1998-12-28', 'Male', '', '', NULL, 1, 0, NULL, '', 0, NULL, '', '', '', '', '', 'mother', '', '', '', '', '', '', 'daddas', 'sada', '9544400719', 'sadd', 'foxwood', 'Joshwa@gmail.com', '', '', '', 1, '', '', '', '', 1, 0, NULL, NULL, NULL, '2023-09-18', NULL, '2023-09-18 12:45:05', NULL),
(22, NULL, '', '252087', NULL, 'joshwa', '', 'roy', 'No', 'uploads/student_images/online_admission_image/1695038916-50460239665083dc448318!WhatsApp Image 2023-01-17 at 12.14.10 AM.jpeg', '9544400719', 'Joshwa@gmail.com', NULL, NULL, NULL, '', '', '2023-05-03', 'Male', '', '', NULL, 1, 0, NULL, '', 0, NULL, '', '', '', '', '', 'father', '', '', '', '', '', '', 'aadas', 'Fatherdsad', '9544400719', 'asdas', 'foxwood', 'hello123@gmail.com', '', '', '', 0, '', '', '', '', 1, 0, NULL, NULL, NULL, '2023-09-18', NULL, '2023-09-18 12:44:54', NULL),
(23, NULL, '', '380531', NULL, 'joshwa123', '', 'roy', 'No', NULL, '9544400719', 'Joshwa223@gmail.com', NULL, NULL, NULL, '', '', '2023-05-03', 'Male', '', '', NULL, 1, 0, NULL, '', 0, NULL, '', '', '', '', '', 'father', '', '', '', '', '', '', 'aadas', 'Fatherdsad', '9544400719', 'asdas', 'foxwood', 'hello123@gmail.com', '', '', '', 1, '', '', '', '', 1, 0, NULL, NULL, NULL, '2023-09-18', NULL, '2023-09-18 12:45:57', NULL),
(24, 'ETSA045022', '', '205038', NULL, 'joshwa', '', 'roy', 'No', NULL, '9544400719', 'Joshwa126@gmail.com', NULL, NULL, NULL, '', '', '2018-12-31', 'Male', '', '', NULL, 1, 0, NULL, '', 0, NULL, '', '', '', '', '', 'father', '', '', '', '', '', '', 'asdssadasd', 'Father', '9544400719', '', 'foxwood', 'Joshwa@gmail.com', '', '', '', 1, '', '', '', '', 1, 0, NULL, NULL, NULL, '2023-09-18', NULL, '2023-09-18 12:45:59', NULL),
(25, 'ETSA045023', '', '117768', NULL, 'joshwa', '', 'roy', 'No', NULL, '9544400719', 'Joshwa1123126@gmail.com', NULL, NULL, NULL, '', '', '2018-12-31', 'Female', '', '', NULL, 1, 0, NULL, '', 0, NULL, '', '', '', '', '', 'father', '', '', '', '', '', '', 'asdssadasd', 'Father', '9544400719', '', 'foxwood', 'Joshwa@gmail.com', '', '', '', 1, '', '', '', '', 1, 0, NULL, NULL, NULL, '2023-09-18', NULL, '2023-09-18 13:30:47', NULL),
(26, 'ETSA045024', '', '881054', NULL, 'joshwa', '', 'roy', 'No', NULL, '9544400719', 'Joshwa200@gmail.com', NULL, NULL, NULL, '', '', '2005-12-26', 'Male', '', '', NULL, 1, 0, NULL, '', 0, NULL, '', '', '', '', '', 'father', '', '', '', '', '', '', 'dfdsf', 'Father', '9544400719', 'wasdad', 'foxwood', 'Joshwa123@gmail.com', '', '', 'uploads/student_images/online_admission_image/1695047655-33054766765085fe78e77d!a59a45ae-9553-4649-bd22-78dfa129f5d3 (1).jfif', 1, '', '', '', '', 1, 0, NULL, NULL, NULL, NULL, NULL, '2023-09-18 14:44:09', NULL),
(27, 'ETSA045025', '', '618824', NULL, 'joshwa', '', 'roy', 'No', NULL, '9544400719', 'Joshwa2568@gmail.com', NULL, NULL, NULL, '', '', '1999-02-02', 'Male', '', '', NULL, 1, 0, NULL, '', 0, NULL, '', '', '', '', '', 'father', '', '', '', '', '', '', 'hbkj', 'Father', '9544400719', '', 'foxwood', 'hello123@gmail.com', '', '', '', 1, '', '', '', '', 1, 0, NULL, NULL, NULL, NULL, NULL, '2023-09-18 14:44:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `online_admission_custom_field_value`
--

CREATE TABLE `online_admission_custom_field_value` (
  `id` int(11) NOT NULL,
  `belong_table_id` int(11) DEFAULT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `field_value` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_admission_fields`
--

CREATE TABLE `online_admission_fields` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `online_admission_fields`
--

INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES
(1, 'middlename', 1, '2023-12-03 13:14:52'),
(2, 'lastname', 1, '2021-06-02 04:49:19'),
(3, 'category', 0, '2021-06-02 04:48:35'),
(4, 'religion', 1, '2023-12-03 13:14:59'),
(5, 'cast', 0, '2021-06-02 04:48:35'),
(6, 'mobile_no', 1, '2021-06-02 04:50:24'),
(7, 'admission_date', 0, '2021-06-02 04:48:35'),
(8, 'student_photo', 1, '2023-06-21 22:49:39'),
(9, 'is_student_house', 1, '2023-12-03 13:15:08'),
(10, 'is_blood_group', 1, '2023-12-03 13:15:14'),
(11, 'student_height', 1, '2023-12-03 13:15:19'),
(12, 'student_weight', 0, '2021-06-02 04:48:35'),
(13, 'father_name', 0, '2021-06-02 04:48:35'),
(14, 'father_phone', 0, '2021-06-02 04:48:35'),
(15, 'father_occupation', 0, '2021-06-02 04:48:35'),
(16, 'father_pic', 0, '2021-06-02 04:48:35'),
(17, 'mother_name', 0, '2021-06-02 04:48:35'),
(18, 'mother_phone', 0, '2021-06-02 04:48:35'),
(19, 'mother_occupation', 0, '2021-06-02 04:48:35'),
(20, 'mother_pic', 0, '2021-06-02 04:48:35'),
(21, 'guardian_name', 1, '2021-06-02 04:50:54'),
(22, 'guardian_phone', 1, '2021-06-02 04:50:54'),
(23, 'if_guardian_is', 1, '2021-06-02 04:50:54'),
(24, 'guardian_relation', 1, '2021-06-02 04:50:54'),
(25, 'guardian_email', 1, '2021-06-02 04:51:35'),
(26, 'guardian_occupation', 1, '2021-06-02 04:51:26'),
(27, 'guardian_address', 1, '2021-06-02 04:51:31'),
(28, 'bank_account_no', 0, '2021-06-02 04:48:35'),
(29, 'bank_name', 0, '2021-06-02 04:48:35'),
(30, 'ifsc_code', 0, '2021-06-02 04:48:35'),
(31, 'national_identification_no', 0, '2021-06-02 04:48:35'),
(32, 'local_identification_no', 0, '2021-06-02 04:48:35'),
(33, 'rte', 0, '2021-06-02 04:48:35'),
(34, 'previous_school_details', 0, '2021-06-02 04:48:35'),
(35, 'guardian_photo', 1, '2021-06-02 04:51:29'),
(36, 'student_note', 0, '2021-06-02 04:55:08'),
(37, 'measurement_date', 0, '2021-06-02 04:48:35'),
(38, 'student_email', 0, '2023-12-03 13:14:27'),
(39, 'current_address', 0, '2021-06-02 04:48:35'),
(40, 'permanent_address', 0, '2021-06-02 04:48:35'),
(41, 'upload_documents', 1, '2023-07-04 08:28:31');

-- --------------------------------------------------------

--
-- Table structure for table `online_admission_payment`
--

CREATE TABLE `online_admission_payment` (
  `id` int(11) NOT NULL,
  `online_admission_id` int(11) NOT NULL,
  `paid_amount` float(10,2) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `payment_type` varchar(100) NOT NULL,
  `transaction_id` varchar(100) NOT NULL,
  `note` varchar(100) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_courses`
--

CREATE TABLE `online_courses` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `outcomes` text DEFAULT NULL,
  `course_thumbnail` varchar(100) DEFAULT NULL,
  `course_provider` varchar(100) DEFAULT NULL,
  `course_url` varchar(255) DEFAULT NULL,
  `video_id` text DEFAULT NULL,
  `html5_video` varchar(255) DEFAULT NULL,
  `price` float(10,2) NOT NULL DEFAULT 0.00,
  `discount` float(10,2) NOT NULL DEFAULT 0.00,
  `free_course` tinyint(1) DEFAULT NULL COMMENT '0=paid,1=free',
  `view_count` int(11) DEFAULT NULL,
  `front_side_visibility` varchar(10) NOT NULL DEFAULT 'yes',
  `status` tinyint(1) DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `online_courses`
--

INSERT INTO `online_courses` (`id`, `title`, `slug`, `url`, `description`, `teacher_id`, `category_id`, `outcomes`, `course_thumbnail`, `course_provider`, `course_url`, `video_id`, `html5_video`, `price`, `discount`, `free_course`, `view_count`, `front_side_visibility`, `status`, `created_by`, `created_date`, `updated_date`) VALUES
(2, 'Html5', 'html5', 'course/coursedetail/html5', 'Html5', 2, 2, '[\"Html5\"]', 'course_thumbnail2.png', 'html5', '', '', '1701842051-54416096665700c838cca6!mixkit-going-down-a-curved-highway-through-a-mountain-range-41576-medium.mp4', 0.00, 0.00, 1, 1, 'yes', 1, 1, '2023-12-06 06:54:11', '2023-12-06 04:26:12'),
(3, 'PHP Course', 'php-course', 'course/coursedetail/php-course', 'PHP Course', 2, 1, '[\"PHP Course\"]', 'course_thumbnail3.png', 'html5', '', '', '1701970960-207052189165720410e22c3!mixkit-going-down-a-curved-highway-through-a-mountain-range-41576-medium.mp4', 100.00, 0.00, 1, 2, 'yes', 1, 1, '2023-12-07 06:42:40', '2023-12-07 06:42:58'),
(4, 'PHP Advance Course', 'php-advance-course', 'course/coursedetail/php-advance-course', 'PHP Advance Course', 2, 1, '[\"PHP Advance Course\"]', 'course_thumbnail4.png', 'html5', '', '', '1703006458-15581073926581d0fa2dbca!mixkit-going-down-a-curved-highway-through-a-mountain-range-41576-medium.mp4', 100.00, 0.00, 0, 1, 'yes', 1, 1, '2023-12-19 06:20:58', '2023-12-21 06:55:18'),
(5, 'testing', 'testing', 'course/coursedetail/testing', 'do the following assignment', 3, 2, '[\"good\"]', NULL, 'html5', '', '', '1724624589-110273574066cbaecdc3a52!videoplayback.mp4', 0.00, 0.00, 1, NULL, 'no', 0, 1, '2024-08-25 11:23:09', '2024-08-25 11:23:09'),
(6, 'testing 2025', 'testing-2025', 'course/coursedetail/testing-2025', 'do the following assignment', 3, 2, '[\"good\"]', NULL, 'html5', '', '', '1724624620-89729950366cbaeec52623!videoplayback.mp4', 0.00, 0.00, 1, 1, 'no', 1, 1, '2024-08-25 11:23:40', '2024-08-25 11:23:40');

-- --------------------------------------------------------

--
-- Table structure for table `online_course_class_sections`
--

CREATE TABLE `online_course_class_sections` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `online_course_class_sections`
--

INSERT INTO `online_course_class_sections` (`id`, `course_id`, `class_section_id`, `created_date`) VALUES
(2, 2, 1, '2023-12-06 06:54:11'),
(3, 3, 1, '2023-12-07 06:42:40'),
(4, 4, 1, '2023-12-19 06:20:58'),
(5, 5, 1, '2024-08-25 11:23:09'),
(6, 6, 1, '2024-08-25 11:23:40');

-- --------------------------------------------------------

--
-- Table structure for table `online_course_lesson`
--

CREATE TABLE `online_course_lesson` (
  `id` int(11) NOT NULL,
  `course_section_id` int(11) DEFAULT NULL,
  `lesson_title` varchar(255) DEFAULT NULL,
  `lesson_type` varchar(20) DEFAULT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `attachment` varchar(200) DEFAULT NULL,
  `video_provider` varchar(20) DEFAULT NULL,
  `video_url` text DEFAULT NULL,
  `video_id` varchar(50) DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `online_course_lesson`
--

INSERT INTO `online_course_lesson` (`id`, `course_section_id`, `lesson_title`, `lesson_type`, `thumbnail`, `summary`, `attachment`, `video_provider`, `video_url`, `video_id`, `duration`, `created_date`) VALUES
(1, 1, 'Html', 'video', '1.png', '', NULL, 'youtube', 'https://www.youtube.com/shorts/EmwcLIbuiLo', 'EmwcLIbuiLo', '20:24:50', '2023-12-06 04:26:12'),
(3, 3, 'hgj', 'video', NULL, 'hfytuf', NULL, NULL, NULL, NULL, NULL, '2023-12-20 07:06:29'),
(4, 3, 'hgj', 'video', NULL, 'hfytuf', NULL, NULL, NULL, NULL, NULL, '2023-12-20 07:15:09'),
(5, 3, 'hgj', 'video', '5.png', 'hfytuf', NULL, 'html5', NULL, NULL, '22:26:52', '2023-12-20 07:20:35'),
(7, 3, 'fdsdsa', 'video', '7.jpg', 'Test', NULL, 'html5', './uploads/lesson/1703181318-50166385465847c06908d8!', NULL, '22:54:51', '2023-12-21 06:55:18');

-- --------------------------------------------------------

--
-- Table structure for table `online_course_payment`
--

CREATE TABLE `online_course_payment` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `online_courses_id` int(11) DEFAULT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  `actual_price` float(10,2) NOT NULL DEFAULT 0.00,
  `paid_amount` float(10,2) NOT NULL DEFAULT 0.00,
  `payment_mode` varchar(50) DEFAULT NULL,
  `payment_type` varchar(100) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_course_processing_payment`
--

CREATE TABLE `online_course_processing_payment` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `online_courses_id` int(11) DEFAULT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  `actual_price` float(10,2) NOT NULL DEFAULT 0.00,
  `paid_amount` float(10,2) NOT NULL DEFAULT 0.00,
  `payment_mode` varchar(50) DEFAULT NULL,
  `payment_type` varchar(100) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `gateway_ins_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_course_quiz`
--

CREATE TABLE `online_course_quiz` (
  `id` int(11) NOT NULL,
  `course_section_id` int(11) DEFAULT NULL,
  `quiz_title` varchar(255) DEFAULT NULL,
  `quiz_instruction` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_course_section`
--

CREATE TABLE `online_course_section` (
  `id` int(11) NOT NULL,
  `online_course_id` int(11) DEFAULT NULL,
  `section_title` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `online_course_section`
--

INSERT INTO `online_course_section` (`id`, `online_course_id`, `section_title`, `order`, `is_active`) VALUES
(1, 2, 'English', NULL, NULL),
(2, 3, 'PHP Section', NULL, NULL),
(3, 4, 'PHP Advance Course', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `online_course_settings`
--

CREATE TABLE `online_course_settings` (
  `id` int(11) NOT NULL,
  `guest_prefix` varchar(50) NOT NULL,
  `guest_id_start_from` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE `payment_settings` (
  `id` int(11) NOT NULL,
  `payment_type` varchar(200) NOT NULL,
  `api_username` varchar(200) DEFAULT NULL,
  `api_secret_key` varchar(200) NOT NULL,
  `salt` varchar(200) NOT NULL,
  `api_publishable_key` varchar(200) NOT NULL,
  `api_password` varchar(200) DEFAULT NULL,
  `api_signature` varchar(200) DEFAULT NULL,
  `api_email` varchar(200) DEFAULT NULL,
  `paypal_demo` varchar(100) NOT NULL,
  `account_no` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `gateway_mode` int(11) NOT NULL COMMENT '0 Testing, 1 live',
  `paytm_website` varchar(255) NOT NULL,
  `paytm_industrytype` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payslip_allowance`
--

CREATE TABLE `payslip_allowance` (
  `id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `allowance_type` varchar(200) NOT NULL,
  `amount` float NOT NULL,
  `staff_id` int(11) NOT NULL,
  `cal_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_category`
--

CREATE TABLE `permission_category` (
  `id` int(11) NOT NULL,
  `perm_group_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) DEFAULT NULL,
  `enable_view` int(11) DEFAULT 0,
  `enable_add` int(11) DEFAULT 0,
  `enable_edit` int(11) DEFAULT 0,
  `enable_delete` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `permission_category`
--

INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES
(1, 1, 'Student', 'student', 1, 1, 1, 1, '2019-10-24 05:42:03'),
(2, 1, 'Import Student', 'import_student', 1, 0, 0, 0, '2018-06-22 10:17:19'),
(3, 1, 'Student Categories', 'student_categories', 1, 1, 1, 1, '2018-06-22 10:17:36'),
(4, 1, 'Student Houses', 'student_houses', 1, 1, 1, 1, '2018-06-22 10:17:53'),
(5, 2, 'Collect Fees', 'collect_fees', 1, 1, 0, 1, '2018-06-22 10:21:03'),
(6, 2, 'Fees Carry Forward', 'fees_carry_forward', 1, 0, 0, 0, '2018-06-27 00:18:15'),
(7, 2, 'Fees Master', 'fees_master', 1, 1, 1, 1, '2018-06-27 00:18:57'),
(8, 2, 'Fees Group', 'fees_group', 1, 1, 1, 1, '2018-06-22 10:21:46'),
(9, 3, 'Income', 'income', 1, 1, 1, 1, '2018-06-22 10:23:21'),
(10, 3, 'Income Head', 'income_head', 1, 1, 1, 1, '2018-06-22 10:22:44'),
(11, 3, 'Search Income', 'search_income', 1, 0, 0, 0, '2018-06-22 10:23:00'),
(12, 4, 'Expense', 'expense', 1, 1, 1, 1, '2018-06-22 10:24:06'),
(13, 4, 'Expense Head', 'expense_head', 1, 1, 1, 1, '2018-06-22 10:23:47'),
(14, 4, 'Search Expense', 'search_expense', 1, 0, 0, 0, '2018-06-22 10:24:13'),
(15, 5, 'Student / Period Attendance', 'student_attendance', 1, 1, 1, 0, '2019-11-29 01:19:05'),
(20, 6, 'Marks Grade', 'marks_grade', 1, 1, 1, 1, '2018-06-22 10:25:25'),
(21, 7, 'Class Timetable', 'class_timetable', 1, 0, 1, 0, '2019-11-24 03:05:17'),
(23, 7, 'Subject', 'subject', 1, 1, 1, 1, '2018-06-22 10:32:17'),
(24, 7, 'Class', 'class', 1, 1, 1, 1, '2018-06-22 10:32:35'),
(25, 7, 'Section', 'section', 1, 1, 1, 1, '2018-06-22 10:31:10'),
(26, 7, 'Promote Student', 'promote_student', 1, 0, 0, 0, '2018-06-22 10:32:47'),
(27, 8, 'Upload Content', 'upload_content', 1, 1, 0, 1, '2018-06-22 10:33:19'),
(28, 9, 'Books List', 'books', 1, 1, 1, 1, '2019-11-24 00:37:12'),
(29, 9, 'Issue Return', 'issue_return', 1, 0, 0, 0, '2019-11-24 00:37:18'),
(30, 9, 'Add Staff Member', 'add_staff_member', 1, 0, 0, 0, '2018-07-02 11:37:00'),
(31, 10, 'Issue Item', 'issue_item', 1, 1, 1, 1, '2019-11-29 06:39:27'),
(32, 10, 'Add Item Stock', 'item_stock', 1, 1, 1, 1, '2019-11-24 00:39:17'),
(33, 10, 'Add Item', 'item', 1, 1, 1, 1, '2019-11-24 00:39:39'),
(34, 10, 'Item Store', 'store', 1, 1, 1, 1, '2019-11-24 00:40:41'),
(35, 10, 'Item Supplier', 'supplier', 1, 1, 1, 1, '2019-11-24 00:40:49'),
(37, 11, 'Routes', 'routes', 1, 1, 1, 1, '2018-06-22 10:39:17'),
(38, 11, 'Vehicle', 'vehicle', 1, 1, 1, 1, '2018-06-22 10:39:36'),
(39, 11, 'Assign Vehicle', 'assign_vehicle', 1, 1, 1, 1, '2018-06-27 04:39:20'),
(40, 12, 'Hostel', 'hostel', 1, 1, 1, 1, '2018-06-22 10:40:49'),
(41, 12, 'Room Type', 'room_type', 1, 1, 1, 1, '2018-06-22 10:40:27'),
(42, 12, 'Hostel Rooms', 'hostel_rooms', 1, 1, 1, 1, '2018-06-25 06:23:03'),
(43, 13, 'Notice Board', 'notice_board', 1, 1, 1, 1, '2018-06-22 10:41:17'),
(44, 13, 'Email', 'email', 1, 0, 0, 0, '2019-11-26 05:20:37'),
(46, 13, 'Email / SMS Log', 'email_sms_log', 1, 0, 0, 0, '2018-06-22 10:41:23'),
(53, 15, 'Languages', 'languages', 0, 1, 0, 1, '2021-01-23 07:09:32'),
(54, 15, 'General Setting', 'general_setting', 1, 0, 1, 0, '2018-07-05 09:08:35'),
(55, 15, 'Session Setting', 'session_setting', 1, 1, 1, 1, '2018-06-22 10:44:15'),
(56, 15, 'Notification Setting', 'notification_setting', 1, 0, 1, 0, '2018-07-05 09:08:41'),
(57, 15, 'SMS Setting', 'sms_setting', 1, 0, 1, 0, '2018-07-05 09:08:47'),
(58, 15, 'Email Setting', 'email_setting', 1, 0, 1, 0, '2018-07-05 09:08:51'),
(59, 15, 'Front CMS Setting', 'front_cms_setting', 1, 0, 1, 0, '2018-07-05 09:08:55'),
(60, 15, 'Payment Methods', 'payment_methods', 1, 0, 1, 0, '2018-07-05 09:08:59'),
(61, 16, 'Menus', 'menus', 1, 1, 0, 1, '2018-07-09 03:50:06'),
(62, 16, 'Media Manager', 'media_manager', 1, 1, 0, 1, '2018-07-09 03:50:26'),
(63, 16, 'Banner Images', 'banner_images', 1, 1, 0, 1, '2018-06-22 10:46:02'),
(64, 16, 'Pages', 'pages', 1, 1, 1, 1, '2018-06-22 10:46:21'),
(65, 16, 'Gallery', 'gallery', 1, 1, 1, 1, '2018-06-22 10:47:02'),
(66, 16, 'Event', 'event', 1, 1, 1, 1, '2018-06-22 10:47:20'),
(67, 16, 'News', 'notice', 1, 1, 1, 1, '2018-07-03 08:39:34'),
(68, 2, 'Fees Group Assign', 'fees_group_assign', 1, 0, 0, 0, '2018-06-22 10:20:42'),
(69, 2, 'Fees Type', 'fees_type', 1, 1, 1, 1, '2018-06-22 10:19:34'),
(70, 2, 'Fees Discount', 'fees_discount', 1, 1, 1, 1, '2018-06-22 10:20:10'),
(71, 2, 'Fees Discount Assign', 'fees_discount_assign', 1, 0, 0, 0, '2018-06-22 10:20:17'),
(73, 2, 'Search Fees Payment', 'search_fees_payment', 1, 0, 0, 0, '2018-06-22 10:20:27'),
(74, 2, 'Search Due Fees', 'search_due_fees', 1, 0, 0, 0, '2018-06-22 10:20:35'),
(77, 7, 'Assign Class Teacher', 'assign_class_teacher', 1, 1, 1, 1, '2018-06-22 10:30:52'),
(78, 17, 'Admission Enquiry', 'admission_enquiry', 1, 1, 1, 1, '2018-06-22 10:51:24'),
(79, 17, 'Follow Up Admission Enquiry', 'follow_up_admission_enquiry', 1, 1, 0, 1, '2018-06-22 10:51:39'),
(80, 17, 'Visitor Book', 'visitor_book', 1, 1, 1, 1, '2018-06-22 10:48:58'),
(81, 17, 'Phone Call Log', 'phone_call_log', 1, 1, 1, 1, '2018-06-22 10:50:57'),
(82, 17, 'Postal Dispatch', 'postal_dispatch', 1, 1, 1, 1, '2018-06-22 10:50:21'),
(83, 17, 'Postal Receive', 'postal_receive', 1, 1, 1, 1, '2018-06-22 10:50:04'),
(84, 17, 'Complain', 'complaint', 1, 1, 1, 1, '2018-07-03 08:40:55'),
(85, 17, 'Setup Font Office', 'setup_font_office', 1, 1, 1, 1, '2018-06-22 10:49:24'),
(86, 18, 'Staff', 'staff', 1, 1, 1, 1, '2018-06-22 10:53:31'),
(87, 18, 'Disable Staff', 'disable_staff', 1, 0, 0, 0, '2018-06-22 10:53:12'),
(88, 18, 'Staff Attendance', 'staff_attendance', 1, 1, 1, 0, '2018-06-22 10:53:10'),
(90, 18, 'Staff Payroll', 'staff_payroll', 1, 1, 0, 1, '2018-06-22 10:52:51'),
(93, 19, 'Homework', 'homework', 1, 1, 1, 1, '2018-06-22 10:53:50'),
(94, 19, 'Homework Evaluation', 'homework_evaluation', 1, 1, 0, 0, '2018-06-27 03:07:21'),
(96, 20, 'Student Certificate', 'student_certificate', 1, 1, 1, 1, '2018-07-06 10:41:07'),
(97, 20, 'Generate Certificate', 'generate_certificate', 1, 0, 0, 0, '2018-07-06 10:37:16'),
(98, 20, 'Student ID Card', 'student_id_card', 1, 1, 1, 1, '2018-07-06 10:41:28'),
(99, 20, 'Generate ID Card', 'generate_id_card', 1, 0, 0, 0, '2018-07-06 10:41:49'),
(102, 21, 'Calendar To Do List', 'calendar_to_do_list', 1, 1, 1, 1, '2018-06-22 10:54:41'),
(104, 10, 'Item Category', 'item_category', 1, 1, 1, 1, '2018-06-22 10:34:33'),
(106, 22, 'Quick Session Change', 'quick_session_change', 1, 0, 0, 0, '2018-06-22 10:54:45'),
(107, 1, 'Disable Student', 'disable_student', 1, 0, 0, 0, '2018-06-25 06:21:34'),
(108, 18, ' Approve Leave Request', 'approve_leave_request', 1, 0, 1, 1, '2020-10-05 08:56:27'),
(109, 18, 'Apply Leave', 'apply_leave', 1, 1, 0, 0, '2019-11-28 23:47:46'),
(110, 18, 'Leave Types ', 'leave_types', 1, 1, 1, 1, '2018-07-02 10:17:56'),
(111, 18, 'Department', 'department', 1, 1, 1, 1, '2018-06-26 03:57:07'),
(112, 18, 'Designation', 'designation', 1, 1, 1, 1, '2018-06-26 03:57:07'),
(113, 22, 'Fees Collection And Expense Monthly Chart', 'fees_collection_and_expense_monthly_chart', 1, 0, 0, 0, '2018-07-03 07:08:15'),
(114, 22, 'Fees Collection And Expense Yearly Chart', 'fees_collection_and_expense_yearly_chart', 1, 0, 0, 0, '2018-07-03 07:08:15'),
(115, 22, 'Monthly Fees Collection Widget', 'Monthly fees_collection_widget', 1, 0, 0, 0, '2018-07-03 07:13:35'),
(116, 22, 'Monthly Expense Widget', 'monthly_expense_widget', 1, 0, 0, 0, '2018-07-03 07:13:35'),
(117, 22, 'Student Count Widget', 'student_count_widget', 1, 0, 0, 0, '2018-07-03 07:13:35'),
(118, 22, 'Staff Role Count Widget', 'staff_role_count_widget', 1, 0, 0, 0, '2018-07-03 07:13:35'),
(122, 5, 'Attendance By Date', 'attendance_by_date', 1, 0, 0, 0, '2018-07-03 08:42:29'),
(123, 9, 'Add Student', 'add_student', 1, 0, 0, 0, '2018-07-03 08:42:29'),
(126, 15, 'User Status', 'user_status', 1, 0, 0, 0, '2018-07-03 08:42:29'),
(127, 18, 'Can See Other Users Profile', 'can_see_other_users_profile', 1, 0, 0, 0, '2018-07-03 08:42:29'),
(128, 1, 'Student Timeline', 'student_timeline', 1, 1, 1, 1, '2022-12-28 09:52:24'),
(129, 18, 'Staff Timeline', 'staff_timeline', 1, 1, 1, 1, '2022-12-28 09:52:24'),
(130, 15, 'Backup', 'backup', 1, 1, 0, 1, '2018-07-09 04:17:17'),
(131, 15, 'Restore', 'restore', 1, 0, 0, 0, '2018-07-09 04:17:17'),
(134, 1, 'Disable Reason', 'disable_reason', 1, 1, 1, 1, '2019-11-27 06:39:21'),
(135, 2, 'Fees Reminder', 'fees_reminder', 1, 0, 1, 0, '2019-10-25 00:39:49'),
(136, 5, 'Approve Leave', 'approve_leave', 1, 1, 1, 1, '2022-12-28 09:52:24'),
(137, 6, 'Exam Group', 'exam_group', 1, 1, 1, 1, '2019-10-25 01:02:34'),
(141, 6, 'Design Admit Card', 'design_admit_card', 1, 1, 1, 1, '2019-10-25 01:06:59'),
(142, 6, 'Print Admit Card', 'print_admit_card', 1, 0, 0, 0, '2019-11-23 23:57:51'),
(143, 6, 'Design Marksheet', 'design_marksheet', 1, 1, 1, 1, '2019-10-25 01:10:25'),
(144, 6, 'Print Marksheet', 'print_marksheet', 1, 0, 0, 0, '2019-10-25 01:11:02'),
(145, 7, 'Teachers Timetable', 'teachers_time_table', 1, 0, 0, 0, '2019-11-30 02:52:21'),
(146, 14, 'Student Report', 'student_report', 1, 0, 0, 0, '2019-10-25 01:27:00'),
(147, 14, 'Guardian Report', 'guardian_report', 1, 0, 0, 0, '2019-10-25 01:30:27'),
(148, 14, 'Student History', 'student_history', 1, 0, 0, 0, '2019-10-25 01:39:07'),
(149, 14, 'Student Login Credential Report', 'student_login_credential_report', 1, 0, 0, 0, '2019-10-25 01:39:07'),
(150, 14, 'Class Subject Report', 'class_subject_report', 1, 0, 0, 0, '2019-10-25 01:39:07'),
(151, 14, 'Admission Report', 'admission_report', 1, 0, 0, 0, '2019-10-25 01:39:07'),
(152, 14, 'Sibling Report', 'sibling_report', 1, 0, 0, 0, '2019-10-25 01:39:07'),
(153, 14, 'Homework Evaluation Report', 'homehork_evaluation_report', 1, 0, 0, 0, '2019-11-24 01:04:24'),
(154, 14, 'Student Profile', 'student_profile', 1, 0, 0, 0, '2019-10-25 01:39:07'),
(155, 14, 'Fees Statement', 'fees_statement', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(156, 14, 'Balance Fees Report', 'balance_fees_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(157, 14, 'Fees Collection Report', 'fees_collection_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(158, 14, 'Online Fees Collection Report', 'online_fees_collection_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(159, 14, 'Income Report', 'income_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(160, 14, 'Expense Report', 'expense_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(161, 14, 'PayRoll Report', 'payroll_report', 1, 0, 0, 0, '2019-10-31 00:23:22'),
(162, 14, 'Income Group Report', 'income_group_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(163, 14, 'Expense Group Report', 'expense_group_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(164, 14, 'Attendance Report', 'attendance_report', 1, 0, 0, 0, '2019-10-25 02:08:06'),
(165, 14, 'Staff Attendance Report', 'staff_attendance_report', 1, 0, 0, 0, '2019-10-25 02:08:06'),
(174, 14, 'Transport Report', 'transport_report', 1, 0, 0, 0, '2019-10-25 02:13:56'),
(175, 14, 'Hostel Report', 'hostel_report', 1, 0, 0, 0, '2019-11-27 06:51:53'),
(176, 14, 'Audit Trail Report', 'audit_trail_report', 1, 0, 0, 0, '2019-10-25 02:16:39'),
(177, 14, 'User Log', 'user_log', 1, 0, 0, 0, '2019-10-25 02:19:27'),
(178, 14, 'Book Issue Report', 'book_issue_report', 1, 0, 0, 0, '2019-10-25 02:29:04'),
(179, 14, 'Book Due Report', 'book_due_report', 1, 0, 0, 0, '2019-10-25 02:29:04'),
(180, 14, 'Book Inventory Report', 'book_inventory_report', 1, 0, 0, 0, '2019-10-25 02:29:04'),
(181, 14, 'Stock Report', 'stock_report', 1, 0, 0, 0, '2019-10-25 02:31:28'),
(182, 14, 'Add Item Report', 'add_item_report', 1, 0, 0, 0, '2019-10-25 02:31:28'),
(183, 14, 'Issue Item Report', 'issue_item_report', 1, 0, 0, 0, '2019-11-29 03:48:06'),
(185, 23, 'Online Examination', 'online_examination', 1, 1, 1, 1, '2019-11-23 23:54:50'),
(186, 23, 'Question Bank', 'question_bank', 1, 1, 1, 1, '2019-11-23 23:55:18'),
(187, 6, 'Exam Result', 'exam_result', 1, 0, 0, 0, '2019-11-23 23:58:50'),
(188, 7, 'Subject Group', 'subject_group', 1, 1, 1, 1, '2019-11-24 00:34:32'),
(189, 18, 'Teachers Rating', 'teachers_rating', 1, 0, 1, 1, '2019-11-24 03:12:54'),
(190, 22, 'Fees Awaiting Payment Widegts', 'fees_awaiting_payment_widegts', 1, 0, 0, 0, '2019-11-24 00:52:51'),
(191, 22, 'Conveted Leads Widegts', 'conveted_leads_widegts', 1, 0, 0, 0, '2019-11-24 00:58:24'),
(192, 22, 'Fees Overview Widegts', 'fees_overview_widegts', 1, 0, 0, 0, '2019-11-24 00:57:41'),
(193, 22, 'Enquiry Overview Widegts', 'enquiry_overview_widegts', 1, 0, 0, 0, '2019-12-02 05:06:09'),
(194, 22, 'Library Overview Widegts', 'book_overview_widegts', 1, 0, 0, 0, '2019-12-01 01:13:04'),
(195, 22, 'Student Today Attendance Widegts', 'today_attendance_widegts', 1, 0, 0, 0, '2019-12-03 04:57:45'),
(196, 6, 'Marks Import', 'marks_import', 1, 0, 0, 0, '2019-11-24 01:02:11'),
(197, 14, 'Student Attendance Type Report', 'student_attendance_type_report', 1, 0, 0, 0, '2019-11-24 01:06:32'),
(198, 14, 'Exam Marks Report', 'exam_marks_report', 1, 0, 0, 0, '2019-11-24 01:11:15'),
(200, 14, 'Online Exam Wise Report', 'online_exam_wise_report', 1, 0, 0, 0, '2019-11-24 01:18:14'),
(201, 14, 'Online Exams Report', 'online_exams_report', 1, 0, 0, 0, '2019-11-29 02:48:05'),
(202, 14, 'Online Exams Attempt Report', 'online_exams_attempt_report', 1, 0, 0, 0, '2019-11-29 02:46:24'),
(203, 14, 'Online Exams Rank Report', 'online_exams_rank_report', 1, 0, 0, 0, '2019-11-24 01:22:25'),
(204, 14, 'Staff Report', 'staff_report', 1, 0, 0, 0, '2019-11-24 01:25:27'),
(205, 6, 'Exam', 'exam', 1, 1, 1, 1, '2019-11-24 04:55:48'),
(207, 6, 'Exam Publish', 'exam_publish', 1, 0, 0, 0, '2019-11-24 05:15:04'),
(208, 6, 'Link Exam', 'link_exam', 1, 0, 1, 0, '2019-11-24 05:15:04'),
(210, 6, 'Assign / View student', 'exam_assign_view_student', 1, 0, 1, 0, '2019-11-24 05:15:04'),
(211, 6, 'Exam Subject', 'exam_subject', 1, 0, 1, 0, '2019-11-24 05:15:04'),
(212, 6, 'Exam Marks', 'exam_marks', 1, 0, 1, 0, '2019-11-24 05:15:04'),
(213, 15, 'Language Switcher', 'language_switcher', 1, 0, 0, 0, '2019-11-24 05:17:11'),
(214, 23, 'Add Questions in Exam ', 'add_questions_in_exam', 1, 0, 1, 0, '2019-11-28 01:38:57'),
(215, 15, 'Custom Fields', 'custom_fields', 1, 0, 0, 0, '2019-11-29 04:08:35'),
(216, 15, 'System Fields', 'system_fields', 1, 0, 0, 0, '2019-11-25 00:15:01'),
(217, 13, 'SMS', 'sms', 1, 0, 0, 0, '2018-06-22 10:40:54'),
(219, 14, 'Student / Period Attendance Report', 'student_period_attendance_report', 1, 0, 0, 0, '2019-11-29 02:19:31'),
(220, 14, 'Biometric Attendance Log', 'biometric_attendance_log', 1, 0, 0, 0, '2019-11-27 05:59:16'),
(221, 14, 'Book Issue Return Report', 'book_issue_return_report', 1, 0, 0, 0, '2019-11-27 06:30:23'),
(222, 23, 'Assign / View Student', 'online_assign_view_student', 1, 0, 1, 0, '2019-11-28 04:20:22'),
(223, 14, 'Rank Report', 'rank_report', 1, 0, 0, 0, '2019-11-29 02:30:21'),
(224, 25, 'Chat', 'chat', 1, 0, 0, 0, '2019-11-29 04:10:28'),
(226, 22, 'Income Donut Graph', 'income_donut_graph', 1, 0, 0, 0, '2019-11-29 05:00:33'),
(227, 22, 'Expense Donut Graph', 'expense_donut_graph', 1, 0, 0, 0, '2019-11-29 05:01:10'),
(228, 9, 'Import Book', 'import_book', 1, 0, 0, 0, '2019-11-29 06:21:01'),
(229, 22, 'Staff Present Today Widegts', 'staff_present_today_widegts', 1, 0, 0, 0, '2019-11-29 06:48:00'),
(230, 22, 'Student Present Today Widegts', 'student_present_today_widegts', 1, 0, 0, 0, '2019-11-29 06:47:42'),
(231, 26, 'Multi Class Student', 'multi_class_student', 1, 1, 1, 1, '2020-10-05 08:56:27'),
(232, 27, 'Online Admission', 'online_admission', 1, 0, 1, 1, '2019-12-02 06:11:10'),
(233, 15, 'Print Header Footer', 'print_header_footer', 1, 0, 0, 0, '2020-02-12 02:02:02'),
(234, 28, 'Manage Alumni', 'manage_alumni', 1, 1, 1, 1, '2020-06-02 03:15:46'),
(235, 28, 'Events', 'events', 1, 1, 1, 1, '2020-05-28 21:48:52'),
(236, 29, 'Manage Lesson Plan', 'manage_lesson_plan', 1, 1, 1, 0, '2020-05-28 22:17:37'),
(237, 29, 'Manage Syllabus Status', 'manage_syllabus_status', 1, 0, 1, 0, '2020-05-28 22:20:11'),
(238, 29, 'Lesson', 'lesson', 1, 1, 1, 1, '2020-05-28 22:20:11'),
(239, 29, 'Topic', 'topic', 1, 1, 1, 1, '2020-05-28 22:20:11'),
(240, 14, 'Syllabus Status Report', 'syllabus_status_report', 1, 0, 0, 0, '2020-05-28 23:17:54'),
(241, 14, 'Teacher Syllabus Status Report', 'teacher_syllabus_status_report', 1, 0, 0, 0, '2020-05-28 23:17:54'),
(242, 14, 'Alumni Report', 'alumni_report', 1, 0, 0, 0, '2020-06-07 23:59:54'),
(243, 15, 'Student Profile Update', 'student_profile_update', 1, 0, 0, 0, '2020-08-21 05:36:33'),
(244, 14, 'Student Gender Ratio Report', 'student_gender_ratio_report', 1, 0, 0, 0, '2020-08-22 12:37:51'),
(245, 14, 'Student Teacher Ratio Report', 'student_teacher_ratio_report', 1, 0, 0, 0, '2020-08-22 12:42:27'),
(246, 14, 'Daily Attendance Report', 'daily_attendance_report', 1, 0, 0, 0, '2020-08-22 12:43:16'),
(247, 23, 'Import Question', 'import_question', 1, 0, 0, 0, '2019-11-23 18:25:18'),
(248, 20, 'Staff ID Card', 'staff_id_card', 1, 1, 1, 1, '2018-07-06 10:41:28'),
(249, 20, 'Generate Staff ID Card', 'generate_staff_id_card', 1, 0, 0, 0, '2018-07-06 10:41:49'),
(250, 19, 'Daily Assignment', 'daily_assignment', 1, 0, 0, 0, '2022-03-02 07:28:23'),
(251, 6, 'Marks Division', 'marks_division', 1, 1, 1, 1, '2022-07-01 15:24:16'),
(252, 13, 'Schedule Email SMS Log', 'schedule_email_sms_log', 1, 0, 1, 0, '2022-07-09 11:25:16'),
(253, 13, 'Login Credentials Send', 'login_credentials_send', 1, 0, 0, 0, '2022-07-01 15:46:10'),
(254, 13, 'Email Template', 'email_template', 1, 1, 1, 1, '2022-07-01 15:46:10'),
(255, 13, 'SMS Template', 'sms_template', 1, 1, 1, 1, '2022-07-01 15:46:10'),
(256, 14, 'Balance Fees Report With Remark', 'balance_fees_report_with_remark', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(257, 14, 'Balance Fees Statement', 'balance_fees_statement', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(258, 14, 'Daily Collection Report', 'daily_collection_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(259, 11, 'Fees Master', 'transport_fees_master', 1, 0, 1, 0, '2022-07-05 09:29:19'),
(260, 11, 'Pickup Point', 'pickup_point', 1, 1, 1, 1, '2022-07-04 09:50:08'),
(261, 11, 'Route Pickup Point', 'route_pickup_point', 1, 1, 1, 1, '2022-07-04 09:50:08'),
(262, 11, 'Student Transport Fees', 'student_transport_fees', 1, 1, 1, 0, '2022-07-05 10:15:55'),
(263, 29, 'Comments', 'lesson_plan_comments', 1, 1, 0, 1, '2020-05-28 22:20:11'),
(264, 15, 'Sidebar Menu', 'sidebar_menu', 1, 0, 0, 0, '2022-07-11 12:01:17'),
(265, 15, 'Currency', 'currency', 1, 0, 0, 0, '2020-08-21 05:36:33'),
(266, 6, 'Exam Schedule', 'exam_schedule', 1, 0, 0, 0, '2019-11-23 23:58:50'),
(267, 6, 'Generate Rank', 'generate_rank', 1, 0, 0, 0, '2019-11-24 05:15:04'),
(268, 8, 'Content Type', 'content_type', 1, 1, 1, 1, '2022-07-08 05:18:54'),
(269, 8, 'Content Share List', 'content_share_list', 1, 0, 0, 1, '2022-07-08 05:18:58'),
(270, 8, 'Video Tutorial', 'video_tutorial', 1, 1, 1, 1, '2022-07-08 05:19:01'),
(271, 15, 'Currency Switcher', 'currency_switcher', 1, 0, 0, 0, '2019-11-24 05:17:11'),
(272, 2, 'Offline Bank Payments', 'offline_bank_payments', 1, 0, 0, 0, '2018-06-27 00:18:15'),
(273, 29, 'Copy Old Lessons', 'copy_old_lesson', 1, 0, 0, 0, '2020-05-28 22:20:11'),
(6001, 600, 'Live Classes', 'gmeet_live_classes', 1, 1, 0, 1, '2020-09-22 10:03:29'),
(6002, 600, 'Live Meeting', 'gmeet_live_meeting', 1, 1, 0, 1, '2020-09-22 10:03:44'),
(6003, 600, 'Live Meeting Report', 'gmeet_live_meeting_report', 1, 0, 0, 0, '2020-09-22 10:03:57'),
(6004, 600, 'Live Classes Report', 'gmeet_live_classes_report', 1, 0, 0, 0, '2020-09-22 10:04:08'),
(6005, 600, 'Setting', 'gmeet_setting', 1, 0, 1, 0, '2020-09-22 10:04:08'),
(7001, 700, 'Online Course', 'online_course', 1, 1, 1, 1, '2019-11-23 18:25:18'),
(7002, 700, 'Course Publish', 'course_publish', 1, 0, 0, 0, '2019-11-23 18:25:18'),
(7003, 700, 'Course Section', 'online_course_section', 1, 1, 1, 1, '2021-05-17 05:26:33'),
(7004, 700, 'Course Lesson', 'online_course_lesson', 1, 1, 1, 1, '2021-05-17 05:26:24'),
(7005, 700, 'Course Quiz', 'online_course_quiz', 1, 1, 1, 1, '2021-05-17 05:26:20'),
(7006, 700, 'Offline Payment', 'online_course_offline_payment', 1, 1, 0, 0, '2021-05-17 05:26:17'),
(7007, 700, 'Student Course Purchase Report', 'student_course_purchase_report', 1, 0, 0, 0, '2021-05-17 05:25:56'),
(7008, 700, 'Course Sell Count Report', 'course_sell_count_report', 1, 0, 0, 0, '2021-05-17 05:25:52'),
(7009, 700, 'Course Trending Report', 'course_trending_report', 1, 0, 0, 0, '2021-05-17 05:25:49'),
(7010, 700, 'Course Complete Report', 'course_complete_report', 1, 0, 0, 0, '2021-05-17 05:25:42'),
(7011, 700, 'Setting', 'online_course_setting', 1, 0, 0, 0, '2021-05-17 05:25:37'),
(7012, 700, 'Course Rating Report', 'course_rating_report', 1, 0, 0, 1, '2022-06-14 11:24:57'),
(7013, 700, 'Guest Report', 'guest_report', 1, 0, 1, 1, '2022-06-14 11:33:09'),
(7014, 700, 'Course Category', 'course_category', 1, 1, 1, 1, '2019-11-23 18:25:18'),
(7015, 6, 'Gererate Result', 'gererate_result', 1, 1, 1, 1, '2023-10-05 05:16:27'),
(7016, 5, 'Student Behavior', 'student_behavior', 1, 1, 1, 1, '2023-10-05 05:16:27'),
(7017, 7, 'Assign Subject Teacher', 'assign_subject_teacher', 1, 1, 1, 1, '2024-01-20 11:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `permission_group`
--

CREATE TABLE `permission_group` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) NOT NULL,
  `is_active` int(11) DEFAULT 0,
  `system` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `permission_group`
--

INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES
(1, 'Student Information', 'student_information', 1, 1, '2019-03-15 09:30:22'),
(2, 'Fees Collection', 'fees_collection', 1, 0, '2020-06-11 00:51:35'),
(3, 'Income', 'income', 1, 0, '2020-06-01 01:57:39'),
(4, 'Expense', 'expense', 1, 0, '2019-03-15 09:06:22'),
(5, 'Student Attendance', 'student_attendance', 1, 0, '2018-07-02 07:48:08'),
(6, 'Examination', 'examination', 1, 0, '2018-07-11 02:49:08'),
(7, 'Academics', 'academics', 1, 1, '2018-07-02 07:25:43'),
(8, 'Download Center', 'download_center', 1, 0, '2018-07-02 07:49:29'),
(9, 'Library', 'library', 1, 0, '2018-06-28 11:13:14'),
(10, 'Inventory', 'inventory', 1, 0, '2018-06-27 00:48:58'),
(11, 'Transport', 'transport', 1, 0, '2018-06-27 07:51:26'),
(12, 'Hostel', 'hostel', 1, 0, '2018-07-02 07:49:32'),
(13, 'Communicate', 'communicate', 1, 0, '2018-07-02 07:50:00'),
(14, 'Reports', 'reports', 1, 1, '2018-06-27 03:40:22'),
(15, 'System Settings', 'system_settings', 1, 1, '2018-06-27 03:40:28'),
(16, 'Front CMS', 'front_cms', 1, 0, '2018-07-10 05:16:54'),
(17, 'Front Office', 'front_office', 1, 0, '2018-06-27 03:45:30'),
(18, 'Human Resource', 'human_resource', 1, 1, '2018-06-27 03:41:02'),
(19, 'Homework', 'homework', 1, 0, '2018-06-27 00:49:38'),
(20, 'Certificate', 'certificate', 1, 0, '2018-06-27 07:51:29'),
(21, 'Calendar To Do List', 'calendar_to_do_list', 1, 0, '2019-03-15 09:06:25'),
(22, 'Dashboard and Widgets', 'dashboard_and_widgets', 1, 1, '2018-06-27 03:41:17'),
(23, 'Online Examination', 'online_examination', 1, 0, '2020-06-01 02:25:36'),
(25, 'Chat', 'chat', 1, 0, '2019-11-23 23:54:04'),
(26, 'Multi Class', 'multi_class', 1, 0, '2019-11-27 12:14:14'),
(27, 'Online Admission', 'online_admission', 1, 0, '2019-11-27 02:42:13'),
(28, 'Alumni', 'alumni', 1, 0, '2020-05-29 00:26:38'),
(29, 'Lesson Plan', 'lesson_plan', 1, 0, '2020-06-07 05:38:30'),
(600, 'Gmeet Live Classes', 'gmeet_live_classes', 1, 0, '2020-11-12 13:37:03'),
(700, 'Online Course', 'online_course', 1, 0, '2021-05-15 11:35:53');

-- --------------------------------------------------------

--
-- Table structure for table `permission_student`
--

CREATE TABLE `permission_student` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) NOT NULL,
  `system` int(11) NOT NULL,
  `student` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `permission_student`
--

INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES
(1, 'Fees', 'fees', 0, 1, 1, 2, '2020-06-11 00:51:35'),
(2, 'Class Timetable', 'class_timetable', 1, 1, 1, 7, '2020-05-30 19:57:50'),
(3, 'Homework', 'homework', 0, 1, 1, 19, '2020-06-01 02:49:14'),
(4, 'Download Center', 'download_center', 0, 1, 1, 8, '2020-06-01 02:52:49'),
(5, 'Attendance', 'attendance', 0, 1, 1, 5, '2020-06-01 02:57:18'),
(7, 'Examinations', 'examinations', 0, 1, 1, 6, '2020-06-01 02:59:50'),
(8, 'Notice Board', 'notice_board', 0, 1, 1, 13, '2020-06-01 03:00:35'),
(11, 'Library', 'library', 0, 1, 1, 9, '2020-06-01 03:02:37'),
(12, 'Transport Routes', 'transport_routes', 0, 1, 1, 11, '2020-06-01 03:51:30'),
(13, 'Hostel Rooms', 'hostel_rooms', 0, 1, 1, 12, '2020-06-01 03:52:27'),
(14, 'Calendar To Do List', 'calendar_to_do_list', 0, 1, 1, 21, '2020-06-01 03:53:18'),
(15, 'Online Examination', 'online_examination', 0, 1, 1, 23, '2020-06-11 05:20:01'),
(16, 'Teachers Rating', 'teachers_rating', 0, 1, 1, NULL, '2022-12-28 09:52:28'),
(17, 'Chat', 'chat', 0, 1, 1, 25, '2020-06-01 04:53:06'),
(18, 'Multi Class', 'multi_class', 1, 1, 1, 26, '2020-05-30 19:56:52'),
(19, 'Lesson Plan', 'lesson_plan', 0, 0, 1, 29, '2023-06-25 09:12:38'),
(20, 'Syllabus Status', 'syllabus_status', 0, 1, 1, 29, '2020-06-07 05:38:30'),
(23, 'Apply Leave', 'apply_leave', 0, 1, 1, NULL, '2022-12-28 09:52:28'),
(24, 'Visitor Book', 'visitor_book', 0, 1, 1, NULL, '2022-10-10 11:45:18'),
(25, 'Student Timeline', 'student_timeline', 0, 1, 1, NULL, '2022-10-11 04:50:29'),
(600, 'Gmeet Live Classes ', 'gmeet_live_classes', 0, 1, 1, 600, '2020-11-12 13:37:03'),
(700, 'Online Course', 'online_course', 0, 1, 1, 700, '2021-05-15 11:35:53');

-- --------------------------------------------------------

--
-- Table structure for table `permotion_settings`
--

CREATE TABLE `permotion_settings` (
  `id` int(11) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `min_score` float DEFAULT NULL,
  `max_score` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permotion_settings`
--

INSERT INTO `permotion_settings` (`id`, `message`, `min_score`, `max_score`) VALUES
(15, 'hey', 11, 12);

-- --------------------------------------------------------

--
-- Table structure for table `pickup_point`
--

CREATE TABLE `pickup_point` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `print_headerfooter`
--

CREATE TABLE `print_headerfooter` (
  `id` int(11) NOT NULL,
  `print_type` varchar(255) NOT NULL,
  `header_image` varchar(255) NOT NULL,
  `footer_content` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `entry_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `print_headerfooter`
--

INSERT INTO `print_headerfooter` (`id`, `print_type`, `header_image`, `footer_content`, `created_by`, `entry_date`, `created_at`) VALUES
(1, 'staff_payslip', '1687995397-1465094643649cc405f1c8a!heading.png', 'This payslip is computer generated hence no signature is required.', 1, '2023-06-28 23:36:38', '2022-12-28 09:52:24'),
(2, 'student_receipt', '1687995383-1963528168649cc3f70ea85!heading.png', 'This receipt is computer generated hence no signature is required.', 1, '2023-06-28 23:36:23', '2022-12-28 09:52:24'),
(3, 'online_admission_receipt', '1687995409-1262501296649cc4116c68b!heading.png', '', 1, '2023-06-28 23:36:49', '2022-12-28 09:52:24'),
(4, 'online_exam', '1687995346-1515312479649cc3d214c97!heading.png', '                                                This receipt is for online exam computer  generated hence no signature is required.                                            ', 1, '2023-06-28 23:35:46', '2022-09-08 17:28:34');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `question_type` varchar(100) NOT NULL,
  `level` varchar(10) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `opt_a` text DEFAULT NULL,
  `opt_b` text DEFAULT NULL,
  `opt_c` text DEFAULT NULL,
  `opt_d` text DEFAULT NULL,
  `opt_e` text DEFAULT NULL,
  `correct` text DEFAULT NULL,
  `descriptive_word_limit` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `staff_id`, `subject_id`, `question_type`, `level`, `class_id`, `section_id`, `class_section_id`, `question`, `opt_a`, `opt_b`, `opt_c`, `opt_d`, `opt_e`, `correct`, `descriptive_word_limit`, `created_at`, `updated_at`) VALUES
(3, 1, 7, 'true_false', 'medium', 2, 2, NULL, 'yeh maine sab pehle add kea', '', '', '', '', '', 'true', 0, '2024-10-15 21:54:14', NULL),
(4, 1, 6, 'true_false', 'high', 2, 2, NULL, 'or yeh maine bad me', '', '', '', '', '', 'true', 0, '2024-10-15 21:54:47', NULL),
(5, 1, 7, 'true_false', 'medium', 2, 2, NULL, 'sab se last me kea', '', '', '', '', '', 'true', 0, '2024-10-15 22:07:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `read_notification`
--

CREATE TABLE `read_notification` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reference`
--

CREATE TABLE `reference` (
  `id` int(11) NOT NULL,
  `reference` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `s_id` int(11) DEFAULT NULL,
  `session` varchar(10) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `terms` varchar(20) DEFAULT NULL,
  `permotional_statment` varchar(255) DEFAULT NULL,
  `following_instructions` varchar(20) DEFAULT NULL,
  `working_independently` varchar(20) DEFAULT NULL,
  `disturbing_others` varchar(20) DEFAULT NULL,
  `does_next_work_in_class` varchar(20) DEFAULT NULL,
  `take_care_of_materials` varchar(20) DEFAULT NULL,
  `completion_of_work` varchar(20) DEFAULT NULL,
  `finished_work_on_time` varchar(20) DEFAULT NULL,
  `puncatuality` varchar(20) DEFAULT NULL,
  `persional_cleanliness` varchar(20) DEFAULT NULL,
  `assignments` varchar(20) DEFAULT NULL,
  `regularity` varchar(20) DEFAULT NULL,
  `ganeral_conduct` varchar(20) DEFAULT NULL,
  `class_teacher_remarks` varchar(255) DEFAULT NULL,
  `class_teacher_name` varchar(255) DEFAULT NULL,
  `head_teacher_remarks` varchar(255) DEFAULT NULL,
  `school_resumes` varchar(20) DEFAULT NULL,
  `Type` int(11) NOT NULL DEFAULT 1 COMMENT '1 is result 2 rupload result',
  `file_url` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `s_id`, `session`, `class_id`, `class`, `terms`, `permotional_statment`, `following_instructions`, `working_independently`, `disturbing_others`, `does_next_work_in_class`, `take_care_of_materials`, `completion_of_work`, `finished_work_on_time`, `puncatuality`, `persional_cleanliness`, `assignments`, `regularity`, `ganeral_conduct`, `class_teacher_remarks`, `class_teacher_name`, `head_teacher_remarks`, `school_resumes`, `Type`, `file_url`, `created_at`, `updated_at`) VALUES
(1, 19, '2023-24', 3, 'JSS 3', '1st Term', '1st Term', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 1, NULL, '2024-03-31 00:30:46', NULL),
(2, 19, '2023-24', 3, 'JSS 3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1711845177-1263215996608af396b6a0!rose.PNG', '2024-03-31 00:32:57', NULL),
(3, 19, '2023-24', 3, 'JSS 3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1711845222-16122576186608af66d1cd0!Capture.PNG', '2024-03-31 00:33:42', NULL),
(4, 19, '2023-24', 3, 'JSS 3', '3rd Term', '3rd', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'GoodGood', 'Good', 'Good', 'Good', 'Good', 'Good', 1, NULL, '2024-04-01 23:42:35', NULL),
(5, 19, '2023-24', 3, 'JSS 3', '2nd Term', '2nd Term', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 1, NULL, '2024-04-03 00:32:03', NULL),
(6, 39, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1724619713-17655971166cb9bc179e00!IMG_5900.JPG', '2024-08-25 21:01:53', NULL),
(7, 39, '2023-24', 1, 'JSS 1', '1st Term', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 1, NULL, '2024-08-25 21:03:32', NULL),
(8, 20, '2023-24', 1, 'JSS 1', '1st Term', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 1, NULL, '2024-09-30 23:36:31', NULL),
(9, 21, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729037520-1693157601670f04d0642cc!f4248250-4784-49db-a27c-8b9ba3cbc54f.png', '2024-10-16 00:12:00', NULL),
(10, 21, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729038311-1055656034670f07e7a6230!index.html', '2024-10-16 00:25:11', NULL),
(11, 38, '2023-24', 1, 'JSS 1', '1st Term', '321', '321', '321', '321', '321', '321', '321', '321', '321', '321', '321', '321', '321', '321', '321', '321', '321', 1, NULL, '2024-10-16 23:34:29', NULL),
(12, 38, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729121706-83595263167104daa6b430!index.html', '2024-10-16 23:35:06', NULL),
(13, 21, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729121970-149946062667104eb27ce6f!about.html', '2024-10-16 23:39:30', NULL),
(14, 21, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/', '2024-10-16 23:40:51', NULL),
(15, 21, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729122065-45763316767104f112a3ad!f4248250-4784-49db-a27c-8b9ba3cbc54f.png', '2024-10-16 23:41:05', NULL),
(16, 21, '2023-24', 1, 'JSS 1', '1st Term', '22', '22', '22', '22', '22', '22', '22', '22', '22', '22', '22', '22', '22', '22', '22', '22', '22', 1, NULL, '2024-10-16 23:48:54', NULL),
(17, 21, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729122611-759386966671051332751f!f4248250-4784-49db-a27c-8b9ba3cbc54f.png', '2024-10-16 23:50:11', NULL),
(18, 26, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729122715-15417516686710519b32832!f4248250-4784-49db-a27c-8b9ba3cbc54f.png', '2024-10-16 23:51:55', NULL),
(19, 20, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729199617-97533939267117e01486a9!f4248250-4784-49db-a27c-8b9ba3cbc54f.png', '2024-10-17 21:13:37', NULL),
(20, 20, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/', '2024-10-17 21:14:47', NULL),
(21, 20, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729199715-187548268767117e6302b59!Generate Result.html', '2024-10-17 21:15:15', NULL),
(22, 20, '2023-24', 1, 'JSS 1', '2nd Term', '465', '465', '465', '465', '465', '465', '465', '465', '465', '465', '465', '465', '465', '465', '465', '465', '465', 1, NULL, '2024-10-17 21:16:28', NULL),
(23, 37, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729271212-1133690975671295acc9bd4!Generate Result.html', '2024-10-18 17:06:52', NULL),
(24, 39, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729271268-843134402671295e4146b6!Landing_Page.jpg', '2024-10-18 17:07:48', NULL),
(25, 39, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729271348-18290856496712963440ae2!Generate Result.html', '2024-10-18 17:09:08', NULL),
(26, 39, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729271496-238690918671296c8e8995!Eating Habits Quiz (11).pdf', '2024-10-18 17:11:36', NULL),
(27, 39, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729271531-621807781671296eb932c6!UX.docx', '2024-10-18 17:12:11', NULL),
(28, 39, '2023-24', 1, 'JSS 1', '2nd Term', '768776877687', '7687', '76877687', '7687', '768776877687', '768776877687', '768776877687', '7687768776877687', '7687768776877687', '76877687', '7687768776877687', '7687768776877687', '7687768776877687', '76877687', '768776877687', '76877687', '76877687768776877687', 1, NULL, '2024-10-18 17:18:59', NULL),
(29, 39, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729532066-1636328913671690a2ac1c5!f4248250-4784-49db-a27c-8b9ba3cbc54f.png', '2024-10-21 17:34:26', NULL),
(30, 37, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729545356-3887451416716c48c1d9c9!WhatsApp Image 2024-10-08 at 02.57.12_dd4f4f3e.jpg', '2024-10-21 21:15:56', NULL),
(31, 37, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729545422-1071849906716c4ce791eb!report.png', '2024-10-21 21:17:02', NULL),
(32, 38, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729545991-2699548716716c70726c0a!report.png', '2024-10-21 21:26:31', NULL),
(33, 29, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729553702-6265230176716e526c11e0!a9414b76-3e5d-4b77-aafe-0f02b805e2f2.png', '2024-10-21 23:35:02', NULL),
(34, 35, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729557456-18068672106716f3d036122!yutresult.png', '2024-10-22 00:37:36', NULL),
(35, 34, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729557551-18839495756716f42fa34b8!yutresult.png', '2024-10-22 00:39:11', NULL),
(36, 34, '2023-24', 1, 'JSS 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729560889-639069909671701393c041!yutresult.png', '2024-10-22 01:34:49', NULL),
(37, 35, '2023-24', 1, 'JSS 1', '2nd Term', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729561241-17678585746717029976700!1729031080556-1f29e9dc-37c0-4cf9-809d-d307ff15c3cb_1.jpg', '2024-10-22 01:40:41', NULL),
(38, 33, '2023-24', 1, 'JSS 1', '1st Term', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729627512-36614019667180578cf7eb!report.png', '2024-10-22 20:05:12', NULL),
(39, 33, '2023-24', 1, 'JSS 1', '1st Term', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729627545-206812791467180599488a9!yutresult.png', '2024-10-22 20:05:45', NULL),
(40, 36, '2023-24', 1, 'JSS 1', '1st Term', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1729633024-27550528167181b004fb49!report.png', '2024-10-22 21:37:04', NULL),
(41, 39, '2023-24', 1, 'JSS 1', '1st Term', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1731434354-12391781396733977254004!report.png', '2024-11-12 17:59:14', NULL),
(42, 39, '2023-24', 1, 'JSS 1', '1st Term', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1731434447-1225403399673397cf88bf1!report.png', '2024-11-12 18:00:47', NULL),
(43, 39, '2023-24', 1, 'JSS 1', '1st Term', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/student_documents/result_doc/1731434693-1846540813673398c56f1f5!WhatsApp_Image_2024-10-09_at_12.52.43_AM.jpg', '2024-11-12 18:04:53', NULL),
(44, 39, '2023-24', 1, 'JSS 1', '3rd Term', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 1, NULL, '2024-11-28 21:14:08', NULL),
(45, 33, '2023-24', 1, 'JSS 1', '2nd Term', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 1, NULL, '2024-11-28 21:22:41', NULL),
(46, 34, '2023-24', 1, 'JSS 1', '3rd Term', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 1, NULL, '2024-11-28 21:24:06', NULL),
(47, 36, '2023-24', 1, 'JSS 1', '3rd Term', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 1, NULL, '2024-11-28 21:49:19', NULL),
(48, 37, '2023-24', 1, 'JSS 1', '3rd Term', 'PASS FAIL', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABCABC', 'ABC', 'ABC', 'ABC', 'ABC', 1, NULL, '2024-11-28 22:31:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `result_details`
--

CREATE TABLE `result_details` (
  `id` int(11) NOT NULL,
  `r_id` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `assessment_0` int(11) DEFAULT NULL,
  `assessment_1` int(11) DEFAULT NULL,
  `assessment_2` int(11) DEFAULT NULL,
  `assessment_3` int(11) DEFAULT NULL,
  `exams` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `result_details`
--

INSERT INTO `result_details` (`id`, `r_id`, `subject`, `assessment_0`, `assessment_1`, `assessment_2`, `assessment_3`, `exams`) VALUES
(1, 1, 'ENGLISH', 20, 18, 0, 0, 55),
(2, 1, 'MATHEMATICS', 18, 19, 0, 0, 50),
(3, 1, 'SENSORIAL', 20, 17, 0, 0, 58),
(4, 1, 'PRACTICAL', 17, 20, 0, 0, 56),
(5, 1, 'LIT IN ENG', 20, 19, 0, 0, 57),
(6, 4, 'ENGLISH', 20, 17, 0, 0, 50),
(7, 4, 'MATHEMATICS', 20, 17, 0, 0, 50),
(8, 4, 'SENSORIAL', 20, 17, 0, 0, 50),
(9, 4, 'PRACTICAL', 20, 17, 0, 0, 50),
(10, 4, 'LIT IN ENG', 0, 0, 0, 0, 0),
(11, 5, 'ENGLISH', 12, 20, 0, 0, 50),
(12, 5, 'MATHEMATICS', 14, 16, 0, 0, 55),
(13, 5, 'SENSORIAL', 0, 0, 0, 0, 0),
(14, 5, 'PRACTICAL', 0, 0, 0, 0, 0),
(15, 5, 'LIT IN ENG', 0, 0, 0, 0, 0),
(16, 7, 'Maths', 20, 20, 0, 0, 50),
(17, 7, 'English', 12, 11, 0, 0, 59),
(18, 7, 'Biology', 18, 17, 0, 0, 45),
(19, 8, 'Maths', 1, 2, 0, 0, 1),
(20, 8, 'English', 1, 2, 0, 0, 3),
(21, 8, 'Biology', 1, 3, 0, 0, 3),
(22, 11, 'Maths', 321, 321, 0, 0, 321),
(23, 11, 'English', 321, 321, 0, 0, 321),
(24, 11, 'Biology', 321, 321, 0, 0, 321),
(25, 16, 'Maths', 22, 22, 0, 0, 22),
(26, 16, 'English', 22, 22, 0, 0, 22),
(27, 16, 'Biology', 22, 22, 0, 0, 22),
(28, 22, 'Maths', 465, 465465, 0, 0, 465),
(29, 22, 'English', 465, 465, 0, 0, 465),
(30, 22, 'Biology', 465, 465, 0, 0, 465),
(31, 28, 'Maths', 7687, 76877687, 0, 0, 7687),
(32, 28, 'English', 7687, 76877687, 0, 0, 76877687),
(33, 28, 'Biology', 76877687, 7687, 0, 0, 2147483647),
(34, 44, 'Maths', 1, 1, 0, 0, 1),
(35, 44, 'English', 1, 1, 0, 0, 1),
(36, 44, 'Biology', 1, 1, 0, 0, 1),
(37, 45, 'Maths', 1, 1, 0, 0, 1),
(38, 45, 'English', 1, 1, 0, 0, 1),
(39, 45, 'Biology', 1, 1, 0, 0, 1),
(40, 46, 'Maths', 1, 1, 0, 0, 1),
(41, 46, 'English', 1, 1, 0, 0, 1),
(42, 46, 'Biology', 1, 1, 0, 0, 1),
(43, 47, 'Maths', 1, 1, 0, 0, 1),
(44, 47, 'English', 1, 1, 0, 0, 1),
(45, 47, 'Biology', 1, 1, 0, 0, 1),
(46, 48, 'Maths', 1, 2, 0, 0, 1),
(47, 48, 'English', 1, 2, 0, 0, 1),
(48, 48, 'Biology', 1, 2, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(150) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `is_system` int(11) NOT NULL DEFAULT 0,
  `is_superadmin` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, 0, 1, 0, '2018-06-30 15:39:11', '0000-00-00'),
(2, 'Teacher', NULL, 0, 1, 0, '2018-06-30 15:39:14', '0000-00-00'),
(3, 'Accountant', NULL, 0, 1, 0, '2018-06-30 15:39:17', '0000-00-00'),
(4, 'Librarian', NULL, 0, 1, 0, '2018-06-30 15:39:21', '0000-00-00'),
(6, 'Receptionist', NULL, 0, 1, 0, '2018-07-02 05:39:03', '0000-00-00'),
(7, 'Super Admin', NULL, 0, 1, 1, '2018-07-11 14:11:29', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `roles_permissions`
--

CREATE TABLE `roles_permissions` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `perm_cat_id` int(11) DEFAULT NULL,
  `can_view` int(11) DEFAULT NULL,
  `can_add` int(11) DEFAULT NULL,
  `can_edit` int(11) DEFAULT NULL,
  `can_delete` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `roles_permissions`
--

INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES
(11, 1, 78, 1, 1, 1, 1, '2018-07-03 00:49:43'),
(23, 1, 12, 1, 1, 1, 1, '2018-07-06 09:45:38'),
(24, 1, 13, 1, 1, 1, 1, '2018-07-06 09:48:28'),
(26, 1, 15, 1, 1, 1, 0, '2019-11-27 23:47:28'),
(31, 1, 21, 1, 0, 1, 0, '2019-11-26 04:51:15'),
(34, 1, 24, 1, 1, 1, 1, '2019-11-28 06:35:20'),
(43, 1, 32, 1, 1, 1, 1, '2018-07-06 10:22:05'),
(44, 1, 33, 1, 1, 1, 1, '2018-07-06 10:22:29'),
(45, 1, 34, 1, 1, 1, 1, '2018-07-06 10:23:59'),
(46, 1, 35, 1, 1, 1, 1, '2018-07-06 10:24:34'),
(47, 1, 104, 1, 1, 1, 1, '2018-07-06 10:23:08'),
(48, 1, 37, 1, 1, 1, 1, '2018-07-06 10:25:30'),
(49, 1, 38, 1, 1, 1, 1, '2018-07-09 05:15:27'),
(61, 1, 55, 1, 1, 1, 1, '2018-07-02 09:24:16'),
(67, 1, 61, 1, 1, 0, 1, '2018-07-09 05:59:19'),
(68, 1, 62, 1, 1, 0, 1, '2018-07-09 05:59:19'),
(69, 1, 63, 1, 1, 0, 1, '2018-07-09 03:51:38'),
(70, 1, 64, 1, 1, 1, 1, '2018-07-09 03:02:19'),
(71, 1, 65, 1, 1, 1, 1, '2018-07-09 03:11:21'),
(72, 1, 66, 1, 1, 1, 1, '2018-07-09 03:13:09'),
(73, 1, 67, 1, 1, 1, 1, '2018-07-09 03:14:47'),
(74, 1, 79, 1, 1, 0, 1, '2019-11-30 01:32:51'),
(75, 1, 80, 1, 1, 1, 1, '2018-07-06 09:41:23'),
(76, 1, 81, 1, 1, 1, 1, '2018-07-06 09:41:23'),
(78, 1, 83, 1, 1, 1, 1, '2018-07-06 09:41:23'),
(79, 1, 84, 1, 1, 1, 1, '2018-07-06 09:41:23'),
(80, 1, 85, 1, 1, 1, 1, '2018-07-12 00:16:00'),
(94, 1, 82, 1, 1, 1, 1, '2018-07-06 09:41:23'),
(120, 1, 39, 1, 1, 1, 1, '2018-07-06 10:26:28'),
(156, 1, 9, 1, 1, 1, 1, '2019-11-27 23:45:46'),
(157, 1, 10, 1, 1, 1, 1, '2019-11-27 23:45:46'),
(159, 1, 40, 1, 1, 1, 1, '2019-11-30 00:49:39'),
(160, 1, 41, 1, 1, 1, 1, '2019-12-02 05:43:41'),
(161, 1, 42, 1, 1, 1, 1, '2019-11-30 00:49:39'),
(169, 1, 27, 1, 1, 0, 1, '2019-11-29 06:15:37'),
(178, 1, 54, 1, 0, 1, 0, '2018-07-05 09:09:22'),
(179, 1, 56, 1, 0, 1, 0, '2019-11-30 00:49:54'),
(180, 1, 57, 1, 0, 1, 0, '2019-11-30 01:32:51'),
(181, 1, 58, 1, 0, 1, 0, '2019-11-30 01:32:51'),
(182, 1, 59, 1, 0, 1, 0, '2019-11-30 01:32:51'),
(183, 1, 60, 1, 0, 1, 0, '2019-11-30 00:59:57'),
(201, 1, 14, 1, 0, 0, 0, '2018-07-02 11:22:03'),
(204, 1, 26, 1, 0, 0, 0, '2018-07-02 11:32:05'),
(206, 1, 29, 1, 0, 0, 0, '2018-07-02 11:43:54'),
(207, 1, 30, 1, 0, 0, 0, '2018-07-02 11:43:54'),
(208, 1, 31, 1, 1, 1, 1, '2019-11-30 01:32:51'),
(222, 1, 1, 1, 1, 1, 1, '2019-11-27 22:55:06'),
(307, 1, 126, 1, 0, 0, 0, '2018-07-03 09:26:13'),
(315, 1, 123, 1, 0, 0, 0, '2018-07-03 10:27:03'),
(369, 1, 102, 1, 1, 1, 1, '2019-12-02 05:02:15'),
(435, 1, 96, 1, 1, 1, 1, '2018-07-09 01:03:54'),
(461, 1, 97, 1, 0, 0, 0, '2018-07-09 01:00:16'),
(464, 1, 86, 1, 1, 1, 1, '2019-11-28 06:39:19'),
(474, 1, 130, 1, 1, 0, 1, '2018-07-09 10:56:36'),
(476, 1, 131, 1, 0, 0, 0, '2018-07-09 04:53:32'),
(557, 6, 82, 1, 1, 1, 1, '2019-12-01 01:48:28'),
(558, 6, 83, 1, 1, 1, 1, '2019-12-01 01:49:08'),
(559, 6, 84, 1, 1, 1, 1, '2019-12-01 01:49:59'),
(575, 6, 44, 1, 0, 0, 0, '2018-07-10 07:35:33'),
(576, 6, 46, 1, 0, 0, 0, '2018-07-10 07:35:33'),
(578, 6, 102, 1, 1, 1, 1, '2019-12-01 01:52:27'),
(625, 1, 28, 1, 1, 1, 1, '2019-11-29 06:19:18'),
(634, 4, 102, 1, 1, 1, 1, '2019-12-01 01:03:00'),
(669, 1, 145, 1, 0, 0, 0, '2019-11-26 04:51:15'),
(677, 1, 153, 1, 0, 0, 0, '2019-11-01 02:28:24'),
(720, 1, 216, 1, 0, 0, 0, '2019-11-26 05:24:12'),
(728, 1, 185, 1, 1, 1, 1, '2019-11-28 02:50:33'),
(729, 1, 186, 1, 1, 1, 1, '2019-11-28 02:49:07'),
(730, 1, 214, 1, 0, 1, 0, '2019-11-28 01:47:53'),
(732, 1, 198, 1, 0, 0, 0, '2019-11-26 05:24:30'),
(734, 1, 200, 1, 0, 0, 0, '2019-11-26 05:24:30'),
(735, 1, 201, 1, 0, 0, 0, '2019-11-26 05:24:30'),
(736, 1, 202, 1, 0, 0, 0, '2019-11-26 05:24:30'),
(737, 1, 203, 1, 0, 0, 0, '2019-11-26 05:24:30'),
(747, 1, 2, 1, 0, 0, 0, '2019-11-27 22:56:08'),
(748, 1, 3, 1, 1, 1, 1, '2019-11-27 22:56:32'),
(749, 1, 4, 1, 1, 1, 1, '2019-11-27 22:56:48'),
(751, 1, 128, 0, 1, 0, 1, '2019-11-27 22:57:01'),
(754, 1, 134, 1, 1, 1, 1, '2019-11-27 23:18:21'),
(755, 1, 5, 1, 1, 0, 1, '2019-11-27 23:35:07'),
(756, 1, 6, 1, 0, 0, 0, '2019-11-27 23:35:25'),
(757, 1, 7, 1, 1, 1, 1, '2019-11-27 23:36:35'),
(758, 1, 8, 1, 1, 1, 1, '2019-11-27 23:37:27'),
(760, 1, 68, 1, 0, 0, 0, '2019-11-27 23:38:06'),
(761, 1, 69, 1, 1, 1, 1, '2019-11-27 23:39:06'),
(762, 1, 70, 1, 1, 1, 1, '2019-11-27 23:39:41'),
(763, 1, 71, 1, 0, 0, 0, '2019-11-27 23:39:59'),
(765, 1, 73, 1, 0, 0, 0, '2019-11-27 23:43:15'),
(766, 1, 74, 1, 0, 0, 0, '2019-11-27 23:43:55'),
(768, 1, 11, 1, 0, 0, 0, '2019-11-27 23:45:46'),
(769, 1, 122, 1, 0, 0, 0, '2019-11-27 23:52:43'),
(771, 1, 136, 1, 0, 0, 0, '2019-11-27 23:55:36'),
(772, 1, 20, 1, 1, 1, 1, '2019-11-28 04:06:44'),
(773, 1, 137, 1, 1, 1, 1, '2019-11-28 00:46:14'),
(774, 1, 141, 1, 1, 1, 1, '2019-11-28 00:59:42'),
(775, 1, 142, 1, 0, 0, 0, '2019-11-27 23:56:12'),
(776, 1, 143, 1, 1, 1, 1, '2019-11-28 00:59:42'),
(777, 1, 144, 1, 0, 0, 0, '2019-11-27 23:56:12'),
(778, 1, 187, 1, 0, 0, 0, '2019-11-27 23:56:12'),
(779, 1, 196, 1, 0, 0, 0, '2019-11-27 23:56:12'),
(781, 1, 207, 1, 0, 0, 0, '2019-11-27 23:56:12'),
(782, 1, 208, 1, 0, 1, 0, '2019-11-28 00:10:22'),
(783, 1, 210, 1, 0, 1, 0, '2019-11-28 00:34:40'),
(784, 1, 211, 1, 0, 1, 0, '2019-11-28 00:38:23'),
(785, 1, 212, 1, 0, 1, 0, '2019-11-28 00:42:15'),
(786, 1, 205, 1, 1, 1, 1, '2019-11-28 00:42:15'),
(787, 1, 222, 1, 0, 1, 0, '2019-11-28 01:36:36'),
(788, 1, 77, 1, 1, 1, 1, '2019-11-28 06:22:10'),
(789, 1, 188, 1, 1, 1, 1, '2019-11-28 06:26:16'),
(790, 1, 23, 1, 1, 1, 1, '2019-11-28 06:34:20'),
(791, 1, 25, 1, 1, 1, 1, '2019-11-28 06:36:20'),
(792, 1, 127, 1, 0, 0, 0, '2019-11-28 06:41:25'),
(794, 1, 88, 1, 1, 1, 0, '2019-11-28 06:43:04'),
(795, 1, 90, 1, 1, 0, 1, '2019-11-28 06:46:22'),
(796, 1, 108, 1, 0, 1, 1, '2021-01-23 07:09:32'),
(797, 1, 109, 1, 1, 0, 0, '2019-11-28 23:38:11'),
(798, 1, 110, 1, 1, 1, 1, '2019-11-28 23:49:29'),
(799, 1, 111, 1, 1, 1, 1, '2019-11-28 23:49:57'),
(800, 1, 112, 1, 1, 1, 1, '2019-11-28 23:49:57'),
(801, 1, 129, 0, 1, 0, 1, '2019-11-28 23:49:57'),
(802, 1, 189, 1, 0, 1, 1, '2019-11-28 23:59:22'),
(810, 2, 1, 1, 1, 0, 0, '2024-08-06 11:07:54'),
(817, 1, 93, 1, 1, 1, 1, '2019-11-29 00:56:14'),
(825, 1, 87, 1, 0, 0, 0, '2019-11-29 00:56:14'),
(829, 1, 94, 1, 1, 0, 0, '2019-11-29 00:57:57'),
(836, 1, 146, 1, 0, 0, 0, '2019-11-29 01:13:28'),
(837, 1, 147, 1, 0, 0, 0, '2019-11-29 01:13:28'),
(838, 1, 148, 1, 0, 0, 0, '2019-11-29 01:13:28'),
(839, 1, 149, 1, 0, 0, 0, '2019-11-29 01:13:28'),
(840, 1, 150, 1, 0, 0, 0, '2019-11-29 01:13:28'),
(841, 1, 151, 1, 0, 0, 0, '2019-11-29 01:13:28'),
(842, 1, 152, 1, 0, 0, 0, '2019-11-29 01:13:28'),
(843, 1, 154, 1, 0, 0, 0, '2019-11-29 01:13:28'),
(862, 1, 155, 1, 0, 0, 0, '2019-11-29 02:07:30'),
(863, 1, 156, 1, 0, 0, 0, '2019-11-29 02:07:52'),
(864, 1, 157, 1, 0, 0, 0, '2019-11-29 02:08:05'),
(874, 1, 158, 1, 0, 0, 0, '2019-11-29 02:14:03'),
(875, 1, 159, 1, 0, 0, 0, '2019-11-29 02:14:31'),
(876, 1, 160, 1, 0, 0, 0, '2019-11-29 02:14:44'),
(878, 1, 162, 1, 0, 0, 0, '2019-11-29 02:15:58'),
(879, 1, 163, 1, 0, 0, 0, '2019-11-29 02:16:19'),
(882, 1, 164, 1, 0, 0, 0, '2019-11-29 02:25:17'),
(884, 1, 165, 1, 0, 0, 0, '2019-11-29 02:25:30'),
(886, 1, 197, 1, 0, 0, 0, '2019-11-29 02:25:48'),
(887, 1, 219, 1, 0, 0, 0, '2019-11-29 02:26:05'),
(889, 1, 220, 1, 0, 0, 0, '2019-11-29 02:26:22'),
(932, 1, 204, 1, 0, 0, 0, '2019-11-29 03:43:27'),
(933, 1, 221, 1, 0, 0, 0, '2019-11-29 03:45:04'),
(934, 1, 178, 1, 0, 0, 0, '2019-11-29 03:45:16'),
(935, 1, 179, 1, 0, 0, 0, '2019-11-29 03:45:33'),
(936, 1, 161, 1, 0, 0, 0, '2019-11-29 03:45:48'),
(937, 1, 180, 1, 0, 0, 0, '2019-11-29 03:45:48'),
(938, 1, 181, 1, 0, 0, 0, '2019-11-29 03:49:33'),
(939, 1, 182, 1, 0, 0, 0, '2019-11-29 03:49:45'),
(940, 1, 183, 1, 0, 0, 0, '2019-11-29 03:49:56'),
(941, 1, 174, 1, 0, 0, 0, '2019-11-29 03:50:53'),
(943, 1, 176, 1, 0, 0, 0, '2019-11-29 03:52:10'),
(944, 1, 177, 1, 0, 0, 0, '2019-11-29 03:52:22'),
(945, 1, 53, 0, 1, 0, 1, '2021-01-23 07:09:32'),
(946, 1, 215, 1, 0, 0, 0, '2019-11-29 04:01:37'),
(947, 1, 213, 1, 0, 0, 0, '2019-11-29 04:07:45'),
(974, 1, 224, 1, 0, 0, 0, '2019-11-29 04:32:52'),
(1026, 1, 135, 1, 0, 1, 0, '2019-11-29 06:02:12'),
(1031, 1, 228, 1, 0, 0, 0, '2019-11-29 06:21:16'),
(1083, 1, 175, 1, 0, 0, 0, '2019-11-30 00:37:24'),
(1086, 1, 43, 1, 1, 1, 1, '2019-11-30 00:49:39'),
(1087, 1, 44, 1, 0, 0, 0, '2019-11-30 00:49:39'),
(1088, 1, 46, 1, 0, 0, 0, '2019-11-30 00:49:39'),
(1089, 1, 217, 1, 0, 0, 0, '2019-11-30 00:49:39'),
(1090, 1, 98, 1, 1, 1, 1, '2019-11-30 01:32:51'),
(1091, 1, 99, 1, 0, 0, 0, '2019-11-30 01:30:18'),
(1092, 1, 223, 1, 0, 0, 0, '2019-11-30 01:32:51'),
(1103, 2, 205, 1, 1, 1, 1, '2019-11-30 01:56:04'),
(1105, 2, 23, 1, 1, 0, 0, '2024-08-06 11:07:54'),
(1106, 2, 24, 1, 0, 0, 0, '2019-11-30 01:56:04'),
(1107, 2, 25, 1, 0, 0, 0, '2019-11-30 01:56:04'),
(1108, 2, 77, 1, 0, 0, 0, '2019-11-30 01:56:04'),
(1123, 3, 8, 1, 1, 1, 1, '2019-11-30 06:46:18'),
(1125, 3, 69, 1, 1, 1, 1, '2019-11-30 07:00:49'),
(1126, 3, 70, 1, 1, 1, 1, '2019-11-30 07:04:46'),
(1130, 3, 9, 1, 1, 1, 1, '2019-11-30 07:14:54'),
(1131, 3, 10, 1, 1, 1, 1, '2019-11-30 07:16:02'),
(1134, 3, 35, 1, 1, 1, 1, '2019-11-30 07:25:04'),
(1135, 3, 104, 1, 1, 1, 1, '2019-11-30 07:25:53'),
(1140, 3, 41, 1, 1, 1, 1, '2019-11-30 07:37:13'),
(1141, 3, 42, 1, 1, 1, 1, '2019-11-30 07:37:46'),
(1142, 3, 43, 1, 1, 1, 1, '2019-11-30 07:42:06'),
(1151, 3, 87, 1, 0, 0, 0, '2019-11-30 02:23:13'),
(1152, 3, 88, 1, 1, 1, 0, '2019-11-30 02:23:13'),
(1153, 3, 90, 1, 1, 0, 1, '2019-11-30 02:23:13'),
(1154, 3, 108, 1, 0, 1, 0, '2019-11-30 02:23:13'),
(1155, 3, 109, 1, 1, 0, 0, '2019-11-30 02:23:13'),
(1156, 3, 110, 1, 1, 1, 1, '2019-11-30 02:23:13'),
(1157, 3, 111, 1, 1, 1, 1, '2019-11-30 02:23:13'),
(1158, 3, 112, 1, 1, 1, 1, '2019-11-30 02:23:13'),
(1159, 3, 127, 1, 0, 0, 0, '2019-11-30 02:23:13'),
(1160, 3, 129, 0, 1, 0, 1, '2019-11-30 02:23:13'),
(1161, 3, 102, 1, 1, 1, 1, '2019-11-30 02:23:13'),
(1162, 3, 106, 1, 0, 0, 0, '2019-11-30 02:23:13'),
(1163, 3, 113, 1, 0, 0, 0, '2019-11-30 02:23:13'),
(1164, 3, 114, 1, 0, 0, 0, '2019-11-30 02:23:13'),
(1165, 3, 115, 1, 0, 0, 0, '2019-11-30 02:23:13'),
(1166, 3, 116, 1, 0, 0, 0, '2019-11-30 02:23:13'),
(1167, 3, 117, 1, 0, 0, 0, '2019-11-30 02:23:13'),
(1168, 3, 118, 1, 0, 0, 0, '2019-11-30 02:23:13'),
(1171, 2, 142, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1172, 2, 144, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1179, 2, 212, 1, 0, 1, 0, '2019-11-30 02:36:17'),
(1183, 2, 148, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1184, 2, 149, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1185, 2, 150, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1186, 2, 151, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1187, 2, 152, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1188, 2, 153, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1189, 2, 154, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1198, 2, 223, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1199, 2, 213, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1201, 2, 230, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1204, 2, 214, 1, 0, 1, 0, '2019-11-30 02:36:17'),
(1206, 2, 224, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1210, 2, 143, 1, 1, 0, 0, '2023-06-21 23:05:39'),
(1211, 2, 145, 1, 0, 0, 0, '2019-11-30 02:57:28'),
(1216, 2, 4, 1, 1, 1, 1, '2019-11-30 03:32:56'),
(1218, 2, 128, 1, 1, 0, 1, '2023-06-21 23:05:39'),
(1220, 3, 135, 1, 0, 1, 0, '2019-11-30 07:08:56'),
(1231, 3, 190, 1, 0, 0, 0, '2019-11-30 03:44:02'),
(1232, 3, 192, 1, 0, 0, 0, '2019-11-30 03:44:02'),
(1233, 3, 226, 1, 0, 0, 0, '2019-11-30 03:44:02'),
(1234, 3, 227, 1, 0, 0, 0, '2019-11-30 03:44:02'),
(1235, 3, 224, 1, 0, 0, 0, '2019-11-30 03:44:02'),
(1236, 2, 15, 1, 1, 1, 0, '2019-11-30 03:54:25'),
(1239, 2, 122, 1, 0, 0, 0, '2019-11-30 03:57:48'),
(1242, 6, 217, 1, 0, 0, 0, '2019-11-30 04:00:13'),
(1243, 6, 224, 1, 0, 0, 0, '2019-11-30 04:00:13'),
(1245, 2, 20, 1, 1, 1, 0, '2023-06-21 23:05:39'),
(1246, 2, 137, 1, 1, 1, 0, '2023-06-21 23:05:39'),
(1248, 2, 141, 1, 1, 1, 0, '2023-06-21 23:05:39'),
(1250, 2, 187, 1, 0, 0, 0, '2019-11-30 04:11:19'),
(1252, 2, 207, 1, 0, 0, 0, '2019-11-30 04:21:21'),
(1253, 2, 208, 1, 0, 1, 0, '2019-11-30 04:22:00'),
(1255, 2, 210, 1, 0, 1, 0, '2019-11-30 04:22:58'),
(1256, 2, 211, 1, 0, 1, 0, '2019-11-30 04:24:03'),
(1257, 2, 21, 1, 0, 0, 0, '2019-11-30 04:32:59'),
(1259, 2, 188, 1, 0, 0, 0, '2019-11-30 04:34:35'),
(1260, 2, 27, 1, 0, 0, 0, '2019-11-30 04:36:13'),
(1262, 2, 43, 1, 1, 1, 1, '2019-11-30 04:39:42'),
(1263, 2, 44, 1, 0, 0, 0, '2019-11-30 04:41:43'),
(1264, 2, 46, 1, 0, 0, 0, '2019-11-30 04:41:43'),
(1265, 2, 217, 1, 0, 0, 0, '2019-11-30 04:41:43'),
(1266, 2, 146, 1, 0, 0, 0, '2019-11-30 04:46:35'),
(1267, 2, 147, 1, 0, 0, 0, '2019-11-30 04:47:37'),
(1272, 2, 93, 1, 1, 1, 1, '2019-11-30 05:07:25'),
(1273, 2, 94, 1, 1, 0, 0, '2019-11-30 05:07:42'),
(1275, 2, 102, 1, 0, 0, 0, '2023-06-21 23:05:39'),
(1277, 2, 196, 1, 0, 0, 0, '2019-11-30 05:15:01'),
(1279, 2, 185, 1, 1, 1, 1, '2019-11-30 05:21:44'),
(1280, 2, 186, 1, 1, 1, 1, '2019-11-30 05:22:43'),
(1281, 2, 222, 1, 0, 1, 0, '2019-11-30 05:24:30'),
(1283, 3, 5, 1, 1, 0, 1, '2019-11-30 06:43:04'),
(1284, 3, 6, 1, 0, 0, 0, '2019-11-30 06:43:29'),
(1285, 3, 7, 1, 1, 1, 1, '2019-11-30 06:44:39'),
(1286, 3, 68, 1, 0, 0, 0, '2019-11-30 06:46:58'),
(1287, 3, 71, 1, 0, 0, 0, '2019-11-30 07:05:41'),
(1288, 3, 73, 1, 0, 0, 0, '2019-11-30 07:05:59'),
(1289, 3, 74, 1, 0, 0, 0, '2019-11-30 07:06:08'),
(1290, 3, 11, 1, 0, 0, 0, '2019-11-30 07:16:37'),
(1291, 3, 12, 1, 1, 1, 1, '2019-11-30 07:19:29'),
(1292, 3, 13, 1, 1, 1, 1, '2019-11-30 07:22:27'),
(1294, 3, 14, 1, 0, 0, 0, '2019-11-30 07:22:55'),
(1295, 3, 31, 1, 1, 1, 1, '2019-12-02 06:30:37'),
(1297, 3, 37, 1, 1, 1, 1, '2019-11-30 07:28:09'),
(1298, 3, 38, 1, 1, 1, 1, '2019-11-30 07:29:02'),
(1299, 3, 39, 1, 1, 1, 1, '2019-11-30 07:30:07'),
(1300, 3, 40, 1, 1, 1, 1, '2019-11-30 07:32:43'),
(1301, 3, 44, 1, 0, 0, 0, '2019-11-30 07:44:09'),
(1302, 3, 46, 1, 0, 0, 0, '2019-11-30 07:44:09'),
(1303, 3, 217, 1, 0, 0, 0, '2019-11-30 07:44:09'),
(1304, 3, 155, 1, 0, 0, 0, '2019-11-30 07:44:32'),
(1305, 3, 156, 1, 0, 0, 0, '2019-11-30 07:45:18'),
(1306, 3, 157, 1, 0, 0, 0, '2019-11-30 07:45:42'),
(1307, 3, 158, 1, 0, 0, 0, '2019-11-30 07:46:07'),
(1308, 3, 159, 1, 0, 0, 0, '2019-11-30 07:46:21'),
(1309, 3, 160, 1, 0, 0, 0, '2019-11-30 07:46:33'),
(1313, 3, 161, 1, 0, 0, 0, '2019-11-30 07:48:26'),
(1314, 3, 162, 1, 0, 0, 0, '2019-11-30 07:48:48'),
(1315, 3, 163, 1, 0, 0, 0, '2019-11-30 07:48:48'),
(1316, 3, 164, 1, 0, 0, 0, '2019-11-30 07:49:47'),
(1317, 3, 165, 1, 0, 0, 0, '2019-11-30 07:49:47'),
(1318, 3, 174, 1, 0, 0, 0, '2019-11-30 07:49:47'),
(1319, 3, 175, 1, 0, 0, 0, '2019-11-30 07:49:59'),
(1320, 3, 181, 1, 0, 0, 0, '2019-11-30 07:50:08'),
(1321, 3, 86, 1, 1, 1, 1, '2019-11-30 07:54:08'),
(1322, 4, 28, 1, 1, 1, 1, '2019-12-01 00:52:39'),
(1324, 4, 29, 1, 0, 0, 0, '2019-12-01 00:53:46'),
(1325, 4, 30, 1, 0, 0, 0, '2019-12-01 00:53:59'),
(1326, 4, 123, 1, 0, 0, 0, '2019-12-01 00:54:26'),
(1327, 4, 228, 1, 0, 0, 0, '2019-12-01 00:54:39'),
(1328, 4, 43, 1, 1, 1, 1, '2019-12-01 00:58:05'),
(1332, 4, 44, 1, 0, 0, 0, '2019-12-01 00:59:16'),
(1333, 4, 46, 1, 0, 0, 0, '2019-12-01 00:59:16'),
(1334, 4, 217, 1, 0, 0, 0, '2019-12-01 00:59:16'),
(1335, 4, 178, 1, 0, 0, 0, '2019-12-01 00:59:59'),
(1336, 4, 179, 1, 0, 0, 0, '2019-12-01 01:00:11'),
(1337, 4, 180, 1, 0, 0, 0, '2019-12-01 01:00:29'),
(1338, 4, 221, 1, 0, 0, 0, '2019-12-01 01:00:46'),
(1339, 4, 86, 1, 0, 0, 0, '2019-12-01 01:01:02'),
(1341, 4, 106, 1, 0, 0, 0, '2019-12-01 01:05:21'),
(1342, 1, 107, 1, 0, 0, 0, '2019-12-01 01:06:44'),
(1343, 4, 117, 1, 0, 0, 0, '2019-12-01 01:10:20'),
(1344, 4, 194, 1, 0, 0, 0, '2019-12-01 01:11:35'),
(1348, 4, 230, 1, 0, 0, 0, '2019-12-01 01:19:15'),
(1350, 6, 1, 1, 0, 0, 0, '2019-12-01 01:35:32'),
(1351, 6, 21, 1, 0, 0, 0, '2019-12-01 01:36:29'),
(1352, 6, 23, 1, 0, 0, 0, '2019-12-01 01:36:45'),
(1353, 6, 24, 1, 0, 0, 0, '2019-12-01 01:37:05'),
(1354, 6, 25, 1, 0, 0, 0, '2019-12-01 01:37:34'),
(1355, 6, 77, 1, 0, 0, 0, '2019-12-01 01:38:08'),
(1356, 6, 188, 1, 0, 0, 0, '2019-12-01 01:38:45'),
(1357, 6, 43, 1, 1, 1, 1, '2019-12-01 01:40:44'),
(1358, 6, 78, 1, 1, 1, 1, '2019-12-01 01:43:04'),
(1360, 6, 79, 1, 1, 0, 1, '2019-12-01 01:44:39'),
(1361, 6, 80, 1, 1, 1, 1, '2019-12-01 01:45:08'),
(1362, 6, 81, 1, 1, 1, 1, '2019-12-01 01:47:50'),
(1363, 6, 85, 1, 1, 1, 1, '2019-12-01 01:50:43'),
(1364, 6, 86, 1, 0, 0, 0, '2019-12-01 01:51:10'),
(1365, 6, 106, 1, 0, 0, 0, '2019-12-01 01:52:55'),
(1366, 6, 117, 1, 0, 0, 0, '2019-12-01 01:53:08'),
(1394, 1, 106, 1, 0, 0, 0, '2019-12-02 05:20:33'),
(1395, 1, 113, 1, 0, 0, 0, '2019-12-02 05:20:59'),
(1396, 1, 114, 1, 0, 0, 0, '2019-12-02 05:21:34'),
(1397, 1, 115, 1, 0, 0, 0, '2019-12-02 05:21:34'),
(1398, 1, 116, 1, 0, 0, 0, '2019-12-02 05:21:54'),
(1399, 1, 117, 1, 0, 0, 0, '2019-12-02 05:22:04'),
(1400, 1, 118, 1, 0, 0, 0, '2019-12-02 05:22:20'),
(1402, 1, 191, 1, 0, 0, 0, '2019-12-02 05:23:34'),
(1403, 1, 192, 1, 0, 0, 0, '2019-12-02 05:23:47'),
(1404, 1, 193, 1, 0, 0, 0, '2019-12-02 05:23:58'),
(1405, 1, 194, 1, 0, 0, 0, '2019-12-02 05:24:11'),
(1406, 1, 195, 1, 0, 0, 0, '2019-12-02 05:24:20'),
(1408, 1, 227, 1, 0, 0, 0, '2019-12-02 05:25:47'),
(1410, 1, 226, 1, 0, 0, 0, '2019-12-02 05:31:41'),
(1411, 1, 229, 1, 0, 0, 0, '2019-12-02 05:32:57'),
(1412, 1, 230, 1, 0, 0, 0, '2019-12-02 05:32:57'),
(1413, 1, 190, 1, 0, 0, 0, '2019-12-02 05:43:41'),
(1420, 1, 231, 1, 1, 1, 1, '2021-01-23 07:09:32'),
(1421, 1, 232, 1, 0, 1, 1, '2019-12-02 06:19:32'),
(1422, 3, 32, 1, 1, 1, 1, '2019-12-02 06:30:37'),
(1423, 3, 33, 1, 1, 1, 1, '2019-12-02 06:30:37'),
(1424, 3, 34, 1, 1, 1, 1, '2019-12-02 06:30:37'),
(1425, 3, 182, 1, 0, 0, 0, '2019-12-02 06:30:37'),
(1426, 3, 183, 1, 0, 0, 0, '2019-12-02 06:30:37'),
(1427, 3, 189, 1, 0, 1, 1, '2019-12-02 06:30:37'),
(1428, 3, 229, 1, 0, 0, 0, '2019-12-02 06:30:37'),
(1429, 3, 230, 1, 0, 0, 0, '2019-12-02 06:30:37'),
(1430, 4, 213, 1, 0, 0, 0, '2019-12-02 06:32:14'),
(1432, 4, 224, 1, 0, 0, 0, '2019-12-02 06:32:14'),
(1433, 4, 195, 1, 0, 0, 0, '2019-12-03 04:57:53'),
(1434, 4, 229, 1, 0, 0, 0, '2019-12-03 04:58:19'),
(1436, 6, 213, 1, 0, 0, 0, '2019-12-03 05:10:11'),
(1437, 6, 191, 1, 0, 0, 0, '2019-12-03 05:10:11'),
(1438, 6, 193, 1, 0, 0, 0, '2019-12-03 05:10:11'),
(1439, 6, 230, 1, 0, 0, 0, '2019-12-03 05:10:11'),
(1440, 2, 106, 1, 0, 0, 0, '2020-01-25 04:21:36'),
(1442, 2, 134, 1, 1, 1, 1, '2020-02-12 02:12:36'),
(1443, 1, 233, 1, 0, 0, 0, '2020-02-12 02:21:57'),
(1445, 3, 233, 1, 0, 0, 0, '2020-02-12 03:51:17'),
(1446, 1, 234, 1, 1, 1, 1, '2020-06-01 21:51:09'),
(1447, 1, 235, 1, 1, 1, 1, '2020-05-29 23:17:01'),
(1448, 1, 236, 1, 1, 1, 0, '2020-05-29 23:17:52'),
(1449, 1, 237, 1, 0, 1, 0, '2020-05-29 23:18:18'),
(1450, 1, 238, 1, 1, 1, 1, '2020-05-29 23:19:52'),
(1451, 1, 239, 1, 1, 1, 1, '2020-05-29 23:22:10'),
(1454, 2, 238, 1, 1, 1, 1, '2020-05-29 23:40:33'),
(1455, 2, 239, 1, 1, 1, 1, '2020-05-29 23:40:33'),
(1456, 2, 240, 1, 0, 0, 0, '2020-05-28 20:51:18'),
(1457, 2, 241, 1, 0, 0, 0, '2020-05-28 20:51:18'),
(1458, 1, 240, 1, 0, 0, 0, '2020-06-07 18:30:42'),
(1459, 1, 241, 1, 0, 0, 0, '2020-06-07 18:30:42'),
(1460, 1, 242, 1, 0, 0, 0, '2020-06-07 18:30:42'),
(1461, 2, 242, 1, 0, 0, 0, '2020-06-11 22:45:24'),
(1462, 3, 242, 1, 0, 0, 0, '2020-06-14 22:46:54'),
(1463, 6, 242, 1, 0, 0, 0, '2020-06-14 22:48:14'),
(1464, 1, 243, 1, 0, 0, 0, '2020-09-12 06:05:45'),
(1465, 1, 109, 1, 1, 0, 0, '2020-09-21 06:33:50'),
(1466, 1, 108, 1, 0, 1, 1, '2024-10-14 18:24:46'),
(1467, 1, 244, 1, 0, 0, 0, '2020-09-21 06:59:54'),
(1468, 1, 245, 1, 0, 0, 0, '2020-09-21 06:59:54'),
(1469, 1, 246, 1, 0, 0, 0, '2020-09-21 06:59:54'),
(1470, 1, 247, 1, 0, 0, 0, '2021-01-07 06:12:14'),
(1472, 2, 247, 1, 0, 0, 0, '2021-01-21 12:46:40'),
(1473, 1, 248, 1, 1, 1, 1, '2021-05-19 12:52:49'),
(1474, 1, 249, 1, 0, 0, 0, '2021-05-19 12:52:49'),
(1475, 2, 248, 1, 0, 0, 0, '2023-06-21 23:05:39'),
(1476, 3, 248, 1, 1, 1, 1, '2021-05-28 09:36:16'),
(1477, 3, 249, 1, 0, 0, 0, '2021-05-28 09:36:16'),
(1478, 6, 248, 1, 0, 0, 0, '2021-05-28 09:56:14'),
(1479, 6, 249, 1, 0, 0, 0, '2021-05-28 09:56:14'),
(1480, 2, 249, 1, 0, 0, 0, '2021-05-28 13:11:52'),
(1481, 1, 7001, 1, 1, 1, 1, '2021-05-11 07:21:33'),
(1482, 1, 7002, 1, 0, 0, 0, '2021-05-17 05:28:47'),
(1483, 1, 7003, 1, 1, 1, 1, '2021-05-11 08:29:37'),
(1484, 1, 7005, 1, 1, 1, 1, '2021-05-17 05:28:47'),
(1485, 1, 7004, 1, 1, 1, 1, '2021-05-11 10:00:50'),
(1486, 1, 7006, 1, 1, 0, 0, '2021-05-17 05:28:47'),
(1487, 1, 7007, 1, 0, 0, 0, '2021-05-11 10:00:50'),
(1488, 1, 7008, 1, 0, 0, 0, '2021-05-11 10:00:50'),
(1489, 1, 7009, 1, 0, 0, 0, '2021-05-11 10:00:50'),
(1490, 1, 7010, 1, 0, 0, 0, '2021-05-11 10:00:50'),
(1491, 2, 7001, 1, 1, 1, 0, '2023-06-21 23:05:39'),
(1492, 2, 7002, 1, 0, 0, 0, '2021-05-17 10:51:44'),
(1493, 2, 7003, 1, 1, 1, 0, '2023-06-21 23:05:39'),
(1494, 2, 7004, 1, 1, 1, 0, '2023-06-21 23:05:39'),
(1495, 3, 7006, 1, 1, 0, 0, '2021-05-17 10:52:19'),
(1496, 3, 7007, 1, 0, 0, 0, '2021-05-17 04:32:06'),
(1497, 1, 7011, 1, 0, 0, 0, '2021-05-17 05:28:47'),
(1498, 2, 7005, 1, 1, 1, 0, '2023-06-21 23:05:39'),
(1500, 1, 7012, 1, 0, 0, 1, '2022-06-20 04:20:01'),
(1501, 1, 7013, 1, 0, 1, 1, '2022-06-18 09:52:16'),
(1502, 1, 7014, 1, 1, 1, 1, '2021-05-15 10:28:38'),
(1503, 6, 7014, 1, 1, 1, 1, '2022-06-18 09:09:15'),
(1504, 6, 7013, 1, 0, 0, 0, '2022-06-18 09:13:07'),
(1505, 4, 7012, 1, 0, 0, 0, '2022-07-15 04:22:20'),
(1506, 4, 7013, 1, 0, 1, 1, '2022-07-15 04:26:29'),
(1507, 4, 7014, 1, 1, 1, 1, '2022-07-15 04:24:48'),
(1508, 2, 7012, 1, 0, 0, 0, '2023-06-21 23:05:39'),
(1509, 2, 7013, 1, 0, 0, 0, '2023-06-21 23:05:39'),
(1510, 2, 7014, 1, 0, 0, 0, '2023-06-21 23:05:39'),
(1511, 3, 7012, 1, 0, 0, 0, '2022-07-15 05:31:18'),
(1512, 3, 7013, 1, 0, 0, 0, '2022-07-15 05:31:18'),
(1513, 3, 7014, 1, 0, 0, 0, '2022-07-15 05:31:18'),
(1514, 2, 250, 1, 0, 0, 0, '2023-06-21 23:05:39'),
(1515, 2, 118, 1, 0, 0, 0, '2023-06-21 23:05:39'),
(1516, 2, 6001, 1, 1, 0, 1, '2021-01-29 09:31:16'),
(1517, 1, 6001, 1, 1, 0, 1, '2020-09-23 12:59:22'),
(1518, 1, 6002, 1, 1, 0, 1, '2020-09-23 13:01:52'),
(1519, 1, 6003, 1, 0, 0, 0, '2020-09-23 13:02:06'),
(1520, 1, 6004, 1, 0, 0, 0, '2020-09-23 13:02:33'),
(1521, 1, 6005, 1, 0, 1, 0, '2021-01-29 07:45:05'),
(1522, 2, 6005, 1, 0, 1, 0, '2021-01-29 11:08:20'),
(1523, 2, 6002, 1, 1, 0, 1, '2021-01-29 07:58:48'),
(1524, 3, 6002, 1, 1, 0, 1, '2021-01-29 07:26:08'),
(1525, 3, 6003, 1, 0, 0, 0, '2021-01-29 07:26:08'),
(1526, 3, 6005, 1, 0, 1, 0, '2021-01-29 07:26:08'),
(1527, 4, 6001, 1, 1, 0, 1, '2021-01-29 07:26:53'),
(1528, 4, 6002, 1, 1, 0, 1, '2021-01-29 07:26:53'),
(1529, 6, 6001, 1, 1, 0, 1, '2021-01-29 07:27:32'),
(1530, 6, 6002, 1, 1, 0, 1, '2021-01-29 07:27:32'),
(1531, 6, 6005, 1, 0, 1, 0, '2021-01-29 07:27:32'),
(1532, 2, 6003, 1, 0, 0, 0, '2021-01-29 09:31:16'),
(1533, 2, 6004, 1, 0, 0, 0, '2021-01-29 09:31:16'),
(1534, 4, 6005, 1, 0, 1, 0, '2022-07-13 04:28:08'),
(1535, 2, 7015, 1, 1, 1, 0, '2023-10-05 05:16:57'),
(1536, 2, 7016, 1, 1, 1, 1, '2023-10-30 04:48:51'),
(1537, 2, 7017, 1, 0, 0, 0, '2024-01-20 11:05:38'),
(1538, 1, 7016, 1, 1, 1, 1, '2024-10-14 18:24:46');

-- --------------------------------------------------------

--
-- Table structure for table `room_types`
--

CREATE TABLE `room_types` (
  `id` int(11) NOT NULL,
  `room_type` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `route_pickup_point`
--

CREATE TABLE `route_pickup_point` (
  `id` int(11) NOT NULL,
  `transport_route_id` int(11) NOT NULL,
  `pickup_point_id` int(11) NOT NULL,
  `fees` float(10,2) DEFAULT 0.00,
  `destination_distance` float(10,1) DEFAULT 0.0,
  `pickup_time` time DEFAULT NULL,
  `order_number` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `school_houses`
--

CREATE TABLE `school_houses` (
  `id` int(11) NOT NULL,
  `house_name` varchar(200) NOT NULL,
  `description` varchar(400) NOT NULL,
  `is_active` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sch_settings`
--

CREATE TABLE `sch_settings` (
  `id` int(11) NOT NULL,
  `base_url` varchar(500) DEFAULT NULL,
  `folder_path` text DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `biometric` int(11) DEFAULT 0,
  `biometric_device` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `languages` varchar(500) NOT NULL,
  `dise_code` varchar(50) DEFAULT NULL,
  `date_format` varchar(50) NOT NULL,
  `time_format` varchar(255) NOT NULL,
  `currency` varchar(50) NOT NULL,
  `currency_symbol` varchar(50) NOT NULL,
  `is_rtl` varchar(10) DEFAULT 'disabled',
  `is_duplicate_fees_invoice` varchar(100) DEFAULT '0',
  `collect_back_date_fees` int(11) NOT NULL,
  `single_page_print` int(11) DEFAULT 0,
  `timezone` varchar(30) DEFAULT 'UTC',
  `session_id` int(11) DEFAULT NULL,
  `cron_secret_key` varchar(100) NOT NULL,
  `currency_place` varchar(50) NOT NULL DEFAULT 'before_number',
  `currency_format` varchar(20) DEFAULT NULL,
  `class_teacher` varchar(100) NOT NULL,
  `start_month` varchar(40) NOT NULL,
  `attendence_type` int(11) NOT NULL DEFAULT 0,
  `low_attendance_limit` float(10,2) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `admin_logo` varchar(255) NOT NULL,
  `admin_small_logo` varchar(255) NOT NULL,
  `admin_login_page_background` varchar(255) NOT NULL,
  `user_login_page_background` varchar(255) NOT NULL,
  `theme` varchar(200) NOT NULL DEFAULT 'default.jpg',
  `fee_due_days` int(11) DEFAULT 0,
  `adm_auto_insert` int(11) NOT NULL DEFAULT 1,
  `adm_prefix` varchar(50) NOT NULL DEFAULT 'ssadm19/20',
  `adm_start_from` varchar(11) NOT NULL,
  `adm_no_digit` int(11) NOT NULL DEFAULT 6,
  `adm_update_status` int(11) NOT NULL DEFAULT 0,
  `staffid_auto_insert` int(11) NOT NULL DEFAULT 1,
  `staffid_prefix` varchar(100) NOT NULL DEFAULT 'staffss/19/20',
  `staffid_start_from` varchar(50) NOT NULL,
  `staffid_no_digit` int(11) NOT NULL DEFAULT 6,
  `staffid_update_status` int(11) NOT NULL DEFAULT 0,
  `is_active` varchar(255) DEFAULT 'no',
  `online_admission` int(11) DEFAULT 0,
  `online_admission_payment` varchar(50) NOT NULL,
  `online_admission_amount` float NOT NULL,
  `online_admission_instruction` text NOT NULL,
  `online_admission_conditions` text NOT NULL,
  `online_admission_application_form` varchar(255) DEFAULT NULL,
  `exam_result` int(11) NOT NULL,
  `is_blood_group` int(11) NOT NULL DEFAULT 1,
  `is_student_house` int(11) NOT NULL DEFAULT 1,
  `roll_no` int(11) NOT NULL DEFAULT 1,
  `category` int(11) NOT NULL,
  `religion` int(11) NOT NULL DEFAULT 1,
  `cast` int(11) NOT NULL DEFAULT 1,
  `mobile_no` int(11) NOT NULL DEFAULT 1,
  `student_email` int(11) NOT NULL DEFAULT 1,
  `admission_date` int(11) NOT NULL DEFAULT 1,
  `lastname` int(11) NOT NULL,
  `middlename` int(11) NOT NULL DEFAULT 1,
  `student_photo` int(11) NOT NULL DEFAULT 1,
  `student_height` int(11) NOT NULL DEFAULT 1,
  `student_weight` int(11) NOT NULL DEFAULT 1,
  `measurement_date` int(11) NOT NULL DEFAULT 1,
  `father_name` int(11) NOT NULL DEFAULT 1,
  `father_phone` int(11) NOT NULL DEFAULT 1,
  `father_occupation` int(11) NOT NULL DEFAULT 1,
  `father_pic` int(11) NOT NULL DEFAULT 1,
  `mother_name` int(11) NOT NULL DEFAULT 1,
  `mother_phone` int(11) NOT NULL DEFAULT 1,
  `mother_occupation` int(11) NOT NULL DEFAULT 1,
  `mother_pic` int(11) NOT NULL DEFAULT 1,
  `guardian_name` int(11) NOT NULL,
  `guardian_relation` int(11) NOT NULL DEFAULT 1,
  `guardian_phone` int(11) NOT NULL,
  `guardian_email` int(11) NOT NULL DEFAULT 1,
  `guardian_pic` int(11) NOT NULL DEFAULT 1,
  `guardian_occupation` int(11) NOT NULL,
  `guardian_address` int(11) NOT NULL DEFAULT 1,
  `current_address` int(11) NOT NULL DEFAULT 1,
  `permanent_address` int(11) NOT NULL DEFAULT 1,
  `route_list` int(11) NOT NULL DEFAULT 1,
  `hostel_id` int(11) NOT NULL DEFAULT 1,
  `bank_account_no` int(11) NOT NULL DEFAULT 1,
  `ifsc_code` int(11) NOT NULL,
  `bank_name` int(11) NOT NULL,
  `national_identification_no` int(11) NOT NULL DEFAULT 1,
  `local_identification_no` int(11) NOT NULL DEFAULT 1,
  `rte` int(11) NOT NULL DEFAULT 1,
  `previous_school_details` int(11) NOT NULL DEFAULT 1,
  `student_note` int(11) NOT NULL DEFAULT 1,
  `upload_documents` int(11) NOT NULL DEFAULT 1,
  `student_barcode` int(11) NOT NULL DEFAULT 1,
  `staff_designation` int(11) NOT NULL DEFAULT 1,
  `staff_department` int(11) NOT NULL DEFAULT 1,
  `staff_last_name` int(11) NOT NULL DEFAULT 1,
  `staff_father_name` int(11) NOT NULL DEFAULT 1,
  `staff_mother_name` int(11) NOT NULL DEFAULT 1,
  `staff_date_of_joining` int(11) NOT NULL DEFAULT 1,
  `staff_phone` int(11) NOT NULL DEFAULT 1,
  `staff_emergency_contact` int(11) NOT NULL DEFAULT 1,
  `staff_marital_status` int(11) NOT NULL DEFAULT 1,
  `staff_photo` int(11) NOT NULL DEFAULT 1,
  `staff_current_address` int(11) NOT NULL DEFAULT 1,
  `staff_permanent_address` int(11) NOT NULL DEFAULT 1,
  `staff_qualification` int(11) NOT NULL DEFAULT 1,
  `staff_work_experience` int(11) NOT NULL DEFAULT 1,
  `staff_note` int(11) NOT NULL DEFAULT 1,
  `staff_epf_no` int(11) NOT NULL DEFAULT 1,
  `staff_basic_salary` int(11) NOT NULL DEFAULT 1,
  `staff_contract_type` int(11) NOT NULL DEFAULT 1,
  `staff_work_shift` int(11) NOT NULL DEFAULT 1,
  `staff_work_location` int(11) NOT NULL DEFAULT 1,
  `staff_leaves` int(11) NOT NULL DEFAULT 1,
  `staff_account_details` int(11) NOT NULL DEFAULT 1,
  `staff_social_media` int(11) NOT NULL DEFAULT 1,
  `staff_upload_documents` int(11) NOT NULL DEFAULT 1,
  `staff_barcode` int(11) NOT NULL DEFAULT 1,
  `staff_notification_email` varchar(50) NOT NULL,
  `mobile_api_url` tinytext NOT NULL,
  `app_primary_color_code` varchar(20) DEFAULT NULL,
  `app_secondary_color_code` varchar(20) DEFAULT NULL,
  `admin_mobile_api_url` tinytext NOT NULL,
  `admin_app_primary_color_code` varchar(20) NOT NULL,
  `admin_app_secondary_color_code` varchar(20) NOT NULL,
  `app_logo` varchar(250) DEFAULT NULL,
  `student_profile_edit` int(11) NOT NULL DEFAULT 0,
  `start_week` varchar(10) NOT NULL,
  `my_question` int(11) NOT NULL,
  `superadmin_restriction` varchar(20) NOT NULL,
  `student_timeline` varchar(20) NOT NULL,
  `calendar_event_reminder` int(11) DEFAULT NULL,
  `event_reminder` varchar(20) NOT NULL,
  `student_login` varchar(100) DEFAULT NULL,
  `parent_login` varchar(100) DEFAULT NULL,
  `student_panel_login` int(11) NOT NULL DEFAULT 1,
  `parent_panel_login` int(11) NOT NULL DEFAULT 1,
  `scratch_pin_login` varchar(11) NOT NULL DEFAULT 'disabled',
  `num_of_assessments` int(11) DEFAULT NULL,
  `assessments_detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `assessments_marks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `is_student_feature_lock` int(11) NOT NULL DEFAULT 0,
  `maintenance_mode` int(11) NOT NULL DEFAULT 0,
  `lock_grace_period` int(11) NOT NULL DEFAULT 0,
  `is_offline_fee_payment` int(11) NOT NULL DEFAULT 0,
  `offline_bank_payment_instruction` text NOT NULL,
  `result_setting` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sch_settings`
--

INSERT INTO `sch_settings` (`id`, `base_url`, `folder_path`, `name`, `biometric`, `biometric_device`, `email`, `phone`, `address`, `lang_id`, `languages`, `dise_code`, `date_format`, `time_format`, `currency`, `currency_symbol`, `is_rtl`, `is_duplicate_fees_invoice`, `collect_back_date_fees`, `single_page_print`, `timezone`, `session_id`, `cron_secret_key`, `currency_place`, `currency_format`, `class_teacher`, `start_month`, `attendence_type`, `low_attendance_limit`, `image`, `admin_logo`, `admin_small_logo`, `admin_login_page_background`, `user_login_page_background`, `theme`, `fee_due_days`, `adm_auto_insert`, `adm_prefix`, `adm_start_from`, `adm_no_digit`, `adm_update_status`, `staffid_auto_insert`, `staffid_prefix`, `staffid_start_from`, `staffid_no_digit`, `staffid_update_status`, `is_active`, `online_admission`, `online_admission_payment`, `online_admission_amount`, `online_admission_instruction`, `online_admission_conditions`, `online_admission_application_form`, `exam_result`, `is_blood_group`, `is_student_house`, `roll_no`, `category`, `religion`, `cast`, `mobile_no`, `student_email`, `admission_date`, `lastname`, `middlename`, `student_photo`, `student_height`, `student_weight`, `measurement_date`, `father_name`, `father_phone`, `father_occupation`, `father_pic`, `mother_name`, `mother_phone`, `mother_occupation`, `mother_pic`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_email`, `guardian_pic`, `guardian_occupation`, `guardian_address`, `current_address`, `permanent_address`, `route_list`, `hostel_id`, `bank_account_no`, `ifsc_code`, `bank_name`, `national_identification_no`, `local_identification_no`, `rte`, `previous_school_details`, `student_note`, `upload_documents`, `student_barcode`, `staff_designation`, `staff_department`, `staff_last_name`, `staff_father_name`, `staff_mother_name`, `staff_date_of_joining`, `staff_phone`, `staff_emergency_contact`, `staff_marital_status`, `staff_photo`, `staff_current_address`, `staff_permanent_address`, `staff_qualification`, `staff_work_experience`, `staff_note`, `staff_epf_no`, `staff_basic_salary`, `staff_contract_type`, `staff_work_shift`, `staff_work_location`, `staff_leaves`, `staff_account_details`, `staff_social_media`, `staff_upload_documents`, `staff_barcode`, `staff_notification_email`, `mobile_api_url`, `app_primary_color_code`, `app_secondary_color_code`, `admin_mobile_api_url`, `admin_app_primary_color_code`, `admin_app_secondary_color_code`, `app_logo`, `student_profile_edit`, `start_week`, `my_question`, `superadmin_restriction`, `student_timeline`, `calendar_event_reminder`, `event_reminder`, `student_login`, `parent_login`, `student_panel_login`, `parent_panel_login`, `scratch_pin_login`, `num_of_assessments`, `assessments_detail`, `assessments_marks`, `is_student_feature_lock`, `maintenance_mode`, `lock_grace_period`, `is_offline_fee_payment`, `offline_bank_payment_instruction`, `result_setting`, `created_at`, `updated_at`) VALUES
(1, 'https://localhost/schools.247pos.ng/', 'C:/xampp/htdocs/schools.247pos.ng/', 'Edric Tech School Academy', 1, '', 'info@edrictech.com.ng', '09081851043', '94, Ihama Road, G.R.A; Benin City', 4, '[\"4\"]', 'ETSA', 'm/d/Y', '12-hour', '150', '$', 'disabled', '0', 0, 0, 'Africa/Lagos', 19, '', 'after_number', '#,###.##', 'yes', '4', 0, 0.00, '1701797923-424105323656f60231e05b!1687361611-13214969566493184b15421!446443.jpg', '1702571258-1654903326657b2cfa4315c!1687993625-966963673649cbd1912b0f!infyom.png', '1687993768-1475934098649cbda813be6!icon.png', '1701798159-1336926229656f610f3913a!1687361611-13214969566493184b15421!446443.jpg', '1687361611-13214969566493184b15421!446443.jpg', 'blue.jpg', 60, 1, 'ETSA', '045017', 6, 1, 1, 'ETSA', '715001', 6, 1, 'no', 1, 'no', 0, '', '<p>&nbsp;Please enter your institution online admission terms &amp; conditions here.</p>\r\n', NULL, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '', 'https://schools.247pos.ng/api', '#424242', '#eeeeee', '', '', '', '1687993798-1010475503649cbdc60089a!infyom.png', 0, 'Monday', 1, 'enabled', 'enabled', 0, 'enabled', '[\"admission_no\",\"mobile_number\",\"email\"]', '[\"mobile_number\",\"email\"]', 1, 1, 'disabled', 3, '[\"CA 1\",\"CA 2\",\"Exam\"]', '[\"20\",\"20\",\"60\"]', 0, 0, 0, 0, '', 'both', '2024-11-12 22:12:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `scretch_cards`
--

CREATE TABLE `scretch_cards` (
  `id` int(11) NOT NULL,
  `login_limit` int(11) NOT NULL,
  `unlimited` bit(11) NOT NULL,
  `card_quantity` int(11) NOT NULL,
  `description` text NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scretch_cards`
--

INSERT INTO `scretch_cards` (`id`, `login_limit`, `unlimited`, `card_quantity`, `description`, `created_on`, `updated_on`) VALUES
(7, 30, b'11111111111', 10, 'Testing', '2024-02-23 16:23:38', NULL),
(8, 3, b'00000000000', 5, '', '2024-08-01 13:44:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `scretch_card_pins`
--

CREATE TABLE `scretch_card_pins` (
  `id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `serial_no` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `limits` int(11) NOT NULL,
  `unlimited` bit(1) NOT NULL,
  `u_id` int(11) NOT NULL DEFAULT 0,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scretch_card_pins`
--

INSERT INTO `scretch_card_pins` (`id`, `s_id`, `serial_no`, `code`, `limits`, `unlimited`, `u_id`, `created_on`) VALUES
(7, 2, '250572972940', 'PJ0vIUBt', 3, b'0', 0, '2023-09-14 21:18:57'),
(8, 2, '893944302978', 'WOcm2a41', 3, b'0', 0, '2023-09-14 21:18:57'),
(9, 2, '764785368902', 'JZYndf4w', 3, b'0', 0, '2023-09-14 21:18:57'),
(10, 2, '131041172648', 'ry7i1njx', 3, b'0', 0, '2023-09-14 21:18:57'),
(11, 2, '196412919978', 'NztYVjcM', 3, b'0', 0, '2023-09-14 21:18:57'),
(12, 2, '215162930884', 'vFV7Yjzf', 3, b'0', 0, '2023-09-14 21:18:57'),
(13, 1, '945810294041', 'NOKGZnxu', 5, b'0', 0, '2023-09-14 21:18:57'),
(14, 1, '747527018751', '29cWiB1O', 5, b'0', 0, '2023-09-14 21:18:57'),
(15, 1, '507293453378', 'AayfPZ5s', 1, b'0', 0, '2024-01-28 04:31:54'),
(16, 10, '138225072398', 'fo9IhZYb', 0, b'0', 0, '2024-01-30 16:16:55'),
(17, 6, '526217955514', 'GN2YyWUQ', 23, b'1', 10, '2024-01-30 16:26:00'),
(18, 6, '458297441011', 'yFf3iJ4M', 30, b'1', 1, '2024-01-30 16:26:00'),
(19, 11, '571742775356', 'o4jNGyc0', 26, b'1', 11, '2024-01-30 16:26:00'),
(20, 6, '963587664027', 'F3ifqoWT', 26, b'1', 13, '2024-01-30 16:26:00'),
(21, 6, '963490627166', 'FrZXzLcP', 29, b'1', 12, '2024-01-30 16:26:00'),
(22, 7, '963637256735', '2kt0jAIO', 28, b'1', 1, '2024-02-23 16:23:38'),
(23, 7, '793306275214', 'UshBmSOk', 30, b'1', 0, '2024-02-23 16:23:38'),
(24, 7, '841899328229', 'iQYLtEBs', 30, b'1', 0, '2024-02-23 16:23:38'),
(25, 7, '309144115608', 'qzaUFIkv', 30, b'1', 0, '2024-02-23 16:23:38'),
(26, 7, '936144475775', 'E3kVmO9j', 30, b'1', 0, '2024-02-23 16:23:38'),
(27, 7, '298973572913', 'HfVZdXEt', 30, b'1', 0, '2024-02-23 16:23:38'),
(28, 7, '487890171063', 'ROtZzm3S', 30, b'1', 0, '2024-02-23 16:23:38'),
(29, 7, '139126471028', '1svz8Tha', 30, b'1', 19, '2024-02-23 16:23:38'),
(30, 7, '627916352705', 'wMe1H0Ri', 30, b'1', 0, '2024-02-23 16:23:38'),
(31, 7, '211039649060', 'oKkOgGQR', 25, b'1', 14, '2024-02-23 16:23:38'),
(32, 8, '581469428896', 'RfpN0jw1', 0, b'0', 1, '2024-08-01 13:44:38'),
(33, 8, '353001839134', 'syNLeC2S', 3, b'0', 0, '2024-08-01 13:44:38'),
(34, 8, '149530521552', 'Ls8ICqlo', 3, b'0', 0, '2024-08-01 13:44:38'),
(35, 8, '536587908545', 'WXUfbay6', 3, b'0', 0, '2024-08-01 13:44:38'),
(36, 8, '314899841749', 'BD0ngCls', 3, b'0', 0, '2024-08-01 13:44:38');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `section` varchar(60) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'SECTION 1', 'no', '2023-06-21 22:33:45', NULL),
(2, 'SECTION 2', 'no', '2023-06-21 22:33:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `send_notification`
--

CREATE TABLE `send_notification` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `attachment` varchar(500) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `visible_student` varchar(10) NOT NULL DEFAULT 'no',
  `visible_staff` varchar(10) NOT NULL DEFAULT 'no',
  `visible_parent` varchar(10) NOT NULL DEFAULT 'no',
  `created_by` varchar(60) DEFAULT NULL,
  `created_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `session` varchar(60) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES
(7, '2016-17', 'no', '2017-04-20 06:42:19', '0000-00-00'),
(11, '2017-18', 'no', '2017-04-20 06:41:37', '0000-00-00'),
(13, '2018-19', 'no', '2016-08-24 19:26:44', '0000-00-00'),
(14, '2019-20', 'no', '2016-08-24 19:26:55', '0000-00-00'),
(15, '2020-21', 'no', '2016-10-01 05:28:08', '0000-00-00'),
(16, '2021-22', 'no', '2016-10-01 05:28:20', '0000-00-00'),
(18, '2022-23', 'no', '2016-10-01 05:29:02', '0000-00-00'),
(19, '2023-24', 'no', '2016-10-01 05:29:10', '0000-00-00'),
(20, '2024-25', 'no', '2016-10-01 05:29:18', '0000-00-00'),
(21, '2025-26', 'no', '2016-10-01 05:30:10', '0000-00-00'),
(22, '2026-27', 'no', '2016-10-01 05:30:18', '0000-00-00'),
(23, '2027-28', 'no', '2016-10-01 05:30:24', '0000-00-00'),
(24, '2028-29', 'no', '2016-10-01 05:30:30', '0000-00-00'),
(25, '2029-30', 'no', '2016-10-01 05:30:37', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `share_contents`
--

CREATE TABLE `share_contents` (
  `id` int(11) NOT NULL,
  `send_to` varchar(50) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `share_date` date DEFAULT NULL,
  `valid_upto` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `share_content_for`
--

CREATE TABLE `share_content_for` (
  `id` int(11) NOT NULL,
  `group_id` varchar(20) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `user_parent_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `share_content_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `share_upload_contents`
--

CREATE TABLE `share_upload_contents` (
  `id` int(11) NOT NULL,
  `upload_content_id` int(11) DEFAULT NULL,
  `share_content_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sidebar_menus`
--

CREATE TABLE `sidebar_menus` (
  `id` int(11) NOT NULL,
  `permission_group_id` int(11) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `menu` varchar(500) DEFAULT NULL,
  `activate_menu` varchar(100) DEFAULT NULL,
  `lang_key` varchar(250) NOT NULL,
  `system_level` int(11) DEFAULT 0,
  `level` int(11) DEFAULT NULL,
  `sidebar_display` int(11) DEFAULT 0,
  `access_permissions` text DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sidebar_menus`
--

INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES
(1, 17, 'fa fa-ioxhost ftlayer', 'Front Office', 'front_office', 'front_office', 10, 1, 1, '(\'admission_enquiry\', \'can_view\') || (\'visitor_book\', \'can_view\') ||       (\'phon_call_log\', \'can_view\') ||  (\'postal_dispatch\', \'can_view\') ||       (\'postal_receive\', \'can_view\') || (\'complaint\', \'can_view\') ||(\'setup_font_office\', \'can_view\')', 1, '2023-01-10 12:49:51'),
(2, 1, 'fa fa-user-plus ftlayer', 'Student Information', 'student_information', 'student_information', 20, 2, 1, '(\'student\', \'can_view\') || (\'student\', \'can_add\') || (\'student_history\', \'can_view\') || (\'student_categories\', \'can_view\') || (\'student_houses\', \'can_view\') || (\'disable_student\', \'can_view\') || (\'disable_reason\', \'can_view\') || (\'online_admission\', \'can_view\') || (\'multiclass_student\', \'can_view\') || (\'disable_reason\', \'can_view\')', 1, '2023-01-10 12:49:51'),
(3, 2, 'fa fa-money ftlayer', 'Fees Collection', 'fees_collection', 'fees_collection', 30, 3, 1, '(\'collect_fees\', \'can_view\') || (\'search_fees_payment\', \'can_view\') || (\'search_due_fees\', \'can_view\') || (\'fees_statement\', \'can_view\') || (\'fees_carry_forward\', \'can_view\') || (\'fees_master\', \'can_view\') || (\'fees_group\', \'can_view\') || (\'fees_type\', \'can_view\') || (\'fees_discount\', \'can_view\') || (\'accountants\', \'can_view\')', 1, '2023-01-10 12:49:51'),
(4, 3, 'fa fa-usd ftlayer', 'Income', 'income', 'income', 40, 10, 1, '(\'income\', \'can_view\') || (\'search_income\', \'can_view\') || (\'income_head\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(7, 4, 'fa fa-credit-card ftlayer', 'Expense', 'expense', 'expenses', 50, 11, 1, '(\'expense\', \'can_view\') || (\'search_expense\', \'can_view\') || (\'expense_head\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(10, 5, 'fa fa-calendar-check-o ftlayer', 'Attendance', 'attendance', 'attendance', 60, 13, 1, '(\'student_attendance\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(11, 6, 'fa fa-map-o ftlayer', 'Examinations', 'examinations', 'examinations', 70, 12, 1, '(\'exam_group\', \'can_view\') || (\'exam_result\', \'can_view\') || (\'design_admit_card\', \'can_view\') || (\'print_admit_card\', \'can_view\') || (\'design_marksheet\', \'can_view\') || (\'print_marksheet\', \'can_view\') || (\'marks_grade\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(12, 23, 'fa fa-rss ftlayer', 'Online Examinations', 'online_examinations', 'online_examinations', 80, 14, 1, '(\'online_examination\', \'can_view\') ||  (\'question_bank\', \'can_view\'', 1, '2023-01-10 12:49:37'),
(13, 29, 'fa fa-list-alt ftlayer', 'Lesson Plan', 'lesson_plan', 'lesson_plan', 90, 16, 1, '(\'manage_lesson_plan\', \'can_view\') || (\'manage_syllabus_status\', \'can_view\') || (\'lesson\', \'can_view\') ||  (\'topic\', \'can_view\')||  (\'copy_old_lesson\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(14, 7, 'fa fa-mortar-board ftlayer', 'Academics', 'academics', 'academics', 100, 15, 1, '(\'class_timetable\', \'can_view\') || (\'teachers_timetable\', \'can_view\') || (\'assign_class_teacher\', \'can_view\') || (\'promote_student\', \'can_view\') || (\'subject_group\', \'can_view\') || (\'section\', \'can_view\') || (\'subject\', \'can_view\') || (\'class\', \'can_view\') || (\'section\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(15, 18, 'fa fa-sitemap ftlayer', 'Human Resource', 'human_resource', 'human_resource', 110, 17, 1, '(\'staff\', \'can_view\') || (\'approve_leave_request\', \'can_view\') || (\'apply_leave\', \'can_view\') || (\'leave_types\', \'can_view\') || (\'teachers_rating\', \'can_view\') || (\'department\', \'can_view\') || (\'designation\', \'can_view\') || (\'disable_staff\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(16, 13, 'fa fa-bullhorn ftlayer', 'Communicate', 'communicate', 'communicate', 120, 18, 1, '(\'notice_board\', \'can_view\') || (\'email\', \'can_view\') || (\'sms\', \'can_view\') || (\'email_sms_log\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(17, 8, 'fa fa-download ftlayer', 'Download Center', 'download_center', 'download_center', 130, 19, 1, '(\'upload_content\', \'can_view\') || (\'video_tutorial\', \'can_view\') || (\'content_type\', \'can_view\') || (\'content_share_list\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(18, 19, 'fa fa-flask ftlayer', 'Homework', 'homework', 'homework', 140, 20, 1, '(\'homework\', \'can_view\') || (\'homework\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(19, 9, 'fa fa-book ftlayer', 'Library', 'library', 'library', 150, 21, 1, '(\'books\', \'can_view\') || (\'issue_return\', \'can_view\') || (\'add_staff_member\', \'can_view\') || (\'add_student\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(20, 10, 'fa fa-object-group ftlayer', 'Inventory', 'inventory', 'inventory', 160, 22, 1, '(\'issue_item\', \'can_view\') || (\'item_stock\', \'can_view\') || (\'item\', \'can_view\') || (\'item_category\', \'can_view\') || (\'item_category\', \'can_view\') || (\'store\', \'can_view\') || (\'supplier\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(21, 11, 'fa fa-bus ftlayer', 'Transport', 'transport', 'transport', 170, 23, 1, '(\'routes\', \'can_view\') || (\'vehicle\', \'can_view\') || (\'assign_vehicle\', \'can_view\') || (\'transport_fees_master\', \'can_view\') || (\'pickup_point\', \'can_view\') || (\'route_pickup_point\', \'can_view\') || (\'student_transport_fees\', \'can_view\')      ', 1, '2023-01-10 12:49:37'),
(22, 12, 'fa fa-building-o ftlayer', 'Hostel', 'hostel', 'hostel', 180, 24, 1, '(\'hostel_rooms\', \'can_view\') || (\'room_type\', \'can_view\') || (\'hostel\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(23, 20, 'fa fa-newspaper-o ftlayer', 'Certificate', 'certificate', 'certificate', 190, 25, 1, '(\'student_certificate\', \'can_view\') || (\'generate_certificate\', \'can_view\') || (\'student_id_card\', \'can_view\') || (\'generate_id_card\', \'can_view\') || (\'staff_id_card\', \'can_view\') || (\'generate_staff_id_card\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(24, 16, 'fa fa-empire ftlayer', 'Front CMS', 'front_cms', 'front_cms', 200, 26, 1, '(\'event\', \'can_view\') || (\'gallery\', \'can_view\') || (\'notice\', \'can_view\') || (\'media_manager\', \'can_view\') || (\'pages\', \'can_view\') || (\'menus\', \'can_view\') || (\'banner_images\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(25, 28, 'fa fa-universal-access ftlayer', 'Alumni', 'alumni', 'alumni', 210, 27, 1, '(\'manage_alumni\', \'can_view\') || (\'events\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(26, 14, 'fa fa-line-chart ftlayer', 'Reports', 'reports', 'reports', 220, 28, 1, '(\'student_report\', \'can_view\') || (\'guardian_report\', \'can_view\') || (\'student_history\', \'can_view\') || (\'student_login_credential_report\', \'can_view\') || (\'class_subject_report\', \'can_view\') || (\'admission_report\', \'can_view\') || (\'sibling_report\', \'can_view\') || (\'evaluation_report\', \'can_view\') || (\'student_profile\', \'can_view\') || (\'fees_statement\', \'can_view\') || (\'balance_fees_report\', \'can_view\') || (\'fees_collection_report\', \'can_view\') || (\'online_fees_collection_report\', \'can_view\') || (\'income_report\', \'can_view\') || (\'expense_report\', \'can_view\') || (\'payroll_report\', \'can_view\') || (\'income_group_report\', \'can_view\') || (\'expense_group_report\', \'can_view\') || (\'attendance_report\', \'can_view\') || (\'staff_attendance_report\', \'can_view\') || (\'exam_marks_report\', \'can_view\') ||        (\'online_exam_wise_report\', \'can_view\') || (\'online_exams_report\', \'can_view\') || (\'online_exams_attempt_report\', \'can_view\') || (\'online_exams_rank_report\', \'can_view\') || (\'payroll_report\', \'can_view\') || (\'transport_report\', \'can_view\') || (\'hostel_report\', \'can_view\') || (\'audit_trail_report\', \'can_view\') || (\'user_log\', \'can_view\') || (\'book_issue_report\', \'can_view\') || (\'book_due_report\', \'can_view\') || (\'book_inventory_report\', \'can_view\') || (\'stock_report\', \'can_view\') ||      (\'add_item_report\', \'can_view\') || (\'issue_inventory_report\', \'can_view\') || (\'syllabus_status_report\', \'can_view\') ||    (\'teacher_syllabus_status_report\', \'can_view\') || (\'daily_collection_report\', \'can_view\') || (\'balance_fees_statement\', \'can_view\') || (\'balance_fees_report_with_remark\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(27, 15, 'fa fa-gears ftlayer', 'System Settings', 'system_settings', 'system_setting', 230, 29, 1, '(\'general_setting\', \'can_view\') || (\'session_setting\', \'can_view\') || (\'notification_setting\', \'can_view\') || (\'sms_setting\', \'can_view\') || (\'email_setting\', \'can_view\') || (\'payment_methods\', \'can_view\') || (\'languages\', \'can_view\') || (\'user_status\', \'can_view\') || (\'backup_restore\', \'can_view\') || (\'print_header_footer\', \'can_view\') || (\'backup\', \'can_view\') || (\'front_cms_setting\', \'can_view\') || (\'custom_fields\', \'can_view\') || (\'system_fields\', \'can_view\') || (\'student_profile_update\', \'can_view\') || (\'currency\', \'can_view\') || (\'language_switcher\', \'can_view\') || (\'sidebar_menu\', \'can_view\') || (\'online_admission\', \'can_view\')\r\n', 1, '2023-01-10 12:49:37'),
(28, 700, 'fa fa-file-video-o ftlayer', 'Online Course', 'online_course', 'online_course', 0, 4, 1, '(\'online_course\', \'can_view\') || (\'online_course_offline_payment\', \'can_view\') || (\'student_course_purchase_report\', \'can_view\') || (\'course_sell_count_report\', \'can_view\') || (\'online_course_setting\', \'can_view\')|| (\'course_category\', \'can_view\') || (\'guest_report\', \'can_view\')|| (\'course_rating_report\', \'can_view\')', 1, '2023-01-10 12:49:51'),
(29, 600, 'fa fa-video-camera ftlayer', 'Gmeet Live Classes', 'gmeet_live_classes', 'gmeet_live_classes', 0, 5, 1, '(\'gmeet_live_classes\', \'can_view\')) || (\'gmeet_live_meeting\', \'can_view\') || (\'gmeet_live_meeting_report\', \'can_view\') || (\'gmeet_live_classes_report\', \'can_view\')', 1, '2023-01-10 12:49:51');

-- --------------------------------------------------------

--
-- Table structure for table `sidebar_sub_menus`
--

CREATE TABLE `sidebar_sub_menus` (
  `id` int(11) NOT NULL,
  `sidebar_menu_id` int(11) DEFAULT NULL,
  `menu` varchar(500) DEFAULT NULL,
  `key` varchar(500) DEFAULT NULL,
  `lang_key` varchar(250) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `access_permissions` varchar(500) DEFAULT NULL,
  `permission_group_id` int(11) DEFAULT NULL,
  `activate_controller` varchar(100) DEFAULT NULL COMMENT 'income',
  `activate_methods` varchar(500) DEFAULT NULL COMMENT 'index,edit',
  `addon_permission` varchar(100) DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sidebar_sub_menus`
--

INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES
(1, 1, 'admission_enquiry', NULL, 'admission_enquiry', 'admin/enquiry', 1, '(\'admission_enquiry\', \'can_view\')', NULL, 'enquiry', 'index', NULL, 1, '2022-07-11 12:04:46'),
(2, 1, 'visitor_book', NULL, 'visitor_book', 'admin/visitors', 2, '(\'visitor_book\', \'can_view\')', NULL, 'visitors', 'index', NULL, 1, '2022-07-11 12:04:46'),
(3, 1, 'phone_call_log', NULL, 'phone_call_log', 'admin/generalcall', 3, '(\'phone_call_log\', \'can_view\')', NULL, 'generalcall', 'index,edit', NULL, 1, '2022-05-10 11:40:07'),
(4, 1, 'postal_dispatch', NULL, 'postal_dispatch', 'admin/dispatch', 4, '(\'postal_dispatch\', \'can_view\')', NULL, 'dispatch', 'index,editdispatch', NULL, 1, '2022-05-10 11:40:09'),
(5, 1, 'postal_receive', NULL, 'postal_receive', 'admin/receive', 5, '(\'postal_receive\', \'can_view\')', NULL, 'receive', 'index,editreceive', NULL, 1, '2022-05-10 11:40:09'),
(6, 1, 'complain', NULL, 'complain', 'admin/complaint', 6, '(\'complaint\', \'can_view\')', NULL, 'complaint', 'index,edit', NULL, 1, '2022-05-10 11:40:00'),
(7, 1, 'setup_front_office', NULL, 'setup_front_office', 'admin/visitorspurpose', 7, '(\'setup_font_office\', \'can_view\')', NULL, 'visitorspurpose', 'index,edit', NULL, 1, '2022-04-18 15:43:15'),
(9, 2, 'student_admission', NULL, 'student_admission', 'student/create', 2, '(\'student\', \'can_add\')', NULL, 'student', 'create,import', NULL, 1, '2022-08-30 07:51:02'),
(10, 2, 'online_admission', NULL, 'online_admission', 'admin/onlinestudent', 3, '(\'online_admission\', \'can_view\')', 27, 'onlinestudent', 'index,edit', NULL, 1, '2022-05-10 11:40:30'),
(11, 2, 'disable_student', NULL, 'disabled_students', 'student/disablestudentslist', 4, '(\'disable_student\', \'can_view\')', NULL, 'student', 'disablestudentslist', '', 1, '2022-07-23 06:49:00'),
(12, 3, 'collect_fees', NULL, 'collect_fees', 'studentfee', 1, '(\'collect_fees\', \'can_view\')', NULL, 'studentfee', 'index,addfee', NULL, 1, '2022-07-23 06:53:34'),
(13, 3, 'search_fees_payment', NULL, 'search_fees_payment', 'studentfee/searchpayment', 3, '(\'search_fees_payment\', \'can_view\')', NULL, 'studentfee', 'searchpayment', NULL, 1, '2022-08-08 06:03:40'),
(14, 3, 'search_due_fees', NULL, 'search_due_fees', 'studentfee/feesearch', 4, '(\'search_due_fees\', \'can_view\')', NULL, 'studentfee', 'feesearch', NULL, 1, '2022-08-08 06:03:38'),
(15, 3, 'fees_master', NULL, 'fees_master', 'admin/feemaster', 5, '(\'fees_master\', \'can_view\')', NULL, 'feemaster', 'index,assign,edit', NULL, 1, '2022-09-24 07:35:55'),
(16, 3, 'fees_group', NULL, 'fees_group', 'admin/feegroup', 6, '(\'fees_group\', \'can_view\')', NULL, 'feegroup', 'index,edit', NULL, 1, '2022-08-08 06:03:32'),
(17, 4, 'add_income', NULL, 'add_income', 'admin/income', 1, '(\'income\', \'can_view\')', NULL, 'income', 'index,edit', NULL, 1, '2022-07-23 07:03:40'),
(18, 4, 'search_income', NULL, 'search_income', 'admin/income/incomesearch', 2, '(\'search_income\', \'can_view\')', NULL, 'income', 'incomesearch', NULL, 1, '2022-07-23 07:10:13'),
(19, 4, 'income_head', NULL, 'income_head', 'admin/incomehead', 3, '(\'income_head\', \'can_view\')', NULL, 'incomehead', 'index,edit', NULL, 1, '2022-07-23 07:11:11'),
(20, 2, 'student_details', NULL, 'student_details', 'student/search', 1, '(\'student\', \'can_view\')', NULL, 'student', 'search,view,edit', NULL, 1, '2022-08-30 07:51:05'),
(21, 2, 'multi_class_student', NULL, 'multi_class_student', 'student/multiclass', 5, '(\'multi_class_student\', \'can_view\')', 26, 'student', 'multiclass', NULL, 1, '2022-07-23 06:48:37'),
(22, 2, 'bulk_delete', NULL, 'bulk_delete', 'student/bulkdelete', 6, '(\'student\', \'can_delete\')', NULL, 'student', 'bulkdelete', NULL, 1, '2022-07-23 06:48:11'),
(23, 2, 'student_categories', NULL, 'student_categories', 'category', 7, '(\'student_categories\', \'can_view\')', NULL, 'category', 'index,edit', NULL, 1, '2022-07-23 06:47:24'),
(24, 2, 'student_house', NULL, 'student_house', 'admin/schoolhouse', 8, '(\'student_houses\', \'can_view\')', NULL, 'schoolhouse', 'index,edit', NULL, 1, '2022-07-23 06:49:59'),
(25, 2, 'disable_reason', NULL, 'disable_reason', 'admin/disable_reason', 9, '(\'disable_reason\', \'can_view\')', NULL, 'disable_reason', 'index,edit', NULL, 1, '2022-07-23 06:50:41'),
(29, 7, 'add_expense', NULL, 'add_expense', 'admin/expense', 1, '(\'expense\', \'can_view\')', NULL, 'expense', 'index,edit', '', 1, '2022-07-23 07:12:25'),
(32, 3, 'fees_type', NULL, 'fees_type', 'admin/feetype', 7, '(\'fees_type\', \'can_view\')', NULL, 'feetype', 'index,edit', '', 1, '2022-08-08 06:03:29'),
(33, 10, 'attendance_by_date', 'attendance_by_date', 'attendance_by_date', 'admin/stuattendence/attendencereport', 3, '(\'attendance_by_date\', \'can_view\')', NULL, 'stuattendence', 'attendencereport', '', 1, '2022-10-20 05:50:25'),
(34, 10, 'student_attendance', 'student_attendance', 'student_attendance', 'admin/stuattendence', 1, '(\'student_attendance\', \'can_view\')', NULL, 'stuattendence', 'index', '', 1, '2022-10-20 05:50:25'),
(35, 10, 'approve_leave', 'approve_leave', 'approve_leave', 'admin/approve_leave', 2, '(\'approve_leave\', \'can_view\')', NULL, 'approve_leave', 'index', '', 1, '2022-10-14 16:16:44'),
(36, 11, 'exam_group', NULL, 'exam_group', 'admin/examgroup', 1, '(\'exam_group\', \'can_view\')', NULL, 'examgroup', 'index,addexam,edit', '', 1, '2023-10-05 15:22:43'),
(37, 11, 'exam_schedule', NULL, 'exam_schedule', 'admin/exam_schedule', 2, '(\'student_attendance\', \'can_view\')', NULL, 'exam_schedule', 'index', '', 1, '2023-10-05 15:22:43'),
(38, 11, 'exam_result', NULL, 'exam_result', 'admin/examresult', 3, '(\'exam_result\', \'can_view\')', NULL, 'examresult', 'index', '', 1, '2023-10-05 15:22:40'),
(39, 11, 'design_admit_card', NULL, 'design_admit_card', 'admin/admitcard', 4, '(\'design_admit_card\', \'can_view\')', NULL, 'admitcard', 'index,edit', '', 1, '2023-10-05 15:22:40'),
(40, 11, 'print_admit_card', NULL, 'print_admit_card', 'admin/examresult/admitcard', 5, '(\'print_admit_card\', \'can_view\')', NULL, 'examresult', 'admitcard', '', 1, '2023-10-05 15:22:40'),
(41, 11, 'design_marksheet', NULL, 'design_marksheet', 'admin/marksheet', 6, '(\'design_marksheet\', \'can_view\')', NULL, 'marksheet', 'index,edit', '', 1, '2023-10-05 15:22:40'),
(42, 11, 'print_marksheet', NULL, 'print_marksheet', 'admin/examresult/marksheet', 7, '(\'print_marksheet\', \'can_view\')', NULL, 'examresult', 'marksheet', '', 1, '2023-10-05 15:22:40'),
(43, 11, 'marks_grade', NULL, 'marks_grade', 'admin/grade', 8, '(\'marks_grade\', \'can_view\')', NULL, 'grade', 'index,edit', '', 1, '2023-10-05 15:22:40'),
(44, 11, 'marks_division', NULL, 'marks_division', 'admin/marksdivision', 9, '(\'marks_division\', \'can_view\')', NULL, 'marksdivision', 'index,edit', '', 1, '2023-10-05 15:22:40'),
(45, 12, 'online_exam', NULL, 'online_exam', 'admin/onlineexam', 1, '(\'online_examination\', \'can_view\')', NULL, 'onlineexam', 'index,evalution,assign', '', 1, '2022-08-30 13:03:45'),
(46, 12, 'question_bank', NULL, 'question_bank', 'admin/question', 1, '(\'question_bank\', \'can_view\')', NULL, 'question', 'index,read', '', 1, '2022-08-30 11:03:13'),
(47, 13, 'manage_lesson_plan', NULL, 'manage_lesson_plan', 'admin/syllabus', 2, '(\'manage_lesson_plan\', \'can_view\')', NULL, 'syllabus', 'index', '', 1, '2022-09-03 16:59:31'),
(48, 13, 'manage_syllabus_status', NULL, 'manage_syllabus_status', 'admin/syllabus/status', 3, '(\'manage_syllabus_status\', \'can_view\')', NULL, 'syllabus', 'status', '', 1, '2022-09-03 16:59:35'),
(49, 13, 'lesson', NULL, 'lesson', 'admin/lessonplan/lesson', 4, '(\'lesson\', \'can_view\')', NULL, 'lessonplan', 'lesson,editlesson', '', 1, '2022-09-15 11:30:55'),
(50, 13, 'topic', NULL, 'topic', 'admin/lessonplan/topic', 5, '(\'topic\', \'can_view\')', NULL, 'lessonplan', 'topic,edittopic', '', 1, '2022-09-15 11:30:24'),
(51, 14, 'class_timetable', NULL, 'class_timetable', 'admin/timetable/classreport', 1, '(\'class_timetable\', \'can_view\')', NULL, 'timetable', 'classreport,create', '', 1, '2022-07-23 09:01:22'),
(52, 14, 'teachers_timetable', NULL, 'teachers_timetable', 'admin/timetable/mytimetable', 2, '(\'teachers_time_table\', \'can_view\')', NULL, 'timetable', 'mytimetable', '', 1, '2022-07-20 12:22:59'),
(53, 14, 'assign_class_teacher', NULL, 'assign_class_teacher', 'admin/teacher/assign_class_teacher', 3, '(\'assign_class_teacher\', \'can_view\')', NULL, 'teacher', 'assign_class_teacher,update_class_teacher', '', 1, '2022-07-23 09:00:19'),
(54, 14, 'promote_students', NULL, 'promote_students', 'admin/stdtransfer', 4, '(\'promote_student\', \'can_view\')', NULL, 'stdtransfer', 'index', '', 1, '2022-07-20 12:22:54'),
(55, 14, 'subject_group', NULL, 'subject_group', 'admin/subjectgroup', 5, '(\'subject_group\', \'can_view\')', NULL, 'subjectgroup', 'index,edit', '', 1, '2022-07-23 08:59:42'),
(56, 14, 'subjects', NULL, 'subjects', 'admin/subject', 6, '(\'subject\', \'can_view\')', NULL, 'subject', 'index,edit', '', 1, '2022-07-23 08:59:20'),
(57, 14, 'class', NULL, 'class', 'classes', 7, '(\'class\', \'can_view\')', NULL, 'classes', 'index,edit', '', 1, '2022-07-23 08:58:49'),
(58, 14, 'sections', NULL, 'sections', 'sections', 8, '(\'section\', \'can_view\')', NULL, 'sections', 'index,edit', '', 1, '2022-07-23 08:58:21'),
(59, 15, 'staff_directory', NULL, 'staff_directory', 'admin/staff', 1, '(\'staff\', \'can_view\')', NULL, 'staff', 'index,edit,profile,create', '', 1, '2022-10-12 09:13:24'),
(60, 15, 'staff_attendance', NULL, 'staff_attendance', 'admin/staffattendance', 1, '(\'staff_attendance\', \'can_view\')', NULL, 'staffattendance', 'index', '', 1, '2022-09-07 12:04:15'),
(61, 15, 'payroll', NULL, 'payroll', 'admin/payroll', 1, '(\'staff_payroll\', \'can_view\')', NULL, 'payroll', 'index,edit,create', '', 1, '2022-08-16 11:58:44'),
(62, 15, 'approve_leave_request', NULL, 'approve_leave_request', 'admin/leaverequest/leaverequest', 1, '(\'approve_leave_request\', \'can_view\')', NULL, 'leaverequest', 'leaverequest', '', 1, '2022-05-16 09:04:33'),
(74, 15, 'apply_leave', NULL, 'apply_leave', 'admin/staff/leaverequest', 1, '(\'apply_leave\', \'can_view\')', NULL, 'staff', 'leaverequest', '', 1, '2022-05-16 09:11:41'),
(75, 15, 'leave_type', NULL, 'leave_type', 'admin/leavetypes', 1, '(\'leave_types\', \'can_view\')', NULL, 'leavetypes', 'index,leaveedit,createleavetype', '', 1, '2022-10-18 11:19:22'),
(76, 15, 'teachers_rating', NULL, 'teachers_rating', 'admin/staff/rating', 1, '(\'teachers_rating\', \'can_view\')', NULL, 'staff', 'rating', '', 1, '2022-05-16 09:15:31'),
(77, 15, 'department', NULL, 'department', 'admin/department/department', 1, '(\'department\', \'can_view\')', NULL, 'department', 'department,departmentedit', '', 1, '2022-07-23 09:14:20'),
(78, 15, 'designation', NULL, 'designation', 'admin/designation/designation', 1, '(\'designation\', \'can_view\')', NULL, 'designation', 'designation,designationedit', '', 1, '2022-07-23 09:15:04'),
(79, 15, 'disabled_staff', NULL, 'disabled_staff', 'admin/staff/disablestafflist', 1, '(\'disable_staff\', \'can_view\')', NULL, 'staff', 'disablestafflist', '', 1, '2022-09-13 07:46:56'),
(80, 16, 'notice_board', NULL, 'notice_board', 'admin/notification', 1, '(\'notice_board\', \'can_view\')', NULL, 'notification', 'index,edit,add', '', 1, '2022-07-23 09:17:24'),
(81, 16, 'send_email', NULL, 'send_email', 'admin/mailsms/compose', 2, '(\'email\', \'can_view\')', NULL, 'mailsms', 'compose', '', 1, '2022-09-02 16:52:46'),
(82, 16, 'send_sms', NULL, 'send_sms', 'admin/mailsms/compose_sms', 3, '(\'sms\', \'can_view\')', NULL, 'mailsms', 'compose_sms', '', 1, '2022-09-02 16:52:46'),
(83, 16, 'email_sms_log', NULL, 'email_sms_log', 'admin/mailsms/index', 4, '(\'email_sms_log\', \'can_view\')', NULL, 'mailsms', 'index', '', 1, '2022-09-02 16:52:50'),
(84, 16, 'schedule_email_sms_log', NULL, 'schedule_email_sms_log', 'admin/mailsms/schedule', 5, '(\'schedule_email_sms_log\', \'can_view\')', NULL, 'mailsms', 'schedule,edit_schedule', '', 1, '2022-09-13 07:07:38'),
(85, 16, 'login_credentials_send', NULL, 'login_credentials_send', 'student/bulkmail', 6, '(\'login_credentials_send\', \'can_view\')', NULL, 'student', 'bulkmail', '', 1, '2022-09-02 16:52:46'),
(86, 16, 'email_template', NULL, 'email_template', 'admin/mailsms/email_template', 7, '(\'email_template\', \'can_view\')', NULL, 'mailsms', 'email_template', '', 1, '2022-09-02 16:52:46'),
(87, 16, 'sms_template', NULL, 'sms_template', 'admin/mailsms/sms_template', 8, '(\'sms_template\', \'can_view\')', NULL, 'mailsms', 'sms_template', '', 1, '2022-09-02 16:52:46'),
(88, 17, 'content_type', NULL, 'content_type', 'admin/contenttype', 1, '(\'content_type\', \'can_view\')', NULL, 'contenttype', 'index,edit', '', 1, '2022-07-23 09:24:45'),
(89, 17, 'content_share_list', NULL, 'content_share_list', 'admin/content/list', 1, '(\'content_share_list\', \'can_view\')', NULL, 'content', 'list', '', 1, '2022-07-22 10:07:17'),
(90, 17, 'upload_content', NULL, 'upload_content', 'admin/content/upload', 1, '(\'upload_content\', \'can_view\')', NULL, 'content', 'upload', '', 1, '2022-07-22 10:07:17'),
(91, 17, 'video_tutorial', NULL, 'video_tutorial', 'admin/video_tutorial', 1, '(\'video_tutorial\', \'can_view\')', NULL, 'video_tutorial', 'index', '', 1, '2022-07-22 10:07:17'),
(92, 18, 'add_homework', NULL, 'add_homework', 'homework', 1, '(\'homework\', \'can_view\')', NULL, 'homework', 'index', '', 1, '2022-06-25 09:50:01'),
(93, 18, 'daily_assignment', NULL, 'daily_assignment', 'homework/dailyassignment', 2, '(\'daily_assignment\', \'can_view\')', NULL, 'homework', 'dailyassignment', '', 1, '2022-07-23 09:27:23'),
(94, 19, 'book_list', NULL, 'book_list', 'admin/book/getall', 1, '(\'books\', \'can_view\')', NULL, 'book', 'getall,index,edit,import,issue_returnreport', '', 1, '2022-09-07 11:45:50'),
(95, 19, 'issue_return', NULL, 'issue_return', 'admin/member', 1, '(\'issue_return\', \'can_view\')', NULL, 'member', 'index,issue', '', 1, '2022-07-23 09:32:48'),
(96, 19, 'add_student', NULL, 'add_student', 'admin/member/student', 1, '(\'add_student\', \'can_view\')', NULL, 'member', 'student', '', 1, '2022-05-16 11:22:54'),
(97, 19, 'add_staff_member', NULL, 'add_staff_member', 'admin/member/teacher', 1, '(\'add_staff_member\', \'can_view\')', NULL, 'member', 'teacher', '', 1, '2022-05-16 11:31:43'),
(98, 7, 'search_expense', NULL, 'search_expense', 'admin/expense/expensesearch', 1, '(\'search_expense\', \'can_view\')', NULL, 'expense', 'expensesearch', '', 1, '2022-05-16 11:36:09'),
(99, 7, 'expense_head', NULL, 'expense_head', 'admin/expensehead', 1, '(\'expense_head\', \'can_view\')', NULL, 'expensehead', 'index,edit', '', 1, '2022-07-23 07:16:17'),
(100, 20, 'issue_item', NULL, 'issue_item', 'admin/issueitem', 1, '(\'issue_item\', \'can_view\')', NULL, 'issueitem', 'index,create', '', 1, '2022-07-23 09:35:03'),
(101, 20, 'add_item_stock', NULL, 'add_item_stock', 'admin/itemstock', 1, '(\'item_stock\', \'can_view\')', NULL, 'itemstock', 'index,edit', '', 1, '2022-07-23 09:36:17'),
(102, 20, 'add_item', NULL, 'add_item', 'admin/item', 1, '(\'item\', \'can_view\')', NULL, 'item', 'index,edit', '', 1, '2022-07-23 09:36:56'),
(103, 20, 'item_category', NULL, 'item_category', 'admin/itemcategory', 1, '(\'item_category\', \'can_view\')', NULL, 'itemcategory', 'index,edit', '', 1, '2022-07-23 09:37:12'),
(104, 20, 'item_store', NULL, 'item_store', 'admin/itemstore', 1, '(\'store\', \'can_view\')', NULL, 'itemstore', 'index,edit,create', '', 1, '2022-09-16 11:49:03'),
(105, 20, 'item_supplier', NULL, 'item_supplier', 'admin/itemsupplier', 1, '(\'supplier\', \'can_view\')', NULL, 'itemsupplier', 'index,edit,create', '', 1, '2022-07-23 09:38:22'),
(106, 21, 'fees_master', NULL, 'fees_master', 'admin/transport/feemaster', 1, '(\'transport\', \'can_view\')', NULL, 'transport', 'feemaster', '', 1, '2022-07-16 13:15:23'),
(107, 21, 'pickup_point', NULL, 'pickup_point', 'admin/pickuppoint', 1, '(\'transport\', \'can_view\')', NULL, 'pickuppoint', 'index', '', 1, '2022-05-16 12:25:27'),
(108, 21, 'routes', NULL, 'routes', 'admin/route', 1, '(\'routes\', \'can_view\')', NULL, 'route', 'index,edit', '', 1, '2022-09-17 06:21:23'),
(109, 21, 'vehicles', NULL, 'vehicles', 'admin/vehicle', 1, '(\'vehicle\', \'can_view\')', NULL, 'vehicle', 'index', '', 1, '2022-05-16 12:29:35'),
(110, 21, 'assign_vehicle', NULL, 'assign_vehicle', 'admin/vehroute', 1, '(\'assign_vehicle\',\'can_view\')', NULL, 'vehroute', 'index,edit', '', 1, '2022-10-19 07:06:08'),
(111, 21, 'route_pickup_point', NULL, 'route_pickup_point', 'admin/pickuppoint/assign', 1, '(\'transport\', \'can_view\')', NULL, 'pickuppoint', 'assign', '', 1, '2022-05-16 12:33:05'),
(112, 21, 'student_transport_fees', NULL, 'student_transport_fees', 'admin/pickuppoint/student_fees', 1, '(\'transport\', \'can_view\')', NULL, 'pickuppoint', 'student_fees', '', 1, '2022-05-16 12:49:48'),
(113, 22, 'hostel_rooms', NULL, 'hostel_rooms', 'admin/hostelroom', 1, '(\'hostel_rooms\', \'can_view\')', NULL, 'hostelroom', 'index,edit', '', 1, '2022-07-23 10:27:48'),
(114, 22, 'room_type', NULL, 'room_type', 'admin/roomtype', 2, '(\'room_type\', \'can_view\')', NULL, 'roomtype', 'index,edit', '', 1, '2022-07-23 10:32:14'),
(115, 22, 'hostel', NULL, 'hostel', 'admin/hostel', 3, '(\'hostel\', \'can_view\')', NULL, 'hostel', 'index,edit', '', 1, '2022-07-23 10:32:39'),
(116, 23, 'student_certificate', NULL, 'student_certificate', 'admin/certificate', 1, '(\'student_certificate\', \'can_view\')', NULL, 'certificate', 'index,edit', '', 1, '2022-07-23 10:44:30'),
(117, 23, 'generate_certificate', NULL, 'generate_certificate', 'admin/generatecertificate', 1, '(\'generate_certificate\', \'can_view\')', NULL, 'generatecertificate', 'index,search', '', 1, '2022-07-23 10:46:16'),
(118, 23, 'student_id_card', NULL, 'student_id_card', 'admin/studentidcard', 1, '(\'student_id_card\', \'can_view\')', NULL, 'studentidcard', 'index,edit', '', 1, '2022-07-23 10:47:01'),
(119, 23, 'generate_id_card', NULL, 'generate_id_card', 'admin/generateidcard/search', 1, '(\'generate_id_card\', \'can_view\')', NULL, 'generateidcard', 'search', '', 1, '2022-05-18 05:35:13'),
(120, 23, 'staff_id_card', NULL, 'staff_id_card', 'admin/staffidcard', 1, '(\'staff_id_card\', \'can_view\')', NULL, 'staffidcard', 'index,edit', '', 1, '2022-07-23 10:48:13'),
(121, 23, 'generate_staff_id_card', NULL, 'generate_staff_id_card', 'admin/generatestaffidcard', 1, '(\'generate_staff_id_card\', \'can_view\')', NULL, 'generatestaffidcard', 'index,search', '', 1, '2022-07-23 10:49:06'),
(122, 24, 'event', NULL, 'event', 'admin/front/events', 1, '(\'event\', \'can_view\')', NULL, 'events', 'index,edit,create', '', 1, '2022-07-23 10:51:51'),
(123, 24, 'gallery', NULL, 'gallery', 'admin/front/gallery', 1, '(\'gallery\', \'can_view\')', NULL, 'gallery', 'index,edit,create', '', 1, '2022-07-23 10:52:22'),
(124, 24, 'news', NULL, 'news', 'admin/front/notice', 1, '(\'notice\', \'can_view\')', NULL, 'notice', 'index,edit,create', '', 1, '2022-07-23 10:54:23'),
(125, 24, 'media_manager', NULL, 'media_manager', 'admin/front/media', 1, '(\'media_manager\', \'can_view\')', NULL, 'media', 'index', '', 1, '2022-05-18 06:03:32'),
(126, 24, 'pages', NULL, 'pages', 'admin/front/page', 1, '(\'pages\', \'can_view\')', NULL, 'page', 'index,edit,create', '', 1, '2022-07-23 10:55:28'),
(127, 24, 'menus', NULL, 'menus', 'admin/front/menus', 1, '(\'menus\', \'can_view\')', NULL, 'menus', 'index,additem', '', 1, '2022-07-23 10:56:31'),
(128, 24, 'banner_images', NULL, 'banner_images', 'admin/front/banner', 1, '(\'banner_images\', \'can_view\')', NULL, 'banner', 'index', '', 1, '2022-05-18 06:10:53'),
(129, 25, 'manage_alumini', NULL, 'manage_alumini', 'admin/alumni/alumnilist', 1, '(\'manage_alumni\', \'can_view\')', NULL, 'alumni', 'alumnilist', '', 1, '2022-07-23 10:58:36'),
(130, 25, 'events', NULL, 'events', 'admin/alumni/events', 1, '(\'events\', \'can_view\')', NULL, 'alumni', 'events', '', 1, '2022-07-23 10:59:09'),
(131, 26, 'student_information', NULL, 'student_information', 'report/studentinformation', 1, '(\'student_report\', \'can_view\') || (\'guardian_report\', \'can_view\') || (\'student_history\', \'can_view\') || (\'student_login_credential_report\', \'can_view\') || (\'class_subject_report\', \'can_view\') || (\'admission_report\', \'can_view\') || (\'sibling_report\', \'can_view\') || (\'homehork_evaluation_report\', \'can_view\') || (\'student_profile\', \'can_view\') || (\'student_gender_ratio_report\', \'can_view\') || (\'student_teacher_ratio_report\', \'can_view\')', NULL, 'report', 'studentinformation,studentreport,online_admission_report,student_teacher_ratio,boys_girls_ratio,student_profile,sibling_report,admission_report,class_subject,classsectionreport,guardianreport,admissionreport,logindetailreport,parentlogindetailreport', '', 1, '2022-09-26 05:26:53'),
(132, 26, 'finance', NULL, 'finance', 'financereports/finance', 2, '(\'fees_statement\', \'can_view\') || (\'balance_fees_report\', \'can_view\') || (\'fees_collection_report\', \'can_view\') || (\'online_fees_collection_report\', \'can_view\') || (\'income_report\', \'can_view\') || (\'expense_report\', \'can_view\') || (\'payroll_report\', \'can_view\') || (\'income_group_report\', \'can_view\') || (\'expense_group_report\', \'can_view\') || (\'online_admission\', \'can_view\')', NULL, 'financereports', 'finance,reportduefees,reportdailycollection,reportbyname,studentacademicreport,collection_report,onlinefees_report,duefeesremark,income,expense,payroll,incomegroup,expensegroup,onlineadmission', '', 1, '2022-09-24 12:20:32'),
(133, 26, 'attendance', NULL, 'attendance', 'attendencereports/attendance', 3, '(\'attendance_report\', \'can_view\') || (\'student_attendance_type_report\', \'can_view\') || (\'daily_attendance_report\', \'can_view\') || (\'staff_attendance_report\', \'can_view\')', NULL, 'attendencereports', 'attendance,classattendencereport,attendancereport,daily_attendance_report,staffattendancereport,biometric_attlog,reportbymonthstudent,reportbymonth', '', 1, '2022-09-26 11:36:08'),
(134, 26, 'examinations', NULL, 'examinations', 'admin/examresult/examinations', 4, '(\'rank_report\', \'can_view\')', NULL, 'examresult', 'rankreport,examinations', '', 1, '2022-09-20 08:34:13'),
(135, 26, 'lesson_plan', NULL, 'lesson_plan', 'report/lesson_plan', 6, '(\'syllabus_status_report\', \'can_view\') || (\'teacher_syllabus_status_report\', \'can_view\')', NULL, 'report', 'lesson_plan,teachersyllabusstatus', '', 1, '2022-07-25 11:39:17'),
(136, 26, 'human_resource', NULL, 'human_resource', 'report/human_resource', 7, '(\'staff_report\', \'can_view\') || (\'payroll_report\', \'can_view\')', NULL, 'report', 'human_resource,staff_report,payrollreport', '', 1, '2022-07-25 11:38:20'),
(137, 26, 'library', NULL, 'library', 'report/library', 9, '(\'book_issue_report\', \'can_view\') || (\'book_due_report\', \'can_view\') || (\'book_issue_return_report\', \'can_view\') || (\'book_inventory_report\', \'can_view\')', NULL, 'report', 'library,studentbookissuereport,bookduereport,bookinventory', '', 1, '2022-09-07 11:53:15'),
(138, 26, 'inventory', NULL, 'inventory', 'report/inventory', 10, '(\'stock_report\', \'can_view\') || (\'add_item_report\', \'can_view\') || (\'issue_item_report\', \'can_view\')', NULL, 'report', 'inventory,inventorystock,additem,issueinventory', '', 1, '2022-07-25 11:30:57'),
(139, 26, 'hostel', NULL, 'hostel', 'admin/hostelroom/studenthosteldetails', 12, '(\'hostel_report\', \'can_view\')', NULL, 'hostelroom', 'studenthosteldetails', '', 1, '2022-07-20 12:30:07'),
(140, 26, 'alumni', NULL, 'alumni', 'report/alumnireport', 13, '(\'alumni_report\', \'can_view\')', NULL, 'report', 'alumnireport', '', 1, '2022-07-20 12:30:07'),
(141, 26, 'user_log', NULL, 'user_log', 'admin/userlog', 14, '(\'user_log\', \'can_view\')', NULL, 'userlog', 'index', '', 1, '2022-07-20 12:30:07'),
(142, 26, 'audit_trail_report', NULL, 'audit_trail_report', 'admin/audit', 15, '(\'audit_trail_report\', \'can_view\')', NULL, 'audit', 'index', '', 1, '2022-07-20 12:30:07'),
(143, 26, 'online_examinations', NULL, 'online_examinations', 'admin/onlineexam/report', 5, '(\'online_exam_wise_report\', \'can_view\') || (\'online_exams_report\', \'can_view\') || (\'online_exams_attempt_report\', \'can_view\') || (\'online_exams_rank_report\', \'can_view\')', NULL, 'onlineexam', 'report,onlineexams', '', 1, '2022-07-25 11:48:23'),
(144, 26, 'homework', NULL, 'homework', 'homework/homeworkordailyassignmentreport', 8, '(\'homework\', \'can_view\') || (\'daily_assignment\', \'can_view\')', NULL, 'homework', 'homeworkordailyassignmentreport,homeworkreport,evaluation_report,dailyassignmentreport', '', 1, '2022-09-21 09:28:47'),
(145, 26, 'transport', NULL, 'transport', 'admin/route/studenttransportdetails', 11, '(\'transport_report\', \'can_view\')', NULL, 'route', 'studenttransportdetails', '', 1, '2022-07-20 12:30:07'),
(146, 27, 'general_setting', NULL, 'general_setting', 'schsettings', 1, '(\'general_setting\', \'can_view\')', NULL, 'schsettings', 'index,logo,miscellaneous,backendtheme,mobileapp,studentguardianpanel,fees,idautogeneration,attendancetype,maintenance', '', 1, '2022-07-25 11:14:13'),
(147, 27, 'session_setting', NULL, 'session_setting', 'sessions', 2, '(\'session_setting\', \'can_view\')', NULL, 'sessions', 'index,edit', '', 1, '2022-07-23 11:57:16'),
(148, 27, 'notification_setting', NULL, 'notification_setting', 'admin/notification/setting', 3, '(\'notification_setting\', \'can_view\')', NULL, 'notification', 'setting', '', 1, '2022-07-08 08:12:28'),
(149, 27, 'sms_setting', NULL, 'sms_setting', 'smsconfig', 4, '(\'sms_setting\', \'can_view\')', NULL, 'smsconfig', 'index', '', 1, '2022-07-08 08:12:28'),
(150, 27, 'email_setting', NULL, 'email_setting', 'emailconfig', 5, '(\'email_setting\', \'can_view\')', NULL, 'emailconfig', 'index', '', 1, '2022-07-08 08:12:28'),
(151, 27, 'payment_methods', NULL, 'payment_methods', 'admin/paymentsettings', 6, '(\'payment_methods\', \'can_view\')', NULL, 'paymentsettings', 'index', '', 1, '2022-07-08 08:12:28'),
(152, 27, 'print_headerfooter', NULL, 'print_headerfooter', 'admin/print_headerfooter', 7, '(\'print_header_footer\', \'can_view\')', NULL, 'print_headerfooter', 'index', '', 1, '2022-07-08 08:12:28'),
(153, 27, 'front_cms_setting', NULL, 'front_cms_setting', 'admin/frontcms', 8, '(\'front_cms_setting\', \'can_view\')', NULL, 'frontcms', 'index', '', 1, '2022-07-08 08:12:28'),
(154, 27, 'roles_permissions', NULL, 'roles_permissions', 'admin/roles', 9, '(\'superadmin\', \'can_view\')', NULL, 'roles', 'index,permission', '', 1, '2022-09-09 11:03:34'),
(155, 27, 'backup_restore', NULL, 'backup_restore', 'admin/admin/backup', 10, '(\'backup\', \'can_view\')', NULL, 'admin', 'backup', '', 1, '2022-07-08 08:12:28'),
(156, 27, 'users', NULL, 'users', 'admin/users', 13, '(\'user_status\', \'can_view\')', NULL, 'users', 'index', '', 1, '2022-07-20 12:34:09'),
(157, 27, 'languages', NULL, 'languages', 'admin/language', 11, '(\'languages\', \'can_view\')', NULL, 'language', 'index,create', '', 1, '2022-09-10 09:14:52'),
(158, 27, 'modules', NULL, 'modules', 'admin/module', 14, '(\'superadmin\', \'can_view\')', NULL, 'module', 'index', '', 1, '2022-07-20 12:34:06'),
(159, 27, 'custom_fields', NULL, 'custom_fields', 'admin/customfield', 15, '(\'custom_fields\', \'can_view\')', NULL, 'customfield', 'index,edit', '', 1, '2022-07-23 12:02:14'),
(160, 27, 'captcha_setting', NULL, 'captcha_setting', 'admin/captcha', 16, '(\'superadmin\', \'can_view\')', NULL, 'captcha', 'index', '', 1, '2022-07-20 12:34:06'),
(161, 27, 'system_fields', NULL, 'system_fields', 'admin/systemfield', 17, '(\'system_fields\', \'can_view\')', NULL, 'systemfield', 'index', '', 1, '2022-07-22 06:07:38'),
(162, 27, 'student_profile_update', NULL, 'student_profile_update', 'student/profilesetting', 18, '(\'student_profile_update\', \'can_view\')', NULL, 'student', 'profilesetting', '', 1, '2022-07-20 12:34:06'),
(163, 27, 'online_admission', NULL, 'online_admission', 'admin/onlineadmission/admissionsetting', 19, '(\'online_admission\', \'can_view\')', NULL, 'onlineadmission', 'admissionsetting', '', 1, '2022-07-20 12:34:06'),
(164, 27, 'file_types', NULL, 'file_types', 'admin/admin/filetype', 20, '(\'superadmin\', \'can_view\')', NULL, 'admin', 'filetype', '', 1, '2022-07-20 12:34:30'),
(166, 27, 'sidebar_menu', NULL, 'sidebar_menu', 'admin/sidemenu', 21, '(\'sidebar_menu\', \'can_view\')', NULL, 'sidemenu', 'index', '', 1, '2022-10-13 11:49:51'),
(167, 28, 'online_course', NULL, 'online_course', 'onlinecourse/course/index', 1, '(\'online_course\', \'can_view\')', NULL, 'course', 'index', 'ssoclc', 1, '2022-05-18 07:50:11'),
(168, 28, 'offline_payment', NULL, 'offline_payment', 'onlinecourse/offlinepayment/payment', 2, '(\'online_course_offline_payment\', \'can_view\')', NULL, 'offlinepayment', 'payment', 'ssoclc', 1, '2022-12-04 10:26:40'),
(169, 28, 'course_category', NULL, 'course_category', 'onlinecourse/coursecategory/categoryadd', 3, '(\'course_category\', \'can_view\') || (\'course_category\', \'can_add\') || (\'course_category\', \'can_edit\') || (\'course_category\', \'can_delete\')', NULL, 'coursecategory', 'categoryadd,categoryedit', 'ssoclc', 1, '2023-01-02 09:23:54'),
(170, 29, 'live_class', NULL, 'live_class', 'admin/gmeet/timetable', 1, '(\'gmeet_live_classes\', \'can_view\')', NULL, 'gmeet', 'timetable', 'ssglc', 1, '2022-07-22 04:11:10'),
(171, 29, 'live_meeting', NULL, 'live_meeting', 'admin/gmeet/meeting', 2, '(\'gmeet_live_meeting\', \'can_view\')', NULL, 'gmeet', 'meeting', 'ssglc', 1, '2022-07-22 04:11:10'),
(172, 29, 'live_class_report', NULL, 'live_class_report', 'admin/gmeet/class_report', 3, '(\'gmeet_live_classes_report\', \'can_view\')', NULL, 'gmeet', 'class_report', 'ssglc', 1, '2022-07-21 11:28:45'),
(173, 29, 'live_meeting_report', NULL, 'live_meeting_report', 'admin/gmeet/meeting_report', 5, '(\'gmeet_live_meeting_report\', \'can_view\')', NULL, 'gmeet', 'meeting_report', 'ssglc', 1, '2022-07-21 11:28:45'),
(174, 29, 'setting', NULL, 'setting', 'admin/gmeet/index', 4, '(\'gmeet_setting\', \'can_view\')', NULL, 'gmeet', 'index', '', 1, '2022-07-21 11:28:45'),
(180, 28, 'online_course_report', NULL, 'online_course_report', 'onlinecourse/coursereport/report', 4, '(\'student_course_purchase_report\', \'can_view\') || (\'course_sell_count_report\', \'can_view\') || (\'course_trending_report\', \'can_view\') || (\'course_complete_report\', \'can_view\')  || (\'course_rating_report\', \'can_view\')  || (\'guest_report\', \'can_view\')', NULL, 'coursereport', 'report,coursepurchase,coursesellreport,trendingreport,completereport,courseratingreport,guestlist,quizperformance', 'ssoclc', 1, '2022-12-09 05:00:31'),
(181, 3, 'fees_discount', NULL, 'fees_discount', 'admin/feediscount', 8, '(\'fees_discount\', \'can_view\')', NULL, 'feediscount', 'index,edit,assign', '', 1, '2022-08-08 06:03:27'),
(182, 3, 'fees_carry_forward', NULL, 'fees_carry_forward', 'admin/feesforward', 9, '(\'fees_carry_forward\', \'can_view\')', NULL, 'feesforward', 'index', '', 1, '2022-08-08 06:03:24'),
(183, 3, 'fees_reminder', NULL, 'fees_reminder', 'admin/feereminder/setting', 10, '(\'fees_reminder\', \'can_view\')', NULL, 'feereminder', 'setting', '', 1, '2022-08-08 06:03:21'),
(184, 27, 'currency', NULL, 'currency', 'admin/currency', 12, '(\'currency\', \'can_view\')', NULL, 'currency', 'index', '', 1, '2022-07-20 12:34:09'),
(190, 3, 'offline_bank_payments', NULL, 'offline_bank_payments', 'admin/offlinepayment', 2, '(\'offline_bank_payments\', \'can_view\')', NULL, 'offlinepayment', 'index', '', 1, '2022-08-08 06:05:29'),
(191, 13, 'Copy Old Lessons', NULL, 'copy_old_lesson', 'admin/lessonplan/copylesson', 1, '(\'copy_old_lesson\', \'can_view\')', NULL, 'lessonplan', 'copylesson', NULL, 1, '2022-09-09 10:20:37'),
(192, 10, 'Period Attendance', 'period_attendance', 'period_attendance', 'admin/subjectattendence/index', 4, '(\'student_attendance\',\'can_view\')', NULL, 'subjectattendence', 'index', NULL, 0, '2022-10-20 05:50:25'),
(193, 10, 'Period Attendance By Date', 'period_attendance_by_date', 'period_attendance_by_date', 'admin/subjectattendence/reportbydate', 5, '(\'attendance_by_date\', \'can_view\')', NULL, 'subjectattendence', 'reportbydate', NULL, 0, '2022-10-20 05:50:25'),
(197, 28, 'setting', NULL, 'setting', 'onlinecourse/course/setting', 5, '(\'online_course_setting\', \'can_view\')', NULL, 'course', 'setting', '', 1, '2022-07-22 01:13:30'),
(199, 11, 'generate_result', 'generate_result', 'generate_result', 'admin/result', 10, '(\'gererate_result\', \'can_view\')', NULL, 'result', 'index', NULL, 1, '2023-10-05 15:30:12'),
(200, 11, 'result', 'result', 'result', 'admin/result/list', 11, '(\'generate_result\', \'can_view\')', NULL, 'result', 'list', NULL, 1, '2023-10-05 15:22:31'),
(201, 11, 'boardcast', 'boardcast', 'boardcast', 'admin/result/boardcast', 12, '(\'generate_result\', \'can_view\')', NULL, 'result', 'boardcast', NULL, 1, '2023-10-05 15:22:31'),
(202, 10, 'student_behavior', 'student_behavior', 'student_behavior', 'admin/student_behavior', 1, '(\'student_behavior\', \'can_view\')', NULL, 'student_behavior', 'index', '', 1, '2022-10-20 05:50:25'),
(203, 14, 'assign_subject_teacher', NULL, 'assign_subject_teacher', 'admin/teacher/assign_subject_teacher', 9, '(\'assign_subject_teacher\', \'can_view\')', NULL, 'teacher', 'assign_subject_teacher,update_subject_teacher', NULL, 1, '2024-01-20 10:57:36');

-- --------------------------------------------------------

--
-- Table structure for table `sms_config`
--

CREATE TABLE `sms_config` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `api_id` varchar(100) NOT NULL,
  `authkey` varchar(100) NOT NULL,
  `senderid` varchar(100) NOT NULL,
  `contact` text DEFAULT NULL,
  `username` varchar(150) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'disabled',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_template`
--

CREATE TABLE `sms_template` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE `source` (
  `id` int(11) NOT NULL,
  `source` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(200) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `currency_id` int(11) DEFAULT 0,
  `department` int(11) DEFAULT NULL,
  `designation` int(11) DEFAULT NULL,
  `qualification` varchar(200) NOT NULL,
  `work_exp` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `father_name` varchar(200) NOT NULL,
  `mother_name` varchar(200) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `emergency_contact_no` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `dob` date NOT NULL,
  `marital_status` varchar(100) NOT NULL,
  `date_of_joining` date DEFAULT NULL,
  `date_of_leaving` date DEFAULT NULL,
  `local_address` varchar(300) NOT NULL,
  `permanent_address` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `password` varchar(250) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `account_title` varchar(200) NOT NULL,
  `bank_account_no` varchar(200) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `ifsc_code` varchar(200) NOT NULL,
  `bank_branch` varchar(100) NOT NULL,
  `payscale` varchar(200) NOT NULL,
  `basic_salary` int(11) DEFAULT NULL,
  `epf_no` varchar(200) NOT NULL,
  `contract_type` varchar(100) NOT NULL,
  `shift` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `linkedin` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `resume` varchar(200) NOT NULL,
  `joining_letter` varchar(200) NOT NULL,
  `resignation_letter` varchar(200) NOT NULL,
  `other_document_name` varchar(200) NOT NULL,
  `other_document_file` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `verification_code` varchar(100) NOT NULL,
  `disable_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `currency_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `disable_at`) VALUES
(1, '9000', 0, 150, NULL, NULL, '', '', 'Super Admin', '', '', '', '', '', 'admin@schools.247pos.ng', '2020-01-01', '', NULL, NULL, '', '', '', '1722934781-29784789466b1e5fd36372!20230920_214307_0001.png', '$2y$10$uT5EZE2CPMwqes2mFe1HSeVT9Y1WMv.mG5tIk/Eohwhv56Ni2NeDS', 'Male', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', NULL),
(2, 'ETSA715001', 0, 0, NULL, NULL, '', '', 'victoria', 'johnson', '', '', '', '', 'edricnigerialimited@gmail.com', '2023-05-31', '', '2023-05-31', NULL, '', '', '', '1687388340-31382151649380b4b7a9b!ets.png', '$2y$10$G7IP7NeGWBhVQlkDXVquW.pWZM9NIL6mEey8zYb64aGC5fS6n1iG6', 'Male', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', NULL),
(3, 'ETSA715002', 0, 0, NULL, NULL, 'Saepe labore ea inci', 'Sed dolor ad incidid', 'Paul Chapman', 'Leblanc', 'Debra Collins', 'Dorian Kirby', 'Consequuntur qui par', 'Aliqua Voluptate ad', 'higoseni@mailinator.com', '1970-01-01', '', '1977-08-19', NULL, 'Fugit voluptatem di', 'Fugiat consequatur', 'Ipsum et libero temp', '', '$2y$10$JIKMggwLhP277CQ7iD7sN.l6EXMYE.SLMjoghXpIG3s6MM9rus.g.', 'Male', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', NULL),
(4, 'ETSA715003', 0, 0, NULL, NULL, 'Ut perferendis labor', 'Est maxime et quod ', 'Candace Cleveland', 'Mcpherson', 'Igor Maxwell', 'Daphne Hobbs', 'Ducimus deserunt do', 'In qui sapiente ut a', 'qajane@mailinator.com', '1970-01-01', '', '1977-10-19', NULL, 'Atque eaque tempora ', 'Corrupti est ducimu', 'Iure nulla atque nes', '', '$2y$10$QHqAXlx2MHFB9jLixJVTV.KuQo05a5MOEeXZjncJoCW3/aBhDcz3a', 'Male', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance`
--

CREATE TABLE `staff_attendance` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `staff_id` int(11) NOT NULL,
  `staff_attendance_type_id` int(11) NOT NULL,
  `biometric_attendence` int(11) DEFAULT 0,
  `biometric_device_data` text DEFAULT NULL,
  `remark` varchar(200) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance_type`
--

CREATE TABLE `staff_attendance_type` (
  `id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `key_value` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `staff_attendance_type`
--

INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Present', '<b class=\"text text-success\">P</b>', 'yes', '0000-00-00 00:00:00', '0000-00-00'),
(2, 'Late', '<b class=\"text text-warning\">L</b>', 'yes', '0000-00-00 00:00:00', '0000-00-00'),
(3, 'Absent', '<b class=\"text text-danger\">A</b>', 'yes', '0000-00-00 00:00:00', '0000-00-00'),
(4, 'Half Day', '<b class=\"text text-warning\">F</b>', 'yes', '2018-05-07 01:56:16', '0000-00-00'),
(5, 'Holiday', 'H', 'yes', '0000-00-00 00:00:00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `staff_designation`
--

CREATE TABLE `staff_designation` (
  `id` int(11) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_id_card`
--

CREATE TABLE `staff_id_card` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `school_address` varchar(255) NOT NULL,
  `background` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `sign_image` varchar(100) NOT NULL,
  `header_color` varchar(100) NOT NULL,
  `enable_vertical_card` int(11) NOT NULL DEFAULT 0,
  `enable_staff_role` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_id` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_department` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_designation` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_fathers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_mothers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_date_of_joining` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_permanent_address` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_dob` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_phone` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_barcode` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `status` tinyint(1) NOT NULL COMMENT '0=disable,1=enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `staff_id_card`
--

INSERT INTO `staff_id_card` (`id`, `title`, `school_name`, `school_address`, `background`, `logo`, `sign_image`, `header_color`, `enable_vertical_card`, `enable_staff_role`, `enable_staff_id`, `enable_staff_department`, `enable_designation`, `enable_name`, `enable_fathers_name`, `enable_mothers_name`, `enable_date_of_joining`, `enable_permanent_address`, `enable_staff_dob`, `enable_staff_phone`, `enable_staff_barcode`, `status`) VALUES
(1, 'Sample Staff ID Card Horizontal', 'Mount Carmel School', '110 Kings Street, CA', 'background1.png', 'logo1.png', 'sign1.png', '#9b1818', 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1),
(2, 'Sample Staff ID Card Vertical', 'Mount Carmel School', '110 Kings Street, CA', 'background1.png', 'logo1.png', 'sign1.png', '#9b1818', 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff_leave_details`
--

CREATE TABLE `staff_leave_details` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `alloted_leave` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_leave_request`
--

CREATE TABLE `staff_leave_request` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `leave_from` date NOT NULL,
  `leave_to` date NOT NULL,
  `leave_days` int(11) NOT NULL,
  `employee_remark` varchar(200) NOT NULL,
  `admin_remark` varchar(200) NOT NULL,
  `status` varchar(50) NOT NULL,
  `applied_by` int(11) DEFAULT NULL,
  `document_file` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_payroll`
--

CREATE TABLE `staff_payroll` (
  `id` int(11) NOT NULL,
  `basic_salary` int(11) NOT NULL,
  `pay_scale` varchar(200) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `is_active` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_payslip`
--

CREATE TABLE `staff_payslip` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `basic` float(10,2) NOT NULL,
  `total_allowance` float(10,2) NOT NULL,
  `total_deduction` float(10,2) NOT NULL,
  `leave_deduction` int(11) NOT NULL,
  `tax` varchar(200) NOT NULL,
  `net_salary` float(10,2) NOT NULL,
  `status` varchar(100) NOT NULL,
  `month` varchar(200) NOT NULL,
  `year` varchar(200) NOT NULL,
  `payment_mode` varchar(200) NOT NULL,
  `payment_date` date NOT NULL,
  `remark` varchar(200) NOT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_rating`
--

CREATE TABLE `staff_rating` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `rate` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 decline, 1 Approve',
  `entrydt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_roles`
--

CREATE TABLE `staff_roles` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `staff_roles`
--

INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 7, 1, 0, '2023-06-21 10:14:17', NULL),
(2, 2, 2, 0, '2023-06-21 22:59:01', NULL),
(3, 2, 3, 0, '2024-08-06 10:15:39', NULL),
(4, 1, 4, 0, '2024-08-06 11:21:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_timeline`
--

CREATE TABLE `staff_timeline` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(300) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `admission_no` varchar(100) DEFAULT NULL,
  `roll_no` varchar(100) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `rte` varchar(20) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `cast` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `school_house_id` int(11) DEFAULT NULL,
  `blood_group` varchar(200) NOT NULL,
  `hostel_room_id` int(11) DEFAULT NULL,
  `adhar_no` varchar(100) DEFAULT NULL,
  `samagra_id` varchar(100) DEFAULT NULL,
  `bank_account_no` varchar(100) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `ifsc_code` varchar(100) DEFAULT NULL,
  `guardian_is` varchar(100) NOT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `father_phone` varchar(100) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `mother_phone` varchar(100) DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_relation` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(100) DEFAULT NULL,
  `guardian_occupation` varchar(150) NOT NULL,
  `guardian_address` text DEFAULT NULL,
  `guardian_email` varchar(100) DEFAULT NULL,
  `father_pic` varchar(200) NOT NULL,
  `mother_pic` varchar(200) NOT NULL,
  `guardian_pic` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `previous_school` text DEFAULT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `measurement_date` date DEFAULT NULL,
  `dis_reason` int(11) NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  `dis_note` text NOT NULL,
  `app_key` text DEFAULT NULL,
  `parent_app_key` text DEFAULT NULL,
  `disable_at` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `school_house_id`, `blood_group`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES
(20, 40, 'ETSA045017', NULL, '2024-08-06', 'Blaine', 'Daryl Morton', 'Woodward', NULL, NULL, 'Vel exercitationem a', 'ruzuja@mailinator.com', NULL, NULL, NULL, 'Quo amet anim bland', 'Reprehenderit aliqu', '0000-00-00', 'Male', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'mother', 'Vance Espinoza', '+1 (218) 132-8544', 'Ratione iure itaque ', 'Fletcher Kennedy', '+1 (506) 855-5875', 'Sit sit irure cons', 'Mason Reilly', 'Tempor mollit quis a', '+1 (271) 521-3481', 'Corporis dolorem quo', 'Aliquam blanditiis u', 'kyqapes@mailinator.com', '', '', '', 'yes', '', 'Voluptate nemo accus', 'Ut at et animi pari', '0000-00-00', 0, '', '', NULL, NULL, NULL, '2024-08-06 12:13:45', NULL),
(21, 42, 'ETSA045018', NULL, '2024-08-06', 'Willa', 'Rhiannon Gates', 'Heath', NULL, NULL, 'Explicabo Laborum v', 'mesu@mailinator.com', NULL, NULL, NULL, 'Accusamus et volupta', 'Modi sed repudiandae', '0000-00-00', 'Female', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'other', 'Keith Sims', '+1 (298) 527-3407', 'Vitae eius iste ulla', 'Adena Dale', '+1 (477) 511-9903', 'Harum aliquid eos e', 'Rowan Heath', 'Deserunt nostrud eaq', '+1 (695) 351-5774', 'Elit distinctio Co', 'In reprehenderit dol', 'verunef@mailinator.com', 'uploads/student_images/1722947764-175466474266b218b403b3e!afara.jpg', 'uploads/student_images/1722947764-90738879666b218b403def!BACK SAW.GIF', 'uploads/student_images/1722947764-164481446166b218b403f37!2 by 2 support.jpg', 'yes', '', 'Laboris sed dolores ', 'Recusandae Ut velit', '0000-00-00', 0, '', '', NULL, NULL, NULL, '2024-08-06 12:36:04', NULL),
(22, 44, 'ETSA045019', NULL, '2024-08-06', 'Adam', 'Vernon Young', 'Richmond', NULL, NULL, 'Et quis velit sit q', 'mosunaca@mailinator.com', NULL, NULL, NULL, 'Saepe facere consequ', 'Quia aut eu et aut v', '0000-00-00', 'Male', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'mother', 'Wyoming Harris', '+1 (691) 387-5886', 'Nostrum accusamus au', 'Ann Koch', '+1 (512) 262-9947', 'Dolor inventore qui ', 'Trevor Dominguez', 'Aliqua Dolore nostr', '+1 (909) 379-1809', 'Proident et molesti', 'Expedita in enim vel', 'bufov@mailinator.com', '', '', '', 'yes', '', 'Dolorem sed non aut ', 'Velit quam rerum ut ', '1973-10-19', 0, '', '', NULL, NULL, NULL, '2024-08-06 12:38:23', NULL),
(23, 46, 'ETSA045020', NULL, '2024-08-06', 'Xenos', 'Nigel Watson', 'Silva', NULL, NULL, 'Sed suscipit et arch', 'mujagaqas@mailinator.com', NULL, NULL, NULL, 'Quisquam odit culpa ', 'Rerum qui alias volu', '0000-00-00', 'Female', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'other', 'Chastity Hogan', '+1 (633) 834-1342', 'Et est nesciunt non', 'Amethyst Mcmillan', '+1 (388) 422-5118', 'Asperiores qui quisq', 'Anika Foreman', 'Eaque id impedit pe', '+1 (665) 719-2345', 'Ad in sint impedit', 'Consectetur necessi', 'hafub@mailinator.com', '', '', '', 'yes', '', 'Minus culpa in volup', 'Voluptate eiusmod mi', '0000-00-00', 0, '', '', NULL, NULL, NULL, '2024-08-06 12:38:48', NULL),
(24, 48, 'ETSA045021', NULL, '2024-08-06', 'Rinah', 'Lewis Kirkland', 'Morin', NULL, NULL, 'Nam aliquip velit po', 'fyduwolexy@mailinator.com', NULL, NULL, NULL, 'Proident magnam qui', 'Elit libero consect', '0000-00-00', 'Female', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'other', 'Haley Green', '+1 (853) 225-4988', 'Quas est tempora ear', 'Dahlia Mcpherson', '+1 (669) 324-6039', 'Veritatis ipsam ea q', 'Yetta Doyle', 'Iusto laborum Est n', '+1 (128) 684-2313', 'Sit architecto ipsa', 'Autem dolore volupta', 'kyzoha@mailinator.com', '', '', '', 'yes', '', 'Quod odio ea omnis q', 'Est aspernatur aut m', '0005-04-20', 0, '', '', NULL, NULL, NULL, '2024-08-06 12:39:04', NULL),
(25, 50, 'ETSA045022', NULL, '2024-08-06', 'Marshall', 'Linus Wilson', 'Bradley', NULL, NULL, 'Esse eu sequi rerum ', 'goxijybi@mailinator.com', NULL, NULL, NULL, 'Consequatur corpori', 'Accusamus ullam aut ', '0000-00-00', 'Male', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'other', 'Harriet West', '+1 (153) 937-4717', 'Elit beatae omnis c', 'Abigail Young', '+1 (727) 258-4958', 'Id repellendus Adip', 'Jared Combs', 'Autem ut sit sequi a', '+1 (481) 969-1558', 'Nisi cupidatat id su', 'Consequat Odit quis', 'xyte@mailinator.com', 'uploads/student_images/1722948057-28084016766b219d9e905c!2.jpg', '', '', 'yes', '', 'Officia et aut error', 'Iste quae in at vero', '0002-11-20', 0, '', '', NULL, NULL, NULL, '2024-08-06 12:40:57', NULL),
(26, 52, 'ETSA045023', NULL, '2024-08-06', 'Shafira', 'Yoshio Randolph', 'Cruz', NULL, NULL, 'Sed laborum Est ver', 'gawi@mailinator.com', NULL, NULL, NULL, 'Et quia ut hic dolor', 'Esse temporibus quia', '0000-00-00', 'Male', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'other', 'Josiah Barnes', '+1 (352) 977-6998', 'Minim debitis natus ', 'Jillian Saunders', '+1 (812) 945-4637', 'Beatae molestiae ut ', 'Kieran Dejesus', 'Deserunt cillum aute', '+1 (495) 367-6706', 'Animi illo ab illo ', 'Qui unde in occaecat', 'reny@mailinator.com', '', 'uploads/student_images/1722948088-166873736666b219f8481be!3.jpg', '', 'yes', '', 'Aut sed dolores enim', 'Ipsam nihil velit el', '0000-00-00', 0, '', '', NULL, NULL, NULL, '2024-08-06 12:41:28', NULL),
(27, 54, 'ETSA045024', NULL, '2024-08-06', 'Adrian', 'Zia Gibbs', 'Williamson', NULL, NULL, 'Nisi laboris minim r', 'vubebeco@mailinator.com', NULL, NULL, NULL, 'Ut labore qui praese', 'Sint velit sit repe', '0000-00-00', 'Female', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'mother', 'Carter Rocha', '+1 (595) 821-2287', 'Necessitatibus in mi', 'Faith Weaver', '+1 (237) 783-8882', 'Explicabo Sit fugi', 'Tatum Mcfarland', 'Hic est consectetur ', '+1 (428) 514-7484', 'Reiciendis et mollit', 'Blanditiis ad dolori', 'qutuvyjeho@mailinator.com', '', '', '', 'yes', '', 'Quia nihil minus ips', 'Reiciendis tempore ', '0005-12-20', 0, '', '', NULL, NULL, NULL, '2024-08-06 12:41:43', NULL),
(28, 56, 'ETSA045025', NULL, '2024-08-06', 'Rosalyn', 'Julie Boyer', 'Foreman', NULL, NULL, 'Commodi enim dolor e', 'pecahafa@mailinator.com', NULL, NULL, NULL, 'Ut nobis beatae volu', 'Debitis eaque ab exe', '0000-00-00', 'Male', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'father', 'Rachel Cruz', '+1 (496) 314-1707', 'Obcaecati non dicta ', 'Francis Fernandez', '+1 (266) 395-6426', 'Eu porro cupiditate ', 'Iona Pruitt', 'Voluptates lorem vel', '+1 (724) 931-2574', 'Eveniet laborum hic', 'Reprehenderit tempo', 'vamej@mailinator.com', '', '', '', 'yes', '', 'Sed aliquip cumque a', 'Sit non ipsum commod', '0000-00-00', 0, '', '', NULL, NULL, NULL, '2024-08-06 12:42:01', NULL),
(29, 58, 'ETSA045026', NULL, '2024-08-06', 'Irene', 'Garth Grant', 'Burgess', NULL, NULL, 'Consequatur Dolor e', 'tecuve@mailinator.com', NULL, NULL, NULL, 'Exercitationem et li', 'Placeat voluptatem ', '0000-00-00', 'Female', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'father', 'Keelie Elliott', '+1 (696) 772-9974', 'Exercitation dolor v', 'Geoffrey Weiss', '+1 (963) 489-8341', 'Cum aperiam exercita', 'Brock Lewis', 'Laudantium laborios', '+1 (513) 983-1251', 'Dolorem culpa cupid', 'Nisi sit tempora se', 'laralupova@mailinator.com', '', '', '', 'yes', '', 'Amet quo doloribus ', 'Occaecat eum quis fu', '0004-05-20', 0, '', '', NULL, NULL, NULL, '2024-08-06 12:42:20', NULL),
(30, 60, 'ETSA045027', NULL, '2024-08-06', 'Wynter', 'Hillary Gallagher', 'Pacheco', NULL, NULL, 'Ratione aut deserunt', 'nuwory@mailinator.com', NULL, NULL, NULL, 'Cupiditate sed volup', 'Qui et velit quia ne', '0000-00-00', 'Female', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'other', 'TaShya Whitaker', '+1 (993) 776-4865', 'Impedit esse et nis', 'Heather Carson', '+1 (154) 998-9491', 'Sed tempor incididun', 'Howard Ray', 'Reiciendis quo aute ', '+1 (124) 376-8042', 'Blanditiis voluptas ', 'Necessitatibus persp', 'kuhi@mailinator.com', '', '', '', 'yes', '', 'Non sint aliqua En', 'Dolores eu nostrum q', '0000-00-00', 0, '', '', NULL, NULL, NULL, '2024-08-06 12:42:39', NULL),
(31, 62, 'ETSA045028', NULL, '2024-08-06', 'Amanda', 'Haley Fowler', 'Vinson', NULL, NULL, 'Porro dolor repellen', 'jutigufyqu@mailinator.com', NULL, NULL, NULL, 'Qui quos molestiae m', 'Necessitatibus cillu', '0000-00-00', 'Male', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'other', 'Quinn Lynch', '+1 (234) 351-9508', 'Laboriosam quis vol', 'Ralph Banks', '+1 (414) 935-2911', 'Minim harum aperiam ', 'Zeph Mckee', 'Omnis dolore ab nesc', '+1 (421) 941-1077', 'Officia ut veritatis', 'Fugiat aut culpa pl', 'venuhawe@mailinator.com', '', '', '', 'yes', '', 'Vero animi reiciend', 'Excepteur recusandae', '0000-00-00', 0, '', '', NULL, NULL, NULL, '2024-08-06 12:42:57', NULL),
(32, 64, 'ETSA045029', NULL, '2024-08-06', 'Reed', 'MacKensie Graves', 'Valenzuela', NULL, NULL, 'Dolores reiciendis m', 'xawesesa@mailinator.com', NULL, NULL, NULL, 'Tempora debitis dolo', 'Saepe deleniti nesci', '0000-00-00', 'Female', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'father', 'Jemima Bradford', '+1 (745) 849-9215', 'Ducimus consectetur', 'Natalie Randolph', '+1 (134) 456-1784', 'Est cupiditate eos ', 'Lucas Burgess', 'Voluptates sed et as', '+1 (464) 525-6521', 'Iusto debitis dolore', 'Omnis eligendi conse', 'dyxuxygizu@mailinator.com', '', '', '', 'yes', '', 'Omnis sed voluptatib', 'Odit accusantium del', '0000-00-00', 0, '', '', NULL, NULL, NULL, '2024-08-06 12:43:17', NULL),
(33, 66, 'ETSA045030', NULL, '2024-08-06', 'Amir', 'Aladdin Chandler', 'Olson', NULL, NULL, 'Et ducimus rem labo', 'nydose@mailinator.com', NULL, NULL, NULL, 'Molestias tenetur pr', 'Pariatur Enim sequi', '0000-00-00', 'Female', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'other', 'Wendy Compton', '+1 (531) 148-8177', 'Quidem sed aut et vo', 'Kessie Joyce', '+1 (336) 501-9851', 'Est aliquip est re', 'Tanek Armstrong', 'Odio non impedit ra', '+1 (222) 323-5295', 'Soluta duis corporis', 'Nihil dolorem eos s', 'myfugug@mailinator.com', '', '', '', 'yes', '', 'Reiciendis duis opti', 'Culpa ab pariatur ', '1974-07-19', 0, '', '', NULL, NULL, NULL, '2024-08-06 12:43:39', NULL),
(34, 68, 'ETSA045031', NULL, '2024-08-06', 'Savannah', 'Maris Mckenzie', 'Glass', NULL, NULL, 'Sit consectetur nob', 'vetul@mailinator.com', NULL, NULL, NULL, 'Esse sunt blanditiis', 'Ut magna quae magna ', '0000-00-00', 'Male', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'father', 'Sylvester Galloway', '+1 (593) 145-9303', 'Duis voluptatem Dol', 'Lana Cote', '+1 (264) 155-4599', 'Dolores molestiae du', 'Ayanna Beasley', 'Sit itaque consequa', '+1 (383) 901-3203', 'Facere impedit sunt', 'Enim facere autem is', 'xykeq@mailinator.com', '', '', '', 'yes', '', 'Nobis ut sit est off', 'Omnis dolore nisi si', '1980-12-19', 0, '', '', NULL, NULL, NULL, '2024-08-06 12:44:06', NULL),
(35, 70, 'ETSA045032', NULL, '2024-08-06', 'Nina', 'Fiona Dennis', 'Le', NULL, NULL, 'Magnam tempor invent', 'kirigebe@mailinator.com', NULL, NULL, NULL, 'Laborum consectetur', 'Incididunt quidem mo', '0000-00-00', 'Female', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'mother', 'Evelyn Soto', '+1 (259) 563-1777', 'Sit ratione omnis la', 'Kiona Reynolds', '+1 (276) 117-9732', 'Tempora sit tempore', 'Mary Schroeder', 'Qui dolorum sit eum ', '+1 (798) 511-7795', 'Voluptatem Rem quam', 'Qui saepe dolore off', 'ziqesivew@mailinator.com', '', '', '', 'yes', '', 'Ipsum in molestiae a', 'Voluptate natus quod', '0000-00-00', 0, '', '', NULL, NULL, NULL, '2024-08-06 12:44:29', NULL),
(36, 72, 'ETSA045033', NULL, '2024-08-06', 'Kirby', 'Kylie Tyler', 'Powers', NULL, NULL, 'Qui irure dolor ipsu', 'wivynywiza@mailinator.com', NULL, NULL, NULL, 'Facilis nostrud modi', 'Consectetur possimu', '0000-00-00', 'Male', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'other', 'Colby Hebert', '+1 (506) 807-3138', 'Esse eum nobis dolo', 'Steven Owens', '+1 (905) 368-5287', 'In quidem unde dolor', 'Noel Garcia', 'Adipisci dolore earu', '+1 (106) 118-8005', 'Amet voluptate labo', 'Sapiente nisi labore', 'cytidarypy@mailinator.com', '', '', '', 'yes', '', 'Vitae eu magnam eius', 'Consequat Neque off', '0005-03-20', 0, '', '', NULL, NULL, NULL, '2024-08-06 12:48:21', NULL),
(37, 74, 'ETSA045034', NULL, '2024-08-06', 'Geoffrey', 'Uriah Porter', 'Cox', NULL, NULL, 'Accusamus cillum qua', 'ryqeq@mailinator.com', NULL, NULL, NULL, 'Earum occaecat debit', 'Eum molestiae illo a', '0000-00-00', 'Male', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'other', 'Price Wyatt', '+1 (233) 645-5703', 'Veritatis quasi labo', 'Urielle Carpenter', '+1 (533) 274-9648', 'Dolores non cumque i', 'Zahir Camacho', 'Nam dignissimos aute', '+1 (597) 921-5084', 'Autem dolore eos exc', 'Debitis distinctio ', 'temymonuhe@mailinator.com', '', '', '', 'yes', '', 'Dolorum et in quibus', 'Incididunt sit saepe', '1980-12-19', 0, '', '', NULL, NULL, NULL, '2024-08-06 12:48:24', NULL),
(38, 76, 'ETSA045035', NULL, '2024-08-06', 'Jessamine', 'Caldwell Frost', 'Schwartz', NULL, NULL, 'Animi dolor rerum v', 'towyneq@mailinator.com', NULL, NULL, NULL, 'Placeat sequi imped', 'Dolore excepteur qui', '0000-00-00', 'Male', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'mother', 'Ann Barton', '+1 (221) 738-9594', 'Enim omnis mollitia ', 'Allen Cervantes', '+1 (633) 122-7979', 'Nobis quos dolor ea ', 'Jana Ware', 'Quia voluptatum dese', '+1 (295) 925-9324', 'Similique eum vel am', 'Ea reprehenderit off', 'lynihi@mailinator.com', '', '', '', 'yes', '', 'Deleniti iure maxime', 'Id consectetur aut', '1996-02-19', 0, '', '', NULL, NULL, NULL, '2024-08-06 12:48:37', NULL),
(39, 78, 'ETSA045036', NULL, '2024-08-06', 'Eve', 'Lacy Petersen', 'Osborn', NULL, NULL, 'Quibusdam consequunt', 'lypudo@mailinator.com', NULL, NULL, NULL, 'Sed et labore aspern', 'Occaecat est explic', '1996-02-22', 'Male', '', '', '', 0, '', 0, '', '', NULL, NULL, NULL, 'father', 'Cassidy Gamble', '+1 (245) 356-1529', 'Duis in fuga Corpor', 'Bianca Gay', '+1 (692) 717-9829', 'Minim voluptatibus s', 'Mercedes Ferrell', 'Consectetur est mol', '+1 (221) 896-3241', 'Amet rerum at aperi', 'Error repellendus S', 'javeh@mailinator.com', '', '', '', 'yes', '', 'Veniam voluptatum s', 'Possimus nemo conse', NULL, 0, '', '', NULL, NULL, NULL, '2024-11-28 23:44:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_applyleave`
--

CREATE TABLE `student_applyleave` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `apply_date` date NOT NULL,
  `status` int(11) NOT NULL,
  `docs` varchar(200) DEFAULT NULL,
  `reason` text NOT NULL,
  `approve_by` int(11) DEFAULT NULL,
  `approve_date` date DEFAULT NULL,
  `request_type` int(11) NOT NULL COMMENT '0 student,1 staff',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_attendences`
--

CREATE TABLE `student_attendences` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `biometric_attendence` int(11) NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `attendence_type_id` int(11) DEFAULT NULL,
  `remark` varchar(200) NOT NULL,
  `biometric_device_data` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_behaviour`
--

CREATE TABLE `student_behaviour` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `comments` text DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_behaviour`
--

INSERT INTO `student_behaviour` (`id`, `student_id`, `class_id`, `remarks`, `comments`, `create_date`, `created_at`, `updated_at`) VALUES
(32, 20, 1, 'What is your behaviour at home', 'behaviour is good', '2023-11-08', '2024-10-22 21:07:30', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `student_doc`
--

CREATE TABLE `student_doc` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `doc` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_edit_fields`
--

CREATE TABLE `student_edit_fields` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_fees`
--

CREATE TABLE `student_fees` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `feemaster_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `amount_discount` float(10,2) NOT NULL,
  `amount_fine` float(10,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_fees_deposite`
--

CREATE TABLE `student_fees_deposite` (
  `id` int(11) NOT NULL,
  `student_fees_master_id` int(11) DEFAULT NULL,
  `fee_groups_feetype_id` int(11) DEFAULT NULL,
  `student_transport_fee_id` int(11) DEFAULT NULL,
  `amount_detail` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_fees_discounts`
--

CREATE TABLE `student_fees_discounts` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `fees_discount_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'assigned',
  `payment_id` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_fees_master`
--

CREATE TABLE `student_fees_master` (
  `id` int(11) NOT NULL,
  `is_system` int(11) NOT NULL DEFAULT 0,
  `student_session_id` int(11) DEFAULT NULL,
  `fee_session_group_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT 0.00,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_fees_processing`
--

CREATE TABLE `student_fees_processing` (
  `id` int(11) NOT NULL,
  `gateway_ins_id` int(11) NOT NULL,
  `fee_category` varchar(255) NOT NULL,
  `student_fees_master_id` int(11) DEFAULT NULL,
  `fee_groups_feetype_id` int(11) DEFAULT NULL,
  `student_transport_fee_id` int(11) DEFAULT NULL,
  `amount_detail` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_quiz_status`
--

CREATE TABLE `student_quiz_status` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `course_quiz_id` int(11) DEFAULT NULL,
  `total_question` int(11) DEFAULT NULL,
  `correct_answer` int(11) DEFAULT NULL,
  `wrong_answer` int(11) DEFAULT NULL,
  `not_answer` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1-completed,0-incomplete	',
  `created_date` timestamp NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_session`
--

CREATE TABLE `student_session` (
  `id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `hostel_room_id` int(11) DEFAULT NULL,
  `vehroute_id` int(11) DEFAULT NULL,
  `route_pickup_point_id` int(11) DEFAULT NULL,
  `transport_fees` float(10,2) NOT NULL DEFAULT 0.00,
  `fees_discount` float(10,2) NOT NULL DEFAULT 0.00,
  `is_leave` int(11) NOT NULL DEFAULT 0,
  `is_active` varchar(255) DEFAULT 'no',
  `is_alumni` int(11) NOT NULL,
  `default_login` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `student_session`
--

INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `hostel_room_id`, `vehroute_id`, `route_pickup_point_id`, `transport_fees`, `fees_discount`, `is_leave`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES
(21, 19, 20, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 1, '2024-08-25 21:43:25', NULL),
(22, 19, 21, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 1, '2024-10-07 23:05:22', NULL),
(23, 19, 22, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 0, '2024-08-06 12:38:23', NULL),
(24, 19, 23, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 0, '2024-08-06 12:38:48', NULL),
(25, 19, 24, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 0, '2024-08-06 12:39:04', NULL),
(26, 19, 25, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 0, '2024-08-06 12:40:57', NULL),
(27, 19, 26, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 0, '2024-08-06 12:41:28', NULL),
(28, 19, 27, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 0, '2024-08-06 12:41:43', NULL),
(29, 19, 28, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 0, '2024-08-06 12:42:01', NULL),
(30, 19, 29, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 0, '2024-08-06 12:42:20', NULL),
(31, 19, 30, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 0, '2024-08-06 12:42:39', NULL),
(32, 19, 31, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 0, '2024-08-06 12:42:57', NULL),
(33, 19, 32, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 0, '2024-08-06 12:43:17', NULL),
(34, 19, 33, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 0, '2024-08-06 12:43:39', NULL),
(35, 19, 34, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 0, '2024-08-06 12:44:06', NULL),
(36, 19, 35, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 0, '2024-08-06 12:44:29', NULL),
(37, 19, 36, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 0, '2024-08-06 12:48:21', NULL),
(38, 19, 37, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 0, '2024-08-06 12:48:24', NULL),
(39, 19, 38, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 0, '2024-08-06 12:48:37', NULL),
(40, 19, 39, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 1, '2024-08-25 21:47:17', NULL),
(41, 18, 39, 1, 1, NULL, NULL, NULL, 0.00, 0.00, 0, 'no', 0, 0, '2024-11-29 00:01:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_subject_attendances`
--

CREATE TABLE `student_subject_attendances` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `subject_timetable_id` int(11) DEFAULT NULL,
  `attendence_type_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_timeline`
--

CREATE TABLE `student_timeline` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` text NOT NULL,
  `document` varchar(200) DEFAULT NULL,
  `status` varchar(200) NOT NULL,
  `created_student_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_transport_fees`
--

CREATE TABLE `student_transport_fees` (
  `id` int(11) NOT NULL,
  `transport_feemaster_id` int(11) NOT NULL,
  `student_session_id` int(11) NOT NULL,
  `route_pickup_point_id` int(11) NOT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES
(6, 'Maths', '1', 'theory', 'no', '2024-08-06 12:34:26', NULL),
(7, 'English', '2', 'theory', 'no', '2024-08-06 12:45:47', NULL),
(8, 'Biology', '', 'practical', 'no', '2024-08-06 20:38:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject_groups`
--

CREATE TABLE `subject_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject_group_class_sections`
--

CREATE TABLE `subject_group_class_sections` (
  `id` int(11) NOT NULL,
  `subject_group_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject_group_subjects`
--

CREATE TABLE `subject_group_subjects` (
  `id` int(11) NOT NULL,
  `subject_group_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject_syllabus`
--

CREATE TABLE `subject_syllabus` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_for` int(11) NOT NULL,
  `date` date NOT NULL,
  `time_from` varchar(255) NOT NULL,
  `time_to` varchar(255) NOT NULL,
  `presentation` text NOT NULL,
  `attachment` text NOT NULL,
  `lacture_youtube_url` varchar(255) NOT NULL,
  `lacture_video` varchar(255) NOT NULL,
  `sub_topic` text NOT NULL,
  `teaching_method` text NOT NULL,
  `general_objectives` text NOT NULL,
  `previous_knowledge` text NOT NULL,
  `comprehensive_questions` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject_teacher`
--

CREATE TABLE `subject_teacher` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `student_exam_info` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subject_teacher`
--

INSERT INTO `subject_teacher` (`id`, `subject_id`, `staff_id`, `student_exam_info`) VALUES
(2, 2, 2, 0),
(3, 3, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `subject_timetable`
--

CREATE TABLE `subject_timetable` (
  `id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `subject_group_id` int(11) DEFAULT NULL,
  `subject_group_subject_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `time_from` varchar(20) DEFAULT NULL,
  `time_to` varchar(20) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `room_no` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `submit_assignment`
--

CREATE TABLE `submit_assignment` (
  `id` int(11) NOT NULL,
  `homework_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `docs` varchar(225) NOT NULL,
  `file_name` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `template_admitcards`
--

CREATE TABLE `template_admitcards` (
  `id` int(11) NOT NULL,
  `template` varchar(250) DEFAULT NULL,
  `heading` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `left_logo` varchar(200) DEFAULT NULL,
  `right_logo` varchar(200) DEFAULT NULL,
  `exam_name` varchar(200) DEFAULT NULL,
  `school_name` varchar(200) DEFAULT NULL,
  `exam_center` varchar(200) DEFAULT NULL,
  `sign` varchar(200) DEFAULT NULL,
  `background_img` varchar(200) DEFAULT NULL,
  `is_name` int(11) NOT NULL DEFAULT 1,
  `is_father_name` int(11) NOT NULL DEFAULT 1,
  `is_mother_name` int(11) NOT NULL DEFAULT 1,
  `is_dob` int(11) NOT NULL DEFAULT 1,
  `is_admission_no` int(11) NOT NULL DEFAULT 1,
  `is_roll_no` int(11) NOT NULL DEFAULT 1,
  `is_address` int(11) NOT NULL DEFAULT 1,
  `is_gender` int(11) NOT NULL DEFAULT 1,
  `is_photo` int(11) NOT NULL,
  `is_class` int(11) NOT NULL DEFAULT 0,
  `is_section` int(11) NOT NULL DEFAULT 0,
  `content_footer` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `template_admitcards`
--

INSERT INTO `template_admitcards` (`id`, `template`, `heading`, `title`, `left_logo`, `right_logo`, `exam_name`, `school_name`, `exam_center`, `sign`, `background_img`, `is_name`, `is_father_name`, `is_mother_name`, `is_dob`, `is_admission_no`, `is_roll_no`, `is_address`, `is_gender`, `is_photo`, `is_class`, `is_section`, `content_footer`, `created_at`, `updated_at`) VALUES
(1, 'Sample Admit Card', '', '', 'ab12c4b65f53ee621dcf84370a7c5be4.png', '0910482bf79df5fd103e8383d61b387a.png', 'Test', 'Mount Carmel School', 'test dmit card2', 'aa9c7087e68c5af1d2c04946de1d3bd3.png', '782a71f53ea6bca213012d49e9d46d98.jpg', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2020-02-28 14:26:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `template_marksheets`
--

CREATE TABLE `template_marksheets` (
  `id` int(11) NOT NULL,
  `header_image` varchar(200) DEFAULT NULL,
  `template` varchar(200) DEFAULT NULL,
  `heading` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `left_logo` varchar(200) DEFAULT NULL,
  `right_logo` varchar(200) DEFAULT NULL,
  `exam_name` varchar(200) DEFAULT NULL,
  `school_name` varchar(200) DEFAULT NULL,
  `exam_center` varchar(200) DEFAULT NULL,
  `left_sign` varchar(200) DEFAULT NULL,
  `middle_sign` varchar(200) DEFAULT NULL,
  `right_sign` varchar(200) DEFAULT NULL,
  `exam_session` int(11) DEFAULT 1,
  `is_name` int(11) DEFAULT 1,
  `is_father_name` int(11) DEFAULT 1,
  `is_mother_name` int(11) DEFAULT 1,
  `is_dob` int(11) DEFAULT 1,
  `is_admission_no` int(11) DEFAULT 1,
  `is_roll_no` int(11) DEFAULT 1,
  `is_photo` int(11) DEFAULT 1,
  `is_division` int(11) NOT NULL DEFAULT 1,
  `is_rank` int(11) NOT NULL DEFAULT 0,
  `is_customfield` int(11) NOT NULL,
  `background_img` varchar(200) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `is_class` int(11) NOT NULL DEFAULT 0,
  `is_teacher_remark` int(11) NOT NULL DEFAULT 1,
  `is_section` int(11) NOT NULL DEFAULT 0,
  `content` text DEFAULT NULL,
  `content_footer` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `template_marksheets`
--

INSERT INTO `template_marksheets` (`id`, `header_image`, `template`, `heading`, `title`, `left_logo`, `right_logo`, `exam_name`, `school_name`, `exam_center`, `left_sign`, `middle_sign`, `right_sign`, `exam_session`, `is_name`, `is_father_name`, `is_mother_name`, `is_dob`, `is_admission_no`, `is_roll_no`, `is_photo`, `is_division`, `is_rank`, `is_customfield`, `background_img`, `date`, `is_class`, `is_teacher_remark`, `is_section`, `content`, `content_footer`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Sample Marksheet', 'BOARD OF SECONDARY EDUCATION, MADHYA PRADESH, BHOPAL', 'BOARD OF SECONDARY EDUCATION, MADHYA PRADESH, BHOPAL', 'f314cec3f688771ccaeddbcee6e52f7c.png', 'e824b2df53266266be2dbfd2001168b8.png', 'HIGHER SECONDARY SCHOOL CERTIFICATE EXAMINATION', 'Mount Carmel School', 'GOVT GIRLS H S SCHOOL', '331e0690e50f8c6b7a219a0a2b9667f7.png', '351f513d79ee5c0f642c2d36514a1ff4.png', 'fb79d2c0d163357d1706b78550a05e2c.png', 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, '', NULL, 0, 1, 0, NULL, NULL, '2020-02-28 14:26:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `complete_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport_feemaster`
--

CREATE TABLE `transport_feemaster` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `month` varchar(50) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `fine_amount` float(10,2) DEFAULT 0.00,
  `fine_type` varchar(50) DEFAULT NULL,
  `fine_percentage` float(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport_route`
--

CREATE TABLE `transport_route` (
  `id` int(11) NOT NULL,
  `route_title` varchar(100) DEFAULT NULL,
  `no_of_vehicle` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `upload_contents`
--

CREATE TABLE `upload_contents` (
  `id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `thumb_path` varchar(300) DEFAULT NULL,
  `dir_path` varchar(300) DEFAULT NULL,
  `real_name` text NOT NULL,
  `img_name` varchar(300) DEFAULT NULL,
  `thumb_name` varchar(300) DEFAULT NULL,
  `file_type` varchar(100) NOT NULL,
  `mime_type` text NOT NULL,
  `file_size` varchar(100) NOT NULL,
  `vid_url` text NOT NULL,
  `vid_title` varchar(250) NOT NULL,
  `upload_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `user` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `ipaddress` varchar(100) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `login_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES
(1, 'admin@schools.247pos.ng', 'Super Admin', NULL, '102.219.52.129', 'Chrome 114.0.0.0, Windows 10', '2023-06-21 10:15:35'),
(2, 'admin@schools.247pos.ng', 'Super Admin', NULL, '197.210.70.96', 'Chrome 114.0.0.0, Windows 10', '2023-06-21 13:32:18'),
(3, 'admin@schools.247pos.ng', 'Super Admin', NULL, '102.91.5.87', 'Firefox 114.0, Windows 10', '2023-06-21 15:18:32'),
(4, 'admin@schools.247pos.ng', 'Super Admin', NULL, '102.91.5.87', 'Firefox 114.0, Windows 10', '2023-06-21 15:35:25'),
(5, 'admin@schools.247pos.ng', 'Super Admin', NULL, '197.210.71.200', 'Chrome 114.0.0.0, Windows 10', '2023-06-21 22:12:07'),
(6, 'admin@schools.247pos.ng', 'Super Admin', NULL, '102.91.5.87', 'Chrome 114.0.0.0, Windows 10', '2023-06-21 22:30:43'),
(7, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '197.210.71.109', 'Firefox 114.0, Windows 10', '2023-06-21 23:00:36'),
(8, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '197.210.71.109', 'Firefox 114.0, Windows 10', '2023-06-21 23:01:13'),
(9, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '197.210.71.109', 'Firefox 114.0, Windows 10', '2023-06-21 23:33:41'),
(10, 'admin@schools.247pos.ng', 'Super Admin', NULL, '138.199.29.12', 'Chrome 114.0.0.0, Windows 10', '2023-06-22 09:23:02'),
(11, 'admin@schools.247pos.ng', 'Super Admin', NULL, '102.91.4.94', 'Chrome 114.0.0.0, Windows 10', '2023-06-22 22:08:01'),
(12, 'admin@schools.247pos.ng', 'Super Admin', NULL, '197.210.76.76', 'Firefox 114.0, Windows 10', '2023-06-23 14:35:20'),
(13, 'admin@schools.247pos.ng', 'Super Admin', NULL, '197.210.52.185', 'Chrome 114.0.0.0, Windows 10', '2023-06-23 21:24:12'),
(14, 'admin@schools.247pos.ng', 'Super Admin', NULL, '197.210.76.181', 'Chrome 114.0.0.0, Windows 10', '2023-06-23 21:43:55'),
(15, 'admin@schools.247pos.ng', 'Super Admin', NULL, '197.210.71.98', 'Chrome 114.0.0.0, Android', '2023-06-25 08:55:24'),
(16, 'admin@schools.247pos.ng', 'Super Admin', NULL, '197.210.76.178', 'Chrome 114.0.0.0, Windows 10', '2023-06-28 22:56:40'),
(17, 'admin@schools.247pos.ng', 'Super Admin', NULL, '197.210.77.76', 'Firefox 114.0, Windows 10', '2023-06-29 00:00:47'),
(18, 'admin@schools.247pos.ng', 'Super Admin', NULL, '102.219.52.129', 'Chrome 114.0.0.0, Windows 10', '2023-06-29 12:06:08'),
(19, 'admin@schools.247pos.ng', 'Super Admin', NULL, '197.210.77.212', 'Firefox 114.0, Windows 10', '2023-07-03 22:58:51'),
(20, 'admin@schools.247pos.ng', 'Super Admin', NULL, '111.88.84.32', 'Chrome 114.0.0.0, Windows 10', '2023-07-03 23:02:53'),
(21, 'admin@schools.247pos.ng', 'Super Admin', NULL, '111.88.84.32', 'Chrome 114.0.0.0, Windows 10', '2023-07-03 23:04:42'),
(22, 'admin@schools.247pos.ng', 'Super Admin', NULL, '119.73.97.32', 'Chrome 114.0.0.0, Windows 10', '2023-07-03 23:06:24'),
(23, 'admin@schools.247pos.ng', 'Super Admin', NULL, '188.43.136.44', 'Chrome 114.0.0.0, Windows 10', '2023-07-03 23:18:26'),
(24, 'admin@schools.247pos.ng', 'Super Admin', NULL, '111.88.84.32', 'Chrome 114.0.0.0, Windows 10', '2023-07-03 23:32:11'),
(25, 'std1', 'student', 1, '111.88.84.32', 'Chrome 114.0.0.0, Windows 10', '2023-07-03 23:53:25'),
(26, 'admin@schools.247pos.ng', 'Super Admin', NULL, '111.88.84.32', 'Chrome 114.0.0.0, Windows 10', '2023-07-03 23:54:40'),
(27, 'admin@schools.247pos.ng', 'Super Admin', NULL, '124.29.208.93', 'Firefox 114.0, Windows 10', '2023-07-04 08:45:28'),
(28, 'admin@schools.247pos.ng', 'Super Admin', NULL, '124.29.208.93', 'Firefox 114.0, Windows 10', '2023-07-04 09:14:57'),
(29, 'parent1', 'parent', NULL, '124.29.208.93', 'Firefox 114.0, Windows 10', '2023-07-04 09:29:45'),
(30, 'std1', 'student', 1, '124.29.208.93', 'Firefox 114.0, Windows 10', '2023-07-04 09:30:45'),
(31, 'admin@schools.247pos.ng', 'Super Admin', NULL, '124.29.208.93', 'Firefox 114.0, Windows 10', '2023-07-04 09:32:01'),
(32, 'admin@schools.247pos.ng', 'Super Admin', NULL, '102.219.52.129', 'Chrome 114.0.0.0, Windows 10', '2023-07-04 09:40:03'),
(33, 'admin@schools.247pos.ng', 'Super Admin', NULL, '113.203.241.55', 'Chrome 114.0.0.0, Windows 10', '2023-07-04 11:29:48'),
(34, 'admin@schools.247pos.ng', 'Super Admin', NULL, '91.118.87.201', 'Chrome 114.0.0.0, Windows 10', '2023-07-04 12:03:22'),
(35, 'admin@schools.247pos.ng', 'Super Admin', NULL, '91.118.87.201', 'Chrome 114.0.0.0, Windows 10', '2023-07-04 12:07:18'),
(36, 'admin@schools.247pos.ng', 'Super Admin', NULL, '119.73.97.132', 'Chrome 114.0.0.0, Windows 10', '2023-07-04 22:38:46'),
(37, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-09-14 09:43:00'),
(38, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-09-14 17:10:02'),
(39, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-09-15 10:49:35'),
(40, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-09-17 19:55:17'),
(41, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-09-17 20:03:44'),
(42, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-09-18 08:12:35'),
(43, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-09-18 08:13:52'),
(44, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-09-18 10:30:11'),
(45, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-05 00:49:40'),
(46, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-05 01:05:44'),
(47, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-05 01:11:56'),
(48, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-05 01:21:08'),
(49, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-05 10:53:44'),
(50, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-05 10:54:26'),
(51, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-05 16:53:10'),
(52, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-05 17:07:24'),
(53, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-05 17:21:16'),
(54, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-10 10:01:18'),
(55, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-12 06:58:09'),
(56, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-12 08:39:21'),
(57, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-12 14:05:16'),
(58, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-12 17:23:28'),
(59, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-12 17:44:15'),
(60, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-12 17:45:13'),
(61, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-12 17:57:08'),
(62, 'parent1', 'parent', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-12 17:57:55'),
(63, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-12 18:10:10'),
(64, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 117.0.0.0, Windows 10', '2023-10-12 18:15:34'),
(65, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 118.0.0.0, Windows 10', '2023-10-18 02:33:47'),
(66, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 118.0.0.0, Windows 10', '2023-10-30 00:04:40'),
(67, 'parent1', 'parent', NULL, '::1', 'Chrome 118.0.0.0, Windows 10', '2023-10-30 00:05:40'),
(68, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 118.0.0.0, Windows 10', '2023-10-30 00:07:22'),
(69, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 118.0.0.0, Windows 10', '2023-10-30 00:08:34'),
(70, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 118.0.0.0, Windows 10', '2023-10-30 04:50:54'),
(71, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 118.0.0.0, Windows 10', '2023-10-30 04:51:41'),
(72, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 118.0.0.0, Windows 10', '2023-10-30 04:56:13'),
(73, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 118.0.0.0, Windows 10', '2023-10-30 08:00:20'),
(74, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 118.0.0.0, Windows 10', '2023-10-30 09:15:07'),
(75, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 118.0.0.0, Windows 10', '2023-10-30 09:20:18'),
(76, 'parent1', 'parent', NULL, '::1', 'Chrome 118.0.0.0, Windows 10', '2023-10-30 09:29:42'),
(77, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 118.0.0.0, Windows 10', '2023-10-30 09:52:45'),
(78, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 118.0.0.0, Windows 10', '2023-10-30 12:17:07'),
(79, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 118.0.0.0, Windows 10', '2023-11-07 08:03:00'),
(80, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 118.0.0.0, Windows 10', '2023-11-07 08:23:48'),
(81, 'parent1', 'parent', NULL, '::1', 'Chrome 118.0.0.0, Windows 10', '2023-11-07 08:24:39'),
(82, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 118.0.0.0, Windows 10', '2023-11-07 08:27:45'),
(83, 'parent1', 'parent', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-11-08 11:28:28'),
(84, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-11-08 13:19:40'),
(85, 'parent1', 'parent', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-11-08 22:21:30'),
(86, 'parent1', 'parent', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-11-09 07:21:59'),
(87, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-11-09 07:22:53'),
(88, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-11-10 18:20:15'),
(89, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-11-13 07:34:05'),
(90, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-11-15 00:28:51'),
(91, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-11-15 07:13:46'),
(92, 'parent1', 'parent', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-11-27 11:20:02'),
(93, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-11-27 11:20:05'),
(94, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-11-27 20:26:11'),
(95, 'parent1', 'parent', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-11-27 20:27:44'),
(96, 'parent1', 'parent', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-11-28 10:07:04'),
(97, 'parent1', 'parent', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-11-28 18:00:44'),
(98, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-11-28 18:01:08'),
(99, 'parent1', 'parent', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-11-28 18:36:41'),
(100, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-01 18:49:33'),
(101, 'parent1', 'parent', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-01 18:49:59'),
(102, 'admin@schools.247pos.ng', 'Super Admin', NULL, '105.112.213.0', 'Chrome 119.0.0.0, Windows 10', '2023-12-02 23:45:34'),
(103, 'admin@schools.247pos.ng', 'Super Admin', NULL, '197.210.77.19', 'Chrome 119.0.0.0, Windows 10', '2023-12-03 13:46:20'),
(104, 'std1', 'student', 1, '197.210.52.74', 'Firefox 120.0, Windows 10', '2023-12-03 14:03:44'),
(105, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '197.210.77.202', 'Chrome 119.0.0.0, Windows 10', '2023-12-03 14:31:53'),
(106, 'admin@schools.247pos.ng', 'Super Admin', NULL, '118.179.20.79', 'Chrome 119.0.0.0, Windows 10', '2023-12-03 20:26:25'),
(107, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '118.179.20.79', 'Chrome 119.0.0.0, Windows 10', '2023-12-03 20:27:00'),
(108, 'admin@schools.247pos.ng', 'Super Admin', NULL, '152.58.178.89', 'Chrome 119.0.0.0, Windows 10', '2023-12-03 20:29:20'),
(109, 'admin@schools.247pos.ng', 'Super Admin', NULL, '223.123.0.108', 'Chrome 119.0.0.0, Android', '2023-12-03 20:33:19'),
(110, 'admin@schools.247pos.ng', 'Super Admin', NULL, '118.179.20.79', 'Chrome 119.0.0.0, Windows 10', '2023-12-03 20:38:20'),
(111, 'admin@schools.247pos.ng', 'Super Admin', NULL, '193.239.84.78', 'Chrome 119.0.0.0, Windows 10', '2023-12-03 20:39:26'),
(112, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-03 22:45:36'),
(113, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-03 22:49:13'),
(114, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-03 23:03:13'),
(115, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-03 23:08:11'),
(116, 'std1', 'student', 1, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-03 23:17:59'),
(117, 'std5', 'student', 1, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-03 23:20:05'),
(118, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-03 23:23:12'),
(119, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-03 23:37:08'),
(120, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-04 12:03:20'),
(121, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-04 13:21:39'),
(122, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-04 14:03:08'),
(123, 'std1', 'student', 1, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-04 14:22:29'),
(124, 'std5', 'student', 1, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-04 14:25:29'),
(125, 'std2', 'student', 1, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-04 14:36:37'),
(126, 'parent2', 'parent', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-04 14:42:11'),
(127, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-05 01:27:56'),
(128, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-05 13:00:04'),
(129, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 119.0.0.0, Windows 10', '2023-12-06 01:27:22'),
(130, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-06 11:11:18'),
(131, 'std1', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-06 11:18:07'),
(132, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-06 11:19:00'),
(133, 'std2', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-06 11:19:44'),
(134, 'std5', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-06 11:22:01'),
(135, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-06 22:01:16'),
(136, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-07 12:43:51'),
(137, 'std5', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-07 13:40:27'),
(138, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-09 03:27:30'),
(139, 'std5', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-09 03:42:54'),
(140, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-13 12:45:35'),
(141, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-14 12:05:25'),
(142, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-15 12:12:41'),
(143, 'std5', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-15 12:27:49'),
(144, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-16 04:01:32'),
(145, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-16 04:12:03'),
(146, 'parent2', 'parent', NULL, '127.0.0.1', 'Firefox 120.0, Windows 10', '2023-12-16 04:15:08'),
(147, 'parent2', 'parent', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-16 04:48:29'),
(148, 'std1', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-19 12:56:58'),
(149, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-19 13:02:26'),
(150, 'fdfwer12', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-19 13:05:35'),
(151, 'std4', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-19 13:11:33'),
(152, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-20 13:13:53'),
(153, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-21 13:34:23'),
(154, 'std5', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-21 13:50:27'),
(155, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-22 10:57:54'),
(156, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-27 11:55:21'),
(157, 'AAA13', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-27 12:02:49'),
(158, 'std5', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-27 12:54:44'),
(159, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-28 12:24:44'),
(160, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2023-12-30 05:17:59'),
(161, 'std5', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-08 12:42:09'),
(162, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-08 13:05:24'),
(163, 'AAA13', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-08 13:09:11'),
(164, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-09 12:10:19'),
(165, 'std5', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-11 12:46:07'),
(166, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-11 12:55:12'),
(167, 'AAA13', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-11 12:58:27'),
(168, 'parent13', 'parent', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-11 13:01:05'),
(169, 'AAA13', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-11 13:07:57'),
(170, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-16 13:36:59'),
(171, 'std1', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-16 13:47:03'),
(172, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-20 01:37:31'),
(173, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-20 02:03:18'),
(174, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-20 04:18:34'),
(175, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-20 06:53:12'),
(176, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-20 07:00:48'),
(177, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-21 10:47:37'),
(178, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-21 10:54:15'),
(179, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-23 12:30:55'),
(180, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-23 12:32:54'),
(181, 'std1', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-23 12:50:26'),
(182, 'std1', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-23 12:52:11'),
(183, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-28 00:30:47'),
(184, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-30 12:14:10'),
(185, 'fdfwer12', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-30 13:05:14'),
(186, 'fdfwer12', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-30 13:06:01'),
(187, 'AAA13', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-30 13:07:59'),
(188, 'AAA13', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-30 13:12:06'),
(189, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-31 13:13:30'),
(190, 'AAA13', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-31 13:23:18'),
(191, '10', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-31 14:02:46'),
(192, 'std1', 'student', 1, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-01-31 14:19:21'),
(193, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-02-01 12:33:27'),
(194, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 120.0.0.0, Windows 10', '2024-02-01 12:39:32'),
(195, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 121.0.0.0, Windows 10', '2024-02-14 12:09:42'),
(196, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 121.0.0.0, Windows 10', '2024-02-15 12:55:46'),
(197, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 121.0.0.0, Windows 10', '2024-02-22 12:14:55'),
(198, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 121.0.0.0, Windows 10', '2024-02-23 10:18:46'),
(199, 'std1', 'student', 1, '::1', 'Chrome 121.0.0.0, Windows 10', '2024-02-23 12:26:15'),
(200, 'std1', 'student', 1, '::1', 'Chrome 121.0.0.0, Windows 10', '2024-02-23 12:29:25'),
(201, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 121.0.0.0, Windows 10', '2024-02-24 02:14:06'),
(202, 'std1', 'student', 1, '::1', 'Chrome 121.0.0.0, Windows 10', '2024-02-24 02:17:02'),
(203, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 121.0.0.0, Windows 10', '2024-02-25 13:16:10'),
(204, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 121.0.0.0, Windows 10', '2024-02-26 12:40:47'),
(205, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 121.0.0.0, Windows 10', '2024-02-27 12:42:19'),
(206, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 122.0.0.0, Windows 10', '2024-03-10 05:42:36'),
(207, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 122.0.0.0, Windows 10', '2024-03-11 10:29:01'),
(208, 'admin@schools.247pos.ng', 'Super Admin', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-12 10:02:20'),
(209, 'admin@schools.247pos.ng', 'Super Admin', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-12 13:47:11'),
(210, 'admin@schools.247pos.ng', 'Super Admin', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-13 10:05:49'),
(211, 'admin@schools.247pos.ng', 'Super Admin', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-13 13:26:34'),
(212, 'admin@schools.247pos.ng', 'Super Admin', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-14 13:08:13'),
(213, 'admin@schools.247pos.ng', 'Super Admin', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-14 19:24:11'),
(214, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 122.0.0.0, Windows 10', '2024-03-14 20:05:06'),
(215, 'ABC14', 'student', 2, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-14 21:03:15'),
(216, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 122.0.0.0, Windows 10', '2024-03-14 21:06:32'),
(217, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 122.0.0.0, Windows 10', '2024-03-14 21:12:57'),
(218, 'admin@schools.247pos.ng', 'Super Admin', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-15 06:14:53'),
(219, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 122.0.0.0, Windows 10', '2024-03-15 06:32:30'),
(220, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 122.0.0.0, Windows 10', '2024-03-16 01:25:14'),
(221, 'admin@schools.247pos.ng', 'Super Admin', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-17 01:23:40'),
(222, 'QQQ19', 'student', 3, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-17 02:08:51'),
(223, 'edricnigerialimited@gmail.com', 'Teacher', NULL, '::1', 'Chrome 122.0.0.0, Windows 10', '2024-03-17 02:15:36'),
(224, 'parent19', 'parent', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-17 02:45:02'),
(225, 'admin@schools.247pos.ng', 'Super Admin', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-17 08:23:52'),
(226, 'QQQ19', 'student', 3, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-17 08:26:06'),
(227, 'admin@schools.247pos.ng', 'Super Admin', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-18 10:06:36'),
(228, 'QQQ19', 'student', 3, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-18 11:08:30'),
(229, 'QQQ19', 'student', 3, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-18 19:53:39'),
(230, 'QQQ19', 'student', 3, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-20 10:33:01'),
(231, 'QQQ19', 'student', 3, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-20 13:31:37'),
(232, 'admin@schools.247pos.ng', 'Super Admin', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-22 19:46:45'),
(233, 'admin@schools.247pos.ng', 'Super Admin', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-23 05:21:49'),
(234, 'admin@schools.247pos.ng', 'Super Admin', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-23 10:21:12'),
(235, 'admin@schools.247pos.ng', 'Super Admin', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-27 13:01:25'),
(236, 'admin@schools.247pos.ng', 'Super Admin', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-28 13:13:47'),
(237, 'admin@schools.247pos.ng', 'Super Admin', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-28 19:30:06'),
(238, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 122.0.0.0, Windows 10', '2024-03-28 19:38:32'),
(239, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 122.0.0.0, Windows 10', '2024-03-29 05:11:02'),
(240, 'parent14', 'parent', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-29 05:15:16'),
(241, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 122.0.0.0, Windows 10', '2024-03-30 01:44:39'),
(242, 'parent14', 'parent', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-30 01:51:21'),
(243, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 122.0.0.0, Windows 10', '2024-03-30 20:22:44'),
(244, 'parent14', 'parent', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-30 20:27:46'),
(245, 'parent19', 'parent', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-30 20:36:58'),
(246, 'parent19', 'parent', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-31 01:32:55'),
(247, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 122.0.0.0, Windows 10', '2024-03-31 01:46:07'),
(248, 'parent19', 'parent', NULL, '127.0.0.1', 'Firefox 123.0, Windows 10', '2024-03-31 01:47:47'),
(249, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 122.0.0.0, Windows 10', '2024-04-01 19:31:01'),
(250, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 122.0.0.0, Windows 10', '2024-04-02 19:35:32'),
(251, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 122.0.0.0, Windows 10', '2024-04-03 20:26:28'),
(252, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 122.0.0.0, Windows 10', '2024-04-04 13:19:23'),
(253, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 123.0.0.0, Windows 10', '2024-04-09 03:59:47'),
(254, 'QQQ19', 'student', 3, '127.0.0.1', 'Firefox 124.0, Windows 10', '2024-04-09 05:24:30'),
(255, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 123.0.0.0, Windows 10', '2024-04-20 01:47:12'),
(256, 'parent19', 'parent', NULL, '127.0.0.1', 'Firefox 124.0, Windows 10', '2024-04-21 01:13:20'),
(257, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 123.0.0.0, Windows 10', '2024-04-21 01:23:47'),
(258, 'QQQ19', 'student', 3, '127.0.0.1', 'Firefox 124.0, Windows 10', '2024-04-21 01:24:51'),
(259, 'parent19', 'parent', NULL, '127.0.0.1', 'Firefox 124.0, Windows 10', '2024-04-21 02:22:17'),
(260, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 124.0.0.0, Windows 10', '2024-04-22 13:05:09'),
(261, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 124.0.0.0, Windows 10', '2024-04-23 12:01:44'),
(262, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 124.0.0.0, Windows 10', '2024-04-25 13:03:59'),
(263, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 124.0.0.0, Windows 10', '2024-04-27 04:13:47'),
(264, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 124.0.0.0, Windows 10', '2024-04-27 09:17:30'),
(265, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 124.0.0.0, Windows 10', '2024-04-27 09:50:11'),
(266, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 124.0.0.0, Windows 10', '2024-05-01 11:06:49'),
(267, 'admin@schools.247pos.ng', 'Super Admin', NULL, '185.137.164.21', 'Firefox 128.0, Windows 10', '2024-08-01 13:38:50'),
(268, 'std1', 'student', 1, '185.137.164.17', 'Chrome 127.0.0.0, Windows 10', '2024-08-01 13:47:23'),
(269, 'std1', 'student', 1, '185.137.164.20', 'Chrome 127.0.0.0, Windows 10', '2024-08-01 14:09:17'),
(270, 'std1', 'student', 1, '185.137.164.20', 'Chrome 127.0.0.0, Windows 10', '2024-08-01 14:10:02'),
(271, 'std1', 'student', 1, '185.137.164.20', 'Chrome 127.0.0.0, Windows 10', '2024-08-01 14:10:42'),
(272, 'admin@schools.247pos.ng', 'Super Admin', NULL, '105.112.211.229', 'Firefox 128.0, Windows 10', '2024-08-01 20:03:31'),
(273, 'admin@schools.247pos.ng', 'Super Admin', NULL, '197.210.71.48', 'Firefox 128.0, Windows 10', '2024-08-02 22:25:20'),
(274, 'admin@schools.247pos.ng', 'Super Admin', NULL, '185.137.164.21', 'Firefox 128.0, Windows 10', '2024-08-06 08:16:18'),
(275, 'admin@schools.247pos.ng', 'Super Admin', NULL, '185.137.164.14', 'Firefox 128.0, Windows 10', '2024-08-06 09:07:45'),
(276, 'admin@schools.247pos.ng', 'Super Admin', NULL, '98.97.79.19', 'Firefox 129.0, Windows 10', '2024-08-06 10:07:25'),
(277, 'higoseni@mailinator.com', 'Teacher', NULL, '98.97.79.19', 'Chrome 127.0.0.0, Windows 10', '2024-08-06 11:03:33'),
(278, 'higoseni@mailinator.com', 'Teacher', NULL, '105.112.108.232', 'Chrome 127.0.0.0, Windows 10', '2024-08-06 12:01:14'),
(279, 'qajane@mailinator.com', 'Admin', NULL, '98.97.79.19', 'Chrome 127.0.0.0, Windows 10', '2024-08-06 12:03:38'),
(280, 'higoseni@mailinator.com', 'Teacher', NULL, '98.97.79.19', 'Chrome 127.0.0.0, Windows 10', '2024-08-06 12:27:41'),
(281, 'admin@schools.247pos.ng', 'Super Admin', NULL, '197.210.53.130', 'Firefox 128.0, Windows 10', '2024-08-06 20:36:38'),
(282, 'admin@schools.247pos.ng', 'Super Admin', NULL, '98.97.79.203', 'Firefox 129.0, Windows 10', '2024-08-12 10:37:07'),
(283, 'admin@schools.247pos.ng', 'Super Admin', NULL, '98.97.79.203', 'Firefox 129.0, Windows 10', '2024-08-12 10:40:32'),
(284, 'higoseni@mailinator.com', 'Teacher', NULL, '98.97.79.203', 'Firefox 129.0, Windows 10', '2024-08-12 10:41:39'),
(285, 'admin@schools.247pos.ng', 'Super Admin', NULL, '98.97.79.203', 'Chrome 109.0.0.0, Windows 10', '2024-08-12 13:53:30'),
(286, 'admin@schools.247pos.ng', 'Super Admin', NULL, '98.97.79.233', 'Chrome 109.0.0.0, Windows 10', '2024-08-13 07:12:55'),
(287, 'admin@schools.247pos.ng', 'Super Admin', NULL, '98.97.79.233', 'Chrome 109.0.0.0, Windows 10', '2024-08-13 11:26:35'),
(288, 'admin@schools.247pos.ng', 'Super Admin', NULL, '98.97.79.233', 'Chrome 109.0.0.0, Windows 10', '2024-08-13 14:32:00'),
(289, 'admin@schools.247pos.ng', 'Super Admin', NULL, '102.215.57.174', 'Chrome 109.0.0.0, Windows 10', '2024-08-16 08:52:02'),
(290, 'admin@schools.247pos.ng', 'Super Admin', NULL, '102.215.57.172', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 14:19:16'),
(291, 'admin@schools.247pos.ng', 'Super Admin', NULL, '102.215.57.137', 'Chrome 127.0.0.0, Windows 10', '2024-08-22 13:08:34'),
(292, 'admin@schools.247pos.ng', 'Super Admin', NULL, '105.112.220.76', 'Firefox 129.0, Windows 10', '2024-08-25 20:46:46'),
(293, 'Blaine20', 'student', 1, '105.112.220.76', 'Chrome 128.0.0.0, Windows 10', '2024-08-25 21:43:21'),
(294, 'Eve39', 'student', 1, '105.112.220.76', 'Chrome 128.0.0.0, Windows 10', '2024-08-25 21:47:12'),
(295, 'admin@schools.247pos.ng', 'Super Admin', NULL, '105.112.212.240', 'Firefox 129.0, Windows 10', '2024-08-25 23:42:30'),
(296, 'admin@schools.247pos.ng', 'Super Admin', NULL, '103.127.92.132', 'Chrome 127.0.0.0, Windows 10', '2024-08-25 23:43:08'),
(297, 'admin@schools.247pos.ng', 'Super Admin', NULL, '117.255.238.141', 'Chrome 127.0.0.0, Windows 10', '2024-08-26 00:06:12'),
(298, 'admin@schools.247pos.ng', 'Super Admin', NULL, '117.194.205.107', 'Chrome 128.0.0.0, Linux', '2024-08-26 09:54:38'),
(299, 'admin@schools.247pos.ng', 'Super Admin', NULL, '154.57.218.23', 'Chrome 127.0.0.0, Windows 10', '2024-08-26 15:40:29'),
(300, 'admin@schools.247pos.ng', 'Super Admin', NULL, '98.97.79.63', 'Firefox 129.0, Windows 10', '2024-08-27 09:33:45'),
(301, 'admin@schools.247pos.ng', 'Super Admin', NULL, '102.89.75.2', 'Firefox 130.0, Windows 10', '2024-08-27 09:38:09'),
(302, 'admin@schools.247pos.ng', 'Super Admin', NULL, '117.192.207.88', 'Chrome 127.0.0.0, Windows 10', '2024-08-27 13:29:56'),
(303, 'admin@schools.247pos.ng', 'Super Admin', NULL, '154.192.46.61', 'Chrome 109.0.0.0, Windows 10', '2024-08-29 10:13:45'),
(304, 'admin@schools.247pos.ng', 'Super Admin', NULL, '103.31.103.148', 'Chrome 128.0.0.0, Windows 10', '2024-08-30 22:21:28'),
(305, 'admin@schools.247pos.ng', 'Super Admin', NULL, '155.94.198.2', 'Chrome 128.0.0.0, Windows 10', '2024-08-30 22:31:43'),
(306, 'admin@schools.247pos.ng', 'Super Admin', NULL, '98.97.79.250', 'Chrome 91.0.4472.85, Windows 10', '2024-09-02 08:59:11'),
(307, 'admin@schools.247pos.ng', 'Super Admin', NULL, '103.31.103.148', 'Chrome 128.0.0.0, Windows 10', '2024-09-03 17:34:11'),
(308, 'admin@schools.247pos.ng', 'Super Admin', NULL, '51.158.252.160', 'Chrome 128.0.0.0, Windows 10', '2024-09-03 17:43:13'),
(309, 'admin@schools.247pos.ng', 'Super Admin', NULL, '103.31.103.148', 'Chrome 128.0.0.0, Windows 10', '2024-09-04 13:08:42'),
(310, 'admin@schools.247pos.ng', 'Super Admin', NULL, '103.31.103.148', 'Chrome 128.0.0.0, Windows 10', '2024-09-04 15:46:20'),
(311, 'admin@schools.247pos.ng', 'Super Admin', NULL, '198.16.66.101', 'Chrome 128.0.0.0, Windows 10', '2024-09-04 20:35:57'),
(312, 'admin@schools.247pos.ng', 'Super Admin', NULL, '121.52.158.130', 'Chrome 128.0.0.0, Windows 10', '2024-09-06 17:52:47'),
(313, 'admin@schools.247pos.ng', 'Super Admin', NULL, '103.31.103.148', 'Chrome 128.0.0.0, Windows 10', '2024-09-07 17:22:32'),
(314, 'admin@schools.247pos.ng', 'Super Admin', NULL, '105.112.112.166', 'Firefox 130.0, Windows 10', '2024-09-07 17:38:22'),
(315, 'Blaine20', 'student', 1, '223.123.80.218', 'Chrome 128.0.0.0, Android', '2024-09-07 17:43:26'),
(316, 'admin@schools.247pos.ng', 'Super Admin', NULL, '51.235.242.6', 'Chrome 128.0.0.0, Windows 10', '2024-09-15 19:25:56'),
(317, 'admin@schools.247pos.ng', 'Super Admin', NULL, '39.34.147.128', 'Chrome 128.0.0.0, Windows 10', '2024-09-15 19:32:31'),
(318, 'admin@schools.247pos.ng', 'Super Admin', NULL, '105.112.218.45', 'Firefox 130.0, Windows 10', '2024-09-15 20:36:07'),
(319, 'admin@schools.247pos.ng', 'Super Admin', NULL, '119.152.232.144', 'Chrome 128.0.0.0, Windows 10', '2024-09-16 16:37:14'),
(320, 'admin@schools.247pos.ng', 'Super Admin', NULL, '119.152.232.144', 'Chrome 128.0.0.0, Windows 10', '2024-09-16 17:37:45'),
(321, 'admin@schools.247pos.ng', 'Super Admin', NULL, '197.210.52.216', 'Firefox 130.0, Windows 10', '2024-09-20 20:19:49'),
(322, 'admin@schools.247pos.ng', 'Super Admin', NULL, '119.152.232.144', 'Chrome 128.0.0.0, Windows 10', '2024-09-20 20:31:07'),
(323, 'admin@schools.247pos.ng', 'Super Admin', NULL, '119.152.232.144', 'Chrome 128.0.0.0, Windows 10', '2024-09-20 20:37:20'),
(324, 'Blaine20', 'student', 1, '119.152.232.144', 'Chrome 128.0.0.0, Windows 10', '2024-09-20 20:44:04'),
(325, 'admin@schools.247pos.ng', 'Super Admin', NULL, '197.210.77.164', 'Firefox 130.0, Windows 10', '2024-09-30 22:21:27'),
(326, 'admin@schools.247pos.ng', 'Super Admin', NULL, '119.152.232.144', 'Chrome 129.0.0.0, Windows 10', '2024-09-30 22:30:32'),
(327, 'admin@schools.247pos.ng', 'Super Admin', NULL, '119.152.232.144', 'Chrome 129.0.0.0, Windows 10', '2024-09-30 23:47:21'),
(328, 'admin@schools.247pos.ng', 'Super Admin', NULL, '119.152.232.144', 'Chrome 129.0.0.0, Windows 10', '2024-10-02 18:35:43'),
(329, 'admin@schools.247pos.ng', 'Super Admin', NULL, '119.152.232.144', 'Chrome 129.0.0.0, Windows 10', '2024-10-02 18:49:02'),
(330, 'admin@schools.247pos.ng', 'Super Admin', NULL, '119.152.232.144', 'Chrome 129.0.0.0, Windows 10', '2024-10-02 19:02:14'),
(331, 'admin@schools.247pos.ng', 'Super Admin', NULL, '119.152.232.144', 'Chrome 129.0.0.0, Windows 10', '2024-10-02 19:12:44'),
(332, 'admin@schools.247pos.ng', 'Super Admin', NULL, '119.152.232.144', 'Chrome 129.0.0.0, Windows 10', '2024-10-02 19:26:07'),
(333, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-03 05:52:15'),
(334, 'parent20', 'parent', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-07 18:17:14'),
(335, 'parent20', 'parent', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-07 18:19:13'),
(336, 'parent20', 'parent', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-07 18:19:33'),
(337, 'parent20', 'parent', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-07 19:04:40'),
(338, 'Willa21', 'student', 1, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-07 19:05:16'),
(339, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-07 19:05:58'),
(340, 'parent20', 'parent', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-07 20:33:05'),
(341, 'parent20', 'parent', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-07 20:36:40'),
(342, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-10 19:41:53'),
(343, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-11 13:15:00'),
(344, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-14 14:10:13'),
(345, 'parent20', 'parent', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-14 14:26:32'),
(346, 'parent20', 'parent', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-14 15:09:48'),
(347, 'parent20', 'parent', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-14 18:04:06'),
(348, 'Willa21', 'student', 1, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-14 19:52:22'),
(349, 'parent20', 'parent', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-14 20:52:02'),
(350, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-15 12:31:03'),
(351, 'parent20', 'parent', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-15 13:51:45'),
(352, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-15 15:35:18'),
(353, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-16 12:43:31'),
(354, 'parent20', 'parent', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-16 12:50:32'),
(355, 'Willa21', 'student', 1, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-16 12:59:19'),
(356, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-16 16:38:38'),
(357, 'parent20', 'parent', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-16 16:53:49'),
(358, 'Willa21', 'student', 1, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-16 19:36:26'),
(359, 'parent20', 'parent', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-16 22:12:01'),
(360, 'parent20', 'parent', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-17 12:34:08'),
(361, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-17 12:39:25'),
(362, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-17 17:03:37'),
(363, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-18 12:47:12'),
(364, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-18 20:48:11'),
(365, 'parent20', 'parent', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-18 20:58:26'),
(366, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-21 13:28:12'),
(367, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-21 16:57:39'),
(368, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-22 15:36:17'),
(369, 'parent20', 'parent', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-22 15:50:45'),
(370, 'Willa21', 'student', 1, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-22 16:01:40'),
(371, 'Blaine20', 'student', 1, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-22 16:02:35'),
(372, 'parent20', 'parent', NULL, '::1', 'Chrome 129.0.0.0, Windows 10', '2024-10-22 17:07:00'),
(373, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 130.0.0.0, Windows 10', '2024-10-24 13:55:48'),
(374, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 130.0.0.0, Windows 10', '2024-10-25 14:41:09'),
(375, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 130.0.0.0, Windows 10', '2024-10-26 17:20:00'),
(376, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 130.0.0.0, Windows 10', '2024-10-31 22:37:40'),
(377, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 130.0.0.0, Windows 10', '2024-11-01 12:57:25'),
(378, 'parent20', 'parent', NULL, '::1', 'Chrome 130.0.0.0, Windows 10', '2024-11-12 13:55:28'),
(379, 'parent20', 'parent', NULL, '::1', 'Chrome 130.0.0.0, Windows 10', '2024-11-12 13:56:16'),
(380, 'Willa21', 'student', 1, '::1', 'Chrome 130.0.0.0, Windows 10', '2024-11-12 13:56:29'),
(381, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 130.0.0.0, Windows 10', '2024-11-12 13:57:45'),
(382, 'admin@schools.247pos.ng', 'Super Admin', NULL, '::1', 'Chrome 130.0.0.0, Windows 10', '2024-11-28 17:10:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `childs` text NOT NULL,
  `role` varchar(30) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `currency_id` int(11) DEFAULT 0,
  `verification_code` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES
(39, 20, 'Blaine20', '898087', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:13:45', NULL),
(40, 0, 'parent20', 'g7nmhp', '20', 'parent', 0, 0, '', 'yes', '2024-08-06 12:13:45', NULL),
(41, 21, 'Willa21', '934807', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:36:04', NULL),
(42, 0, 'parent21', 'oha7um', '21', 'parent', 0, 0, '', 'yes', '2024-08-06 12:36:04', NULL),
(43, 22, 'Adam22', '237649', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:38:23', NULL),
(44, 0, 'parent22', 'wi75hc', '22', 'parent', 0, 0, '', 'yes', '2024-08-06 12:38:23', NULL),
(45, 23, 'Xenos23', '382913', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:38:48', NULL),
(46, 0, 'parent23', 'r5f1ds', '23', 'parent', 0, 0, '', 'yes', '2024-08-06 12:38:48', NULL),
(47, 24, 'Rinah24', '300811', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:39:04', NULL),
(48, 0, 'parent24', 'rzvzcg', '24', 'parent', 0, 0, '', 'yes', '2024-08-06 12:39:04', NULL),
(49, 25, 'Marshall25', '210720', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:40:57', NULL),
(50, 0, 'parent25', '3tioc2', '25', 'parent', 0, 0, '', 'yes', '2024-08-06 12:40:57', NULL),
(51, 26, 'Shafira26', '350384', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:41:28', NULL),
(52, 0, 'parent26', '00a4w9', '26', 'parent', 0, 0, '', 'yes', '2024-08-06 12:41:28', NULL),
(53, 27, 'Adrian27', '386386', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:41:43', NULL),
(54, 0, 'parent27', 'fzhi37', '27', 'parent', 0, 0, '', 'yes', '2024-08-06 12:41:43', NULL),
(55, 28, 'Rosalyn28', '482930', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:42:01', NULL),
(56, 0, 'parent28', 'cqz5j8', '28', 'parent', 0, 0, '', 'yes', '2024-08-06 12:42:01', NULL),
(57, 29, 'Irene29', '891306', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:42:20', NULL),
(58, 0, 'parent29', '75u25y', '29', 'parent', 0, 0, '', 'yes', '2024-08-06 12:42:20', NULL),
(59, 30, 'Wynter30', '323210', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:42:39', NULL),
(60, 0, 'parent30', '23lwlu', '30', 'parent', 0, 0, '', 'yes', '2024-08-06 12:42:39', NULL),
(61, 31, 'Amanda31', '462092', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:42:57', NULL),
(62, 0, 'parent31', 'lbmpyt', '31', 'parent', 0, 0, '', 'yes', '2024-08-06 12:42:57', NULL),
(63, 32, 'Reed32', '992739', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:43:17', NULL),
(64, 0, 'parent32', 'wdr92o', '32', 'parent', 0, 0, '', 'yes', '2024-08-06 12:43:17', NULL),
(65, 33, 'Amir33', '663914', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:43:39', NULL),
(66, 0, 'parent33', 'tn4e7u', '33', 'parent', 0, 0, '', 'yes', '2024-08-06 12:43:39', NULL),
(67, 34, 'Savannah34', '639861', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:44:06', NULL),
(68, 0, 'parent34', 'ah3om0', '34', 'parent', 0, 0, '', 'yes', '2024-08-06 12:44:06', NULL),
(69, 35, 'Nina35', '338803', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:44:29', NULL),
(70, 0, 'parent35', 'jf8g8p', '35', 'parent', 0, 0, '', 'yes', '2024-08-06 12:44:29', NULL),
(71, 36, 'Kirby36', '502322', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:48:21', NULL),
(72, 0, 'parent36', 'sxml6c', '36', 'parent', 0, 0, '', 'yes', '2024-08-06 12:48:21', NULL),
(73, 37, 'Geoffrey37', '435758', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:48:24', NULL),
(74, 0, 'parent37', 'i3dunz', '37', 'parent', 0, 0, '', 'yes', '2024-08-06 12:48:24', NULL),
(75, 38, 'Jessamine38', '325507', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:48:37', NULL),
(76, 0, 'parent38', 'dinwcq', '38', 'parent', 0, 0, '', 'yes', '2024-08-06 12:48:37', NULL),
(77, 39, 'Eve39', '690790', '', 'student', 4, 0, '', 'yes', '2024-08-06 12:48:55', NULL),
(78, 0, 'parent39', 'x9j6kr', '39', 'parent', 0, 0, '', 'yes', '2024-08-06 12:48:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_authentication`
--

CREATE TABLE `users_authentication` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `expired_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `vehicle_no` varchar(20) DEFAULT NULL,
  `vehicle_model` varchar(100) NOT NULL DEFAULT 'None',
  `vehicle_photo` varchar(255) DEFAULT NULL,
  `manufacture_year` varchar(4) DEFAULT NULL,
  `registration_number` varchar(50) NOT NULL,
  `chasis_number` varchar(100) NOT NULL,
  `max_seating_capacity` varchar(255) NOT NULL,
  `driver_name` varchar(50) DEFAULT NULL,
  `driver_licence` varchar(50) NOT NULL DEFAULT 'None',
  `driver_contact` varchar(20) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_routes`
--

CREATE TABLE `vehicle_routes` (
  `id` int(11) NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `video_tutorial`
--

CREATE TABLE `video_tutorial` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `vid_title` text DEFAULT NULL,
  `description` text NOT NULL,
  `thumb_path` varchar(500) DEFAULT NULL,
  `dir_path` varchar(500) DEFAULT NULL,
  `img_name` varchar(300) NOT NULL,
  `thumb_name` varchar(300) NOT NULL,
  `video_link` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `video_tutorial_class_sections`
--

CREATE TABLE `video_tutorial_class_sections` (
  `id` int(11) NOT NULL,
  `video_tutorial_id` int(11) NOT NULL,
  `class_section_id` int(11) NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitors_book`
--

CREATE TABLE `visitors_book` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `purpose` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(12) NOT NULL,
  `id_proof` varchar(50) NOT NULL,
  `no_of_people` int(11) NOT NULL,
  `date` date NOT NULL,
  `in_time` varchar(20) NOT NULL,
  `out_time` varchar(20) NOT NULL,
  `note` text NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `meeting_with` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitors_purpose`
--

CREATE TABLE `visitors_purpose` (
  `id` int(11) NOT NULL,
  `visitors_purpose` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumni_events`
--
ALTER TABLE `alumni_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `alumni_students`
--
ALTER TABLE `alumni_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `attendence_type`
--
ALTER TABLE `attendence_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aws_s3_settings`
--
ALTER TABLE `aws_s3_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `captcha`
--
ALTER TABLE `captcha`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_connections`
--
ALTER TABLE `chat_connections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_user_one` (`chat_user_one`),
  ADD KEY `chat_user_two` (`chat_user_two`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_user_id` (`chat_user_id`),
  ADD KEY `chat_connection_id` (`chat_connection_id`);

--
-- Indexes for table `chat_users`
--
ALTER TABLE `chat_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `create_staff_id` (`create_staff_id`),
  ADD KEY `create_student_id` (`create_student_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_sections`
--
ALTER TABLE `class_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `class_section_times`
--
ALTER TABLE `class_section_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_section_id` (`class_section_id`);

--
-- Indexes for table `class_teacher`
--
ALTER TABLE `class_teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaint_type`
--
ALTER TABLE `complaint_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `cls_sec_id` (`cls_sec_id`);

--
-- Indexes for table `content_for`
--
ALTER TABLE `content_for`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_id` (`content_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `content_types`
--
ALTER TABLE `content_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_category`
--
ALTER TABLE `course_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_lesson_quiz_order`
--
ALTER TABLE `course_lesson_quiz_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_id` (`course_section_id`);

--
-- Indexes for table `course_progress`
--
ALTER TABLE `course_progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_section_id` (`course_section_id`);

--
-- Indexes for table `course_quiz_answer`
--
ALTER TABLE `course_quiz_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `quiz_id` (`course_quiz_id`),
  ADD KEY `question_id` (`course_quiz_question_id`);

--
-- Indexes for table `course_quiz_question`
--
ALTER TABLE `course_quiz_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_quiz_id` (`course_quiz_id`);

--
-- Indexes for table `course_rating`
--
ALTER TABLE `course_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_name` (`name`),
  ADD KEY `idx_belong_to` (`belong_to`),
  ADD KEY `idx_type` (`type`),
  ADD KEY `idx_visible_on_table` (`visible_on_table`),
  ADD KEY `idx_weight` (`weight`);
ALTER TABLE `custom_fields` ADD FULLTEXT KEY `idx_field_values` (`field_values`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_id` (`custom_field_id`),
  ADD KEY `idx_belong_table_id` (`belong_table_id`),
  ADD KEY `idx_field_value` (`field_value`);

--
-- Indexes for table `daily_assignment`
--
ALTER TABLE `daily_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `evaluated_by` (`evaluated_by`),
  ADD KEY `subject_group_subject_id` (`subject_group_subject_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disable_reason`
--
ALTER TABLE `disable_reason`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dispatch_receive`
--
ALTER TABLE `dispatch_receive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_attachments`
--
ALTER TABLE `email_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_id` (`message_id`);

--
-- Indexes for table `email_config`
--
ALTER TABLE `email_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_template`
--
ALTER TABLE `email_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_template_attachment`
--
ALTER TABLE `email_template_attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `assigned` (`assigned`),
  ADD KEY `enquiry_ibfk_4` (`class_id`);

--
-- Indexes for table `enquiry_type`
--
ALTER TABLE `enquiry_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sesion_id` (`sesion_id`);

--
-- Indexes for table `exam_groups`
--
ALTER TABLE `exam_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_group_class_batch_exams`
--
ALTER TABLE `exam_group_class_batch_exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_id` (`exam_group_id`),
  ADD KEY `exam_group_class_batch_exams_ibfk_2` (`session_id`);

--
-- Indexes for table `exam_group_class_batch_exam_students`
--
ALTER TABLE `exam_group_class_batch_exam_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_class_batch_exam_id` (`exam_group_class_batch_exam_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `student_session_id` (`student_session_id`);

--
-- Indexes for table `exam_group_class_batch_exam_subjects`
--
ALTER TABLE `exam_group_class_batch_exam_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_class_batch_exams_id` (`exam_group_class_batch_exams_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `exam_group_exam_connections`
--
ALTER TABLE `exam_group_exam_connections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_id` (`exam_group_id`),
  ADD KEY `exam_group_class_batch_exams_id` (`exam_group_class_batch_exams_id`);

--
-- Indexes for table `exam_group_exam_results`
--
ALTER TABLE `exam_group_exam_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_class_batch_exam_subject_id` (`exam_group_class_batch_exam_subject_id`),
  ADD KEY `exam_group_student_id` (`exam_group_student_id`),
  ADD KEY `exam_group_class_batch_exam_student_id` (`exam_group_class_batch_exam_student_id`);

--
-- Indexes for table `exam_group_students`
--
ALTER TABLE `exam_group_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_id` (`exam_group_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `student_session_id` (`student_session_id`);

--
-- Indexes for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_subject_id` (`teacher_subject_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exp_head_id` (`exp_head_id`);

--
-- Indexes for table `expense_head`
--
ALTER TABLE `expense_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feemasters`
--
ALTER TABLE `feemasters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `feetype_id` (`feetype_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `fees_discounts`
--
ALTER TABLE `fees_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `fees_reminder`
--
ALTER TABLE `fees_reminder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feetype`
--
ALTER TABLE `feetype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_groups`
--
ALTER TABLE `fee_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_groups_feetype`
--
ALTER TABLE `fee_groups_feetype`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_session_group_id` (`fee_session_group_id`),
  ADD KEY `fee_groups_id` (`fee_groups_id`),
  ADD KEY `feetype_id` (`feetype_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `fee_receipt_no`
--
ALTER TABLE `fee_receipt_no`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_session_groups`
--
ALTER TABLE `fee_session_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_groups_id` (`fee_groups_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `filetypes`
--
ALTER TABLE `filetypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow_up`
--
ALTER TABLE `follow_up`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enquiry_id` (`enquiry_id`),
  ADD KEY `followup_by` (`followup_by`);

--
-- Indexes for table `front_cms_media_gallery`
--
ALTER TABLE `front_cms_media_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_menus`
--
ALTER TABLE `front_cms_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_menu_items`
--
ALTER TABLE `front_cms_menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_page_contents`
--
ALTER TABLE `front_cms_page_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`page_id`);

--
-- Indexes for table `front_cms_programs`
--
ALTER TABLE `front_cms_programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_program_photos`
--
ALTER TABLE `front_cms_program_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_id` (`program_id`);

--
-- Indexes for table `front_cms_settings`
--
ALTER TABLE `front_cms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_ins`
--
ALTER TABLE `gateway_ins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_admission_id` (`online_admission_id`);

--
-- Indexes for table `gateway_ins_response`
--
ALTER TABLE `gateway_ins_response`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gateway_ins_id` (`gateway_ins_id`);

--
-- Indexes for table `general_calls`
--
ALTER TABLE `general_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmeet`
--
ALTER TABLE `gmeet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `created_id` (`created_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `gmeet_history`
--
ALTER TABLE `gmeet_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gmeet_id` (`gmeet_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `gmeet_sections`
--
ALTER TABLE `gmeet_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cls_section_id` (`cls_section_id`),
  ADD KEY `gmeet_id` (`gmeet_id`);

--
-- Indexes for table `gmeet_settings`
--
ALTER TABLE `gmeet_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmeet_staff`
--
ALTER TABLE `gmeet_staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gmeet_id` (`gmeet_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grade_settings`
--
ALTER TABLE `grade_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `homework`
--
ALTER TABLE `homework`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_group_subject_id` (`subject_group_subject_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `evaluated_by` (`evaluated_by`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `homework_evaluation`
--
ALTER TABLE `homework_evaluation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `homework_id` (`homework_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `student_session_id` (`student_session_id`);

--
-- Indexes for table `hostel`
--
ALTER TABLE `hostel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hostel_rooms`
--
ALTER TABLE `hostel_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hostel_id` (`hostel_id`),
  ADD KEY `room_type_id` (`room_type_id`);

--
-- Indexes for table `id_card`
--
ALTER TABLE `id_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`id`),
  ADD KEY `income_head_id` (`income_head_id`);

--
-- Indexes for table `income_head`
--
ALTER TABLE `income_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_category_id` (`item_category_id`),
  ADD KEY `item_store_id` (`item_store_id`),
  ADD KEY `item_supplier_id` (`item_supplier_id`);

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_issue`
--
ALTER TABLE `item_issue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_category_id` (`item_category_id`),
  ADD KEY `issue_to` (`issue_to`),
  ADD KEY `issue_by` (`issue_by`);

--
-- Indexes for table `item_stock`
--
ALTER TABLE `item_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `item_store`
--
ALTER TABLE `item_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_supplier`
--
ALTER TABLE `item_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `subject_group_subject_id` (`subject_group_subject_id`),
  ADD KEY `subject_group_class_sections_id` (`subject_group_class_sections_id`);

--
-- Indexes for table `lesson_plan_forum`
--
ALTER TABLE `lesson_plan_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_syllabus_id` (`subject_syllabus_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `libarary_members`
--
ALTER TABLE `libarary_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mark_divisions`
--
ALTER TABLE `mark_divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_roles`
--
ALTER TABLE `notification_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `send_notification_id` (`send_notification_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `notification_setting`
--
ALTER TABLE `notification_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_fees_payments`
--
ALTER TABLE `offline_fees_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_fees_master_id` (`student_fees_master_id`),
  ADD KEY `fee_groups_feetype_id` (`fee_groups_feetype_id`),
  ADD KEY `student_transport_fee_id` (`student_transport_fee_id`),
  ADD KEY `offline_fees_payments_ibfk_4` (`approved_by`),
  ADD KEY `student_session_id` (`student_session_id`);

--
-- Indexes for table `onlineexam`
--
ALTER TABLE `onlineexam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `onlineexam_attempts`
--
ALTER TABLE `onlineexam_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onlineexam_student_id` (`onlineexam_student_id`);

--
-- Indexes for table `onlineexam_questions`
--
ALTER TABLE `onlineexam_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onlineexam_id` (`onlineexam_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `onlineexam_students`
--
ALTER TABLE `onlineexam_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onlineexam_id` (`onlineexam_id`),
  ADD KEY `student_session_id` (`student_session_id`);

--
-- Indexes for table `onlineexam_student_results`
--
ALTER TABLE `onlineexam_student_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onlineexam_student_id` (`onlineexam_student_id`),
  ADD KEY `onlineexam_question_id` (`onlineexam_question_id`);

--
-- Indexes for table `online_admissions`
--
ALTER TABLE `online_admissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `hostel_room_id` (`hostel_room_id`),
  ADD KEY `school_house_id` (`school_house_id`),
  ADD KEY `online_admissions_ibfk_1` (`class_section_id`);

--
-- Indexes for table `online_admission_custom_field_value`
--
ALTER TABLE `online_admission_custom_field_value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_id` (`custom_field_id`);

--
-- Indexes for table `online_admission_fields`
--
ALTER TABLE `online_admission_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_admission_payment`
--
ALTER TABLE `online_admission_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_admission_id` (`online_admission_id`);

--
-- Indexes for table `online_courses`
--
ALTER TABLE `online_courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `online_course_class_sections`
--
ALTER TABLE `online_course_class_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `class_section_id` (`class_section_id`);

--
-- Indexes for table `online_course_lesson`
--
ALTER TABLE `online_course_lesson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_section_id` (`course_section_id`) USING BTREE;

--
-- Indexes for table `online_course_payment`
--
ALTER TABLE `online_course_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_course_processing_payment`
--
ALTER TABLE `online_course_processing_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `online_courses_id` (`online_courses_id`);

--
-- Indexes for table `online_course_quiz`
--
ALTER TABLE `online_course_quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `course_section_id` (`course_section_id`) USING BTREE;

--
-- Indexes for table `online_course_section`
--
ALTER TABLE `online_course_section`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_course_id` (`online_course_id`);

--
-- Indexes for table `online_course_settings`
--
ALTER TABLE `online_course_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payslip_allowance`
--
ALTER TABLE `payslip_allowance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `payslip_id` (`payslip_id`);

--
-- Indexes for table `permission_category`
--
ALTER TABLE `permission_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_short_code` (`short_code`),
  ADD KEY `perm_group_id` (`perm_group_id`);

--
-- Indexes for table `permission_group`
--
ALTER TABLE `permission_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_student`
--
ALTER TABLE `permission_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `permotion_settings`
--
ALTER TABLE `permotion_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickup_point`
--
ALTER TABLE `pickup_point`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `print_headerfooter`
--
ALTER TABLE `print_headerfooter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `class_section_id` (`class_section_id`);

--
-- Indexes for table `read_notification`
--
ALTER TABLE `read_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_id` (`notification_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `reference`
--
ALTER TABLE `reference`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result_details`
--
ALTER TABLE `result_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `perm_cat_id` (`perm_cat_id`);

--
-- Indexes for table `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `route_pickup_point`
--
ALTER TABLE `route_pickup_point`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transport_route_id` (`transport_route_id`),
  ADD KEY `pickup_point_id` (`pickup_point_id`);

--
-- Indexes for table `school_houses`
--
ALTER TABLE `school_houses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sch_settings`
--
ALTER TABLE `sch_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scretch_cards`
--
ALTER TABLE `scretch_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scretch_card_pins`
--
ALTER TABLE `scretch_card_pins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `send_notification`
--
ALTER TABLE `send_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_id` (`created_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `share_contents`
--
ALTER TABLE `share_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `share_content_for`
--
ALTER TABLE `share_content_for`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_content_id` (`share_content_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `class_section_id` (`class_section_id`),
  ADD KEY `user_parent_id` (`user_parent_id`);

--
-- Indexes for table `share_upload_contents`
--
ALTER TABLE `share_upload_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_content_id` (`upload_content_id`),
  ADD KEY `share_content_id` (`share_content_id`);

--
-- Indexes for table `sidebar_menus`
--
ALTER TABLE `sidebar_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_group_id` (`permission_group_id`);

--
-- Indexes for table `sidebar_sub_menus`
--
ALTER TABLE `sidebar_sub_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sidebar_menu_id` (`sidebar_menu_id`),
  ADD KEY `permission_group_id` (`permission_group_id`);

--
-- Indexes for table `sms_config`
--
ALTER TABLE `sms_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_template`
--
ALTER TABLE `sms_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `department` (`department`);

--
-- Indexes for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_staff_attendance_staff` (`staff_id`),
  ADD KEY `FK_staff_attendance_staff_attendance_type` (`staff_attendance_type_id`);

--
-- Indexes for table `staff_attendance_type`
--
ALTER TABLE `staff_attendance_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_designation`
--
ALTER TABLE `staff_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_id_card`
--
ALTER TABLE `staff_id_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_leave_details`
--
ALTER TABLE `staff_leave_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_staff_leave_details_staff` (`staff_id`),
  ADD KEY `FK_staff_leave_details_leave_types` (`leave_type_id`);

--
-- Indexes for table `staff_leave_request`
--
ALTER TABLE `staff_leave_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_staff_leave_request_staff` (`staff_id`),
  ADD KEY `FK_staff_leave_request_leave_types` (`leave_type_id`),
  ADD KEY `applied_by` (`applied_by`);

--
-- Indexes for table `staff_payroll`
--
ALTER TABLE `staff_payroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_payslip`
--
ALTER TABLE `staff_payslip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_staff_payslip_staff` (`staff_id`);

--
-- Indexes for table `staff_rating`
--
ALTER TABLE `staff_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_staff_rating_staff` (`staff_id`);

--
-- Indexes for table `staff_roles`
--
ALTER TABLE `staff_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `staff_timeline`
--
ALTER TABLE `staff_timeline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_staff_timeline_staff` (`staff_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_applyleave`
--
ALTER TABLE `student_applyleave`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `approve_by` (`approve_by`);

--
-- Indexes for table `student_attendences`
--
ALTER TABLE `student_attendences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `attendence_type_id` (`attendence_type_id`);

--
-- Indexes for table `student_behaviour`
--
ALTER TABLE `student_behaviour`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_doc`
--
ALTER TABLE `student_doc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_edit_fields`
--
ALTER TABLE `student_edit_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_fees`
--
ALTER TABLE `student_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feemaster_id` (`feemaster_id`),
  ADD KEY `student_session_id` (`student_session_id`);

--
-- Indexes for table `student_fees_deposite`
--
ALTER TABLE `student_fees_deposite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_fees_master_id` (`student_fees_master_id`),
  ADD KEY `fee_groups_feetype_id` (`fee_groups_feetype_id`),
  ADD KEY `student_transport_fee_id` (`student_transport_fee_id`);

--
-- Indexes for table `student_fees_discounts`
--
ALTER TABLE `student_fees_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `fees_discount_id` (`fees_discount_id`);

--
-- Indexes for table `student_fees_master`
--
ALTER TABLE `student_fees_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `fee_session_group_id` (`fee_session_group_id`);

--
-- Indexes for table `student_fees_processing`
--
ALTER TABLE `student_fees_processing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_fees_master_id` (`student_fees_master_id`),
  ADD KEY `fee_groups_feetype_id` (`fee_groups_feetype_id`),
  ADD KEY `student_transport_fee_id` (`student_transport_fee_id`),
  ADD KEY `gateway_ins_id` (`gateway_ins_id`);

--
-- Indexes for table `student_quiz_status`
--
ALTER TABLE `student_quiz_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_quiz_id` (`course_quiz_id`) USING BTREE;

--
-- Indexes for table `student_session`
--
ALTER TABLE `student_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `student_session_ibfk_5` (`vehroute_id`),
  ADD KEY `hostel_room_id` (`hostel_room_id`),
  ADD KEY `student_session_ibfk_6` (`route_pickup_point_id`);

--
-- Indexes for table `student_subject_attendances`
--
ALTER TABLE `student_subject_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendence_type_id` (`attendence_type_id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `subject_timetable_id` (`subject_timetable_id`);

--
-- Indexes for table `student_timeline`
--
ALTER TABLE `student_timeline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student_transport_fees`
--
ALTER TABLE `student_transport_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `route_pickup_point_id` (`route_pickup_point_id`),
  ADD KEY `transport_feemaster_id` (`transport_feemaster_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_groups`
--
ALTER TABLE `subject_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `subject_group_class_sections`
--
ALTER TABLE `subject_group_class_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_section_id` (`class_section_id`),
  ADD KEY `subject_group_id` (`subject_group_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `subject_group_subjects`
--
ALTER TABLE `subject_group_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_group_id` (`subject_group_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `subject_syllabus`
--
ALTER TABLE `subject_syllabus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `created_for` (`created_for`);

--
-- Indexes for table `subject_teacher`
--
ALTER TABLE `subject_teacher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_timetable`
--
ALTER TABLE `subject_timetable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `subject_group_id` (`subject_group_id`),
  ADD KEY `subject_group_subject_id` (`subject_group_subject_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `submit_assignment`
--
ALTER TABLE `submit_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `homework_id` (`homework_id`);

--
-- Indexes for table `template_admitcards`
--
ALTER TABLE `template_admitcards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_marksheets`
--
ALTER TABLE `template_marksheets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `lesson_id` (`lesson_id`);

--
-- Indexes for table `transport_feemaster`
--
ALTER TABLE `transport_feemaster`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `transport_route`
--
ALTER TABLE `transport_route`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upload_contents`
--
ALTER TABLE `upload_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_by` (`upload_by`),
  ADD KEY `upload_contents_ibfk_2` (`content_type_id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_section_id` (`class_section_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_authentication`
--
ALTER TABLE `users_authentication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_routes`
--
ALTER TABLE `vehicle_routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `route_id` (`route_id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `video_tutorial`
--
ALTER TABLE `video_tutorial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `video_tutorial_class_sections`
--
ALTER TABLE `video_tutorial_class_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_section_id` (`class_section_id`),
  ADD KEY `video_tutorial_id` (`video_tutorial_id`);

--
-- Indexes for table `visitors_book`
--
ALTER TABLE `visitors_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `student_session_id` (`student_session_id`);

--
-- Indexes for table `visitors_purpose`
--
ALTER TABLE `visitors_purpose`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alumni_events`
--
ALTER TABLE `alumni_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alumni_students`
--
ALTER TABLE `alumni_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendence_type`
--
ALTER TABLE `attendence_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `aws_s3_settings`
--
ALTER TABLE `aws_s3_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_issues`
--
ALTER TABLE `book_issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `captcha`
--
ALTER TABLE `captcha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chat_connections`
--
ALTER TABLE `chat_connections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chat_users`
--
ALTER TABLE `chat_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `class_sections`
--
ALTER TABLE `class_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `class_section_times`
--
ALTER TABLE `class_section_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_teacher`
--
ALTER TABLE `class_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaint_type`
--
ALTER TABLE `complaint_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content_for`
--
ALTER TABLE `content_for`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content_types`
--
ALTER TABLE `content_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_category`
--
ALTER TABLE `course_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course_lesson_quiz_order`
--
ALTER TABLE `course_lesson_quiz_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `course_progress`
--
ALTER TABLE `course_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_quiz_answer`
--
ALTER TABLE `course_quiz_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_quiz_question`
--
ALTER TABLE `course_quiz_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_rating`
--
ALTER TABLE `course_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `daily_assignment`
--
ALTER TABLE `daily_assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disable_reason`
--
ALTER TABLE `disable_reason`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dispatch_receive`
--
ALTER TABLE `dispatch_receive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_attachments`
--
ALTER TABLE `email_attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_config`
--
ALTER TABLE `email_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_template`
--
ALTER TABLE `email_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_template_attachment`
--
ALTER TABLE `email_template_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiry_type`
--
ALTER TABLE `enquiry_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_groups`
--
ALTER TABLE `exam_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_group_class_batch_exams`
--
ALTER TABLE `exam_group_class_batch_exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_group_class_batch_exam_students`
--
ALTER TABLE `exam_group_class_batch_exam_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_group_class_batch_exam_subjects`
--
ALTER TABLE `exam_group_class_batch_exam_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_group_exam_connections`
--
ALTER TABLE `exam_group_exam_connections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_group_exam_results`
--
ALTER TABLE `exam_group_exam_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_group_students`
--
ALTER TABLE `exam_group_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_head`
--
ALTER TABLE `expense_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feemasters`
--
ALTER TABLE `feemasters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_discounts`
--
ALTER TABLE `fees_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_reminder`
--
ALTER TABLE `fees_reminder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feetype`
--
ALTER TABLE `feetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_groups`
--
ALTER TABLE `fee_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_groups_feetype`
--
ALTER TABLE `fee_groups_feetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_receipt_no`
--
ALTER TABLE `fee_receipt_no`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_session_groups`
--
ALTER TABLE `fee_session_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filetypes`
--
ALTER TABLE `filetypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `follow_up`
--
ALTER TABLE `follow_up`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_media_gallery`
--
ALTER TABLE `front_cms_media_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_menus`
--
ALTER TABLE `front_cms_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `front_cms_menu_items`
--
ALTER TABLE `front_cms_menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `front_cms_page_contents`
--
ALTER TABLE `front_cms_page_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_programs`
--
ALTER TABLE `front_cms_programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_program_photos`
--
ALTER TABLE `front_cms_program_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_settings`
--
ALTER TABLE `front_cms_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gateway_ins`
--
ALTER TABLE `gateway_ins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateway_ins_response`
--
ALTER TABLE `gateway_ins_response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_calls`
--
ALTER TABLE `general_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gmeet`
--
ALTER TABLE `gmeet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gmeet_history`
--
ALTER TABLE `gmeet_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gmeet_sections`
--
ALTER TABLE `gmeet_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gmeet_settings`
--
ALTER TABLE `gmeet_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gmeet_staff`
--
ALTER TABLE `gmeet_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grade_settings`
--
ALTER TABLE `grade_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homework`
--
ALTER TABLE `homework`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homework_evaluation`
--
ALTER TABLE `homework_evaluation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel`
--
ALTER TABLE `hostel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel_rooms`
--
ALTER TABLE `hostel_rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `id_card`
--
ALTER TABLE `id_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income_head`
--
ALTER TABLE `income_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_issue`
--
ALTER TABLE `item_issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_stock`
--
ALTER TABLE `item_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_store`
--
ALTER TABLE `item_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_supplier`
--
ALTER TABLE `item_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lesson_plan_forum`
--
ALTER TABLE `lesson_plan_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `libarary_members`
--
ALTER TABLE `libarary_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=523;

--
-- AUTO_INCREMENT for table `mark_divisions`
--
ALTER TABLE `mark_divisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_roles`
--
ALTER TABLE `notification_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_setting`
--
ALTER TABLE `notification_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `offline_fees_payments`
--
ALTER TABLE `offline_fees_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `onlineexam`
--
ALTER TABLE `onlineexam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `onlineexam_attempts`
--
ALTER TABLE `onlineexam_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `onlineexam_questions`
--
ALTER TABLE `onlineexam_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `onlineexam_students`
--
ALTER TABLE `onlineexam_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `onlineexam_student_results`
--
ALTER TABLE `onlineexam_student_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_admissions`
--
ALTER TABLE `online_admissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `online_admission_custom_field_value`
--
ALTER TABLE `online_admission_custom_field_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_admission_fields`
--
ALTER TABLE `online_admission_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `online_admission_payment`
--
ALTER TABLE `online_admission_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_courses`
--
ALTER TABLE `online_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `online_course_class_sections`
--
ALTER TABLE `online_course_class_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `online_course_lesson`
--
ALTER TABLE `online_course_lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `online_course_payment`
--
ALTER TABLE `online_course_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_course_processing_payment`
--
ALTER TABLE `online_course_processing_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_course_quiz`
--
ALTER TABLE `online_course_quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_course_section`
--
ALTER TABLE `online_course_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `online_course_settings`
--
ALTER TABLE `online_course_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payslip_allowance`
--
ALTER TABLE `payslip_allowance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_category`
--
ALTER TABLE `permission_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7018;

--
-- AUTO_INCREMENT for table `permission_group`
--
ALTER TABLE `permission_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=701;

--
-- AUTO_INCREMENT for table `permission_student`
--
ALTER TABLE `permission_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=701;

--
-- AUTO_INCREMENT for table `permotion_settings`
--
ALTER TABLE `permotion_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pickup_point`
--
ALTER TABLE `pickup_point`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `print_headerfooter`
--
ALTER TABLE `print_headerfooter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `read_notification`
--
ALTER TABLE `read_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reference`
--
ALTER TABLE `reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `result_details`
--
ALTER TABLE `result_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1546;

--
-- AUTO_INCREMENT for table `room_types`
--
ALTER TABLE `room_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `route_pickup_point`
--
ALTER TABLE `route_pickup_point`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `school_houses`
--
ALTER TABLE `school_houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scretch_cards`
--
ALTER TABLE `scretch_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `scretch_card_pins`
--
ALTER TABLE `scretch_card_pins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `send_notification`
--
ALTER TABLE `send_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `share_contents`
--
ALTER TABLE `share_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `share_content_for`
--
ALTER TABLE `share_content_for`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `share_upload_contents`
--
ALTER TABLE `share_upload_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sidebar_menus`
--
ALTER TABLE `sidebar_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `sidebar_sub_menus`
--
ALTER TABLE `sidebar_sub_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `sms_config`
--
ALTER TABLE `sms_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_template`
--
ALTER TABLE `sms_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `source`
--
ALTER TABLE `source`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_attendance_type`
--
ALTER TABLE `staff_attendance_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff_designation`
--
ALTER TABLE `staff_designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_id_card`
--
ALTER TABLE `staff_id_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff_leave_details`
--
ALTER TABLE `staff_leave_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_leave_request`
--
ALTER TABLE `staff_leave_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_payroll`
--
ALTER TABLE `staff_payroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_payslip`
--
ALTER TABLE `staff_payslip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_rating`
--
ALTER TABLE `staff_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_roles`
--
ALTER TABLE `staff_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff_timeline`
--
ALTER TABLE `staff_timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `student_applyleave`
--
ALTER TABLE `student_applyleave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_attendences`
--
ALTER TABLE `student_attendences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `student_behaviour`
--
ALTER TABLE `student_behaviour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `student_doc`
--
ALTER TABLE `student_doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_edit_fields`
--
ALTER TABLE `student_edit_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_fees`
--
ALTER TABLE `student_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_fees_deposite`
--
ALTER TABLE `student_fees_deposite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_fees_discounts`
--
ALTER TABLE `student_fees_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_fees_master`
--
ALTER TABLE `student_fees_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_fees_processing`
--
ALTER TABLE `student_fees_processing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_quiz_status`
--
ALTER TABLE `student_quiz_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_session`
--
ALTER TABLE `student_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `student_subject_attendances`
--
ALTER TABLE `student_subject_attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_timeline`
--
ALTER TABLE `student_timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_transport_fees`
--
ALTER TABLE `student_transport_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subject_groups`
--
ALTER TABLE `subject_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_group_class_sections`
--
ALTER TABLE `subject_group_class_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_group_subjects`
--
ALTER TABLE `subject_group_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_syllabus`
--
ALTER TABLE `subject_syllabus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_teacher`
--
ALTER TABLE `subject_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subject_timetable`
--
ALTER TABLE `subject_timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submit_assignment`
--
ALTER TABLE `submit_assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `template_admitcards`
--
ALTER TABLE `template_admitcards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `template_marksheets`
--
ALTER TABLE `template_marksheets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_feemaster`
--
ALTER TABLE `transport_feemaster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_route`
--
ALTER TABLE `transport_route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `upload_contents`
--
ALTER TABLE `upload_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=383;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `users_authentication`
--
ALTER TABLE `users_authentication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_routes`
--
ALTER TABLE `vehicle_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `video_tutorial`
--
ALTER TABLE `video_tutorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `video_tutorial_class_sections`
--
ALTER TABLE `video_tutorial_class_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitors_book`
--
ALTER TABLE `visitors_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitors_purpose`
--
ALTER TABLE `visitors_purpose`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumni_events`
--
ALTER TABLE `alumni_events`
  ADD CONSTRAINT `alumni_events_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `alumni_events_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `alumni_students`
--
ALTER TABLE `alumni_students`
  ADD CONSTRAINT `alumni_students_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD CONSTRAINT `book_issues_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_issues_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `libarary_members` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_connections`
--
ALTER TABLE `chat_connections`
  ADD CONSTRAINT `chat_connections_ibfk_1` FOREIGN KEY (`chat_user_one`) REFERENCES `chat_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_connections_ibfk_2` FOREIGN KEY (`chat_user_two`) REFERENCES `chat_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`chat_user_id`) REFERENCES `chat_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_messages_ibfk_2` FOREIGN KEY (`chat_connection_id`) REFERENCES `chat_connections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_users`
--
ALTER TABLE `chat_users`
  ADD CONSTRAINT `chat_users_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_users_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_users_ibfk_3` FOREIGN KEY (`create_staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_users_ibfk_4` FOREIGN KEY (`create_student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `class_sections`
--
ALTER TABLE `class_sections`
  ADD CONSTRAINT `class_sections_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_sections_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `class_section_times`
--
ALTER TABLE `class_section_times`
  ADD CONSTRAINT `class_section_times_ibfk_1` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `class_teacher`
--
ALTER TABLE `class_teacher`
  ADD CONSTRAINT `class_teacher_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_teacher_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_teacher_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_teacher_ibfk_4` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contents`
--
ALTER TABLE `contents`
  ADD CONSTRAINT `contents_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contents_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contents_ibfk_3` FOREIGN KEY (`cls_sec_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `content_for`
--
ALTER TABLE `content_for`
  ADD CONSTRAINT `content_for_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_for_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_lesson_quiz_order`
--
ALTER TABLE `course_lesson_quiz_order`
  ADD CONSTRAINT `course_lesson_quiz_order_ibfk_1` FOREIGN KEY (`course_section_id`) REFERENCES `online_course_section` (`id`);

--
-- Constraints for table `course_progress`
--
ALTER TABLE `course_progress`
  ADD CONSTRAINT `course_progress_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `online_courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_progress_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_progress_ibfk_3` FOREIGN KEY (`course_section_id`) REFERENCES `online_course_section` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_quiz_answer`
--
ALTER TABLE `course_quiz_answer`
  ADD CONSTRAINT `course_quiz_answer_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_quiz_answer_ibfk_2` FOREIGN KEY (`course_quiz_id`) REFERENCES `online_course_quiz` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_quiz_answer_ibfk_3` FOREIGN KEY (`course_quiz_question_id`) REFERENCES `course_quiz_question` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_quiz_question`
--
ALTER TABLE `course_quiz_question`
  ADD CONSTRAINT `course_quiz_question_ibfk_1` FOREIGN KEY (`course_quiz_id`) REFERENCES `online_course_quiz` (`id`);

--
-- Constraints for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD CONSTRAINT `custom_field_values_ibfk_1` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `daily_assignment`
--
ALTER TABLE `daily_assignment`
  ADD CONSTRAINT `daily_assignment_ibfk_1` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `daily_assignment_ibfk_2` FOREIGN KEY (`evaluated_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `daily_assignment_ibfk_3` FOREIGN KEY (`subject_group_subject_id`) REFERENCES `subject_group_subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `email_attachments`
--
ALTER TABLE `email_attachments`
  ADD CONSTRAINT `email_attachments_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD CONSTRAINT `enquiry_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enquiry_ibfk_3` FOREIGN KEY (`assigned`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enquiry_ibfk_4` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`sesion_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_group_class_batch_exams`
--
ALTER TABLE `exam_group_class_batch_exams`
  ADD CONSTRAINT `exam_group_class_batch_exams_ibfk_1` FOREIGN KEY (`exam_group_id`) REFERENCES `exam_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_group_class_batch_exams_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_group_class_batch_exam_students`
--
ALTER TABLE `exam_group_class_batch_exam_students`
  ADD CONSTRAINT `exam_group_class_batch_exam_students_ibfk_1` FOREIGN KEY (`exam_group_class_batch_exam_id`) REFERENCES `exam_group_class_batch_exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_group_class_batch_exam_students_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_group_class_batch_exam_students_ibfk_3` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_group_class_batch_exam_subjects`
--
ALTER TABLE `exam_group_class_batch_exam_subjects`
  ADD CONSTRAINT `exam_group_class_batch_exam_subjects_ibfk_1` FOREIGN KEY (`exam_group_class_batch_exams_id`) REFERENCES `exam_group_class_batch_exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_group_class_batch_exam_subjects_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_group_exam_connections`
--
ALTER TABLE `exam_group_exam_connections`
  ADD CONSTRAINT `exam_group_exam_connections_ibfk_1` FOREIGN KEY (`exam_group_id`) REFERENCES `exam_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_group_exam_connections_ibfk_2` FOREIGN KEY (`exam_group_class_batch_exams_id`) REFERENCES `exam_group_class_batch_exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_group_exam_results`
--
ALTER TABLE `exam_group_exam_results`
  ADD CONSTRAINT `exam_group_exam_results_ibfk_1` FOREIGN KEY (`exam_group_class_batch_exam_subject_id`) REFERENCES `exam_group_class_batch_exam_subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_group_exam_results_ibfk_2` FOREIGN KEY (`exam_group_student_id`) REFERENCES `exam_group_students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_group_exam_results_ibfk_3` FOREIGN KEY (`exam_group_class_batch_exam_student_id`) REFERENCES `exam_group_class_batch_exam_students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_group_students`
--
ALTER TABLE `exam_group_students`
  ADD CONSTRAINT `exam_group_students_ibfk_1` FOREIGN KEY (`exam_group_id`) REFERENCES `exam_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_group_students_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_group_students_ibfk_3` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  ADD CONSTRAINT `exam_schedules_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_schedules_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`exp_head_id`) REFERENCES `expense_head` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `feemasters`
--
ALTER TABLE `feemasters`
  ADD CONSTRAINT `feemasters_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `feemasters_ibfk_2` FOREIGN KEY (`feetype_id`) REFERENCES `feetype` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `feemasters_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fees_discounts`
--
ALTER TABLE `fees_discounts`
  ADD CONSTRAINT `fees_discounts_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_groups_feetype`
--
ALTER TABLE `fee_groups_feetype`
  ADD CONSTRAINT `fee_groups_feetype_ibfk_1` FOREIGN KEY (`fee_session_group_id`) REFERENCES `fee_session_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_groups_feetype_ibfk_2` FOREIGN KEY (`fee_groups_id`) REFERENCES `fee_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_groups_feetype_ibfk_3` FOREIGN KEY (`feetype_id`) REFERENCES `feetype` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_groups_feetype_ibfk_4` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_session_groups`
--
ALTER TABLE `fee_session_groups`
  ADD CONSTRAINT `fee_session_groups_ibfk_1` FOREIGN KEY (`fee_groups_id`) REFERENCES `fee_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_session_groups_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `follow_up`
--
ALTER TABLE `follow_up`
  ADD CONSTRAINT `follow_up_ibfk_1` FOREIGN KEY (`enquiry_id`) REFERENCES `enquiry` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `follow_up_ibfk_2` FOREIGN KEY (`followup_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `front_cms_menu_items`
--
ALTER TABLE `front_cms_menu_items`
  ADD CONSTRAINT `front_cms_menu_items_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `front_cms_menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `front_cms_page_contents`
--
ALTER TABLE `front_cms_page_contents`
  ADD CONSTRAINT `front_cms_page_contents_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `front_cms_pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `front_cms_program_photos`
--
ALTER TABLE `front_cms_program_photos`
  ADD CONSTRAINT `front_cms_program_photos_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `front_cms_programs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gateway_ins`
--
ALTER TABLE `gateway_ins`
  ADD CONSTRAINT `gateway_ins_ibfk_1` FOREIGN KEY (`online_admission_id`) REFERENCES `online_admissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gateway_ins_response`
--
ALTER TABLE `gateway_ins_response`
  ADD CONSTRAINT `gateway_ins_response_ibfk_1` FOREIGN KEY (`gateway_ins_id`) REFERENCES `gateway_ins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gmeet`
--
ALTER TABLE `gmeet`
  ADD CONSTRAINT `gmeet_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gmeet_ibfk_2` FOREIGN KEY (`created_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gmeet_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gmeet_history`
--
ALTER TABLE `gmeet_history`
  ADD CONSTRAINT `gmeet_history_ibfk_1` FOREIGN KEY (`gmeet_id`) REFERENCES `gmeet` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gmeet_history_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gmeet_history_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gmeet_sections`
--
ALTER TABLE `gmeet_sections`
  ADD CONSTRAINT `gmeet_sections_ibfk_1` FOREIGN KEY (`cls_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gmeet_sections_ibfk_2` FOREIGN KEY (`gmeet_id`) REFERENCES `gmeet` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gmeet_staff`
--
ALTER TABLE `gmeet_staff`
  ADD CONSTRAINT `gmeet_staff_ibfk_1` FOREIGN KEY (`gmeet_id`) REFERENCES `gmeet` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gmeet_staff_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homework`
--
ALTER TABLE `homework`
  ADD CONSTRAINT `homework_ibfk_1` FOREIGN KEY (`subject_group_subject_id`) REFERENCES `subject_group_subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_ibfk_3` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_ibfk_4` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_ibfk_5` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_ibfk_6` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_ibfk_7` FOREIGN KEY (`evaluated_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_ibfk_8` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homework_evaluation`
--
ALTER TABLE `homework_evaluation`
  ADD CONSTRAINT `homework_evaluation_ibfk_1` FOREIGN KEY (`homework_id`) REFERENCES `homework` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_evaluation_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_evaluation_ibfk_3` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hostel_rooms`
--
ALTER TABLE `hostel_rooms`
  ADD CONSTRAINT `hostel_rooms_ibfk_1` FOREIGN KEY (`hostel_id`) REFERENCES `hostel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hostel_rooms_ibfk_2` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `income`
--
ALTER TABLE `income`
  ADD CONSTRAINT `income_ibfk_1` FOREIGN KEY (`income_head_id`) REFERENCES `income_head` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`item_store_id`) REFERENCES `item_store` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_ibfk_3` FOREIGN KEY (`item_supplier_id`) REFERENCES `item_supplier` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_issue`
--
ALTER TABLE `item_issue`
  ADD CONSTRAINT `item_issue_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_issue_ibfk_2` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_issue_ibfk_3` FOREIGN KEY (`issue_to`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_issue_ibfk_4` FOREIGN KEY (`issue_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_stock`
--
ALTER TABLE `item_stock`
  ADD CONSTRAINT `item_stock_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_stock_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `item_supplier` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_stock_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `item_store` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `lesson_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_ibfk_2` FOREIGN KEY (`subject_group_subject_id`) REFERENCES `subject_group_subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_ibfk_3` FOREIGN KEY (`subject_group_class_sections_id`) REFERENCES `subject_group_class_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lesson_plan_forum`
--
ALTER TABLE `lesson_plan_forum`
  ADD CONSTRAINT `lesson_plan_forum_ibfk_1` FOREIGN KEY (`subject_syllabus_id`) REFERENCES `subject_syllabus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_plan_forum_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_plan_forum_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notification_roles`
--
ALTER TABLE `notification_roles`
  ADD CONSTRAINT `notification_roles_ibfk_1` FOREIGN KEY (`send_notification_id`) REFERENCES `send_notification` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notification_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `offline_fees_payments`
--
ALTER TABLE `offline_fees_payments`
  ADD CONSTRAINT `offline_fees_payments_ibfk_1` FOREIGN KEY (`student_fees_master_id`) REFERENCES `student_fees_master` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `offline_fees_payments_ibfk_2` FOREIGN KEY (`fee_groups_feetype_id`) REFERENCES `fee_groups_feetype` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `offline_fees_payments_ibfk_3` FOREIGN KEY (`student_transport_fee_id`) REFERENCES `student_transport_fees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `offline_fees_payments_ibfk_4` FOREIGN KEY (`approved_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `offline_fees_payments_ibfk_5` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `onlineexam`
--
ALTER TABLE `onlineexam`
  ADD CONSTRAINT `onlineexam_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `onlineexam_attempts`
--
ALTER TABLE `onlineexam_attempts`
  ADD CONSTRAINT `onlineexam_attempts_ibfk_1` FOREIGN KEY (`onlineexam_student_id`) REFERENCES `onlineexam_students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `onlineexam_questions`
--
ALTER TABLE `onlineexam_questions`
  ADD CONSTRAINT `onlineexam_questions_ibfk_1` FOREIGN KEY (`onlineexam_id`) REFERENCES `onlineexam` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `onlineexam_questions_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `onlineexam_questions_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `onlineexam_students`
--
ALTER TABLE `onlineexam_students`
  ADD CONSTRAINT `onlineexam_students_ibfk_1` FOREIGN KEY (`onlineexam_id`) REFERENCES `onlineexam` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `onlineexam_students_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `onlineexam_student_results`
--
ALTER TABLE `onlineexam_student_results`
  ADD CONSTRAINT `onlineexam_student_results_ibfk_1` FOREIGN KEY (`onlineexam_student_id`) REFERENCES `onlineexam_students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `onlineexam_student_results_ibfk_2` FOREIGN KEY (`onlineexam_question_id`) REFERENCES `onlineexam_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_admissions`
--
ALTER TABLE `online_admissions`
  ADD CONSTRAINT `online_admissions_ibfk_1` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_admissions_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_admissions_ibfk_3` FOREIGN KEY (`hostel_room_id`) REFERENCES `hostel_rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_admissions_ibfk_4` FOREIGN KEY (`school_house_id`) REFERENCES `school_houses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_admission_custom_field_value`
--
ALTER TABLE `online_admission_custom_field_value`
  ADD CONSTRAINT `online_admission_custom_field_value_ibfk_1` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_admission_payment`
--
ALTER TABLE `online_admission_payment`
  ADD CONSTRAINT `online_admission_payment_ibfk_1` FOREIGN KEY (`online_admission_id`) REFERENCES `online_admissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_courses`
--
ALTER TABLE `online_courses`
  ADD CONSTRAINT `online_courses_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_course_class_sections`
--
ALTER TABLE `online_course_class_sections`
  ADD CONSTRAINT `online_course_class_sections_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `online_courses` (`id`),
  ADD CONSTRAINT `online_course_class_sections_ibfk_2` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`);

--
-- Constraints for table `online_course_lesson`
--
ALTER TABLE `online_course_lesson`
  ADD CONSTRAINT `online_course_lesson_ibfk_1` FOREIGN KEY (`course_section_id`) REFERENCES `online_course_section` (`id`);

--
-- Constraints for table `online_course_quiz`
--
ALTER TABLE `online_course_quiz`
  ADD CONSTRAINT `online_course_quiz_ibfk_1` FOREIGN KEY (`course_section_id`) REFERENCES `online_course_section` (`id`),
  ADD CONSTRAINT `online_course_quiz_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_course_section`
--
ALTER TABLE `online_course_section`
  ADD CONSTRAINT `online_course_section_ibfk_1` FOREIGN KEY (`online_course_id`) REFERENCES `online_courses` (`id`);

--
-- Constraints for table `payslip_allowance`
--
ALTER TABLE `payslip_allowance`
  ADD CONSTRAINT `payslip_allowance_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payslip_allowance_ibfk_2` FOREIGN KEY (`payslip_id`) REFERENCES `staff_payslip` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_category`
--
ALTER TABLE `permission_category`
  ADD CONSTRAINT `permission_category_ibfk_1` FOREIGN KEY (`perm_group_id`) REFERENCES `permission_group` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_student`
--
ALTER TABLE `permission_student`
  ADD CONSTRAINT `permission_student_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `permission_group` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_ibfk_4` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_ibfk_5` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_ibfk_6` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `read_notification`
--
ALTER TABLE `read_notification`
  ADD CONSTRAINT `read_notification_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `send_notification` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `read_notification_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `read_notification_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD CONSTRAINT `roles_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `roles_permissions_ibfk_2` FOREIGN KEY (`perm_cat_id`) REFERENCES `permission_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `route_pickup_point`
--
ALTER TABLE `route_pickup_point`
  ADD CONSTRAINT `route_pickup_point_ibfk_1` FOREIGN KEY (`transport_route_id`) REFERENCES `transport_route` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `route_pickup_point_ibfk_2` FOREIGN KEY (`pickup_point_id`) REFERENCES `pickup_point` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `send_notification`
--
ALTER TABLE `send_notification`
  ADD CONSTRAINT `send_notification_ibfk_1` FOREIGN KEY (`created_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `share_contents`
--
ALTER TABLE `share_contents`
  ADD CONSTRAINT `share_contents_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `share_content_for`
--
ALTER TABLE `share_content_for`
  ADD CONSTRAINT `share_content_for_ibfk_1` FOREIGN KEY (`share_content_id`) REFERENCES `share_contents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `share_content_for_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `share_content_for_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`),
  ADD CONSTRAINT `share_content_for_ibfk_4` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `share_content_for_ibfk_5` FOREIGN KEY (`user_parent_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `share_upload_contents`
--
ALTER TABLE `share_upload_contents`
  ADD CONSTRAINT `share_upload_contents_ibfk_1` FOREIGN KEY (`upload_content_id`) REFERENCES `upload_contents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `share_upload_contents_ibfk_2` FOREIGN KEY (`share_content_id`) REFERENCES `share_contents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sidebar_menus`
--
ALTER TABLE `sidebar_menus`
  ADD CONSTRAINT `sidebar_menus_ibfk_1` FOREIGN KEY (`permission_group_id`) REFERENCES `permission_group` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sidebar_sub_menus`
--
ALTER TABLE `sidebar_sub_menus`
  ADD CONSTRAINT `sidebar_sub_menus_ibfk_1` FOREIGN KEY (`sidebar_menu_id`) REFERENCES `sidebar_menus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sidebar_sub_menus_ibfk_2` FOREIGN KEY (`permission_group_id`) REFERENCES `permission_group` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`designation`) REFERENCES `staff_designation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`department`) REFERENCES `department` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  ADD CONSTRAINT `FK_staff_attendance_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_staff_attendance_staff_attendance_type` FOREIGN KEY (`staff_attendance_type_id`) REFERENCES `staff_attendance_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff_leave_details`
--
ALTER TABLE `staff_leave_details`
  ADD CONSTRAINT `FK_staff_leave_details_leave_types` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_staff_leave_details_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff_leave_request`
--
ALTER TABLE `staff_leave_request`
  ADD CONSTRAINT `FK_staff_leave_request_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staff_leave_request_ibfk_1` FOREIGN KEY (`applied_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staff_leave_request_ibfk_2` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff_payslip`
--
ALTER TABLE `staff_payslip`
  ADD CONSTRAINT `FK_staff_payslip_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff_rating`
--
ALTER TABLE `staff_rating`
  ADD CONSTRAINT `FK_staff_rating_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff_roles`
--
ALTER TABLE `staff_roles`
  ADD CONSTRAINT `FK_staff_roles_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_staff_roles_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff_timeline`
--
ALTER TABLE `staff_timeline`
  ADD CONSTRAINT `FK_staff_timeline_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_applyleave`
--
ALTER TABLE `student_applyleave`
  ADD CONSTRAINT `student_applyleave_ibfk_1` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_applyleave_ibfk_2` FOREIGN KEY (`approve_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_attendences`
--
ALTER TABLE `student_attendences`
  ADD CONSTRAINT `student_attendences_ibfk_1` FOREIGN KEY (`attendence_type_id`) REFERENCES `attendence_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_attendences_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_fees`
--
ALTER TABLE `student_fees`
  ADD CONSTRAINT `student_fees_ibfk_1` FOREIGN KEY (`feemaster_id`) REFERENCES `feemasters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fees_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_fees_deposite`
--
ALTER TABLE `student_fees_deposite`
  ADD CONSTRAINT `student_fees_deposite_ibfk_1` FOREIGN KEY (`student_transport_fee_id`) REFERENCES `student_transport_fees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fees_deposite_ibfk_2` FOREIGN KEY (`student_fees_master_id`) REFERENCES `student_fees_master` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fees_deposite_ibfk_3` FOREIGN KEY (`fee_groups_feetype_id`) REFERENCES `fee_groups_feetype` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_fees_discounts`
--
ALTER TABLE `student_fees_discounts`
  ADD CONSTRAINT `student_fees_discounts_ibfk_1` FOREIGN KEY (`fees_discount_id`) REFERENCES `fees_discounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fees_discounts_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_fees_master`
--
ALTER TABLE `student_fees_master`
  ADD CONSTRAINT `student_fees_master_ibfk_1` FOREIGN KEY (`fee_session_group_id`) REFERENCES `fee_session_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fees_master_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_fees_processing`
--
ALTER TABLE `student_fees_processing`
  ADD CONSTRAINT `student_fees_processing_ibfk_1` FOREIGN KEY (`student_fees_master_id`) REFERENCES `student_fees_master` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fees_processing_ibfk_2` FOREIGN KEY (`student_transport_fee_id`) REFERENCES `student_transport_fees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fees_processing_ibfk_3` FOREIGN KEY (`fee_groups_feetype_id`) REFERENCES `fee_groups_feetype` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fees_processing_ibfk_4` FOREIGN KEY (`gateway_ins_id`) REFERENCES `gateway_ins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_quiz_status`
--
ALTER TABLE `student_quiz_status`
  ADD CONSTRAINT `student_quiz_status_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_quiz_status_ibfk_2` FOREIGN KEY (`course_quiz_id`) REFERENCES `online_course_quiz` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_session`
--
ALTER TABLE `student_session`
  ADD CONSTRAINT `student_session_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_session_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_session_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_session_ibfk_4` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_session_ibfk_5` FOREIGN KEY (`vehroute_id`) REFERENCES `vehicle_routes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `student_session_ibfk_6` FOREIGN KEY (`route_pickup_point_id`) REFERENCES `route_pickup_point` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `student_session_ibfk_7` FOREIGN KEY (`hostel_room_id`) REFERENCES `hostel_rooms` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `student_subject_attendances`
--
ALTER TABLE `student_subject_attendances`
  ADD CONSTRAINT `student_subject_attendances_ibfk_1` FOREIGN KEY (`attendence_type_id`) REFERENCES `attendence_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_subject_attendances_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_subject_attendances_ibfk_3` FOREIGN KEY (`subject_timetable_id`) REFERENCES `subject_timetable` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_timeline`
--
ALTER TABLE `student_timeline`
  ADD CONSTRAINT `student_timeline_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_transport_fees`
--
ALTER TABLE `student_transport_fees`
  ADD CONSTRAINT `student_transport_fees_ibfk_1` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_transport_fees_ibfk_2` FOREIGN KEY (`route_pickup_point_id`) REFERENCES `route_pickup_point` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_transport_fees_ibfk_3` FOREIGN KEY (`transport_feemaster_id`) REFERENCES `transport_feemaster` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_groups`
--
ALTER TABLE `subject_groups`
  ADD CONSTRAINT `subject_groups_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_group_class_sections`
--
ALTER TABLE `subject_group_class_sections`
  ADD CONSTRAINT `subject_group_class_sections_ibfk_1` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_group_class_sections_ibfk_2` FOREIGN KEY (`subject_group_id`) REFERENCES `subject_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_group_class_sections_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_group_subjects`
--
ALTER TABLE `subject_group_subjects`
  ADD CONSTRAINT `subject_group_subjects_ibfk_1` FOREIGN KEY (`subject_group_id`) REFERENCES `subject_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_group_subjects_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_group_subjects_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_syllabus`
--
ALTER TABLE `subject_syllabus`
  ADD CONSTRAINT `subject_syllabus_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_syllabus_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_syllabus_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_syllabus_ibfk_4` FOREIGN KEY (`created_for`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_timetable`
--
ALTER TABLE `subject_timetable`
  ADD CONSTRAINT `subject_timetable_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_timetable_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_timetable_ibfk_3` FOREIGN KEY (`subject_group_id`) REFERENCES `subject_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_timetable_ibfk_4` FOREIGN KEY (`subject_group_subject_id`) REFERENCES `subject_group_subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_timetable_ibfk_5` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_timetable_ibfk_6` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `submit_assignment`
--
ALTER TABLE `submit_assignment`
  ADD CONSTRAINT `submit_assignment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `submit_assignment_ibfk_2` FOREIGN KEY (`homework_id`) REFERENCES `homework` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `topic`
--
ALTER TABLE `topic`
  ADD CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `topic_ibfk_2` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transport_feemaster`
--
ALTER TABLE `transport_feemaster`
  ADD CONSTRAINT `transport_feemaster_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `upload_contents`
--
ALTER TABLE `upload_contents`
  ADD CONSTRAINT `upload_contents_ibfk_1` FOREIGN KEY (`upload_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `upload_contents_ibfk_2` FOREIGN KEY (`content_type_id`) REFERENCES `content_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userlog`
--
ALTER TABLE `userlog`
  ADD CONSTRAINT `userlog_ibfk_1` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vehicle_routes`
--
ALTER TABLE `vehicle_routes`
  ADD CONSTRAINT `vehicle_routes_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `transport_route` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_routes_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `video_tutorial`
--
ALTER TABLE `video_tutorial`
  ADD CONSTRAINT `video_tutorial_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `video_tutorial_class_sections`
--
ALTER TABLE `video_tutorial_class_sections`
  ADD CONSTRAINT `video_tutorial_class_sections_ibfk_1` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `video_tutorial_class_sections_ibfk_2` FOREIGN KEY (`video_tutorial_id`) REFERENCES `video_tutorial` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `visitors_book`
--
ALTER TABLE `visitors_book`
  ADD CONSTRAINT `visitors_book_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `visitors_book_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
