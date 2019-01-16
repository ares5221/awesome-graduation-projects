/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50132
Source Host           : localhost:3306
Source Database       : pro

Target Server Type    : MYSQL
Target Server Version : 50132
File Encoding         : 65001

Date: 2013-08-17 19:42:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `i_distribute`
-- ----------------------------
DROP TABLE IF EXISTS `i_distribute`;
CREATE TABLE `i_distribute` (
`itemID`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ,
`item_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`identityID`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`expert_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`score0`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`score1`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`score2`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`score3`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`score4`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`score5`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`score6`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`mind`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`expert_mind`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci

;

-- ----------------------------
-- Records of i_distribute
-- ----------------------------
BEGIN;
INSERT INTO `i_distribute` VALUES ('itemID', 'item_name', 'identityID', 'expert_name', 'score0', 'score1', 'score2', 'score3', 'score4', 'score5', 'score6', 'mind', 'expert_mind');
COMMIT;

-- ----------------------------
-- Table structure for `i_itemsetup`
-- ----------------------------
DROP TABLE IF EXISTS `i_itemsetup`;
CREATE TABLE `i_itemsetup` (
`dateID`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`s_beginDate`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`s_finishDate`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`p_beginDate`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`p_finishDate`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci

;

-- ----------------------------
-- Records of i_itemsetup
-- ----------------------------
BEGIN;
INSERT INTO `i_itemsetup` VALUES ('dateID', 's_beginDate', 's_finishDate', 'p_beginDate', 'p_finishDate');
COMMIT;

-- ----------------------------
-- Table structure for `i_p_info`
-- ----------------------------
DROP TABLE IF EXISTS `i_p_info`;
CREATE TABLE `i_p_info` (
`identityID`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`expert_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`sex`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`bir_date`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`unit_ID`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`unit_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`grade`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`domain`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`sort1`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`sort2`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`zipcode`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`tel`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`introduction`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`pass`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`na`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci

;

-- ----------------------------
-- Records of i_p_info
-- ----------------------------
BEGIN;
INSERT INTO `i_p_info` VALUES ('identityID', 'expert_name', 'sex', 'bir_date', 'unit_ID', 'unit_name', 'grade', 'domain', 'sort1', 'sort2', 'email', 'address', 'zipcode', 'tel', 'introduction', 'pass', 'na'), ('000', 'wwwh', '男', '1972-12-05', '000', 'wwwww', 'ddd', '计算机', '0101', '', 'fff', 'ffff', '223200', '0517-3591438', 'sffgsf', '1', '汉族');
COMMIT;

-- ----------------------------
-- Table structure for `i_p_log`
-- ----------------------------
DROP TABLE IF EXISTS `i_p_log`;
CREATE TABLE `i_p_log` (
`identityID`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`expert_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`password`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci

;

-- ----------------------------
-- Records of i_p_log
-- ----------------------------
BEGIN;
INSERT INTO `i_p_log` VALUES ('identityID', 'expert_name', 'password'), ('000', 'wwwh', '000');
COMMIT;

-- ----------------------------
-- Table structure for `i_s_info`
-- ----------------------------
DROP TABLE IF EXISTS `i_s_info`;
CREATE TABLE `i_s_info` (
`unit_ID`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`unit_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`ename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`cardno`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`corporation`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`property`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`trade`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`investment`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`stuff`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`business`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`connectman`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`tel`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`fax`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`zipcode`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`introduction`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci

;

-- ----------------------------
-- Records of i_s_info
-- ----------------------------
BEGIN;
INSERT INTO `i_s_info` VALUES ('unit_ID', 'unit_name', 'ename', 'cardno', 'corporation', 'property', 'trade', 'investment', 'stuff', 'business', 'connectman', 'tel', 'fax', 'email', 'address', 'zipcode', 'introduction'), ('000', 'www', 'sss', '111', '111', '合资', '工科学校', '10', '10', 'www', '张雷', '025-85476665', '025-85476665', 'damboo@263.net', '淮安', '223200', 'oooo');
COMMIT;

-- ----------------------------
-- Table structure for `i_s_item`
-- ----------------------------
DROP TABLE IF EXISTS `i_s_item`;
CREATE TABLE `i_s_item` (
`itemID`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`unit_ID`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`item_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`sort1`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`sort2`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`begin_date`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`finish_date`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`applicant`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`grade`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`education`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`unit_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`fill_date`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`purport`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`status`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`future`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`point`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`analysis`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`way`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`moment`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`result`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`reference`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`market`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`commend_mind`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`expert_mind`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`leading_mind`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`pass`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci

;

-- ----------------------------
-- Records of i_s_item
-- ----------------------------
BEGIN;
INSERT INTO `i_s_item` VALUES ('itemID', 'unit_ID', 'item_name', 'sort1', 'sort2', 'begin_date', 'finish_date', 'applicant', 'grade', 'education', 'unit_name', 'fill_date', 'purport', 'status', 'future', 'point', 'analysis', 'way', 'moment', 'result', 'reference', 'market', 'commend_mind', 'expert_mind', 'leading_mind', 'pass'), ('1', '000', 'xcccx', 'xcc', 'c', '1998-1-5', '2000-5-10', '', '', '', '', '2001-01-01', '', '', '', '', '', '', '', '', '', '', '', '', '', ''), ('4', '000', 'cvcxv', 'vcvc', 'vcvvc', '2001-1-10', '2002-1-10', '', '', '', '', '2002-01-01', '', '', '', '', '', '', '', '', '', '', '', '', '', ''), ('5', '000', 'kkj', 'khkj', 'kk', '2002-2-10', '2003-1-1', '', '', '', '', '2003-01-10', '', '', '', '', '', '', '', '', '', '', '', '', '', ''), ('6', '000', 'aA', '0202', '', '1999-1-10', '2000-10-1', 'DD', '中级', '12', '中兴', '2000-01-01', 'DD', 'DD', 'DD', 'DD', 'DD', 'DD', 'DD', 'DD', 'DDS', 'DF', 'DF', '', '', ''), ('7', '000', 'VF', '0201', '', '2000-1-1', '2001-1-10', 'CV', 'VV', 'VCV', 'VC', '2000-01-10', 'FG', 'GG', 'GFD', 'GFSDG', 'GS', 'GSD', 'GG', 'FDG', 'MNBM', 'GFH', 'GHD', '', '', ''), ('8', '000', 'qqq', '0501', '', '2004-01-01', '2002-01-01', 'advande', 'grade', 'zhanghainan', '中兴', '2005-01-01', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'qq', 'qq', 'qq', '', '', '');
COMMIT;

-- ----------------------------
-- Table structure for `i_s_logon`
-- ----------------------------
DROP TABLE IF EXISTS `i_s_logon`;
CREATE TABLE `i_s_logon` (
`Unit_ID`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`password`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci

;

-- ----------------------------
-- Records of i_s_logon
-- ----------------------------
BEGIN;
INSERT INTO `i_s_logon` VALUES ('Unit_ID', 'password'), ('000', '000');
COMMIT;

-- ----------------------------
-- Table structure for `i_s_money`
-- ----------------------------
DROP TABLE IF EXISTS `i_s_money`;
CREATE TABLE `i_s_money` (
`moneyID`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`itemID`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`outItem`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`sMoney`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci

;

-- ----------------------------
-- Records of i_s_money
-- ----------------------------
BEGIN;
INSERT INTO `i_s_money` VALUES ('moneyID', 'itemID', 'outItem', 'sMoney'), ('4', '6', 'SS', '120'), ('5', '7', 'FG', '100'), ('7', '8', 'q', '1010');
COMMIT;

-- ----------------------------
-- Table structure for `i_z_log`
-- ----------------------------
DROP TABLE IF EXISTS `i_z_log`;
CREATE TABLE `i_z_log` (
`adminID`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`password`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci

;

-- ----------------------------
-- Records of i_z_log
-- ----------------------------
BEGIN;
INSERT INTO `i_z_log` VALUES ('adminID', 'password'), ('000', '000');
COMMIT;
