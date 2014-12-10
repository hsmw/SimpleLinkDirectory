CREATE TABLE `categories` (
  `category_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(100) collate utf8_unicode_ci NOT NULL,
  `description` text collate utf8_unicode_ci,
  `entry_count` int(11) NOT NULL default '0',
  PRIMARY KEY  (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `categories` (`category_id`, `name`, `description`, `entry_count`) VALUES 
(1, 'Simple Link Directory developers', 'This is links related to Simple Link Directory developement team', 3),
(2, 'CodeIgniter', 'Links related to the CodeIgniter framework', 4),
(3, 'Another category', 'Category leaved as example, you can edit and manage in admin area', 0),
(4, 'A test category', 'Category leaved as example, you can edit and manage in admin area', 0);

CREATE TABLE `entries` (
  `entry_id` bigint(11) unsigned NOT NULL auto_increment,
  `FK_category_id` int(11) unsigned NOT NULL,
  `FK_user_id` bigint(11) unsigned NOT NULL,
  `active` tinyint(1) unsigned NOT NULL,
  `title` varchar(255) collate utf8_unicode_ci NOT NULL,
  `description` text collate utf8_unicode_ci,
  `date_added` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `url` varchar(255) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`entry_id`),
  KEY `FK_category_id` (`FK_category_id`),
  KEY `FK_user_id` (`FK_user_id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `entries` (`entry_id`, `FK_category_id`, `FK_user_id`, `active`, `title`, `description`, `date_added`, `url`) VALUES 
(1, 1, 1, 1, 'Too Pixel', 'A Webdesign company in Geneva Switzerland', '2008-06-06 05:53:42', 'http://toopixel.ch'),
(2, 1, 1, 1, 'CodeIgniter Directory', 'All CodeIgniter resources in one place. We are working hard to port this directory that is actually Joomla based to our Simple Link Directory application, stay tuned!', '2008-06-06 05:53:42', 'http://www.codeigniterdirectory.com'),
(3, 1, 1, 0, 'Imagine this...', 'Pascal''s blog from Simple Link Directory team. Pascal is an engineering student and hobby web developer from Germany.', '2008-06-16 06:11:50', 'http://inparo.wordpress.com'),
(4, 2, 1, 0, 'CodeIgniter framework', 'CodeIgniter is an open source PHP web application framework that helps you write kick-ass PHP programs', '2008-06-16 06:13:53', 'http://codeigniter.com'),
(5, 2, 1, 0, 'CodeIgniter forums', 'While you are coding with CodeIgniter, you can''t miss the great forum community around it!', '2008-06-16 06:14:49', 'http://codeigniter.com/forums/'),
(6, 2, 1, 0, 'CodeIgniter Wiki', 'The CodeIgniter community share their libs and piece of code on the Wiki, don''t miss it!', '2008-06-16 06:17:47', 'http://codeigniter.com/wiki/'),
(7, 2, 1, 0, 'CodeIgniter User Guide', 'The official and great User Guide', '2008-06-16 06:18:37', 'http://codeigniter.com/user_guide/');

CREATE TABLE `pages` (
  `page_id` int(11) unsigned NOT NULL auto_increment,
  `active` tinyint(1) unsigned NOT NULL,
  `url` varchar(50) collate utf8_unicode_ci NOT NULL,
  `meta_description` varchar(255) collate utf8_unicode_ci default NULL,
  `meta_keywords` text collate utf8_unicode_ci,
  `title` varchar(255) collate utf8_unicode_ci NOT NULL,
  `content` text collate utf8_unicode_ci,
  PRIMARY KEY  (`page_id`),
  UNIQUE KEY `uri` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

INSERT INTO `pages` VALUES (1, 1, 'about', NULL, NULL, 'About Simple Link Directory', '<p>\r\n	Growing out of a need for simple categorical organization, Simple Link Directory aims to be the simple solution.\r\n	Specifically built for link directories, such as a collection of your business partners.  It is\r\n	still in heavy development and feature/improvement requests are wholeheartedly encouraged.\r\n</p>\r\n\r\n<h3>Thanks goes to...</h3>\r\n\r\n<ul>\r\n	<li>~ Mathew Davies for his <a href="http://code.google.com/p/reduxauth/">authentication library</a>.</li>\r\n	<li>~ <a href="http://www.colourlovers.com">Colourlovers</a> for helping us find a great color palette.</li>\r\n	<li>~ The whole <a href="http://ellislab.com">EllisLab</a> crew for a great framework.</li>\r\n</ul>');
INSERT INTO `pages` VALUES (2, 1, 'tos', NULL, NULL, 'Terms of Use', '<p>Terms of use goes here</p>');
INSERT INTO `pages` VALUES (3, 0, 'privacy', NULL, NULL, 'Privacy Policy', '<p>Privacy Policy goes here</p>');

-- --------------------------------------------------------

-- 
-- Structure de la table `sessions`
-- 

CREATE TABLE `sessions` (
  `session_id` varchar(40) NOT NULL default '0',
  `ip_address` varchar(16) NOT NULL default '0',
  `user_agent` varchar(50) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL default '0',
  user_data text NOT NULL,
  PRIMARY KEY  (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`) VALUES 
('3b4f8cd4be71453cd695bd375e268527', '127.0.0.1', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.', 1213589867);

DROP TABLE IF EXISTS `groups`;

#
# Table structure for table 'groups'
#

CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table 'groups'
#

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
     (1,'admin','Administrator'),
     (2,'members','General User');



DROP TABLE IF EXISTS `users`;

#
# Table structure for table 'users'
#

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


#
# Dumping data for table 'users'
#

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
     ('1','127.0.0.1','administrator','$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36','','admin@admin.com','',NULL,'1268889823','1268889823','1', 'Admin','istrator','ADMIN','0');


DROP TABLE IF EXISTS `users_groups`;

#
# Table structure for table 'users_groups'
#

CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`),
  CONSTRAINT `uc_users_groups` UNIQUE (`user_id`, `group_id`),
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
     (1,1,1),
     (2,1,2);


DROP TABLE IF EXISTS `login_attempts`;

#
# Table structure for table 'login_attempts'
#

CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
