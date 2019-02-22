/*
SQLyog Community v12.4.3 (32 bit)
MySQL - 5.7.18-log : Database - social_network
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`social_network` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `social_network`;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `pic_url` varchar(255) NOT NULL,
  `user_type` enum('USER','ADMIN') NOT NULL DEFAULT 'USER',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`surname`,`email`,`password`,`pic_url`,`user_type`) values 
(4,'poxos','poxosyan','poxos@mail.com','poxos','1550772068111_GVzkFQnW.jpg','USER'),
(5,'petros','petrosyan','petros@mail.com','petros','1550772092926_Chan-Son-Txek.jpg','USER'),
(6,'valod','valodyan','valod@mail.com','valod','1550772119573_images.jpg','USER');

/*Table structure for table `user_friend` */

DROP TABLE IF EXISTS `user_friend`;

CREATE TABLE `user_friend` (
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `request` enum('FRIEND','REQUEST') NOT NULL,
  KEY `request` (`request`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_friend_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_friend` */

insert  into `user_friend`(`user_id`,`friend_id`,`request`) values 
(4,5,'FRIEND'),
(6,5,'REQUEST');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
