-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Feb 02, 2017 at 09:49 AM
-- Server version: 5.5.54-cll
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pinertia_v2`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `controller` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `css_class` varchar(100) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=80 ;

-- --------------------------------------------------------

--
-- Table structure for table `change_orders`
--

CREATE TABLE IF NOT EXISTS `change_orders` (
  `change_order_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) unsigned NOT NULL,
  `reason_change_required` text COLLATE utf8_unicode_ci,
  `proposed_solution` text COLLATE utf8_unicode_ci,
  `type_id` int(11) NOT NULL,
  `assigned_to` int(11) unsigned NOT NULL,
  `oshpd_ref` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `oshpd_review_designation` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `wbs_id` int(11) unsigned NOT NULL,
  `sub_structure_id` int(11) unsigned NOT NULL,
  `status` enum('Open','Closed','ACD Review','Void') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Open',
  `materially_altered` enum('Y','N','N/A') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N/A',
  `materially_altered_comments` text CHARACTER SET utf8 NOT NULL,
  `co_required` enum('Y','N','N/A') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N/A',
  `co_required_comments` text CHARACTER SET utf8 NOT NULL,
  `approved_type` int(11) unsigned NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `created_date` datetime NOT NULL,
  `oshpd_staus` enum('No Review required','Under review','Approved') COLLATE utf8_unicode_ci DEFAULT NULL,
  `drawings_updated` enum('No drawings to update','No','Updated') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`change_order_id`),
  KEY `project_id` (`project_id`,`type_id`,`assigned_to`,`wbs_id`,`sub_structure_id`,`approved_type`,`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=423 ;

-- --------------------------------------------------------

--
-- Table structure for table `change_orders_status_color`
--

CREATE TABLE IF NOT EXISTS `change_orders_status_color` (
  `status_color_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `color_id` int(11) NOT NULL,
  PRIMARY KEY (`status_color_id`),
  KEY `color_id` (`color_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `change_order_irs`
--

CREATE TABLE IF NOT EXISTS `change_order_irs` (
  `change_order_ir_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `change_order_id` int(11) unsigned NOT NULL,
  `ir_item_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`change_order_ir_id`),
  KEY `change_order_id` (`change_order_id`,`ir_item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=289 ;

-- --------------------------------------------------------

--
-- Table structure for table `change_order_rfis`
--

CREATE TABLE IF NOT EXISTS `change_order_rfis` (
  `change_order_rfi_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `change_order_id` int(11) unsigned NOT NULL,
  `rfi_item_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`change_order_rfi_id`),
  KEY `change_order_id` (`change_order_id`,`rfi_item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2243 ;

-- --------------------------------------------------------

--
-- Table structure for table `change_order_types`
--

CREATE TABLE IF NOT EXISTS `change_order_types` (
  `change_order_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`change_order_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- Table structure for table `change_order_uploads`
--

CREATE TABLE IF NOT EXISTS `change_order_uploads` (
  `change_order_upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `change_order_id` int(11) NOT NULL,
  `upload_title` varchar(255) NOT NULL,
  `upload_path` varchar(255) NOT NULL,
  `upload_file_type` varchar(255) NOT NULL,
  `filesize` bigint(20) unsigned NOT NULL,
  `uploaded_by` varchar(255) NOT NULL,
  `uploaded_date` datetime NOT NULL,
  PRIMARY KEY (`change_order_upload_id`),
  KEY `change_order_id` (`change_order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=162 ;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `county_id` int(11) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- Table structure for table `client_support_classifications`
--

CREATE TABLE IF NOT EXISTS `client_support_classifications` (
  `client_support_classification_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`client_support_classification_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `client_support_files`
--

CREATE TABLE IF NOT EXISTS `client_support_files` (
  `client_support_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_support_ticket_id` int(11) NOT NULL DEFAULT '0',
  `file_name` varchar(255) NOT NULL DEFAULT '0',
  `file_type` enum('image','pdf') NOT NULL DEFAULT 'image',
  `client_support_thread_id` int(11) NOT NULL DEFAULT '0',
  `file_url` varchar(255) DEFAULT NULL,
  `file_thumb_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_support_file_id`),
  KEY `client_support_ticket_id` (`client_support_ticket_id`,`client_support_thread_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=747 ;

-- --------------------------------------------------------

--
-- Table structure for table `client_support_status`
--

CREATE TABLE IF NOT EXISTS `client_support_status` (
  `client_support_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`client_support_status_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `client_support_threads`
--

CREATE TABLE IF NOT EXISTS `client_support_threads` (
  `client_support_thread_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_support_ticket_id` int(11) NOT NULL,
  `thread` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `thread_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`client_support_thread_id`),
  KEY `client_support_ticket_id` (`client_support_ticket_id`,`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3208 ;

-- --------------------------------------------------------

--
-- Table structure for table `client_support_tickets`
--

CREATE TABLE IF NOT EXISTS `client_support_tickets` (
  `client_support_ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `ticket_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_support_status_id` int(11) NOT NULL DEFAULT '1',
  `client_support_classification_id` int(11) DEFAULT NULL,
  `mantis_ticket_id` varchar(30) DEFAULT NULL,
  `released_date` date DEFAULT NULL,
  `response_due` date DEFAULT NULL,
  `category` enum('Bug','Question','Feature','Access Required') DEFAULT NULL,
  PRIMARY KEY (`client_support_ticket_id`),
  KEY `user_id` (`user_id`,`project_id`,`client_support_status_id`,`client_support_classification_id`,`mantis_ticket_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1799 ;

-- --------------------------------------------------------

--
-- Table structure for table `cl_checklist_program`
--

CREATE TABLE IF NOT EXISTS `cl_checklist_program` (
  `checklist_program_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `checklist_id` int(11) NOT NULL,
  PRIMARY KEY (`checklist_program_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=439 ;

-- --------------------------------------------------------

--
-- Table structure for table `cl_programs`
--

CREATE TABLE IF NOT EXISTS `cl_programs` (
  `program_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`program_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=253 ;

-- --------------------------------------------------------

--
-- Table structure for table `cl_program_checklists`
--

CREATE TABLE IF NOT EXISTS `cl_program_checklists` (
  `checklist_id` int(11) NOT NULL AUTO_INCREMENT,
  `checklist_type` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `program_id` int(11) NOT NULL,
  `sort_order` int(5) NOT NULL,
  PRIMARY KEY (`checklist_id`),
  KEY `program_id` (`program_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=380 ;

-- --------------------------------------------------------

--
-- Table structure for table `cl_program_checklist_items`
--

CREATE TABLE IF NOT EXISTS `cl_program_checklist_items` (
  `checklist_itemid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1020) COLLATE utf8_unicode_ci NOT NULL,
  `program_id` int(11) NOT NULL,
  `checklist_id` int(11) NOT NULL,
  `target_results` text COLLATE utf8_unicode_ci,
  `sort_order` int(11) NOT NULL,
  `attach_file` enum('Yes','No','Hide') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `result_required` enum('No','Yes','Hide') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `checklist_item_question_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`checklist_itemid`),
  KEY `program_id` (`program_id`,`checklist_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3509 ;

-- --------------------------------------------------------

--
-- Table structure for table `cl_program_checklist_reports`
--

CREATE TABLE IF NOT EXISTS `cl_program_checklist_reports` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `ld_dynamic_building_id` int(11) NOT NULL,
  `ld_dynamic_level_id` int(11) NOT NULL,
  `ld_dynamic_location_id` int(11) NOT NULL,
  `location_type` enum('Room','Corridor') COLLATE utf8_unicode_ci NOT NULL,
  `ceiling` enum('General','In-Wall','Overhead') COLLATE utf8_unicode_ci NOT NULL,
  `equipment_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `checked_items_desc` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `program_id` (`program_id`,`created_by`,`company_id`,`ld_dynamic_building_id`,`ld_dynamic_level_id`,`ld_dynamic_location_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=443 ;

-- --------------------------------------------------------

--
-- Table structure for table `cl_program_checklist_reportsdata`
--

CREATE TABLE IF NOT EXISTS `cl_program_checklist_reportsdata` (
  `reportdata_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `checklist_itemid` int(11) NOT NULL,
  `safeqty` int(4) NOT NULL,
  `unsafeqty` int(4) NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `include_in_search` enum('No','Yes') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `stored_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remote_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_type` enum('image','pdf') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`reportdata_id`),
  KEY `report_id` (`report_id`),
  KEY `checklist_itemid` (`checklist_itemid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12222 ;

-- --------------------------------------------------------

--
-- Table structure for table `cl_program_checklist_types`
--

CREATE TABLE IF NOT EXISTS `cl_program_checklist_types` (
  `cl_program_checklist_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cl_program_checklist_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `cl_project_checklist_item`
--

CREATE TABLE IF NOT EXISTS `cl_project_checklist_item` (
  `cl_project_checklist_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `checklist_item_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `target_date` datetime DEFAULT NULL,
  PRIMARY KEY (`cl_project_checklist_item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2404 ;

-- --------------------------------------------------------

--
-- Table structure for table `cl_project_programs`
--

CREATE TABLE IF NOT EXISTS `cl_project_programs` (
  `project_program_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`project_program_id`),
  KEY `project_id` (`project_id`,`program_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=259 ;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE IF NOT EXISTS `companies` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `code` varchar(100) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `postcode` varchar(100) NOT NULL,
  `phone1` varchar(100) NOT NULL,
  `phone2` varchar(100) NOT NULL,
  `fax` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `website` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `speciality` text NOT NULL,
  `tags` varchar(100) NOT NULL,
  `color` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=892 ;

-- --------------------------------------------------------

--
-- Table structure for table `company_check_list_items`
--

CREATE TABLE IF NOT EXISTS `company_check_list_items` (
  `company_check_list_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `check_list_item_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`company_check_list_item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

-- --------------------------------------------------------

--
-- Table structure for table `company_custom_form`
--

CREATE TABLE IF NOT EXISTS `company_custom_form` (
  `company_id` int(11) NOT NULL,
  `custom_form_id` int(11) NOT NULL,
  PRIMARY KEY (`company_id`,`custom_form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company_groups`
--

CREATE TABLE IF NOT EXISTS `company_groups` (
  `project_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `contractor_user_id` int(11) NOT NULL,
  `sub_contractor_level` enum('Level 1','Level 2') DEFAULT NULL,
  `level_one_company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`project_id`,`company_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company_images`
--

CREATE TABLE IF NOT EXISTS `company_images` (
  `company_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_image_setting_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `image_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`company_image_id`),
  KEY `company_image_setting_id` (`company_image_setting_id`,`company_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `company_image_settings`
--

CREATE TABLE IF NOT EXISTS `company_image_settings` (
  `company_image_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `width` varchar(50) NOT NULL,
  `height` varchar(50) NOT NULL,
  PRIMARY KEY (`company_image_setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `company_roles`
--

CREATE TABLE IF NOT EXISTS `company_roles` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `counties`
--

CREATE TABLE IF NOT EXISTS `counties` (
  `county_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`county_id`),
  KEY `state_id` (`state_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- Table structure for table `cropped_svgs`
--

CREATE TABLE IF NOT EXISTS `cropped_svgs` (
  `cropped_svg_id` int(11) NOT NULL AUTO_INCREMENT,
  `svg` varbinary(255) NOT NULL,
  `inspection_request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`cropped_svg_id`),
  KEY `inspection_request_id` (`inspection_request_id`,`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3021 ;

-- --------------------------------------------------------

--
-- Table structure for table `custom_forms`
--

CREATE TABLE IF NOT EXISTS `custom_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formtemplate_id` int(11) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(50) NOT NULL,
  `enable_ir` enum('0','1') NOT NULL,
  `enable_issue` enum('1','0') NOT NULL DEFAULT '0',
  `enable_userofrecord` enum('0','1') NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enable_cxa_issue_records` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `formtemplate_id` (`formtemplate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=74 ;

-- --------------------------------------------------------

--
-- Table structure for table `custom_form_constants`
--

CREATE TABLE IF NOT EXISTS `custom_form_constants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `empty_text` varchar(100) NOT NULL,
  `required` enum('1','0') NOT NULL,
  `options` text NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `custom_form_fields`
--

CREATE TABLE IF NOT EXISTS `custom_form_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_form_id` int(11) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `empty_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `required` enum('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `repeatable` enum('1','0') NOT NULL DEFAULT '0',
  `options` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `constant_id` int(11) NOT NULL,
  `cxa_issue` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_form_id` (`custom_form_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1328 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_checklist`
--

CREATE TABLE IF NOT EXISTS `cxm_checklist` (
  `checklist_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('start-up','pre-functional','functional') NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `expected_results` text NOT NULL,
  `system_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `target_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'scheduled',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `installing_company` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '50',
  PRIMARY KEY (`checklist_id`),
  KEY `system_id` (`system_id`,`project_id`,`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5703 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_checklist_files`
--

CREATE TABLE IF NOT EXISTS `cxm_checklist_files` (
  `cxm_checklist_files_id` int(11) NOT NULL AUTO_INCREMENT,
  `cl_program_item_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(100) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `cloud_url` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`cxm_checklist_files_id`),
  KEY `checklist_id` (`cl_program_item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_equipments_predecessor`
--

CREATE TABLE IF NOT EXISTS `cxm_equipments_predecessor` (
  `equipments_predecessor_id` int(11) NOT NULL AUTO_INCREMENT,
  `equipment_code` varchar(255) NOT NULL,
  `equipments_predecessor_code` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL,
  `cxm_system_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`equipments_predecessor_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2860 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_exception_log`
--

CREATE TABLE IF NOT EXISTS `cxm_exception_log` (
  `cxm_exception_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `cxm_exception_type_id` int(11) DEFAULT NULL,
  `cxm_exception_reason_id` int(11) NOT NULL,
  `cxm_exception_level_id` int(11) DEFAULT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inspector_status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contractor_status` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `qc_status` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `closing_comments` text COLLATE utf8_unicode_ci NOT NULL,
  `closed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `company_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `closed_by` int(11) NOT NULL,
  `project_authority_substructure_id` int(11) NOT NULL,
  `record_type` enum('Issue','Exception','EM') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Exception',
  `system_list_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `system` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_system` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `equipment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `equipment_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issue_status` enum('Open','Closed','Ready for Review') COLLATE utf8_unicode_ci DEFAULT NULL,
  `assign_to_company` int(11) DEFAULT NULL,
  `assign_to_user` int(11) DEFAULT NULL,
  `checklist_item_id` int(11) DEFAULT NULL,
  `retest_by` int(11) DEFAULT NULL,
  `checklist_type` int(11) DEFAULT NULL,
  `issue_comment_id` int(11) DEFAULT NULL,
  `author_project_counter` int(11) DEFAULT NULL,
  `forecast_complete_date` date DEFAULT NULL,
  `contractor_complete_date` date DEFAULT NULL,
  `retest_required` enum('Yes','No') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cxm_exception_log_id`),
  KEY `cxm_exception_type_id` (`cxm_exception_type_id`,`cxm_exception_reason_id`,`cxm_exception_level_id`,`company_id`,`type_id`,`project_id`,`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC AUTO_INCREMENT=179 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_exception_log_comments`
--

CREATE TABLE IF NOT EXISTS `cxm_exception_log_comments` (
  `cxm_exception_log_comments_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  `cxm_exception_log_id` int(11) NOT NULL,
  PRIMARY KEY (`cxm_exception_log_comments_id`),
  KEY `user_id` (`user_id`,`cxm_exception_log_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC AUTO_INCREMENT=114 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_exception_log_comment_files`
--

CREATE TABLE IF NOT EXISTS `cxm_exception_log_comment_files` (
  `cxm_exception_log_comment_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `file_type` enum('image','pdf','dwg','rvt','dwfx','ifc') CHARACTER SET latin1 NOT NULL DEFAULT 'image',
  `cxm_exception_log_comment_id` int(11) NOT NULL,
  `file_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_thumb_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cxm_exception_log_comment_file_id`),
  KEY `cxm_exception_log_comment_id` (`cxm_exception_log_comment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC AUTO_INCREMENT=33 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_exception_log_files`
--

CREATE TABLE IF NOT EXISTS `cxm_exception_log_files` (
  `cxm_exception_log_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_type` enum('image','pdf','dwg','rvt','dwfx','ifc','doc') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'image',
  `cxm_exception_log_id` int(11) DEFAULT NULL,
  `file_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_thumb_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`cxm_exception_log_file_id`),
  KEY `cxm_exception_log_id` (`cxm_exception_log_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC AUTO_INCREMENT=96 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_exception_log_history`
--

CREATE TABLE IF NOT EXISTS `cxm_exception_log_history` (
  `cxm_exception_log_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `cxm_exception_log_id` int(11) NOT NULL,
  `action_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action_by` int(11) NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action_comments` text COLLATE utf8_unicode_ci,
  `attach_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fil_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` decimal(20,0) DEFAULT NULL,
  `assign_company_id` int(11) DEFAULT NULL,
  `assign_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cxm_exception_log_history_id`),
  KEY `cxm_exception_log_id` (`cxm_exception_log_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC AUTO_INCREMENT=431 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_exception_log_inspection`
--

CREATE TABLE IF NOT EXISTS `cxm_exception_log_inspection` (
  `inspection_request_id` int(11) NOT NULL,
  `cxm_exception_log_id` int(11) NOT NULL,
  PRIMARY KEY (`inspection_request_id`,`cxm_exception_log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_exception_log_levels`
--

CREATE TABLE IF NOT EXISTS `cxm_exception_log_levels` (
  `cxm_exception_log_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`cxm_exception_log_level_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_exception_log_reasons`
--

CREATE TABLE IF NOT EXISTS `cxm_exception_log_reasons` (
  `cxm_exception_log_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`cxm_exception_log_reason_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_exception_log_types`
--

CREATE TABLE IF NOT EXISTS `cxm_exception_log_types` (
  `cxm_exception_log_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`cxm_exception_log_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_report`
--

CREATE TABLE IF NOT EXISTS `cxm_report` (
  `cxm_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `cxm_report_type_id` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `issue_identified` enum('Yes','No') NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `project_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `cxm_report_code` varchar(255) NOT NULL,
  PRIMARY KEY (`cxm_report_id`),
  KEY `cxm_report_type_id` (`cxm_report_type_id`,`project_id`,`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_report_files`
--

CREATE TABLE IF NOT EXISTS `cxm_report_files` (
  `cxm_exception_log_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_type` enum('image','pdf','dwg','rvt','dwfx','ifc') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'image',
  `cxm_report_id` int(11) DEFAULT NULL,
  `file_thumb_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cxm_exception_log_file_id`),
  KEY `cxm_report_id` (`cxm_report_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_report_types`
--

CREATE TABLE IF NOT EXISTS `cxm_report_types` (
  `cxm_report_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cxm_report_type_title` varchar(255) NOT NULL,
  `cxm_report_type_description` text,
  PRIMARY KEY (`cxm_report_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_results`
--

CREATE TABLE IF NOT EXISTS `cxm_results` (
  `cxm_result_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cl_program_item_id` int(11) unsigned NOT NULL,
  `cxm_system_id` int(11) unsigned NOT NULL,
  `result` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `comments` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `is_complete` int(1) NOT NULL DEFAULT '0',
  `status` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) unsigned NOT NULL,
  `cl_program_item_type` int(11) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `cloud_url` varchar(255) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`cxm_result_id`),
  KEY `checklist_id` (`cl_program_item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8940 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_results_files`
--

CREATE TABLE IF NOT EXISTS `cxm_results_files` (
  `cxm_result_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `cxm_result_id` int(11) NOT NULL,
  `cxm_detail_history_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `cloud_url` varchar(255) NOT NULL,
  `file_status` enum('Active','InActive') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`cxm_result_file_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1000446 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_results_history`
--

CREATE TABLE IF NOT EXISTS `cxm_results_history` (
  `cxm_results_history_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cxm_result_id` int(11) DEFAULT NULL,
  `cl_program_item_id` int(11) unsigned NOT NULL,
  `cxm_system_id` int(11) unsigned NOT NULL,
  `result_old` text COLLATE utf8_unicode_ci,
  `result_new` text COLLATE utf8_unicode_ci,
  `comments_old` text COLLATE utf8_unicode_ci,
  `comments_new` text COLLATE utf8_unicode_ci,
  `is_complete_old` int(11) unsigned DEFAULT NULL,
  `is_complete_new` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) unsigned NOT NULL,
  `in_active_file_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cxm_results_history_id`),
  KEY `checklist_id` (`cl_program_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1981 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_results_issue_comments`
--

CREATE TABLE IF NOT EXISTS `cxm_results_issue_comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` text,
  `cxm_result_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_settings`
--

CREATE TABLE IF NOT EXISTS `cxm_settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `show_src_report` enum('Yes','No') NOT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_submittal`
--

CREATE TABLE IF NOT EXISTS `cxm_submittal` (
  `cxm_submittal_id` int(11) NOT NULL AUTO_INCREMENT,
  `cxm_system_id` int(11) NOT NULL,
  `submittal_id` int(11) NOT NULL,
  PRIMARY KEY (`cxm_submittal_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=477 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_systems`
--

CREATE TABLE IF NOT EXISTS `cxm_systems` (
  `cxm_systems_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `project_id` int(11) NOT NULL,
  `program_id` int(11) unsigned NOT NULL,
  `system` varchar(255) NOT NULL,
  `sub_system` varchar(255) NOT NULL,
  `equipment` varchar(255) NOT NULL,
  `equipment_project_code` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `location` text NOT NULL,
  `start_up` varchar(255) NOT NULL,
  `pre_functional` varchar(255) NOT NULL,
  `functional` varchar(255) NOT NULL,
  `est_start` date NOT NULL,
  `est_finish` date NOT NULL,
  `priority` enum('High','Medium','Low') NOT NULL,
  `installing_company` int(11) NOT NULL,
  `startup_status` int(11) NOT NULL DEFAULT '0',
  `pft_status` int(11) NOT NULL,
  `fpt_status` int(11) NOT NULL,
  `warranty` int(11) NOT NULL,
  `om` int(11) NOT NULL,
  `training` int(11) NOT NULL,
  `predecessor_equipment_id` varchar(225) DEFAULT NULL,
  `successor_equipment_id` varchar(255) DEFAULT NULL,
  `room_no` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `event_type` enum('Startup','Notification') DEFAULT NULL,
  `distlist_id` int(11) DEFAULT NULL,
  `startup_status_date` datetime DEFAULT NULL,
  `startup_status_end_time` datetime DEFAULT NULL,
  `startup_status_comments` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `responsible_gc_user` varchar(255) DEFAULT NULL,
  `cc_list` text,
  `total_start_up` int(11) NOT NULL DEFAULT '0',
  `total_pre_functional` int(11) NOT NULL DEFAULT '0',
  `total_functional` int(11) NOT NULL DEFAULT '0',
  `complete_start_up` int(11) NOT NULL DEFAULT '0',
  `complete_pre_functional` int(11) NOT NULL DEFAULT '0',
  `complete_functional` int(11) NOT NULL DEFAULT '0',
  `way_finding` varchar(255) DEFAULT NULL,
  `plan_reference` varchar(255) DEFAULT NULL,
  `e_service_one` varchar(255) DEFAULT NULL,
  `e_service_two` varchar(255) DEFAULT NULL,
  `e_service_three` varchar(255) DEFAULT NULL,
  `e_service_four` varchar(255) DEFAULT NULL,
  `equipment_manufacturer` varchar(255) DEFAULT NULL,
  `model_no` varchar(255) DEFAULT NULL,
  `ball_in_court_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`cxm_systems_id`),
  KEY `project_id` (`project_id`,`installing_company`,`startup_status`,`pft_status`,`fpt_status`,`warranty`,`om`,`training`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6535 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_systems_filters`
--

CREATE TABLE IF NOT EXISTS `cxm_systems_filters` (
  `cxm_systems_filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `default` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `type` enum('System','CxAIssue','CxMIssue','EMIssue') NOT NULL DEFAULT 'System',
  PRIMARY KEY (`cxm_systems_filter_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_systems_status_history`
--

CREATE TABLE IF NOT EXISTS `cxm_systems_status_history` (
  `cxm_systems_status_history_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cxm_system_id` int(11) unsigned NOT NULL,
  `asssigned_company_id` int(11) unsigned NOT NULL,
  `action_old` text COLLATE utf8_unicode_ci,
  `action_new` text COLLATE utf8_unicode_ci,
  `comments_old` text COLLATE utf8_unicode_ci,
  `comments_new` text COLLATE utf8_unicode_ci,
  `action_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_by` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cxm_systems_status_history_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1404 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_system_change_group`
--

CREATE TABLE IF NOT EXISTS `cxm_system_change_group` (
  `cxm_system_change_group_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `system_id` int(11) NOT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `action_date` datetime NOT NULL,
  PRIMARY KEY (`cxm_system_change_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_system_change_item`
--

CREATE TABLE IF NOT EXISTS `cxm_system_change_item` (
  `cxm_system_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cxm_system_change_group_id` int(11) NOT NULL,
  `field` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `oldstring` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `newstring` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`cxm_system_item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_system_files`
--

CREATE TABLE IF NOT EXISTS `cxm_system_files` (
  `cxm_system_files_id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` int(11) NOT NULL,
  `file_label` varchar(255) NOT NULL,
  `file_type` varchar(100) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `cloud_url` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `file_size` bigint(20) DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`cxm_system_files_id`),
  KEY `system_id` (`system_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

-- --------------------------------------------------------

--
-- Table structure for table `cxm_system_status_types`
--

CREATE TABLE IF NOT EXISTS `cxm_system_status_types` (
  `cxm_system_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `cxm_status_type` varchar(255) NOT NULL,
  `cxm_status_value` varchar(255) NOT NULL,
  `cxm_status_color` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cxm_system_status_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

-- --------------------------------------------------------

--
-- Table structure for table `dailyreports`
--

CREATE TABLE IF NOT EXISTS `dailyreports` (
  `dailyreport_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dailyreport_num` int(11) NOT NULL DEFAULT '1',
  `report_date` date NOT NULL,
  `report_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `report_updated` datetime NOT NULL,
  `pdf_file` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `custom_form_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `flag` tinyint(1) NOT NULL,
  PRIMARY KEY (`dailyreport_id`),
  KEY `report_date` (`report_date`,`report_created`,`user_id`,`role_id`,`company_id`,`project_id`,`custom_form_id`,`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40473 ;

-- --------------------------------------------------------

--
-- Table structure for table `dailyreport_cxa_issue`
--

CREATE TABLE IF NOT EXISTS `dailyreport_cxa_issue` (
  `dailyreport_cxa_issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `cxm_exception_log_id` int(11) NOT NULL,
  `dailyreport_id` int(11) NOT NULL,
  PRIMARY KEY (`dailyreport_cxa_issue_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Table structure for table `dailyreport_data`
--

CREATE TABLE IF NOT EXISTS `dailyreport_data` (
  `dailyreport_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dailyreport_id` int(11) NOT NULL,
  `custom_form_field_id` int(11) NOT NULL,
  `custom_form_constant_id` int(11) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`dailyreport_data_id`),
  KEY `custom_form_constant_id` (`custom_form_constant_id`),
  KEY `dailyreport_id` (`dailyreport_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1359784 ;

-- --------------------------------------------------------

--
-- Table structure for table `dailyreport_settings`
--

CREATE TABLE IF NOT EXISTS `dailyreport_settings` (
  `dailyreport_settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `time_period` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`dailyreport_settings_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `daily_report_distribution_list`
--

CREATE TABLE IF NOT EXISTS `daily_report_distribution_list` (
  `dist_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `custom_user_email` varchar(255) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `distlist_title` varchar(255) NOT NULL,
  `distlist_users` varchar(255) NOT NULL,
  `distributed_list` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dist_list_id`),
  KEY `report_id` (`report_id`,`user_id`,`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=463 ;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widgets`
--

CREATE TABLE IF NOT EXISTS `dashboard_widgets` (
  `dashboard_widget_id` int(11) NOT NULL AUTO_INCREMENT,
  `widget` varchar(255) NOT NULL,
  PRIMARY KEY (`dashboard_widget_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_annotation`
--

CREATE TABLE IF NOT EXISTS `dfm_annotation` (
  `annotation_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `file_page` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `page` int(11) NOT NULL,
  PRIMARY KEY (`annotation_id`),
  KEY `file_id` (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_documents_cxm_systems`
--

CREATE TABLE IF NOT EXISTS `dfm_documents_cxm_systems` (
  `dfm_documents_cxm_system_id` int(11) NOT NULL AUTO_INCREMENT,
  `dfm_documents_inspection_id` int(11) NOT NULL,
  `cxm_system_id` varchar(255) NOT NULL,
  PRIMARY KEY (`dfm_documents_cxm_system_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_documents_inspection`
--

CREATE TABLE IF NOT EXISTS `dfm_documents_inspection` (
  `dfm_documents_inspection_id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `doc_date` timestamp NULL DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `summary` text,
  `tags` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `company_defined` int(11) DEFAULT NULL,
  `company_user_defined` int(11) DEFAULT NULL,
  `sub_structure_id` int(11) DEFAULT NULL,
  `oshpd_tio_id` varchar(255) DEFAULT NULL,
  `doc_type_id` int(11) DEFAULT '0',
  `doc_result_id` int(11) DEFAULT NULL,
  `inspection_issue` enum('all','open') NOT NULL,
  `issue_id` varchar(255) DEFAULT '0',
  `inspection_request` enum('all','open') NOT NULL,
  `inspection_request_id` varchar(255) NOT NULL DEFAULT '0',
  `doc_num` int(11) NOT NULL,
  `doc_type_custom` varchar(255) DEFAULT NULL,
  `dfm_document_id` varchar(255) NOT NULL,
  `vcr_item` varchar(255) NOT NULL,
  `dfm_status` int(11) NOT NULL,
  `switch_oshpd` enum('All','Company','INC') NOT NULL DEFAULT 'All',
  `oshpd` text NOT NULL,
  `ir` text NOT NULL,
  `issue` text NOT NULL,
  `dfm` text NOT NULL,
  `files` int(11) NOT NULL,
  `import_data_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) DEFAULT NULL,
  `comments_exceptionlist` text,
  PRIMARY KEY (`dfm_documents_inspection_id`),
  KEY `author_id` (`author_id`,`project_id`,`date_created`,`doc_date`,`company`,`sub_structure_id`,`doc_type_id`,`doc_result_id`,`dfm_status`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54971 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_documents_inspection_ddi`
--

CREATE TABLE IF NOT EXISTS `dfm_documents_inspection_ddi` (
  `dfm_documents_inspection_ddi_id` int(11) NOT NULL AUTO_INCREMENT,
  `dfm_documents_inspection_id` int(11) NOT NULL,
  `dfm_document_id` varchar(255) NOT NULL,
  PRIMARY KEY (`dfm_documents_inspection_ddi_id`),
  KEY `dfm_documents_inspection_id` (`dfm_documents_inspection_id`,`dfm_document_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_documents_inspection_ir`
--

CREATE TABLE IF NOT EXISTS `dfm_documents_inspection_ir` (
  `dfm_documents_inspection_ir_id` int(11) NOT NULL AUTO_INCREMENT,
  `dfm_documents_inspection_id` int(11) NOT NULL,
  `inspection_request_id` varchar(255) NOT NULL,
  PRIMARY KEY (`dfm_documents_inspection_ir_id`),
  KEY `dfm_documents_inspection_id` (`dfm_documents_inspection_id`,`inspection_request_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=590795 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_documents_inspection_issue`
--

CREATE TABLE IF NOT EXISTS `dfm_documents_inspection_issue` (
  `dfm_documents_inspection_issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `dfm_documents_inspection_id` int(11) NOT NULL,
  `issue_id` varchar(255) NOT NULL,
  PRIMARY KEY (`dfm_documents_inspection_issue_id`),
  KEY `dfm_documents_inspection_id` (`dfm_documents_inspection_id`,`issue_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=141 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_documents_inspection_oshpd`
--

CREATE TABLE IF NOT EXISTS `dfm_documents_inspection_oshpd` (
  `dfm_documents_inspection_oshpd_id` int(11) NOT NULL AUTO_INCREMENT,
  `dfm_documents_inspection_id` int(11) NOT NULL,
  `oshpd_tio_id` varchar(255) NOT NULL,
  PRIMARY KEY (`dfm_documents_inspection_oshpd_id`),
  KEY `dfm_documents_inspection_id` (`dfm_documents_inspection_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=75768 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_document_location`
--

CREATE TABLE IF NOT EXISTS `dfm_document_location` (
  `dfm_document_location_id` int(11) NOT NULL AUTO_INCREMENT,
  `annotation_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  PRIMARY KEY (`dfm_document_location_id`),
  KEY `annotation_id` (`annotation_id`,`document_id`,`user_id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_files`
--

CREATE TABLE IF NOT EXISTS `dfm_files` (
  `dfm_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `dfm_documents_inspection_id` int(11) NOT NULL,
  `doc_path` varchar(255) NOT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `file_num` int(11) NOT NULL,
  `file_size` double NOT NULL,
  `file_url` varchar(255) NOT NULL,
  PRIMARY KEY (`dfm_file_id`),
  KEY `dfm_documents_inspection_id` (`dfm_documents_inspection_id`,`project_id`,`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=74107 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_files_2013-09-09`
--

CREATE TABLE IF NOT EXISTS `dfm_files_2013-09-09` (
  `dfm_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `dfm_documents_inspection_id` int(11) NOT NULL,
  `doc_path` varchar(100) NOT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `file_num` int(11) NOT NULL,
  PRIMARY KEY (`dfm_file_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3831 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_file_activity_log`
--

CREATE TABLE IF NOT EXISTS `dfm_file_activity_log` (
  `file_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_file_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `activity` text,
  PRIMARY KEY (`file_activity_id`),
  KEY `fk_dfm_file_activity_log_dfm_project_company_files1` (`company_file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_file_comments`
--

CREATE TABLE IF NOT EXISTS `dfm_file_comments` (
  `file_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_company_file_id` int(11) DEFAULT NULL,
  `file_comment` text,
  `comment_parent` int(11) DEFAULT NULL,
  `comment_date_posted` int(11) DEFAULT NULL,
  `project_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`file_comment_id`),
  KEY `fk_file_comments_project_company_files1` (`project_company_file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_file_share`
--

CREATE TABLE IF NOT EXISTS `dfm_file_share` (
  `file_share_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_file_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  PRIMARY KEY (`file_share_id`),
  UNIQUE KEY `file_share_id` (`file_share_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_file_wiki`
--

CREATE TABLE IF NOT EXISTS `dfm_file_wiki` (
  `file_wiki_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_compnay_file_id` int(11) DEFAULT NULL,
  `file_wiki_detail` text,
  `date_created` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`file_wiki_id`),
  KEY `fk_file_wiki_project_company_files1` (`project_compnay_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_file_wiki_log`
--

CREATE TABLE IF NOT EXISTS `dfm_file_wiki_log` (
  `file_wiki_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_wiki_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` int(11) DEFAULT NULL,
  `updated_section` text,
  PRIMARY KEY (`file_wiki_log_id`),
  KEY `fk_file_wiki_log_file_wiki1` (`file_wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_merged_files`
--

CREATE TABLE IF NOT EXISTS `dfm_merged_files` (
  `cloud_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `cloud_url` varchar(1000) DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dfm_documents_inspection_id` int(11) NOT NULL,
  `status` enum('PROCESSING','MERGED') NOT NULL,
  `is_ir_linked` enum('Yes','No') DEFAULT NULL,
  PRIMARY KEY (`cloud_file_id`),
  KEY `dfm_documents_inspection_id` (`dfm_documents_inspection_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42353 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_project_company_files`
--

CREATE TABLE IF NOT EXISTS `dfm_project_company_files` (
  `project_company_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_phase_id` varchar(45) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` enum('Folder','File') DEFAULT NULL,
  `file_extension` varchar(10) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `file_phase` enum('Planning','Approval','Execution') DEFAULT NULL,
  `file_creation_date` int(11) DEFAULT NULL,
  `file_share_status` enum('Share','Private') DEFAULT NULL,
  `file_status` enum('Pass','Fail','FailWithReason','New') DEFAULT NULL,
  `file_ui_directory` enum('Deliverable','CompanyCoordination','ProjectCoordination','ApprovalCoordination') DEFAULT NULL,
  `file_version_count` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `approval_date` int(11) DEFAULT NULL,
  `exec_date` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`project_company_file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=113 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_project_company_file_co`
--

CREATE TABLE IF NOT EXISTS `dfm_project_company_file_co` (
  `project_company_file_co_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_company_file_id` int(11) DEFAULT NULL,
  `co_detail` text,
  `co_status` enum('Open','Closed','Assign') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `co_date_added` int(11) DEFAULT NULL,
  `co_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`project_company_file_co_id`),
  KEY `fk_project_company_file_co_notes_project_company_files1` (`project_company_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_project_company_file_co_notes`
--

CREATE TABLE IF NOT EXISTS `dfm_project_company_file_co_notes` (
  `project_company_file_co_note_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_company_file_co_id` int(11) DEFAULT NULL,
  `co_notes` text,
  `co_note_added_date` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`project_company_file_co_note_id`),
  KEY `fk_dfm_project_company_file_co_notes_dfm_project_company_1` (`project_company_file_co_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_project_company_file_dwg`
--

CREATE TABLE IF NOT EXISTS `dfm_project_company_file_dwg` (
  `file_dwg_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_company_file_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `file_dwg_added_date` int(11) DEFAULT NULL,
  `file_dwg_size` double DEFAULT NULL,
  `file_dwg_checksum` varchar(100) DEFAULT NULL,
  `file_dwg_location` varchar(255) DEFAULT NULL,
  `project_phase` int(11) DEFAULT NULL,
  PRIMARY KEY (`file_dwg_id`),
  KEY `fk_project_company_file_version_project_company_files122` (`project_company_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_project_company_file_pdf`
--

CREATE TABLE IF NOT EXISTS `dfm_project_company_file_pdf` (
  `file_pdf_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_company_file_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `file_pdf_added_date` int(11) DEFAULT NULL,
  `file_pdf_size` double DEFAULT NULL,
  `file_pdf_checksum` varchar(100) DEFAULT NULL,
  `file_pdf_location` varchar(255) DEFAULT NULL,
  `project_phase` int(11) DEFAULT NULL,
  PRIMARY KEY (`file_pdf_id`),
  KEY `fk_project_company_file_version_project_company_files1` (`project_company_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_project_company_file_tickets`
--

CREATE TABLE IF NOT EXISTS `dfm_project_company_file_tickets` (
  `project_company_file_ticket_id` int(11) NOT NULL,
  `project_company_file_id` int(11) DEFAULT NULL,
  `ticket_detail` text,
  `ticket_status` enum('Open','Closed','Assign') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ticket_date_added` int(11) DEFAULT NULL,
  `ticket_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`project_company_file_ticket_id`),
  KEY `fk_project_company_file_rejection_notes_project_company_files1` (`project_company_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_project_company_file_ticket_notes`
--

CREATE TABLE IF NOT EXISTS `dfm_project_company_file_ticket_notes` (
  `project_company_file_ticket_note_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_company_file_ticket_id` int(11) DEFAULT NULL,
  `ticket_notes` text,
  `ticket_note_added_date` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`project_company_file_ticket_note_id`),
  KEY `fk_dfm_project_company_file_ticket_notes_dfm_project_company_1` (`project_company_file_ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_project_company_file_version`
--

CREATE TABLE IF NOT EXISTS `dfm_project_company_file_version` (
  `file_version_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_company_file_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `file_version_added_date` int(11) DEFAULT NULL,
  `file_version_size` double DEFAULT NULL,
  `file_version_checksum` varchar(100) DEFAULT NULL,
  `file_version_location` varchar(255) DEFAULT NULL,
  `file_version_pdf_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`file_version_id`),
  KEY `fk_project_company_file_version_project_company_files1` (`project_company_file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=103 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_project_plans`
--

CREATE TABLE IF NOT EXISTS `dfm_project_plans` (
  `dfm_project_plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `page_number` varchar(255) NOT NULL,
  `dfm_specialty_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`dfm_project_plan_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_results`
--

CREATE TABLE IF NOT EXISTS `dfm_results` (
  `doc_result_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `misc` varchar(256) NOT NULL,
  PRIMARY KEY (`doc_result_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_specialty`
--

CREATE TABLE IF NOT EXISTS `dfm_specialty` (
  `dfm_specialty_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `main_color` int(11) NOT NULL,
  `mild_color` int(11) NOT NULL,
  `color` int(11) NOT NULL,
  `description` text NOT NULL,
  `rfi_option` enum('OFF','ON') NOT NULL,
  PRIMARY KEY (`dfm_specialty_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_stage_companies`
--

CREATE TABLE IF NOT EXISTS `dfm_stage_companies` (
  `stage_company_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `speciality_id` int(11) DEFAULT NULL,
  `dfm_stage` enum('Planning','Approval','Execution') DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `active_status` enum('Active','Disable') DEFAULT NULL,
  `company_type` enum('Lead','Regular') DEFAULT NULL,
  PRIMARY KEY (`stage_company_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_stage_company_users`
--

CREATE TABLE IF NOT EXISTS `dfm_stage_company_users` (
  `stage_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `stage_company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` enum('Lead','Regular') DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `user_action` enum('Approved','Pending','Rejected','Comment','RFI','ChangeOrder') NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`stage_user_id`),
  KEY `fk_dfm_stage_company_users_dfm_stage_companies1` (`stage_company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_stage_roles`
--

CREATE TABLE IF NOT EXISTS `dfm_stage_roles` (
  `stage_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `dfm_stage` enum('Planning','Approval','Execution') DEFAULT NULL,
  PRIMARY KEY (`stage_role_id`),
  KEY `project_id` (`project_id`,`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=144 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_stage_user_action`
--

CREATE TABLE IF NOT EXISTS `dfm_stage_user_action` (
  `dfm_stage_user_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `dfm_project_file_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `user_action` enum('Approved','Pending','Rejected','Comment','RFI','ChangeOrder') DEFAULT NULL,
  `user_type` enum('Approval','Execution') DEFAULT NULL,
  PRIMARY KEY (`dfm_stage_user_action_id`),
  KEY `dfm_project_file_id` (`dfm_project_file_id`,`user_id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_status`
--

CREATE TABLE IF NOT EXISTS `dfm_status` (
  `dfm_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`dfm_status_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `dfm_types`
--

CREATE TABLE IF NOT EXISTS `dfm_types` (
  `doc_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`doc_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=105 ;

-- --------------------------------------------------------

--
-- Table structure for table `drissues_distribution_list`
--

CREATE TABLE IF NOT EXISTS `drissues_distribution_list` (
  `distlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `distlist_project_id` int(11) NOT NULL,
  `distlist_title` varchar(255) NOT NULL,
  `distlist_users` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`distlist_id`),
  KEY `distlist_project_id` (`distlist_project_id`,`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `dr_issues`
--

CREATE TABLE IF NOT EXISTS `dr_issues` (
  `dr_issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `meeting_no` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `assigned_to` int(11) NOT NULL,
  `status` enum('Open','Void','Closed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Open',
  `due_date` date NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `outcome_type_id` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `closed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `closed_by` int(11) NOT NULL,
  `closing_comments` text COLLATE utf8_unicode_ci,
  `re_open_comments` text COLLATE utf8_unicode_ci,
  `re_open_date` datetime DEFAULT NULL,
  `re_open_by` int(11) DEFAULT NULL,
  `location` text COLLATE utf8_unicode_ci,
  `re_assign_comments` text COLLATE utf8_unicode_ci,
  `re_assign_date` datetime DEFAULT NULL,
  `re_assigned_by` int(11) DEFAULT NULL,
  `view_type` tinyint(2) NOT NULL DEFAULT '1',
  `void` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `void_comments` text COLLATE utf8_unicode_ci,
  `void_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`dr_issue_id`),
  KEY `assigned_to` (`assigned_to`,`project_id`,`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=682 ;

-- --------------------------------------------------------

--
-- Table structure for table `dr_issues_change_item`
--

CREATE TABLE IF NOT EXISTS `dr_issues_change_item` (
  `dr_change_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dr_issue_change_group_id` int(11) NOT NULL,
  `field` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oldstring` text COLLATE utf8_unicode_ci,
  `newstring` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`dr_change_item_id`),
  KEY `dr_issue_change_group_id` (`dr_issue_change_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3306 ;

-- --------------------------------------------------------

--
-- Table structure for table `dr_issues_settings`
--

CREATE TABLE IF NOT EXISTS `dr_issues_settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `show_public_private` enum('Yes','No') NOT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dr_issue_change_group`
--

CREATE TABLE IF NOT EXISTS `dr_issue_change_group` (
  `dr_issue_change_group_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dr_issue_id` int(11) NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `action_date` datetime NOT NULL,
  PRIMARY KEY (`dr_issue_change_group_id`),
  KEY `dr_issue_id` (`dr_issue_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1661 ;

-- --------------------------------------------------------

--
-- Table structure for table `dr_issue_comments`
--

CREATE TABLE IF NOT EXISTS `dr_issue_comments` (
  `dr_issue_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  `dr_issue_id` int(11) NOT NULL,
  PRIMARY KEY (`dr_issue_comment_id`),
  KEY `dr_issue_id` (`dr_issue_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1376 ;

-- --------------------------------------------------------

--
-- Table structure for table `dr_issue_comment_files`
--

CREATE TABLE IF NOT EXISTS `dr_issue_comment_files` (
  `dr_issue_comment_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_type` enum('image','pdf') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'image',
  `dr_issue_comment_id` int(11) NOT NULL,
  `file_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_thumb_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`dr_issue_comment_file_id`),
  KEY `dr_issue_comment_id` (`dr_issue_comment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=112 ;

-- --------------------------------------------------------

--
-- Table structure for table `dr_issue_files`
--

CREATE TABLE IF NOT EXISTS `dr_issue_files` (
  `dr_issue_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_type` enum('image','pdf') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'image',
  `dr_issue_id` int(11) DEFAULT NULL,
  `file_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_thumb_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`dr_issue_file_id`),
  KEY `dr_issue_id` (`dr_issue_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=70 ;

-- --------------------------------------------------------

--
-- Table structure for table `dr_issue_levels`
--

CREATE TABLE IF NOT EXISTS `dr_issue_levels` (
  `dr_issue_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`dr_issue_level_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `dr_issue_outcome_types`
--

CREATE TABLE IF NOT EXISTS `dr_issue_outcome_types` (
  `dr_issue_outcome_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`dr_issue_outcome_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `dr_issue_types`
--

CREATE TABLE IF NOT EXISTS `dr_issue_types` (
  `dr_issue_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`dr_issue_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_attachments`
--

CREATE TABLE IF NOT EXISTS `email_attachments` (
  `attachment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `original_title` varchar(255) NOT NULL,
  `sender_email` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `received_at` datetime NOT NULL,
  `status` enum('new','rejected','assigned') NOT NULL DEFAULT 'new',
  PRIMARY KEY (`attachment_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_log`
--

CREATE TABLE IF NOT EXISTS `email_log` (
  `email_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `receiver_email` varchar(255) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`email_log_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9158 ;

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE IF NOT EXISTS `equipment` (
  `equipment_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`equipment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE IF NOT EXISTS `fields` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `formtemplates`
--

CREATE TABLE IF NOT EXISTS `formtemplates` (
  `formtemplate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `filename` varchar(255) NOT NULL,
  PRIMARY KEY (`formtemplate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_roles`
--

CREATE TABLE IF NOT EXISTS `group_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`,`role_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

-- --------------------------------------------------------

--
-- Table structure for table `ig_3d_location_records`
--

CREATE TABLE IF NOT EXISTS `ig_3d_location_records` (
  `ig_3d_location_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `ig_dynamic_location_sheet_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `module_record_id` int(11) DEFAULT NULL,
  `ig_group_sheet_id` int(11) NOT NULL,
  `bimserver_object_uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ig_3d_location_record_id`),
  KEY `ig_dynamic_location_sheet_id` (`ig_dynamic_location_sheet_id`,`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=287 ;

-- --------------------------------------------------------

--
-- Table structure for table `ig_3d_sheets_cache`
--

CREATE TABLE IF NOT EXISTS `ig_3d_sheets_cache` (
  `ig_3d_sheets_cache_id` int(11) NOT NULL AUTO_INCREMENT,
  `ig_sheet_id` int(11) NOT NULL,
  `cache_manifest_file` varchar(25) NOT NULL,
  PRIMARY KEY (`ig_3d_sheets_cache_id`),
  KEY `ig_sheet_id` (`ig_sheet_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=127 ;

-- --------------------------------------------------------

--
-- Table structure for table `ig_color`
--

CREATE TABLE IF NOT EXISTS `ig_color` (
  `	ig_color_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `color` int(11) NOT NULL,
  PRIMARY KEY (`	ig_color_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `ig_dynamic_3d_location_sheets`
--

CREATE TABLE IF NOT EXISTS `ig_dynamic_3d_location_sheets` (
  `ig_dynamic_3d_location_sheet_id` int(11) NOT NULL AUTO_INCREMENT,
  `ig_sheet_id` int(11) NOT NULL,
  `ld_dynamic_3d_location_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL DEFAULT '5',
  `fill` int(1) NOT NULL DEFAULT '1',
  `stroke_selection` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ig_dynamic_3d_location_sheet_id`),
  KEY `ld_dynamic_3d_location_id_idx` (`ld_dynamic_3d_location_id`),
  KEY `ig_sheet_id` (`ig_sheet_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=543110 ;

-- --------------------------------------------------------

--
-- Table structure for table `ig_dynamic_location_sheets`
--

CREATE TABLE IF NOT EXISTS `ig_dynamic_location_sheets` (
  `ig_dynamic_location_sheet_id` int(11) NOT NULL AUTO_INCREMENT,
  `ig_sheet_id` int(11) NOT NULL,
  `ld_dynamic_location_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL DEFAULT '5',
  `fill` int(1) NOT NULL DEFAULT '1',
  `stroke_selection` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ig_dynamic_location_sheet_id`),
  KEY `ld_dynamic_location_id_idx` (`ld_dynamic_location_id`),
  KEY `ig_sheet_id` (`ig_sheet_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4035290 ;

-- --------------------------------------------------------

--
-- Table structure for table `ig_dynamic_sheet_groups`
--

CREATE TABLE IF NOT EXISTS `ig_dynamic_sheet_groups` (
  ` ig_dynamic_sheet_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `ig_group_sheet_id` int(11) NOT NULL,
  `ig_sheet_id` int(11) NOT NULL,
  `sort` int(4) NOT NULL,
  PRIMARY KEY (` ig_dynamic_sheet_group_id`),
  KEY `ig_group_sheet_id` (`ig_group_sheet_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25399 ;

-- --------------------------------------------------------

--
-- Table structure for table `ig_org_structure`
--

CREATE TABLE IF NOT EXISTS `ig_org_structure` (
  `ig_org_structure_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `sorting` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT '0',
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`ig_org_structure_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=258 ;

-- --------------------------------------------------------

--
-- Table structure for table `ig_photo_management`
--

CREATE TABLE IF NOT EXISTS `ig_photo_management` (
  `ig_photo_management_id` int(11) NOT NULL AUTO_INCREMENT,
  `ig_group_sheet_id` int(11) NOT NULL,
  `ld_dynamic_location_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(50) NOT NULL,
  `project_photo_type_id` int(11) DEFAULT NULL,
  `bearing` varchar(20) NOT NULL,
  `comment` text NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_stored_name` varchar(255) NOT NULL,
  `file_type` varchar(20) NOT NULL,
  `file_size` double NOT NULL,
  `location_type` varchar(20) DEFAULT NULL,
  `ceiling` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ig_photo_management_id`),
  KEY `ig_group_sheet_id` (`ig_group_sheet_id`,`ld_dynamic_location_id`,`project_id`,`user_id`,`project_photo_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1610 ;

-- --------------------------------------------------------

--
-- Table structure for table `ig_photo_management_files`
--

CREATE TABLE IF NOT EXISTS `ig_photo_management_files` (
  `ig_photo_management_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `ig_photo_management_id` int(11) NOT NULL,
  `doc_path` varchar(100) NOT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `file_num` int(11) NOT NULL,
  `file_size` double NOT NULL,
  PRIMARY KEY (`ig_photo_management_file_id`),
  KEY `ig_photo_management_id` (`ig_photo_management_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10168 ;

-- --------------------------------------------------------

--
-- Table structure for table `ig_sheets`
--

CREATE TABLE IF NOT EXISTS `ig_sheets` (
  `ig_sheet_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `stroke` varchar(20) NOT NULL,
  `stroke_selection` int(1) NOT NULL DEFAULT '0',
  `fill` int(1) NOT NULL DEFAULT '1',
  `width` int(4) NOT NULL DEFAULT '700',
  `height` int(4) NOT NULL DEFAULT '400',
  `project_id` int(11) NOT NULL,
  `ig_org_structure_id` int(11) DEFAULT NULL,
  `type` enum('2d','3d') NOT NULL DEFAULT '2d',
  `updated` datetime NOT NULL,
  `cache_size` int(11) NOT NULL,
  `cpos` varchar(45) NOT NULL,
  `crot` varchar(45) NOT NULL,
  `ig_sheet_bim_oid` int(11) NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `ig_sheet_type` varchar(20) DEFAULT NULL,
  `map_trade_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ig_sheet_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4626 ;

-- --------------------------------------------------------

--
-- Table structure for table `ig_sheet_circles`
--

CREATE TABLE IF NOT EXISTS `ig_sheet_circles` (
  `ig_sheet_circle_id` int(11) NOT NULL AUTO_INCREMENT,
  `ig_group_sheet_id` int(11) NOT NULL,
  `radius` int(11) NOT NULL,
  PRIMARY KEY (`ig_sheet_circle_id`),
  KEY `ig_group_sheet_id` (`ig_group_sheet_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

-- --------------------------------------------------------

--
-- Table structure for table `ig_sheet_markers`
--

CREATE TABLE IF NOT EXISTS `ig_sheet_markers` (
  `ig_sheet_marker_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `x1` float DEFAULT NULL,
  `y1` float DEFAULT NULL,
  `radius` varchar(20) DEFAULT NULL,
  `x2` float DEFAULT NULL,
  `y2` float DEFAULT NULL,
  `width` varchar(20) DEFAULT NULL,
  `height` varchar(20) DEFAULT NULL,
  `path` text,
  `fill` varchar(20) DEFAULT NULL,
  `stroke` varchar(100) DEFAULT NULL,
  `strokeWidth` varchar(100) DEFAULT NULL,
  `storkeWidth` varchar(100) NOT NULL,
  `inspection_request_id` int(11) NOT NULL,
  `ig_group_sheet_id` int(11) NOT NULL,
  PRIMARY KEY (`ig_sheet_marker_id`),
  KEY `inspection_request_id` (`inspection_request_id`,`ig_group_sheet_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24065 ;

-- --------------------------------------------------------

--
-- Table structure for table `ig_sheet_settings`
--

CREATE TABLE IF NOT EXISTS `ig_sheet_settings` (
  `ig_sheet_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `mouseover_color_id` int(11) NOT NULL,
  `selected_color_id` int(11) NOT NULL,
  `nostatus_color_id` int(11) NOT NULL,
  `text_color_id` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `stroke` varchar(20) NOT NULL,
  `font` varchar(255) NOT NULL,
  `font_color` int(11) NOT NULL,
  `leaveout_color_id` int(11) NOT NULL,
  `leaveout_highlited_color_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `enabled_2d` int(1) NOT NULL,
  `enabled_3d` int(1) NOT NULL,
  PRIMARY KEY (`ig_sheet_setting_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

-- --------------------------------------------------------

--
-- Table structure for table `ig_tool_2d_location_records`
--

CREATE TABLE IF NOT EXISTS `ig_tool_2d_location_records` (
  `ig_tool_2d_location_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `ig_dynamic_location_sheet_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `module_record_id` int(11) DEFAULT NULL,
  `ig_group_sheet_id` int(11) NOT NULL,
  `leave_out` int(1) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'New',
  `new_module_record_id` int(11) NOT NULL,
  `ld_dynamic_location_id` int(11) NOT NULL,
  PRIMARY KEY (`ig_tool_2d_location_record_id`),
  KEY `ig_dynamic_location_sheet_id` (`ig_dynamic_location_sheet_id`,`project_id`),
  KEY `module_idx` (`module_id`,`module_record_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2528757 ;

--
-- Triggers `ig_tool_2d_location_records`
--
DROP TRIGGER IF EXISTS `insert_location_into_ig_tool_2d_location_record`;
DELIMITER //
CREATE TRIGGER `insert_location_into_ig_tool_2d_location_record` BEFORE INSERT ON `ig_tool_2d_location_records`
 FOR EACH ROW BEGIN

   DECLARE location_id INT;

  
   SELECT ld_dynamic_location_id FROM ig_dynamic_location_sheets WHERE ig_dynamic_location_sheet_id = NEW.ig_dynamic_location_sheet_id INTO location_id;
   
 SET NEW.ld_dynamic_location_id = location_id;
   
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update_location_into_ig_tool_2d_location_record`;
DELIMITER //
CREATE TRIGGER `update_location_into_ig_tool_2d_location_record` BEFORE UPDATE ON `ig_tool_2d_location_records`
 FOR EACH ROW BEGIN

   DECLARE location_id INT;

  
   SELECT ld_dynamic_location_id FROM ig_dynamic_location_sheets WHERE ig_dynamic_location_sheet_id = NEW.ig_dynamic_location_sheet_id INTO location_id;
   
 SET NEW.ld_dynamic_location_id = location_id;
   
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ig_tool_3d_location_records`
--

CREATE TABLE IF NOT EXISTS `ig_tool_3d_location_records` (
  `ig_3d_location_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pdf_id` int(11) DEFAULT NULL,
  `ir_id` int(11) DEFAULT NULL,
  `temp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ig_3d_location_record_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=181 ;

-- --------------------------------------------------------

--
-- Table structure for table `import_api_clients`
--

CREATE TABLE IF NOT EXISTS `import_api_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(50) NOT NULL,
  `secret_key` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `import_records_data`
--

CREATE TABLE IF NOT EXISTS `import_records_data` (
  `import_data_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_guid` varchar(32) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `record_id` varchar(20) DEFAULT NULL,
  `document_date` date DEFAULT NULL,
  `document_type` int(11) DEFAULT NULL,
  `document_result` int(11) DEFAULT NULL,
  `issuing_company` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `summary` text,
  `location` text,
  `increment` int(11) DEFAULT NULL,
  `inspection_request` text,
  `status` enum('Pending','Accepted','Rejected') NOT NULL,
  `extra_data` text,
  PRIMARY KEY (`import_data_id`),
  KEY `project_id` (`project_id`,`document_type`,`document_result`,`issuing_company`,`user`,`increment`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48882 ;

-- --------------------------------------------------------

--
-- Table structure for table `import_records_data_files`
--

CREATE TABLE IF NOT EXISTS `import_records_data_files` (
  `import_data_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `import_data_id` int(11) NOT NULL,
  `file_name` varchar(40) NOT NULL,
  `file_url` varchar(200) NOT NULL,
  `file_type` varchar(5) NOT NULL,
  PRIMARY KEY (`import_data_file_id`),
  KEY `import_data_id` (`import_data_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=94597 ;

-- --------------------------------------------------------

--
-- Table structure for table `import_records_data_ir`
--

CREATE TABLE IF NOT EXISTS `import_records_data_ir` (
  `import_data_ir_id` int(11) NOT NULL AUTO_INCREMENT,
  `import_data_id` int(11) NOT NULL,
  `inspection_request_id` int(11) NOT NULL,
  PRIMARY KEY (`import_data_ir_id`),
  KEY `import_data_id` (`import_data_id`),
  KEY `inspection_request_id` (`inspection_request_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1101743 ;

-- --------------------------------------------------------

--
-- Table structure for table `increments`
--

CREATE TABLE IF NOT EXISTS `increments` (
  `increment_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`increment_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_change_group`
--

CREATE TABLE IF NOT EXISTS `inspection_change_group` (
  `inspection_change_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inspection_request_id` bigint(20) DEFAULT NULL,
  `author` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `assigned_to` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`inspection_change_group_id`),
  KEY `inspection_request_id` (`inspection_request_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1004809 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_change_item`
--

CREATE TABLE IF NOT EXISTS `inspection_change_item` (
  `inspection_change_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inspection_change_group_id` bigint(20) DEFAULT NULL,
  `fieldtype` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `field` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `oldvalue` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `oldstring` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `newvalue` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `newstring` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  PRIMARY KEY (`inspection_change_item_id`),
  KEY `inspection_change_group_id` (`inspection_change_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3529948 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_change_item_localURL`
--

CREATE TABLE IF NOT EXISTS `inspection_change_item_localURL` (
  `inspection_change_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inspection_change_group_id` bigint(20) DEFAULT NULL,
  `fieldtype` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `field` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `oldvalue` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `oldstring` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `newvalue` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `newstring` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  PRIMARY KEY (`inspection_change_item_id`),
  KEY `inspection_change_group_id` (`inspection_change_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=446106 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_cxm_systems`
--

CREATE TABLE IF NOT EXISTS `inspection_cxm_systems` (
  `inspection_cxm_systems_id` int(11) NOT NULL AUTO_INCREMENT,
  `inspection_id` int(11) NOT NULL,
  `cxm_system_id` int(11) NOT NULL,
  PRIMARY KEY (`inspection_cxm_systems_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21868 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_export`
--

CREATE TABLE IF NOT EXISTS `inspection_export` (
  `inspection_export_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `inspection_request_id` int(11) NOT NULL,
  `inspection_request_status_id` int(11) NOT NULL,
  `inspection_request_stage_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `inspection_request_action_history_id` int(11) NOT NULL,
  `inspection_request_action_id` int(11) NOT NULL,
  `project_authority_substructure_id` int(11) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `export_type` enum('csv','xml') NOT NULL DEFAULT 'csv',
  PRIMARY KEY (`inspection_export_id`),
  KEY `project_id` (`project_id`,`user_id`),
  KEY `company_id` (`company_id`),
  KEY `inspection_request_id` (`inspection_request_id`,`inspection_request_status_id`,`inspection_request_stage_id`,`type_id`,`inspection_request_action_history_id`,`inspection_request_action_id`,`project_authority_substructure_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_filters`
--

CREATE TABLE IF NOT EXISTS `inspection_filters` (
  `inspection_filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `default` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`inspection_filter_id`),
  KEY `user_id` (`user_id`,`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=413 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_group`
--

CREATE TABLE IF NOT EXISTS `inspection_group` (
  `inspection_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`inspection_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_issues`
--

CREATE TABLE IF NOT EXISTS `inspection_issues` (
  `inspection_request_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  PRIMARY KEY (`inspection_request_id`,`issue_id`),
  KEY `issue_id` (`issue_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_observations`
--

CREATE TABLE IF NOT EXISTS `inspection_observations` (
  `inspection_request_id` int(11) NOT NULL,
  `observation_id` int(11) NOT NULL,
  PRIMARY KEY (`inspection_request_id`,`observation_id`),
  KEY `observation_id` (`observation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_report_types`
--

CREATE TABLE IF NOT EXISTS `inspection_report_types` (
  `inspection_report_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `inspection_report_title` varchar(255) NOT NULL,
  `inspection_report_value` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`inspection_report_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_requests`
--

CREATE TABLE IF NOT EXISTS `inspection_requests` (
  `inspection_request_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `revision_number` varchar(100) NOT NULL,
  `increment_number` int(11) NOT NULL,
  `inspection_increment_number` varchar(10) NOT NULL,
  `detail` text NOT NULL,
  `location` varchar(5000) NOT NULL,
  `change_order` varchar(255) NOT NULL,
  `rfi` varchar(255) NOT NULL,
  `cxm_systems_code` varchar(255) DEFAULT NULL,
  `spec_number` varchar(255) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `contact_number` varchar(50) NOT NULL,
  `inspection_request_status_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `open_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `request_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `actual_inspection_date` datetime NOT NULL,
  `project_authority_substructure_id` int(11) NOT NULL,
  `increment` varchar(255) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `installing_co` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_user` varchar(255) DEFAULT NULL,
  `assigned_to` int(11) NOT NULL,
  `assigned_user` varchar(255) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `pre_inspected_by` int(11) NOT NULL,
  `pre_inspected_user` varchar(255) DEFAULT NULL,
  `last_inspected_by` int(11) NOT NULL,
  `last_inspected_user` varchar(255) DEFAULT NULL,
  `inspection_request_stage_id` int(4) NOT NULL,
  `other_ref_num` varchar(255) NOT NULL,
  `submittal` varchar(255) NOT NULL,
  `inspection_request_phase_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `hot` tinyint(4) NOT NULL,
  `switch_common_ir` enum('All','Company','Trade','Custom') NOT NULL,
  `selected_common_ir` varchar(10) NOT NULL,
  `export_id` int(11) unsigned NOT NULL DEFAULT '0',
  `request_reschedule` tinyint(4) NOT NULL,
  `inspection_type` enum('On-Site','Off-Site') NOT NULL DEFAULT 'On-Site',
  `ld_dynamic_building_id` int(11) DEFAULT NULL,
  `building` varchar(255) DEFAULT NULL,
  `ld_dynamic_level_id` int(11) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `ld_dynamic_group1type_id` int(11) DEFAULT NULL,
  `group1type` varchar(255) DEFAULT NULL,
  `ld_dynamic_group1subtype_id` int(11) NOT NULL,
  `group1subtype` varchar(255) DEFAULT NULL,
  `ig_title` varchar(255) DEFAULT NULL,
  `ig_type` enum('2D','3D') DEFAULT NULL,
  `ig_path` varchar(255) DEFAULT NULL,
  `ig_sheet_id` int(11) DEFAULT NULL,
  `leaveout` enum('OPEN','CLOSED','NO') NOT NULL DEFAULT 'NO',
  `on_going` tinyint(1) NOT NULL DEFAULT '0',
  `sign_off_checklist` int(11) DEFAULT NULL,
  `sign_off_complete` tinyint(1) NOT NULL,
  `sign_off_require_date` datetime DEFAULT NULL,
  `sign_off_release_date` datetime DEFAULT NULL,
  `inspection_request_resolution_date` datetime DEFAULT NULL,
  PRIMARY KEY (`inspection_request_id`),
  KEY `inspection_request_status_id` (`inspection_request_status_id`,`project_authority_substructure_id`,`company_id`,`assigned_to`,`type_id`,`project_id`,`inspection_request_stage_id`,`export_id`,`ld_dynamic_building_id`,`ld_dynamic_level_id`,`ld_dynamic_group1type_id`,`ld_dynamic_group1subtype_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=176928 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_actions`
--

CREATE TABLE IF NOT EXISTS `inspection_request_actions` (
  `inspection_request_action_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inspection_request_id` bigint(20) NOT NULL,
  `author` varchar(100) NOT NULL,
  `author_id` int(11) NOT NULL DEFAULT '0',
  `responsible_user_id` int(11) NOT NULL,
  `inspection_request_failed_cause_id` int(11) DEFAULT NULL,
  `action_type` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `action_body` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `revision_number` varchar(100) NOT NULL DEFAULT '0',
  `date_of_record` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'store the IR request_date or actual_inspection_date',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `revision_required_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`inspection_request_action_id`),
  KEY `inspection_request_id` (`inspection_request_id`,`author_id`,`responsible_user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=975866 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_action_history`
--

CREATE TABLE IF NOT EXISTS `inspection_request_action_history` (
  `inspection_request_action_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `inspection_request_id` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `ir_scheduled_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sub_create_user_id` int(11) NOT NULL,
  `sub_create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sub_create_duration` double NOT NULL,
  `sub_open_user_id` int(11) NOT NULL,
  `sub_open_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sub_open_duration` double NOT NULL,
  `gc_create_user_id` int(11) NOT NULL,
  `gc_create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gc_create_duration` double NOT NULL,
  `gc_reject_user_id` int(11) NOT NULL,
  `gc_reject_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gc_reject_duration` double NOT NULL,
  `gc_open_user_id` int(11) NOT NULL,
  `gc_open_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gc_open_duration` double NOT NULL,
  `gc_revise_user_id` int(11) NOT NULL,
  `gc_revise_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gc_return_user_id` int(11) NOT NULL,
  `gc_return_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ior_pending_user_id` int(11) NOT NULL,
  `ior_pending_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ior_pending_duration` double NOT NULL,
  `ior_revision_required_user_id` int(11) NOT NULL,
  `ior_revision_required_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ior_revision_required_duration` double NOT NULL,
  `ior_pass_user_id` int(11) NOT NULL,
  `ior_pass_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ior_pass_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inspection_request_failed_cause_id` int(11) DEFAULT NULL,
  `ior_fail_user_id` int(11) NOT NULL,
  `ior_fail_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ior_fail_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ior_fail_duration` double NOT NULL,
  PRIMARY KEY (`inspection_request_action_history_id`),
  KEY `inspection_request_id` (`inspection_request_id`,`company_id`,`sub_create_user_id`,`sub_open_user_id`,`gc_create_user_id`,`gc_reject_user_id`,`gc_open_user_id`,`ior_pending_user_id`,`ior_revision_required_user_id`,`ior_pass_user_id`,`ior_fail_user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=192308 ;

--
-- Triggers `inspection_request_action_history`
--
DROP TRIGGER IF EXISTS `update_inspection_request_action_history`;
DELIMITER //
CREATE TRIGGER `update_inspection_request_action_history` BEFORE UPDATE ON `inspection_request_action_history`
 FOR EACH ROW BEGIN
IF (NEW.ior_pass_date <> OLD.ior_pass_date AND UNIX_TIMESTAMP(NEW.ior_pass_date) > 0) THEN	
SET NEW.ior_pass_timestamp = CURRENT_TIMESTAMP;
END IF;
IF (NEW.ior_fail_date <> OLD.ior_fail_date AND UNIX_TIMESTAMP(NEW.ior_fail_date) > 0) THEN	
SET NEW.ior_fail_timestamp = CURRENT_TIMESTAMP;
END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_action_types`
--

CREATE TABLE IF NOT EXISTS `inspection_request_action_types` (
  `inspection_request_action_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`inspection_request_action_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_checklist_item_results`
--

CREATE TABLE IF NOT EXISTS `inspection_request_checklist_item_results` (
  `inspection_request_checklist_item_result_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `checklist_item_id` int(11) NOT NULL,
  `is_complete` tinyint(1) DEFAULT NULL,
  `comments` text,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `date_signed` datetime DEFAULT NULL,
  `inspection_request_id` int(11) NOT NULL,
  PRIMARY KEY (`inspection_request_checklist_item_result_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2120 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_colors`
--

CREATE TABLE IF NOT EXISTS `inspection_request_colors` (
  `inspection_request_color_id` int(11) NOT NULL AUTO_INCREMENT,
  `inspection_request_status_id` int(11) NOT NULL,
  `inspection_request_stage_id` int(11) NOT NULL,
  `std_color_id` int(11) NOT NULL,
  PRIMARY KEY (`inspection_request_color_id`),
  KEY `inspection_request_stage_id` (`inspection_request_stage_id`),
  KEY `inspection_request_status_id` (`inspection_request_status_id`),
  KEY `std_color_id` (`std_color_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_failed_cause`
--

CREATE TABLE IF NOT EXISTS `inspection_request_failed_cause` (
  `inspection_request_failed_cause_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`inspection_request_failed_cause_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_files`
--

CREATE TABLE IF NOT EXISTS `inspection_request_files` (
  `inspection_request_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `inspection_request_id` int(11) NOT NULL,
  `file_name` varchar(244) NOT NULL,
  `file_stored_name` varchar(255) NOT NULL,
  `file_type` enum('image','pdf') NOT NULL,
  `file_size` double NOT NULL,
  PRIMARY KEY (`inspection_request_file_id`),
  KEY `inspection_request_id` (`inspection_request_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=134771 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_ig_text`
--

CREATE TABLE IF NOT EXISTS `inspection_request_ig_text` (
  `inspection_request_ig_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `background_x` varchar(20) NOT NULL,
  `background_y` varchar(20) NOT NULL,
  `background_width` varchar(20) NOT NULL,
  `background_height` varchar(20) NOT NULL,
  `background_fill` varchar(20) NOT NULL,
  `background_stroke` varchar(20) NOT NULL,
  `text_x` varchar(20) NOT NULL,
  `text_y` varchar(20) NOT NULL,
  `text_fill` varchar(20) NOT NULL,
  `text_font` varchar(20) NOT NULL,
  `text` text,
  `inspection_request_id` int(11) NOT NULL,
  PRIMARY KEY (`inspection_request_ig_text_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_owner_comments`
--

CREATE TABLE IF NOT EXISTS `inspection_request_owner_comments` (
  `inspection_request_owner_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text CHARACTER SET utf8 NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `inspection_request_id` int(11) NOT NULL,
  PRIMARY KEY (`inspection_request_owner_comment_id`),
  KEY `inspection_request_id` (`inspection_request_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_phase`
--

CREATE TABLE IF NOT EXISTS `inspection_request_phase` (
  `inspection_request_phase_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`inspection_request_phase_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_quidelines`
--

CREATE TABLE IF NOT EXISTS `inspection_request_quidelines` (
  `inspection_request_guideline_id` int(11) NOT NULL AUTO_INCREMENT,
  `inspection_request_id` int(11) NOT NULL,
  `jurisdiction_checklist_id` int(11) NOT NULL,
  `status` enum('fail','pass','na') NOT NULL,
  PRIMARY KEY (`inspection_request_guideline_id`),
  KEY `inspection_request_id` (`inspection_request_id`,`jurisdiction_checklist_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=382 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_relationships`
--

CREATE TABLE IF NOT EXISTS `inspection_request_relationships` (
  `inspection_request_relationship_id` int(11) NOT NULL AUTO_INCREMENT,
  `ld_dynamic_building_id` int(11) NOT NULL DEFAULT '0',
  `ld_dynamic_level_id` int(11) NOT NULL DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `gc_user_id` int(11) DEFAULT NULL,
  `jurisdiction_user_id` int(11) DEFAULT NULL,
  `ior_user_id` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`inspection_request_relationship_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3548 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_relationships_anotherbackup`
--

CREATE TABLE IF NOT EXISTS `inspection_request_relationships_anotherbackup` (
  `inspection_request_relationship_id` int(11) NOT NULL DEFAULT '0',
  `ld_dynamic_building_id` int(11) NOT NULL DEFAULT '0',
  `ld_dynamic_level_id` int(11) NOT NULL DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `gc_user_id` int(11) DEFAULT NULL,
  `jurisdiction_user_id` int(11) DEFAULT NULL,
  `ior_user_id` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_relationships_bkp`
--

CREATE TABLE IF NOT EXISTS `inspection_request_relationships_bkp` (
  `inspection_request_relationship_id` int(11) NOT NULL DEFAULT '0',
  `ld_dynamic_building_id` int(11) NOT NULL DEFAULT '0',
  `ld_dynamic_level_id` int(11) NOT NULL DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `gc_user_id` int(11) DEFAULT NULL,
  `jurisdiction_user_id` int(11) DEFAULT NULL,
  `ior_user_id` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_relationships_bkp_042716`
--

CREATE TABLE IF NOT EXISTS `inspection_request_relationships_bkp_042716` (
  `inspection_request_relationship_id` int(11) NOT NULL DEFAULT '0',
  `ld_dynamic_building_id` int(11) NOT NULL DEFAULT '0',
  `ld_dynamic_level_id` int(11) NOT NULL DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `gc_user_id` int(11) DEFAULT NULL,
  `jurisdiction_user_id` int(11) DEFAULT NULL,
  `ior_user_id` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_relationships_bkp_050616`
--

CREATE TABLE IF NOT EXISTS `inspection_request_relationships_bkp_050616` (
  `inspection_request_relationship_id` int(11) NOT NULL DEFAULT '0',
  `ld_dynamic_building_id` int(11) NOT NULL DEFAULT '0',
  `ld_dynamic_level_id` int(11) NOT NULL DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `gc_user_id` int(11) DEFAULT NULL,
  `jurisdiction_user_id` int(11) DEFAULT NULL,
  `ior_user_id` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_relationships_old`
--

CREATE TABLE IF NOT EXISTS `inspection_request_relationships_old` (
  `inspection_request_relationship_id` int(11) NOT NULL DEFAULT '0',
  `ld_dynamic_building_id` int(11) NOT NULL DEFAULT '0',
  `ld_dynamic_level_id` int(11) NOT NULL DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `gc_user_id` int(11) DEFAULT NULL,
  `jurisdiction_user_id` int(11) DEFAULT NULL,
  `ior_user_id` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`inspection_request_relationship_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_reschedule`
--

CREATE TABLE IF NOT EXISTS `inspection_request_reschedule` (
  `inspection_request_reschedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_date` datetime NOT NULL,
  `new_request_date` datetime NOT NULL,
  `comments` text NOT NULL,
  `type_id` int(11) NOT NULL,
  `location` text NOT NULL,
  `inspection_request_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1: Accepted, 2: Revision Required ,3 :Void ',
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`inspection_request_reschedule_id`),
  KEY `type_id` (`type_id`,`inspection_request_id`,`company_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13328 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_stages`
--

CREATE TABLE IF NOT EXISTS `inspection_request_stages` (
  `inspection_request_stage_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`inspection_request_stage_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_request_status`
--

CREATE TABLE IF NOT EXISTS `inspection_request_status` (
  `inspection_request_status_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `color` varchar(10) NOT NULL,
  `std_color_id` int(11) NOT NULL,
  PRIMARY KEY (`inspection_request_status_id`),
  KEY `std_color_id` (`std_color_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=60 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_rfi`
--

CREATE TABLE IF NOT EXISTS `inspection_rfi` (
  `inspection_rfi_id` int(11) NOT NULL AUTO_INCREMENT,
  `inspection_request_id` int(11) NOT NULL,
  `rfi_id` int(11) NOT NULL,
  PRIMARY KEY (`inspection_rfi_id`),
  KEY `inspection_request_id` (`inspection_request_id`,`rfi_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_status`
--

CREATE TABLE IF NOT EXISTS `inspection_status` (
  `status_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_type`
--

CREATE TABLE IF NOT EXISTS `inspection_type` (
  `type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `number` int(11) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `name` varchar(125) NOT NULL,
  `description` text NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `period` enum('Pre-Install','Install','Post-Install') DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=1253 ;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_type_checklists`
--

CREATE TABLE IF NOT EXISTS `inspection_type_checklists` (
  `type_id` int(11) NOT NULL,
  `jurisdiction_checklist_id` int(11) NOT NULL,
  PRIMARY KEY (`type_id`,`jurisdiction_checklist_id`),
  KEY `jurisdiction_checklist_id` (`jurisdiction_checklist_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_type_company`
--

CREATE TABLE IF NOT EXISTS `inspection_type_company` (
  `type_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`company_id`,`project_id`,`type_id`),
  KEY `company_id` (`company_id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_type_groups`
--

CREATE TABLE IF NOT EXISTS `inspection_type_groups` (
  `type_id` int(11) NOT NULL,
  `inspection_group_id` int(11) NOT NULL,
  PRIMARY KEY (`type_id`,`inspection_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_type_mm`
--

CREATE TABLE IF NOT EXISTS `inspection_type_mm` (
  `inspection_type` int(11) unsigned NOT NULL,
  `jurisdiction_tio` int(11) unsigned NOT NULL,
  KEY `jurisdiction_tio` (`jurisdiction_tio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_type_specialty`
--

CREATE TABLE IF NOT EXISTS `inspection_type_specialty` (
  `type_id` int(11) NOT NULL,
  `dfm_specialty_id` int(11) NOT NULL,
  PRIMARY KEY (`dfm_specialty_id`,`type_id`),
  KEY `dfm_specialty_id` (`dfm_specialty_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inspection_wans`
--

CREATE TABLE IF NOT EXISTS `inspection_wans` (
  ` inspection_wan_id` int(11) NOT NULL AUTO_INCREMENT,
  `inspection_request_id` int(11) NOT NULL,
  `wan_id` int(11) NOT NULL,
  PRIMARY KEY (` inspection_wan_id`),
  KEY `inspection_request_id` (`inspection_request_id`,`wan_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5325 ;

-- --------------------------------------------------------

--
-- Table structure for table `ir_linked_items_merged_files`
--

CREATE TABLE IF NOT EXISTS `ir_linked_items_merged_files` (
  `cloud_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `cloud_url` varchar(1000) DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `inspection_request_id` int(11) NOT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `change_order_id` int(11) DEFAULT NULL,
  `status` enum('PROCESSING','IN-PROGRESS','MERGED') NOT NULL,
  PRIMARY KEY (`cloud_file_id`),
  KEY `inspection_request_id` (`inspection_request_id`),
  KEY `issue_id` (`issue_id`,`change_order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29775 ;

-- --------------------------------------------------------

--
-- Table structure for table `ir_raw_export_cron`
--

CREATE TABLE IF NOT EXISTS `ir_raw_export_cron` (
  `raw_export_cron_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('On','Off') NOT NULL,
  `distribution_list` varchar(1000) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`raw_export_cron_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `ir_schedule_setting`
--

CREATE TABLE IF NOT EXISTS `ir_schedule_setting` (
  `schedule_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `schedule_available` varchar(10) DEFAULT NULL,
  `schedule_delay_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `schedule_delay_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `offsite_delay_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `offsite_delay_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cut_off_time` varchar(15) NOT NULL,
  `open_action_delay_start` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `open_action_delay_end` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `open_action_offsite_delay_start` timestamp NULL DEFAULT NULL,
  `open_action_offsite_delay_end` timestamp NULL DEFAULT NULL,
  `open_action_cutt_off` varchar(15) DEFAULT NULL,
  `holidays` varchar(100) NOT NULL,
  `us_holidays` tinyint(1) NOT NULL,
  `business_hours_start_time` varchar(15) NOT NULL,
  `business_hours_end_time` varchar(15) NOT NULL,
  `us_specnumber` tinyint(1) NOT NULL,
  `other_ref` tinyint(1) NOT NULL,
  `restrict_ir_edit` tinyint(1) NOT NULL,
  `allow_request_reschedule` tinyint(1) NOT NULL DEFAULT '1',
  `building_required` tinyint(1) NOT NULL DEFAULT '0',
  `area_required` tinyint(1) NOT NULL DEFAULT '0',
  `failed_causes_required` tinyint(1) DEFAULT '0',
  `phase_of_work_required` tinyint(4) NOT NULL,
  `allow_subctonractor_all_records` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`schedule_setting_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=63 ;

-- --------------------------------------------------------

--
-- Table structure for table `ir_signoff_distribution_list`
--

CREATE TABLE IF NOT EXISTS `ir_signoff_distribution_list` (
  `distlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `checklist_id` int(11) NOT NULL,
  `distlist_users` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`distlist_id`),
  KEY `rfi_distlist_project_id` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE IF NOT EXISTS `issues` (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_type_id` int(11) DEFAULT NULL,
  `issue_reason_id` int(11) NOT NULL,
  `issue_level_id` int(11) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text CHARACTER SET utf8,
  `location` varchar(255) DEFAULT NULL,
  `inspector_status` varchar(100) DEFAULT NULL,
  `contractor_status` varchar(100) DEFAULT NULL,
  `additional_status` varchar(100) DEFAULT NULL,
  `qc_status` varchar(100) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `closing_comments` text NOT NULL,
  `closed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `company_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `closed_by` int(11) NOT NULL,
  `project_authority_substructure_id` int(11) NOT NULL,
  `responsible_company_id` int(11) NOT NULL,
  `due_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `assign_to` int(11) NOT NULL,
  `correction_actions` text NOT NULL,
  `resolution_date` date DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `company_id` (`company_id`,`type_id`,`project_id`,`created_by`,`assign_to`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2362 ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_comments`
--

CREATE TABLE IF NOT EXISTS `issue_comments` (
  `issue_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text CHARACTER SET utf8 NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  PRIMARY KEY (`issue_comment_id`),
  KEY `issue_id` (`issue_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1000004706 ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_comment_files`
--

CREATE TABLE IF NOT EXISTS `issue_comment_files` (
  `issue_comment_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL,
  `file_type` enum('image','pdf') NOT NULL DEFAULT 'image',
  `issue_comment_id` int(11) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `file_thumb_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`issue_comment_file_id`),
  KEY `issue_comment_id` (`issue_comment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1239 ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_files`
--

CREATE TABLE IF NOT EXISTS `issue_files` (
  `issue_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_type` enum('image','pdf','excel','word','dwg') NOT NULL DEFAULT 'image',
  `issue_id` int(11) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `file_thumb_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`issue_file_id`),
  KEY `issue_id` (`issue_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1598 ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_filters`
--

CREATE TABLE IF NOT EXISTS `issue_filters` (
  `issue_filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `default` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`issue_filter_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_history`
--

CREATE TABLE IF NOT EXISTS `issue_history` (
  `issue_history_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) unsigned NOT NULL,
  `action_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` varchar(100) NOT NULL,
  `action_by` int(11) unsigned NOT NULL,
  `comment` text CHARACTER SET utf8,
  `attach_file` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `file_size` double DEFAULT NULL,
  `file_type` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `file_thumb_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`issue_history_id`),
  KEY `issue_id` (`issue_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5324 ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_levels`
--

CREATE TABLE IF NOT EXISTS `issue_levels` (
  `issue_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`issue_level_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_reasons`
--

CREATE TABLE IF NOT EXISTS `issue_reasons` (
  `issue_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`issue_reason_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_settings`
--

CREATE TABLE IF NOT EXISTS `issue_settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `show_priority` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  PRIMARY KEY (`setting_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_types`
--

CREATE TABLE IF NOT EXISTS `issue_types` (
  `issue_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`issue_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

-- --------------------------------------------------------

--
-- Table structure for table `jurisdiction_authorities`
--

CREATE TABLE IF NOT EXISTS `jurisdiction_authorities` (
  `jurisdiction_authority_id` int(11) NOT NULL AUTO_INCREMENT,
  `authority_name` varchar(100) NOT NULL,
  `authority_code` varchar(100) NOT NULL,
  `authority_website` varchar(255) NOT NULL,
  `locale_type` enum('city','state','county') NOT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`jurisdiction_authority_id`),
  KEY `locale_id` (`locale_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `jurisdiction_building_types`
--

CREATE TABLE IF NOT EXISTS `jurisdiction_building_types` (
  `building_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_name` varchar(100) NOT NULL,
  `building_code` varchar(20) NOT NULL,
  `building_type` varchar(100) NOT NULL,
  `building_omni_class` varchar(255) NOT NULL,
  `building_description` text NOT NULL,
  PRIMARY KEY (`building_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Table structure for table `jurisdiction_checklists`
--

CREATE TABLE IF NOT EXISTS `jurisdiction_checklists` (
  `jurisdiction_checklist_id` int(11) NOT NULL AUTO_INCREMENT,
  `checklist_section` varchar(100) NOT NULL,
  `checklist_code` varchar(50) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `checklist_name` varchar(255) NOT NULL,
  `checklist_code_reference` varchar(100) NOT NULL,
  `checklist_description` text,
  `jurisdiction_program_id` int(11) NOT NULL,
  `jurisdiction_checklist_type1_id` int(11) NOT NULL,
  PRIMARY KEY (`jurisdiction_checklist_id`),
  KEY `jurisdiction_program_id` (`jurisdiction_program_id`,`jurisdiction_checklist_type1_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1151 ;

-- --------------------------------------------------------

--
-- Table structure for table `jurisdiction_checklist_type1`
--

CREATE TABLE IF NOT EXISTS `jurisdiction_checklist_type1` (
  `jurisdiction_checklist_type1_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  PRIMARY KEY (`jurisdiction_checklist_type1_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Table structure for table `jurisdiction_programs`
--

CREATE TABLE IF NOT EXISTS `jurisdiction_programs` (
  `jurisdiction_program_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_name` varchar(100) NOT NULL,
  `program_code` varchar(50) NOT NULL,
  `program_website` varchar(255) NOT NULL,
  `jurisdiction_authority_id` int(11) NOT NULL,
  PRIMARY KEY (`jurisdiction_program_id`),
  KEY `jurisdiction_authority_id` (`jurisdiction_authority_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Table structure for table `jurisdiction_substructures`
--

CREATE TABLE IF NOT EXISTS `jurisdiction_substructures` (
  `jurisdiction_substructure_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `substructure_type` varchar(100) NOT NULL,
  `substructure_description` text NOT NULL,
  PRIMARY KEY (`jurisdiction_substructure_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `jurisdiction_tio`
--

CREATE TABLE IF NOT EXISTS `jurisdiction_tio` (
  `tio_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tio_program_id` int(11) unsigned NOT NULL,
  `section` varchar(10) NOT NULL DEFAULT '',
  `code` varchar(40) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `references` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  PRIMARY KEY (`tio_id`),
  KEY `tio_program_id` (`tio_program_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=297 ;

-- --------------------------------------------------------

--
-- Table structure for table `jurisdiction_tio_program`
--

CREATE TABLE IF NOT EXISTS `jurisdiction_tio_program` (
  `tio_program_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`tio_program_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `labor`
--

CREATE TABLE IF NOT EXISTS `labor` (
  `labor_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`labor_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `labor_rate_types`
--

CREATE TABLE IF NOT EXISTS `labor_rate_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `ld_dynamic_3d_locations`
--

CREATE TABLE IF NOT EXISTS `ld_dynamic_3d_locations` (
  `ld_dynamic_3d_location_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `radius` double NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `file_name` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `object_id` varchar(80) NOT NULL,
  `positions` longtext NOT NULL,
  `normals` longtext NOT NULL,
  `maxindices` int(10) unsigned NOT NULL,
  `stroke` varchar(20) NOT NULL,
  `std_ili_type_id` int(11) NOT NULL,
  `std_ili_subtype_id` int(11) NOT NULL,
  `ld_dynamic_group1subsubtype_id` int(11) NOT NULL,
  `ld_dynamic_group1subtype_id` int(11) NOT NULL,
  `ld_dynamic_group1type_id` int(11) NOT NULL,
  `ld_dynamic_level_id` int(11) NOT NULL,
  `ld_dynamic_building_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `stroke_selection` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ld_dynamic_3d_location_id`),
  KEY `project_id_idx` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=543110 ;

-- --------------------------------------------------------

--
-- Table structure for table `ld_dynamic_3d_location_coordinates`
--

CREATE TABLE IF NOT EXISTS `ld_dynamic_3d_location_coordinates` (
  `ld_dynamic_3d_location_coordinate_id` int(11) NOT NULL AUTO_INCREMENT,
  `positions` longtext NOT NULL,
  `normals` longtext NOT NULL,
  `maxindices` int(10) unsigned NOT NULL,
  `ld_dynamic_3d_location_id` int(11) NOT NULL,
  PRIMARY KEY (`ld_dynamic_3d_location_coordinate_id`),
  KEY `ld_dynamic_3d_location_id` (`ld_dynamic_3d_location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ld_dynamic_3d_location_specialty`
--

CREATE TABLE IF NOT EXISTS `ld_dynamic_3d_location_specialty` (
  `ld_dynamic_3d_location_specialty_id` int(11) NOT NULL AUTO_INCREMENT,
  `dfm_specialty_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `ld_dynamic_3d_location_id` int(11) NOT NULL,
  PRIMARY KEY (`ld_dynamic_3d_location_specialty_id`),
  KEY `dfm_specialty_id` (`dfm_specialty_id`,`ld_dynamic_3d_location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ld_dynamic_3d_location_text`
--

CREATE TABLE IF NOT EXISTS `ld_dynamic_3d_location_text` (
  `ld_dynamic_3d_location_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `x` varchar(20) NOT NULL,
  `y` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `fill` varchar(20) NOT NULL,
  `font_size` varchar(255) NOT NULL,
  `ld_dynamic_3d_location_id` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`ld_dynamic_3d_location_text_id`),
  KEY `ld_dynamic_3d_location_id_idx` (`ld_dynamic_3d_location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ld_dynamic_buildings`
--

CREATE TABLE IF NOT EXISTS `ld_dynamic_buildings` (
  `ld_dynamic_building_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `project_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `is_default` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`ld_dynamic_building_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=80 ;

-- --------------------------------------------------------

--
-- Table structure for table `ld_dynamic_group1subsubtypes`
--

CREATE TABLE IF NOT EXISTS `ld_dynamic_group1subsubtypes` (
  `ld_dynamic_group1subsubtype_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `ld_dynamic_group1subtype_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`ld_dynamic_group1subsubtype_id`),
  KEY `ld_dynamic_group1subtype_id` (`ld_dynamic_group1subtype_id`,`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

-- --------------------------------------------------------

--
-- Table structure for table `ld_dynamic_group1subtypes`
--

CREATE TABLE IF NOT EXISTS `ld_dynamic_group1subtypes` (
  `ld_dynamic_group1subtype_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `ld_dynamic_group1type_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`ld_dynamic_group1subtype_id`),
  KEY `ld_dynamic_group1type_id` (`ld_dynamic_group1type_id`,`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=510 ;

-- --------------------------------------------------------

--
-- Table structure for table `ld_dynamic_group1types`
--

CREATE TABLE IF NOT EXISTS `ld_dynamic_group1types` (
  `ld_dynamic_group1type_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `ld_dynamic_level_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`ld_dynamic_group1type_id`),
  KEY `ld_dynamic_level_id` (`ld_dynamic_level_id`,`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=141 ;

-- --------------------------------------------------------

--
-- Table structure for table `ld_dynamic_levels`
--

CREATE TABLE IF NOT EXISTS `ld_dynamic_levels` (
  `ld_dynamic_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `ld_dynamic_building_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `sort_order` tinyint(11) NOT NULL,
  PRIMARY KEY (`ld_dynamic_level_id`),
  KEY `ld_dynamic_building_id` (`ld_dynamic_building_id`,`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=244 ;

-- --------------------------------------------------------

--
-- Table structure for table `ld_dynamic_locations`
--

CREATE TABLE IF NOT EXISTS `ld_dynamic_locations` (
  `ld_dynamic_location_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `radius` double NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `file_name` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `x` int(4) NOT NULL,
  `y` int(4) NOT NULL,
  `w` int(4) NOT NULL,
  `h` int(4) NOT NULL,
  `path` text,
  `stroke` varchar(20) NOT NULL,
  `stroke_selection` int(1) NOT NULL DEFAULT '0',
  `std_ili_type_id` int(11) NOT NULL,
  `std_ili_subtype_id` int(11) NOT NULL,
  `ld_dynamic_group1subsubtype_id` int(11) NOT NULL,
  `ld_dynamic_group1subtype_id` int(11) NOT NULL,
  `ld_dynamic_group1type_id` int(11) NOT NULL,
  `ld_dynamic_level_id` int(11) NOT NULL,
  `ld_dynamic_building_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`ld_dynamic_location_id`),
  KEY `project_id_idx` (`project_id`),
  KEY `std_ili_type_id` (`std_ili_type_id`),
  KEY `std_ili_subtype_id` (`std_ili_subtype_id`),
  KEY `std_ili_subtype_id_2` (`std_ili_subtype_id`),
  KEY `ld_dynamic_group1subsubtype_id` (`ld_dynamic_group1subsubtype_id`),
  KEY `ld_dynamic_group1subtype_id` (`ld_dynamic_group1subtype_id`),
  KEY `ld_dynamic_group1type_id` (`ld_dynamic_group1type_id`),
  KEY `ld_dynamic_level_id` (`ld_dynamic_level_id`),
  KEY `ld_dynamic_building_id` (`ld_dynamic_building_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3486242 ;

-- --------------------------------------------------------

--
-- Table structure for table `ld_dynamic_location_coordinates`
--

CREATE TABLE IF NOT EXISTS `ld_dynamic_location_coordinates` (
  `ld_dynamic_location_coordinate_id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `width` int(4) DEFAULT NULL,
  `height` int(4) DEFAULT NULL,
  `type` varchar(25) NOT NULL,
  `radius` double NOT NULL,
  `bulge` varchar(20) NOT NULL,
  `start_angle` int(4) NOT NULL,
  `end_angle` int(4) NOT NULL,
  `path` text,
  `ld_dynamic_location_id` int(11) NOT NULL,
  PRIMARY KEY (`ld_dynamic_location_coordinate_id`),
  KEY `ld_dynamic_location_id` (`ld_dynamic_location_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6569189 ;

-- --------------------------------------------------------

--
-- Table structure for table `ld_dynamic_location_details`
--

CREATE TABLE IF NOT EXISTS `ld_dynamic_location_details` (
  `ld_dynamic_location_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_number` int(11) NOT NULL,
  `location_name` varchar(255) NOT NULL,
  `misc_titles` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `std_ili_type_id` int(11) NOT NULL,
  `ld_dynamic_group1subtype_id` int(11) NOT NULL,
  `ld_dynamic_group1type_id` int(11) NOT NULL,
  `ld_dynamic_level_id` int(11) NOT NULL,
  `ld_dynamic_building_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`ld_dynamic_location_detail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ld_dynamic_location_specialty`
--

CREATE TABLE IF NOT EXISTS `ld_dynamic_location_specialty` (
  `ld_dynamic_location_specialty_id` int(11) NOT NULL AUTO_INCREMENT,
  `dfm_specialty_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `ld_dynamic_location_id` int(11) NOT NULL,
  PRIMARY KEY (`ld_dynamic_location_specialty_id`),
  KEY `dfm_specialty_id` (`dfm_specialty_id`,`ld_dynamic_location_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38317 ;

-- --------------------------------------------------------

--
-- Table structure for table `ld_dynamic_location_text`
--

CREATE TABLE IF NOT EXISTS `ld_dynamic_location_text` (
  `ld_dynamic_location_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `title` varchar(255) NOT NULL,
  `fill` varchar(20) NOT NULL,
  `font_size` int(11) NOT NULL,
  `ld_dynamic_location_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ld_dynamic_location_text_id`),
  KEY `ld_dynamic_location_id_idx` (`ld_dynamic_location_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49485 ;

-- --------------------------------------------------------

--
-- Table structure for table `ld_plan_gridlines`
--

CREATE TABLE IF NOT EXISTS `ld_plan_gridlines` (
  `ld_plan_gridline_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `type` enum('X-HORIZONTAL','Y-VERTICAL') NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`ld_plan_gridline_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ld_plan_sheets`
--

CREATE TABLE IF NOT EXISTS `ld_plan_sheets` (
  `ld_plan_sheet_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `project_authority_substructure_id` int(11) NOT NULL,
  `dfm_specialty_id` int(11) NOT NULL,
  `page_id` varchar(255) NOT NULL,
  PRIMARY KEY (`ld_plan_sheet_id`),
  KEY `project_id` (`project_id`,`project_authority_substructure_id`,`dfm_specialty_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `leaveout_coordinates`
--

CREATE TABLE IF NOT EXISTS `leaveout_coordinates` (
  `leaveout_coordinate_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `type` varchar(20) NOT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `radius` int(11) DEFAULT NULL,
  `path` text,
  `fill` varchar(20) NOT NULL,
  `stroke` varchar(20) NOT NULL,
  `stroke_width` float NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'New',
  `ig_dynamic_location_sheet_id` int(11) NOT NULL,
  `ig_group_sheet_id` int(11) NOT NULL,
  `inspection_request_id` int(11) NOT NULL,
  `new_inspection_request_id` int(11) NOT NULL,
  `ig_tool_2d_location_record_id` int(11) NOT NULL,
  `leaveout_type` varchar(50) NOT NULL,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`leaveout_coordinate_id`),
  KEY `ig_dynamic_location_sheet_id` (`ig_dynamic_location_sheet_id`,`ig_group_sheet_id`,`inspection_request_id`,`ig_tool_2d_location_record_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1869 ;

-- --------------------------------------------------------

--
-- Table structure for table `license`
--

CREATE TABLE IF NOT EXISTS `license` (
  `license_id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(50) NOT NULL,
  `issuing_authority` varchar(255) NOT NULL,
  `speciality` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `class` varchar(50) NOT NULL,
  `sub_class` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`license_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=133 ;

-- --------------------------------------------------------

--
-- Table structure for table `link_inspection_requests`
--

CREATE TABLE IF NOT EXISTS `link_inspection_requests` (
  `link_inspection_request_id` int(11) NOT NULL AUTO_INCREMENT,
  `original_inspection_request_id` int(11) NOT NULL,
  `inspection_request_id` int(11) NOT NULL,
  PRIMARY KEY (`link_inspection_request_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `log_actions`
--

CREATE TABLE IF NOT EXISTS `log_actions` (
  `log_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`log_action_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `markers`
--

CREATE TABLE IF NOT EXISTS `markers` (
  `marker_id` int(11) NOT NULL AUTO_INCREMENT,
  `scale_x` float NOT NULL,
  `scale_y` float NOT NULL,
  `path` text NOT NULL,
  `ig_group_sheet_id` int(11) NOT NULL,
  PRIMARY KEY (`marker_id`),
  KEY `ig_group_sheet_id` (`ig_group_sheet_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72 ;

-- --------------------------------------------------------

--
-- Table structure for table `masterformat_company`
--

CREATE TABLE IF NOT EXISTS `masterformat_company` (
  `company_masterformat_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `masterformat_id` int(11) unsigned NOT NULL,
  `project_id` int(11) NOT NULL,
  `year` varchar(4) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`company_masterformat_id`),
  KEY `masterformat_id` (`masterformat_id`,`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=507 ;

-- --------------------------------------------------------

--
-- Table structure for table `masterformat_counts`
--

CREATE TABLE IF NOT EXISTS `masterformat_counts` (
  `masterformat_id` int(11) NOT NULL,
  `submittal_count` int(11) DEFAULT '0',
  PRIMARY KEY (`masterformat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `masterformat_inspections`
--

CREATE TABLE IF NOT EXISTS `masterformat_inspections` (
  `masterformat_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`masterformat_id`,`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `masterformat_v1`
--

CREATE TABLE IF NOT EXISTS `masterformat_v1` (
  `masterformat_id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(100) NOT NULL,
  `level1` varchar(15) NOT NULL,
  `title` varchar(255) NOT NULL,
  `year` int(11) NOT NULL DEFAULT '1995',
  PRIMARY KEY (`masterformat_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2761 ;

-- --------------------------------------------------------

--
-- Table structure for table `masterformat_v2`
--

CREATE TABLE IF NOT EXISTS `masterformat_v2` (
  `masterformat_id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(100) NOT NULL,
  `level1` varchar(15) NOT NULL,
  `level2` varchar(15) NOT NULL,
  `level3` varchar(15) NOT NULL,
  `level4` varchar(15) NOT NULL,
  `title` varchar(255) NOT NULL,
  `year` int(11) NOT NULL DEFAULT '2004',
  PRIMARY KEY (`masterformat_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6740 ;

-- --------------------------------------------------------

--
-- Table structure for table `masterformat_v3`
--

CREATE TABLE IF NOT EXISTS `masterformat_v3` (
  `masterformat_id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(100) NOT NULL,
  `level1` varchar(15) NOT NULL,
  `level2` varchar(15) NOT NULL,
  `level3` varchar(15) NOT NULL,
  `level4` varchar(15) NOT NULL,
  `title` varchar(255) NOT NULL,
  `year` int(11) NOT NULL DEFAULT '2010',
  `map_id` int(11) NOT NULL,
  `map_version` enum('v1','v2') NOT NULL,
  PRIMARY KEY (`masterformat_id`),
  KEY `map_id` (`map_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7619 ;

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE IF NOT EXISTS `material` (
  `material_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`material_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) NOT NULL,
  `module_title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `status` int(1) NOT NULL,
  `project_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `module_type` varchar(50) NOT NULL DEFAULT 'Main',
  PRIMARY KEY (`module_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=121 ;

-- --------------------------------------------------------

--
-- Table structure for table `modules_grid_settings`
--

CREATE TABLE IF NOT EXISTS `modules_grid_settings` (
  `module_grid_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `colums` text NOT NULL,
  `page_count` int(11) NOT NULL DEFAULT '50',
  PRIMARY KEY (`module_grid_setting_id`),
  KEY `user_id` (`user_id`,`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1638 ;

-- --------------------------------------------------------

--
-- Table structure for table `observations`
--

CREATE TABLE IF NOT EXISTS `observations` (
  `observation_id` int(11) NOT NULL AUTO_INCREMENT,
  `observation_type_id` int(11) DEFAULT NULL,
  `observation_reason_id` int(11) NOT NULL,
  `observation_level_id` int(11) DEFAULT NULL,
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `inspector_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contractor_status` varchar(100) DEFAULT NULL,
  `qc_status` varchar(100) DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `closing_comments` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `closed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `company_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `closed_by` int(11) NOT NULL,
  `project_authority_substructure_id` int(11) NOT NULL,
  `responsible_company_id` int(11) NOT NULL,
  `due_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `assign_to` int(11) NOT NULL,
  `correction_actions` text NOT NULL,
  PRIMARY KEY (`observation_id`),
  KEY `observation_type_id` (`observation_type_id`,`observation_reason_id`,`observation_level_id`,`company_id`,`type_id`,`project_id`,`created_by`,`project_authority_substructure_id`,`responsible_company_id`,`due_date`,`assign_to`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=742 ;

-- --------------------------------------------------------

--
-- Table structure for table `observation_comments`
--

CREATE TABLE IF NOT EXISTS `observation_comments` (
  `observation_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  `observation_id` int(11) NOT NULL,
  PRIMARY KEY (`observation_comment_id`),
  KEY `observation_id` (`observation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=930 ;

-- --------------------------------------------------------

--
-- Table structure for table `observation_comment_files`
--

CREATE TABLE IF NOT EXISTS `observation_comment_files` (
  `observation_comment_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL,
  `file_type` enum('image','pdf','excel','word','dwg','rvt','dwfx','ifc') NOT NULL DEFAULT 'image',
  `observation_comment_id` int(11) NOT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `file_thumb_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`observation_comment_file_id`),
  KEY `observation_comment_id` (`observation_comment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=233 ;

-- --------------------------------------------------------

--
-- Table structure for table `observation_files`
--

CREATE TABLE IF NOT EXISTS `observation_files` (
  `observation_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_type` enum('image','pdf','excel','word','dwg','rvt','dwfx','ifc') COLLATE utf8_unicode_ci DEFAULT 'image',
  `observation_id` int(11) DEFAULT NULL,
  `file_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_thumb_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`observation_file_id`),
  KEY `observation_id` (`observation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=799 ;

-- --------------------------------------------------------

--
-- Table structure for table `observation_filters`
--

CREATE TABLE IF NOT EXISTS `observation_filters` (
  `observation_filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `default` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`observation_filter_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `observation_levels`
--

CREATE TABLE IF NOT EXISTS `observation_levels` (
  `observation_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`observation_level_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `observation_reasons`
--

CREATE TABLE IF NOT EXISTS `observation_reasons` (
  `observation_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`observation_reason_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `observation_types`
--

CREATE TABLE IF NOT EXISTS `observation_types` (
  `observation_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`observation_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `module_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `module_id` (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=115 ;

-- --------------------------------------------------------

--
-- Table structure for table `production_tracker`
--

CREATE TABLE IF NOT EXISTS `production_tracker` (
  `production_tracker_id` int(11) NOT NULL AUTO_INCREMENT,
  `man_count` float NOT NULL,
  `hours` float NOT NULL,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`production_tracker_id`),
  KEY `user_id` (`user_id`,`company_id`,`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

-- --------------------------------------------------------

--
-- Table structure for table `production_tracker_estimates`
--

CREATE TABLE IF NOT EXISTS `production_tracker_estimates` (
  `production_tracker_estimate_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `std_ili_type_id` int(11) NOT NULL,
  `ili_custom_title` varchar(100) NOT NULL,
  `est_qty` int(11) NOT NULL,
  `est_hours` int(11) NOT NULL,
  `est_manpower` int(11) NOT NULL,
  `daily_production` float NOT NULL,
  PRIMARY KEY (`production_tracker_estimate_id`),
  KEY `project_id` (`project_id`,`company_id`,`std_ili_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `production_tracker_locations`
--

CREATE TABLE IF NOT EXISTS `production_tracker_locations` (
  `production_tracker_location_id` int(11) NOT NULL AUTO_INCREMENT,
  `hours` float NOT NULL,
  `man_count` float NOT NULL,
  `ig_dynamic_location_sheet_id` int(11) NOT NULL,
  `ig_group_sheet_id` int(11) NOT NULL,
  `production_tracker_id` int(11) NOT NULL,
  PRIMARY KEY (`production_tracker_location_id`),
  KEY `production_tracker_id` (`production_tracker_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=188 ;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `facility_name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `project_number` varchar(100) NOT NULL,
  `facility_id` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `postcode` varchar(100) NOT NULL,
  `timezone` varchar(50) NOT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `locale_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `project_inspection_number` int(11) NOT NULL DEFAULT '1',
  `project_submittal_number` varchar(50) NOT NULL,
  `project_submittal_draft` int(11) NOT NULL,
  `project_submittal_openid` int(11) NOT NULL,
  `project_issue_number` int(11) NOT NULL,
  `project_observation_number` int(11) NOT NULL,
  `masterformat` varchar(4) DEFAULT NULL,
  `specsection_submittal_number` int(11) NOT NULL,
  `inspection_spec_section_type` tinyint(1) NOT NULL DEFAULT '0',
  `project_punchlist_number` int(11) NOT NULL DEFAULT '1',
  `export_email_addresses` text,
  `rfi_oshpd` enum('Yes','No') NOT NULL DEFAULT 'No',
  `project_bim_oid` int(11) NOT NULL,
  `project_daily_report_issues_number` int(11) NOT NULL,
  `rfi_due_date_duration` int(11) NOT NULL DEFAULT '5',
  `project_co_number` int(11) unsigned NOT NULL DEFAULT '0',
  `project_cxm_exception_number` int(11) unsigned NOT NULL,
  `project_rfi_number` int(11) NOT NULL DEFAULT '0',
  `project_rfi_inquiry_number` int(11) NOT NULL DEFAULT '0',
  `rfi_champion_user` enum('Yes','No') NOT NULL DEFAULT 'No',
  `project_cxm_issue_number` int(11) NOT NULL DEFAULT '0',
  `project_cxm_em_number` int(11) DEFAULT NULL,
  `rfi_posted` enum('Yes','No') NOT NULL DEFAULT 'No',
  `project_hash` varchar(10) NOT NULL,
  `project_cxm_report_number` int(11) NOT NULL,
  `project_time_and_material_number` int(11) NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=104 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_authorities`
--

CREATE TABLE IF NOT EXISTS `project_authorities` (
  `project_authority_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `jurisdiction_authority_id` int(11) NOT NULL,
  `jurisdiction_program_id` int(11) NOT NULL,
  PRIMARY KEY (`project_authority_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=118 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_authority_substructure`
--

CREATE TABLE IF NOT EXISTS `project_authority_substructure` (
  `project_authority_substructure_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `jurisdiction_program_id` int(11) NOT NULL,
  `jurisdiction_substructure_id` int(11) NOT NULL,
  `substructure_num` int(11) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `starting_IR` int(11) NOT NULL,
  `current_IR` int(11) NOT NULL,
  `starting_Submittal` int(11) NOT NULL,
  `current_Submittal` int(11) NOT NULL,
  `rfi_group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `submittal_group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `wbs_id` int(11) unsigned DEFAULT NULL,
  `current_rfi` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_authority_substructure_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=320 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_companies`
--

CREATE TABLE IF NOT EXISTS `project_companies` (
  `project_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `status` enum('active','pending-delete','deleted') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`project_id`,`company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_company_checklists`
--

CREATE TABLE IF NOT EXISTS `project_company_checklists` (
  `project_company_checklist_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `jurisdiction_checklist_id` int(11) NOT NULL,
  PRIMARY KEY (`project_company_checklist_id`),
  KEY `project_id` (`project_id`,`company_id`,`jurisdiction_checklist_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=599 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_company_form`
--

CREATE TABLE IF NOT EXISTS `project_company_form` (
  `project_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `custom_form_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`,`company_id`,`custom_form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_company_jurisdiction_tio`
--

CREATE TABLE IF NOT EXISTS `project_company_jurisdiction_tio` (
  `project_company_jurisdiction_tio_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `tio_id` int(11) NOT NULL,
  PRIMARY KEY (`project_company_jurisdiction_tio_id`),
  KEY `tio_id` (`tio_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_company_specialty`
--

CREATE TABLE IF NOT EXISTS `project_company_specialty` (
  `project_company_specialty_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) unsigned NOT NULL,
  `company_id` int(11) unsigned NOT NULL,
  `specialty_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`project_company_specialty_id`),
  KEY `project_id` (`project_id`,`company_id`,`specialty_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3388 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_custom_specsection`
--

CREATE TABLE IF NOT EXISTS `project_custom_specsection` (
  `title_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_masterformat_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `custom_title` varchar(255) NOT NULL,
  PRIMARY KEY (`title_id`),
  KEY `project_masterformat_id` (`project_masterformat_id`,`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_images`
--

CREATE TABLE IF NOT EXISTS `project_images` (
  `project_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_image_setting_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `image_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`project_image_id`),
  KEY `project_image_setting_id` (`project_image_setting_id`,`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_image_settings`
--

CREATE TABLE IF NOT EXISTS `project_image_settings` (
  `project_image_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `width` varchar(50) NOT NULL,
  `height` varchar(50) NOT NULL,
  PRIMARY KEY (`project_image_setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_inspection_types`
--

CREATE TABLE IF NOT EXISTS `project_inspection_types` (
  `project_inspection_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`project_inspection_type_id`),
  KEY `project_id` (`project_id`,`type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5918 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_masterformat`
--

CREATE TABLE IF NOT EXISTS `project_masterformat` (
  `project_masterformat_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `masterformat_id` int(11) unsigned NOT NULL,
  `project_id` int(11) NOT NULL,
  `year` varchar(4) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`project_masterformat_id`),
  KEY `masterformat_id` (`masterformat_id`,`project_id`,`company_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9584 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_messages`
--

CREATE TABLE IF NOT EXISTS `project_messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `type` enum('Message','Memo','Notice','Notification') DEFAULT NULL,
  `priority` enum('Low','Normal','Urgent','Critical') DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`message_id`),
  KEY `project_id` (`project_id`,`from_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55442 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_message_file`
--

CREATE TABLE IF NOT EXISTS `project_message_file` (
  `message_id` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`,`filename`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_message_user`
--

CREATE TABLE IF NOT EXISTS `project_message_user` (
  `message_id` int(11) NOT NULL DEFAULT '0',
  `to_id` int(11) NOT NULL DEFAULT '0',
  `status` enum('New','Opened','Replied') NOT NULL DEFAULT 'New',
  `opened_date` date DEFAULT NULL,
  `inbox_status` enum('active','pending-delete','deleted') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`message_id`,`to_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_modules`
--

CREATE TABLE IF NOT EXISTS `project_modules` (
  `project_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'Main',
  `edit_duration` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`project_module_id`),
  KEY `project_id` (`project_id`,`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1351 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_photo_types`
--

CREATE TABLE IF NOT EXISTS `project_photo_types` (
  `project_photo_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`project_photo_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_role`
--

CREATE TABLE IF NOT EXISTS `project_role` (
  `role_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Roles' AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_role_user`
--

CREATE TABLE IF NOT EXISTS `project_role_user` (
  `project_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`project_id`,`role_id`,`user_id`),
  KEY `FK_ROLE_USER_USER_ID` (`user_id`),
  KEY `FK_ROLE_USER_ROLE_ID` (`role_id`),
  KEY `FK_ROLE_USER_PROJECT_ID` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Users to Projects Assignment data';

-- --------------------------------------------------------

--
-- Table structure for table `project_substructure_checklist`
--

CREATE TABLE IF NOT EXISTS `project_substructure_checklist` (
  `project_authority_substructure_id` int(11) NOT NULL,
  `jurisdiction_checklist_id` int(11) NOT NULL,
  `responsible_user_id_one` int(11) NOT NULL,
  `responsible_user_id_two` int(11) NOT NULL,
  `responsible_user_id_three` int(11) NOT NULL,
  `project_inc_tio_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`project_authority_substructure_id`,`jurisdiction_checklist_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_substructure_master_formats`
--

CREATE TABLE IF NOT EXISTS `project_substructure_master_formats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `project_inc_no` int(11) NOT NULL,
  `master_form_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`master_form_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6084 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_wbs`
--

CREATE TABLE IF NOT EXISTS `project_wbs` (
  `wbs_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `project_id` int(11) unsigned NOT NULL,
  `is_default` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  PRIMARY KEY (`wbs_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=122 ;

-- --------------------------------------------------------

--
-- Table structure for table `proliance_documents`
--

CREATE TABLE IF NOT EXISTS `proliance_documents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `inspection_request_id` int(11) NOT NULL,
  `guid` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`inspection_request_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1074 ;

-- --------------------------------------------------------

--
-- Table structure for table `proliance_projects`
--

CREATE TABLE IF NOT EXISTS `proliance_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `proliance_organization` varchar(255) NOT NULL,
  `proliance_program` varchar(255) NOT NULL,
  `proliance_project` varchar(255) NOT NULL,
  `activate_integration` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `proliance_project_users`
--

CREATE TABLE IF NOT EXISTS `proliance_project_users` (
  `proliance_project_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `proliance_user_id` int(11) NOT NULL,
  PRIMARY KEY (`proliance_project_user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=144 ;

-- --------------------------------------------------------

--
-- Table structure for table `proliance_users`
--

CREATE TABLE IF NOT EXISTS `proliance_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proliance_username` varchar(50) DEFAULT NULL,
  `proliance_password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=134 ;

-- --------------------------------------------------------

--
-- Table structure for table `proliance_user_doctypecolumns`
--

CREATE TABLE IF NOT EXISTS `proliance_user_doctypecolumns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `doc_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `columns` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `punchlist_comments`
--

CREATE TABLE IF NOT EXISTS `punchlist_comments` (
  `punchlist_comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) unsigned NOT NULL,
  `punchlist_record_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`punchlist_comment_id`),
  KEY `punchlist_record_id` (`punchlist_record_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=196 ;

-- --------------------------------------------------------

--
-- Table structure for table `punchlist_common_items`
--

CREATE TABLE IF NOT EXISTS `punchlist_common_items` (
  `punchlist_common_item_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `specialty_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`punchlist_common_item_id`),
  KEY `specialty_id` (`specialty_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1339 ;

-- --------------------------------------------------------

--
-- Table structure for table `punchlist_filters`
--

CREATE TABLE IF NOT EXISTS `punchlist_filters` (
  `punchlist_filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `default` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`punchlist_filter_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `punchlist_history`
--

CREATE TABLE IF NOT EXISTS `punchlist_history` (
  `punchlist_history_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `punchlist_record_id` int(11) unsigned NOT NULL,
  `action_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` varchar(100) NOT NULL,
  `action_by` int(11) unsigned NOT NULL,
  `comment` text,
  `punchlist_record_company_id` int(11) NOT NULL,
  PRIMARY KEY (`punchlist_history_id`),
  KEY `punchlist_record_id` (`punchlist_record_id`),
  KEY `action_by` (`action_by`),
  KEY `punchlist_record_company_id` (`punchlist_record_company_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2408 ;

-- --------------------------------------------------------

--
-- Table structure for table `punchlist_records`
--

CREATE TABLE IF NOT EXISTS `punchlist_records` (
  `punchlist_record_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `priority` enum('High','Medium','Low') NOT NULL DEFAULT 'Low',
  `type_level_1` int(11) unsigned DEFAULT NULL,
  `type_level_2` int(11) unsigned DEFAULT NULL,
  `type_level_3` int(11) unsigned DEFAULT NULL,
  `type_level_4` int(11) unsigned DEFAULT NULL,
  `module_record_id` int(11) unsigned DEFAULT NULL,
  `status` enum('REVIEW','CLOSED','OPEN','DISPUTE') NOT NULL DEFAULT 'OPEN',
  `rp_status` enum('RESOLVED','WAITING For RESPONSE','NOTIFIED') NOT NULL DEFAULT 'NOTIFIED',
  `project_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `ig_sheet_id` int(11) unsigned NOT NULL DEFAULT '0',
  `closed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reviewed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `assign_to` int(11) unsigned DEFAULT NULL,
  `assign_to_company` int(11) unsigned DEFAULT NULL,
  `permit` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `punchlist_record_status_id` int(11) NOT NULL,
  PRIMARY KEY (`punchlist_record_id`),
  KEY `module_record_id` (`module_record_id`,`project_id`,`company_id`,`ig_sheet_id`,`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1704 ;

-- --------------------------------------------------------

--
-- Table structure for table `punchlist_record_circles`
--

CREATE TABLE IF NOT EXISTS `punchlist_record_circles` (
  `punchlist_record_circle_id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `radius` float NOT NULL,
  `punchlist_record_id` int(11) NOT NULL,
  PRIMARY KEY (`punchlist_record_circle_id`),
  KEY `punchlist_record_id` (`punchlist_record_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=540 ;

-- --------------------------------------------------------

--
-- Table structure for table `punchlist_record_companies`
--

CREATE TABLE IF NOT EXISTS `punchlist_record_companies` (
  `punchlist_record_company_id` int(11) NOT NULL AUTO_INCREMENT,
  `punchlist_record_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `punchlist_record_status_id` int(11) NOT NULL,
  `order_field` int(4) NOT NULL,
  `open_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `close_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pl_type` varchar(20) NOT NULL,
  `type_code` varchar(20) NOT NULL,
  PRIMARY KEY (`punchlist_record_company_id`),
  KEY `punchlist_record_id` (`punchlist_record_id`,`company_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=570 ;

-- --------------------------------------------------------

--
-- Table structure for table `punchlist_record_statuses`
--

CREATE TABLE IF NOT EXISTS `punchlist_record_statuses` (
  `punchlist_record_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `std_color_id` int(11) NOT NULL,
  PRIMARY KEY (`punchlist_record_status_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `punchlist_uploaded_comment_files`
--

CREATE TABLE IF NOT EXISTS `punchlist_uploaded_comment_files` (
  `punchlist_uploaded_comment_file_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL,
  `file_type` enum('image','pdf') NOT NULL DEFAULT 'image',
  `punchlist_comment_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `file_url` varchar(255) DEFAULT NULL,
  `file_thumb_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`punchlist_uploaded_comment_file_id`),
  KEY `punchlist_comment_id` (`punchlist_comment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Table structure for table `punchlist_uploaded_files`
--

CREATE TABLE IF NOT EXISTS `punchlist_uploaded_files` (
  `punchlist_uploaded_file_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL,
  `file_type` enum('image','pdf') NOT NULL DEFAULT 'image',
  `punchlist_record_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `file_url` varchar(255) DEFAULT NULL,
  `file_thumb_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`punchlist_uploaded_file_id`),
  KEY `punchlist_record_id` (`punchlist_record_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=108 ;

-- --------------------------------------------------------

--
-- Table structure for table `request_company`
--

CREATE TABLE IF NOT EXISTS `request_company` (
  `request_company_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `contact_first_name` varchar(255) NOT NULL,
  `contact_last_name` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL,
  `requested_by` int(11) NOT NULL,
  `request_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`request_company_id`),
  KEY `project_id` (`project_id`,`requested_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=395 ;

-- --------------------------------------------------------

--
-- Table structure for table `request_users`
--

CREATE TABLE IF NOT EXISTS `request_users` (
  `request_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL,
  `requested_by` int(11) NOT NULL,
  `request_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`request_user_id`),
  KEY `project_id` (`project_id`,`requested_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2340 ;

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE IF NOT EXISTS `resources` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `module_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`resource_id`),
  KEY `module_id` (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_approved_types`
--

CREATE TABLE IF NOT EXISTS `rfi_approved_types` (
  `approved_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` enum('Y','N') CHARACTER SET latin1 NOT NULL,
  `default_value` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`approved_type_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_comments`
--

CREATE TABLE IF NOT EXISTS `rfi_comments` (
  `rfi_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `rfi_comment_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rfi_comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `rfi_item_id` int(11) NOT NULL,
  `rfi_user_id` int(11) NOT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `file_type` varchar(100) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `cloud_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rfi_comment_id`),
  KEY `rfi_item_id` (`rfi_item_id`,`rfi_user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8799 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_concur`
--

CREATE TABLE IF NOT EXISTS `rfi_concur` (
  `concur_id` int(11) NOT NULL AUTO_INCREMENT,
  `rfi_id` int(11) NOT NULL,
  `materially_altered_type` enum('materially_altered','non_materially_altered','N/A') NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `comments` text NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `signed` enum('Yes','No') NOT NULL,
  PRIMARY KEY (`concur_id`),
  KEY `rfi_id` (`rfi_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=369 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_concur_files`
--

CREATE TABLE IF NOT EXISTS `rfi_concur_files` (
  `concur_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `concur_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_type` varchar(100) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `cloud_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`concur_file_id`),
  KEY `concur_id` (`concur_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_concur_history`
--

CREATE TABLE IF NOT EXISTS `rfi_concur_history` (
  `concur_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `concur_id` int(11) NOT NULL,
  `last_created_by` int(11) DEFAULT NULL,
  `old_string` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `changed_by` int(11) DEFAULT NULL,
  `new_string` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `chang_date` datetime NOT NULL,
  PRIMARY KEY (`concur_history_id`),
  KEY `concur_id` (`concur_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_distribution_list`
--

CREATE TABLE IF NOT EXISTS `rfi_distribution_list` (
  `rfi_distlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `rfi_distlist_project_id` int(11) NOT NULL,
  `rfi_distlist_title` varchar(255) NOT NULL,
  `rfi_distlist_users` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rfi_distlist_id`),
  KEY `rfi_distlist_project_id` (`rfi_distlist_project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_edit_history`
--

CREATE TABLE IF NOT EXISTS `rfi_edit_history` (
  `rfi_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `rfi_field_name` varchar(150) NOT NULL,
  `rfi_orignal_value` text NOT NULL,
  `rfi_new_value` text NOT NULL,
  `rfi_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rfi_author` int(11) NOT NULL,
  `rfi_item_id` int(11) NOT NULL,
  `rfi_action_name` varchar(150) NOT NULL,
  PRIMARY KEY (`rfi_transaction_id`),
  KEY `rfi_author` (`rfi_author`,`rfi_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_filters`
--

CREATE TABLE IF NOT EXISTS `rfi_filters` (
  `rfi_filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `default` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `filter_type` enum('Inquiry','RFI') NOT NULL DEFAULT 'RFI',
  PRIMARY KEY (`rfi_filter_id`),
  KEY `user_id` (`user_id`,`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=303 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_final_response`
--

CREATE TABLE IF NOT EXISTS `rfi_final_response` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rfi_id` int(11) unsigned NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cloud_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rfi_id` (`rfi_id`,`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5310 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_history`
--

CREATE TABLE IF NOT EXISTS `rfi_history` (
  `rfi_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `rfi_item_id` int(11) NOT NULL,
  `rfi_history_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `assigned_to` int(11) unsigned DEFAULT NULL,
  `file_type` varchar(100) NOT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `rfi_revision_no` int(11) NOT NULL DEFAULT '0',
  `cloud_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rfi_history_id`),
  KEY `rfi_item_id` (`rfi_item_id`,`user_id`,`assigned_to`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68346 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_impact_option`
--

CREATE TABLE IF NOT EXISTS `rfi_impact_option` (
  `rfi_impact_id` int(11) NOT NULL AUTO_INCREMENT,
  `rfi_impact_title` varchar(255) NOT NULL,
  PRIMARY KEY (`rfi_impact_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_items`
--

CREATE TABLE IF NOT EXISTS `rfi_items` (
  `rfi_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `rfi_item_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rfi_item_updated` datetime NOT NULL,
  `rfi_item_title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `rfi_item_details` text COLLATE utf8_unicode_ci NOT NULL,
  `rfi_item_due_date` date NOT NULL,
  `rfi_item_creator` int(11) NOT NULL,
  `rfi_item_impact_cost` enum('yes','no','maybe','tbd') CHARACTER SET latin1 NOT NULL,
  `rfi_item_impact_schedule` enum('yes','no','maybe','tbd') CHARACTER SET latin1 NOT NULL,
  `rfi_item_stage_id` int(11) NOT NULL,
  `rfi_item_priority` enum('standard','expedite','urgent') CHARACTER SET latin1 NOT NULL DEFAULT 'standard',
  `rfi_item_response_requested` int(11) NOT NULL,
  `rfi_item_trade` int(11) NOT NULL,
  `rfi_item_ref_sub` varchar(255) CHARACTER SET latin1 NOT NULL,
  `rfi_item_ref_spec_section` varchar(255) CHARACTER SET latin1 NOT NULL,
  `rfi_item_ref_drawing` varchar(255) CHARACTER SET latin1 NOT NULL,
  `rfi_item_sent_to` int(11) NOT NULL,
  `rfi_item_cc_to` text CHARACTER SET latin1 NOT NULL,
  `rfi_item_response` text CHARACTER SET latin1 NOT NULL,
  `rfi_project_id` int(11) NOT NULL,
  `rfi_company_id` int(11) NOT NULL,
  `rfi_num` varchar(255) CHARACTER SET latin1 NOT NULL,
  `rfi_sub_structure_id` int(11) DEFAULT NULL,
  `rfi_wbs_id` int(11) unsigned DEFAULT NULL,
  `rfi_group_id` int(10) unsigned NOT NULL,
  `rfi_group_num` int(10) unsigned NOT NULL,
  `rfi_oshpd_id` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `rfi_response_status` enum('Assigned - In Progress','Response Provided','Closed - Final Response','Closed - Confirmed/Acknowledged','Void','Closed - Model Updated') CHARACTER SET latin1 DEFAULT NULL,
  `rfi_status` enum('Draft','Void','Closed','Open','Under Review','Inquiry') CHARACTER SET latin1 NOT NULL,
  `rfi_response_provided` timestamp NULL DEFAULT NULL,
  `dfm_specialty_id` int(11) DEFAULT NULL,
  `rfi_inquiry_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rfi_item_type` enum('Inquiry','RFI') CHARACTER SET latin1 NOT NULL,
  `rfi_revision_no` int(11) NOT NULL DEFAULT '0',
  `cloud_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `building_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `production_area_type` int(11) DEFAULT NULL,
  `production_area` int(11) DEFAULT NULL,
  `rfi_required_by_date` date DEFAULT NULL,
  `root_cause_type` int(11) DEFAULT NULL,
  `root_cause_time` int(11) DEFAULT NULL,
  `root_cause_comments` text COLLATE utf8_unicode_ci,
  `activity_id` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `champion_user` int(11) DEFAULT NULL,
  `rfi_posted` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `project_wise` enum('Yes','No') COLLATE utf8_unicode_ci DEFAULT NULL,
  `plan_table` enum('Yes','No') COLLATE utf8_unicode_ci DEFAULT NULL,
  `rfi_item_closed` datetime NOT NULL,
  PRIMARY KEY (`rfi_item_id`),
  KEY `rfi_item_creator` (`rfi_item_creator`,`rfi_project_id`,`rfi_company_id`,`rfi_item_sent_to`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8974 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_linked_files`
--

CREATE TABLE IF NOT EXISTS `rfi_linked_files` (
  `rfi_linked_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `rfi_item_Id` int(11) NOT NULL,
  `system_tool_id` int(11) NOT NULL,
  `system_tool_record_id` int(11) NOT NULL,
  PRIMARY KEY (`rfi_linked_file_id`),
  KEY `rfi_item_Id` (`rfi_item_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_noon_material_classification`
--

CREATE TABLE IF NOT EXISTS `rfi_noon_material_classification` (
  `noon_material_classification_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(225) NOT NULL,
  `description` text NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`noon_material_classification_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_oshpd_classification`
--

CREATE TABLE IF NOT EXISTS `rfi_oshpd_classification` (
  `rfi_oshpd_classification_id` int(11) NOT NULL AUTO_INCREMENT,
  `rfi_id` int(11) NOT NULL,
  `materially_altered` enum('Y','N') CHARACTER SET latin1 NOT NULL,
  `materially_altered_comments` text,
  `co_required` enum('Y','N') CHARACTER SET latin1 NOT NULL,
  `co_required_comments` text,
  `approved_type` int(11) DEFAULT NULL,
  `approved` enum('Y','N') CHARACTER SET latin1 DEFAULT NULL,
  `user_review_type` varchar(255) NOT NULL,
  `materially_altered_type` varchar(100) DEFAULT NULL,
  `approved_comments` text,
  `due_date` date NOT NULL,
  `noon_material_classification_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rfi_oshpd_classification_id`),
  KEY `rfi_id` (`rfi_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3251 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_priority_option`
--

CREATE TABLE IF NOT EXISTS `rfi_priority_option` (
  `rfi_prio_id` int(11) NOT NULL AUTO_INCREMENT,
  `rfi_prio_title` varchar(255) NOT NULL,
  PRIMARY KEY (`rfi_prio_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_requests`
--

CREATE TABLE IF NOT EXISTS `rfi_requests` (
  `rfi_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `optional` varchar(255) NOT NULL,
  `assigned_to` int(11) NOT NULL,
  `activity` int(11) NOT NULL,
  `task` int(11) NOT NULL,
  `material` int(11) NOT NULL,
  `inspection` int(11) NOT NULL,
  `issue` int(11) NOT NULL,
  `change_order` int(11) NOT NULL,
  `project_drawing` int(11) NOT NULL,
  `project_spec` int(11) NOT NULL,
  `project_code` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`rfi_id`),
  KEY `inspection` (`inspection`,`issue`,`created_by`,`company_id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Collection of RFI' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_requests_files`
--

CREATE TABLE IF NOT EXISTS `rfi_requests_files` (
  `rfi_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `rfi_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  PRIMARY KEY (`rfi_file_id`),
  KEY `rfi_id` (`rfi_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_response_types`
--

CREATE TABLE IF NOT EXISTS `rfi_response_types` (
  `rfi_response_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `rfi_response_title` varchar(255) NOT NULL,
  `rfi_res[ponse_description` text NOT NULL,
  PRIMARY KEY (`rfi_response_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_revision_history`
--

CREATE TABLE IF NOT EXISTS `rfi_revision_history` (
  `revision_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `rfi_id` int(11) NOT NULL,
  `revision_no` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `question` text COLLATE utf8_unicode_ci NOT NULL,
  `final_response` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`revision_history_id`),
  KEY `rfi_id` (`rfi_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_root_cause_time`
--

CREATE TABLE IF NOT EXISTS `rfi_root_cause_time` (
  `rfi_root_cause_time_id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` enum('Yes','No') NOT NULL,
  `time_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rfi_root_cause_time_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_root_cause_type`
--

CREATE TABLE IF NOT EXISTS `rfi_root_cause_type` (
  `rfi_root_cause_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` enum('Yes','No') NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rfi_root_cause_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_stage`
--

CREATE TABLE IF NOT EXISTS `rfi_stage` (
  `stage_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`stage_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_trade`
--

CREATE TABLE IF NOT EXISTS `rfi_trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rfi_item_id` int(11) NOT NULL,
  `dfm_specialty_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rfi_item_id` (`rfi_item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7520 ;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_uploads`
--

CREATE TABLE IF NOT EXISTS `rfi_uploads` (
  `rfi_upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `rfi_item_id` int(11) NOT NULL,
  `rfi_upload_title` varchar(255) NOT NULL,
  `rfi_upload_path` varchar(255) NOT NULL,
  `rfi_upload_file_type` varchar(255) NOT NULL,
  `rfi_filesize` bigint(20) unsigned NOT NULL,
  `rfi_uploaded_by` varchar(255) NOT NULL,
  `cloud_url` varchar(255) DEFAULT NULL,
  `file_thumb_url` varchar(255) DEFAULT NULL,
  `record_type` enum('Record','Final Response') NOT NULL DEFAULT 'Record',
  PRIMARY KEY (`rfi_upload_id`),
  KEY `rfi_item_id` (`rfi_item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10281 ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `inspection_request_stage_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `inspection_request_stage_id` (`inspection_request_stage_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE IF NOT EXISTS `role_permissions` (
  `role_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`resource_id`,`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role_stages`
--

CREATE TABLE IF NOT EXISTS `role_stages` (
  `role_id` int(11) NOT NULL,
  `inspection_request_stage_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`inspection_request_stage_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shorturls`
--

CREATE TABLE IF NOT EXISTS `shorturls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `originalurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE IF NOT EXISTS `states` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `std_colors`
--

CREATE TABLE IF NOT EXISTS `std_colors` (
  `std_color_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(75) DEFAULT NULL,
  `hex_name` varchar(75) DEFAULT NULL,
  `hex_value` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`std_color_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=62 ;

-- --------------------------------------------------------

--
-- Table structure for table `std_ili_subtypes`
--

CREATE TABLE IF NOT EXISTS `std_ili_subtypes` (
  `std_ili_subtype_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `std_ili_type_id` int(11) NOT NULL,
  `std_color_id` int(11) NOT NULL,
  PRIMARY KEY (`std_ili_subtype_id`),
  KEY `std_ili_type_id` (`std_ili_type_id`),
  KEY `std_color_id` (`std_color_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

-- --------------------------------------------------------

--
-- Table structure for table `std_ili_types`
--

CREATE TABLE IF NOT EXISTS `std_ili_types` (
  `std_ili_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `std_color_id` int(11) NOT NULL,
  `selected_color_id` int(11) NOT NULL,
  `stroke_color_id` int(11) NOT NULL,
  PRIMARY KEY (`std_ili_type_id`),
  KEY `selected_color_id` (`selected_color_id`),
  KEY `std_color_id` (`std_color_id`),
  KEY `stroke_color_id` (`stroke_color_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=89 ;

-- --------------------------------------------------------

--
-- Table structure for table `submittals`
--

CREATE TABLE IF NOT EXISTS `submittals` (
  `submittal_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `submittal_code` int(11) unsigned DEFAULT NULL,
  `draft_code` int(11) unsigned DEFAULT NULL,
  `project_draft_code` int(11) DEFAULT NULL,
  `submittal_open_code` int(11) DEFAULT NULL,
  `open_code` int(11) NOT NULL,
  `revision_number` int(11) NOT NULL DEFAULT '1',
  `package_numbering` varchar(50) NOT NULL,
  `submittal_package_name` varchar(255) NOT NULL,
  `submittal_description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `spec_section` varchar(255) NOT NULL,
  `SubStructure` varchar(250) NOT NULL,
  `submittal_wbs_id` int(11) unsigned DEFAULT NULL,
  `sub_spec_section` varchar(255) DEFAULT NULL,
  `contract_number` varchar(255) DEFAULT NULL,
  `cost_code` varchar(255) DEFAULT NULL,
  `submittal_type_id` int(11) unsigned DEFAULT NULL,
  `status_id` int(11) unsigned NOT NULL,
  `primary_reviewer_id` int(11) unsigned NOT NULL,
  `cc_user_id` int(11) unsigned DEFAULT NULL,
  `author_of_record` int(11) NOT NULL,
  `company_id` int(11) unsigned DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `project_id` int(11) unsigned NOT NULL,
  `masterformat_id` int(11) unsigned NOT NULL,
  `year` varchar(4) NOT NULL,
  `date_received` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `date_due` date NOT NULL DEFAULT '0000-00-00',
  `date_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_submittal` date NOT NULL,
  `date_created_draft` date NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `code` varchar(50) NOT NULL,
  `submittal_increment_number` varchar(50) NOT NULL,
  `spec_section_name` varchar(250) NOT NULL,
  `spec_section_id` int(11) NOT NULL,
  `assinged_to` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `package_rev` int(11) NOT NULL,
  `submittal_group_id` int(10) unsigned NOT NULL,
  `submittal_group_num` int(10) unsigned NOT NULL,
  `trade_partner_due_date` date NOT NULL,
  `completion_date` date NOT NULL,
  `submitted_date` date DEFAULT NULL,
  `leed_item` enum('Yes','No') NOT NULL,
  `leed_submitted` enum('Yes','No') NOT NULL,
  `leed_required` enum('Yes','No') NOT NULL DEFAULT 'No',
  `gc_review_date` date NOT NULL,
  `register_flag` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`submittal_id`),
  KEY `primary_reviewer_id` (`primary_reviewer_id`,`author_of_record`,`company_id`,`project_id`,`masterformat_id`,`user_id`,`assinged_to`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6421 ;

-- --------------------------------------------------------

--
-- Table structure for table `submittal_cclist`
--

CREATE TABLE IF NOT EXISTS `submittal_cclist` (
  `submittal_cclist_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `submittal_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`submittal_cclist_id`),
  KEY `submittal_id` (`submittal_id`,`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16180 ;

-- --------------------------------------------------------

--
-- Table structure for table `submittal_comments`
--

CREATE TABLE IF NOT EXISTS `submittal_comments` (
  `submittal_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  `submittal_id` int(11) NOT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`submittal_comment_id`),
  KEY `user_id` (`user_id`,`submittal_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1725 ;

-- --------------------------------------------------------

--
-- Table structure for table `submittal_comment_files`
--

CREATE TABLE IF NOT EXISTS `submittal_comment_files` (
  `submittal_comment_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL,
  `file_type` enum('image','pdf') NOT NULL DEFAULT 'image',
  `submittal_comment_id` int(11) NOT NULL,
  PRIMARY KEY (`submittal_comment_file_id`),
  KEY `submittal_comment_id` (`submittal_comment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=621 ;

-- --------------------------------------------------------

--
-- Table structure for table `submittal_filecomments`
--

CREATE TABLE IF NOT EXISTS `submittal_filecomments` (
  `submittal_filecomment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  `submittal_id` int(11) NOT NULL,
  `submittal_comment_file_id` int(11) NOT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`submittal_filecomment_id`),
  KEY `submittal_id` (`submittal_id`,`submittal_comment_file_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=90 ;

-- --------------------------------------------------------

--
-- Table structure for table `submittal_files`
--

CREATE TABLE IF NOT EXISTS `submittal_files` (
  `submittal_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `file_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_type` enum('image','pdf','CAD') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'image',
  `type` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `version` tinyint(1) NOT NULL,
  `submittal_id` int(11) DEFAULT NULL,
  `file_size` double unsigned DEFAULT NULL,
  PRIMARY KEY (`submittal_file_id`),
  KEY `submittal_id` (`submittal_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4011 ;

-- --------------------------------------------------------

--
-- Table structure for table `submittal_file_status`
--

CREATE TABLE IF NOT EXISTS `submittal_file_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `submittal_file_version`
--

CREATE TABLE IF NOT EXISTS `submittal_file_version` (
  `file_version_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `version_date` datetime NOT NULL,
  `file_size` double NOT NULL,
  `file_status` tinyint(1) NOT NULL,
  `checksum` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`file_version_id`),
  KEY `file_id` (`file_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6091 ;

-- --------------------------------------------------------

--
-- Table structure for table `submittal_filters`
--

CREATE TABLE IF NOT EXISTS `submittal_filters` (
  `submittal_filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `default` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`submittal_filter_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

-- --------------------------------------------------------

--
-- Table structure for table `submittal_history`
--

CREATE TABLE IF NOT EXISTS `submittal_history` (
  `submittal_history_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `submittal_id` int(11) unsigned NOT NULL,
  `action_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` varchar(100) NOT NULL,
  `action_by` int(11) unsigned NOT NULL,
  `comment` text,
  `file_location` varchar(255) DEFAULT NULL,
  `ip_address` varchar(150) NOT NULL,
  `fields_data` text NOT NULL,
  PRIMARY KEY (`submittal_history_id`),
  KEY `submittal_id` (`submittal_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23697 ;

-- --------------------------------------------------------

--
-- Table structure for table `submittal_leed`
--

CREATE TABLE IF NOT EXISTS `submittal_leed` (
  `submittal_leed_id` int(11) NOT NULL AUTO_INCREMENT,
  `submittal_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `manufacturer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `production_name_design` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `div_3_10` enum('no','yes') COLLATE utf8_unicode_ci NOT NULL,
  `cost_provided` enum('','actual','estimated') COLLATE utf8_unicode_ci NOT NULL,
  `cost` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `rapidly_renewable` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `rapidly_renewable_attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `material_recycle` enum('no','yes') COLLATE utf8_unicode_ci NOT NULL,
  `recycle_content_percentage` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `percentage_by_weight` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percentage_by_weight_post_consumer` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `consumer_product_content_attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `steel_product` enum('no','yes') COLLATE utf8_unicode_ci NOT NULL,
  `specify_product` enum('bof','eaf','na') COLLATE utf8_unicode_ci NOT NULL,
  `wood_product` enum('no','yes') COLLATE utf8_unicode_ci NOT NULL,
  `percentage_wood_material_assembly` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `percentage_wood_material_assembly_attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `wood_amount_with_fsc_certification` enum('0','FSC_100','FSC_Mixed','FSC_Mixed_NN') COLLATE utf8_unicode_ci NOT NULL,
  `fsc_chain_custody` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fsc_chain_custody_attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `weather_proofing_system` enum('no','yes') COLLATE utf8_unicode_ci NOT NULL,
  `weather_proof` enum('no','yes') COLLATE utf8_unicode_ci NOT NULL,
  `adhesive_sealant` int(11) NOT NULL,
  `adhesive_voc_content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adhesive_voc_content_attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `paint_coating` int(11) NOT NULL,
  `paint_coating_content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `paint_coating_attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `carpet_product` enum('green','na') COLLATE utf8_unicode_ci NOT NULL,
  `carpet_product_attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_composit` enum('nourea','na') COLLATE utf8_unicode_ci NOT NULL,
  `floorscore_product_attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `composite_product_attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project_manufacturing` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project_manufacturing_attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project_material_source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project_material_source_attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `regional_product` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `distance_project_manufacturing` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `distance_project_manufacturing_attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `distance_project_material_source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `distance_project_material_source_attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `laminate_adhesive` enum('no','yes') COLLATE utf8_unicode_ci NOT NULL,
  `ure_formaldehyde_free_attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`submittal_leed_id`),
  KEY `submittal_id` (`submittal_id`,`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4129 ;

-- --------------------------------------------------------

--
-- Table structure for table `submittal_packagenumber_counts`
--

CREATE TABLE IF NOT EXISTS `submittal_packagenumber_counts` (
  `masterformat_id` int(11) NOT NULL,
  `Substructure_id` int(11) NOT NULL,
  `submittal_count` int(11) DEFAULT '0',
  PRIMARY KEY (`masterformat_id`,`Substructure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `submittal_reviewers`
--

CREATE TABLE IF NOT EXISTS `submittal_reviewers` (
  `submittal_reviewer_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `submittal_id` int(11) unsigned NOT NULL,
  `reviewer_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`submittal_reviewer_id`),
  KEY `submittal_id` (`submittal_id`,`reviewer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10457 ;

-- --------------------------------------------------------

--
-- Table structure for table `submittal_reviewer_history`
--

CREATE TABLE IF NOT EXISTS `submittal_reviewer_history` (
  `reviewer_history_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `submittal_id` int(11) unsigned NOT NULL,
  `action_by` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `comment` text,
  `action_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reviewer_history_id`),
  KEY `submittal_id` (`submittal_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3085 ;

-- --------------------------------------------------------

--
-- Table structure for table `submittal_schedule_setting`
--

CREATE TABLE IF NOT EXISTS `submittal_schedule_setting` (
  `schedule_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `schedule_available` varchar(10) DEFAULT NULL,
  `schedule_delay_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `schedule_delay_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `holidays` varchar(100) NOT NULL,
  `us_holidays` tinyint(1) NOT NULL,
  `default_gc_user` int(11) NOT NULL,
  PRIMARY KEY (`schedule_setting_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Table structure for table `submittal_status`
--

CREATE TABLE IF NOT EXISTS `submittal_status` (
  `submittal_status_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `submittal_status_title` varchar(255) NOT NULL,
  `submittal_status_description` text,
  `status_type` enum('Neutral','Good','Bad') NOT NULL,
  PRIMARY KEY (`submittal_status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for table `submittal_types`
--

CREATE TABLE IF NOT EXISTS `submittal_types` (
  `submittal_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `submittal_type_title` varchar(255) NOT NULL,
  `submittal_type_description` text,
  PRIMARY KEY (`submittal_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `system_log`
--

CREATE TABLE IF NOT EXISTS `system_log` (
  `system_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `log_action_id` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `action_detail` text NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`system_log_id`),
  KEY `user_id` (`user_id`,`log_action_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=821 ;

-- --------------------------------------------------------

--
-- Table structure for table `temp_445454545_juris_ids`
--

CREATE TABLE IF NOT EXISTS `temp_445454545_juris_ids` (
  `inspection_request_relationship_id` int(11) NOT NULL DEFAULT '0',
  `ld_dynamic_building_id` int(11) NOT NULL DEFAULT '0',
  `ld_dynamic_level_id` int(11) NOT NULL DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `gc_user_id` int(11) DEFAULT NULL,
  `jurisdiction_user_id` int(11) DEFAULT NULL,
  `ior_user_id` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `temp_445454545_juris_ids_new`
--

CREATE TABLE IF NOT EXISTS `temp_445454545_juris_ids_new` (
  `inspection_request_relationship_id` int(11) NOT NULL DEFAULT '0',
  `ld_dynamic_building_id` int(11) NOT NULL DEFAULT '0',
  `ld_dynamic_level_id` int(11) NOT NULL DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `gc_user_id` int(11) DEFAULT NULL,
  `jurisdiction_user_id` int(11) DEFAULT NULL,
  `ior_user_id` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE IF NOT EXISTS `timezones` (
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `time_and_material`
--

CREATE TABLE IF NOT EXISTS `time_and_material` (
  `time_and_material_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `ci` varchar(100) NOT NULL,
  `noc` varchar(100) NOT NULL,
  `company_id` int(11) NOT NULL,
  `description` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `report_date` date NOT NULL,
  `sub_ticket_number` varchar(12) DEFAULT NULL,
  `additional_ticket_number` varchar(12) DEFAULT NULL,
  `sub_contractor_status` enum('Draft','Ready For Review') DEFAULT NULL,
  `contractor_status` enum('Pending','Approved') DEFAULT NULL,
  `owner_status` enum('Pending','Approved') DEFAULT NULL,
  PRIMARY KEY (`time_and_material_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=199 ;

-- --------------------------------------------------------

--
-- Table structure for table `time_and_material_cropped_svgs`
--

CREATE TABLE IF NOT EXISTS `time_and_material_cropped_svgs` (
  `cropped_svg_id` int(11) NOT NULL AUTO_INCREMENT,
  `svg` varbinary(255) NOT NULL,
  `time_and_material_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`cropped_svg_id`),
  KEY `time_and_material_id` (`time_and_material_id`,`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `time_and_material_equipment`
--

CREATE TABLE IF NOT EXISTS `time_and_material_equipment` (
  `time_and_material_equipment_id` int(11) NOT NULL AUTO_INCREMENT,
  `equipment_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `extension` double DEFAULT NULL,
  `notes` text,
  `time_and_material_id` int(11) NOT NULL,
  PRIMARY KEY (`time_and_material_equipment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=197 ;

-- --------------------------------------------------------

--
-- Table structure for table `time_and_material_files`
--

CREATE TABLE IF NOT EXISTS `time_and_material_files` (
  `time_and_material_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_type` enum('image','pdf','dwg','rvt','dwfx','ifc','doc') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'image',
  `time_and_material_id` int(11) DEFAULT NULL,
  `file_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_thumb_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uploaded_by` int(11) NOT NULL,
  PRIMARY KEY (`time_and_material_file_id`),
  KEY `time_and_material_id` (`time_and_material_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC AUTO_INCREMENT=27 ;

-- --------------------------------------------------------

--
-- Table structure for table `time_and_material_history`
--

CREATE TABLE IF NOT EXISTS `time_and_material_history` (
  `time_and_material_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `time_and_material_id` int(11) NOT NULL,
  `action_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `action_by` int(11) NOT NULL,
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `action_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action_comments` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`time_and_material_history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `time_and_material_ig_sheet_markers`
--

CREATE TABLE IF NOT EXISTS `time_and_material_ig_sheet_markers` (
  `ig_sheet_marker_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `x1` float DEFAULT NULL,
  `y1` float DEFAULT NULL,
  `radius` varchar(20) DEFAULT NULL,
  `x2` float DEFAULT NULL,
  `y2` float DEFAULT NULL,
  `width` varchar(20) DEFAULT NULL,
  `height` varchar(20) DEFAULT NULL,
  `path` text,
  `fill` varchar(20) DEFAULT NULL,
  `stroke` varchar(100) DEFAULT NULL,
  `strokeWidth` varchar(100) DEFAULT NULL,
  `storkeWidth` varchar(100) NOT NULL,
  `time_and_material_id` int(11) NOT NULL,
  `ig_group_sheet_id` int(11) NOT NULL,
  PRIMARY KEY (`ig_sheet_marker_id`),
  KEY `time_and_material_id` (`time_and_material_id`,`ig_group_sheet_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `time_and_material_labor`
--

CREATE TABLE IF NOT EXISTS `time_and_material_labor` (
  `time_and_material_labor_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `labor_id` int(11) DEFAULT NULL,
  `rate_type_id` int(11) DEFAULT NULL,
  `crew` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `extension` double DEFAULT NULL,
  `notes` text,
  `time_and_material_id` int(11) NOT NULL,
  PRIMARY KEY (`time_and_material_labor_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=809 ;

-- --------------------------------------------------------

--
-- Table structure for table `time_and_material_labor_rates`
--

CREATE TABLE IF NOT EXISTS `time_and_material_labor_rates` (
  `labor_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `rate` float NOT NULL,
  `company_id` int(11) NOT NULL,
  `labor_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT '1',
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`labor_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- Table structure for table `time_and_material_leaveout_coordinates`
--

CREATE TABLE IF NOT EXISTS `time_and_material_leaveout_coordinates` (
  `leaveout_coordinate_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `type` varchar(20) NOT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `radius` int(11) DEFAULT NULL,
  `path` text,
  `fill` varchar(20) NOT NULL,
  `stroke` varchar(20) NOT NULL,
  `stroke_width` float NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'New',
  `ig_dynamic_location_sheet_id` int(11) NOT NULL,
  `ig_group_sheet_id` int(11) NOT NULL,
  `time_and_material_id` int(11) NOT NULL,
  `new_time_and_material_id` int(11) NOT NULL,
  `ig_tool_2d_location_record_id` int(11) NOT NULL,
  `leaveout_type` varchar(50) NOT NULL,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`leaveout_coordinate_id`),
  KEY `ig_dynamic_location_sheet_id` (`ig_dynamic_location_sheet_id`,`ig_group_sheet_id`,`time_and_material_id`,`ig_tool_2d_location_record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `time_and_material_markup_calculations`
--

CREATE TABLE IF NOT EXISTS `time_and_material_markup_calculations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `markup_calculation_type_id` varchar(50) NOT NULL,
  `percentage` varchar(11) NOT NULL,
  `unit_rate` double NOT NULL,
  `total` double NOT NULL,
  `time_and_material_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1901 ;

-- --------------------------------------------------------

--
-- Table structure for table `time_and_material_markup_calculation_types`
--

CREATE TABLE IF NOT EXISTS `time_and_material_markup_calculation_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `time_and_material_material`
--

CREATE TABLE IF NOT EXISTS `time_and_material_material` (
  `time_and_material_material_id` int(11) NOT NULL AUTO_INCREMENT,
  `material_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `extension` double DEFAULT NULL,
  `notes` text,
  `time_and_material_id` int(11) NOT NULL,
  PRIMARY KEY (`time_and_material_material_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

-- --------------------------------------------------------

--
-- Table structure for table `time_and_material_subcontractor`
--

CREATE TABLE IF NOT EXISTS `time_and_material_subcontractor` (
  `time_and_material_subcontractor_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `extension` double DEFAULT NULL,
  `notes` text,
  `time_and_material_id` int(11) NOT NULL,
  `ticket_number` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`time_and_material_subcontractor_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `phone1` varchar(20) NOT NULL,
  `phone2` varchar(20) NOT NULL,
  `email1` varchar(255) NOT NULL,
  `email2` varchar(255) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `postalcode` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('Admin','Client') NOT NULL,
  `default_project_id` int(11) NOT NULL,
  `default_session_timeout` int(3) NOT NULL DEFAULT '60',
  `is_active` int(1) NOT NULL,
  `secret_code` varchar(255) NOT NULL,
  `auth_code` varchar(50) DEFAULT NULL,
  `auth_code_expdate` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3665 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_companies`
--

CREATE TABLE IF NOT EXISTS `user_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`project_id`,`company_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6505 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_custom_inspections`
--

CREATE TABLE IF NOT EXISTS `user_custom_inspections` (
  `user_custom_inspection_id` int(11) NOT NULL AUTO_INCREMENT,
  `inspection_request_id` int(11) NOT NULL,
  `user_custom_inspection_set_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_custom_inspection_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3827 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_custom_inspection_set`
--

CREATE TABLE IF NOT EXISTS `user_custom_inspection_set` (
  `user_custom_inspection_set_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `shared` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_custom_inspection_set_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_dashboard_widgets`
--

CREATE TABLE IF NOT EXISTS `user_dashboard_widgets` (
  `user_dashboard_widget_id` int(11) NOT NULL AUTO_INCREMENT,
  `panel_id` varchar(255) NOT NULL,
  `column` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `collapsed` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`user_dashboard_widget_id`),
  KEY `user_id` (`user_id`,`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9513 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_failed_logins`
--

CREATE TABLE IF NOT EXISTS `user_failed_logins` (
  `user_failed_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `attempt_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_failed_login_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29529 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_follow_custom_inspection_set`
--

CREATE TABLE IF NOT EXISTS `user_follow_custom_inspection_set` (
  `user_follower_custom_inspection_set_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_custom_inspection_set_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`user_follower_custom_inspection_set_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE IF NOT EXISTS `user_groups` (
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_history`
--

CREATE TABLE IF NOT EXISTS `user_history` (
  `user_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `log_action_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `host_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `operating_system` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `device_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_history_id`),
  KEY `user_id` (`user_id`,`log_action_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=516041 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_images`
--

CREATE TABLE IF NOT EXISTS `user_images` (
  `user_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_image_setting_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `image_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_image_id`),
  KEY `user_image_setting_id` (`user_image_setting_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_image_settings`
--

CREATE TABLE IF NOT EXISTS `user_image_settings` (
  `user_image_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `width` varchar(50) NOT NULL,
  `height` varchar(50) NOT NULL,
  PRIMARY KEY (`user_image_setting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_layout_settings`
--

CREATE TABLE IF NOT EXISTS `user_layout_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `width` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`,`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=186 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_licenses`
--

CREATE TABLE IF NOT EXISTS `user_licenses` (
  `user_license_id` int(11) NOT NULL AUTO_INCREMENT,
  `license_number` varchar(100) NOT NULL,
  `issue_date` datetime NOT NULL,
  `expiry_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `license_id` int(11) NOT NULL,
  `status` enum('Active','Delete') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`user_license_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_passwordreset_keys`
--

CREATE TABLE IF NOT EXISTS `user_passwordreset_keys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `resetkey` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4781 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_permission`
--

CREATE TABLE IF NOT EXISTS `user_permission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `permission` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `PERMISSION_ENTITY_PERMISSION` (`permission`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Permissions table' AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_projects`
--

CREATE TABLE IF NOT EXISTS `user_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `status` enum('active','inactive','pending-delete','deleted') NOT NULL,
  `wan_notification` enum('Off','Live','Hourly','Daily') NOT NULL,
  `ir_open` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `ir_reschedule` enum('Off','Live','Hourly','Daily') NOT NULL,
  `ir_reschedule_accepted` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `ir_pass` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `ir_pending` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `ir_qcnew` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `ir_failed` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `ir_revision1_fail` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `ir_edit` enum('Off','Live','Hourly','Daily') NOT NULL,
  `ir_void` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `ir_rev_require` enum('Off','Live','Hourly','Daily') NOT NULL,
  `ir_re_open` enum('Off','Live','Hourly','Daily') NOT NULL,
  `ir_reassign` enum('Off','Live','Hourly','Daily') NOT NULL,
  `ir_return` enum('Off','Live','Hourly','Daily') NOT NULL,
  `ir_daily_summary` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `ir_daily_summary_revised` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `ir_closure_summary` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `ir_closure_type_95` enum('Daily','Off','Live','Hourly') NOT NULL DEFAULT 'Off',
  `ir_closure_type_94` enum('Daily','Off','Live','Hourly') NOT NULL DEFAULT 'Off',
  `ir_final_summary` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `ir_revise` enum('Off','Live','Hourly','Daily') NOT NULL,
  `ir_closure_map` enum('Off','Hourly','Daily','Live') NOT NULL DEFAULT 'Off',
  `ir_reject` enum('Off','Live','Hourly','Daily') NOT NULL,
  `issue_notification` enum('Off','Live','Hourly','Daily') NOT NULL,
  `issue_comments_notification` enum('Off','Live','Hourly','Daily') NOT NULL,
  `dfm_notification` enum('Off','Live','Hourly','Daily') NOT NULL,
  `pl_new` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `pl_request_info` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `pl_fixed` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `observation_notification` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `observation_comments_notification` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `pl_close` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `pl_review` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `pl_comment` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `sub_new` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `sub_approve` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `sub_comment` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `dr_notification` enum('Off','Live','Hourly','Daily') NOT NULL,
  `sub_reject` enum('Off','Live','Hourly','Daily') NOT NULL,
  `rfi_new` enum('Off','Live','Hourly','Daily') NOT NULL,
  `rfi_comments` enum('Off','Live','Hourly','Daily') NOT NULL,
  `rfi_response` enum('Off','Live','Hourly','Daily') NOT NULL,
  `rfi_pending` enum('Off','Live','Hourly','Daily') NOT NULL,
  `rfi_closed` enum('Off','Live','Hourly','Daily') NOT NULL,
  `rfi_reassigned` enum('Off','Live','Hourly','Daily') NOT NULL,
  `rfi_void` enum('Off','Live','Hourly','Daily') NOT NULL,
  `rfi_requestcomment` enum('Off','Live','Hourly','Daily') NOT NULL,
  `rfi_open` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `rfi_re_open` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `rfi_concur` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `rfi_oshpd_classification` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `wan_revision` enum('Off','Live','Hourly','Daily') NOT NULL,
  `module_id` int(11) NOT NULL,
  `dr_inspection` enum('Off','Live','Hourly','Daily') NOT NULL,
  `dr_designpro` enum('Off','Live','Hourly','Daily') NOT NULL,
  `dr_contractor` enum('Off','Live','Hourly','Daily') NOT NULL,
  `dr_trades` enum('Off','Live','Hourly','Daily') NOT NULL,
  `dr_owner` enum('Off','Live','Hourly','Daily') NOT NULL,
  `dr_status_report` enum('Off','Weekly') NOT NULL DEFAULT 'Off',
  `dr_issue_created` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `dr_issue_reassigned` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `dr_issue_closed` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `dr_issue_reopen` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `dr_issue_comment` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `cxm_issue_created` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `cxm_issue_comment_added` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `cxm_issue_company_reassigned` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `cxm_issue_ready_for_review` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `cxm_issue_closed` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `cxm_issue_reopen` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `issue_non_compliance` enum('Off','Weekly') NOT NULL DEFAULT 'Off',
  `cxm_checklist_complete` enum('Off','Live','Hourly','Daily') NOT NULL,
  `cxm_startup_status_pending` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `cxm_startup_status_installation` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `cxm_startup_status_ready_for_start_up` enum('Off','Live','Hourly','Daily') NOT NULL,
  `cxm_startup_status_start_up_authorized` enum('Off','Live','Hourly','Daily') NOT NULL,
  `cxm_startup_status_complete` enum('Off','Live','Hourly','Daily') NOT NULL,
  `cxm_startup_status_issue` enum('Off','Live','Hourly','Daily') NOT NULL,
  `cxm_exception_log_create` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `cxm_exception_log_comment` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `cxm_exception_log_closed` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `cxm_exception_log_retest` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `cxm_report_created` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `cxm_equipment_status_report` enum('Off','Weekly') NOT NULL DEFAULT 'Off',
  `cxm_em_issue_created` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `cxm_em_issue_comment` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `cxm_em_issue_retest` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  `cxm_em_issue_close` enum('Off','Live','Hourly','Daily') NOT NULL DEFAULT 'Off',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6504 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_projects_bkp`
--

CREATE TABLE IF NOT EXISTS `user_projects_bkp` (
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `default` int(1) NOT NULL DEFAULT '0',
  `job_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`project_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_signatures`
--

CREATE TABLE IF NOT EXISTS `user_signatures` (
  `user_signature_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_signature_setting_id` int(11) NOT NULL,
  `signature` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `signature_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_signature_id`),
  KEY `user_signature_setting_id` (`user_signature_setting_id`,`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_signature_settings`
--

CREATE TABLE IF NOT EXISTS `user_signature_settings` (
  `user_signature_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `width` varchar(50) NOT NULL,
  `height` varchar(50) NOT NULL,
  PRIMARY KEY (`user_signature_setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `vcr_items`
--

CREATE TABLE IF NOT EXISTS `vcr_items` (
  `vcr_id` int(11) NOT NULL AUTO_INCREMENT,
  `vcr_project_id` int(11) NOT NULL,
  `milestone` varchar(250) NOT NULL,
  `vcr_project_inc` int(250) NOT NULL,
  `vcr_project_ref_no` int(11) NOT NULL,
  `GEOR` enum('0','1') NOT NULL,
  `vcr_aor` enum('0','1') NOT NULL,
  `vcr_seor` enum('0','1') NOT NULL,
  `vcr_meor` enum('0','1') NOT NULL,
  `vcr_eeor` enum('0','1') NOT NULL,
  `vcr_count` enum('0','1') NOT NULL,
  `vcr_sp_insp` enum('0','1') NOT NULL,
  `vcr_ior` enum('0','1') NOT NULL,
  PRIMARY KEY (`vcr_id`),
  KEY `vcr_project_id` (`vcr_project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=453 ;

-- --------------------------------------------------------

--
-- Table structure for table `wan`
--

CREATE TABLE IF NOT EXISTS `wan` (
  `wan_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `project_authority_substructure_id` int(11) NOT NULL,
  `wan_type_id` int(11) NOT NULL,
  `wan_status_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `wan_num` int(11) NOT NULL,
  `wan_title` varchar(80) NOT NULL,
  `work_description` text NOT NULL,
  `work_location` varchar(255) NOT NULL,
  `delivered` enum('Notified','Received') NOT NULL DEFAULT 'Notified',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delivered_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `contact` varchar(100) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `assign_to` int(11) NOT NULL,
  `change_order` varchar(255) NOT NULL,
  `submittal` varchar(255) NOT NULL,
  `rfi` varchar(255) NOT NULL,
  `work_start_time` time NOT NULL,
  `work_end_time` time NOT NULL,
  `floor` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `building_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `crew_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`wan_id`),
  KEY `user_id` (`user_id`,`project_id`,`project_authority_substructure_id`,`wan_type_id`,`wan_status_id`,`company_id`,`assign_to`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13717 ;

-- --------------------------------------------------------

--
-- Table structure for table `wan_history`
--

CREATE TABLE IF NOT EXISTS `wan_history` (
  `wan_history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wan_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `action` varchar(50) NOT NULL,
  `comments` text NOT NULL,
  PRIMARY KEY (`wan_history_id`),
  KEY `wan_id` (`wan_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17353 ;

-- --------------------------------------------------------

--
-- Table structure for table `wan_setting`
--

CREATE TABLE IF NOT EXISTS `wan_setting` (
  `wan_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `wan_duration_limit` int(11) NOT NULL,
  PRIMARY KEY (`wan_setting_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

-- --------------------------------------------------------

--
-- Table structure for table `wan_status`
--

CREATE TABLE IF NOT EXISTS `wan_status` (
  `wan_status_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(80) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`wan_status_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `wan_type`
--

CREATE TABLE IF NOT EXISTS `wan_type` (
  `wan_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `description` text NOT NULL,
  `sort` varchar(11) NOT NULL,
  PRIMARY KEY (`wan_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=271 ;

-- --------------------------------------------------------

--
-- Table structure for table `wan_uploads`
--

CREATE TABLE IF NOT EXISTS `wan_uploads` (
  `wan_upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `wan_id` int(11) NOT NULL,
  `wan_upload_title` varchar(255) NOT NULL,
  `wan_upload_path` varchar(255) NOT NULL,
  `wan_upload_file_type` varchar(255) NOT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `file_thumb_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`wan_upload_id`),
  KEY `wan_id` (`wan_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=571 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dfm_file_activity_log`
--
ALTER TABLE `dfm_file_activity_log`
  ADD CONSTRAINT `fk_dfm_file_activity_log_dfm_project_company_files1` FOREIGN KEY (`company_file_id`) REFERENCES `dfm_project_company_files` (`project_company_file_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dfm_file_comments`
--
ALTER TABLE `dfm_file_comments`
  ADD CONSTRAINT `fk_file_comments_project_company_files1` FOREIGN KEY (`project_company_file_id`) REFERENCES `dfm_project_company_files` (`project_company_file_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dfm_file_wiki`
--
ALTER TABLE `dfm_file_wiki`
  ADD CONSTRAINT `fk_file_wiki_project_company_files1` FOREIGN KEY (`project_compnay_file_id`) REFERENCES `dfm_project_company_files` (`project_company_file_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dfm_file_wiki_log`
--
ALTER TABLE `dfm_file_wiki_log`
  ADD CONSTRAINT `fk_file_wiki_log_file_wiki1` FOREIGN KEY (`file_wiki_id`) REFERENCES `dfm_file_wiki` (`file_wiki_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dfm_project_company_file_pdf`
--
ALTER TABLE `dfm_project_company_file_pdf`
  ADD CONSTRAINT `fk_project_company_file_version_project_company_files10` FOREIGN KEY (`project_company_file_id`) REFERENCES `dfm_project_company_files` (`project_company_file_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dfm_project_company_file_tickets`
--
ALTER TABLE `dfm_project_company_file_tickets`
  ADD CONSTRAINT `fk_project_company_file_rejection_notes_project_company_files1` FOREIGN KEY (`project_company_file_id`) REFERENCES `dfm_project_company_files` (`project_company_file_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dfm_project_company_file_ticket_notes`
--
ALTER TABLE `dfm_project_company_file_ticket_notes`
  ADD CONSTRAINT `fk_dfm_project_company_file_ticket_notes_dfm_project_company_1` FOREIGN KEY (`project_company_file_ticket_id`) REFERENCES `dfm_project_company_file_tickets` (`project_company_file_ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dfm_project_company_file_version`
--
ALTER TABLE `dfm_project_company_file_version`
  ADD CONSTRAINT `fk_project_company_file_version_project_company_files1` FOREIGN KEY (`project_company_file_id`) REFERENCES `dfm_project_company_files` (`project_company_file_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dfm_stage_company_users`
--
ALTER TABLE `dfm_stage_company_users`
  ADD CONSTRAINT `fk_dfm_stage_company_users_dfm_stage_companies1` FOREIGN KEY (`stage_company_id`) REFERENCES `dfm_stage_companies` (`stage_company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
