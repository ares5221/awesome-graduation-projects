/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : db_librarysys

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2017-09-13 03:00:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_bookbaseinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookbaseinfo`;
CREATE TABLE `tb_bookbaseinfo` (
  `bid` int(11) NOT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `lid` int(10) DEFAULT NULL,
  `tid` int(10) DEFAULT NULL,
  `bcid` int(10) DEFAULT NULL,
  `barcode` varchar(30) DEFAULT NULL,
  `bname` varchar(70) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `count` tinyint(1) DEFAULT '0',
  `borrowcount` int(4) DEFAULT NULL,
  PRIMARY KEY (`bid`),
  KEY `FK_Reference_1` (`ISBN`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`ISBN`) REFERENCES `tb_publishing` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bookbaseinfo
-- ----------------------------
INSERT INTO `tb_bookbaseinfo` VALUES ('1', '1', '1', '1', '2', '1', '平凡的世界', '路遥', '30', '36');
INSERT INTO `tb_bookbaseinfo` VALUES ('2', '9787511539618', '1', '1', '3', '2', '了不起的盖茨比', '菲兹杰拉德', '0', '38');
INSERT INTO `tb_bookbaseinfo` VALUES ('3', '9787303212842', '1', '1', '3', '3', '米尔斯文集：社会学的想象力', 'C.赖特·米尔斯', '12', '333');

-- ----------------------------
-- Table structure for tb_bookcase
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookcase`;
CREATE TABLE `tb_bookcase` (
  `bcid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bcname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`bcid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bookcase
-- ----------------------------
INSERT INTO `tb_bookcase` VALUES ('2', 'B');
INSERT INTO `tb_bookcase` VALUES ('3', 'E');
INSERT INTO `tb_bookcase` VALUES ('5', 'A');
INSERT INTO `tb_bookcase` VALUES ('6', 'F');

-- ----------------------------
-- Table structure for tb_bookinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookinfo`;
CREATE TABLE `tb_bookinfo` (
  `bid` int(11) NOT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `barcode` varchar(30) DEFAULT NULL,
  `bname` varchar(70) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `translator` varchar(30) DEFAULT NULL,
  `price` float(8,2) DEFAULT NULL,
  `pages` int(10) unsigned DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`bid`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`bid`) REFERENCES `tb_bookbaseinfo` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bookinfo
-- ----------------------------
INSERT INTO `tb_bookinfo` VALUES ('1', '1', '1234', '平凡的世界', '路遥', null, '34.00', '244', '32k');
INSERT INTO `tb_bookinfo` VALUES ('2', '9787511539618', '678686', '了不起的盖茨比', '菲兹杰拉德', '王晋华', '48.00', '433', '32k');
INSERT INTO `tb_bookinfo` VALUES ('3', '9787303212842', '3', '米尔斯文集：社会学的想象力', 'C.赖特·米尔斯', '李钧鹏', '33.90', '328', '32k');

-- ----------------------------
-- Table structure for tb_booktype
-- ----------------------------
DROP TABLE IF EXISTS `tb_booktype`;
CREATE TABLE `tb_booktype` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(30) DEFAULT NULL,
  `days` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_booktype
-- ----------------------------
INSERT INTO `tb_booktype` VALUES ('1', '文史类', '40');
INSERT INTO `tb_booktype` VALUES ('3', '理工类', '30');

-- ----------------------------
-- Table structure for tb_borrow
-- ----------------------------
DROP TABLE IF EXISTS `tb_borrow`;
CREATE TABLE `tb_borrow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `sid` int(10) DEFAULT NULL,
  `borrowTime` date DEFAULT NULL,
  `backTime` date DEFAULT NULL,
  `ifback` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_6` (`bid`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`bid`) REFERENCES `tb_bookbaseinfo` (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_borrow
-- ----------------------------
INSERT INTO `tb_borrow` VALUES ('19', '2', '1', '7', '2017-08-31', '2017-12-29', '1');
INSERT INTO `tb_borrow` VALUES ('32', '2', '1', '7', '2017-09-01', '2017-11-30', '0');
INSERT INTO `tb_borrow` VALUES ('33', '2', '2', '7', '2017-09-01', '2017-11-30', '0');
INSERT INTO `tb_borrow` VALUES ('35', '2', '1', '7', '2017-09-01', '2017-11-30', '0');
INSERT INTO `tb_borrow` VALUES ('37', '1', '2', '7', '2017-09-01', '2017-09-10', '0');
INSERT INTO `tb_borrow` VALUES ('39', '2', '2', '7', '2017-09-01', '2017-11-30', '0');
INSERT INTO `tb_borrow` VALUES ('40', '2', '2', '7', '2017-09-01', '2017-11-30', '0');
INSERT INTO `tb_borrow` VALUES ('43', '1', '1', '7', '2017-09-13', '2018-01-11', '1');
INSERT INTO `tb_borrow` VALUES ('44', '1', '2', '7', '2017-09-13', '2017-12-12', '0');
INSERT INTO `tb_borrow` VALUES ('45', '1', '2', '7', '2017-09-13', '2017-12-12', '0');
INSERT INTO `tb_borrow` VALUES ('46', '1', '2', '7', '2017-09-13', '2017-12-12', '0');

-- ----------------------------
-- Table structure for tb_card
-- ----------------------------
DROP TABLE IF EXISTS `tb_card`;
CREATE TABLE `tb_card` (
  `fees` double DEFAULT NULL,
  `validity` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_card
-- ----------------------------
INSERT INTO `tb_card` VALUES ('34', '2', '1');

-- ----------------------------
-- Table structure for tb_giveback
-- ----------------------------
DROP TABLE IF EXISTS `tb_giveback`;
CREATE TABLE `tb_giveback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `sid` int(10) DEFAULT NULL,
  `backTime` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_8` (`bid`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`bid`) REFERENCES `tb_bookbaseinfo` (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_giveback
-- ----------------------------
INSERT INTO `tb_giveback` VALUES ('1', '1', '1', '1', '2017-06-12');
INSERT INTO `tb_giveback` VALUES ('2', '2', '1', '1', '2017-08-31');
INSERT INTO `tb_giveback` VALUES ('3', '2', '1', '1', '2017-08-31');
INSERT INTO `tb_giveback` VALUES ('4', '2', '2', '1', '2017-08-31');
INSERT INTO `tb_giveback` VALUES ('5', '2', '2', '1', '2017-08-31');
INSERT INTO `tb_giveback` VALUES ('6', '2', '2', '1', '2017-08-31');
INSERT INTO `tb_giveback` VALUES ('7', '2', '2', '1', '2017-08-31');
INSERT INTO `tb_giveback` VALUES ('8', '2', '1', '1', '2017-08-31');
INSERT INTO `tb_giveback` VALUES ('9', '2', '2', '1', '2017-08-31');
INSERT INTO `tb_giveback` VALUES ('10', '2', '2', '1', '2017-08-31');
INSERT INTO `tb_giveback` VALUES ('11', '2', '2', '6', '2017-09-01');
INSERT INTO `tb_giveback` VALUES ('12', '2', '1', '7', '2017-09-01');
INSERT INTO `tb_giveback` VALUES ('13', '2', '2', '7', '2017-09-01');
INSERT INTO `tb_giveback` VALUES ('14', '1', '1', '7', '2017-09-01');
INSERT INTO `tb_giveback` VALUES ('15', '1', '1', '7', '2017-09-01');
INSERT INTO `tb_giveback` VALUES ('16', '1', '2', '7', '2017-09-01');
INSERT INTO `tb_giveback` VALUES ('17', '1', '1', '7', '2017-09-01');
INSERT INTO `tb_giveback` VALUES ('18', '1', '2', '7', '2017-09-01');
INSERT INTO `tb_giveback` VALUES ('19', '1', '1', '7', '2017-09-13');
INSERT INTO `tb_giveback` VALUES ('20', '1', '1', '7', '2017-09-13');
INSERT INTO `tb_giveback` VALUES ('21', '1', '1', '7', '2017-09-13');
INSERT INTO `tb_giveback` VALUES ('22', '1', '1', '7', '2017-09-13');

-- ----------------------------
-- Table structure for tb_library
-- ----------------------------
DROP TABLE IF EXISTS `tb_library`;
CREATE TABLE `tb_library` (
  `lid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `liber` varchar(10) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `addr` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `creatdate` date DEFAULT NULL,
  `intro` text,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_library
-- ----------------------------
INSERT INTO `tb_library` VALUES ('1', '博研图书馆', '博研', '13635863201', '北京市海淀区', 'wgh717867@qq.com', 'http://www.boyan.com', '2006-07-06', '博研图书馆创建于2006年7月6日。\"\"\"\"\"\"');

-- ----------------------------
-- Table structure for tb_manager
-- ----------------------------
DROP TABLE IF EXISTS `tb_manager`;
CREATE TABLE `tb_manager` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `PWD` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `FK_Reference_11` (`pid`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`pid`) REFERENCES `tb_purview` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_manager
-- ----------------------------
INSERT INTO `tb_manager` VALUES ('1', '1', '系统管理员', '123');
INSERT INTO `tb_manager` VALUES ('2', '2', '图书管理员', '123');
INSERT INTO `tb_manager` VALUES ('4', '4', '张晓芭', '123456');
INSERT INTO `tb_manager` VALUES ('7', '2', '张三', '111111');

-- ----------------------------
-- Table structure for tb_publishing
-- ----------------------------
DROP TABLE IF EXISTS `tb_publishing`;
CREATE TABLE `tb_publishing` (
  `ISBN` varchar(20) NOT NULL,
  `publishName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_publishing
-- ----------------------------
INSERT INTO `tb_publishing` VALUES ('1', '尚学堂出版社');
INSERT INTO `tb_publishing` VALUES ('9787303212842', '北京师范大学出版社');
INSERT INTO `tb_publishing` VALUES ('9787511539618', '人民日报出版社');

-- ----------------------------
-- Table structure for tb_purview
-- ----------------------------
DROP TABLE IF EXISTS `tb_purview`;
CREATE TABLE `tb_purview` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `sysset` tinyint(1) DEFAULT '0',
  `readerset` tinyint(1) DEFAULT '0',
  `bookset` tinyint(1) DEFAULT '0',
  `borrowback` tinyint(1) DEFAULT '0',
  `sysquery` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_purview
-- ----------------------------
INSERT INTO `tb_purview` VALUES ('1', '1', '1', '1', '1', '1');
INSERT INTO `tb_purview` VALUES ('2', '0', '1', '1', '1', '0');
INSERT INTO `tb_purview` VALUES ('4', '0', '1', '0', '1', '0');
INSERT INTO `tb_purview` VALUES ('5', '1', '0', '1', '0', '1');
INSERT INTO `tb_purview` VALUES ('6', '0', '1', '0', '1', '0');
INSERT INTO `tb_purview` VALUES ('7', '1', '1', '1', '1', '1');
INSERT INTO `tb_purview` VALUES ('8', '1', '1', '1', '1', '1');
INSERT INTO `tb_purview` VALUES ('9', '1', '0', '0', '0', '0');
INSERT INTO `tb_purview` VALUES ('10', '0', '0', '0', '0', '0');
INSERT INTO `tb_purview` VALUES ('11', '1', '1', '1', '0', '0');
INSERT INTO `tb_purview` VALUES ('12', '0', '0', '0', '0', '0');
INSERT INTO `tb_purview` VALUES ('13', '1', '1', '0', '1', '0');

-- ----------------------------
-- Table structure for tb_reader
-- ----------------------------
DROP TABLE IF EXISTS `tb_reader`;
CREATE TABLE `tb_reader` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `tid` int(10) DEFAULT NULL,
  `barcode` varchar(30) DEFAULT NULL,
  `vocation` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `paperType` varchar(10) DEFAULT NULL,
  `paperNO` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `remark` text,
  `endDate` date DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_reader
-- ----------------------------
INSERT INTO `tb_reader` VALUES ('1', '杨一', '男', '1', '1', '学生', '1991-10-29', '身份证', '610502199110297832', '18701552159', '623685463@qq.com', '2017-06-27', '李白', '', '2025-12-12');
INSERT INTO `tb_reader` VALUES ('2', '张晓六', '女', '2', '2', '老师', '1996-02-15', '身份证', '130632199610286680', '18810878767', '123498998@qq.com', '2017-08-08', '李白', null, '2020-08-08');

-- ----------------------------
-- Table structure for tb_readertype
-- ----------------------------
DROP TABLE IF EXISTS `tb_readertype`;
CREATE TABLE `tb_readertype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `number` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_readertype
-- ----------------------------
INSERT INTO `tb_readertype` VALUES ('1', '学生', '15');
INSERT INTO `tb_readertype` VALUES ('2', '教师', '20');
INSERT INTO `tb_readertype` VALUES ('3', '教授', '30');
