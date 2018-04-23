/*
SQLyog Community v12.2.4 (32 bit)
MySQL - 5.0.45-community-nt : Database - test_database
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test_database` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `test_database`;

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `empid` int(11) NOT NULL auto_increment,
  `ename` varchar(100) default NULL,
  `email` varchar(50) default NULL,
  `address` varchar(250) default NULL,
  `phone` varchar(50) default NULL,
  PRIMARY KEY  (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `employee` */

insert  into `employee`(`empid`,`ename`,`email`,`address`,`phone`) values 
(1,'Saurabh Phatale','saurabh.phatale7@gmail.com','Kothrud','9552189265'),
(2,'Swarup Phatale','swar@gmail.com','Kondhwa','8213452323'),
(3,'Madan Mohan','madday123@yahoo.com','Mundhwa','9565658595'),
(4,'Chandan Mhatre','chand@rediffmail.com','Sadashiv Peth','9598556556'),
(5,'Pintya Rakate','pints@gmail.com','215/6,Erandwane','9656457556'),
(6,'Sanjay Pawar','sanjay23@gmail.com','Tahawade','9585856412'),
(7,'Santosh Kotiyan','sant.kotiyan@gmail.com','Dhankawadi','9587645855');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
