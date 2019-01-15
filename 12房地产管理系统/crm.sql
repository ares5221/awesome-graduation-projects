/*
Navicat MySQL Data Transfer

Source Server         : conn
Source Server Version : 50555
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50555
File Encoding         : 65001

Date: 2017-09-12 18:56:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for customer_care
-- ----------------------------
DROP TABLE IF EXISTS `customer_care`;
CREATE TABLE `customer_care` (
  `care_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) DEFAULT NULL,
  `care_theme` varchar(50) DEFAULT NULL,
  `care_way` varchar(50) DEFAULT NULL,
  `care_time` date NOT NULL DEFAULT '0000-00-00',
  `care_remark` varchar(1000) DEFAULT NULL,
  `care_nexttime` date NOT NULL DEFAULT '0000-00-00',
  `care_people` varchar(50) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`care_id`),
  KEY `FK_Reference_15` (`customer_id`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_care
-- ----------------------------
INSERT INTO `customer_care` VALUES ('3', '1', 'hello', 'world', '2017-08-16', 'dosth', '2017-08-16', '唐僧', '1');
INSERT INTO `customer_care` VALUES ('4', '1', 'hello', 'world', '2017-08-16', 'dosth', '2017-08-16', '唐僧', '1');
INSERT INTO `customer_care` VALUES ('5', '1', 'hello', 'world', '2017-09-16', 'dosth', '2017-08-16', '唐僧', '1');
INSERT INTO `customer_care` VALUES ('12', '1', 'zhes', '发短信', '2017-08-14', 'adsf', '2017-09-14', 'adf', '1');
INSERT INTO `customer_care` VALUES ('13', '9', 'yolo', '发短信', '2017-08-01', '123', '2017-09-01', '23', '1');
INSERT INTO `customer_care` VALUES ('14', '1', 'hello', '发短信', '2017-08-01', '爱的色放', '2017-09-01', '阿尔法', '1');
INSERT INTO `customer_care` VALUES ('15', '9', '买房关怀', '电话问候', '2018-08-09', '好好关怀', '2018-09-09', '员工', '1');

-- ----------------------------
-- Table structure for customer_condition
-- ----------------------------
DROP TABLE IF EXISTS `customer_condition`;
CREATE TABLE `customer_condition` (
  `condition_id` int(10) NOT NULL AUTO_INCREMENT,
  `condition_name` varchar(50) DEFAULT NULL,
  `condition_explain` varchar(1000) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`condition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_condition
-- ----------------------------
INSERT INTO `customer_condition` VALUES ('1', '潜在客户', '可能成为客户的人', '1');
INSERT INTO `customer_condition` VALUES ('2', '意向客户', '有意愿车成为客户的人', '1');
INSERT INTO `customer_condition` VALUES ('3', '交易客户', '正在交易的客户', '1');

-- ----------------------------
-- Table structure for customer_info
-- ----------------------------
DROP TABLE IF EXISTS `customer_info`;
CREATE TABLE `customer_info` (
  `customer_id` int(10) NOT NULL AUTO_INCREMENT,
  `condition_id` int(10) DEFAULT NULL,
  `source_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `type_id` int(10) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_sex` varchar(10) DEFAULT NULL,
  `customer_mobile` varchar(20) DEFAULT NULL,
  `customer_qq` varchar(20) DEFAULT NULL,
  `customer_address` varchar(500) DEFAULT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `customer_remark` varchar(1000) DEFAULT NULL,
  `customer_job` varchar(100) DEFAULT NULL,
  `customer_blog` varchar(100) DEFAULT NULL,
  `customer_tel` varbinary(20) DEFAULT NULL,
  `customer_msn` varchar(50) DEFAULT NULL,
  `birth_day` date NOT NULL DEFAULT '0000-00-00',
  `customer_addtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `customer_addman` varchar(50) DEFAULT NULL,
  `customer_changtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `change_man` varchar(20) DEFAULT NULL,
  `customer_company` varchar(50) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`customer_id`),
  KEY `FK_Reference_16` (`condition_id`),
  KEY `FK_Reference_17` (`source_id`),
  KEY `FK_Reference_18` (`type_id`),
  KEY `FK_Reference_23` (`user_id`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`condition_id`) REFERENCES `customer_condition` (`condition_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`source_id`) REFERENCES `customer_source` (`source_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`type_id`) REFERENCES `customer_type` (`type_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_info
-- ----------------------------
INSERT INTO `customer_info` VALUES ('1', '2', '1', '1', '2', '李四', '男', '13725425426', '2334343', '重庆', '379727687@qq.com', '									你好\r\n		\r\n		\r\n		\r\n		\r\n		', '老板', '3434322', 0x3534353435343333, '23234465', '2013-05-01', '2013-05-08 22:30:40', '张三', '2013-05-25 09:25:43', '张三', '思科', '1');
INSERT INTO `customer_info` VALUES ('2', '1', '1', '1', '1', '华纳', '女', '13924452345', '23456', '重庆三峡', '379727687@qq.com', '						反反复复\r\n		\r\n		', '学生', '6576', 0x3835383538353834, '45454555', '2013-05-01', '2013-05-23 23:05:44', '张三', '2013-05-25 09:31:47', '二位', '天天', '1');
INSERT INTO `customer_info` VALUES ('7', '1', '1', '10', '3', '黄晓军', '男', '15111866066', '909239200', '重庆云阳', '909239200@qq.com', '这个客户很水', '白领', 'guanzhuwo@blog.com', 0x3432323332333233, '2323232', '1992-09-10', '2013-05-25 16:20:38', '蒋大爷', '2013-05-25 16:20:38', '', '敏军网络科技有限公司', '1');
INSERT INTO `customer_info` VALUES ('8', '3', '1', '14', '1', '温庆心', '男', '13652354533', '34562', '爱上对方', '123156@qq.com', '很有钱', '教师', 'sin@blog.com', '', '3456772', '1991-11-03', '2013-05-25 16:49:28', 'admin', '2013-05-25 16:52:07', '张三', '有限公司', '1');
INSERT INTO `customer_info` VALUES ('9', '1', '1', '15', '2', '刘老师', '男', '15111866066', '67543', '重庆丰都', '379727687@qq.com', '很有钱', '程序猿', 'wode@blog.com', 0x3538313035373839, '3246788', '1987-05-13', '2013-05-25 20:00:42', '蒋元征', '2013-05-25 20:04:57', '蒋元征', '中软国际', '1');

-- ----------------------------
-- Table structure for customer_linkman
-- ----------------------------
DROP TABLE IF EXISTS `customer_linkman`;
CREATE TABLE `customer_linkman` (
  `linkman_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) DEFAULT NULL,
  `linkman_name` varchar(50) DEFAULT NULL,
  `linkman_sex` varchar(20) DEFAULT NULL,
  `linkman_job` varchar(100) DEFAULT NULL,
  `linkman_mobile` varchar(20) DEFAULT NULL,
  `linkman_age` int(10) DEFAULT NULL,
  `linkman_relation` varchar(50) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`linkman_id`),
  KEY `FK_Reference_20` (`customer_id`),
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_linkman
-- ----------------------------
INSERT INTO `customer_linkman` VALUES ('1', '2', '铁催', '男', '老板', '35667', '34', '上下属', '1');
INSERT INTO `customer_linkman` VALUES ('2', '2', '钢弹', '女', '员工', '3456789', '13', '亲戚', '1');

-- ----------------------------
-- Table structure for customer_linkreord
-- ----------------------------
DROP TABLE IF EXISTS `customer_linkreord`;
CREATE TABLE `customer_linkreord` (
  `record_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) DEFAULT NULL,
  `link_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `who_link` varchar(50) DEFAULT NULL,
  `link_type` varchar(50) DEFAULT NULL,
  `link_theme` varchar(200) DEFAULT NULL,
  `link_nexttime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_remark` varchar(1000) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`record_id`),
  KEY `FK_Reference_19` (`customer_id`),
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_linkreord
-- ----------------------------
INSERT INTO `customer_linkreord` VALUES ('1', '1', '2013-05-23 23:15:11', '张三', '打电话', '过来买房', '2013-05-28 23:15:14', '很好', '1');
INSERT INTO `customer_linkreord` VALUES ('2', '1', '2017-08-31 20:02:09', '张三', '打电话', '过来看房', '2017-09-29 20:02:35', '陪同好', '1');
INSERT INTO `customer_linkreord` VALUES ('3', '1', '2017-08-19 20:03:20', '张三', '邮件', '看房', '2017-09-13 20:03:40', '培养', '1');
INSERT INTO `customer_linkreord` VALUES ('4', '1', '2017-09-21 20:04:47', '张三', '邮件', '看房', '2017-09-29 20:04:23', '看房', '1');
INSERT INTO `customer_linkreord` VALUES ('5', '1', '2017-09-29 20:04:42', '张三', '视频', '投资', '2017-10-06 20:05:11', '投资', '1');
INSERT INTO `customer_linkreord` VALUES ('6', '1', '2017-10-26 20:05:30', '张三', '视频', '投资', '2017-11-16 20:05:50', '投资', '1');

-- ----------------------------
-- Table structure for customer_source
-- ----------------------------
DROP TABLE IF EXISTS `customer_source`;
CREATE TABLE `customer_source` (
  `source_id` int(10) NOT NULL AUTO_INCREMENT,
  `source_name` varchar(50) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_source
-- ----------------------------
INSERT INTO `customer_source` VALUES ('1', '自己上门', '1');
INSERT INTO `customer_source` VALUES ('2', '朋友推荐', '1');
INSERT INTO `customer_source` VALUES ('3', '百度网', '1');
INSERT INTO `customer_source` VALUES ('4', '电话', '1');

-- ----------------------------
-- Table structure for customer_type
-- ----------------------------
DROP TABLE IF EXISTS `customer_type`;
CREATE TABLE `customer_type` (
  `type_id` int(10) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_type
-- ----------------------------
INSERT INTO `customer_type` VALUES ('1', '客户', '1');
INSERT INTO `customer_type` VALUES ('2', '合作伙伴', '1');
INSERT INTO `customer_type` VALUES ('3', '供应商', '1');
INSERT INTO `customer_type` VALUES ('4', '合作伙伴', '1');
INSERT INTO `customer_type` VALUES ('8', '阿道夫', '1');
INSERT INTO `customer_type` VALUES ('9', '阿萨法', '1');
INSERT INTO `customer_type` VALUES ('12', '合3', '1');
INSERT INTO `customer_type` VALUES ('13', '合5', '1');
INSERT INTO `customer_type` VALUES ('14', '投资', '1');
INSERT INTO `customer_type` VALUES ('15', '合3', '1');
INSERT INTO `customer_type` VALUES ('16', '合5', '1');

-- ----------------------------
-- Table structure for department_info
-- ----------------------------
DROP TABLE IF EXISTS `department_info`;
CREATE TABLE `department_info` (
  `department_id` int(10) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) DEFAULT NULL,
  `department_desc` varchar(500) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department_info
-- ----------------------------
INSERT INTO `department_info` VALUES ('1', '财务部', '很有钱', '1');
INSERT INTO `department_info` VALUES ('3', '销售部', '搞销售的', '1');
INSERT INTO `department_info` VALUES ('5', '后勤部', '辛苦', '我的');
INSERT INTO `department_info` VALUES ('6', '运行部', '潮流', '1');
INSERT INTO `department_info` VALUES ('12', '教育部', '教书育人', '1');
INSERT INTO `department_info` VALUES ('13', '商务部', '不知道干什么的', '1');
INSERT INTO `department_info` VALUES ('14', 'java部', 'java开发', '1');
INSERT INTO `department_info` VALUES ('15', 'android部', 'android移动开发', '1');
INSERT INTO `department_info` VALUES ('17', 'hello部', 'world', '1');

-- ----------------------------
-- Table structure for email_info
-- ----------------------------
DROP TABLE IF EXISTS `email_info`;
CREATE TABLE `email_info` (
  `email_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `email_content` varchar(2000) DEFAULT NULL,
  `email_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `email_state` varchar(50) DEFAULT NULL,
  `email_theme` varchar(200) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`email_id`),
  KEY `FK_Reference_14` (`user_id`),
  KEY `FK_Reference_21` (`customer_id`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_21` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of email_info
-- ----------------------------
INSERT INTO `email_info` VALUES ('21', null, '1', '第三代是的大多数都是', '2013-05-25 19:48:27', '1', '地地道道是', '1');
INSERT INTO `email_info` VALUES ('22', null, '4', '反对反对', '2013-05-25 19:49:15', '0', '风格大方的', '0');
INSERT INTO `email_info` VALUES ('23', null, '4', '反对反对', '2013-05-25 19:49:28', '1', '风格大方的', '1');
INSERT INTO `email_info` VALUES ('24', '2', '1', '刚刚', '2013-05-25 19:50:38', '1', '123', '1');
INSERT INTO `email_info` VALUES ('25', '9', '1', '祝你生日快乐！身体健康！', '2013-05-25 20:22:31', '0', '生日快乐', '1');

-- ----------------------------
-- Table structure for house_info
-- ----------------------------
DROP TABLE IF EXISTS `house_info`;
CREATE TABLE `house_info` (
  `house_id` int(10) NOT NULL AUTO_INCREMENT,
  `type_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `house_address` varchar(500) DEFAULT NULL,
  `house_price` int(20) DEFAULT NULL,
  `house_ambient` varchar(1000) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`house_id`),
  KEY `FK_Reference_13` (`user_id`),
  KEY `FK_Reference_26` (`type_id`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_26` FOREIGN KEY (`type_id`) REFERENCES `house_type` (`type_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house_info
-- ----------------------------
INSERT INTO `house_info` VALUES ('6', '2', '15', '滨江路', '10000', '很好啦！都来看看啊！', '1');
INSERT INTO `house_info` VALUES ('14', '1', '11', '上海', '1000', '我', '1');
INSERT INTO `house_info` VALUES ('15', '6', '11', '北京', '1234', '完美', '1');
INSERT INTO `house_info` VALUES ('16', '7', '5', '上海', '2345', 'good', '1');
INSERT INTO `house_info` VALUES ('18', '3', '10', '北京', '1234', 'good', '1');
INSERT INTO `house_info` VALUES ('19', '4', '11', '上海', '456', 'good', '1');
INSERT INTO `house_info` VALUES ('20', '1', '14', '北京', '12345', '很好', '1');
INSERT INTO `house_info` VALUES ('21', '10', '14', '北京', '123', '很好', '1');
INSERT INTO `house_info` VALUES ('23', '3', '7', '中南海', '100', 'good', '1');
INSERT INTO `house_info` VALUES ('24', '13', '11', '北京', '1234', 'good', '1');

-- ----------------------------
-- Table structure for house_type
-- ----------------------------
DROP TABLE IF EXISTS `house_type`;
CREATE TABLE `house_type` (
  `type_id` int(10) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house_type
-- ----------------------------
INSERT INTO `house_type` VALUES ('1', '三室一厅', '1');
INSERT INTO `house_type` VALUES ('2', '三室两厅', '1');
INSERT INTO `house_type` VALUES ('3', '两室一厅', '1');
INSERT INTO `house_type` VALUES ('4', '四室两厅', '1');
INSERT INTO `house_type` VALUES ('6', '别墅', '1');
INSERT INTO `house_type` VALUES ('7', '农家院', '1');
INSERT INTO `house_type` VALUES ('10', '豪宅', '1');
INSERT INTO `house_type` VALUES ('11', '单间独卫', '1');
INSERT INTO `house_type` VALUES ('12', '蜗居', '1');
INSERT INTO `house_type` VALUES ('13', '炕', '1');

-- ----------------------------
-- Table structure for notice_info
-- ----------------------------
DROP TABLE IF EXISTS `notice_info`;
CREATE TABLE `notice_info` (
  `notice_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `notice_item` varchar(100) DEFAULT NULL,
  `notice_content` varchar(2000) DEFAULT NULL,
  `notice_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `notice_endtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`notice_id`),
  KEY `FK_Reference_12` (`user_id`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice_info
-- ----------------------------
INSERT INTO `notice_info` VALUES ('3', '4', '最近要开会', '记得带钱', '2013-05-23 23:22:12', '2013-05-30 23:22:29', '1');
INSERT INTO `notice_info` VALUES ('6', '11', 'wode', 'adf', '2017-12-11 00:00:00', '2018-12-11 00:00:00', '1');
INSERT INTO `notice_info` VALUES ('9', null, '123', '123', '2017-08-05 00:00:00', '2017-08-12 00:00:00', '1');
INSERT INTO `notice_info` VALUES ('10', '14', '没有', '没有', '2017-08-19 00:00:00', '2017-08-20 00:00:00', '1');
INSERT INTO `notice_info` VALUES ('11', '15', '开会', '年度计划', '2017-08-25 00:00:00', '2017-08-31 00:00:00', '1');
INSERT INTO `notice_info` VALUES ('12', '16', '演戏', '拍电影嘿嘿嘿', '2017-08-11 00:00:00', '2017-08-31 00:00:00', '1');
INSERT INTO `notice_info` VALUES ('13', '18', '测试', '测试内容', '2017-08-16 00:00:00', '2017-08-31 00:00:00', '1');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `department_id` int(10) DEFAULT NULL,
  `role_id` int(10) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_sex` varchar(10) DEFAULT NULL,
  `user_mobile` varchar(20) DEFAULT NULL,
  `user_age` int(10) DEFAULT NULL,
  `user_address` varchar(500) DEFAULT NULL,
  `user_num` varchar(100) DEFAULT NULL,
  `user_pw` varchar(50) DEFAULT NULL,
  `user_tel` varchar(20) DEFAULT NULL,
  `user_idnum` varchar(20) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_addtime` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `user_addman` varchar(50) DEFAULT NULL,
  `user_changetime` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `user_changeman` varchar(50) DEFAULT NULL,
  `user_intest` varchar(1000) DEFAULT NULL,
  `user_diploma` varchar(20) DEFAULT NULL,
  `user_bankcard` varchar(20) DEFAULT NULL,
  `user_nation` varchar(20) DEFAULT NULL,
  `is_married` varchar(10) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`user_id`),
  KEY `FK_Reference_22` (`department_id`),
  KEY `FK_Reference_24` (`role_id`),
  CONSTRAINT `FK_Reference_22` FOREIGN KEY (`department_id`) REFERENCES `department_info` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`role_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '1', '1', '李四', '男', '13254545454', '22', '重庆三峡学院', 'admin', '123456', '22323244', '522141444514744547', 'qizaoshifen@163.com', '2013-05-25 09:37:07', null, '2013-05-25 16:43:05', 'heloo', '斗i', '本科', '2323232345555555522', '汉', '已婚', '1');
INSERT INTO `user_info` VALUES ('4', '1', '1', '王五', '男', '13254545454', '22', '重庆三峡学院', '456', '456', '22323244', '522141444514744547', '8752@qq.com', '2013-05-25 09:37:07', null, '2013-05-25 09:30:14', '2017-06-15 11:33:59', '斗i', '本科', '2323232345555555522', '汉', '已婚', '1');
INSERT INTO `user_info` VALUES ('5', '1', '1', '张元翰', '男', '13254545454', '22', '重庆三峡学院', '789', '789', '22323244', '522141444514744547', '8745592@qq.com', '2013-05-25 09:37:07', null, '2013-05-25 09:29:33', '2017-06-15 11:33:59', '斗i', '本科', '2323232345555555522', '汉', '已婚', '1');
INSERT INTO `user_info` VALUES ('7', '1', '1', '张亚松', '男', '13254545454', '22', '重庆三峡学院', 'huang', '123456', '22323244', '522141444514744547', '87589092@qq.com', '2013-05-25 09:37:07', null, '2013-05-25 19:58:04', '2017-06-15 11:33:59', '斗i', '本科', '2323232345555555522', '汉', '已婚', '1');
INSERT INTO `user_info` VALUES ('10', '1', '1', '常建良', '男', '13254545454', '22', '重庆三峡学院', '123', '123', '22323244', '522141444514744547', '5908692@qq.com', '2013-05-25 09:37:07', null, '1990-01-01 00:00:00', '2017-06-15 11:33:59', '斗i', '本科', '2323232345555555522', '汉', '已婚', '1');
INSERT INTO `user_info` VALUES ('11', '1', '1', '王明月', '男', '13712345675', '22', 'w2s', '1234', '2017-06-15 11:33:59', '1234567', '130625111111111111', '873137160@qq.com', '2017-08-15 18:19:08', null, '1990-01-01 00:00:00', null, 'go', '本科', '1234567890', 'china', '已婚', 'actived');
INSERT INTO `user_info` VALUES ('14', '1', '1', '孟晋宇', '男', '13711111111', '22', 'sfg', '7890', '908', '1234567', '111111111111111111', '12345@qq.com', '2017-08-17 16:06:02', null, '1990-01-01 00:00:00', null, 'hobby', '本科', '12345', 'china', '已婚', '1');
INSERT INTO `user_info` VALUES ('15', '1', '1', '王宇', '男', '13711111111', '18', 'bjsxt', '1234567', '1234567', '1234567', '111111111111111111', '873137160@qq.com', '2017-08-17 19:32:20', null, '1990-01-01 00:00:00', null, 'sing', '本科', '1234567', 'china', '已婚', 'actived');
INSERT INTO `user_info` VALUES ('16', '1', '1', '吴彦祖', '男', '13711111111', '20', '北京', 'yanzu', '1234', '1234567', '111111111111111111', 'wodezhongjidabian@163.com', '2017-08-17 20:15:09', null, '1990-01-01 00:00:00', '吴彦祖', '演戏', '本科', '1234567', 'china', '已婚', 'actived');
INSERT INTO `user_info` VALUES ('17', '1', '1', '常建良', '男', '13711111111', '18', 'bj', '12345', '12345', '1234567', '111111111111111111', '474172495@qq.com', '2017-08-17 20:42:10', null, '1990-01-01 00:00:00', null, '游泳', '本科', '1234567', '汉', '已婚', null);
INSERT INTO `user_info` VALUES ('18', '1', '1', '德华', '男', '13711111111', '23', '北京', 'dehua', '12345', '1234567', '111111111111111111', 'wodezhongjidabian@163.com', '2017-08-18 10:55:23', null, '1990-01-01 00:00:00', null, '爬山', '本科', '1234567', '汉', '已婚', 'actived');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  `role_power` int(10) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '管理员', '3', '1');
INSERT INTO `user_role` VALUES ('2', '员工', '2', '1');
INSERT INTO `user_role` VALUES ('3', '老板', '1', '1');
INSERT INTO `user_role` VALUES ('7', '经理', '3', '1');
INSERT INTO `user_role` VALUES ('9', '董事长', '1', '1');
