-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2020 at 05:13 PM
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
-- 
--

-- --------------------------------------------------------

--
-- Table structure for table `assetcategories`
--

CREATE TABLE `assetcategories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(7) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assetcategories`
--

INSERT INTO `assetcategories` (`id`, `name`, `color`) VALUES
(1, 'Desktops', '#1e3fda'),
(2, 'Laptops', '#058e29'),
(3, 'Servers', '#ff0000'),
(4, 'Printers', '#99ac14'),
(5, 'Routers', '#0b7c36'),
(6, 'Mise and Keyboards', '#57e2b0');

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `manufacturerid` int(11) NOT NULL,
  `modelid` int(11) NOT NULL,
  `supplierid` int(11) NOT NULL,
  `statusid` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `warranty_months` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `locationid` int(11) NOT NULL,
  `purchase_order` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `condition` varchar(255) NOT NULL,
  `removal_date` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `categoryid`, `adminid`, `clientid`, `userid`, `manufacturerid`, `modelid`, `supplierid`, `statusid`, `purchase_date`, `warranty_months`, `tag`, `name`, `serial`, `notes`, `locationid`, `purchase_order`, `value`, `condition`, `removal_date`) VALUES
(1, 1, 0, 1, 0, 2, 4, 1, 3, '2016-02-01', 24, 'IT-1', 'Desktop 1', 'QWERT12345', '', 0, '', '', '', ''),
(2, 3, 0, 2, 0, 2, 3, 1, 3, '2016-02-01', 24, 'IT-2', 'DC Server', 'ASDFG12345', '', 0, '', '', '', ''),
(3, 2, 0, 2, 0, 1, 1, 3, 3, '2016-02-01', 24, 'IT-3', 'Laptop 1', 'BNMHJK98765', '', 0, '', '', '', ''),
(4, 3, 2, 4, 3, 3, 7, 4, 1, '2020-09-02', 1, 'Mushe-4', 'Terry Cloud Services', 'Asdsdrd20d20', '<p>This is agently requested</p>', 3, '10', '5000', '', '2020-09-03');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `asset_tag_prefix` varchar(255) NOT NULL,
  `license_tag_prefix` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `asset_tag_prefix`, `license_tag_prefix`) VALUES
(4, 'Mushe Abdul-Hakim', 'Mushe-', 'Mushe-'),
(3, 'Vendetta King', 'IT-', 'ITL-'),
(5, 'Terry Cobby', 'Mushe-', 'Mushe-');

-- --------------------------------------------------------

--
-- Table structure for table `clients_admins`
--

CREATE TABLE `clients_admins` (
  `id` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients_admins`
--

INSERT INTO `clients_admins` (`id`, `adminid`, `clientid`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `peopleid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `projectid` int(11) NOT NULL,
  `ticketid` int(11) NOT NULL,
  `comment` text NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `peopleid`, `clientid`, `projectid`, `ticketid`, `comment`, `timestamp`) VALUES
(1, 2, 1, 1, 0, '<p>This project must be finished by the end of the year</p>', '2020-09-05 15:07:55');

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `name` varchar(128) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`name`, `value`) VALUES
('email_from_address', 'admin@example.com'),
('email_from_name', 'admin'),
('email_smtp_enable', 'false'),
('email_smtp_host', ''),
('email_smtp_port', ''),
('email_smtp_username', ''),
('email_smtp_password', ''),
('email_smtp_security', ''),
('email_smtp_domain', ''),
('email_smtp_auth', 'false'),
('week_start', '1'),
('log_retention', '365'),
('tickets_encrypton', ''),
('tickets_password', ''),
('tickets_username', ''),
('tickets_server', ''),
('license_tag_prefix', 'Mushe-'),
('asset_tag_prefix', 'Mushe-'),
('company_details', 'Asset, Inventory And Project Management System'),
('company_name', 'Mushe Code'),
('tickets_notification', 'false'),
('sms_provider', 'clickatell'),
('sms_user', ''),
('sms_password', ''),
('sms_api_id', ''),
('sms_from', ''),
('app_name', 'OnTrack'),
('app_url', '#'),
('table_records', '50'),
('db_version', '1.7'),
('project_tag_prefix', 'P-'),
('password_generator_length', '8'),
('default_lang', 'en'),
('auto_close_tickets', '0'),
('timezone', 'UTC'),
('auto_close_tickets_notify', 'false'),
('tickets_defaultdepartment', '0');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`) VALUES
(1, 'Mushe Abdul-Hakim', 'musheabdulhakim@protonmail.ch');

-- --------------------------------------------------------

--
-- Table structure for table `credentials`
--

CREATE TABLE `credentials` (
  `id` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `assetid` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emaillog`
--

CREATE TABLE `emaillog` (
  `id` int(11) NOT NULL,
  `peopleid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `to` varchar(128) NOT NULL,
  `subject` varchar(256) NOT NULL,
  `message` text NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emaillog`
--

INSERT INTO `emaillog` (`id`, `peopleid`, `clientid`, `to`, `subject`, `message`, `timestamp`) VALUES
(1, 3, 1, 'vendetta@ven.com', 'Password Reset', 'Could not instantiate mail function.', '2020-09-03 22:21:50');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `projectid` int(11) NOT NULL,
  `assetid` int(11) NOT NULL,
  `ticketreplyid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hosts`
--

CREATE TABLE `hosts` (
  `id` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `status` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hosts`
--

INSERT INTO `hosts` (`id`, `clientid`, `name`, `address`, `status`) VALUES
(1, 1, 'Google', 'www.google.com', ''),
(2, 2, 'DC Server', '10.0.0.25', ''),
(3, 2, 'Router', '10.0.0.1', '');

-- --------------------------------------------------------

--
-- Table structure for table `hosts_checks`
--

CREATE TABLE `hosts_checks` (
  `id` int(11) NOT NULL,
  `hostid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(60) NOT NULL,
  `port` varchar(60) NOT NULL,
  `monitoring` int(1) NOT NULL,
  `email` int(1) NOT NULL,
  `sms` int(1) NOT NULL,
  `status` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hosts_checks`
--

INSERT INTO `hosts_checks` (`id`, `hostid`, `name`, `type`, `port`, `monitoring`, `email`, `sms`, `status`) VALUES
(1, 1, 'HTTP', 'Service', '80', 1, 1, 1, ''),
(2, 3, 'HTTP admin', 'Service', '80', 1, 1, 0, ''),
(3, 2, 'MySQL Database', 'Service', '3306', 1, 1, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `hosts_history`
--

CREATE TABLE `hosts_history` (
  `id` int(11) NOT NULL,
  `checkid` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `latency` varchar(10) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hosts_people`
--

CREATE TABLE `hosts_people` (
  `id` int(11) NOT NULL,
  `hostid` int(11) NOT NULL,
  `peopleid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `assetid` int(11) NOT NULL,
  `projectid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `issuetype` varchar(15) NOT NULL,
  `priority` varchar(60) NOT NULL,
  `status` varchar(60) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `duedate` varchar(20) NOT NULL,
  `timespent` int(10) NOT NULL,
  `dateadded` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`id`, `clientid`, `assetid`, `projectid`, `adminid`, `issuetype`, `priority`, `status`, `name`, `description`, `duedate`, `timespent`, `dateadded`) VALUES
(1, 2, 2, 0, 0, 'Task', 'High', 'To Do', 'Configure Active Directory', '', '', 180, '2016-02-03 00:00:00'),
(2, 2, 2, 0, 0, 'Task', 'Low', 'In Progress', 'Reconfigure DNS server', '', '2016-03-27', 25, '2016-02-01 00:00:00'),
(3, 1, 1, 0, 0, 'Task', 'Normal', 'Done', 'Install Office Suite', '', '2016-08-03', 45, '2016-02-03 00:00:00'),
(4, 1, 1, 1, 0, 'Maintenance', 'High', 'To Do', 'I am having trouble with the desktop again', 'This is a serioud problem with my computer . It keeps bringing some dark box on my screen', '2020-09-02', 0, '2020-09-02 23:06:38');

-- --------------------------------------------------------

--
-- Table structure for table `kb_articles`
--

CREATE TABLE `kb_articles` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `clients` text NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `content` text CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kb_articles`
--

INSERT INTO `kb_articles` (`id`, `categoryid`, `clients`, `name`, `content`) VALUES
(1, 1, 'a:1:{i:0;s:1:\"0\";}', 'Test Article', '<p>Article body.<br></p>'),
(2, 0, 'a:1:{i:0;s:1:\"0\";}', 'About the company', '<p>This is the article you all have been requesting</p>');

-- --------------------------------------------------------

--
-- Table structure for table `kb_categories`
--

CREATE TABLE `kb_categories` (
  `id` int(11) NOT NULL,
  `clients` text NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kb_categories`
--

INSERT INTO `kb_categories` (`id`, `clients`, `name`) VALUES
(1, 'a:1:{i:0;s:1:\"0\";}', 'Test Category'),
(2, 'a:3:{i:0;s:1:\"0\";i:1;s:1:\"4\";i:2;s:9:\"alot more\";}', 'Another Category Test');

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

CREATE TABLE `labels` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(7) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `labels`
--

INSERT INTO `labels` (`id`, `name`, `color`) VALUES
(1, 'Requested', '#1ecbbd'),
(2, 'Pending', '#1ccd2b'),
(3, 'Deployed', '#3479da'),
(4, 'Archived', '#959d1c'),
(5, 'In Repair', '#da2727'),
(6, 'Broken', '#776e6e'),
(7, 'Canceled', '#ed1818');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `code` varchar(4) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `name`) VALUES
(1, 'en', 'English (System)');

-- --------------------------------------------------------

--
-- Table structure for table `licensecategories`
--

CREATE TABLE `licensecategories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(7) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `licensecategories`
--

INSERT INTO `licensecategories` (`id`, `name`, `color`) VALUES
(1, 'Operating Systems', '#355ea7'),
(2, 'Office Suite', '#e4d811'),
(3, 'Graphics Editor', '#c62121'),
(4, 'Other', '#370b0b');

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

CREATE TABLE `licenses` (
  `id` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `statusid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `supplierid` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `serial` text NOT NULL,
  `notes` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `licenses`
--

INSERT INTO `licenses` (`id`, `clientid`, `statusid`, `categoryid`, `supplierid`, `tag`, `name`, `serial`, `notes`) VALUES
(1, 1, 3, 1, 1, 'ITL-1', 'Windows 10 Pro', '', ''),
(2, 1, 3, 1, 2, 'ITL-2', 'Office Home & Business 2016', '', ''),
(3, 2, 3, 1, 3, 'ITL-3', 'Windows Server 2012 R2 Essentials', '', ''),
(4, 2, 3, 3, 1, 'ITL-4', 'Corel Draw x5', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `licenses_assets`
--

CREATE TABLE `licenses_assets` (
  `id` int(11) NOT NULL,
  `licenseid` int(11) NOT NULL,
  `assetid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `licenses_assets`
--

INSERT INTO `licenses_assets` (`id`, `licenseid`, `assetid`) VALUES
(1, 3, 1),
(2, 2, 1),
(3, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `clientid`, `name`) VALUES
(1, 3, 'Test Location'),
(2, 4, 'Ghana'),
(3, 4, 'North Carolina');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `name`) VALUES
(1, 'Apple'),
(2, 'Dell'),
(3, 'Microsoft'),
(4, 'HP'),
(5, 'Samsung'),
(6, 'ASUS'),
(7, 'Canon'),
(8, 'Cisco'),
(9, 'Lenovo'),
(10, 'Acer'),
(11, 'Epson');

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `models`
--

INSERT INTO `models` (`id`, `name`) VALUES
(1, 'MacBook Pro'),
(2, 'MacBook Air'),
(3, 'PowerEdge R220'),
(4, 'Optiplex 3020 MT'),
(5, 'Dell Inspiron'),
(6, 'HP Pavillion'),
(7, 'Microsoft Azure');

-- --------------------------------------------------------

--
-- Table structure for table `notificationtemplates`
--

CREATE TABLE `notificationtemplates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `info` text NOT NULL,
  `sms` varchar(254) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notificationtemplates`
--

INSERT INTO `notificationtemplates` (`id`, `name`, `subject`, `message`, `info`, `sms`) VALUES
(1, 'New Ticket', 'Ticket #{ticketid} created', '<p>Hello {contact},<br><br>A new ticket has been created for your request.<br>Ticket ID:<b> #{ticketid}</b><br><br>{message}<br><br>You can reply to this email to add additional information.<br>Please do not remove the ticket number from the subject line.<br><br>Best regards,<br>{company}</p>', '', ''),
(2, 'New Ticket Reply', '#{ticketid} New Reply', '<p>Hello {contact},<br><br>A new reply has been added to your ticket.<br><br>Ticket ID: #{ticketid}<br><br>{message}<br><br>You can reply to this email to add additional information.<br>Please do not remove the ticket number from the subject line.<br><br>Best regards,<br>{company}<br></p>', '', ''),
(3, 'New User', 'New User', '<p>Hello {contact},<br><br>Your account has been successfully created.</p><p><br>Email Address: {email}<br>Password: {password}<br>{appurl}<br><br>Best regards,<br>{company}<br></p>', '', ''),
(5, 'Password Reset', 'Password Reset', '<p>Hello {contact},<br><br>Please follow the link below to reset your password.<br>{resetlink}<br><br>Best regards,<br>{company}<br></p>', '', ''),
(6, 'Monitoring Notification', '{hostinfo} is now {status}', '<p>{hostinfo} status has changed to {status}.<br><br>Best regards,<br>{company}<br></p>', '', '{hostinfo} is now {status}'),
(7, 'New Ticket (Admin)', 'New Support Ticket #{ticketid}', '<p>A new support ticket has been opened.</p>\r\n<p>Ticket ID:<b> #{ticketid}</b><br>Subject: {subject}</p>\r\n<p><br>{message}</p><br>\r\n<p>Best regards,<br>{company}</p>', '', ''),
(8, 'New Ticket Reply (Admin)', 'New Reply to Ticket #{ticketid}', '<p>A new reply has been added to ticket #{ticketid}.<br>Subject: {subject}<br></p><p><br>{message}<br></p><p><br>Best regards,<br>{company}<br></p><p><br></p><p></p>', '', ''),
(9, 'Ticket Escalation (Admin)', 'Escalation Rule Processed #{ticketid}', '<p>Escalation rule processed for ticket #{ticketid}.<br>Subject: {subject}<br></p><p><br>{message}<br></p><p><br>Best regards,<br>{company}<br></p><p><br></p><p></p>', '', ''),
(10, 'Ticket Auto Close (User)', 'Support Ticket #{ticketid} Auto Closed', '<p>This is a notification to let you know that we are changing the status of your ticket #{ticketid}  to Closed as we have not received a response from you lately.<br></p><p><br>Ticket Subject: {subject}<br></p><p><br>Best regards,<br>{company}<br></p><p><br></p><p></p>', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `roleid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `password` varchar(128) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `sidebar` varchar(64) NOT NULL,
  `layout` varchar(64) NOT NULL,
  `notes` text NOT NULL,
  `signature` text NOT NULL,
  `sessionid` varchar(255) NOT NULL,
  `resetkey` varchar(255) NOT NULL,
  `autorefresh` int(11) NOT NULL,
  `lang` varchar(2) NOT NULL,
  `ticketsnotification` int(1) NOT NULL,
  `avatar` mediumblob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `type`, `roleid`, `clientid`, `name`, `email`, `title`, `mobile`, `password`, `theme`, `sidebar`, `layout`, `notes`, `signature`, `sessionid`, `resetkey`, `autorefresh`, `lang`, `ticketsnotification`, `avatar`) VALUES
(2, 'admin', 1, 0, 'admin', 'admin@example.com', 'Web Developer', '233209229025', 'ecb97aafa3d2b5f076926ac5976fc03f376be7f3', 'skin-green', 'opened', '', '', '', 'g0rnfvpbev3bdkl14ch96pt10g', '', 0, 'en', 1, 0xffd8ffe112314578696600004d4d002a00000008000c0100000300000001023000000101000300000001013b000001020003000000030000009e010600030000000100020000011200030000000100010000011500030000000100030000011a000500000001000000a4011b000500000001000000ac012800030000000100020000013100020000001e000000b40132000200000014000000d28769000400000001000000e800000120000800080008000afc8000002710000afc800000271041646f62652050686f746f73686f7020435336202857696e646f77732900323031373a31323a30392031343a32363a34300000000004900000070000000430323231a001000300000001ffff0000a00200040000000100000078a003000400000001000000780000000000000006010300030000000100060000011a0005000000010000016e011b0005000000010000017601280003000000010002000002010004000000010000017e0202000400000001000010ab0000000000000048000000010000004800000001ffd8ffed000c41646f62655f434d0002ffee000e41646f626500648000000001ffdb0084000c08080809080c09090c110b0a0b11150f0c0c0f1518131315131318110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c010d0b0b0d0e0d100e0e10140e0e0e14140e0e0e0e14110c0c0c0c0c11110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cffc00011080078007803012200021101031101ffdd00040008ffc4013f0000010501010101010100000000000000030001020405060708090a0b0100010501010101010100000000000000010002030405060708090a0b1000010401030204020507060805030c33010002110304211231054151611322718132061491a1b14223241552c16233347282d14307259253f0e1f163733516a2b283264493546445c2a3743617d255e265f2b384c3d375e3f3462794a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f637475767778797a7b7c7d7e7f711000202010204040304050607070605350100021103213112044151617122130532819114a1b14223c152d1f0332462e1728292435315637334f1250616a2b283072635c2d2449354a317644555367465e2f2b384c3d375e3f34694a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f62737475767778797a7b7c7ffda000c03010002110311003f00f554924925292492494a4c92e0bebf7d78cbe9b95fb1fa4d8da6f6b03f2f2880e757bff9ba686bbd9eb399ef758efe6d22692012683d6755fac7d13a3ed1d4f32ac673fe8d6e32f3e6da59badffa0b1327fc677d55a5a4d565f94470da687ebfdab854cffa4bc82fcf1eabee7b9d6dd619b2eb1c5d63cfef3deef7b95639a5c64b888d7e7f04ce23d0327b711b9fb1f4a67f8d6cc75d95ebe0fa58eeaddf62f48efb05823d26e4b9db6ad967e7bd9f43f96ac74dff001af4d9982bea58afc6a6c7318d78f70692ed8eb1ee6eef6358edf62f2d3920b812e24f3af014c5fb8b8eeddb810e07b82971493edc4ec4bf47b2c658ddcc707b7c5a647e0a6bc67ea47d6bcae8dd51a329cebb17a93d95e4301f6d7612daa9ca8fdef4f6d777fa45eca138107662208d0ae9249228524924929fffd0f554924925290b2b2b1f131eccac9b1b4d14b4bedb1c61ad6b75738a2ae2ff00c6ae55957d5daf15a0eccdc965769edb1bbaed8efebbab6a45205903bb8fd4ff00c6fb85c474ac16bb1da7db76538b4bc7ef369a87e8daeff847ef5c3dbfb57eb0f55befc7c77e565e43dd75cdac7b59bbc5eff6d75b5a3657bdcb2ae7b8bc91aec05c7e2bd77a0f4fc6e99d228c5c511ea35b6dd67e758f7b438bdee5065cbc22ceb7b06d61c3c52a1a56e5e0bfe627d64d5c71e86b8f2d75a09fc06d413f53beb207ecfb00247e78b59b7e4e95ea309e02adf799f60dafba43b9fc1f23cbfab9d6f0dbbb23a6da2b1cbebfd20f8bbd2dce54aaf4f6cb3c75f19f35ed1a8d468573ff005bba06166f4ccaea35d2dafa8e233d56dcc1b4d8d6ff003955ed6ff39ecfa2ff00a6a48731c46a42afb31e4e5b841944dd77dde3fead74fb7aa758c3e9d5c0375ed7b9c7b32a3ebdcefecb58bdf57ce14df698f45c596524594d8c30f6b9bfa461addfbcbe84e939d5750e998b9d538bd991532c0e3cea35dd1f9db95a8756965dc1e94dc49249398d4924924a7fffd1f55492492529729fe3369aecfaa59163e77d16556531fbe1e18377f276bdcbab5cdfd7fd96fd5bbf0409bf39cca3184868f5770b19bdef2d656cfd1fd340ec531dc79be1f5e2dd9199f67a2b75d75aef4eba9bcb9c7b0feafe73d7ac600fd9fd2f128ea17d4dba8a9b5daf2f0d6ee688d1cf2d5e7ff56fa753d43eb03f1ad7d9e855539d7b5a4d4e71076d949756e73fd3f57dbed7fe916e65fd55e8988fb72df86ecdb0b5d6578cd26ba9ad60fe699b773edb9fff000967e9955cdc2488127be83f6b7f9712113922055f0fa8d7e0f4e7abf496987676302781eab3ff0024a6dea5d39df472e83f0b59ff00925c6fec9e819dd32ecbb3a6bfa53e863ac65c0398e63d8df53df4da36db56e6ecdeabfd8baae7d5d3317a9e1e26163f54d066e354c6deef67aacaecfcda5f77d2fe6d47ecc7b915bdd321cf306b841bf96aff001e2f95ef865629008bea20f07d46ff00e49365d072712ea2768c8add587f23dc0b777f29713d47a47d54e995d75bfa65b7b5e4b0dfbac905bf49f6161f67fdb4aef4dfabb6d65eee93d532fa7fa6c9662dae1656c796fab5eeff0005653637f93ec4df6e342424476321a7fcd5dee4ecc4c632d3d4212f57fce790c8e9f95d27a85987943f4d401a3750f11153ea3ff0cbdd7eaa74ebba5fd5ce9f8191fcf514b4583c1c7dee67f6376d5e4987d47f6efd61e9dd572aa6d75e1beb6f52db2f6b4524dd6649aab0fb6bc677efbffc2af6eaacaedadb6d4e0faec01cc7b4c82d3ee6b9a7f94af63bad7e6eae76522ea3f2eb4cd24924f62524924929ffd2f55492492529733f5ee97d98381e98970cfa74f887ae9964fd66e9d7751e917538c2729845d8d263f4959ded6cff002fe821217123b85d035289ec417cc3a2e01c2eb395d4f12bb32abdcfaefc7ae0d8daec1ea6fa1ae2df5df4dff99bbf495adab3ae74b04efb32ab77761a2f69f87a7e93937d5e0c66566d6d2e269d8d70b186b7b4ecd596d4efa0f67d1577abfd60c2e935b4e439efb5e48a71ea05d63c8fa5b5bf9b5b7fd22a193d53e13126434d3497d5d4c67821c424044ebafaa3fe0b976eeebef674fa597d7d35c45b997dcd756eb58c32dc5c7ade1afd963ff9eb96af5ce996751e986ac622bcac77b2ec379d036dab5adbfc963dbfa25cfe4fd66ea7947d5aba35cc2d0436ef58d560075dba01bbfaae620b7eb67d65bb6d1660585ad32ef4ff004363ff0077d5bfff0049b2ade9c31cb4aa8f0f4b0755872c4ddf148cf4e2e190d3faaebd1f587a65da6465fececc6c0c8c4c83e9963c7d36b7d5dacb2bddf41f5bd4733aef4ec7a1cdc5ca19b99635ccc6c5a5c2c73ec7086432adde9b777d27a0d5f59712ba595f56e97761d2d302eb98322a049ff096c39deefde5d063b711ad6598b5d6c6dbc3aa6b44889fa4c1ee6a8e511136624785fa7fc66584e52898890bef444ffc578ee9bd22ee977e5542dd97d38d8ecb6bac904bff00a4dd73de3fc0b1dbdbfcb5ea3f55eb757f57b018e107d1698f277b9bf95703958d7e5758cbf476feb16d58358fce758f60f5033f799551ea5967fa35ea1531b5d6dad8218c01ad1e406d0ae61b3723d69a1ccf0c78603a717e6cd2492533594924924a7fffd3f55492492529314e924a794fac98df64eb147523edc7cdafec77bfb36d077e23dfff001bb9f8ff00d7f4d52c8c0af22fc7bad03763ef0ed35735edf49f493fe8ddf9ec5d965e263e663d98b955b6ea2e696595b8482d2bcd1fd43ac74579665039fd3b0eeb71b2ad682726b0d3fa0b5fff00722a6d2eafdffceecfa6aaf3188df1c4ea7d2dde5730e138e42c0f5075327a9fec1c36b9c287e1022b68c9ab78ae7e8b4dd5ed7fa7fb9eb2ae3eb6f4fa9bbaba3a6b4bc8d769324f1b5a7e97f6554eadf5bbeaf37a7dadaae667baf616b71d8090770ff0db87e8dad5c3743cfa7a6f56c6cec8a7d7aa9712e6725b2205b54fb7d4a7f311c5ee18126c11b5fe97f8cacd2c43201111225bd197a7fc52fa79c06e43edbf2cefbafa8d2e0c68ad8da9ff004eaae96fb7ddf9f659fa545231b0e86b8eda3130eb27c1ad63447fd162c4ccfaebd2bd16b3a639d9d9f7fb68a1ac734ee3f9d77a9b76ecfa4b5beafe1e5f59eaef3d55acfb1e05755adc266ad37bceea6cca7ff877318cf55b57f315bd431c593248719abefbff008acf2cd8b1c098006b4f4fcbaff59d7faa5d168a718757c9c60cea79c5f7bdef1fa4632c3fa2a75fe6ff00402bdeba24827578000003a398492493d549249228524924929fffd4f554924c5252e99715d7bfc6661605d76374fc7fb63e879a9f91658daa8dedfa6caddfa4bf23d377d3f4a9ff00ae2e0bac7d7cfad3d58b99666fd971ddfe070c1a47f6ae76ec97ff009e929f5beb5f5b3eaf74369fda59b5d560e2869df69ffac57bacff003970ff0057face5f5bea7d4f3f269f4b17a83f761b4c718e050faf4ff08dadd53ac5e6a0b7793b7ddb8fb397177efdae2bd3bea1f4db7aa7d56c7b30ef6559fd332b25a59602eaac176d7bdb76dfd2b373367a5733e87fa3b1332c38e06237e8c9867c192323b0ddcdeb1fe2feac8b9d91d32e18ce799754e13593e407d0fecacb1fe2fbae976d3763b5bfbf2e3ff476aea7fe77745af32cc1cbbd94e4d122c2c77ad4e9f4b665543ddb7f3bf46b4efcfc1c7c5fb6df915d78a402dbcb86c33f476387f39bbf90aa7bb9e15120f858b6ff00b3cb64b9023b9a3c2e3fd5efa9f87d1c9bdeff00b5663c43ad708007ee56dfcd6ad1e93f59b13a1f50ca3d636e3e0f53c8b061e76a46ec70cc7b31f263f9bfdea2cfa1fbe85d2facd5d7b39dd3fa3df4b2f60dceb3249dd03e93a8c467bb21ccfe5dd4ac0ff192cc2e9ece99f5769b4e45941b72f2acb23717dfa6a181ad67a9fa4b3d35360864e233c9b915ab5f99c98b8238f16c0d9ad9f5cc6c9c7caa5b7e35acbe97eacb6b707b4ff55ec96a2af9cba4755ea7d26e759d2b2edc5783abaa3ec7f95d4ba69b76ff0051779d17fc6ee557b69ebb87eb378fb56268effae62d87ddff005ab7feb6ac351f514965f47facdd0badb67a6e6577bc097533b6d6ff005e8b36dadff3169a4a5d2492494fffd5f555cffd7aeb8ee87f56b2b2aa31956818f8be3ea5bec6b87fc5b77daba05cefd73faa4dfad1854d1f6a762598cf36d4e0d0f61711b7f4b59dbff45e929f0e6886b5a4ced100fe27fce77b92703076c03da7895d1754ff0017bf5b7a64bbec833e96cfe970cef3ff00b0efd97ff9ad5ced87d1b0d57834dadfa55da0b1c3fb366d492a02b806be0fd39fa5bc7d36d9ff007c5d07d4dea7653d40f46b328e274eeb2f657956b74782d9d95d564fe87ed7fd1adb7f7173564d645cdd5bc580771d9dfd9443b5ede743c11f9424a7d6feb5fd42fa9d8fd0f3ba8b3a78a2dc4a2cb18697bd83735becdcdddb1deefe4af20e8bd2737ad66d3d370e5f6d8618ce409fa763bf72badbefb6c5d5fd63fafd91d53ea6e3746b5c47503606673f5fd25357ba9b777fc33b67abfcbad51ff167d4bf677d6ac77130cc9fd5ec13a6db3e8b8ffc5dac639243e8dd5fa474dfaa7f5471edc5dacbfa3595e45563bdaebee9d96d6f737ddfadb5efad793f51ccbba9e6e4e766fe92ecbb0d9603c09fa15b7f93533f475ae8ff00c607d6afdbfd57ecb8ae9e9980e2daa38b6e1ecb727f94c6ff003747fdb8b93b2d2c21b5ff003aefa3e5fcb494c8b7d37fa40c86b413e2d9ff0004ff00cddffd55285163431b0358e49ee7bb8a763c5af15540db63be8b2b05ee3fd9af724966cbeda4fab5b88b6b05d458347b2c6fbeb7d767d367b9abe80fabfd4bf6af44c1ea27e96550cb1e3f9447e93fe9af1be99f50feb6f53875782712a77f85cc3e9013ff0003eec8ff00c0d7af7d55e8f7743e8389d2afb45f66334b4d8d0434ee73ac86eefddddb5243ac924924a7ffd6f55497caa924a7eaa55f33a7e06733d3cdc6ab299c6db98d78ff00c10397cba924a7e81ccff167f53728970c1fb33cf2ec77bebffa0d77a5ff0041645dfe273a26bf64cfcba0766b8d76347df5b178aa4929f5cc8ff12a2c0037acbb4e3763b7f2b2d6aaedff0012592d323ad347c31c8ffd1ebcad2494faf55fe265c3f9deb263c198cd1ff556b95bc7ff00135d0d8ff53233f32e71e7616560fdd5bdcbc592494fd0389fe2cfea6e29dc707ed2f1f9d9163ecffa0e77a7ff004174187d3ba7e0b366163558ace36d2c6b07fe061abe5e49253f54a75f2aa4929faa925f2aa4929fffd9ffed1a1e50686f746f73686f7020332e30003842494d040400000000000f1c015a00031b25471c02000002000f003842494d0425000000000010151cbc1be167196932c37a07bb6296213842494d043a0000000000e5000000100000000100000000000b7072696e744f7574707574000000050000000050737453626f6f6c0100000000496e7465656e756d00000000496e746500000000436c726d0000000f7072696e745369787465656e426974626f6f6c000000000b7072696e7465724e616d65544558540000000100000000000f7072696e7450726f6f6653657475704f626a630000000c00500072006f006f006600200053006500740075007000000000000a70726f6f6653657475700000000100000000426c746e656e756d0000000c6275696c74696e50726f6f660000000970726f6f66434d594b003842494d043b00000000022d00000010000000010000000000127072696e744f75747075744f7074696f6e7300000017000000004370746e626f6f6c0000000000436c6272626f6f6c00000000005267734d626f6f6c000000000043726e43626f6f6c0000000000436e7443626f6f6c00000000004c626c73626f6f6c00000000004e677476626f6f6c0000000000456d6c44626f6f6c0000000000496e7472626f6f6c000000000042636b674f626a630000000100000000000052474243000000030000000052642020646f7562406fe000000000000000000047726e20646f7562406fe0000000000000000000426c2020646f7562406fe000000000000000000042726454556e744623526c74000000000000000000000000426c6420556e744623526c7400000000000000000000000052736c74556e74462350786c40520000000000000000000a766563746f7244617461626f6f6c010000000050675073656e756d00000000506750730000000050675043000000004c656674556e744623526c74000000000000000000000000546f7020556e744623526c7400000000000000000000000053636c20556e74462350726340590000000000000000001063726f705768656e5072696e74696e67626f6f6c000000000e63726f7052656374426f74746f6d6c6f6e67000000000000000c63726f70526563744c6566746c6f6e67000000000000000d63726f705265637452696768746c6f6e67000000000000000b63726f7052656374546f706c6f6e6700000000003842494d03ed000000000010004800000001000200480000000100023842494d042600000000000e000000000000000000003f8000003842494d040d0000000000040000001e3842494d04190000000000040000001e3842494d03f3000000000009000000000000000001003842494d271000000000000a000100000000000000023842494d03f5000000000048002f66660001006c66660006000000000001002f6666000100a1999a0006000000000001003200000001005a00000006000000000001003500000001002d000000060000000000013842494d03f80000000000700000ffffffffffffffffffffffffffffffffffffffffffff03e800000000ffffffffffffffffffffffffffffffffffffffffffff03e800000000ffffffffffffffffffffffffffffffffffffffffffff03e800000000ffffffffffffffffffffffffffffffffffffffffffff03e800003842494d0408000000000010000000010000024000000240000000003842494d041e000000000004000000003842494d041a00000000039f0000000600000000000000000000007800000078000000350048006f0077002d0074006f002d004d0061006b0065002d0043006100720074006f006f006e002d004600610063006500320046004100760061007400610072002d006f0066002d0059006f0075007200730065006c0066002d0066006f0072002d00460052004500450000000100000000000000000000000000000000000000010000000000000000000000780000007800000000000000000000000000000000010000000000000000000000000000000000000010000000010000000000006e756c6c0000000200000006626f756e64734f626a6300000001000000000000526374310000000400000000546f70206c6f6e6700000000000000004c6566746c6f6e67000000000000000042746f6d6c6f6e670000007800000000526768746c6f6e670000007800000006736c69636573566c4c73000000014f626a6300000001000000000005736c6963650000001200000007736c69636549446c6f6e67000000000000000767726f757049446c6f6e6700000000000000066f726967696e656e756d0000000c45536c6963654f726967696e0000000d6175746f47656e6572617465640000000054797065656e756d0000000a45536c6963655479706500000000496d672000000006626f756e64734f626a6300000001000000000000526374310000000400000000546f70206c6f6e6700000000000000004c6566746c6f6e67000000000000000042746f6d6c6f6e670000007800000000526768746c6f6e67000000780000000375726c54455854000000010000000000006e756c6c54455854000000010000000000004d7367655445585400000001000000000006616c74546167544558540000000100000000000e63656c6c54657874497348544d4c626f6f6c010000000863656c6c546578745445585400000001000000000009686f727a416c69676e656e756d0000000f45536c696365486f727a416c69676e0000000764656661756c740000000976657274416c69676e656e756d0000000f45536c69636556657274416c69676e0000000764656661756c740000000b6267436f6c6f7254797065656e756d0000001145536c6963654247436f6c6f7254797065000000004e6f6e6500000009746f704f75747365746c6f6e67000000000000000a6c6566744f75747365746c6f6e67000000000000000c626f74746f6d4f75747365746c6f6e67000000000000000b72696768744f75747365746c6f6e6700000000003842494d042800000000000c000000023ff00000000000003842494d041100000000000101003842494d0414000000000004000000023842494d040c0000000010c7000000010000007800000078000001680000a8c0000010ab00180001ffd8ffed000c41646f62655f434d0002ffee000e41646f626500648000000001ffdb0084000c08080809080c09090c110b0a0b11150f0c0c0f1518131315131318110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c010d0b0b0d0e0d100e0e10140e0e0e14140e0e0e0e14110c0c0c0c0c11110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cffc00011080078007803012200021101031101ffdd00040008ffc4013f0000010501010101010100000000000000030001020405060708090a0b0100010501010101010100000000000000010002030405060708090a0b1000010401030204020507060805030c33010002110304211231054151611322718132061491a1b14223241552c16233347282d14307259253f0e1f163733516a2b283264493546445c2a3743617d255e265f2b384c3d375e3f3462794a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f637475767778797a7b7c7d7e7f711000202010204040304050607070605350100021103213112044151617122130532819114a1b14223c152d1f0332462e1728292435315637334f1250616a2b283072635c2d2449354a317644555367465e2f2b384c3d375e3f34694a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f62737475767778797a7b7c7ffda000c03010002110311003f00f554924925292492494a4c92e0bebf7d78cbe9b95fb1fa4d8da6f6b03f2f2880e757bff9ba686bbd9eb399ef758efe6d22692012683d6755fac7d13a3ed1d4f32ac673fe8d6e32f3e6da59badffa0b1327fc677d55a5a4d565f94470da687ebfdab854cffa4bc82fcf1eabee7b9d6dd619b2eb1c5d63cfef3deef7b95639a5c64b888d7e7f04ce23d0327b711b9fb1f4a67f8d6cc75d95ebe0fa58eeaddf62f48efb05823d26e4b9db6ad967e7bd9f43f96ac74dff001af4d9982bea58afc6a6c7318d78f70692ed8eb1ee6eef6358edf62f2d3920b812e24f3af014c5fb8b8eeddb810e07b82971493edc4ec4bf47b2c658ddcc707b7c5a647e0a6bc67ea47d6bcae8dd51a329cebb17a93d95e4301f6d7612daa9ca8fdef4f6d777fa45eca138107662208d0ae9249228524924929fffd0f554924925290b2b2b1f131eccac9b1b4d14b4bedb1c61ad6b75738a2ae2ff00c6ae55957d5daf15a0eccdc965769edb1bbaed8efebbab6a45205903bb8fd4ff00c6fb85c474ac16bb1da7db76538b4bc7ef369a87e8daeff847ef5c3dbfb57eb0f55befc7c77e565e43dd75cdac7b59bbc5eff6d75b5a3657bdcb2ae7b8bc91aec05c7e2bd77a0f4fc6e99d228c5c511ea35b6dd67e758f7b438bdee5065cbc22ceb7b06d61c3c52a1a56e5e0bfe627d64d5c71e86b8f2d75a09fc06d413f53beb207ecfb00247e78b59b7e4e95ea309e02adf799f60dafba43b9fc1f23cbfab9d6f0dbbb23a6da2b1cbebfd20f8bbd2dce54aaf4f6cb3c75f19f35ed1a8d468573ff005bba06166f4ccaea35d2dafa8e233d56dcc1b4d8d6ff003955ed6ff39ecfa2ff00a6a48731c46a42afb31e4e5b841944dd77dde3fead74fb7aa758c3e9d5c0375ed7b9c7b32a3ebdcefecb58bdf57ce14df698f45c596524594d8c30f6b9bfa461addfbcbe84e939d5750e998b9d538bd991532c0e3cea35dd1f9db95a8756965dc1e94dc49249398d4924924a7fffd1f55492492529729fe3369aecfaa59163e77d16556531fbe1e18377f276bdcbab5cdfd7fd96fd5bbf0409bf39cca3184868f5770b19bdef2d656cfd1fd340ec531dc79be1f5e2dd9199f67a2b75d75aef4eba9bcb9c7b0feafe73d7ac600fd9fd2f128ea17d4dba8a9b5daf2f0d6ee688d1cf2d5e7ff56fa753d43eb03f1ad7d9e855539d7b5a4d4e71076d949756e73fd3f57dbed7fe916e65fd55e8988fb72df86ecdb0b5d6578cd26ba9ad60fe699b773edb9fff000967e9955cdc2488127be83f6b7f9712113922055f0fa8d7e0f4e7abf496987676302781eab3ff0024a6dea5d39df472e83f0b59ff00925c6fec9e819dd32ecbb3a6bfa53e863ac65c0398e63d8df53df4da36db56e6ecdeabfd8baae7d5d3317a9e1e26163f54d066e354c6deef67aacaecfcda5f77d2fe6d47ecc7b915bdd321cf306b841bf96aff001e2f95ef865629008bea20f07d46ff00e49365d072712ea2768c8add587f23dc0b777f29713d47a47d54e995d75bfa65b7b5e4b0dfbac905bf49f6161f67fdb4aef4dfabb6d65eee93d532fa7fa6c9662dae1656c796fab5eeff0005653637f93ec4df6e342424476321a7fcd5dee4ecc4c632d3d4212f57fce790c8e9f95d27a85987943f4d401a3750f11153ea3ff0cbdd7eaa74ebba5fd5ce9f8191fcf514b4583c1c7dee67f6376d5e4987d47f6efd61e9dd572aa6d75e1beb6f52db2f6b4524dd6649aab0fb6bc677efbffc2af6eaacaedadb6d4e0faec01cc7b4c82d3ee6b9a7f94af63bad7e6eae76522ea3f2eb4cd24924f62524924929ffd2f55492492529733f5ee97d98381e98970cfa74f887ae9964fd66e9d7751e917538c2729845d8d263f4959ded6cff002fe821217123b85d035289ec417cc3a2e01c2eb395d4f12bb32abdcfaefc7ae0d8daec1ea6fa1ae2df5df4dff99bbf495adab3ae74b04efb32ab77761a2f69f87a7e93937d5e0c66566d6d2e269d8d70b186b7b4ecd596d4efa0f67d1577abfd60c2e935b4e439efb5e48a71ea05d63c8fa5b5bf9b5b7fd22a193d53e13126434d3497d5d4c67821c424044ebafaa3fe0b976eeebef674fa597d7d35c45b997dcd756eb58c32dc5c7ade1afd963ff9eb96af5ce996751e986ac622bcac77b2ec379d036dab5adbfc963dbfa25cfe4fd66ea7947d5aba35cc2d0436ef58d560075dba01bbfaae620b7eb67d65bb6d1660585ad32ef4ff004363ff0077d5bfff0049b2ade9c31cb4aa8f0f4b0755872c4ddf148cf4e2e190d3faaebd1f587a65da6465fececc6c0c8c4c83e9963c7d36b7d5dacb2bddf41f5bd4733aef4ec7a1cdc5ca19b99635ccc6c5a5c2c73ec7086432adde9b777d27a0d5f59712ba595f56e97761d2d302eb98322a049ff096c39deefde5d063b711ad6598b5d6c6dbc3aa6b44889fa4c1ee6a8e511136624785fa7fc66584e52898890bef444ffc578ee9bd22ee977e5542dd97d38d8ecb6bac904bff00a4dd73de3fc0b1dbdbfcb5ea3f55eb757f57b018e107d1698f277b9bf95703958d7e5758cbf476feb16d58358fce758f60f5033f799551ea5967fa35ea1531b5d6dad8218c01ad1e406d0ae61b3723d69a1ccf0c78603a717e6cd2492533594924924a7fffd3f55492492529314e924a794fac98df64eb147523edc7cdafec77bfb36d077e23dfff001bb9f8ff00d7f4d52c8c0af22fc7bad03763ef0ed35735edf49f493fe8ddf9ec5d965e263e663d98b955b6ea2e696595b8482d2bcd1fd43ac74579665039fd3b0eeb71b2ad682726b0d3fa0b5fff00722a6d2eafdffceecfa6aaf3188df1c4ea7d2dde5730e138e42c0f5075327a9fec1c36b9c287e1022b68c9ab78ae7e8b4dd5ed7fa7fb9eb2ae3eb6f4fa9bbaba3a6b4bc8d769324f1b5a7e97f6554eadf5bbeaf37a7dadaae667baf616b71d8090770ff0db87e8dad5c3743cfa7a6f56c6cec8a7d7aa9712e6725b2205b54fb7d4a7f311c5ee18126c11b5fe97f8cacd2c43201111225bd197a7fc52fa79c06e43edbf2cefbafa8d2e0c68ad8da9ff004eaae96fb7ddf9f659fa545231b0e86b8eda3130eb27c1ad63447fd162c4ccfaebd2bd16b3a639d9d9f7fb68a1ac734ee3f9d77a9b76ecfa4b5beafe1e5f59eaef3d55acfb1e05755adc266ad37bceea6cca7ff877318cf55b57f315bd431c593248719abefbff008acf2cd8b1c098006b4f4fcbaff59d7faa5d168a718757c9c60cea79c5f7bdef1fa4632c3fa2a75fe6ff00402bdeba24827578000003a398492493d549249228524924929fffd4f554924c5252e99715d7bfc6661605d76374fc7fb63e879a9f91658daa8dedfa6caddfa4bf23d377d3f4a9ff00ae2e0bac7d7cfad3d58b99666fd971ddfe070c1a47f6ae76ec97ff009e929f5beb5f5b3eaf74369fda59b5d560e2869df69ffac57bacff003970ff0057face5f5bea7d4f3f269f4b17a83f761b4c718e050faf4ff08dadd53ac5e6a0b7793b7ddb8fb397177efdae2bd3bea1f4db7aa7d56c7b30ef6559fd332b25a59602eaac176d7bdb76dfd2b373367a5733e87fa3b1332c38e06237e8c9867c192323b0ddcdeb1fe2feac8b9d91d32e18ce799754e13593e407d0fecacb1fe2fbae976d3763b5bfbf2e3ff476aea7fe77745af32cc1cbbd94e4d122c2c77ad4e9f4b665543ddb7f3bf46b4efcfc1c7c5fb6df915d78a402dbcb86c33f476387f39bbf90aa7bb9e15120f858b6ff00b3cb64b9023b9a3c2e3fd5efa9f87d1c9bdeff00b5663c43ad708007ee56dfcd6ad1e93f59b13a1f50ca3d636e3e0f53c8b061e76a46ec70cc7b31f263f9bfdea2cfa1fbe85d2facd5d7b39dd3fa3df4b2f60dceb3249dd03e93a8c467bb21ccfe5dd4ac0ff192cc2e9ece99f5769b4e45941b72f2acb23717dfa6a181ad67a9fa4b3d35360864e233c9b915ab5f99c98b8238f16c0d9ad9f5cc6c9c7caa5b7e35acbe97eacb6b707b4ff55ec96a2af9cba4755ea7d26e759d2b2edc5783abaa3ec7f95d4ba69b76ff0051779d17fc6ee557b69ebb87eb378fb56268effae62d87ddff005ab7feb6ac351f514965f47facdd0badb67a6e6577bc097533b6d6ff005e8b36dadff3169a4a5d2492494fffd5f555cffd7aeb8ee87f56b2b2aa31956818f8be3ea5bec6b87fc5b77daba05cefd73faa4dfad1854d1f6a762598cf36d4e0d0f61711b7f4b59dbff45e929f0e6886b5a4ced100fe27fce77b92703076c03da7895d1754ff0017bf5b7a64bbec833e96cfe970cef3ff00b0efd97ff9ad5ced87d1b0d57834dadfa55da0b1c3fb366d492a02b806be0fd39fa5bc7d36d9ff007c5d07d4dea7653d40f46b328e274eeb2f657956b74782d9d95d564fe87ed7fd1adb7f7173564d645cdd5bc580771d9dfd9443b5ede743c11f9424a7d6feb5fd42fa9d8fd0f3ba8b3a78a2dc4a2cb18697bd83735becdcdddb1deefe4af20e8bd2737ad66d3d370e5f6d8618ce409fa763bf72badbefb6c5d5fd63fafd91d53ea6e3746b5c47503606673f5fd25357ba9b777fc33b67abfcbad51ff167d4bf677d6ac77130cc9fd5ec13a6db3e8b8ffc5dac639243e8dd5fa474dfaa7f5471edc5dacbfa3595e45563bdaebee9d96d6f737ddfadb5efad793f51ccbba9e6e4e766fe92ecbb0d9603c09fa15b7f93533f475ae8ff00c607d6afdbfd57ecb8ae9e9980e2daa38b6e1ecb727f94c6ff003747fdb8b93b2d2c21b5ff003aefa3e5fcb494c8b7d37fa40c86b413e2d9ff0004ff00cddffd55285163431b0358e49ee7bb8a763c5af15540db63be8b2b05ee3fd9af724966cbeda4fab5b88b6b05d458347b2c6fbeb7d767d367b9abe80fabfd4bf6af44c1ea27e96550cb1e3f9447e93fe9af1be99f50feb6f53875782712a77f85cc3e9013ff0003eec8ff00c0d7af7d55e8f7743e8389d2afb45f66334b4d8d0434ee73ac86eefddddb5243ac924924a7ffd6f55497caa924a7eaa55f33a7e06733d3cdc6ab299c6db98d78ff00c10397cba924a7e81ccff167f53728970c1fb33cf2ec77bebffa0d77a5ff0041645dfe273a26bf64cfcba0766b8d76347df5b178aa4929f5cc8ff12a2c0037acbb4e3763b7f2b2d6aaedff0012592d323ad347c31c8ffd1ebcad2494faf55fe265c3f9deb263c198cd1ff556b95bc7ff00135d0d8ff53233f32e71e7616560fdd5bdcbc592494fd0389fe2cfea6e29dc707ed2f1f9d9163ecffa0e77a7ff004174187d3ba7e0b366163558ace36d2c6b07fe061abe5e49253f54a75f2aa4929faa925f2aa4929fffd9003842494d042100000000005500000001010000000f00410064006f00620065002000500068006f0074006f00730068006f00700000001300410064006f00620065002000500068006f0074006f00730068006f0070002000430053003600000001003842494d04060000000000070008010100010100ffe10cb5687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e203c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520352e332d633031312036362e3134353636312c20323031322f30322f30362d31343a35363a32372020202020202020223e203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e203c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f2220786d6c6e733a73744576743d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f757263654576656e74232220786d6c6e733a64633d22687474703a2f2f7075726c2e6f72672f64632f656c656d656e74732f312e312f2220786d6c6e733a70686f746f73686f703d22687474703a2f2f6e732e61646f62652e636f6d2f70686f746f73686f702f312e302f2220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f2220786d704d4d3a446f63756d656e7449443d2231433734343645383046353831344641434236304646374437353043343244432220786d704d4d3a496e7374616e636549443d22786d702e6969643a32393345443743364243444345373131383436454335343231354638384234462220786d704d4d3a4f726967696e616c446f63756d656e7449443d223143373434364538304635383134464143423630464637443735304334324443222064633a666f726d61743d22696d6167652f6a706567222070686f746f73686f703a436f6c6f724d6f64653d22332220786d703a437265617465446174653d22323031372d31322d30395431343a32353a34362b30353a34352220786d703a4d6f64696679446174653d22323031372d31322d30395431343a32363a34302b30353a34352220786d703a4d65746164617461446174653d22323031372d31322d30395431343a32363a34302b30353a3435223e203c786d704d4d3a486973746f72793e203c7264663a5365713e203c7264663a6c692073744576743a616374696f6e3d227361766564222073744576743a696e7374616e636549443d22786d702e6969643a3239334544374336424344434537313138343645433534323135463838423446222073744576743a7768656e3d22323031372d31322d30395431343a32363a34302b30353a3435222073744576743a736f6674776172654167656e743d2241646f62652050686f746f73686f7020435336202857696e646f777329222073744576743a6368616e6765643d222f222f3e203c2f7264663a5365713e203c2f786d704d4d3a486973746f72793e203c2f7264663a4465736372697074696f6e3e203c2f7264663a5244463e203c2f783a786d706d6574613e2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c3f787061636b657420656e643d2277223f3effee002141646f62650064400000000103001003020306000000000000000000000000ffdb008400010101010101010101010101010101010101010101010101010101010101010101010101010101010101010202020202020202020202030303030303030303030101010101010101010101020201020203030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303ffc20011080078007803011100021101031101ffc400d500000104020301010000000000000000000008090a0b060702030501040101000104030100000000000000000000000701050608020304091000000504010402010403010000000000020405060701030809002011120a30211031141516411318171100000700010302040502050500000000010203040506070811121300213141221420511516091032306171d123f091a13324120002010205010603050408070100000001021103040021311205415161712213062030321081911407a1b14262f0c1d15223336324e172d24383151644ffda000c030101021103110000009fc00001c0459d7dcd87e2bab46786e9b8fdf6a9845c2cbed00000001c088f59b2a82ae152969af6f8faa9c727f37b240f94c7766364584762a000018090b0b265b163c633d50d86675abfd5e5d0f7ab126bb9db5c5b979ede5cf21bec54000023296dbe56858e48962b6a3ee62afc1254e4afda75b3bcddae90f09e75f6e309061150f5e2000011fdf0ddeb16c3e51b08b50b74f24f0debdce9eecc7cfddd3cb8d7bdb89a3d6bdc9f0338272ea00000653b5df2bdc8ae757568c66ed3d96c7fa7bdd60da98f67aa77cd56fc9660ab4b24c8572154000018e70b91a21f0f6c3398c35b17aa724c0d7b5a2e692eb72f3babd2dd52ec053cdd8dd3e5e5dfe4000004016fbb45bb5077fd4ee2d903494a9136b1c931656f82676ef9134e0d2f386bfcf0f68f483205400003ac60186760131eaeee9e0f38c15a8f3a8e9426beec866384670b6f7dfe64bcfdfb14e750000006bb7283c6afee57a58de5514bd9ed3a9596acee93864c504caa66ad72ee000003e1c06ea22bfaedb5a9531cce509e7b17bd8c29b0cb2f6834ae5359d46f9c1c8000eb2302ac47ebcd8b9ce74f8c653936b0ee62e68d25c4db37eb93456cbea147abd5e596b538cb65c5759c8067f2a9caf7fd3b1477da71959baab90ebefb2a3b3a6bdeaf6ead72f44f7d4b7da9d2b08066d5609b5e6cc2e784a9962afadc3ad2bf12c9ed47b5d9ec1fa1477aa70b191c1c2400e26a019d556f01281a8695df5528751c6878553729f4fa7fffda0008010200010500eab976d5aa0d59301cb4e54aba12ea89e6a9f12babff001a0b85d414ee0522810553c6105c27da89eb80367fe030b65ed8d4cf97b55bb28b28b8c322b17fd641deda5319aa5f08d24a0cc2b75ab98b855389da082dbddd2a4b4adfe795a7231791efde50544a3b4a8454ea52002e1001ab2548b82c985f70ff005374d6836d392df048cb01aa51db88cae5cf1373a6803e00ea5a3a493d2e475b0b4d9481243b9c96c92e3890974d2ba3a171babb263aae2dbc2ddb3edc6f26320bf5c87e3fd31c0a092e16d8e3a72006904ac477659cb569254576355c4bbcdb62388ea8395d65178896008057a9553ed2aa6c9c55409d1a6cc5975dc2b1eb71246a0d063db206180a972aa37d52e718c9c153275af957ae6a6bde596ea5ae9a4e22c5929c4b23ab915edd1cd24ad2da886aa0baa4d943b68087dbefafeab478b1da86dcad18b9f00723c910db89b699112fda3312b6db16ca53ea9f0cfc9770059ab39282615b93e353c1f7292c3c411a1201163fc1dbf0ed6a9078232d41cf04e1956daf9e506dc0a7ae0c914b040a7c810761fd77f83bf40abda96ebdc34fc7e9f25294a7c1ffda0008010300010500eab25ef9915b6daf5ca986338ac54f37965385f1365b555d1d93692876ae387cc5459b4215a50ff6f16daa34e48a57bd7ac8b44d98b08e9666d59b1123fcd83ff2f7ff0092bb35ce900215263b6e3510106fd29d6da2361456d42f5ca998ed929490914a0434e5db60bd6e5b61a7952a72dd57530411005d4deb976dad8c95cbea6d25128db6bd5f4cda0a8f5678a9475b72b45d245dc8877881b6aa9dfbb4bf7fa9b445414572276f5d7f486ed87d8ad136a6d769b9db29a8eb2e7abbda30cb16d2347541a3ba9d6af208e95efd71277a48add4a5a66ba6d4b4cfbf69ccb07657befc6d99554d694c4d95c2af6945aa8e8ed063df40387ee02e9fea4254ba88b10fa8a629d97d3f1019166ebf9eeb824d75ca9714c123122b54b4e6f5b0c94bbfc35f0d3b53af1f5eb69bae3536cd8575190e2660a3828c76adfe352276ba02618aa6b6921e8e5bce872fc001080362484f020cf7ecd31ddd6bb11708355d0a93b36cd149e1d4ec128fc3dabcc5f5aafef5ef8e292b87418c2f415d8d61b438f2b2f1fbc7e45eba06b5e501cfaa7196f051632f37323190aa03ef56ba5a43bf2613edd93e7cd2ba8f853b788bb74529deb4a76a7294e0f9db83b8315afae043db9dfef820f7a57ebf34af6af9f3bd395fae7ebcf1fb17e80a52bcfbe76ed4f2a52951fd7552bdb94af6af7fba8ab5e505da9dfeeb5efd3fffda0008010100010500e915c0869953b15c24c25e48fecdfaac66a7a3fb594c6a2edc6cf6b5673925e447022b8897c03176a6fc377f2de2fca0f59dac51ce6e67baa26ccc9250c1e26fa1a9ddd226d5e4ec20ca2b5de81ea93e4d614351ee4afb7d2a1479b9ff00ea9d966545bd13ec884137a75d9212589635cb9af0b2735a887fb1d6ce3db932db302d8bcfafda9e535e68ebb1e4aaa2756704e038df15f124362df2966dd380adf2a3db9e0242f3b633331f6e8360c4c9b5b39278cfd5ecccd26eb8352e83163be4797608b63c6cc5f379718a040c12c91c7652a589463130565465dd936257fe3d49f87b901aa9c7478e25ebabab7f014a776b775c38f2d2c8dcff0096f5618510fad7fca18113ee355218ca4c876d642623ea97141031cb5e6e56e1888b2203b05d84359c480f041eadebb4965d107e19414720ecc95dce4c5d286dd5fc96c555b3871a97725f19d97b09c68790263cebc778e98f8e5892efc497a6b010145b1afbead97e3abc326b1135ea55211654cb6cfc86b0d50246d9964b4b2648ed7764cf70b6f65511b79a11d928993932538edf52b661b610d31b087d5743e41d90c736e1bcc17fc0edd921f32664b8f5df1114db5c00d24c3704919116ef148ea12646a5f0b58ccb8d400a03e095a2b8ee6d8ed627dcc2c125bcaedb9ebd53b1fb08e786762de57cc1ba8c55fea58070fcaf9bb9696835edd55ad29cadca7333b6c5afac0525afeccc9573d725f2f7402d7921e653d7db398e9fd7d6a0a1cc253589fb348a701a7e8ea4c8ee5b67d061af4dcb9e1cceef6648671dddd983bddda4e625db37932eac688b1cdd996daba06dbf0c9b92f3e277842368b317b32da9b0c9bfd91d261bc6e4ac4aca9c97c3c77e167b7349cd9161eecbf06b3cd3022a0bf3bd2ce353c04d6c922a3284d42d9b113b36d0ea4f4d792ebcc7c80dac685b4e91ae11e186294d19d53265de22e35e9bf51d91130bcf2a268bc9e26cac8ed5bb94467bb91946b5fb91e3cbec25fc6e6352c9db6b85f293d7c76cd8a971c6686cd5e725c34de377824d693762bbf19032c34e7eb3d9220c64da7fb01ed407b15ca671ba0d211b494cb2869e8aa965d2b78d1a1cdb5654d756587af4c04c0efcf8d392ee3e4133fa24bfeb3fa6d976f3c3d3930a2b5907d2c2c39ec12f4939293af36fd34942cd23ef4d4c1d4659893d6774dd14198831ce00c7d48a0294e5294a7e3fffda0008010202063f00f889a95028027331879bea72a2627f7769ee19f662b1154808739073f01a9c29a374b2740723f81cfe5d34a547d4baa93b4741fccd19c4f4ebdb8156faa9241d3451e1d3b3c71e44054401a6369a4027761160ac302181cf2fea18b9b5a840a7b57d3e8588c9b2eb273cbe4b53a549aab29cc8d01eceff00bb2c54e4f93be4b7b6668599673034555059bf08ed38fcad4bfbb807eaf4607e05b77e230b587b98aa931069549fd823f0384a7c77ba2ddeab6411c9a649ec01c013d827005748622468647682328ef18a35d7e9a2374f66b97dff0022e2b523150401f79c525761351c0d27239927bfa0efd72c5fa57664f4ae1d000602d35c9107ef6ed33827ec9060ff004ea33c52e06feb97e39d9540624ed2c7682b3f4b4c4c18226419c50bc0a7eadac3a41307f0d71b94f94e63e3bb57fa3613f8629dc5ddc2d3b7a3e77727e951ff0056806a4e431cb5ff0005c4dc3d956aecea05369824e70075cbfab2c48f6ede6dedf49e3f763fc4e02ec7fe27fecc10dc55c023fd36fecc58de57a4e12857a6eea654b05698cfc3bf1697dc5552d6f74c627557996461dabda3223313844998007e197c77775c8395b40b0c4092376432f1ff008e5817fc5aa55bda955151aaa860a4aeedc148652db74953b4998918a5c6d1e7ecf8ba14428a95ab90d5aab3139f9b2000fa42010322716961ff00db5af374ae9c21a61d4b82e40101663299dad96a67318f7772fedce52fef792e3492d6f5eb335ba12e119d00218aace7b9a40cf319e1f904f7af1b654e372d3714e23b22098ef33da4e28f11ef7f6c7157956a7ffa689ff317430ebe65a9d9a2f762953afcbd24e2aadd97a1eab0568741b694b100b03d991e988f8f9e2c0c0a539671075f1ecc707ed6f725cad954af6a95a95c196a7eaaca45419402919e9bb5c7a545b8fbaa139541716fb63a6b527bf3d3171ee1e42b5ad6f731534ed68d165a8b419c4357aeea5977004fa6b273d4089c56e4394a7eaf19745a85dc827752ac086204ea24309ea067d70d5f83e3db95e0aaf9a957a20b92ad985755fa4a83041d0fe38b7adc8714d61c250aaaf5ead60692a53532df591b8c0d04927a6a4712d42dfd4b5a97b55a9b32c808084a6a148fac800af5034c5b2399714d41ebfc23b73f8ef78dae26956a654e719ea3f6818e0adb92b3f46e3d065db323cae4647b0883f7e2a8e3de9d2b1a4407ab5085a493d093949d6353e1241b7bafd40a0f2e0b20a1ea2823bcfd3e33976e3fdb7b86d28bd4704b040ea48113b46727bfc4e2bdcfb5bde942f2eb33e9536f41881fc2ab2013d904e2e2d791bbae6ad36dacb519a548d4104e51a1c7b3f8674629f993766003b1158805ccce657419091da24b76fc8a5cbd9522f7962d254664d263e62a3a95304ff2ce394b1b57a816e764e7014a3860c07f7b28cf49387e26a70b6f7d788b90f2a5470074110ed1d224c1c3fe5ff4f76d58249650aaa06a58ec10075c5ad54b7b7b6a5695b7d3149003bd4fd45fea68e99c7762aa00d5b92bbabf7b331cff007eb8e2b8c2a9f98a34155d80ccb6ac2758dc4f777609f9041191fe91f7e399e1ad08e379fa8b4eadb0262857ca59567e86272cfca4e4b034b2bab8b67e3e950ac19ab13a410485832d3fcb23b72c723c3d8deb50bbaab93c9f3119c31d61bafed0715ae3dce8965c2db9dd56abb83b947550b24eee83239eb391bce778cb635ab7ae512bd410485d4d34325573c98924c98da3004fcae03dc16d9564a869b1191cbcc99eb979bf7628f1fee0b46bba14f257062a2f719c9bc75f1c6f4e36f1aa7f77c801ee99c1b3a5445af0ea4b0a6189663d37b0807c34c7014d560bd32e7c5cc8e9d91f2eaf117d55e9a960cae912ac273839104132247711863c58a77d6e248284068ef42419ed0263a4e0f1369c4d77e481829b0c8ef33a01d4f4eb8a771ee7e45695204134a979988ec274533ae6c23a62d6c6d536dbd1a61146a42a88127a9edf9ad55400da4c0923c627063e693823bfe7920667e47fffda0008010302063f00f8b65bd2676ec009c53dbc4d686204edc84e93d83bce431450d0a6cee6005698ee3396185cf1ee1575206e11db2272eff975ab5c5c1a3c75223730cd989d5127298cc9e996470d6fc6dbaa518f1631da4e7d4f8625eb308eed31bc5662c0cf81c563bf78742ac0e7208d3efc5b5ed0a65aaab37ab0642a93e5d4c88100e08f90b5eeae52829821584b1044831946ba1138b7e1b87b17bab90d2e4154452c601a951d951099100b6e3d018c35cd2e2ac3cc3435d8c9f114c8fde3bf06854f68d36aca3515e9ec23b9a649ee811db82791f675d0b65f333d1d95401da45362c04f6ae19eca192609cf703d8c0e60f6830462f28328f52e5b60ede924f70fecc1f8ec6d6e403449260e8481201ed1ddd70cdb8134c16f13a40fde7bb1c7ddad25a8cf4034b099763e773ff311e3b601c94442a803bbec6a5554321d41008fc0820e2a7b938da7b6fc4c91913b15aa1dc47d490194860db495285208379c590bb8a064319c81b867ae7a6191c438241f1191f8f8b6a7f5fac07e38ab6f4289a9735094441d491e633d020f3331c946671c458fb8f9aa09794a92ab12d0a0850bb64e8444e7073cc03900bffd359127fd6a7fd6d8057dcd6464c655a99cfee63842397a241d20933fb31c971d6f550d4ad41d50e44ab3a100912235ca76ce922671c8d9f32a16e6d141273daea1615d41cc0788da7356952729c56ae136877263b24cc7edf8f8fb6e2a907bf0e5d54cc1d837119024989800124c0009c7feaf9bdf42c28d277a894ddd5aa7f8a2990cea51f6eed5559770100c1c54e66efda7c87335eb13e9db5056146922a8db3b206e27362e1c393901a62f3955fd36bdf6ddc590353d57a45299540492cec02ea0101d086fa7290c3da1edff007770dc6f1fc372672b9b7b754ba78a4d55519d95954d40a482a08041510c36e071357f4ef96e4ab1f21ab4856254c6a5b78cc9feeed1d8a06975ee0fd3af74f33694696c1f93af9fa7564105a9baed6a6b3f46e2e402454072c5d8b7e0ee6a73342c853b86a20d45f25562f5321b8532349961037163e633f1fb63cc003588926066a6476446b38f70fbe3da56ff009dfcbf20f42b5a92149b72cb50fa6da31df9466403224800a5cdebf25677f1e6a4d42e18a13d370a3b4f8899c5b7b5b8ba37547d982aa54baaf5c3536b8546045bd14708c55d966abec0150100bef216dec783aa28f3362a2e6d1842815a8b075920641b3560206d7681a0c258fb9ef9786f74d1f2d6b7b8daaa193ca5a9b543e70d1f50241d673817d4b86e79392f70dd52db6f46832d56a9534404520d0a09f31301564ee9853ccbd6bbd9774f8bb715114896a87754a9509063d396208cc1ebd98bea94d4046ace44642371d3bbe3e3796a0d152dea87fbb43e39138f715e7137c2e2cdaec36f88624a090c3a106477c62dc5fdb9adc95c49a7469a07ab523585d481d4ca803f8a601377c77e935e2d20a429f5d29920f5d804b1200f29241ea270cd75fa7fc9d7a74a404666a6c01327cc48040e857a64b9658b7b7f7e7e9f5ed85a4c7ad514d6a6b2757a8b24477af8b0c51bbe26c280a7510323a41565686047433ace3df3cd53a8a19ec7f2693b86f760a4aa903682a1c10090cde6da0ed62bb7b32f9173c1df55dbc7f2006d39c0aa9a03009f32c85004960075c713cad46a6cf6eac15a15895752089320860c0e841daba8c1e5cfba390e195aaf99937d7b70cc6012bbb7d213130db412349c21befd73ab5a892155503b392c614206acc0b1e82317946debdddd25e52db51ee5cb33ab0cc6cff2d01fe55dd966e46580fb928f1d6b47689d005190c84e4074048504e8b8e6f965aaff0091af70cd4d093b5507950ed989da04989339fc9574621d48208c88233041e841cc6380f70d4a6793f6f52a9529de10bfee281dd9310b22a5303362abea0ddbd8331f35edbdbd7a77d75734995296ddc198831221801d0fa9b080490274e339bbee3c56b3a354929125777f128ca4a68208207d2ca608b4b1f6786bff0070dd42d3a14c302ac7404b2aaaa8132dd36fd3064597b7f93e4969d36b60f5685282012c612a540002411055400768de5c8047c9d31ee0f6e56ff2ca8aab33fc5e5700699914c1119e675cf171cafb66f16c2f2a92cf4ca96a4cdda36f9927b34eec2a54e72c1694e6c16a931e1113dd38a97fea9bbe71d4035dd40d8b22453504ed27a919c4039463dc66abcfa2e9486bff006d40399267cd27eff919633c0c52e6f8fa4aec015646c832c83911a1040224329d194824629af2d52a58dcf51501db27401802b1a0dccc809fe1518ffde5ef314578c22454dc208ed1981d0c1d1a3cbb8c4d7b1f6a5854af59948f56a0d94c4e523476057b15181cc3e2fb93beabbaf2e2ab54720402cc64c0ce076667196b898f86311f612759c4fd8949aa31a4a642c9804eb034f1c18c19c11d7ecd33f8271a7d93f69edc1c65ae32189c69f22713f6462713f0ff00ffda0008010101063f00fc223f1e83efec3edf2ebf0f87a8a4b94fc96cc71d959d295484aa4ecb2f2d7d976c71394afe333cabb39dbcbe8cef4c4a2e891e2dc0df489fb84005db8a8ddb76db1f227045b45653c75d34ab3e5cdd7c409cbe8f0d9fd659b731c00a655d3d412275ea630000f4dd8340e29b7a2e63279edb54e2f9b359e6b7ed362f548f6f1c7a0c1edf2734f62682d2b56d760e7f557ec1214e28a254902bd12f99442b3ca4c22d78fd16d33545aa43da23502cf42d41dcd5c53819cb8cf4b439a5920ab43d7255b3f9850e714d92e91926aa2c2272109230331153b1c7555409210b22ce55899640dd8b26578c5559b98e91bd8c1dddc51f8807f823d043afc3e3f0f46e13f0eed95eceb468ba94559f90fbec94547d9a7f336f7368a39a766994c24da4e6b89e933b004349be967cda4118660bb7f0b63bb58a646d1759e969cb9df6d8e9596b7e89a0d865ed3a45e259c0018f2b68b0cc397d679b32821d401c382a49fb0249a29f42811ebb9491445a78dc2444d02a2d9b3a38f6a6ddb3127726e564c86ea65551ed27c40447d345569978f5da4e1372459dae7347b5553301c0ea9d6ed6ea8a621fda421ba8fc3d49bb5250f3494cc73b8a946ee84fe27d0ee8a64dea4d5a00260927e050e54cc0502818dedd47d4434d764a7b44c6799177a267fb157a2a413460b23d2e6662b148cef772c7110791e84bb3a783286b1a6d81b9e6d2220b2e73396a989fb4c22225110111f9ff009f4ea3d3a87bfe3b9eada95b212859be775c97b75e2eb647c9c7c1566b504cd57f292d24e94fed41b3644c2052819450fd084298c60017ccb88dc51aec9e6918e8e119a1f24edb63afce5f23143746b39139cd123dd2b508a954801566596953c91d05133aac9b9c4520d66fd9ae456edcb71d76e160d874786a030f055a88b5b16451649be9eb0bd462e994f8a8a8e691b13faabc2383b66bd4a5308f4f4e249de458843c8ba4115168a9bdc229e4ca67217b9203b86310ee313588737bff00ca2027001111000f47835389d18f1764898519e8ed833f52bea91c180caaec64d79132e79258ff00de6512050a1f907a525b4ae156b6c2aec5515646c9454d9e9d148241f5aafa4ddd11ccd49a4d12ebd4e65088a7d3a88fa59583f19d3172a24f4c62f63d41da422066922dd430b960bb700e9f6ea814c40f7e9efeb8d5c66ac1da3073a16e153b54ccb3972ddb0c567b8f48b0d3f499d689bb59b22f5d45c356d36cd9aa47170e5d3c2810a2521c4a637c847dbe3f0f7e9ec3d0407a7e3a764d18ddd9613917c91cde817b904d270ac7053eaeda6b4d5ebd262897c452d9e6e9cc91202872915290c41ee137b3a552501d0404748d89ef94048d85f95baeab73ae0400ef0ea990be22f6f6903b4043a7ac9b28ca1824dd3b4562ada669d744fb427f53bf5c6b515392568b14aa60572fca551f8a2cd031bc0cd9a4922914a501ea3d43a808f5ff0031f9f5f9fe7eba00087fa0fa2acd1555054821d8a22a1d3397fcc0c41010f5b9f256b79d57e9fca7c228ce7518cd12971c8d7de6a757ad3a6ebdba87a9454611bc75cc5ec019659948ae97ea2d1ca04ed5bb04e4337fd9939295bb65065622ff009bdaaaaf490571ac5aea2b36b657e42ab3892073b3977a810c8a2b094aa26aa9ee63a7dc51c177da74b399daeeb992d16f2ca55f11a2724e169caf3073249cb271edda472532ce505745d95ba49b72b94ce09940801f8f61b14c26f4d3d9869588e879e1998a654cb7b69a34356982728653fb61ddc4595ea2bf688180140101ea1e8f9cd0aa33da25f2ed36a5069948ada1f712567b449a6b24e23a3d1f649363111c732afa49c891ab340aa2eb180a5f580e7dc92d5f2586be66795d2f3fbc58dfe815e82ad39b1d7a288c8cd6364ed1210cac87d8b14d26c2a8a64f3990150850218be926afb94fc6d68e9c17bdbb55773ccc16589d7b7b934c9665044a260e81f31f4418ee43612f7ca60225f6fb067c7f21cc3d0a54c3f71009cc23f20f7f48bc6fa9e54bb37265536af13d328a76ce9444fd8b91bb80b00a4b9d138f69c0a222437b0800fad2f3c2482512cf56cd2e74542c7f6a6968a684b7d724215acc824d5622732c582cf8ae0c4415ff0094a4e85300880fab8e29ab30455bee60ca0524d9412a79487d022dc4724c68764a03e16ed9e4835d0d4590499a2b2445db3b50cdd6210e5f7e20f1df44317f7ee698bd6d8dcda94a627e93669c33bb54d40180c23d4f5d7f3a76061288904cdc44bf4f4fc7abe00921f7ba5f272c745c770f64bc84341441b573d9e3eed5f7768b3d8a462e06a9556695455fbb7ee96002790892653acaa651b4e5b6db2e8a6cea9b91dbec9a7c4c33b7f8f58ad730c6599415b7317b31559f93b133a6b5bf2ab3172e5848b25e663d910ca020553c65bc6c735c709fe45da9682b55da978956a567f33c76b35aa2b0689b2a0403585752d64bd6916122a50668cbcbbc7f637e0babe341327ad1360b470b2efc139ccca9165bc57f468b6577a6da28777a5d65f5c192368cf2f91ce62ef1424e5235b46b89551a26dd776eca93758aa14c60e0b64fcb0e3871278e3957375668c59725f8fb8fe6f5be44d87c59bbdbcc0d4ee05ed5e2f399ed1a39049f3a16914d4ef0c029f5483bd0354ab535c1fd734f89b349ca541dea9fbcf5b55e443f814d04e4ecb6c90ac491d5ac3170e16006cab584588f1411fb66c74ca712d89f70db9d5cbfe292b58a81646030cd1ac31da8e5b49b84c5593be539ac9b4132948ba66f6d8830a0f11fb11908e70612ae7f3a676deb869cb9d568b5eaa5638f56ec9eb9cd61816f397680abc56156396d12d5b53fa1d4a2ec777aae232e93268d9b3f9140d1ed26c45a1dc82499942c2dbaa9311b62ab5aa1e36c75ab0c2bd6f270d3f0136cd192879a889268a2cd1fc64ac7b94d741648e64d4494298a2203f8f8986afa09bc9461cf7c141264b78c52748bc8dbb15629cab7fc471485029ca537f71ca001f5087ade79618e55341daea66b45ee91ace35444215f69b5fce747894ae4eec394c64ecc42b5d56cf99ea0cfee9c450be68ea6221e1926802e50ed33924d5b794b519303a675e064f8cfc9daacc226000ec62a5555cba59920740c5e9da9a8a98a7111f21be3ea078df4daeef150e27c93f8cd17927acec153b3e6360d869d489968f6130cc66a766610d6a52af6ab4a48059ac8eda33624410fb46e75d530905f55b2a77114fda32abd67daf71a67dc14ad616a5ac652267d49895952266fd32b93f188ad04e540031516aec0c6298a410f4565a5efe871277b8d6ed22f5ee3fee3389e733340beb3481b59212154bbb589ae5b69e32e92aac5c9c449396ced9a8998c4495ef4c2762725dea1b91fbe5c6bf63a962b85e3f6886d56cd7fd26d312f23eb683080a135966f548b692ae4aedf49b955248add153b8553f61077aa923a12559d0b3ce33f142a179a55065e4639fcedc9366ef6bd1b46b04fb116657d9e404da922c5d762ea2726e1050aba62d80014e22c44a3659a3b0c4aa7260dd720a464d9cf22a4ec678d11293c0d4d1b2291914c0a5291112940000003f1e9146cc50417d8ab2ea0354c5d273221149b9d3339924e7e1e2139054536acdd599824ee2d05573a4d925de90eb1c89818c1c98acc73bb4aeb676a6715b9763a0d1e5f32d0ab92e9e7cc4d215abcd0a71041ed7ac55d78a2ac5c99333864eccd85cb670ba2b11418977a5cbdca76df6575231f9ce359c45beb2ea5a43d87ec094770d0e81bc7074d8872b1527332ecc440ca8f8922aaa7d0295baa3fc696cf02fe1231ec64168ea72224b23d222e25fb823c3458b6631b1ae26e3ccfc84700c1ec73f6c2e03a95201111f5059fd8b88fa3388b879141d4b0e7a66d84e9b7d5db94c9c5257ad501ab98e324c0a020a161a3207f5238028e47afd2681adf313813b4f1db3f8e7a58d6ba5ead418de4964919332ef8ce1cad6fbdfe8f3933187947ce8eab97cbf995ea613f6894bda10160ca29d99d7e32e6dc558f9bce6ab50836b2cc56604924576933568b644958a9062a915455494324ba2729be6201c892d2861409aa69b87f0a2a48aee1ca167b26897ecee28d728e816a8b6321295da365ce6565a5dc2cba484378fccb8090e50f50f5985441b4357222320221b1448256f190cc5bc6b140be329130049b35297a14a50f6f600fc7f0ff00c7c03e7eb29e513c04e372be46676db893ab58044a847d53618f9d7960e3b5a2ccf1438834657a24a4ad45376af8dba322b4724a1ca2e09d71abada63a20663251d162e54578949596b655f41a338a258b3b7f22a148e9bd266c152b9958f53b9374b209080114277fa8590936f84d938f4c65a2b3f864390b8d8dd58e4c9c8194082817da454422aca3537eb8fd9c7af61fbf16e702a277425f1941590afe5dfc69423ab13b6652b9352ec2fd593919154a847348a8b7ae99c84abf7eed72a6d9b3115ccaa87294a41f579d0f65708cfdff0052caa5f219b6754ad32caa914dca2e680a962a155734820fd2da494a24e3c323312c12336af60260b2242826110f9d0c0e6988e014078f54322424757a9d4baac1251e5222917e9499434132104c850151c393913201d4500059733f4ec5622bbcbae4bccdf7629eb2d9e30ae344cf685aa4bfdcd0f3a6eb3c55c9aa4e5965cc2191936cd5368e8ab09db39ee14c4beba07400f6f600e9ff005d7fc0b864facd420eff009b68504faaf75a7595995f42cfc14927d8e5a3b44c253a6a24200aa0ba464dc3670422a89d35085382f09af2323ca6e2971f76ad978f7badda1611ec8f29f2389abcab57597deac0919c806c54481cf25625d9a50844a71fc72eb9df028ab722ea5de3aada453b94b2da651e66021324a9c54ccb309a09d8f51bb53e8eb4d43318fa64445b9508e1623a37df9574408925de1dc5c63901a3e724d42979ecfca3b95aba3e377355c3ce315a3a3afd456924e528b7b71cd96702f231abb3024e07bca5326bf8942c64071466acfc97e48ea3db0392e4b5ba3d960a41b59a48a5134be84eee0ca21841b1acb732af1d20551cf9450105144d0f22e59f71cb988a9a785717f3bc83478ae34569d0cdd56539057a7aee773cb86f76551168df5996ac55eb4b4f30afb56a8d4e1e45fb558a9bc5db20e47a9fdcdec22610e9d47dfe41edf8fdc403fd7d0014404c3f2f88f4f9fb07e5e9e9793fc9fce2936c6a8a8b36cae0e414beec72aa025ded5b34cba9694edbd992454315245dbd6ad63caa180555d32018c5e74f20f54ce46978c72baf08cd71be1dead186f046f1b9847e4f67a83c2304513ad7384a74d413f9a7a6ef055fb850891851480a139a3f15f4c8fc5e62c6fd4969da04fc51e433491947063aae9e318e62a20eeacedeac7eaa832f235308771514ba880998bbd278e10b1ca1ca9ab3dfac5e9f1924847eb70de293824d739fa7b948650003e1ddf3f4eefb3f6271b6eeb38ccb1d277e9b8c2308b868d3090ead7ea10aaaced48c8670b1405c18ea9d77bda0554c09878fd6e8bf358f0194f1db9adc8cd2db71b394e44a7252213b5719e36958edcf22dc5b47307a34a6add6049f55665221a2d48f59c91f28d8c8770c3e8195df299a6d0ac0dc1d40ddb3eb3c2dc6a534d8c3ff00be2ac35e7d2312fd2011e8264953000fb7ae8021d7f2ea1d7fedd7afe1287b889c7b4bd03afd5f2ebd7d8007f3f5a3661c6cc695e4158737b7cde6b61d86f7a755b1ee3aa3a1578be1b3c053259ba375d576590a4c9fff002c9a55fad8321721e323fe83e509283b072715c3f31912a882b9bf1261a631587708ac3e372d64b45947f2db74f47b96bff12c92d2ac9b38031cdf6c901bb41dbc4e2fcd2c94d3cf0d6ccb1df5aa727cab19c2d63bbcf3e3ba7a31843ae2ba075d65920130aa26515e850c72c187ea94ca47253853ca5e6156d7abdea0df4f645a6b4ddbf6bd827e0b444a11665a055ff55af1d82905628c555731a66e732ac64123191f575c0761d42a59d6b59bb878d6ece2a36d6db861add68b3764ba95fdca871a9c7ca25107ea57c8bc8a8e791ea14e92e902892a044b72beebd9c55f1b76c19494569d216f885a9d3eda4c843c516af2b1ee1e7eec7b2a0a141bb58d23a74a98c0504faf5e937c6ee126a389d6742afc6a93b2f70e424ac90581ac2b0709a7352f9371eab474e575e98aea4a15c2cde4ec95c6cd482551d22a23d486e10ff1954dbbcceb56bcc9deddca4dceed7b750a7b2cd5e3904672c5a347b1f5d8e8981aabcb5bd099976d12d514936d1e9b6f181be950f2b67e22f20b4dc366983e6c673399c4c81b3dbc8b72148da3b44cce61190cd2fefe17c6522e0e6395495e853f794fdc1ea2a9bfc81f1c13d1e3ca745a1b77e2a374985a7c44ed48af2df825ba5d36326f96ee15de39afcdb5493214c08479844a4f5f75c59e49679a64f22d0cf25f3933e5aa7ae56d248a3f74363c9ae0de07418841a2c5326672a477da1cc41f1aa72fd43ec3d7f3f610fcbfdffaeedaf539f198ec57368c70ec24c8289a6f13d575732f5f8c9a602a2e81bef29b041213698f5e9df1c5010101f68a60b2e2ebf468b244a0e540fad54c5c2efe41c1ba89ba38979776bbc726ea2659c2e639844de9708d51b20f45150ac9474999468474299bc0672993ea3a20a74ee00f97e7e98bdaf26aa6d241ba294fa9247497b47ef18f453467a36d4f132a69acb31743df1c9a054d9123d44cc893af90c2eb83968dca5702e2c7f22377cf33edeaf300a3b8fb8c64ad5d2946f59a9d0ae084b304b325b9048bd4e93393a64973328e7253a3e27229ae4e5172561f8871598dcb09c034cbed59f653a05fa90d54b3572a2fd6ac7eab0adec6eab3288927126fe50519194701dc026131fafacf78c389a52d66b9dbe4cac2b35c03b89189837128292b60b9c9b553ee1855a995089495959e96390844dab72a04133a708a66c8ee391855a0b42fe3c342ca77aa0dc6688d6b963e49ef412edeb77ca64fcac5a0acdbf75c8988b0c9c49da372bb1671ea20914a0d59009368e406e464ed97ade2fd397dbab674b2aa35649c9ba3275da7c12edfa39630f9f5788d62227c1ee822d00c401ef3147f68a0ba720d6221a2dc38548441bbdabb97c53288d26ca9344cb16e6d11ed4a55565188f8c13397ce449713903dca020201ec60010f90fb87bfcfd7ee9afc9bb6172a746bbb1e5f7064aa8d6e79c6895c32362a5da2936f6c04b1d7ddb19e8944a76e939062e1154e55513fd221c58e4e3a2a49caed786e7b79b1a0811149bb6b7c957d9a77268dd140a445145a5a9bbc4ca42800140bd3a074feb9a6783bb58f0ab66317994d273f996d548bbe5225acef6055824d0be539ebe847f20ddab25954da396522d9c32174aa805584409ea4a414e3cb4e50d0e385d2a5bff1227cda0be51b246ee6c938c76c895735a49ffdbfbac566c245ba670314aa9c3b44cf6a37c8f99cf2db1662272753d16066e81658e54c262022ee16e0c219ea6703144a21da3d0c021e91b947a6a398a541bb7b6b16e6f211e4723d48c66da813a90f21140710ef0f73a3f488f4f420938328c9fa282ed9fb1545354a02749d329160e0bd0e83c68ba64590503ea4574ca3fdc5f5877086d73728df93efb428fa97296ce9a326dc9abe2b94334a4f3cbb2328d8138f3b8d3270b1c79f66754eb924e1571310a83a20063f24b3c16901af383601744167656d1cb56752295287947a750a545b2554be57e39e28b1c4a406ea1c0c6028750365193ce99d70f78ab689e82cfced7a9186c1b4b059cc05e76754e430a7275c843a4bc3550e22620b7074fd3ec1760508e8eaf0a66b7c99c0b0fe44c8aa70c91fe8358dca6601200b2ee116e0601ee5400c01f4fa4da24a2cb26802ab3b7ef14f2aef9eae7159f49be74a08f95cbd70632873987dfa87e5e9955aa08c85dad126a0a31959a1c44ade6c2fd62894052690f526732fd43f71803a78c3dc7a7c7d307d5ae294860f4d94221d342e5d4da78c473449d7414d553372233bb248b651011380a50a98080800880887ae3bf112fda043ea367c5eb73f0d2172af453e87827bfaedc6c16c4184534935d6913b1844a7819a6b2c091d7220071492eef197fafb7501fcfa8ffbfa1adeeb8b651b4d7c5151b842ead9e547408c4d257bbc808b4b5c4ca22808f70880900a203ee03d7dfd3a90478a41904dbc2ae55a6308d2746cc49dab97a0a69d662ecebd1d245337d452045f675f88087b7a5831ce5872fb2f686113b585b0c8e4fa740b050fd45416cd1fe775c91f19ce3d44a67623f9888888fa6e944ff2513dd8cd73aec8964e2a559c2edd650bd87e9235fd720963a4a97fbc829f6184007a75f465597f2650ad454ec22c66bc5e9766a2cdc8a01fc2a2adb7a4d512183e250300080887c07d26169fe4c264c91089a69b1a971269f16dd24d320101349797d6667c69908500294521e81e8d61d3395dcc5bfcb2e05fbd1abce65f993276252026098919e7d64936cdc0a1da09a4ec80520f4010f8fa464dd71594d827501404933bb69ba4e9a061447a882b5c92b4b6a62a458c3d5429a344861000e9d3dbd7e8183e219162b0a2826d8f179467150cf99aa8a40504cae11aa444591c8876008994ee308fb8888fbfa1f711ebd7dc44447a7e5eba07f4ffd9);
INSERT INTO `people` (`id`, `type`, `roleid`, `clientid`, `name`, `email`, `title`, `mobile`, `password`, `theme`, `sidebar`, `layout`, `notes`, `signature`, `sessionid`, `resetkey`, `autorefresh`, `lang`, `ticketsnotification`, `avatar`) VALUES
(3, 'user', 2, 1, 'mushe', 'vendetta@ven.com', 'IT-guy', '0542441933', 'e9ab012d82b43079f774c9671462e20e143790a3', 'skin-blue', 'opened', '', '', '', 'qh6ibfsp2smq7nddef7rnnpf3n', 'u1yF9ZIJBkipYSDgf8BMlqU8wQAJxfVT', 0, 'en', 0, 0x89504e470d0a1a0a0000000d49484452000000d7000000d70803000000bea3348700000300504c5445b4aea4666666c7653ce8af92515151ffffff393939424242f0c1a8eab397333333ec383e2222223d3d3de4a5874040403a3a3a3c3c3c3f3f3febb69bd17c57eebea3edbba1db9372e5aa8d2a2a2a3636362c2c2cedba9f3232323737373d281c3030304141415b5b5b3b3b3becb89ddf99792e2e2e525252262626d78a67565656e8af93272726d88d6a343434464542c96941595959efc0a6494949cf7852d68763282828242424c96a42efbfa5e1a080c277565549435f5f5f62626261605fd4815dcb6e47df9c7cb88e794c4c4ce7ae91e3a48554463e4f4f4fcd734de5a98bf1c6af6b6863e09e7f464646f5f5f52323235a5a598f8b83f2d8ceaba69c866b5ceab59a646464eab39873706bfcf5f2bd8970c46f4ad58561bf8063a39e95e3a486da906fc56942f2cbb7bc99864f4d4a473e39ce7650dc9574fbfbfbeebca2f5d7c72e2b29dea98f98938b434242e5e4e3f2f1f1f3d0bdd4d4d45454543b3a3a897165b6a497bd8e76fefbf9e9b195a19c93faede67b787253514fcc7049b7a090b89b8ab6aa9e70573a816543644c32f1c8b23d3c3a5e5e5e5856529c968e4b3425745b3d6b68647d7973605e59bb927d7a61416c5539fcf2ed535353f6ddcf939393f8e2d7f3d4c4636363e7ac8f87827b343332938f87d1a088d9d7d56d584dc17b5cb99783796155785e3e717171f0696ea8a8a8bdbdbddfdfded6ac96e4b79f837f794b4a48a07b6acfcac7f9e8dfc8c8c7edc1aaf59b9efdf7f4a28575705e54e6aa8d3b3430eac4b7c59882a38e74cfcfcf927363957b6dc9a28de4a689ab8572bf84697b695a43302559432ded444aebeaea61524a8b8780dea0866049315f3724f37f83facdce9d9d9d7a7a7afce6e6b2b2b2b8b3a9f0c2a9f4e2daca6e48e3b29d9d5435c5bfb7edcec2685236ee5056f6a7aa878787fbd9daec5d62e7bcaa875b42b65f3b432c1eaa9881523b2d724730825839ee8f92d4d1cbd78966dddbd9bdb8afe1aa92998d836a3f2d91867fb47b61cd99808f6b5adf8588828282ca6d459d9186b2a392623925d8bdb1857871d8957898938cafa89e197750f200001c024944415478dacd9c097c1bd59dc7f1601d338cacc3b2ac912c211f92856539767cc6e0d84eecc4479cd8399c38949c247682032121810442203427500a241048484203942384a340817216cadd8b526869b7dddee77677dbeebdfbf9ec3b66f466341a69643d49f97d3e80657bdecc77fee7fbcf98f3a6acfd21535ab25a1cd297e59546497ede867e5827fe5280e7e79d97577d89b798a62cbbc45587b94c76bff413813fbe30af60c743a64cc088bd903c7693285b0b3fedfabc1acc9e0198057355f292a1eaac2649feb0309647b0fd822903596d082cec33890a98887cfcfe2b730b73c7b498f75f29f832012b47be288462a0f2d5ece11ce78f692dadc70f1e5bb838334fc47200ae409858b04e6e4e2f7f70712eb902a180d0ca6385c3d60cb050c2f7f316c212902f17e2d7e5922b640df88da2eca196ccc04c169b103069821dcc21976072843c1258a5b7350357c4ce17967f8cb7d8b469775c991bae56586c021298cd13f69832934df1c9679731b7f03e6fedf0fe5cd4e975281e2c014e22b398e8aace2e43e605d09284852f659f6b9e5848ed9ccf23faa2952e985f76a7041e9cc4df92839c7f8cf7c5dcc4e1f164c36436bf499287471eefcd7e67b5981714f9ccea00a26c317b0ccccab718a1b861612ccbd56c3f0f28b22c5b2c97b4b48afdb17738cb497f8cf7649d8b34c1022fa5a7435976c4eb79af29fbf2c57105e6e520d35b35c2c24edf138561918b5f777d76cdb5708cf769dd642b454f14b96a8d22d830bf7fda3ceadbb2850bc7e6ad9b769c6f6df1722dea6e97b477b4240671ab373609f17abd3edade786c3f1f1642210e75bc9ee18056171ba0c665b123d716bbfd72071af51ccb429fd1eab3db3d36232e9336adca13a20666455613c89ec6629b969d71461d6c053c75004c7bdfe5f1e08b48134197ca03c85ed4430c5bc9e2f71beb86bd729751c43b02b358d222b3db1dbaf843d767c562a295ac165b6038244351dc54018295db8c766b5a13019b1e34cfc1eccc6cbc6437c887ac317b79149718801fadb0d1d76304f908d86e49752fc25766a5e73d4e4c636b6db193e6402e3b0043f341cd2b75582c1647b9c6a4d466b70069007ad665a7280b76e2ec02efb3243258b93110925f27b9c6b8f97c65250020bb016ba591c8a165301261d4434c925fe0bd1e8bbad17018ebbcc01ab8266002857908b4b62c1a79327007459a2be7cd9bb7506c0ebd8acbf3093e9ca8e2aeda1fb2c0dc218ad059f58259d0e03441e61468badfc1e33c7f1c85ec1d216f22d7f7fb4d44888833aac124ef83b2a5e6b2db1239e231aa19e38e502beaa81b4d428b2545cb8bb3a1c763256069cb821671d07644b5eeb3065af969c74092f0b626ba8fca96d782837fea6016149f95093c633fede265b2f8c2708b02860d3e75fdb1d425480c766be594b9ec89d3a2955f4cb9781d942a97d153dba23259a54d0986816c56cb14b91c4624753bd6b290667e070365bf9f9802f451165527a47045c9052d5301ab0b0f1bb1d429d14b710f7690e70521cc5b3081381f0a296d6603b4761518244b3bc842c3ef8535c7c9be833477cbbb9404984cf0c4a58a3aa3b2abc0b255a667ac16fe35f3a45f0bcc3f8deeb446ee7258fe402d1ff25b250cb495aeb3281f486255ea25e302de5afe92d7cde6f702464971f5d2d64295cba7ca0918ad85177c3e9fdf66b3210a259985fca28a8c2c0160906a5b5b5b5af9179f3703bd261835c0ec3cd56c18880de52d164513643b7e092f2a5c0bd41216049f0467b54957dfe2f524b31314e0e3f9ed4f98a19e18f66b35c1fc219a9b659fc4151f0dd31e379b2fbf7cf6f6f72e89693d640cf96d56f9ab355c6bd81bf06b8161d34fbe0516c37a21a4d5ddf334f76063bec41d6be00573023d7ef96bc8882d42c057c749125a012e98d325b257a885e7d73f8f6c85f57aabfc1e58b3c535afce94c860c26b660d41236ec746c406241aaead05d114907043205500a8b75e571ebedd6b5481d1e79a664b940c84e7cdfa7539d06bdbb76f7f211e74f285e71f37abb5dea302a3cfb59f7095935ca0c64a87134b3293da99437e1518752e3209b5c6fa0761bb39ab7a3e6c94ab3c2b5c76324f16e57dc19c656d171405a59c3ed7425eec8c8802eb9f30675b2f28c02a713e6ea53aeb8dcff19ec9d7cd59d713977855c31c9b4075381f9fe3c32067e4006c7d48913b6873cde3e33a43ef25e69ce8f149d200e399bfc74f934b501665cff0e3e6dce8653ea0dc61fad6d11c6e08ca3d55ed92b21c71159f1dae43d910ce56a9734d131095d46a70939b36e688ab8c3d05ca1899dd97fb6ea7cde54005199b8b2dc919d7a6170559aeb70a6334b9bcc80589b972c6b5916567f30159a617ced0e4f2c9b7f5b5a758d69c2395b02c3bb7d54f0a9870255d2e20b133ace35fce2dd7093e848791e8cd8743b4b9a4ded0bb9ecd25173218ce1a0e68aff3288af7c9f65dadafe6906b06e43acb7ba422660dd0e5225801fe04cb169b7325c8b5890fc59e463c49978bf450c27a36d75cec5c016301ae1be972917df2f0abb9e75a522ba58dba7994b9a4e690e35fce3dd7ab90ab1282f976d1e4da4ffcd0cbb3b9e79add2abdfaed5b48f7af5262538ddab9f9e0aa8db51b74b97c56898b3f9d07ae973dd2b652584c974bda7a79f857f3612f2f7a5c8dca325d2e29be387e76beb88c360768a3a87359c4b4f1729ee20b07184ff7a95ec8ea90b8d8fc71559a2873cd13c026258f5c273057397d2e87926b596eb9581e7b217dae72c285940f2e2b75ae6361932def5c3613e6a23bc7b6e495eb450e648dac708901c6f19b72ca350373cd055c16c245f33911e6aac375999d6e961471030d95620db9dd11b35243abcc717275b9e2be01562815b50a2e477e5e12c7759c32974deae7f93759a812f18a82bb19b5da9ccd80d0857ea194e932c79332ce517c4b008d739c49a0e65125d77b5eccb56e1a5daefd1e29c05a96102e57691b934ce34e27f805c95e44e09b4ef4236d2174c2b544e4b2112eca8d6fe8548ccb3dcea4163117d12a4687da4ad15c34bb5c0743d2fb5e9e174fb040e0b94329a347519759ada13646879c2e38c7467ab316bf9d329f32d73c21f6b4323c1b71b99c0c54d34541f7f940ee59b366452f026a02ea96058a39a12232307844173c142cd17e3e54fb45ce7a64b288c4355be43ab88ef68bf3b101622de2ea1d875714054c6a614e2cb759034cfcf9f95a9a751944738b5c2786b11f6e83631bca0f98cb655c03dd4c7d57d1f93a64d6908e434bfb19a69dc5e23197117051150f679231aedefeee5260aa4cb876ea39b8bdab7e0ee65aefc7799e3697609302ac169ca52b38aa8f4a9b6b99aea347bfded52b1666c845731c75d30a06e8d63ae945511e78213851953eac9d5a5cba8e8fcc8027833a85b9267f04aee5e29b2860ddbc8681fa179f146052e3bb5317d732cdc64fcfd1656656d49210e27a1b72316b6ece9ceb62505941dbf64b417a63f94516a9a4241297c02e52a854ba322d414f76c71d53148f5522719df5222e1e5c4a17b058c658d7324c10bd7d1696deb7992b72994b88c58a9a1895ba2f6b878ea4dda9df5fea4c70d445c485379a09d76cc475070f8f0c32ccb599725dc7b4a186e1095e7c13db2f72b9c095558926bbace9f3457fffddef7fffd1471ffdfac25b6fdb7be16683e125a63f58da5ea26d2e777082e95a6e30fcefad77edbdf0c25b3ffae877bffcfd7fffcfa24ddded90891d459676c5b86a2197ed12f4cd36e6ba4cb91e649c66a4491b0e30ee348b54866ffa4657d59cfeff5b6eb8faed9fdcf2f685481fdef2e1bf1a0c86cf98a83615bebc4f01163cf0d7f8c0bdb7c1033ffff4a2b219e4750049b5b0dfb0222eb3937930f3f02a35235de2c701c62d6191aa624d6cff2f00c553df02771d0918ecae170c401f30eea45cce4f7f080ffc2d39f0a15b4e83efdc1025fbb32a25970fbff2589a79807d41e2daeec30186b9c8a42dd805ae0e71ed311c922eef2d03027326c3727f2a1e78e782ab6f551ef8d9b8b4fd2a8e71f1902bf49ac8f5854cb9d6402e5794617e24e000f3ce66e593b6a14dcb0d509b01d75398ebc3876ef9670352d49dcc5c8b0c50577febad934fcdc57ef8d02dc7f0818b2e7289d53bc6351772093f6a2b455c6b32f643b87f6a0689ea57302196632e32e118f8dc20eaadbb6e037182eefa433f79ca80b47c9536d6e84b06aced77814403f5ad2fa203f1919b3018abe4e27fc5c0fbdc95b91f5e0cf306d3c638a393e8ed3fc20563db75c42069f35db7ddf9c5bd7bf7def2c53ba1b9b07668731d911f78e7877bf73e040efc4f83a4e79e456949c96599849501983a73ae15709d7127d3c5ceb5c10043eda16cc2b1e586e506ac934b0018d09db7ed3188baf78836d7da7bef96c0a403ef5c2959ebb97b07a52900e1b29afc739d8c733c6266981599d72f26323aba8aa96797a077530897d4490c3e7bf40603d28f7ff38d6f7ce3377bae968cb5d69c5c4f4bfce040a0ff120f3cba6f90a47919174887a7c1b464d41d6132af5f3733cc900b4e5a06667b019755c5051571fd651162235afef41583e6545afb3446235af4526427389d069770966903ce3fc430993788782b1f65da3785f1ff17801555acec8a063ed8f4d9e78bb05e7a221231eb926b20f28bcf5ec247fde22f1fac8a6b938b955caddf64a26694c668f4bdbb61b16182ec7a2b0c309e15359aa837427299d353041f962869cab86c26fb641495fadd206d64ac4b1906de7b26ca9e861d870573a53fcafe644ac379a2f595a6ba535106de0686b994c2b692411d87730e7b16bd9c42b8f4bf5a5905d3cb9486f3447ca5c97b36ea445599a1b1b15c831c31fa067b42300111ae8dfa1d0dfcb36faa2fe961f5f29556fe44340add10741b14b4023962d00d1ed620ae132421ead51b6520f7a503a44e877fe32dfef5ecac2072c31534b8be821cd11d0133061be49a4d12a24e55154d91ab8a70fd95b7844eb3bd6ee4865fa1c1b50739a21be4dc37eb0057cb599210756a27e01adc920e903acdff326c697d932d712337dc731e2547749b5de0249b6080094bd24e88f74f958b25fa5d6d1d8fde0277d37143dc7234a39b872a58e854da09b1a8689979f06846e970ce6f6b4373d1199b49b391f9de92c14f369678408f369795a4b3feba8a8a58f3e015537a775ed2ea5bbd61e028603186ec2929f4be43880bb6889e4936cd845886b9324a87ceda16fc76fb10e97969ccdac6f16808ecc16cfca63413228bb90633491bddfcf08b688f3e4e61c6261b4a311154244f79e4897e996eae8879ed14b8c8106080e1f953f0468e32641445a5840511d7d9169329fc2a491c7ab9ee875c19a48d09c0f526e0a255bc482fe5344f472fb25b4cded369268efb45ae0cd24617e0da04677be3ca1e8aca340075d5017942acd2cbc59ab700aea9a78d7ae6b773d1c35f58bc28eacba034a3cdd0ab61937f924d2f717cbda8a86a2a5cc5a47a31f573a1976c5c45cb0dc9666508756b2778bb8d6763d259968b5ce62d473f1193c1ce92b4d3c66ac639f9261c81451966cf7934057bdf12d111f9d9e9248ee2fb01973c1b14157dbd2ccd4d8a93590dabd7a8d9098a326d2eec18a7c3a6d6d9fa2bb30b500129cc07b4534f9b42b818660086974b3638a4d64a35e33bf84dde222cd11d6091d2a2845cc1f1481ae115046506ed1fa87291b1afd9358b61deae0b012e9d9579f704e6fa64edda7d8383836b111794b3348df0ea628082c5d3b3c635da061e34b7f80097be007333ed98cbb5efe815575cb16530c67599338daadc0db9da46d10b63dfa4cbf520e810e1bcbf2df83a2fe772a5e00208389e0681c53e11bbe0819dbd9775e90faf3960181a6c63e011aa491485691b1c4ab581fdeadbc00f7556e68864af374a64d58c05c6681ad23f0388c2d85ed5e6cc1e57179c4afe5df82bab37c09c7f1a281e2a9d0552fb8c58b33800bf6c4a23bcfa19781386e8da8b6cc1807fa3c7597fabed66f506d868d72af3aadd8c3306b6aca8681c78942ba2bf7a0dc05d2d9ccaa319c097e972ddcc9087c5bf62da59dd152c02e982000cceda66448a8ac09bc0a369358751f2666610ce00a86a0f0327fe58cd4c179b668bb82a5a044c066b74248de690b821167ee040bb30ef2659ae9e2532eb52f04f387fec4c6f4f49dc10bf18013795d4032c28ae0e9acf099d014614fd8f7167343223fd09f66aa6ad54040b520c2f321dc560912803e494677a9d7295cd4873ef458a7273046181ae97ba6e0260a2c0dcad972553df6c68941465e6bad899d790e72834f7965817df0c824de68833b280359df48620a4f65cca40612fa4af6b575c7cf18aeb6e4255ba5bde4ad1d746d904e02bf0d4d7c1736b0ed8280e14e7e8cff4993c48098290caa11e9497b0e9fad246b0b474c8956e966fd2d338511d28f6a63da677bbd376c38154d35dfa653a4a1c317b6ed80cb2462ea5cc1cd369732d2359e3e6dc725dbb8699a092115dc9dc70227759834c80bb9396e651572cac4abb9c4011b1b92c753a9b8764470cb9b47bde6e75c5ca41aa6fd72ecda35dd15224d91faf350300b017c3dadd1c7483cf1177303aae39d968cfa5b9c824a729498fe8720f353b4561c271a62dea64ba82a3f06da355801829bacaaddd1b36e5d45c64a7d99ed683b0d16057574467d620e6ca97c1e8f7522e622ed042e5c5601369192ccd9d7290cc40f397124b2841911d656f3d79bb2be7297135e93968efbc9c60b49b275d2a6beb37d28a2ed2c8efc93910e912fb6311a6af9972bbddc1a1641bca6579f542d24d45750d12dd512710a8c7fdce687b998eb9467f9ebc90ec572674a58ee9a3925d8b4b74248df4ffa081fef8ad5dd700677ad928a4aa9aa1276944f3175c24d9d74bb9a38ad6be6b423178ca3f988bcab48660e51f8c4a759e817361bb6a9e9677b065530623a9654e7ddeb14819ab0f8ab9637aa67de104056bd1ebec41bacf14ac4a1cd4c80a57feb9eaeb99aeccc0ca626f345c7a0e7135cde966fa7b330073a1e6a99fe9a7c045b3ff6507c035cd216053c142f7e65ce3627b810fad2660e9634d205f3e87b87e701de0020ad6334dbd5301ab1233c6048bb8fee91ce1faf30f9b185c7afa99fa765cc7d2c56aef67bae7b088ebf10de706d88f0d86e55db1771298e6def4c0a617e3e3ba70da613e3018de3d27bc708101803d8bb960ec77a31aed4aa3cb18e887851d0bfdb5f61fcf01ae9306a81d5ba4714b3383136395ae202b59c60e34a3b8c4ba17adb6e107f937d706031604c32673e2c4383a5d5768adae67ea57b3040be964deb9fe48fef498bc72010c30070659ead01a68925155dd20adb521ef5c0b0c31dd4b5ed56ac2f9c395dc07477ba10b0ec4b0ee266b3d93ff64280323ef0c06bb811d7ad9e224be5806ec8a3d16ebd9e506a2c7f28bb5f8a441aebb2118c91fddabb57d71c6e8443f32aaa4b53be42b6d18d9f5409e98569eb9fd496eb3410b8c1d7002b2a086c9ca6675338c73808d690bc2222ae038eec6b1f717e796e9d0ae91abc0891d0506b97021236aef87365bb6519d0683c003fb832cd1a2f8853eaee83379c0299eec3cb332374cef8fddc841a69e868282af1ae2b5632d2b53102490fae63794ce188902aa263955d5d3aa755e2900aae8337240db46c60e65d94e674638207b0fc715407d6c50eb082bd71c34e59de82593df71f83e1c6a23d51983e864019283ebeb3319215be7fb2bb305753bf43d534fcdcc820291eb1e4302ddbd514136d0dc8dfe17b1480c035d738095eb68a2451eedbc0f7335807f775437daa14fee5a991d28474f0dc289717dcf90483bc42023466bee674435ad864d96960f12dd533842b8a06656371a69a31d1a0350a6ea996079c28584f3a1da17cb96c5a1f5b623b1712adef75ce2152a0a6b242ea28e3e3bc89294d016ef22502aaeef1a12eb867d2555a36c722dab2a9b7e6447e2e39f299473a9d0ce645ea5c6409ae813a188ec5c05faefc8020db01d5b40ffb7b1aa588ba9b8ac64ba79eddd060d7dafb0b01aaeefe1a4531355347ab86d67166744d50982aa46b532b98f3524d3ab4c36889bdb92043223016369686b2110f10b957a8cdcb6b129933d000a95115dbf3657c5bb9a603b92ff89f93e602c6d73012d255c6af581a2ddb9724a71d509a8aa35963571f827858528d56b46993616de6a6945175427e6d2d0cc1e40b62b7dac5ddb08955a3d5c8fc855b8d59044f70e26a63afa9c415b0b0a24ae0610058535151d4b13923572dc550fa499d9415fd1a8c1b4b4b3a2c684b966c23058900cecb92309a8b6dc6048a6af162255202efcf5e1868e02b53a406ebc7d713ac602991d2da45eaae11a789e46ce013f75c2af71ead0268b0fb3b5844a3b6960ae6ace541853cd01b5d9aa4102d16db2079ee41c15890cd5d1500dd6c75c76f89d03e8c356432ab2413db6225e883502ddbd91704134f5cd066136a22f7f8c719ebe4496aa2924eac3015d816fec02430aed785acc2057dc6d48a5efc6200a0a1ab9f985711a99197f5da06dd063b295db38bbaa18de37822c45c4a182d9803ffccc905a771fd97294982a452ec45ca89d2f54e97085d21f6b40dba8830beeaeec4affabb846b5b80d153068421c6229b5fc6bef3cf21d434a2da81097440d871173a9c90a881a38a0b1d4db466e7e85919b2f3355c5e142b52c1cf4d518ef338614fa87772e007ae4fb86147ab89008962fe4116a5557dc27657b0f37bf83db962ac4166ff3cc2ca8f090ed81c6c2265406621f51dba1ad9f3f7201d63b5f4b195c444b2b384f4da1961ab037ce8736e8e16e4cc1753b682450dd4007756a2e3b1ffd06f9fc705217bc80e8919f1bb4f5a8e21c9d359c037b84b6cd3a70323072ef274ff122d07cae0151690a4d023ac9e724b9e33b3fbd40216d933d56a8e422695e43234b1bb9061c64db92d6e727b90e9c3cb9f9f76950918408b988beab1d5971fac3020dac0ae5292ae6733d85c955edb1178886b83d69e9ea8935ec2956f4831ba5bc8e470d09f47d14594afde32b57272bc884cbc169bba1d41f54c7d2c7a12449c3186b5052b9809debc35c448f1954bafadf080e09b1c75ed99c00eb61959771dc480a2e93472ab53549524727a6c78e78558a15411e22b952a3efd8fcca4b044716600bb69edca08d4562d8539182cb66028548f430cdae6325e7901a41b0d3b7a6f2007bc1480d50b52c292ac136fcf9e402c34fd55cdf073fdabc35ee26fc0c59a8cf666abce64067e74cec338e545cfeea82a58747f07840d360b77335a24dc194a6d1967cc53ed4497534d4f4343a1c1cd7d3d979a05a09b661eb66980dd5e6c21eba551164f7e034d059cd41394c3d7d0d1d206dd4a4e0e22a60301c10f7ba0f68984b8cae11d89b555b52260ebb9113e5013704602976cf0bc40bff437cd690b05190112cac11d0ec10f5803593ca53b014fc0a3003caf5231ac9b01a87163ce0408323c592560eca66f380dbdb51b014df590246ecf16d05d64f97c7ec4982ec63b2ec359d268e9b3fdf64b781d50b53a8c78173d735628425eca6ae42b905de00a0c333532dda78556323704780d7032af4e142650bfcee2b31975cfe8ec25ccb89a33eb67583bacda8ee002ede58015dbd31155763e3526cd10a148f09dbdf33b0d1223d7a87bd50877afc9cb102efc314605f7d145d31b117d1b7e5f912199560115fb41f80d79192abef80f8153289675bc2fd4903f642ac86f93ad6bd0ab8cccc82fbae89afcff748fe48b088e4bb95771f7e8c744fc4170f98384f8f9ef33748a74619af913ba39535964a0e55dda7635d2bb471677c707ffc3038cf02a98d529765c52eb2e2d104b9bc1374f27ace6f22c71ed048f5bbf0fc89fc223182b6faeab80e14906a3d23f65117a825ebe8ff5d751cbef90e3000d0632f7291870b808ceacc7115ec78e5d798d4bfc976c5a4882e22f111d22389fa0d125f8957edece36c857a446c8a5347a3d4fdfe3f4e70815b1c97ea2c0000000049454e44ae426082);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `description` text NOT NULL,
  `startdate` varchar(20) NOT NULL,
  `deadline` varchar(20) NOT NULL,
  `progress` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `clientid`, `tag`, `name`, `notes`, `description`, `startdate`, `deadline`, `progress`) VALUES
(1, 3, 'P-1', 'Test Project', 'Note this as am the admin<p></p>', '<p>This poject has been reassign to different client</p>', '2020-09-05', '2020-09-02', -1);

-- --------------------------------------------------------

--
-- Table structure for table `projects_admins`
--

CREATE TABLE `projects_admins` (
  `id` int(11) NOT NULL,
  `projectid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projects_admins`
--

INSERT INTO `projects_admins` (`id`, `projectid`, `adminid`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `perms` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `type`, `name`, `perms`) VALUES
(1, 'admin', 'Super Administrator', 'a:90:{i:0;s:9:\"addClient\";i:1;s:10:\"editClient\";i:2;s:12:\"deleteClient\";i:3;s:12:\"manageClient\";i:4;s:12:\"adminsClient\";i:5;s:11:\"viewClients\";i:6;s:8:\"addAsset\";i:7;s:9:\"editAsset\";i:8;s:11:\"deleteAsset\";i:9;s:11:\"manageAsset\";i:10;s:12:\"licenseAsset\";i:11;s:10:\"viewAssets\";i:12;s:10:\"addLicense\";i:13;s:11:\"editLicense\";i:14;s:13:\"deleteLicense\";i:15;s:13:\"manageLicense\";i:16;s:12:\"assetLicense\";i:17;s:12:\"viewLicenses\";i:18;s:10:\"addProject\";i:19;s:11:\"editProject\";i:20;s:13:\"deleteProject\";i:21;s:13:\"manageProject\";i:22;s:18:\"manageProjectNotes\";i:23;s:13:\"adminsProject\";i:24;s:12:\"viewProjects\";i:25;s:9:\"addTicket\";i:26;s:10:\"editTicket\";i:27;s:12:\"deleteTicket\";i:28;s:12:\"manageTicket\";i:29;s:17:\"manageTicketRules\";i:30;s:17:\"manageTicketNotes\";i:31;s:22:\"manageTicketAssignment\";i:32;s:11:\"viewTickets\";i:33;s:8:\"addIssue\";i:34;s:9:\"editIssue\";i:35;s:11:\"deleteIssue\";i:36;s:11:\"manageIssue\";i:37;s:10:\"viewIssues\";i:38;s:10:\"addComment\";i:39;s:11:\"editComment\";i:40;s:13:\"deleteComment\";i:41;s:13:\"assignComment\";i:42;s:12:\"viewComments\";i:43;s:13:\"addCredential\";i:44;s:14:\"editCredential\";i:45;s:16:\"deleteCredential\";i:46;s:14:\"viewCredential\";i:47;s:15:\"viewCredentials\";i:48;s:5:\"addKB\";i:49;s:6:\"editKB\";i:50;s:8:\"deleteKB\";i:51;s:6:\"viewKB\";i:52;s:9:\"addPReply\";i:53;s:10:\"editPReply\";i:54;s:12:\"deletePReply\";i:55;s:12:\"viewPReplies\";i:56;s:10:\"uploadFile\";i:57;s:12:\"downloadFile\";i:58;s:10:\"deleteFile\";i:59;s:9:\"viewFiles\";i:60;s:7:\"addHost\";i:61;s:8:\"editHost\";i:62;s:10:\"deleteHost\";i:63;s:10:\"manageHost\";i:64;s:14:\"viewMonitoring\";i:65;s:7:\"addUser\";i:66;s:8:\"editUser\";i:67;s:10:\"deleteUser\";i:68;s:9:\"viewUsers\";i:69;s:8:\"addStaff\";i:70;s:9:\"editStaff\";i:71;s:11:\"deleteStaff\";i:72;s:9:\"viewStaff\";i:73;s:7:\"addRole\";i:74;s:8:\"editRole\";i:75;s:10:\"deleteRole\";i:76;s:9:\"viewRoles\";i:77;s:10:\"addContact\";i:78;s:11:\"editContact\";i:79;s:13:\"deleteContact\";i:80;s:12:\"viewContacts\";i:81;s:10:\"manageData\";i:82;s:14:\"manageSettings\";i:83;s:8:\"viewLogs\";i:84;s:10:\"viewSystem\";i:85;s:10:\"viewPeople\";i:86;s:11:\"viewReports\";i:87;s:11:\"autorefresh\";i:88;s:6:\"search\";i:89;s:4:\"Null\";}'),
(2, 'user', 'Standard User', 'a:19:{i:0;s:11:\"manageAsset\";i:1;s:10:\"viewAssets\";i:2;s:13:\"manageLicense\";i:3;s:12:\"viewLicenses\";i:4;s:12:\"viewProjects\";i:5;s:9:\"addTicket\";i:6;s:10:\"editTicket\";i:7;s:12:\"manageTicket\";i:8;s:11:\"viewTickets\";i:9;s:8:\"addIssue\";i:10;s:10:\"viewIssues\";i:11;s:10:\"addComment\";i:12;s:12:\"viewComments\";i:13;s:6:\"viewKB\";i:14;s:14:\"viewMonitoring\";i:15;s:9:\"viewUsers\";i:16;s:10:\"viewPeople\";i:17;s:11:\"viewReports\";i:18;s:4:\"Null\";}'),
(3, 'admin', 'Administrator', 'a:70:{i:0;s:9:\"addClient\";i:1;s:10:\"editClient\";i:2;s:12:\"manageClient\";i:3;s:12:\"adminsClient\";i:4;s:11:\"viewClients\";i:5;s:8:\"addAsset\";i:6;s:9:\"editAsset\";i:7;s:11:\"manageAsset\";i:8;s:12:\"licenseAsset\";i:9;s:10:\"viewAssets\";i:10;s:10:\"addLicense\";i:11;s:11:\"editLicense\";i:12;s:13:\"manageLicense\";i:13;s:12:\"assetLicense\";i:14;s:12:\"viewLicenses\";i:15;s:10:\"addProject\";i:16;s:11:\"editProject\";i:17;s:13:\"manageProject\";i:18;s:18:\"manageProjectNotes\";i:19;s:13:\"adminsProject\";i:20;s:12:\"viewProjects\";i:21;s:9:\"addTicket\";i:22;s:10:\"editTicket\";i:23;s:12:\"manageTicket\";i:24;s:17:\"manageTicketRules\";i:25;s:17:\"manageTicketNotes\";i:26;s:11:\"viewTickets\";i:27;s:8:\"addIssue\";i:28;s:9:\"editIssue\";i:29;s:11:\"manageIssue\";i:30;s:10:\"viewIssues\";i:31;s:10:\"addComment\";i:32;s:11:\"editComment\";i:33;s:13:\"assignComment\";i:34;s:12:\"viewComments\";i:35;s:13:\"addCredential\";i:36;s:14:\"editCredential\";i:37;s:14:\"viewCredential\";i:38;s:15:\"viewCredentials\";i:39;s:5:\"addKB\";i:40;s:6:\"viewKB\";i:41;s:9:\"addPReply\";i:42;s:12:\"viewPReplies\";i:43;s:10:\"uploadFile\";i:44;s:12:\"downloadFile\";i:45;s:9:\"viewFiles\";i:46;s:7:\"addHost\";i:47;s:8:\"editHost\";i:48;s:10:\"manageHost\";i:49;s:14:\"viewMonitoring\";i:50;s:7:\"addUser\";i:51;s:8:\"editUser\";i:52;s:9:\"viewUsers\";i:53;s:8:\"addStaff\";i:54;s:9:\"editStaff\";i:55;s:9:\"viewStaff\";i:56;s:7:\"addRole\";i:57;s:8:\"editRole\";i:58;s:9:\"viewRoles\";i:59;s:10:\"addContact\";i:60;s:11:\"editContact\";i:61;s:12:\"viewContacts\";i:62;s:10:\"manageData\";i:63;s:8:\"viewLogs\";i:64;s:10:\"viewSystem\";i:65;s:10:\"viewPeople\";i:66;s:11:\"viewReports\";i:67;s:11:\"autorefresh\";i:68;s:6:\"search\";i:69;s:4:\"Null\";}'),
(4, 'admin', 'Technician', 'a:48:{i:0;s:9:\"addClient\";i:1;s:12:\"manageClient\";i:2;s:11:\"viewClients\";i:3;s:8:\"addAsset\";i:4;s:11:\"manageAsset\";i:5;s:10:\"viewAssets\";i:6;s:10:\"addLicense\";i:7;s:13:\"manageLicense\";i:8;s:12:\"viewLicenses\";i:9;s:10:\"addProject\";i:10;s:13:\"manageProject\";i:11;s:18:\"manageProjectNotes\";i:12;s:12:\"viewProjects\";i:13;s:9:\"addTicket\";i:14;s:12:\"manageTicket\";i:15;s:17:\"manageTicketRules\";i:16;s:17:\"manageTicketNotes\";i:17;s:11:\"viewTickets\";i:18;s:8:\"addIssue\";i:19;s:11:\"manageIssue\";i:20;s:10:\"viewIssues\";i:21;s:10:\"addComment\";i:22;s:12:\"viewComments\";i:23;s:13:\"addCredential\";i:24;s:14:\"viewCredential\";i:25;s:15:\"viewCredentials\";i:26;s:5:\"addKB\";i:27;s:6:\"viewKB\";i:28;s:9:\"addPReply\";i:29;s:12:\"viewPReplies\";i:30;s:10:\"uploadFile\";i:31;s:12:\"downloadFile\";i:32;s:9:\"viewFiles\";i:33;s:7:\"addHost\";i:34;s:10:\"manageHost\";i:35;s:14:\"viewMonitoring\";i:36;s:7:\"addUser\";i:37;s:9:\"viewUsers\";i:38;s:10:\"addContact\";i:39;s:11:\"editContact\";i:40;s:12:\"viewContacts\";i:41;s:10:\"manageData\";i:42;s:10:\"viewSystem\";i:43;s:10:\"viewPeople\";i:44;s:11:\"viewReports\";i:45;s:11:\"autorefresh\";i:46;s:6:\"search\";i:47;s:4:\"Null\";}');

-- --------------------------------------------------------

--
-- Table structure for table `smslog`
--

CREATE TABLE `smslog` (
  `id` int(11) NOT NULL,
  `peopleid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `mobile` varchar(128) NOT NULL,
  `sms` varchar(256) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `statuscodes`
--

CREATE TABLE `statuscodes` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statuscodes`
--

INSERT INTO `statuscodes` (`id`, `code`, `type`, `message`) VALUES
(48, 11, 'danger', 'Error! Cannot add item.'),
(49, 21, 'danger', 'Error! Cannot save item.'),
(50, 31, 'danger', 'Error! Cannot delete item.'),
(47, 30, 'success', 'Item has been deleted successfully!'),
(46, 20, 'success', 'Item has been saved successfully!'),
(45, 10, 'success', 'Item has been added successfully!'),
(51, 40, 'success', 'Settings updated successfully!'),
(52, 1200, 'danger', 'Authentication Failed!'),
(53, 1300, 'success', 'Please check your email for a password reset link.'),
(54, 1400, 'danger', 'Email address was not found.'),
(55, 1500, 'danger', 'Invalid reset key!'),
(56, 1600, 'success', 'Success. Please log in with your new password! '),
(57, 1, 'danger', 'Unauthorized Access');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `contactname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `web` varchar(255) NOT NULL,
  `notes` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `address`, `contactname`, `phone`, `email`, `web`, `notes`) VALUES
(1, 'Amazon', '', '', '', '', '', ''),
(2, 'Best Buy', '', '', '', '', '', ''),
(3, 'Newegg', '', '', '', '', '', ''),
(4, 'Eli the computer Guy', 'Zongo Market Koforidua , Ghana', 'Eli ', '233209229025', 'musheabdulhakim@protonmail.ch', 'Codewithmushe.tech', '');

-- --------------------------------------------------------

--
-- Table structure for table `systemlog`
--

CREATE TABLE `systemlog` (
  `id` int(11) NOT NULL,
  `peopleid` int(11) NOT NULL,
  `ipaddress` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `systemlog`
--

INSERT INTO `systemlog` (`id`, `peopleid`, `ipaddress`, `description`, `timestamp`) VALUES
(1, -1, '::1', 'User/Admin Logged In - ID: 2', '2017-07-02 00:06:31'),
(2, -1, '::1', 'User/Admin Login Failure - EMAIL: admin@example.com', '2017-07-02 02:21:54'),
(3, -1, '::1', 'User/Admin Logged In - ID: 2', '2017-07-02 02:22:05'),
(4, 2, '::1', 'Profile Edited - ID: 2', '2017-07-02 02:23:43'),
(5, 2, '::1', 'User/Staff Logged Out - ID: 2', '2017-07-02 02:23:49'),
(6, -1, '::1', 'User/Admin Logged In - ID: 2', '2017-07-02 02:23:57'),
(7, 2, '::1', 'User/Staff Logged Out - ID: 2', '2017-07-02 02:24:01'),
(8, -1, '::1', 'User/Admin Logged In - ID: 2', '2017-07-02 02:24:27'),
(9, -1, '::1', 'User/Admin Logged In - ID: 2', '2020-03-30 10:50:37'),
(10, 2, '::1', 'Profile Edited - ID: 2', '2020-03-30 12:20:41'),
(11, 2, '::1', 'User/Staff Logged Out - ID: 2', '2020-03-30 12:22:43'),
(12, -1, '::1', 'User/Admin Logged In - ID: 2', '2020-03-30 12:23:18'),
(13, 2, '::1', 'User/Staff Logged Out - ID: 2', '2020-03-30 12:24:06'),
(14, -1, '::1', 'User/Admin Logged In - ID: 2', '2020-03-30 12:27:49'),
(15, -1, '::1', 'User/Admin Logged In - ID: 2', '2020-03-30 12:54:16'),
(16, 2, '::1', 'Manufacturer Added - ID: 12', '2020-03-30 12:56:24'),
(17, 2, '::1', 'Manufacturer Added - ID: 13', '2020-03-30 12:56:24'),
(18, -1, '::1', 'User/Admin Login Failure - EMAIL: musheabdulhakim99@gmail.com', '2020-04-21 09:07:47'),
(19, -1, '::1', 'User/Admin Logged In - ID: 2', '2020-04-21 09:11:07'),
(20, 2, '::1', 'User/Staff Logged Out - ID: 2', '2020-04-21 09:11:59'),
(21, -1, '::1', 'User/Admin Logged In - ID: 2', '2020-06-02 00:50:19'),
(22, 2, '::1', 'Predefined Reply Added - ID: 2', '2020-06-02 01:16:57'),
(23, -1, '::1', 'User/Admin Logged In - ID: 2', '2020-06-02 01:20:43'),
(24, 2, '::1', 'User Added - ID: 3', '2020-06-02 01:23:54'),
(25, -1, '::1', 'User/Admin Logged In - ID: 3', '2020-06-02 01:24:43'),
(26, -1, '::1', 'User/Admin Logged In - ID: 2', '2020-06-02 06:56:52'),
(27, -1, '::1', 'User/Admin Logged In - ID: 2', '2020-09-02 10:06:21'),
(28, -1, '::1', 'User/Admin Login Failure - EMAIL: admin@example.com', '2020-09-02 19:33:46'),
(29, -1, '::1', 'User/Admin Logged In - ID: 2', '2020-09-02 19:36:07'),
(30, 2, '::1', 'Client Added - ID: 3', '2020-09-02 19:43:49'),
(31, 2, '::1', 'Client Deleted - ID: 2', '2020-09-02 19:48:37'),
(32, 2, '::1', 'Client Deleted - ID: 1', '2020-09-02 19:48:41'),
(33, 2, '::1', 'Client Added - ID: 4', '2020-09-02 19:49:28'),
(34, 2, '::1', 'AssetCategory Added - ID: 6', '2020-09-02 19:51:19'),
(35, 2, '::1', 'Label Added - ID: 7', '2020-09-02 19:52:34'),
(36, 2, '::1', 'Manufacturer Deleted - ID: 12', '2020-09-02 19:52:55'),
(37, 2, '::1', 'Manufacturer Deleted - ID: 13', '2020-09-02 19:53:00'),
(38, 2, '::1', 'Model Added - ID: 5', '2020-09-02 19:53:37'),
(39, 2, '::1', 'Model Added - ID: 6', '2020-09-02 19:53:47'),
(40, 2, '::1', 'Location Added - ID: 2', '2020-09-02 19:54:13'),
(41, 2, '::1', 'Location Edited - ID: 1', '2020-09-02 19:54:29'),
(42, 2, '::1', 'Supplier Added - ID: 4', '2020-09-02 19:56:20'),
(43, 2, '::1', 'Profile Edited - ID: 2', '2020-09-02 20:10:10'),
(44, 2, '::1', 'Profile Edited - ID: 2', '2020-09-02 20:10:46'),
(45, 2, '::1', 'Profile Edited - ID: 2', '2020-09-02 20:11:13'),
(46, 2, '::1', 'Profile Edited - ID: 2', '2020-09-02 20:11:39'),
(47, 2, '::1', 'Predefined Reply Edited - ID: 2', '2020-09-02 20:27:43'),
(48, 2, '::1', 'Knowledge Base Category Added - ID: 2', '2020-09-02 20:30:03'),
(49, 2, '::1', 'Knowledge Base Article Added - ID: 2', '2020-09-02 20:30:42'),
(50, -1, '::1', 'User/Admin Logged In - ID: 2', '2020-09-02 22:46:05'),
(51, 2, '::1', 'Profile Edited - ID: 2', '2020-09-02 22:54:23'),
(52, 2, '::1', 'Profile Edited - ID: 2', '2020-09-02 22:54:39'),
(53, 2, '::1', 'Profile Edited - ID: 2', '2020-09-02 22:54:59'),
(54, 2, '::1', 'Profile Edited - ID: 2', '2020-09-02 22:55:11'),
(55, 2, '::1', 'Profile Edited - ID: 2', '2020-09-02 22:55:34'),
(56, 2, '::1', 'Profile Edited - ID: 2', '2020-09-02 22:55:48'),
(57, 2, '::1', 'Profile Edited - ID: 2', '2020-09-02 22:55:57'),
(58, 2, '::1', 'Profile Edited - ID: 2', '2020-09-02 22:56:18'),
(59, 2, '::1', 'Profile Edited - ID: 2', '2020-09-02 22:56:32'),
(60, 2, '::1', 'Profile Edited - ID: 2', '2020-09-02 22:58:21'),
(61, 2, '::1', 'Contact Added - ID: 1', '2020-09-02 23:00:39'),
(62, -1, '::1', 'User/Admin Logged In - ID: 3', '2020-09-02 23:02:07'),
(63, -1, '::1', 'User/Admin Logged In - ID: 3', '2020-09-02 23:02:39'),
(64, 3, '::1', 'Issue Added - ID: 4', '2020-09-02 23:06:38'),
(65, 3, '::1', 'Profile Edited - ID: 3', '2020-09-02 23:09:21'),
(66, 3, '::1', 'User/Staff Logged Out - ID: 3', '2020-09-02 23:12:39'),
(67, 2, '::1', 'Client Added - ID: 5', '2020-09-02 23:14:32'),
(68, 2, '::1', 'Model Added - ID: 7', '2020-09-02 23:16:09'),
(69, 2, '::1', 'Asset Added - ID: 4', '2020-09-02 23:18:45'),
(70, -1, '::1', 'User/Admin Logged In - ID: 3', '2020-09-02 23:19:05'),
(71, -1, '::1', 'User/Admin Logged In - ID: 2', '2020-09-03 22:56:34'),
(72, -1, '::1', 'User/Admin Logged In - ID: 2', '2020-09-03 22:57:10'),
(73, -1, '::1', 'User/Admin Login Failure - EMAIL: admin@example.com', '2020-09-05 14:44:48'),
(74, -1, '::1', 'User/Admin Logged In - ID: 2', '2020-09-05 14:45:33'),
(75, 2, '::1', 'Comment Added - ID: 1', '2020-09-05 15:07:55'),
(76, 2, '::1', 'ProjectNotes Update - ID: 1', '2020-09-05 15:08:27'),
(77, 2, '::1', 'Project Edited - ID: 1', '2020-09-05 15:10:05'),
(78, 2, '::1', 'Project Edited - ID: 1', '2020-09-05 15:10:23');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `ticket` int(11) NOT NULL,
  `departmentid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `assetid` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `subject` varchar(500) NOT NULL,
  `status` varchar(50) NOT NULL,
  `priority` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL,
  `notes` text NOT NULL,
  `ccs` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tickets_departments`
--

CREATE TABLE `tickets_departments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tickets_departments`
--

INSERT INTO `tickets_departments` (`id`, `name`) VALUES
(1, 'Default Department');

-- --------------------------------------------------------

--
-- Table structure for table `tickets_pr`
--

CREATE TABLE `tickets_pr` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `content` text CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tickets_pr`
--

INSERT INTO `tickets_pr` (`id`, `name`, `content`) VALUES
(1, 'Demo Predefined Reply', '<div><p>Predefined reply body.<br></p></div>'),
(2, 'Mushe Abdul-Hakim', '<div><p>Testing the predefine reply in the software</p></div>');

-- --------------------------------------------------------

--
-- Table structure for table `tickets_replies`
--

CREATE TABLE `tickets_replies` (
  `id` int(11) NOT NULL,
  `ticketid` int(11) NOT NULL,
  `peopleid` int(11) NOT NULL,
  `message` text NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tickets_rules`
--

CREATE TABLE `tickets_rules` (
  `id` int(11) NOT NULL,
  `ticketid` int(11) NOT NULL,
  `executed` int(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cond_status` varchar(255) NOT NULL,
  `cond_priority` varchar(255) NOT NULL,
  `cond_timeelapsed` varchar(20) NOT NULL,
  `cond_datetime` datetime NOT NULL,
  `act_status` varchar(255) NOT NULL,
  `act_priority` varchar(255) NOT NULL,
  `act_assignto` int(11) NOT NULL,
  `act_notifyadmins` int(1) NOT NULL,
  `act_addreply` int(1) NOT NULL,
  `reply` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetcategories`
--
ALTER TABLE `assetcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag` (`tag`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_admins`
--
ALTER TABLE `clients_admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credentials`
--
ALTER TABLE `credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emaillog`
--
ALTER TABLE `emaillog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hosts`
--
ALTER TABLE `hosts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hosts_checks`
--
ALTER TABLE `hosts_checks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hosts_history`
--
ALTER TABLE `hosts_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hosts_people`
--
ALTER TABLE `hosts_people`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kb_articles`
--
ALTER TABLE `kb_articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kb_categories`
--
ALTER TABLE `kb_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `licensecategories`
--
ALTER TABLE `licensecategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag` (`tag`);

--
-- Indexes for table `licenses_assets`
--
ALTER TABLE `licenses_assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notificationtemplates`
--
ALTER TABLE `notificationtemplates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects_admins`
--
ALTER TABLE `projects_admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smslog`
--
ALTER TABLE `smslog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `statuscodes`
--
ALTER TABLE `statuscodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `systemlog`
--
ALTER TABLE `systemlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets_departments`
--
ALTER TABLE `tickets_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets_pr`
--
ALTER TABLE `tickets_pr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets_replies`
--
ALTER TABLE `tickets_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets_rules`
--
ALTER TABLE `tickets_rules`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetcategories`
--
ALTER TABLE `assetcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clients_admins`
--
ALTER TABLE `clients_admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `credentials`
--
ALTER TABLE `credentials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emaillog`
--
ALTER TABLE `emaillog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hosts`
--
ALTER TABLE `hosts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hosts_checks`
--
ALTER TABLE `hosts_checks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hosts_history`
--
ALTER TABLE `hosts_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hosts_people`
--
ALTER TABLE `hosts_people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kb_articles`
--
ALTER TABLE `kb_articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kb_categories`
--
ALTER TABLE `kb_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `labels`
--
ALTER TABLE `labels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `licensecategories`
--
ALTER TABLE `licensecategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `licenses`
--
ALTER TABLE `licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `licenses_assets`
--
ALTER TABLE `licenses_assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `models`
--
ALTER TABLE `models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notificationtemplates`
--
ALTER TABLE `notificationtemplates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `projects_admins`
--
ALTER TABLE `projects_admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `smslog`
--
ALTER TABLE `smslog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statuscodes`
--
ALTER TABLE `statuscodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `systemlog`
--
ALTER TABLE `systemlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets_departments`
--
ALTER TABLE `tickets_departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tickets_pr`
--
ALTER TABLE `tickets_pr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tickets_replies`
--
ALTER TABLE `tickets_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets_rules`
--
ALTER TABLE `tickets_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
