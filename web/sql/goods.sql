/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50544
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50544
File Encoding         : 65001

Date: 2017-08-06 22:39:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `place` varchar(20) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `left` int(4) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '李宁跑步鞋', '浙江', '200.00', '1500', '001.jpg');
INSERT INTO `goods` VALUES ('2', '耐克运动鞋', '福建', '300.00', '2600', '002.jpg');
INSERT INTO `goods` VALUES ('3', '乔丹篮球鞋', '广东', '350.00', '1600', '003.jpg');
SET FOREIGN_KEY_CHECKS=1;
