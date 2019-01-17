/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.49-community : Database - db_personmanager
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_personmanager` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_personmanager`;

/*Table structure for table `tb_cj` */

DROP TABLE IF EXISTS `tb_cj`;

CREATE TABLE `tb_cj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cj_title` varchar(50) DEFAULT NULL,
  `cj_type` varchar(1) DEFAULT NULL,
  `cj_content` text,
  `cj_money` varchar(50) DEFAULT NULL,
  `cj_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tb_cj` */

insert  into `tb_cj`(`id`,`cj_title`,`cj_type`,`cj_content`,`cj_money`,`cj_time`) values (1,'羽毛球单打比赛一等奖','1','庞*娅、尹*相','0','2007-10-10'),(3,'羽毛球单打比赛二等奖','1','邹*思、王*殊、张*庭、粱*冰','0','2007-12-1'),(4,'迟到','0','每天早上都迟到','50','2007-12-4');

/*Table structure for table `tb_department` */

DROP TABLE IF EXISTS `tb_department`;

CREATE TABLE `tb_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt_name` varchar(10) DEFAULT NULL,
  `dt_createTime` varchar(20) DEFAULT NULL,
  `dt_bz` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `tb_department` */

insert  into `tb_department`(`id`,`dt_name`,`dt_createTime`,`dt_bz`) values (2,'Java WEB','2007-11-21','负责JSP网页'),(3,'ASP.net','2007-11-21','负责ASP.net网页'),(4,'C#','2007-11-21','负责C#应用程序'),(5,'VC','2007-11-21','负责VC应用程序'),(6,'VB','2007-11-21','VB应用程序'),(7,'ASP','2007-11-21','负责ASP网页'),(8,'PHP','2007-11-21','负责PHP网页'),(9,'基础部','2007-11-21','负责程序编写的辅助工作'),(10,'人力资源','2007-11-21','负责人事工作'),(11,'C#部门','2007-11-21','程序制作');

/*Table structure for table `tb_employee` */

DROP TABLE IF EXISTS `tb_employee`;

CREATE TABLE `tb_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `em_serialNumber` varchar(30) DEFAULT NULL,
  `em_name` varchar(10) DEFAULT NULL,
  `em_sex` varchar(2) DEFAULT NULL,
  `em_age` int(11) DEFAULT NULL,
  `em_IDCard` varchar(30) DEFAULT NULL,
  `em_born` varchar(50) DEFAULT NULL,
  `em_nation` varchar(10) DEFAULT NULL,
  `em_marriage` varchar(10) DEFAULT NULL,
  `em_visage` varchar(10) DEFAULT NULL,
  `em_ancestralHome` varchar(30) DEFAULT NULL,
  `em_tel` varchar(50) DEFAULT NULL,
  `em_address` varchar(50) DEFAULT NULL,
  `em_afterSchool` varchar(50) DEFAULT NULL,
  `em_speciality` varchar(50) DEFAULT NULL,
  `em_culture` varchar(10) DEFAULT NULL,
  `em_startime` varchar(30) DEFAULT NULL,
  `em_departmentId` int(11) DEFAULT NULL,
  `em_typeWork` varchar(10) DEFAULT NULL,
  `em_creatime` varchar(50) DEFAULT NULL,
  `em_createName` varchar(30) DEFAULT NULL,
  `em_bz` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `tb_employee` */

insert  into `tb_employee`(`id`,`em_serialNumber`,`em_name`,`em_sex`,`em_age`,`em_IDCard`,`em_born`,`em_nation`,`em_marriage`,`em_visage`,`em_ancestralHome`,`em_tel`,`em_address`,`em_afterSchool`,`em_speciality`,`em_culture`,`em_startime`,`em_departmentId`,`em_typeWork`,`em_creatime`,`em_createName`,`em_bz`) values (2,'001','刘*红','女',25,'22010198********','1981-02-22','汉','未婚','无','吉林省长春','131808*****','长春市和平大街','长春*工大学','计算机科学与技术','研究生','2005-02-02',9,'程序员','2007-11-30','tsoft','该员工工作态度积极，具有很强的团队精神'),(3,'002','李*尉','女',25,'22010198********','1981-02-22','汉','未婚','无','吉林省长春','131808*****','长春市和平大街','长春*工大学','计算机科学与技术','研究生','2005-02-02',9,'程序员','2007-11-30','tsoft','该员工工作态度积极，具有很强的团队精神'),(4,'003','李*钟','女',25,'22010198********','1981-02-22','汉','未婚','无','吉林省长春','131808*****','长春市和平大街','长春*工大学','计算机科学与技术','研究生','2005-02-02',9,'程序员','2007-11-30','tsoft','该员工工作态度积极，具有很强的团队精神'),(5,'004','李*一','女',25,'22010198********','1981-02-22','汉','未婚','无','吉林省长春','131808*****','长春市和平大街','长春*工大学','计算机科学与技术','研究生','2005-02-02',9,'程序员','2007-11-30','tsoft','该员工工作态度积极，具有很强的团队精神'),(6,'005','梁*冰','女',25,'22010198********','1981-02-22','汉','未婚','无','吉林省长春','131808*****','长春市和平大街','长春*工大学','计算机科学与技术','研究生','2005-02-02',9,'程序员','2007-11-30','tsoft','该员工工作态度积极，具有很强的团队精神'),(7,'006','梁*水','女',25,'22010198********','1981-02-22','汉','未婚','无','吉林省长春','131808*****','长春市和平大街','长春*工大学','计算机科学与技术','研究生','2005-02-02',9,'程序员','2007-11-30','tsoft','该员工工作态度积极，具有很强的团队精神'),(8,'007','王*毅','女',25,'22010198********','1981-02-22','汉','未婚','无','吉林省长春','131808*****','长春市和平大街','长春*工大学','计算机科学与技术','研究生','2005-02-02',9,'程序员','2007-11-30','tsoft','该员工工作态度积极，具有很强的团队精神'),(9,'008','上*凯','女',25,'22010198********','1981-02-22','汉','未婚','无','吉林省长春','131808*****','长春市和平大街','长春*工大学','计算机科学与技术','研究生','2005-02-02',9,'程序员','2007-11-30','tsoft','该员工工作态度积极，具有很强的团队精神'),(10,'016','贺*凯','女',25,'22010198********','1981-02-22','汉','未婚','无','吉林省长春','131808*****','长春市和平大街','长春*工大学','计算机科学与技术','研究生','2005-02-02',9,'程序员','2007-11-30','tsoft','该员工工作态度积极，具有很强的团队精神'),(11,'017','刘**','女',25,'22010198********','1981-02-22','汉','未婚','无','吉林省长春','131808*****','长春市和平大街','长春*工大学','计算机科学与技术','研究生','2005-02-02',9,'程序员','2007-11-30','tsoft','该员工工作态度积极，具有很强的团队精神'),(12,'012','21','男',21,'21','21','汉','未婚','无','21','21','21','21','21','本科生','21',1,'程序员','2013-7-8','tsoft','无21');

/*Table structure for table `tb_invitejob` */

DROP TABLE IF EXISTS `tb_invitejob`;

CREATE TABLE `tb_invitejob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `born` varchar(50) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `specialty` varchar(50) DEFAULT NULL,
  `experience` varchar(10) DEFAULT NULL,
  `teachSchool` varchar(30) DEFAULT NULL,
  `afterSchool` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `createtime` varchar(50) DEFAULT NULL,
  `content` text,
  `isstock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

/*Data for the table `tb_invitejob` */

insert  into `tb_invitejob`(`id`,`name`,`sex`,`age`,`born`,`job`,`specialty`,`experience`,`teachSchool`,`afterSchool`,`tel`,`address`,`createtime`,`content`,`isstock`) values (33,'任*飞','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(34,'任*飞1','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(35,'任*飞2','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(36,'任*飞3','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(37,'任*飞4','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(38,'任*飞5','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(39,'任*飞6','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(40,'任*飞7','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(41,'任*飞8','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(42,'任*飞9','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(43,'任*飞10','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(44,'任*飞11','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(45,'任*飞12','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(46,'任*飞13','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(47,'任*飞14','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(48,'任*飞15','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(49,'任*飞16','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(50,'任*飞17','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(51,'任*飞18','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(52,'任*飞19','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(53,'任*飞20','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(54,'任*飞21','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(55,'任*飞22','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(56,'任*飞23','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(57,'任*飞24','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(58,'任*飞25','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(59,'任*飞26','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(60,'任*飞27','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(61,'任*飞28','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(62,'任*飞29','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(63,'任*飞30','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(64,'任*飞31','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(65,'任*飞32','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(66,'任*飞33','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0),(67,'任*飞34','男',27,'1981-01-01','Java程序员','计算机应用','无','本科生','吉*大学','131******73','长春市和平大街','2007-11-29','应届毕业生，无工作经验',0);

/*Table structure for table `tb_manager` */

DROP TABLE IF EXISTS `tb_manager`;

CREATE TABLE `tb_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `managerLevel` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tb_manager` */

insert  into `tb_manager`(`id`,`account`,`password`,`managerLevel`) values (1,'tsoft','111','1'),(2,'wy9wy','1','0'),(3,'wy10wy','111','0');

/*Table structure for table `tb_pay` */

DROP TABLE IF EXISTS `tb_pay`;

CREATE TABLE `tb_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_emNumber` varchar(30) DEFAULT NULL,
  `pay_emName` varchar(10) DEFAULT NULL,
  `pay_month` varchar(50) DEFAULT NULL,
  `pay_baseMoney` int(11) DEFAULT NULL,
  `pay_overtime` int(11) DEFAULT NULL,
  `pay_age` int(11) DEFAULT NULL,
  `pay_check` float DEFAULT NULL,
  `pay_absent` float DEFAULT NULL,
  `pay_safety` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tb_pay` */

insert  into `tb_pay`(`id`,`pay_emNumber`,`pay_emName`,`pay_month`,`pay_baseMoney`,`pay_overtime`,`pay_age`,`pay_check`,`pay_absent`,`pay_safety`) values (1,'012','上*凯','2007-12',2000,1,1,100,0,128),(2,'007','王*毅','2007-12',2000,1,1,100,0,128),(3,'017','刘**','2007-12',4500,0,0,100,0,128);

/*Table structure for table `tb_train` */

DROP TABLE IF EXISTS `tb_train`;

CREATE TABLE `tb_train` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tn_man` varchar(10) DEFAULT NULL,
  `tn_title` varchar(50) DEFAULT NULL,
  `tn_content` varchar(50) DEFAULT NULL,
  `tn_time` varchar(30) DEFAULT NULL,
  `tn_address` varchar(30) DEFAULT NULL,
  `tn_join` varchar(50) DEFAULT NULL,
  `tn_bz` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tb_train` */

insert  into `tb_train`(`id`,`tn_man`,`tn_title`,`tn_content`,`tn_time`,`tn_address`,`tn_join`,`tn_bz`) values (1,'总经理','员工守则','了解每一条款中的内容','2007-01-01','2205室','全体员工','这个员工守则是新规定的内容，需要开会向全体员工说明');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
