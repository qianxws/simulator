/*
Navicat MySQL Data Transfer

Source Server         : 10.10.10.230
Source Server Version : 50547
Source Host           : 10.10.10.230:3306
Source Database       : simulator_plat

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2019-10-25 14:56:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sim_dependency`
-- ----------------------------
DROP TABLE IF EXISTS `sim_dependency`;
CREATE TABLE `sim_dependency` (
  `dependency_id` varchar(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `run_order` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `updator` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`dependency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sim_dependency
-- ----------------------------
INSERT INTO `sim_dependency` VALUES ('1', 'Vdr计算机', '1', '2019-10-25 11:23:04', 'admin', null, '');
INSERT INTO `sim_dependency` VALUES ('2', 'Vdr软件', '2', '2019-10-22 14:55:18', 'root', null, '');
INSERT INTO `sim_dependency` VALUES ('3', '数据库计算机', '3', '2019-10-22 14:55:28', 'root', null, '');
INSERT INTO `sim_dependency` VALUES ('4', '数据库软件', '4', '2019-10-22 14:55:39', 'root', null, '');
INSERT INTO `sim_dependency` VALUES ('5', '节点计算机', '5', '2019-10-22 14:55:51', 'root', null, '');
INSERT INTO `sim_dependency` VALUES ('6', '节点软件', '6', '2019-10-22 14:56:00', 'root', null, '');

-- ----------------------------
-- Table structure for `sim_device`
-- ----------------------------
DROP TABLE IF EXISTS `sim_device`;
CREATE TABLE `sim_device` (
  `device_id` varchar(36) NOT NULL,
  `simulator_id` varchar(36) DEFAULT NULL,
  `type_id` varchar(36) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `enabling_time` datetime DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `pc` varchar(36) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `mac` varchar(50) DEFAULT NULL,
  `delay_start_time` datetime DEFAULT NULL,
  `operate_times` bigint(20) DEFAULT NULL,
  `fault_times` bigint(20) DEFAULT NULL,
  `repair_times` bigint(20) DEFAULT NULL,
  `maintenance_times` bigint(20) DEFAULT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `operate` varchar(500) DEFAULT NULL,
  `operate_time` datetime DEFAULT NULL,
  `is_start` bit(1) DEFAULT NULL,
  `cpu_rate` decimal(5,2) DEFAULT NULL,
  `ram_rate` decimal(5,2) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `soft_start_time` datetime DEFAULT NULL,
  `disc_rate` decimal(5,2) DEFAULT NULL,
  `temp` decimal(5,2) DEFAULT NULL,
  `extend_attr` varchar(2500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `updator` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sim_device
-- ----------------------------
INSERT INTO `sim_device` VALUES ('dev01', '001001001', '', null, '13567826', null, null, null, null, null, null, null, null, null, null, null, 'test', '2019-10-24 14:21:40', null, null, null, null, null, null, null, null, '', '2019-10-21 13:57:26', null, null, null);
INSERT INTO `sim_device` VALUES ('dev02', '001001002', '', null, '23567826', null, null, null, null, null, null, null, null, null, null, null, 'test', '2019-10-24 14:21:40', null, null, null, null, null, null, null, null, '', '2019-10-21 13:57:36', null, null, null);
INSERT INTO `sim_device` VALUES ('dev03', null, null, null, '33567826', null, null, null, null, null, null, null, null, null, null, null, 'test', '2019-10-24 14:21:40', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_device` VALUES ('dev04', null, null, null, '43567826', null, null, null, null, null, null, null, null, null, null, null, null, null, '', '36.00', '53.00', '2019-10-16 13:35:23', '2019-10-24 14:21:40', null, '23.00', '27.00', null, null, null, null, null);
INSERT INTO `sim_device` VALUES ('dev05', null, null, null, '53567826', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2019-10-16 13:35:23', '2019-10-24 14:21:40', null, null, null, null, null, null, null, null);
INSERT INTO `sim_device` VALUES ('dev06', null, null, null, '63567826', null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, null, null, null, '2019-10-24 14:21:40', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `sim_device_dependency`
-- ----------------------------
DROP TABLE IF EXISTS `sim_device_dependency`;
CREATE TABLE `sim_device_dependency` (
  `device_dependency_id` varchar(36) NOT NULL,
  `dependency_id` varchar(36) DEFAULT NULL,
  `device_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`device_dependency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sim_device_dependency
-- ----------------------------
INSERT INTO `sim_device_dependency` VALUES ('1', '2', 'dev01');

-- ----------------------------
-- Table structure for `sim_duty_reg`
-- ----------------------------
DROP TABLE IF EXISTS `sim_duty_reg`;
CREATE TABLE `sim_duty_reg` (
  `duty_reg_id` varchar(36) NOT NULL,
  `duty_task_id` varchar(36) DEFAULT NULL,
  `duty_content` varchar(500) DEFAULT NULL,
  `fault_reg` varchar(500) DEFAULT NULL,
  `repair_reg` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `updator` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`duty_reg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sim_duty_reg
-- ----------------------------
INSERT INTO `sim_duty_reg` VALUES ('2516e4b905474d59b2d50244963f7750', 'task01', '', '111', '', '2019-10-22 16:12:23', 'root', null, '');
INSERT INTO `sim_duty_reg` VALUES ('d41d3a4c974b461e93cf9ab63473e756', 'task02', '', '', '22', '2019-10-22 16:12:32', 'root', null, '');

-- ----------------------------
-- Table structure for `sim_duty_task`
-- ----------------------------
DROP TABLE IF EXISTS `sim_duty_task`;
CREATE TABLE `sim_duty_task` (
  `duty_task_id` varchar(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `train_ground` varchar(500) DEFAULT NULL,
  `train_content` varchar(500) DEFAULT NULL,
  `is_exec` bit(1) DEFAULT NULL,
  `station` varchar(36) DEFAULT NULL,
  `watchman` varchar(36) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `updator` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`duty_task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sim_duty_task
-- ----------------------------
INSERT INTO `sim_duty_task` VALUES ('task01', '任务1', '', '', null, '', '', '2019-10-22 16:05:57', 'root', null, '');
INSERT INTO `sim_duty_task` VALUES ('task02', '任务2', '', '', null, '', '', '2019-10-22 16:06:04', 'root', null, '');

-- ----------------------------
-- Table structure for `sim_fault`
-- ----------------------------
DROP TABLE IF EXISTS `sim_fault`;
CREATE TABLE `sim_fault` (
  `fault_id` varchar(36) NOT NULL,
  `device_id` varchar(36) DEFAULT NULL,
  `fault_desc` varchar(500) DEFAULT NULL,
  `fault_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `updator` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`fault_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sim_fault
-- ----------------------------
INSERT INTO `sim_fault` VALUES ('1fe295c710874741bd42e57564adbf05', '', '3333', null, null, '', null, '');
INSERT INTO `sim_fault` VALUES ('fault01', 'dev01', '11', null, null, null, null, null);
INSERT INTO `sim_fault` VALUES ('fault02', 'dev02', '22', null, null, null, null, null);

-- ----------------------------
-- Table structure for `sim_fault_lib`
-- ----------------------------
DROP TABLE IF EXISTS `sim_fault_lib`;
CREATE TABLE `sim_fault_lib` (
  `fault_lib_id` varchar(36) NOT NULL,
  `type_id` varchar(36) DEFAULT NULL,
  `device_name` varchar(100) DEFAULT NULL,
  `fault_name` varchar(100) DEFAULT NULL,
  `fault_content` varchar(500) DEFAULT NULL,
  `fault_plan` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `updator` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`fault_lib_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sim_fault_lib
-- ----------------------------
INSERT INTO `sim_fault_lib` VALUES ('fc33f922a9774054a33eba0f86c5f951', 'pc', '', '1111', '', '', '2019-10-22 15:03:19', 'root', null, '');

-- ----------------------------
-- Table structure for `sim_field`
-- ----------------------------
DROP TABLE IF EXISTS `sim_field`;
CREATE TABLE `sim_field` (
  `field_id` varchar(36) NOT NULL,
  `table_type` varchar(50) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `data_type` varchar(50) DEFAULT NULL,
  `field_type` varchar(50) DEFAULT NULL,
  `field_name` varchar(50) DEFAULT NULL,
  `field_code` varchar(50) DEFAULT NULL,
  `control_type` varchar(50) DEFAULT NULL,
  `default_value` varchar(500) DEFAULT NULL,
  `is_required` bit(1) DEFAULT NULL,
  `is_show` bit(1) DEFAULT NULL,
  `is_extend` bit(1) DEFAULT NULL,
  `cseq` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `updator` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sim_field
-- ----------------------------
INSERT INTO `sim_field` VALUES ('1', '1', '1', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_field` VALUES ('db5eba34539045f9acee6168b8f1c90e', '333', '333', '', '333', '3333', '', '', '', null, null, null, null, '2019-10-21 10:14:55', 'root', null, '');

-- ----------------------------
-- Table structure for `sim_maintenance`
-- ----------------------------
DROP TABLE IF EXISTS `sim_maintenance`;
CREATE TABLE `sim_maintenance` (
  `maintenance_id` varchar(36) NOT NULL,
  `device_id` varchar(36) DEFAULT NULL,
  `maintenance_desc` varchar(500) DEFAULT NULL,
  `maintenance_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `updator` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`maintenance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sim_maintenance
-- ----------------------------
INSERT INTO `sim_maintenance` VALUES ('2e25c1e1f9704cc3b89db2880582ff55', 'dev02', 'maint2', null, '2019-10-21 16:14:51', 'root', null, '');
INSERT INTO `sim_maintenance` VALUES ('c4312361bd85434e98f23cccc20dd497', 'dev01', 'maint11', null, '2019-10-21 16:14:41', 'root', null, '');

-- ----------------------------
-- Table structure for `sim_operate`
-- ----------------------------
DROP TABLE IF EXISTS `sim_operate`;
CREATE TABLE `sim_operate` (
  `operate_id` varchar(36) NOT NULL,
  `device_id` varchar(36) DEFAULT NULL,
  `operate` varchar(500) DEFAULT NULL,
  `operate_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `soft_start_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `deviceId` varchar(255) DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `operateTime` datetime DEFAULT NULL,
  `softStartTime` datetime DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  PRIMARY KEY (`operate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sim_operate
-- ----------------------------
INSERT INTO `sim_operate` VALUES ('00e6773c37054104b2e7b8c1b5a88f6e', 'dev02', 'test', '2019-10-24 14:13:35', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('04cf6975b6704cf1aa0bc15417b2b7ef', 'dev01', 'test', '2019-10-24 14:21:40', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('05b48907095142cbbb502d1f37cbbed9', 'dev02', 'test', '2019-10-24 14:20:15', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('064764a8970940159cd50ee1fc6e9aed', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:19:50', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('072da7bf32dd42c8b92d2b83dfcfc0a2', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:13:40', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('0765611ccf174408858cce0747df88d5', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:19:31', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('0798100df5004ecda79201de160e3c4c', 'dev03', 'test', '2019-10-24 14:20:50', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('07c76ff2e5e5457d900f824b2e6386d5', 'dev06', null, null, null, null, '2019-10-24 14:21:15', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('07d9be9731c64478bbd4b56c0ca6f490', 'dev01', 'test', '2019-10-24 14:21:20', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('07ec68e7a48444d889f5e2022b00ffb4', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:19:50', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('0b18a0f3a572454cbcc11684a6044872', 'dev02', 'test', '2019-10-24 14:20:10', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('0bab33a00c004cd58ae43bf6db7642d8', 'dev06', null, null, null, null, '2019-10-24 14:13:20', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('0c8e2b321be7420e8c21cee68c28a983', 'dev02', 'test', '2019-10-24 14:19:30', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('0ec435b3e6764496b5448961179d5b94', 'dev01', 'test', '2019-10-24 14:13:45', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('0eca81cf9d884cfc95852e98b739e7c2', 'dev03', 'test', '2019-10-24 14:20:05', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('106df8d8a70b4830a349864b11902ab2', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:21:25', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('10bf91d86643431088eab5c908f6b12b', 'dev01', 'test', '2019-10-24 14:19:30', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('123fc25ffd954740a55d65d558b0c314', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:20', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('128b4baaae5a46f9bef795656d3f57be', 'dev02', 'test', '2019-10-24 14:20:35', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('12e797dd911c4deba885e68e32c5986c', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:21:00', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('14281be698c844f2816cfec3f8d91645', 'dev06', null, null, null, null, '2019-10-24 14:19:35', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('14c07391cb6e4c5ab9799d85ed6b7f48', 'dev06', null, null, null, null, '2019-10-24 14:13:25', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('14ecd4d6bcdc462e961749534d040a76', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:35', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('160bb879697046bbb11d2549cf53667b', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:05', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('18ae3062af474963864cb5e2fbb1e4c0', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:10', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('19e6a35af4284984a37f170fde3d0962', 'dev01', 'test', '2019-10-24 14:20:40', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('1a967d4379944f41933d9c1d142c2453', 'dev03', 'test', '2019-10-24 14:19:35', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('1ad038af9c9143bbb87f35a801437c67', 'dev02', 'test', '2019-10-24 14:21:10', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('1c5cf60af3ec4b22a4b9c2b282353374', 'dev03', 'test', '2019-10-24 14:13:35', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('1ca9ee6697bf4639bf24c37024f42a11', 'dev02', 'test', '2019-10-24 14:21:15', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('1cdc0d2e6c034aa8bc051a0726aae8cf', 'dev06', null, null, null, null, '2019-10-24 14:13:40', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('1e5d22c8728a43dd99dcd711c6dff689', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:21:05', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('20dbbf88014b4fc193634f693d2c997d', 'dev06', null, null, null, null, '2019-10-24 14:21:20', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('20f94fc8e4e7498b94377184b597bee2', 'dev03', 'test', '2019-10-24 14:21:20', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('210d80410b79433c8c19a4af52649539', 'dev03', 'test', '2019-10-24 14:20:20', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('2175907921b0499d8455f440f3ef3d20', 'dev03', 'test', '2019-10-24 14:20:35', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('26c1f960fac1499c93017334c96a1c7c', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:19:45', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('27f44d70b4fb45a7a2112b2f361db851', 'dev06', null, null, null, null, '2019-10-24 14:20:55', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('293b4e85efee4623ae11c607af0e0b4f', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:40', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('295e37e541ff48249a14fcdaf7c0628d', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:21:35', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('2ad133ef84b14ac290185147e44b329e', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:21:15', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('2b26f77dcfef4778ab2fb766c4492b69', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:19:35', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('2b655dcc3944420abc6cb92684476e26', 'dev02', 'test', '2019-10-24 14:20:40', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('2d6f77bc39374cba966e916afae986b0', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:21:10', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('2efe0fee2e81427a9259e553523c7ac4', 'dev03', 'test', '2019-10-24 14:13:50', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('32281727754147d9b78f941743a288b7', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:19:31', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('323b2f5cf5bc40b9b596e50311724c85', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:21:05', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('358ad38d97f945518b7057fc5042480a', 'dev01', 'test', '2019-10-24 14:21:10', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('37100fbde50d41ea9ae6a240f9739c2c', 'dev01', 'test', '2019-10-24 14:13:50', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('3724a5302062471d85cd5a7a3ac7b26d', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:21:40', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('3855bdc85f0e476abc528d1720a9b64f', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:15', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('39cf01a5b44248c3936cec58fa7315c0', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:20', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('3a27586644c848f394413afc61e34e0e', 'dev01', 'test', '2019-10-24 14:21:05', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('3a8d1298d2de465ba53d4bc3d7d1050c', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:30', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('3aa43fe151924095803e7336612e95d8', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:19:45', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('3aa546a2b95b4bc6a2bb88e0d11e685e', 'dev01', 'test', '2019-10-24 14:21:25', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('3af448871d6c423ea9d9e94ffea366f2', 'dev03', 'test', '2019-10-24 14:20:30', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('3c8bd346743f439999294b26f6aeab7f', 'dev03', 'test', '2019-10-24 14:13:40', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('3deebe8202fe4de285095b8a88d00bb5', 'dev03', 'test', '2019-10-24 14:21:40', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('3e19c3c3a2e7475c959ac3af131946a1', 'dev03', 'test', '2019-10-24 14:21:00', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('3f39f0414fdb467b8ac8f0f20ac7e491', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:21:00', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('404629f4aecf45e9ac372e07fc9edc11', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:13:45', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('436f44ae826d46e2904bebbb5d40c8ee', 'dev03', 'test', '2019-10-24 14:21:05', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('46ae08e4176e4a0cace6a6736a9a3248', 'dev01', 'test', '2019-10-24 14:19:50', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('484d863b226b49b1b7d3bbf545a704e5', 'dev02', 'test', '2019-10-24 14:21:40', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('48b6553326a84551bcac2b5c8f7bc8eb', 'dev02', 'test', '2019-10-24 14:19:40', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('498e21468c2f4cb7821f6f1b144086f6', 'dev01', 'test', '2019-10-24 14:20:00', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('4b92fd8c65b84e3cb0eb4b05dd10ff81', 'dev02', 'test', '2019-10-24 14:13:25', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('4bdfc8b4ea8444a6acdb3ff44a57ea1b', 'dev03', 'test', '2019-10-24 14:21:30', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('4c8b60fc507b4ca58db3ca18ffae7f65', 'dev01', 'test', '2019-10-24 14:21:35', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('4e2bde34b951448cb5d8af9a6a0673f8', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:40', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('4e6ffd06067344eeb3ccf9a323e905bd', 'dev03', 'test', '2019-10-24 14:13:45', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('4f44a1aff5394be999b0f65ac97f70bb', 'dev06', null, null, null, null, '2019-10-24 14:19:50', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('5243897a6036448abd505c794f444449', 'dev01', 'test', '2019-10-24 14:20:20', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('52c8d3de75894f71b6bdb7f1405b9804', 'dev02', 'test', '2019-10-24 14:19:55', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('52fb4eeee4084941961502dfcaf43f4d', 'dev06', null, null, null, null, '2019-10-24 14:20:45', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('539054c0954e4de8a606cc9951b75466', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:21:40', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('53f01ef0c19a49239548a0142a3877b5', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:21:25', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('54dee31f7c68492e989294e6679cb2e6', 'dev02', 'test', '2019-10-24 14:19:35', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('555c63d23c2f4602841af60d529e2d1f', 'dev01', 'test', '2019-10-24 14:21:30', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('55bfee10120b47b694e7e9580467d650', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:19:55', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('5635a2d4f67948caa4cfa99ed0c7ea69', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:13:20', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('56e28024b3f044edab63b2728346be6b', 'dev03', 'test', '2019-10-24 14:20:10', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('57807b86034a4a4c8c279c99085c5a6f', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:19:40', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('594ae085e5744fc1a021cf785ebc838a', 'dev06', null, null, null, null, '2019-10-24 14:19:55', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('5a7dc31762094d1ab572bec2e4b32ed2', 'dev06', null, null, null, null, '2019-10-24 14:13:35', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('5ac1b117c1594c01a658debe1e87cb89', 'dev06', null, null, null, null, '2019-10-24 14:19:40', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('5d51711d31804261bc8957da4009ef4c', 'dev06', null, null, null, null, '2019-10-24 14:20:20', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('5e62ca90702e4a0a9b4facfa0302a8ed', 'dev03', 'test', '2019-10-24 14:20:45', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('5ec22be7a0174e3394f8cd0894d902d2', 'dev06', null, null, null, null, '2019-10-24 14:13:50', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('5f58d3996a17459f9a22927e5a80f09f', 'dev06', null, null, null, null, '2019-10-24 14:20:15', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('64556cedb11149749e77dad17c984eaa', 'dev01', 'test', '2019-10-24 14:13:30', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('655336f7f2f74f478d02c0de064075e6', 'dev06', null, null, null, null, '2019-10-24 14:13:30', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('65714dffea684010aed27d9307513e3d', 'dev01', 'test', '2019-10-24 14:20:35', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('663c485deea6439f9ee4507537ae3c44', 'dev01', 'test', '2019-10-24 14:13:40', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('6baa61b05e024b1b8e923d78f8011c44', 'dev01', 'test', '2019-10-24 14:20:45', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('6cc6c1e4988e4dd1929a40a1b71a48f1', 'dev02', 'test', '2019-10-24 14:20:55', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('6ecd418d2cc444d5bf6440b23e58c2fc', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:13:50', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('716d340a24fe47688c2add8d229f4fdc', 'dev03', 'test', '2019-10-24 14:13:30', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('71ea081ae4b54a409929fa272aaccc3c', 'dev03', 'test', '2019-10-24 14:19:40', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('722d04e2a59f4575b444261850b680f1', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:13:25', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('72ae2583fdeb48f3ae41ddf98b17e5cd', 'dev03', 'test', '2019-10-24 14:20:40', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('74017d1449f44ec0ad5ca56d38b4349b', 'dev02', 'test', '2019-10-24 14:20:50', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('7412973539d14dab9b10309ae90e76cc', 'dev02', 'test', '2019-10-24 14:21:20', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('748601c02d294d30a06f6ee12b0f1365', 'dev06', null, null, null, null, '2019-10-24 14:21:05', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('74951c11592f4ceea46e335217cf9262', 'dev06', null, null, null, null, '2019-10-24 14:21:35', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('74f7c5ec1915412d879dd6611ddee780', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:13:25', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('765fe323b32b48fd9a5ca4df11ccb724', 'dev06', null, null, null, null, '2019-10-24 14:13:45', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('7714f6c2f150411c9c00183ae8f4e394', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:19:55', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('7771c1d21aba429b97e8d83d08058d5b', 'dev01', 'test', '2019-10-24 14:19:35', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('77b61d8ca64b45baa036f7e59ddbfc2f', 'dev03', 'test', '2019-10-24 14:21:15', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('795183d13cc14f7ba53de49f62752ae7', 'dev06', null, null, null, null, '2019-10-24 14:21:30', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('795c7a466b06442c91802d5086402224', 'dev01', 'test', '2019-10-24 14:20:30', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('79e7cb94a1c04baaacce560231148d17', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:15', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('800ca8adda4b41d998f7775704e2c93c', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:45', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('821973172e7b472a8147ffb109b8eb48', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:13:35', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('8649cf21c1874cba8870bb75b6bb764f', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:45', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('88434abaf58040f3950dd85d4772e85c', 'dev06', null, null, null, null, '2019-10-24 14:21:40', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('88bc665401b14ead8f8ef32224459bd0', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:55', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('88e387f79cd44259b42cb04f190fad2c', 'dev06', null, null, null, null, '2019-10-24 14:20:05', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('895c5baca3474cf6b4a27e99d51759b1', 'dev02', 'test', '2019-10-24 14:19:45', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('8a37e09d3256467689c6585c40fa8907', 'dev01', 'test', '2019-10-24 14:20:05', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('8a545cbde48d4fc88dab8364416d4a93', 'dev03', 'test', '2019-10-24 14:13:20', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('8be6765c094745278633a3c92b6fcf55', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:00', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('8fc25ae3527b4102aab076e6909057ff', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:50', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('905d956533514f8db6d5ff03f1611a91', 'dev06', null, null, null, null, '2019-10-24 14:21:10', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('915a90d5582b40d5abbc3f3f7b739eaf', 'dev06', null, null, null, null, '2019-10-24 14:21:00', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('93bd0f0077c9480d8c2a6613c750caca', 'dev03', 'test', '2019-10-24 14:21:35', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('94293b860e5445419f3b12eead4e4638', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:21:15', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('943f52a056924d5d8857e2657d15459f', 'dev01', 'test', '2019-10-24 14:13:35', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('97625689eef44c11915b614cc0cf8cca', 'dev01', 'test', '2019-10-24 14:13:20', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('9762e3e9b18d4035a55b9bec37161aa8', 'dev06', null, null, null, null, '2019-10-24 14:19:45', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('97cfec7e1ad94d9fa11ce1d711cde017', 'dev06', null, null, null, null, '2019-10-24 14:20:35', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('9c1146d4c45642778144e5772670bc51', 'dev02', 'test', '2019-10-24 14:20:05', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('9df9fe271ed948d3a69a132124f3d839', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:21:20', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('9fce77fc15994badad81b96a18392fc1', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:35', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('a07d3f6b41d3430c93005533acae472a', 'dev02', 'test', '2019-10-24 14:21:35', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('a0f8b31d7c444ce2a69b5fcfd7f6ad75', 'dev03', 'test', '2019-10-24 14:20:15', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('a1a3f5dc162f4a87b7b668d2e04958ba', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:25', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('a30a90113e494e9caab10625ec9e5052', 'dev01', 'test', '2019-10-24 14:21:00', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('a3b679a7571f41948e36c16834d2e9cb', 'dev06', null, null, null, null, '2019-10-24 14:20:00', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('a4d55aafd7e74813aaa5b51fe4084937', 'dev03', 'test', '2019-10-24 14:19:45', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('a5a8e543ae91485f85e61be7dd1e70de', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:13:40', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('a604b7d05be049559e598989f0b4b0c3', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:13:45', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('a622197f51ce48f69e0d9a2c190eb260', 'dev02', 'test', '2019-10-24 14:13:45', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('a8e6763979c4466f85360004827b2244', 'dev06', null, null, null, null, '2019-10-24 14:20:10', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('ac6dc9f8783147468475d8abcfaa8818', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:05', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('ac926b7116c64423a43fab86c4e6c457', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:13:30', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('ad7a87b3396743cc9b34f31e31c5a8d8', 'dev01', 'test', '2019-10-24 14:13:25', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('aea2901f77ec4d10ab34116acdbb382b', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:10', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('aef84f2b7e2e426696455163bdb3dfd7', 'dev01', 'test', '2019-10-24 14:20:10', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('af5055b95a9040fe99720f242ded2880', 'dev03', 'test', '2019-10-24 14:19:50', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('b0077ce930a24b60a0b00b7a13ac12d9', 'dev01', 'test', '2019-10-24 14:20:15', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('b23ef2bcf56a4251a886057f89bc0c16', 'dev01', 'test', '2019-10-24 14:20:25', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('b25398906550483fbe2ea57359d153f4', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:21:20', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('b3d4527f043948489c282213fb3aa8c1', 'dev02', 'test', '2019-10-24 14:20:25', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('b5ee49503e614861b3a232c8002ade0c', 'dev01', 'test', '2019-10-24 14:21:15', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('b6b9523fbc064bf889e57be4c138ea5a', 'dev03', 'test', '2019-10-24 14:19:55', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('b7d58a3868254b8582f7bdb04a629ca6', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:50', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('b9b4c0710597470ebcfae4d505216dfa', 'dev03', 'test', '2019-10-24 14:21:10', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('bb79e7c0d1c4403fb4b0ce5aef7dbfc9', 'dev01', 'test', '2019-10-24 14:19:45', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('bc43f84cc7904825839c4616b6ece3d2', 'dev03', 'test', '2019-10-24 14:20:25', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('bcded9cd41704d2ca18c116dffd511f2', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:21:35', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('bdb446f598c84b7781c575bbd834d99d', 'dev02', 'test', '2019-10-24 14:13:40', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('c001763be5b3436bb05636fce4fd182d', 'dev06', null, null, null, null, '2019-10-24 14:20:25', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('c0cf6498bebe46b8961a24b357f9dc7a', 'dev01', 'test', '2019-10-24 14:19:55', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('c0f5e14c2c24445c95e9c4a8b297a113', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:13:50', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('c3258ee60bd547b89242ecd8667deece', 'dev06', null, null, null, null, '2019-10-24 14:19:31', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('c57ee9fbe6974f9296c8984295652f37', 'dev02', 'test', '2019-10-24 14:20:00', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('cb9b25b0baca4aee8f8029f6a0370782', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:21:30', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('cd439f12a9404f8ebb755424879032ca', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:25', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('cd8156fd1f744491a56462c8693fed39', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:21:10', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('d0e5f9a571664b3ea49ed5123fcee353', 'dev02', 'test', '2019-10-24 14:20:45', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('d56881892caf4c69974a8cf53aa24614', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:19:35', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('d5d58adc7e8640d8a275923afb515ef1', 'dev03', 'test', '2019-10-24 14:21:25', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('d6b27412865748909a6595e23827547f', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:13:30', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('d722dfd05b31441ca6b0739c6b72786c', 'dev06', null, null, null, null, '2019-10-24 14:21:25', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('d7c99d08ec2d473d8ab53363e160a0e4', 'dev06', null, null, null, null, '2019-10-24 14:20:40', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('da0858cf9edf4ad680427aab35c95f0d', 'dev03', 'test', '2019-10-24 14:20:55', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('da1e721ef05847c483846211d4cb31da', 'dev03', 'test', '2019-10-24 14:19:30', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('da5e6db6c2e94ea99dc7cd39a6c00033', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:13:35', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('dbe54fe8cae54ce0a46e800a8d15552e', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:30', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('dff54270d51d4d71937e6a3f1c9cbe97', 'dev02', 'test', '2019-10-24 14:20:30', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('e11597b950504474ba2341dfe669e1d0', 'dev02', 'test', '2019-10-24 14:21:30', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('e5a6cc3ea806481fa66d281a5b0e13b3', 'dev03', 'test', '2019-10-24 14:13:25', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('e5d4fd3d964342e6bfb0fd396cf78b38', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:13:20', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('ed9a4f2eb20c4c1d82db52aa8c450f04', 'dev02', 'test', '2019-10-24 14:21:05', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('ef1a0a4c49594e358356e13bd6cec025', 'dev06', null, null, null, null, '2019-10-24 14:20:50', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('ef4f9d99ec824b5aa841586c45068f85', 'dev02', 'test', '2019-10-24 14:19:50', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('f0938a7226ed43b0a977d200c2bba141', 'dev02', 'test', '2019-10-24 14:13:20', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('f11e41bdc8884f719c3f07b44672c960', 'dev02', 'test', '2019-10-24 14:13:30', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('f2eb84d81c2b4a4ba3ab4eb9b3fd595f', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:00', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('f41f2013e9444c42806ac0655c9e43f5', 'dev01', 'test', '2019-10-24 14:19:40', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('f422900dbda94012810c936a412fecb9', 'dev02', 'test', '2019-10-24 14:21:00', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('f47204f78d384a74bd80ead25b130e10', 'dev01', 'test', '2019-10-24 14:20:55', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('f5a2807ed5af439c9168b2b4bd894f0d', 'dev05', null, null, '2019-10-16 13:35:23', '2019-10-24 14:19:40', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('f5c0bb9b967c4151ba502ed796121d6f', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:20:55', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('f5c8e8c2368c4ebd8655036a16568cf9', 'dev03', 'test', '2019-10-24 14:20:00', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('f713db0a19a942c1ac869dc8781cd6f6', 'dev06', null, null, null, null, '2019-10-24 14:20:30', null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('f79462d544984f7c9032a8e97c5e0cd6', 'dev02', 'test', '2019-10-24 14:20:20', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('f9e0677272c742198e0f13a666d77e3b', 'dev01', 'test', '2019-10-24 14:20:50', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('fcfca4714595405bbab1fd1ee09af4ff', 'dev02', 'test', '2019-10-24 14:13:50', null, null, null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('fe2bc04ea0624ec58f21e46f9577f411', 'dev04', null, null, '2019-10-16 13:35:23', '2019-10-24 14:21:30', null, null, null, null, null, null, null);
INSERT INTO `sim_operate` VALUES ('ff0147515c484b8bbd61e73f1132842c', 'dev02', 'test', '2019-10-24 14:21:25', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `sim_repair`
-- ----------------------------
DROP TABLE IF EXISTS `sim_repair`;
CREATE TABLE `sim_repair` (
  `repair_id` varchar(36) NOT NULL,
  `fault_id` varchar(36) DEFAULT NULL,
  `repair_desc` varchar(500) DEFAULT NULL,
  `repair_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `updator` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`repair_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sim_repair
-- ----------------------------
INSERT INTO `sim_repair` VALUES ('c293d6ff9c4346349caad2898841f53d', 'fault02', '22', null, '2019-10-21 16:02:21', 'root', null, '');
INSERT INTO `sim_repair` VALUES ('fd92bea6eba7496fb25e21f396e640f9', 'fault01', '11', null, '2019-10-21 15:58:31', 'root', null, '');

-- ----------------------------
-- Table structure for `sim_simulator`
-- ----------------------------
DROP TABLE IF EXISTS `sim_simulator`;
CREATE TABLE `sim_simulator` (
  `simulator_id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `cseq` int(11) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `isopen` bit(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `updator` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`simulator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sim_simulator
-- ----------------------------
INSERT INTO `sim_simulator` VALUES ('001', '0', 'xx训练模拟器', null, null, null, '2019-10-21 14:20:10', 'admin', null, '');
INSERT INTO `sim_simulator` VALUES ('001001', '001', '环控分系统', null, null, null, '2019-10-21 14:20:30', 'admin', null, '');
INSERT INTO `sim_simulator` VALUES ('001001001', '001001', '截止阀', null, null, null, '2019-10-21 14:20:44', 'root', null, '');
INSERT INTO `sim_simulator` VALUES ('001001002', '001001', '组件a', null, null, null, '2019-10-21 14:20:53', 'root', null, '');

-- ----------------------------
-- Table structure for `sim_threshold`
-- ----------------------------
DROP TABLE IF EXISTS `sim_threshold`;
CREATE TABLE `sim_threshold` (
  `threshold_id` varchar(36) NOT NULL,
  `type_id` varchar(36) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `field_code` varchar(50) DEFAULT NULL,
  `upper_limit` decimal(5,2) DEFAULT NULL,
  `lower_limit` decimal(5,2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `updator` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`threshold_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sim_threshold
-- ----------------------------
INSERT INTO `sim_threshold` VALUES ('30e6b4b7436a4e59bf7120076c1df9b0', 'pc', '11', '', '11.00', '11.00', null, '', null, '');
INSERT INTO `sim_threshold` VALUES ('7399fcf0af7540a989608203fab624ec', 'GNC', 'GNC', '', null, null, null, '', null, '');

-- ----------------------------
-- Table structure for `sim_type`
-- ----------------------------
DROP TABLE IF EXISTS `sim_type`;
CREATE TABLE `sim_type` (
  `type_id` varchar(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `cseq` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `updator` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sim_type
-- ----------------------------
INSERT INTO `sim_type` VALUES ('GNC', 'GNC分系统类产品', null, '2019-10-21 17:40:07', 'admin', null, null);
INSERT INTO `sim_type` VALUES ('huankong', '环控分系统类产品', null, '2019-10-21 17:35:35', 'admin', null, null);
INSERT INTO `sim_type` VALUES ('pc', '辅助支持类计算机', null, '2019-10-21 17:40:10', 'admin', null, null);
INSERT INTO `sim_type` VALUES ('soft', '软件系统类产品', null, '2019-10-21 17:40:12', 'admin', null, null);
INSERT INTO `sim_type` VALUES ('touyingyi', '辅助支持类计算机', null, '2019-10-23 08:31:21', 'admin', null, null);
INSERT INTO `sim_type` VALUES ('yibiao', '仪表分系统类产品', null, '2019-10-21 17:35:25', 'admin', null, null);

-- ----------------------------
-- Table structure for `sim_type_field`
-- ----------------------------
DROP TABLE IF EXISTS `sim_type_field`;
CREATE TABLE `sim_type_field` (
  `type_field_id` varchar(36) NOT NULL,
  `field_id` varchar(36) DEFAULT NULL,
  `type_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`type_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sim_type_field
-- ----------------------------
INSERT INTO `sim_type_field` VALUES ('7c0e04d4a84c40b9a37f21e849a88894', '111', 'pc');
INSERT INTO `sim_type_field` VALUES ('e06c44ec8b3c429188a6340d05eb4600', '22', 'pc');

-- ----------------------------
-- Table structure for `sys_area`
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `area_id` varchar(9) NOT NULL,
  `nid` int(3) DEFAULT NULL,
  `parent_id` varchar(9) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `nick` varchar(100) DEFAULT NULL,
  `sons` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`area_id`),
  KEY `FK_Relationship_7` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('001', '1', '0', '北京', null, null, '北京', null);
INSERT INTO `sys_area` VALUES ('001001', '101', '001', '东城区', '116.4600000', '39.9200000', '东城', null);
INSERT INTO `sys_area` VALUES ('001002', '102', '001', '西城区', '116.4600000', '39.9200000', '西城', null);
INSERT INTO `sys_area` VALUES ('001003', '103', '001', '崇文区', '116.4600000', '39.9200000', '崇文', null);
INSERT INTO `sys_area` VALUES ('001004', '104', '001', '宣武区', '116.4600000', '39.9200000', '宣武', null);
INSERT INTO `sys_area` VALUES ('001005', '105', '001', '朝阳区', '116.4600000', '39.9200000', '朝阳区', null);
INSERT INTO `sys_area` VALUES ('001006', '106', '001', '丰台区', '116.4600000', '39.9200000', '丰台', null);
INSERT INTO `sys_area` VALUES ('001007', '107', '001', '石景山区', '116.4600000', '39.9200000', '石景山', null);
INSERT INTO `sys_area` VALUES ('001008', '108', '001', '海淀区', '116.4600000', '39.9200000', '海淀', null);
INSERT INTO `sys_area` VALUES ('001009', '109', '001', '门头沟区', '116.4600000', '39.9200000', '门头沟', null);
INSERT INTO `sys_area` VALUES ('001010', '110', '001', '房山区', '115.9800000', '39.7200000', '房山', null);
INSERT INTO `sys_area` VALUES ('001011', '111', '001', '通州区', '116.4600000', '39.9200000', '通州', null);
INSERT INTO `sys_area` VALUES ('001012', '112', '001', '顺义区', '116.6500000', '40.1300000', '顺义', null);
INSERT INTO `sys_area` VALUES ('001013', '113', '001', '昌平区', '116.2000000', '40.2200000', '昌平', null);
INSERT INTO `sys_area` VALUES ('001014', '114', '001', '大兴区', '116.3300000', '39.7300000', '大兴', null);
INSERT INTO `sys_area` VALUES ('001015', '115', '001', '平谷区', '117.1000000', '40.1300000', '平谷', null);
INSERT INTO `sys_area` VALUES ('001016', '116', '001', '怀柔区', '116.6200000', '40.3200000', '怀柔', null);
INSERT INTO `sys_area` VALUES ('001017', '117', '001', '密云县', '116.8500000', '40.3700000', '密云', null);
INSERT INTO `sys_area` VALUES ('001018', '118', '001', '延庆县', '115.9700000', '40.4700000', '延庆', null);
INSERT INTO `sys_area` VALUES ('001019', '119', '001', '北京周边', '115.9700000', '40.4700000', '北京周边', null);
INSERT INTO `sys_area` VALUES ('002', '2', '0', '天津', null, null, '天津', null);
INSERT INTO `sys_area` VALUES ('002001', '120', '002', '和平区', '117.2000000', '39.1300000', '和平', null);
INSERT INTO `sys_area` VALUES ('002002', '121', '002', '河东区', '117.2000000', '39.1300000', '河东', null);
INSERT INTO `sys_area` VALUES ('002003', '122', '002', '河西区', '117.2000000', '39.1300000', '河西', null);
INSERT INTO `sys_area` VALUES ('002004', '123', '002', '南开区', '117.2000000', '39.1300000', '南开', null);
INSERT INTO `sys_area` VALUES ('002005', '124', '002', '河北区', '117.2000000', '39.1300000', '河北区', null);
INSERT INTO `sys_area` VALUES ('002006', '125', '002', '红桥区', '117.2000000', '39.1300000', '红桥', null);
INSERT INTO `sys_area` VALUES ('002007', '126', '002', '塘沽区', '117.2000000', '39.1300000', '塘沽', null);
INSERT INTO `sys_area` VALUES ('002008', '127', '002', '汉沽区', '117.2000000', '39.1300000', '汉沽', null);
INSERT INTO `sys_area` VALUES ('002009', '128', '002', '大港区', '117.2000000', '39.1300000', '大港', null);
INSERT INTO `sys_area` VALUES ('002010', '129', '002', '东丽区', '117.2000000', '39.1300000', '东丽', null);
INSERT INTO `sys_area` VALUES ('002011', '130', '002', '西青区', '117.2000000', '39.1300000', '西青', null);
INSERT INTO `sys_area` VALUES ('002012', '131', '002', '津南区', '117.2000000', '39.1300000', '津南', null);
INSERT INTO `sys_area` VALUES ('002013', '132', '002', '北辰区', '117.2000000', '39.1300000', '北辰', null);
INSERT INTO `sys_area` VALUES ('002014', '133', '002', '武清区', '117.0500000', '39.4000000', '武清', null);
INSERT INTO `sys_area` VALUES ('002015', '134', '002', '宝坻区', '117.3000000', '39.7500000', '宝坻', null);
INSERT INTO `sys_area` VALUES ('002016', '135', '002', '宁河县', '117.8300000', '39.3300000', '宁河', null);
INSERT INTO `sys_area` VALUES ('002017', '136', '002', '静海县', '116.9200000', '38.9300000', '静海', null);
INSERT INTO `sys_area` VALUES ('002018', '137', '002', '蓟县', '117.4000000', '40.0500000', '蓟县', null);
INSERT INTO `sys_area` VALUES ('003', '3', '0', '河北', null, null, '河北', null);
INSERT INTO `sys_area` VALUES ('003001', '138', '003', '石家庄市', '114.4800000', '38.0300000', '石家庄', null);
INSERT INTO `sys_area` VALUES ('003002', '139', '003', '唐山市', '114.4800000', '38.0300000', '唐山', null);
INSERT INTO `sys_area` VALUES ('003003', '140', '003', '秦皇岛市', '114.4800000', '38.0300000', '秦皇岛', null);
INSERT INTO `sys_area` VALUES ('003004', '141', '003', '邯郸市', '114.4800000', '38.0300000', '邯郸', null);
INSERT INTO `sys_area` VALUES ('003005', '142', '003', '邢台市', '114.4800000', '38.0300000', '邢台', null);
INSERT INTO `sys_area` VALUES ('003006', '143', '003', '保定市', '115.4500000', '38.9500000', '保定', '竞秀,莲池,满城,清苑,徐水,涞水,阜平,定兴,唐县,高阳,容城,涞源,望都,安新,易县,曲阳,蠡县,顺平,博野,雄县,安国,高碑店,涿州,定州');
INSERT INTO `sys_area` VALUES ('003007', '144', '003', '张家口市', '114.4800000', '38.0300000', '张家口', null);
INSERT INTO `sys_area` VALUES ('003008', '163', '003', '承德市', '114.4800000', '38.0300000', '承德', null);
INSERT INTO `sys_area` VALUES ('003009', '164', '003', '沧州市', '114.4800000', '38.0300000', '沧州', '沧县,青县,东光,海兴,盐山,肃宁,南皮,吴桥,献县,孟村,泊头,黄骅,河间,任丘');
INSERT INTO `sys_area` VALUES ('003010', '165', '003', '廊坊市', '116.6900000', '39.5200000', '廊坊', '固安,永清,香河,大城,文安,大厂,霸州,三河');
INSERT INTO `sys_area` VALUES ('003011', '166', '003', '衡水市', '114.4800000', '38.0300000', '衡水', '桃城,冀州,枣强,武邑,武强,饶阳,安平,故城,阜城,深州,景县');
INSERT INTO `sys_area` VALUES ('004', '4', '0', '山西', null, null, '山西', null);
INSERT INTO `sys_area` VALUES ('004001', '167', '004', '太原市', '112.5300000', '37.8700000', '太原', '清徐,阳曲,娄烦,古交');
INSERT INTO `sys_area` VALUES ('004002', '168', '004', '大同市', '112.5300000', '37.8700000', '大同', null);
INSERT INTO `sys_area` VALUES ('004003', '169', '004', '阳泉市', '113.6200000', '37.7900000', '阳泉', null);
INSERT INTO `sys_area` VALUES ('004004', '170', '004', '长治市', '113.0800000', '36.1800000', '长治', null);
INSERT INTO `sys_area` VALUES ('004005', '171', '004', '晋城市', '112.1500000', '35.6700000', '晋城', null);
INSERT INTO `sys_area` VALUES ('004006', '172', '004', '朔州市', '112.5300000', '37.8700000', '朔州', null);
INSERT INTO `sys_area` VALUES ('004007', '173', '004', '晋中市', '112.7200000', '37.6800000', '晋中', null);
INSERT INTO `sys_area` VALUES ('004008', '174', '004', '运城市', '110.9700000', '35.0300000', '运城', null);
INSERT INTO `sys_area` VALUES ('004009', '214', '004', '忻州市', '112.5300000', '37.8700000', '忻州', null);
INSERT INTO `sys_area` VALUES ('004010', '215', '004', '临汾市', '111.5000000', '36.0800000', '临汾', null);
INSERT INTO `sys_area` VALUES ('004011', '216', '004', '吕梁市', '111.1300000', '37.5300000', '吕梁', null);
INSERT INTO `sys_area` VALUES ('005', '5', '0', '内蒙古', null, null, '内蒙古', null);
INSERT INTO `sys_area` VALUES ('005001', '217', '005', '呼和浩特市', '111.6500000', '40.8200000', '呼和浩特', null);
INSERT INTO `sys_area` VALUES ('005002', '218', '005', '包头市', '111.6500000', '40.8200000', '包头', null);
INSERT INTO `sys_area` VALUES ('005003', '219', '005', '乌海市', '111.6500000', '40.8200000', '乌海', null);
INSERT INTO `sys_area` VALUES ('005004', '220', '005', '赤峰市', '111.6500000', '40.8200000', '赤峰', null);
INSERT INTO `sys_area` VALUES ('005005', '221', '005', '通辽市', '111.6500000', '40.8200000', '通辽', null);
INSERT INTO `sys_area` VALUES ('005006', '222', '005', '鄂尔多斯市', '109.7960000', '39.6150000', '鄂尔多斯', null);
INSERT INTO `sys_area` VALUES ('005007', '223', '005', '呼伦贝尔市', '119.7300000', '29.2200000', '呼伦贝尔', null);
INSERT INTO `sys_area` VALUES ('005008', '224', '005', '巴彦淖尔市', '107.3915000', '40.7500000', '巴彦淖尔', null);
INSERT INTO `sys_area` VALUES ('005009', '225', '005', '乌兰察布市', '113.1340000', '41.0038000', '乌兰察布', null);
INSERT INTO `sys_area` VALUES ('005010', '226', '005', '兴安盟', '122.0800000', '46.0700000', '兴安', null);
INSERT INTO `sys_area` VALUES ('005011', '227', '005', '锡林郭勒盟', '111.9600000', '43.6500000', '锡林郭勒', null);
INSERT INTO `sys_area` VALUES ('005012', '228', '005', '阿拉善盟', '105.6800000', '38.8500000', '阿拉善', null);
INSERT INTO `sys_area` VALUES ('006', '6', '0', '辽宁', null, null, '辽宁', null);
INSERT INTO `sys_area` VALUES ('006001', '229', '006', '沈阳市', '123.3800000', '41.8000000', '沈阳', null);
INSERT INTO `sys_area` VALUES ('006002', '230', '006', '大连市', '123.3800000', '41.8000000', '大连', null);
INSERT INTO `sys_area` VALUES ('006003', '231', '006', '鞍山市', '123.3800000', '41.8000000', '鞍山', null);
INSERT INTO `sys_area` VALUES ('006004', '232', '006', '抚顺市', '123.3800000', '41.8000000', '抚顺', null);
INSERT INTO `sys_area` VALUES ('006005', '233', '006', '本溪市', '123.3800000', '41.8000000', '本溪', null);
INSERT INTO `sys_area` VALUES ('006006', '234', '006', '丹东市', '123.3800000', '41.8000000', '丹东', null);
INSERT INTO `sys_area` VALUES ('006007', '235', '006', '锦州市', '123.3800000', '41.8000000', '锦州', null);
INSERT INTO `sys_area` VALUES ('006008', '236', '006', '营口市', '123.3800000', '41.8000000', '营口', null);
INSERT INTO `sys_area` VALUES ('006009', '237', '006', '阜新市', '123.3800000', '41.8000000', '阜新', null);
INSERT INTO `sys_area` VALUES ('006010', '238', '006', '辽阳市', '123.3800000', '41.8000000', '辽阳', null);
INSERT INTO `sys_area` VALUES ('006011', '239', '006', '盘锦市', '123.3800000', '41.8000000', '盘锦', null);
INSERT INTO `sys_area` VALUES ('006012', '240', '006', '铁岭市', '123.3800000', '41.8000000', '铁岭', null);
INSERT INTO `sys_area` VALUES ('006013', '241', '006', '朝阳市', '123.3800000', '41.8000000', '朝阳', null);
INSERT INTO `sys_area` VALUES ('006014', '242', '006', '葫芦岛市', '123.3800000', '41.8000000', '葫芦岛', null);
INSERT INTO `sys_area` VALUES ('007', '7', '0', '吉林', null, null, '吉林', null);
INSERT INTO `sys_area` VALUES ('007001', '243', '007', '长春市', '125.3500000', '43.8800000', '长春', null);
INSERT INTO `sys_area` VALUES ('007002', '244', '007', '吉林市', '125.3500000', '43.8800000', '吉林', null);
INSERT INTO `sys_area` VALUES ('007003', '245', '007', '四平市', '125.3500000', '43.8800000', '四平', null);
INSERT INTO `sys_area` VALUES ('007004', '246', '007', '辽源市', '125.3500000', '43.8800000', '辽源', null);
INSERT INTO `sys_area` VALUES ('007005', '247', '007', '通化市', '125.3500000', '43.8800000', '通化', null);
INSERT INTO `sys_area` VALUES ('007006', '248', '007', '白山市', '125.3500000', '43.8800000', '白山', null);
INSERT INTO `sys_area` VALUES ('007007', '249', '007', '松原市', '125.3500000', '43.8800000', '松原', null);
INSERT INTO `sys_area` VALUES ('007008', '250', '007', '白城市', '125.3500000', '43.8800000', '白城', null);
INSERT INTO `sys_area` VALUES ('007009', '251', '007', '延边', '129.5200000', '42.9300000', '延边', null);
INSERT INTO `sys_area` VALUES ('008', '8', '0', '黑龙江', null, null, '黑龙江', null);
INSERT INTO `sys_area` VALUES ('008001', '252', '008', '哈尔滨市', '126.6300000', '45.7500000', '哈尔滨', null);
INSERT INTO `sys_area` VALUES ('008002', '253', '008', '齐齐哈尔市', '126.6300000', '45.7500000', '齐齐哈尔', null);
INSERT INTO `sys_area` VALUES ('008003', '254', '008', '鸡西市', '126.6300000', '45.7500000', '鸡西', null);
INSERT INTO `sys_area` VALUES ('008004', '255', '008', '鹤岗市', '126.6300000', '45.7500000', '鹤岗', null);
INSERT INTO `sys_area` VALUES ('008005', '256', '008', '双鸭山市', '126.6300000', '45.7500000', '双鸭山', null);
INSERT INTO `sys_area` VALUES ('008006', '257', '008', '大庆市', '126.6300000', '45.7500000', '大庆', null);
INSERT INTO `sys_area` VALUES ('008007', '258', '008', '伊春市', '128.9200000', '47.7300000', '伊春', null);
INSERT INTO `sys_area` VALUES ('008008', '259', '008', '佳木斯市', '126.6300000', '45.7500000', '佳木斯', null);
INSERT INTO `sys_area` VALUES ('008009', '260', '008', '七台河市', '126.6300000', '45.7500000', '七台河', null);
INSERT INTO `sys_area` VALUES ('008010', '261', '008', '牡丹江市', '126.6300000', '45.7500000', '牡丹江', null);
INSERT INTO `sys_area` VALUES ('008011', '262', '008', '黑河市', '127.5300000', '50.2200000', '黑河', null);
INSERT INTO `sys_area` VALUES ('008012', '263', '008', '绥化市', '126.6300000', '45.7500000', '绥化', null);
INSERT INTO `sys_area` VALUES ('008013', '264', '008', '大兴安岭', '126.6000000', '51.7200000', '大兴安岭', null);
INSERT INTO `sys_area` VALUES ('009', '9', '0', '上海', null, null, '上海', null);
INSERT INTO `sys_area` VALUES ('009001', '145', '009', '徐汇区', '121.4800000', '31.2200000', '徐汇', null);
INSERT INTO `sys_area` VALUES ('009002', '146', '009', '黄浦区', '121.4800000', '31.2200000', '黄浦', null);
INSERT INTO `sys_area` VALUES ('009003', '147', '009', '杨浦区', '121.4800000', '31.2200000', '杨浦', null);
INSERT INTO `sys_area` VALUES ('009004', '148', '009', '虹口区', '121.4800000', '31.2200000', '虹口', null);
INSERT INTO `sys_area` VALUES ('009005', '149', '009', '闵行区', '121.4800000', '31.2200000', '闵行', null);
INSERT INTO `sys_area` VALUES ('009006', '150', '009', '长宁区', '121.4800000', '31.2200000', '长宁', null);
INSERT INTO `sys_area` VALUES ('009007', '151', '009', '普陀区', '121.4800000', '31.2200000', '普陀', null);
INSERT INTO `sys_area` VALUES ('009008', '152', '009', '宝山区', '121.4800000', '31.4100000', '宝山', null);
INSERT INTO `sys_area` VALUES ('009009', '153', '009', '静安区', '121.4800000', '31.2200000', '静安', null);
INSERT INTO `sys_area` VALUES ('009010', '154', '009', '闸北区', '121.4800000', '31.2200000', '闸北', null);
INSERT INTO `sys_area` VALUES ('009011', '155', '009', '卢湾区', '121.4800000', '31.2200000', '卢湾', null);
INSERT INTO `sys_area` VALUES ('009012', '156', '009', '松江区', '121.2400000', '31.0000000', '松江', null);
INSERT INTO `sys_area` VALUES ('009013', '157', '009', '嘉定区', '121.2400000', '31.4000000', '嘉定', null);
INSERT INTO `sys_area` VALUES ('009014', '158', '009', '南汇区', '121.7600000', '31.0500000', '南汇', null);
INSERT INTO `sys_area` VALUES ('009015', '159', '009', '金山区', '121.1600000', '30.8900000', '金山', null);
INSERT INTO `sys_area` VALUES ('009016', '160', '009', '青浦区', '121.1000000', '31.1500000', '青浦', null);
INSERT INTO `sys_area` VALUES ('009017', '161', '009', '奉贤区', '121.4600000', '30.9200000', '奉贤', null);
INSERT INTO `sys_area` VALUES ('009018', '162', '009', '崇明县', '121.4000000', '31.7300000', '崇明', null);
INSERT INTO `sys_area` VALUES ('010', '10', '0', '江苏', null, null, '江苏', null);
INSERT INTO `sys_area` VALUES ('010001', '265', '010', '南京市', '118.7800000', '32.0400000', '南京', null);
INSERT INTO `sys_area` VALUES ('010002', '266', '010', '无锡市', '118.7800000', '32.0400000', '无锡', null);
INSERT INTO `sys_area` VALUES ('010003', '267', '010', '徐州市', '118.7800000', '32.0400000', '徐州', null);
INSERT INTO `sys_area` VALUES ('010004', '268', '010', '常州市', '118.7800000', '32.0400000', '常州', null);
INSERT INTO `sys_area` VALUES ('010005', '269', '010', '苏州市', '118.7800000', '32.0400000', '苏州', null);
INSERT INTO `sys_area` VALUES ('010006', '270', '010', '南通市', '118.7800000', '32.0400000', '南通', null);
INSERT INTO `sys_area` VALUES ('010007', '271', '010', '连云港市', '118.7800000', '32.0400000', '连云港', null);
INSERT INTO `sys_area` VALUES ('010008', '272', '010', '淮安市', '118.7800000', '32.0400000', '淮安', null);
INSERT INTO `sys_area` VALUES ('010009', '273', '010', '盐城市', '118.7800000', '32.0400000', '盐城', null);
INSERT INTO `sys_area` VALUES ('010010', '274', '010', '扬州市', '118.7800000', '32.0400000', '扬州', null);
INSERT INTO `sys_area` VALUES ('010011', '275', '010', '镇江市', '118.7800000', '32.0400000', '镇江', null);
INSERT INTO `sys_area` VALUES ('010012', '276', '010', '泰州市', '118.7800000', '32.0400000', '泰州', null);
INSERT INTO `sys_area` VALUES ('010013', '277', '010', '宿迁市', '118.7800000', '32.0400000', '宿迁', null);
INSERT INTO `sys_area` VALUES ('011', '11', '0', '浙江', null, null, '浙江', null);
INSERT INTO `sys_area` VALUES ('011001', '278', '011', '杭州市', '120.1900000', '30.2600000', '杭州', null);
INSERT INTO `sys_area` VALUES ('011002', '279', '011', '宁波市', '120.1900000', '30.2600000', '宁波', '余姚,慈溪,象山,宁海');
INSERT INTO `sys_area` VALUES ('011003', '280', '011', '温州市', '120.1900000', '30.2600000', '温州', null);
INSERT INTO `sys_area` VALUES ('011004', '281', '011', '嘉兴市', '120.1900000', '30.2600000', '嘉兴', null);
INSERT INTO `sys_area` VALUES ('011005', '282', '011', '湖州市', '120.1900000', '30.2600000', '湖州', null);
INSERT INTO `sys_area` VALUES ('011006', '283', '011', '绍兴市', '120.1900000', '30.2600000', '绍兴', '诸暨,嵊州,新昌');
INSERT INTO `sys_area` VALUES ('011007', '284', '011', '金华市', '120.1900000', '30.2600000', '金华', '兰溪,东阳,永康,义乌,武义,浦江,磐安');
INSERT INTO `sys_area` VALUES ('011008', '285', '011', '衢州市', '120.1900000', '30.2600000', '衢州', null);
INSERT INTO `sys_area` VALUES ('011009', '286', '011', '舟山市', '122.1100000', '30.0300000', '舟山', null);
INSERT INTO `sys_area` VALUES ('011010', '287', '011', '台州市', '121.4400000', '28.6700000', '台州', '临海,温岭,玉环,三门,天台,仙居');
INSERT INTO `sys_area` VALUES ('011011', '288', '011', '丽水市', '120.1900000', '30.2600000', '丽水', null);
INSERT INTO `sys_area` VALUES ('012', '12', '0', '安徽', null, null, '安徽', null);
INSERT INTO `sys_area` VALUES ('012001', '289', '012', '合肥市', '117.2700000', '31.8600000', '合肥', null);
INSERT INTO `sys_area` VALUES ('012002', '290', '012', '芜湖市', '117.2700000', '31.8600000', '芜湖', null);
INSERT INTO `sys_area` VALUES ('012003', '291', '012', '蚌埠市', '117.2700000', '31.8600000', '蚌埠', null);
INSERT INTO `sys_area` VALUES ('012004', '292', '012', '淮南市', '117.2700000', '31.8600000', '淮南', null);
INSERT INTO `sys_area` VALUES ('012005', '293', '012', '马鞍山市', '117.2700000', '31.8600000', '马鞍山', null);
INSERT INTO `sys_area` VALUES ('012006', '294', '012', '淮北市', '117.2700000', '31.8600000', '淮北', null);
INSERT INTO `sys_area` VALUES ('012007', '295', '012', '铜陵市', '117.2700000', '31.8600000', '铜陵', null);
INSERT INTO `sys_area` VALUES ('012008', '296', '012', '安庆市', '117.2700000', '31.8600000', '安庆', null);
INSERT INTO `sys_area` VALUES ('012009', '297', '012', '黄山市', '118.3100000', '29.7200000', '黄山', null);
INSERT INTO `sys_area` VALUES ('012010', '298', '012', '滁州市', '117.2700000', '31.8600000', '滁州', null);
INSERT INTO `sys_area` VALUES ('012011', '299', '012', '阜阳市', '117.2700000', '31.8600000', '阜阳', null);
INSERT INTO `sys_area` VALUES ('012012', '300', '012', '宿州市', '117.2700000', '31.8600000', '宿州', null);
INSERT INTO `sys_area` VALUES ('012013', '301', '012', '六安市', '117.2700000', '31.8600000', '六安', null);
INSERT INTO `sys_area` VALUES ('012014', '302', '012', '巢湖市', '117.2700000', '31.8600000', '巢湖', null);
INSERT INTO `sys_area` VALUES ('012015', '303', '012', '亳州市', '117.2700000', '31.8600000', '亳州', null);
INSERT INTO `sys_area` VALUES ('012016', '304', '012', '池州市', '117.4800000', '30.6600000', '池州', null);
INSERT INTO `sys_area` VALUES ('012017', '305', '012', '宣城市', '117.2700000', '31.8600000', '宣城', null);
INSERT INTO `sys_area` VALUES ('013', '13', '0', '福建', null, null, '福建', null);
INSERT INTO `sys_area` VALUES ('013001', '306', '013', '福州市', '119.3000000', '26.0800000', '福州', null);
INSERT INTO `sys_area` VALUES ('013002', '307', '013', '厦门市', '119.3000000', '26.0800000', '厦门', null);
INSERT INTO `sys_area` VALUES ('013003', '308', '013', '莆田市', '119.3000000', '26.0800000', '莆田', null);
INSERT INTO `sys_area` VALUES ('013004', '309', '013', '三明市', '119.3000000', '26.0800000', '三明', null);
INSERT INTO `sys_area` VALUES ('013005', '310', '013', '泉州市', '119.3000000', '26.0800000', '泉州', null);
INSERT INTO `sys_area` VALUES ('013006', '311', '013', '漳州市', '119.3000000', '26.0800000', '漳州', null);
INSERT INTO `sys_area` VALUES ('013007', '312', '013', '南平市', '119.3000000', '26.0800000', '南平', null);
INSERT INTO `sys_area` VALUES ('013008', '313', '013', '龙岩市', '119.3000000', '26.0800000', '龙岩', null);
INSERT INTO `sys_area` VALUES ('013009', '314', '013', '宁德市', '119.3000000', '26.0800000', '宁德', null);
INSERT INTO `sys_area` VALUES ('014', '14', '0', '江西', null, null, '江西', null);
INSERT INTO `sys_area` VALUES ('014001', '315', '014', '南昌市', '115.8900000', '28.6800000', '南昌', null);
INSERT INTO `sys_area` VALUES ('014002', '316', '014', '景德镇市', '115.8900000', '28.6800000', '景德镇', null);
INSERT INTO `sys_area` VALUES ('014003', '317', '014', '萍乡市', '115.8900000', '28.6800000', '萍乡', null);
INSERT INTO `sys_area` VALUES ('014004', '318', '014', '九江市', '115.8900000', '28.6800000', '九江', null);
INSERT INTO `sys_area` VALUES ('014005', '319', '014', '新余市', '115.8900000', '28.6800000', '新余', null);
INSERT INTO `sys_area` VALUES ('014006', '320', '014', '鹰潭市', '115.8900000', '28.6800000', '鹰潭', null);
INSERT INTO `sys_area` VALUES ('014007', '321', '014', '赣州市', '115.8900000', '28.6800000', '赣州', null);
INSERT INTO `sys_area` VALUES ('014008', '322', '014', '吉安市', '115.8900000', '28.6800000', '吉安', null);
INSERT INTO `sys_area` VALUES ('014009', '323', '014', '宜春市', '115.8900000', '28.6800000', '宜春', null);
INSERT INTO `sys_area` VALUES ('014010', '324', '014', '抚州市', '116.2900000', '27.9500000', '抚州', null);
INSERT INTO `sys_area` VALUES ('014011', '325', '014', '上饶市', '115.8900000', '28.6800000', '上饶', null);
INSERT INTO `sys_area` VALUES ('015', '15', '0', '山东', null, null, '山东', null);
INSERT INTO `sys_area` VALUES ('015001', '326', '015', '济南市', '106.5400000', '29.5900000', '济南', '平阴,商河');
INSERT INTO `sys_area` VALUES ('015002', '327', '015', '青岛市', '106.5400000', '29.5900000', '青岛', '胶州,平度,莱西');
INSERT INTO `sys_area` VALUES ('015003', '328', '015', '淄博市', '106.5400000', '29.5900000', '淄博', '桓台,高青,沂源');
INSERT INTO `sys_area` VALUES ('015004', '329', '015', '枣庄市', '106.5400000', '29.5900000', '枣庄', '滕州');
INSERT INTO `sys_area` VALUES ('015005', '330', '015', '东营市', '118.4900000', '37.4600000', '东营', '广饶,利津');
INSERT INTO `sys_area` VALUES ('015006', '331', '015', '烟台市', '106.5400000', '29.5900000', '烟台', '龙口,莱阳,莱州,蓬莱,招远,栖霞,海阳,长岛');
INSERT INTO `sys_area` VALUES ('015007', '332', '015', '潍坊市', '106.5400000', '29.5900000', '潍坊', '诸城,青州,寿光,安丘,昌邑,高密,临朐,昌乐');
INSERT INTO `sys_area` VALUES ('015008', '333', '015', '济宁市', '106.5400000', '29.5900000', '济宁', '邹城,曲阜,嘉祥,汶上,梁山,微山,鱼台,金乡,泗水');
INSERT INTO `sys_area` VALUES ('015009', '334', '015', '泰安市', '106.5400000', '29.5900000', '泰安', '新泰,肥城,宁阳,东平');
INSERT INTO `sys_area` VALUES ('015010', '335', '015', '威海市', '106.5400000', '29.5900000', '威海', '荣成,乳山');
INSERT INTO `sys_area` VALUES ('015011', '336', '015', '日照市', '106.5400000', '29.5900000', '日照', '五莲,莒县');
INSERT INTO `sys_area` VALUES ('015012', '337', '015', '莱芜市', '106.5400000', '29.5900000', '莱芜', null);
INSERT INTO `sys_area` VALUES ('015013', '338', '015', '临沂市', '106.5400000', '29.5900000', '临沂', '兰陵,郯城,莒南,沂水,蒙阴,平邑,沂南,临沭,费县');
INSERT INTO `sys_area` VALUES ('015014', '339', '015', '德州市', '106.5400000', '29.5900000', '德州', '乐陵,禹城,临邑,平原,夏津,武城,庆云,宁津,齐河');
INSERT INTO `sys_area` VALUES ('015015', '340', '015', '聊城市', '106.5400000', '29.5900000', '聊城', '临清,茌平,东阿,高唐,阳谷,冠县,莘县');
INSERT INTO `sys_area` VALUES ('015016', '341', '015', '滨州市', '106.5400000', '29.5900000', '滨州', '邹平,惠民,博兴,阳信,无棣');
INSERT INTO `sys_area` VALUES ('015017', '342', '015', '菏泽市', '106.5400000', '29.5900000', '菏泽', '曹县,单县,巨野,成武,郓城,鄄城,东明');
INSERT INTO `sys_area` VALUES ('016', '16', '0', '河南', null, null, '河南', null);
INSERT INTO `sys_area` VALUES ('016001', '343', '016', '郑州市', '113.6500000', '34.7600000', '郑州', null);
INSERT INTO `sys_area` VALUES ('016002', '344', '016', '开封市', '113.6500000', '34.7600000', '开封', null);
INSERT INTO `sys_area` VALUES ('016003', '345', '016', '洛阳市', '113.6500000', '34.7600000', '洛阳', null);
INSERT INTO `sys_area` VALUES ('016004', '346', '016', '平顶山市', '113.6500000', '34.7600000', '平顶山', null);
INSERT INTO `sys_area` VALUES ('016005', '347', '016', '安阳市', '113.6500000', '34.7600000', '安阳', null);
INSERT INTO `sys_area` VALUES ('016006', '348', '016', '鹤壁市', '113.6500000', '34.7600000', '鹤壁', null);
INSERT INTO `sys_area` VALUES ('016007', '349', '016', '新乡市', '113.6500000', '34.7600000', '新乡', null);
INSERT INTO `sys_area` VALUES ('016008', '350', '016', '焦作市', '112.5700000', '35.0800000', '焦作', null);
INSERT INTO `sys_area` VALUES ('016009', '351', '016', '濮阳市', '113.6500000', '34.7600000', '濮阳', null);
INSERT INTO `sys_area` VALUES ('016010', '352', '016', '许昌市', '113.6500000', '34.7600000', '许昌', null);
INSERT INTO `sys_area` VALUES ('016011', '353', '016', '漯河市', '113.6500000', '34.7600000', '漯河', null);
INSERT INTO `sys_area` VALUES ('016012', '354', '016', '三门峡市', '113.6500000', '34.7600000', '三门峡', null);
INSERT INTO `sys_area` VALUES ('016013', '355', '016', '南阳市', '113.6500000', '34.7600000', '南阳', null);
INSERT INTO `sys_area` VALUES ('016014', '356', '016', '商丘市', '113.6500000', '34.7600000', '商丘', null);
INSERT INTO `sys_area` VALUES ('016015', '357', '016', '信阳市', '113.6500000', '34.7600000', '信阳', null);
INSERT INTO `sys_area` VALUES ('016016', '358', '016', '周口市', '113.6500000', '34.7600000', '周口', null);
INSERT INTO `sys_area` VALUES ('016017', '359', '016', '驻马店市', '113.6500000', '34.7600000', '驻马店', null);
INSERT INTO `sys_area` VALUES ('017', '17', '0', '湖北', null, null, '湖北', null);
INSERT INTO `sys_area` VALUES ('017001', '360', '017', '武汉市', '114.3100000', '30.5200000', '武汉', null);
INSERT INTO `sys_area` VALUES ('017002', '361', '017', '黄石市', '114.3100000', '30.5200000', '黄石', null);
INSERT INTO `sys_area` VALUES ('017003', '362', '017', '十堰市', '114.3100000', '30.5200000', '十堰', null);
INSERT INTO `sys_area` VALUES ('017004', '363', '017', '宜昌市', '114.3100000', '30.5200000', '宜昌', null);
INSERT INTO `sys_area` VALUES ('017005', '364', '017', '襄阳市', '112.1270000', '32.0150000', '襄阳', null);
INSERT INTO `sys_area` VALUES ('017006', '365', '017', '鄂州市', '114.8700000', '30.3800000', '鄂州', null);
INSERT INTO `sys_area` VALUES ('017007', '366', '017', '荆门市', '114.3100000', '30.5200000', '荆门', null);
INSERT INTO `sys_area` VALUES ('017008', '367', '017', '孝感市', '114.3100000', '30.5200000', '孝感', null);
INSERT INTO `sys_area` VALUES ('017009', '368', '017', '荆州市', '114.3100000', '30.5200000', '荆州', null);
INSERT INTO `sys_area` VALUES ('017010', '369', '017', '黄冈市', '114.3100000', '30.5200000', '黄冈', null);
INSERT INTO `sys_area` VALUES ('017011', '370', '017', '咸宁市', '114.3100000', '30.5200000', '咸宁', null);
INSERT INTO `sys_area` VALUES ('017012', '371', '017', '随州市', '114.3100000', '30.5200000', '随州', null);
INSERT INTO `sys_area` VALUES ('017013', '372', '017', '恩施', '114.3100000', '30.5200000', '恩施', null);
INSERT INTO `sys_area` VALUES ('017014', '373', '017', '神农架', '114.3100000', '30.5200000', '神农架', null);
INSERT INTO `sys_area` VALUES ('017015', '374', '017', '天门市', '114.3100000', '30.5200000', '天门', null);
INSERT INTO `sys_area` VALUES ('017016', '375', '017', '仙桃市', '114.3100000', '30.5200000', '仙桃', null);
INSERT INTO `sys_area` VALUES ('017017', '376', '017', '潜江市', '114.3100000', '30.5200000', '潜江', null);
INSERT INTO `sys_area` VALUES ('018', '18', '0', '湖南', null, null, '湖南', null);
INSERT INTO `sys_area` VALUES ('018001', '377', '018', '长沙市', '113.0000000', '28.2100000', '长沙', null);
INSERT INTO `sys_area` VALUES ('018002', '378', '018', '株洲市', '113.0000000', '28.2100000', '株洲', null);
INSERT INTO `sys_area` VALUES ('018003', '379', '018', '湘潭市', '113.0000000', '28.2100000', '湘潭', null);
INSERT INTO `sys_area` VALUES ('018004', '380', '018', '衡阳市', '113.0000000', '28.2100000', '衡阳', null);
INSERT INTO `sys_area` VALUES ('018005', '381', '018', '邵阳市', '113.0000000', '28.2100000', '邵阳', null);
INSERT INTO `sys_area` VALUES ('018006', '382', '018', '岳阳市', '113.0000000', '28.2100000', '岳阳', null);
INSERT INTO `sys_area` VALUES ('018007', '383', '018', '常德市', '113.0000000', '28.2100000', '常德', null);
INSERT INTO `sys_area` VALUES ('018008', '384', '018', '张家界市', '113.0000000', '28.2100000', '张家界', null);
INSERT INTO `sys_area` VALUES ('018009', '385', '018', '益阳市', '113.0000000', '28.2100000', '益阳', null);
INSERT INTO `sys_area` VALUES ('018010', '386', '018', '郴州市', '113.0000000', '28.2100000', '郴州', null);
INSERT INTO `sys_area` VALUES ('018011', '387', '018', '永州市', '113.0000000', '28.2100000', '永州', null);
INSERT INTO `sys_area` VALUES ('018012', '388', '018', '怀化市', '113.0000000', '28.2100000', '怀化', null);
INSERT INTO `sys_area` VALUES ('018013', '389', '018', '娄底市', '113.0000000', '28.2100000', '娄底', null);
INSERT INTO `sys_area` VALUES ('018014', '390', '018', '湘西', '109.7100000', '28.3000000', '湘西', null);
INSERT INTO `sys_area` VALUES ('019', '19', '0', '广东', null, null, '广东', null);
INSERT INTO `sys_area` VALUES ('019001', '391', '019', '广州市', '113.2300000', '23.1600000', '广州', null);
INSERT INTO `sys_area` VALUES ('019002', '392', '019', '韶关市', '113.2300000', '23.1600000', '韶关', null);
INSERT INTO `sys_area` VALUES ('019003', '393', '019', '深圳市', '113.2300000', '23.1600000', '深圳', null);
INSERT INTO `sys_area` VALUES ('019004', '394', '019', '珠海市', '113.2300000', '23.1600000', '珠海', null);
INSERT INTO `sys_area` VALUES ('019005', '395', '019', '汕头市', '113.2300000', '23.1600000', '汕头', null);
INSERT INTO `sys_area` VALUES ('019006', '396', '019', '佛山市', '113.2300000', '23.1600000', '佛山', null);
INSERT INTO `sys_area` VALUES ('019007', '397', '019', '江门市', '113.2300000', '23.1600000', '江门', null);
INSERT INTO `sys_area` VALUES ('019008', '398', '019', '湛江市', '113.2300000', '23.1600000', '湛江', null);
INSERT INTO `sys_area` VALUES ('019009', '399', '019', '茂名市', '113.2300000', '23.1600000', '茂名', null);
INSERT INTO `sys_area` VALUES ('019010', '400', '019', '肇庆市', '113.2300000', '23.1600000', '肇庆', null);
INSERT INTO `sys_area` VALUES ('019011', '401', '019', '惠州市', '113.2300000', '23.1600000', '惠州', null);
INSERT INTO `sys_area` VALUES ('019012', '402', '019', '梅州市', '113.2300000', '23.1600000', '梅州', null);
INSERT INTO `sys_area` VALUES ('019013', '403', '019', '汕尾市', '117.6400000', '22.9500000', '汕尾', null);
INSERT INTO `sys_area` VALUES ('019014', '404', '019', '河源市', '113.2300000', '23.1600000', '河源', null);
INSERT INTO `sys_area` VALUES ('019015', '405', '019', '阳江市', '113.2300000', '23.1600000', '阳江', null);
INSERT INTO `sys_area` VALUES ('019016', '406', '019', '清远市', '113.2300000', '23.1600000', '清远', null);
INSERT INTO `sys_area` VALUES ('019017', '407', '019', '东莞市', '113.2300000', '23.1600000', '东莞', null);
INSERT INTO `sys_area` VALUES ('019018', '408', '019', '中山市', '113.3800000', '22.5200000', '中山', null);
INSERT INTO `sys_area` VALUES ('019019', '409', '019', '潮州市', '113.2300000', '23.1600000', '潮州', null);
INSERT INTO `sys_area` VALUES ('019020', '410', '019', '揭阳市', '113.2300000', '23.1600000', '揭阳', null);
INSERT INTO `sys_area` VALUES ('019021', '411', '019', '云浮市', '113.2300000', '23.1600000', '云浮', null);
INSERT INTO `sys_area` VALUES ('020', '20', '0', '广西', null, null, '广西', null);
INSERT INTO `sys_area` VALUES ('020001', '412', '020', '南宁市', '106.5400000', '29.5900000', '南宁', null);
INSERT INTO `sys_area` VALUES ('020002', '413', '020', '柳州市', '106.5400000', '29.5900000', '柳州', null);
INSERT INTO `sys_area` VALUES ('020003', '414', '020', '桂林市', '106.5400000', '29.5900000', '桂林', null);
INSERT INTO `sys_area` VALUES ('020004', '415', '020', '梧州市', '106.5400000', '29.5900000', '梧州', null);
INSERT INTO `sys_area` VALUES ('020005', '416', '020', '北海市', '106.5400000', '29.5900000', '北海', null);
INSERT INTO `sys_area` VALUES ('020006', '417', '020', '防城港市', '106.5400000', '29.5900000', '防城港', null);
INSERT INTO `sys_area` VALUES ('020007', '418', '020', '钦州市', '106.5400000', '29.5900000', '钦州', null);
INSERT INTO `sys_area` VALUES ('020008', '419', '020', '贵港市', '106.5400000', '29.5900000', '贵港', null);
INSERT INTO `sys_area` VALUES ('020009', '420', '020', '玉林市', '106.5400000', '29.5900000', '玉林', null);
INSERT INTO `sys_area` VALUES ('020010', '421', '020', '百色市', '106.5400000', '29.5900000', '百色', null);
INSERT INTO `sys_area` VALUES ('020011', '422', '020', '贺州市', '106.5400000', '29.5900000', '贺州', null);
INSERT INTO `sys_area` VALUES ('020012', '423', '020', '河池市', '106.5400000', '29.5900000', '河池', null);
INSERT INTO `sys_area` VALUES ('020013', '424', '020', '来宾市', '106.5400000', '29.5900000', '来宾', null);
INSERT INTO `sys_area` VALUES ('020014', '425', '020', '崇左市', '106.5400000', '29.5900000', '崇左', null);
INSERT INTO `sys_area` VALUES ('021', '21', '0', '海南', null, null, '海南', null);
INSERT INTO `sys_area` VALUES ('021001', '426', '021', '海口市', '110.3500000', '20.0200000', '海口', null);
INSERT INTO `sys_area` VALUES ('021002', '427', '021', '三亚市', '110.3500000', '20.0200000', '三亚', null);
INSERT INTO `sys_area` VALUES ('021003', '428', '021', '三沙市', '112.3508310', '16.8411000', '三沙', null);
INSERT INTO `sys_area` VALUES ('021004', '429', '021', '儋州市', '110.3500000', '20.0200000', '儋州', null);
INSERT INTO `sys_area` VALUES ('022', '22', '0', '重庆', null, null, '重庆', null);
INSERT INTO `sys_area` VALUES ('022001', '175', '022', '涪陵区', '106.5400000', '29.5900000', '涪陵', null);
INSERT INTO `sys_area` VALUES ('022002', '176', '022', '渝中区', '106.5400000', '29.5900000', '渝中', null);
INSERT INTO `sys_area` VALUES ('022003', '177', '022', '大渡口区', '106.5400000', '29.5900000', '大渡口', null);
INSERT INTO `sys_area` VALUES ('022004', '178', '022', '江北区', '106.5400000', '29.5900000', '江北', null);
INSERT INTO `sys_area` VALUES ('022005', '179', '022', '沙坪坝区', '106.5400000', '29.5900000', '沙坪坝', null);
INSERT INTO `sys_area` VALUES ('022006', '180', '022', '九龙坡区', '106.5400000', '29.5900000', '九龙坡', null);
INSERT INTO `sys_area` VALUES ('022007', '181', '022', '南岸区', '106.5400000', '29.5900000', '南岸', null);
INSERT INTO `sys_area` VALUES ('022008', '182', '022', '北碚区', '106.5400000', '29.5900000', '北碚', null);
INSERT INTO `sys_area` VALUES ('022009', '183', '022', '万盛区', '105.9100000', '29.3800000', '万盛', null);
INSERT INTO `sys_area` VALUES ('022010', '184', '022', '双桥区', '106.5400000', '29.5900000', '双桥', null);
INSERT INTO `sys_area` VALUES ('022011', '185', '022', '渝北区', '106.5400000', '29.5900000', '渝北', null);
INSERT INTO `sys_area` VALUES ('022012', '186', '022', '巴南区', '106.5400000', '29.5900000', '巴南', null);
INSERT INTO `sys_area` VALUES ('022013', '187', '022', '长寿县', '106.6400000', '29.0100000', '长寿', null);
INSERT INTO `sys_area` VALUES ('022014', '188', '022', '綦江县', '106.5600000', '29.4100000', '綦江', null);
INSERT INTO `sys_area` VALUES ('022015', '189', '022', '潼南县', '106.2200000', '30.0300000', '潼南', null);
INSERT INTO `sys_area` VALUES ('022016', '190', '022', '铜梁县', '105.8000000', '30.1600000', '铜梁', null);
INSERT INTO `sys_area` VALUES ('022017', '191', '022', '大足县', '105.5900000', '29.4000000', '大足', null);
INSERT INTO `sys_area` VALUES ('022018', '192', '022', '荣昌县', '106.2100000', '29.6200000', '荣昌', null);
INSERT INTO `sys_area` VALUES ('022019', '193', '022', '璧山县', '106.5400000', '29.5900000', '璧山', null);
INSERT INTO `sys_area` VALUES ('022020', '194', '022', '梁平县', '106.5400000', '29.5900000', '梁平', null);
INSERT INTO `sys_area` VALUES ('022021', '195', '022', '城口县', '106.5400000', '29.5900000', '城口', null);
INSERT INTO `sys_area` VALUES ('022022', '196', '022', '丰都县', '106.5400000', '29.5900000', '丰都', null);
INSERT INTO `sys_area` VALUES ('022023', '197', '022', '垫江县', '106.5400000', '29.5900000', '垫江', null);
INSERT INTO `sys_area` VALUES ('022024', '198', '022', '武隆县', '106.5400000', '29.5900000', '武隆', null);
INSERT INTO `sys_area` VALUES ('022025', '199', '022', '忠县', '106.5400000', '29.5900000', '忠县', null);
INSERT INTO `sys_area` VALUES ('022026', '200', '022', '开县', '106.5400000', '29.5900000', '开县', null);
INSERT INTO `sys_area` VALUES ('022027', '201', '022', '云阳县', '106.5400000', '29.5900000', '云阳', null);
INSERT INTO `sys_area` VALUES ('022028', '202', '022', '奉节县', '106.5400000', '29.5900000', '奉节', null);
INSERT INTO `sys_area` VALUES ('022029', '203', '022', '巫山县', '106.5400000', '29.5900000', '巫山', null);
INSERT INTO `sys_area` VALUES ('022030', '204', '022', '巫溪县', '106.5400000', '29.5900000', '巫溪', null);
INSERT INTO `sys_area` VALUES ('022031', '205', '022', '黔江区', '106.5400000', '29.5900000', '黔江', null);
INSERT INTO `sys_area` VALUES ('022032', '206', '022', '石柱', '106.5400000', '29.5900000', '石柱', null);
INSERT INTO `sys_area` VALUES ('022033', '207', '022', '秀山', '106.5400000', '29.5900000', '秀山', null);
INSERT INTO `sys_area` VALUES ('022034', '208', '022', '酉阳', '106.5400000', '29.5900000', '酉阳', null);
INSERT INTO `sys_area` VALUES ('022035', '209', '022', '彭水', '106.5400000', '29.5900000', '彭水', null);
INSERT INTO `sys_area` VALUES ('022036', '210', '022', '江津区', '106.5400000', '29.5900000', '江津', null);
INSERT INTO `sys_area` VALUES ('022037', '211', '022', '合川区', '106.2800000', '29.2600000', '合川', null);
INSERT INTO `sys_area` VALUES ('022038', '212', '022', '永川区', '105.7100000', '29.7500000', '永川', null);
INSERT INTO `sys_area` VALUES ('022039', '213', '022', '南川区', '106.5400000', '29.5900000', '南川', null);
INSERT INTO `sys_area` VALUES ('023', '23', '0', '四川', null, null, '四川', null);
INSERT INTO `sys_area` VALUES ('023001', '430', '023', '成都市', '104.0600000', '30.6700000', '成都', null);
INSERT INTO `sys_area` VALUES ('023002', '431', '023', '自贡市', '104.0600000', '30.6700000', '自贡', null);
INSERT INTO `sys_area` VALUES ('023003', '432', '023', '攀枝花市', '104.0600000', '30.6700000', '攀枝花', null);
INSERT INTO `sys_area` VALUES ('023004', '433', '023', '泸州市', '104.0600000', '30.6700000', '泸州', null);
INSERT INTO `sys_area` VALUES ('023005', '434', '023', '德阳市', '104.0600000', '30.6700000', '德阳', null);
INSERT INTO `sys_area` VALUES ('023006', '435', '023', '绵阳市', '104.0600000', '30.6700000', '绵阳', null);
INSERT INTO `sys_area` VALUES ('023007', '436', '023', '广元市', '104.0600000', '30.6700000', '广元', null);
INSERT INTO `sys_area` VALUES ('023008', '437', '023', '遂宁市', '104.0600000', '30.6700000', '遂宁', null);
INSERT INTO `sys_area` VALUES ('023009', '438', '023', '内江市', '104.0600000', '30.6700000', '内江', null);
INSERT INTO `sys_area` VALUES ('023010', '439', '023', '乐山市', '104.0600000', '30.6700000', '乐山', null);
INSERT INTO `sys_area` VALUES ('023011', '440', '023', '南充市', '104.0600000', '30.6700000', '南充', null);
INSERT INTO `sys_area` VALUES ('023012', '441', '023', '眉山市', '104.0600000', '30.6700000', '眉山', null);
INSERT INTO `sys_area` VALUES ('023013', '442', '023', '宜宾市', '104.0600000', '30.6700000', '宜宾', null);
INSERT INTO `sys_area` VALUES ('023014', '443', '023', '广安市', '106.6100000', '30.4800000', '广安', null);
INSERT INTO `sys_area` VALUES ('023015', '444', '023', '达州市', '104.0600000', '30.6700000', '达州', null);
INSERT INTO `sys_area` VALUES ('023016', '445', '023', '雅安市', '104.0600000', '30.6700000', '雅安', null);
INSERT INTO `sys_area` VALUES ('023017', '446', '023', '巴中市', '104.0600000', '30.6700000', '巴中', null);
INSERT INTO `sys_area` VALUES ('023018', '447', '023', '资阳市', '104.0600000', '30.6700000', '资阳', null);
INSERT INTO `sys_area` VALUES ('023019', '448', '023', '阿坝', '102.2200000', '31.9200000', '阿坝', null);
INSERT INTO `sys_area` VALUES ('023020', '449', '023', '甘孜', '101.9500000', '30.0400000', '甘孜', null);
INSERT INTO `sys_area` VALUES ('023021', '450', '023', '凉山', '102.2900000', '27.9200000', '凉山', null);
INSERT INTO `sys_area` VALUES ('024', '24', '0', '贵州', null, null, '贵州', null);
INSERT INTO `sys_area` VALUES ('024001', '451', '024', '贵阳市', '106.7100000', '26.5700000', '贵阳', null);
INSERT INTO `sys_area` VALUES ('024002', '452', '024', '六盘水市', '106.7100000', '26.5700000', '六盘水', null);
INSERT INTO `sys_area` VALUES ('024003', '453', '024', '遵义市', '106.7100000', '26.5700000', '遵义', null);
INSERT INTO `sys_area` VALUES ('024004', '454', '024', '安顺市', '106.7100000', '26.5700000', '安顺', null);
INSERT INTO `sys_area` VALUES ('024005', '455', '024', '毕节地区', '105.2900000', '27.3200000', '毕节', null);
INSERT INTO `sys_area` VALUES ('024006', '456', '024', '铜仁地区', '109.2100000', '27.7300000', '铜仁', null);
INSERT INTO `sys_area` VALUES ('024007', '457', '024', '黔西南', '104.9100000', '25.1000000', '黔西南', null);
INSERT INTO `sys_area` VALUES ('024008', '458', '024', '黔东南', '107.9700000', '26.5900000', '黔东南', null);
INSERT INTO `sys_area` VALUES ('024009', '459', '024', '黔南', '107.5300000', '26.7200000', '黔南', null);
INSERT INTO `sys_area` VALUES ('025', '25', '0', '云南', null, null, '云南', null);
INSERT INTO `sys_area` VALUES ('025001', '460', '025', '昆明市', '102.7300000', '25.0400000', '昆明', null);
INSERT INTO `sys_area` VALUES ('025002', '461', '025', '曲靖市', '102.7300000', '25.0400000', '曲靖', null);
INSERT INTO `sys_area` VALUES ('025003', '462', '025', '玉溪市', '102.7300000', '25.0400000', '玉溪', null);
INSERT INTO `sys_area` VALUES ('025004', '463', '025', '保山市', '102.7300000', '25.0400000', '保山', null);
INSERT INTO `sys_area` VALUES ('025005', '464', '025', '昭通市', '102.7300000', '25.0400000', '昭通', null);
INSERT INTO `sys_area` VALUES ('025006', '465', '025', '丽江市', '102.7300000', '25.0400000', '丽江', null);
INSERT INTO `sys_area` VALUES ('025007', '466', '025', '普洱市', '101.0000000', '22.7900000', '普洱', null);
INSERT INTO `sys_area` VALUES ('025008', '467', '025', '临沧市', '102.7300000', '25.0400000', '临沧', null);
INSERT INTO `sys_area` VALUES ('025009', '468', '025', '楚雄', '101.5400000', '25.0100000', '楚雄', null);
INSERT INTO `sys_area` VALUES ('025010', '469', '025', '红河', '103.4100000', '23.3600000', '红河', null);
INSERT INTO `sys_area` VALUES ('025011', '470', '025', '文山', '104.2400000', '23.3700000', '文山', null);
INSERT INTO `sys_area` VALUES ('025012', '471', '025', '西双版纳', '102.7300000', '25.0400000', '西双版纳', null);
INSERT INTO `sys_area` VALUES ('025013', '472', '025', '大理', '100.1900000', '25.6900000', '大理', null);
INSERT INTO `sys_area` VALUES ('025014', '473', '025', '德宏', '98.6000000', '24.4100000', '德宏', null);
INSERT INTO `sys_area` VALUES ('025015', '474', '025', '怒江', '98.8200000', '25.9700000', '怒江', null);
INSERT INTO `sys_area` VALUES ('025016', '475', '025', '迪庆', '102.7300000', '25.0400000', '迪庆', null);
INSERT INTO `sys_area` VALUES ('026', '26', '0', '西藏', null, null, '西藏', null);
INSERT INTO `sys_area` VALUES ('026001', '476', '026', '拉萨市', '91.1100000', '29.9700000', '拉萨', null);
INSERT INTO `sys_area` VALUES ('026002', '477', '026', '日喀则市', '88.8936000', '29.2756000', '日喀则', null);
INSERT INTO `sys_area` VALUES ('026003', '478', '026', '昌都市', '97.1790000', '31.1460000', '昌都', null);
INSERT INTO `sys_area` VALUES ('026004', '479', '026', '林芝市', '94.3697000', '29.8100000', '林芝', null);
INSERT INTO `sys_area` VALUES ('026005', '480', '026', '山南市', '91.7760000', '29.2440000', '山南', null);
INSERT INTO `sys_area` VALUES ('026006', '481', '026', '那曲地区', '92.1000000', '31.4700000', '那曲', null);
INSERT INTO `sys_area` VALUES ('026007', '482', '026', '阿里地区', '80.0000000', '32.0800000', '阿里', null);
INSERT INTO `sys_area` VALUES ('027', '27', '0', '陕西', null, null, '陕西', null);
INSERT INTO `sys_area` VALUES ('027001', '483', '027', '西安市', '108.9500000', '34.2700000', '西安', null);
INSERT INTO `sys_area` VALUES ('027002', '484', '027', '铜川市', '108.9500000', '34.2700000', '铜川', null);
INSERT INTO `sys_area` VALUES ('027003', '485', '027', '宝鸡市', '108.9500000', '34.2700000', '宝鸡', null);
INSERT INTO `sys_area` VALUES ('027004', '486', '027', '咸阳市', '108.9500000', '34.2700000', '咸阳', null);
INSERT INTO `sys_area` VALUES ('027005', '487', '027', '渭南市', '108.9500000', '34.2700000', '渭南', null);
INSERT INTO `sys_area` VALUES ('027006', '488', '027', '延安市', '108.9500000', '34.2700000', '延安', null);
INSERT INTO `sys_area` VALUES ('027007', '489', '027', '汉中市', '108.9500000', '34.2700000', '汉中', null);
INSERT INTO `sys_area` VALUES ('027008', '490', '027', '榆林市', '108.9500000', '34.2700000', '榆林', null);
INSERT INTO `sys_area` VALUES ('027009', '491', '027', '安康市', '108.9500000', '34.2700000', '安康', null);
INSERT INTO `sys_area` VALUES ('027010', '492', '027', '商洛市', '108.9500000', '34.2700000', '商洛', null);
INSERT INTO `sys_area` VALUES ('028', '28', '0', '甘肃', null, null, '甘肃', null);
INSERT INTO `sys_area` VALUES ('028001', '493', '028', '兰州市', '103.7300000', '36.0300000', '兰州', null);
INSERT INTO `sys_area` VALUES ('028002', '494', '028', '嘉峪关市', '103.7300000', '36.0300000', '嘉峪关', null);
INSERT INTO `sys_area` VALUES ('028003', '495', '028', '金昌市', '103.7300000', '36.0300000', '金昌', null);
INSERT INTO `sys_area` VALUES ('028004', '496', '028', '白银市', '103.7300000', '36.0300000', '白银', null);
INSERT INTO `sys_area` VALUES ('028005', '497', '028', '天水市', '106.1200000', '34.7300000', '天水', null);
INSERT INTO `sys_area` VALUES ('028006', '498', '028', '武威市', '103.7300000', '36.0300000', '武威', null);
INSERT INTO `sys_area` VALUES ('028007', '499', '028', '张掖市', '103.7300000', '36.0300000', '张掖', null);
INSERT INTO `sys_area` VALUES ('028008', '500', '028', '平凉市', '103.7300000', '36.0300000', '平凉', null);
INSERT INTO `sys_area` VALUES ('028009', '501', '028', '酒泉市', '103.7300000', '36.0300000', '酒泉', null);
INSERT INTO `sys_area` VALUES ('028010', '502', '028', '庆阳市', '103.7300000', '36.0300000', '庆阳', null);
INSERT INTO `sys_area` VALUES ('028011', '503', '028', '定西市', '103.7300000', '36.0300000', '定西', null);
INSERT INTO `sys_area` VALUES ('028012', '504', '028', '陇南市', '104.9400000', '33.4300000', '陇南', null);
INSERT INTO `sys_area` VALUES ('028013', '505', '028', '临夏', '103.2200000', '35.6200000', '临夏', null);
INSERT INTO `sys_area` VALUES ('028014', '506', '028', '甘南', '103.7300000', '36.0300000', '甘南', null);
INSERT INTO `sys_area` VALUES ('029', '29', '0', '青海', null, null, '青海', null);
INSERT INTO `sys_area` VALUES ('029001', '507', '029', '西宁市', '101.7400000', '36.5600000', '西宁', null);
INSERT INTO `sys_area` VALUES ('029002', '508', '029', '海东', '102.0900000', '36.4700000', '海东', null);
INSERT INTO `sys_area` VALUES ('029003', '509', '029', '海北', '100.9900000', '36.8900000', '海北', null);
INSERT INTO `sys_area` VALUES ('029004', '510', '029', '黄南', '102.0000000', '35.5400000', '黄南', null);
INSERT INTO `sys_area` VALUES ('029005', '511', '029', '海南', '100.6100000', '36.2700000', '海南', null);
INSERT INTO `sys_area` VALUES ('029006', '512', '029', '果洛', '100.2600000', '34.4900000', '果洛', null);
INSERT INTO `sys_area` VALUES ('029007', '513', '029', '玉树', '96.9700000', '33.0300000', '玉树', null);
INSERT INTO `sys_area` VALUES ('029008', '514', '029', '海西', '101.7400000', '36.5600000', '海西', null);
INSERT INTO `sys_area` VALUES ('030', '30', '0', '宁夏', null, null, '宁夏', null);
INSERT INTO `sys_area` VALUES ('030001', '515', '030', '银川市', '106.2700000', '38.4700000', '银川', null);
INSERT INTO `sys_area` VALUES ('030002', '516', '030', '石嘴山市', '106.2700000', '38.4700000', '石嘴山', null);
INSERT INTO `sys_area` VALUES ('030003', '517', '030', '吴忠市', '106.2700000', '38.4700000', '吴忠', null);
INSERT INTO `sys_area` VALUES ('030004', '518', '030', '固原市', '106.2700000', '38.4700000', '固原', null);
INSERT INTO `sys_area` VALUES ('030005', '519', '030', '中卫市', '106.2700000', '38.4700000', '中卫', null);
INSERT INTO `sys_area` VALUES ('031', '31', '0', '新疆', null, null, '新疆', null);
INSERT INTO `sys_area` VALUES ('031001', '520', '031', '乌鲁木齐市', '87.6800000', '43.7700000', '乌鲁木齐', null);
INSERT INTO `sys_area` VALUES ('031002', '521', '031', '克拉玛依市', '84.7700000', '45.5900000', '克拉玛依', null);
INSERT INTO `sys_area` VALUES ('031003', '522', '031', '吐鲁番市', '89.1900000', '42.9100000', '吐鲁番', null);
INSERT INTO `sys_area` VALUES ('031004', '523', '031', '哈密市', '93.4400000', '42.7800000', '哈密', null);
INSERT INTO `sys_area` VALUES ('031005', '524', '031', '昌吉', '87.3120000', '44.0180000', '昌吉', null);
INSERT INTO `sys_area` VALUES ('031006', '525', '031', '博尔塔拉', '82.1000000', '44.9300000', '博尔塔拉', null);
INSERT INTO `sys_area` VALUES ('031007', '526', '031', '巴音郭楞', '86.0600000', '41.6800000', '巴音郭楞', null);
INSERT INTO `sys_area` VALUES ('031008', '527', '031', '阿克苏地区', '80.2900000', '41.1500000', '阿克苏', null);
INSERT INTO `sys_area` VALUES ('031009', '528', '031', '克孜勒苏', '76.1200000', '39.7300000', '克孜勒苏', null);
INSERT INTO `sys_area` VALUES ('031010', '529', '031', '喀什地区', '87.6800000', '43.7700000', '喀什', null);
INSERT INTO `sys_area` VALUES ('031011', '530', '031', '和田地区', '79.9400000', '37.1200000', '和田', null);
INSERT INTO `sys_area` VALUES ('031012', '531', '031', '伊犁', '82.8708500', '43.2770000', '伊犁', null);
INSERT INTO `sys_area` VALUES ('031013', '532', '031', '塔城地区', '82.9850000', '46.7510000', '塔城', null);
INSERT INTO `sys_area` VALUES ('031014', '533', '031', '阿勒泰地区', '88.1460000', '47.8520000', '阿勒泰', null);
INSERT INTO `sys_area` VALUES ('031015', '534', '031', '阿拉尔市', '87.6800000', '43.7700000', '阿拉尔', null);
INSERT INTO `sys_area` VALUES ('031016', '535', '031', '图木舒克市', '87.6800000', '43.7700000', '图木舒克', null);
INSERT INTO `sys_area` VALUES ('031017', '536', '031', '五家渠市', '87.6800000', '43.7700000', '五家渠', null);
INSERT INTO `sys_area` VALUES ('031018', '537', '031', '石河子市', '85.9400000', '44.2700000', '石河子', null);
INSERT INTO `sys_area` VALUES ('032', '32', '0', '台湾', '121.5000000', '25.1400000', '台湾', null);
INSERT INTO `sys_area` VALUES ('032001', '538', '032', '台湾', '121.5000000', '25.1400000', '台湾', null);
INSERT INTO `sys_area` VALUES ('033', '33', '0', '香港', '114.1000000', '22.2000000', '香港', null);
INSERT INTO `sys_area` VALUES ('033001', '539', '033', '香港', '114.1000000', '22.2000000', '香港', null);
INSERT INTO `sys_area` VALUES ('034', '34', '0', '澳门', '113.3300000', '22.1300000', '澳门', null);
INSERT INTO `sys_area` VALUES ('034001', '540', '034', '澳门', '113.3300000', '22.1300000', '澳门', null);

-- ----------------------------
-- Table structure for `sys_auth`
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth`;
CREATE TABLE `sys_auth` (
  `auth_id` varchar(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(36) DEFAULT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `state` int(1) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator` varchar(36) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `is_root` bit(1) DEFAULT NULL,
  `is_default` bit(1) DEFAULT NULL,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_auth
-- ----------------------------
INSERT INTO `sys_auth` VALUES ('089310b389784c9091c28b41a9b837a4', 'p1', 'p1', '', '1', '2019-05-30 14:32:25', 'root', null, null, '');
INSERT INTO `sys_auth` VALUES ('1', '数据展示', 'dataShow', '0', '1', '2019-05-02 11:04:53', 'admin', null, null, '');
INSERT INTO `sys_auth` VALUES ('187def54bc974ad3879b9cae91aef8fb', '采集产品', 'colproduct', 'd7b0c47452754c489d1c669f24197720', '1', '2019-05-28 21:05:27', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('209ad448ceea4eff8e3cf627aaf90f84', 'test11', 'test11', '', '1', '2019-05-30 14:26:54', 'root', null, null, '');
INSERT INTO `sys_auth` VALUES ('28', '系统维护', 'weihu', '0', '1', '2018-04-23 00:00:00', 'admin', null, null, null);
INSERT INTO `sys_auth` VALUES ('2ab0a309f54840898e62483e242ae834', '依赖关系设置', 'dependencyset', '0', '1', '2019-10-17 13:24:04', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('2b8135d1c0184c4fa853a58b77092557', '监控阈值设置', 'thresholdmodule', '0', '1', '2019-10-17 13:23:31', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('2c36823d86aa43c08074506b8b0b1979', '维护保养记录', 'maintenance', '0', '1', '2019-10-17 13:26:16', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('30', '数据导入', 'dataimport', '28', '1', '2019-05-25 09:46:55', 'admin', null, null, '');
INSERT INTO `sys_auth` VALUES ('35', '前台数据菜单', 'frontmenu', '0', '1', '2018-04-28 00:00:00', 'admin', null, null, null);
INSERT INTO `sys_auth` VALUES ('3a7bd514ff654117a65575ed3b024600', '前台菜单管理', 'frontmenu', '1', '1', '2019-02-22 00:00:00', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('4', '系统功能管理', 'system', '0', '1', '2018-04-27 00:00:00', 'admin', null, null, null);
INSERT INTO `sys_auth` VALUES ('457a34e8e29148dab43e761afc6caaa4', '基本信息配置管理', 'baseinfo', '0', '1', '2019-10-17 11:48:23', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('4e5d720c590443838e7f121f91a59661', '计算机开关机控制', 'pccontol', '0', '1', '2019-10-17 13:20:15', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('5', '用户管理', 'userManager', '4', '1', '2018-04-27 00:00:00', 'admin', null, null, null);
INSERT INTO `sys_auth` VALUES ('57', '菜单管理', 'menu', '4', '1', '2018-04-27 00:00:00', null, null, null, null);
INSERT INTO `sys_auth` VALUES ('5cf93e4b98934ae0aa052cbdf66405f8', '故障管理与健康管理', 'faltmodule', '0', '1', '2019-10-17 13:20:45', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('6', '角色管理', 'role', '4', '1', '2018-04-27 00:00:00', 'admin', null, null, null);
INSERT INTO `sys_auth` VALUES ('630ff4854930465fbf2bc85a2a29d760', '日志记录配置', 'logconfig', '0', '1', '2019-10-17 13:19:18', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('6472187452c94badbe221cd8371e3bc0', '操作记录', 'operate', '0', '1', '2019-10-17 13:25:44', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('64e8cd4a84e2409a9f9758c69740d777', '产品类型', 'producttype', '0', '1', '2019-10-17 11:50:49', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('66532828ac0f48838e83f30edf5b2aaf', '值班管理', 'dutymodule', '0', '1', '2019-10-17 13:21:58', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('6a426315ad7c408d9796c264a5830d7d', '设备属性管理', 'deviceattradmin', '0', '1', '2019-10-17 11:52:13', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('7', '日志管理', 'log', '4', '1', '2018-04-27 00:00:00', 'admin', null, null, null);
INSERT INTO `sys_auth` VALUES ('72f771d9826d4a3fb53175c2fdbe31cf', '11', '11', '', null, '2019-05-30 15:52:28', 'root', null, null, '');
INSERT INTO `sys_auth` VALUES ('7ec40b7fe5a340e78efbafbd7973f478', '模拟器系统', 'simulator', '457a34e8e29148dab43e761afc6caaa4', '1', '2019-10-22 11:49:58', 'root', null, null, '');
INSERT INTO `sys_auth` VALUES ('8147fc54caf74a8ebbcb361f7b69dda7', '设备故障库设置', 'faltlib', '0', '1', '2019-10-17 13:25:19', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('81b4ff02d9be458ca10bbec97e75394b', '日志记录', 'logmodule', '0', '1', '2019-10-17 13:21:36', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('83d58eeab622489a929775b28eaf2fd2', '权限管理', 'auth', '4', '1', '2018-05-18 00:00:00', 'admin', null, null, null);
INSERT INTO `sys_auth` VALUES ('8ad44aa9bc4b42f69c870e24158117ab', '设备管理控制及数据采集', 'deviceadminmodule', '0', '1', '2019-10-17 11:49:48', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('9def43a8107f4b81aa5f0516902e8003', '公司管理', 'company', '1', '1', '2019-03-25 14:46:40', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('a10926d5bf704df19c7af2eafe7938cf', '设备管理', 'deviceadmin', '0', '1', '2019-10-17 11:52:36', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('a169e5d5103d4bda81d7ae39e3e63b40', '字典管理', 'dictionary', '4', '1', '2019-01-31 00:00:00', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('a1f8ef5ff04c4f1299833dfcd39ee9bf', 't6', 't6', '', '1', '2019-05-30 14:23:58', 'root', null, null, '');
INSERT INTO `sys_auth` VALUES ('b9e9fdcfdd2a47fca383f2027cbe6e9e', '站点配置', 'site', '1', '1', '2019-05-26 09:56:05', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('bbfca3575fa94c9b8b8d240291d935d1', '依赖关系管理', 'dependencyadmin', '0', '1', '2019-10-17 13:24:47', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('c51706d688ef439d8fe68b6a73eabed7', 'a1', 'a1', '', null, '2019-05-30 15:50:36', 'root', null, null, '');
INSERT INTO `sys_auth` VALUES ('c6de3ed71f654574b8ccc209ead9120d', '值班任务安排', 'dutytask', '0', '1', '2019-10-17 13:28:11', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('c747db278ca14228ba8094389d7da72a', '故障记录', 'fault', '0', '1', '2019-10-17 13:27:01', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('d8c4f4082e304e519319abcb861fb842', '66', '66', 'e39d167573d24bfe92c1c36a39a78542', '1', '2019-04-30 20:25:09', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('da814c64cd134839a2bcbee5e3d22644', '添加日志记录', 'addlog', '0', '1', '2019-10-21 16:23:12', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('db811d482cea49fa88fd2824bc936018', 't1', 't1', '', '1', '2019-05-30 14:35:52', 'root', null, null, '');
INSERT INTO `sys_auth` VALUES ('dfdd2fd4ced54574a70eca4b079b05d6', 'test10', 'test1', '', '1', '2019-05-30 14:22:22', 'root', null, null, '');
INSERT INTO `sys_auth` VALUES ('e31e3e10121a40c6817be9cc90197b29', '采集分类', 'coltype', 'd7b0c47452754c489d1c669f24197720', '1', '2019-05-29 07:50:51', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('e37e60871848411983f075caddab9ad9', '值班登记', 'dutyreg', '0', '1', '2019-10-17 13:28:47', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('e5f5486e359249dbb16b05f64aa1e4fc', '设备属性配置', 'deviceattrconfig', '0', '1', '2019-10-17 11:51:47', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('ee6c15bd066c4e5daf97933371d34c3d', 'test3153', 'test31', '', '1', '2019-05-30 15:47:38', 'root', null, null, '');
INSERT INTO `sys_auth` VALUES ('f676ce7a5f654554bafab72f9e0bb926', '维修记录', 'repair', '0', '1', '2019-10-17 13:27:33', 'root', null, null, null);
INSERT INTO `sys_auth` VALUES ('f87cb39109e942f9bed5d15be7106a39', '22', '22', '', '0', '2019-05-30 16:03:09', 'root', null, null, '');
INSERT INTO `sys_auth` VALUES ('ffa2a525334f43bf975f8395e43923ff', '权限管理2', 'auth2', '1', '1', '2019-03-21 08:21:28', 'root', null, null, null);

-- ----------------------------
-- Table structure for `sys_company`
-- ----------------------------
DROP TABLE IF EXISTS `sys_company`;
CREATE TABLE `sys_company` (
  `company_id` varchar(32) NOT NULL,
  `area_id` varchar(9) DEFAULT NULL,
  `nid` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL COMMENT '联 系 人',
  `domain` varchar(50) DEFAULT NULL,
  `contact` varchar(32) DEFAULT NULL,
  `introduce` varchar(3000) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL COMMENT '公司地址',
  `main_products` varchar(100) DEFAULT NULL,
  `pic` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_company
-- ----------------------------
INSERT INTO `sys_company` VALUES ('01052118561', '001001', '512', '北京香江月影新能源科技发展有限公司', null, '01052118561', null, '玉带路东街', null, null, '2019-08-20 18:22:16', 'collect');
INSERT INTO `sys_company` VALUES ('01052669976', '006013', '342', '北京枫艺轩装饰设计有限公司', null, '01052669976', null, '北京市朝阳区朝阳区华威桥南联合大厦', null, null, '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_company` VALUES ('02034784556', '019001', '693', '广州市朗贝尔电子科技有限公司', null, '02034784556', null, '大石105国道249号通用商业大厦4楼', null, null, '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_company` VALUES ('02133510117', '009001', '583', '上海龙亚泵阀制造有限公司', null, '02133510117', null, '黄渡工业区春浓路', null, null, '2019-08-20 18:22:30', 'collect');
INSERT INTO `sys_company` VALUES ('02152210370', '009001', '248', '上海丹麟暖通设备工程有限公司', null, '02152210370', null, '沪闵路6666弄37号902室', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('02156957466', '009001', '729', '上海荣珍阀门管件有限公司', null, '02156957466', null, '场中路3823号', null, null, '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_company` VALUES ('02227996795', '002011', '262', '天津市西青区盛发制管厂', null, '02227996795', null, '天津市西青区辛口镇木厂村', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('02259328208', '002001', '167', '天津宏途伟业暖通设备有限公司', null, '02259328208', null, '芦台镇大北工业区', null, null, '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_company` VALUES ('02288630287', '002001', '344', '天津市金顺鑫散热器制造有限公司', null, '02288630287', null, '小站镇北湖村北头', null, null, '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_company` VALUES ('02986492717', '027001', '964', '西安星谊机电设备有限公司', null, '02986492717', null, '西安市未央区北二环辛家庙泰和御景豪庭1号楼2单元402', null, null, '2019-08-20 19:22:47', 'collect');
INSERT INTO `sys_company` VALUES ('02988630938', '027001', '1097', '西安鼎兴自控工程有限公司(网络销售部)', null, '02988630938', null, '中国 陕西 西安市 西安市西门外东光大厦一区5019', null, null, '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_company` VALUES ('03125535066', '003006', '443', '定州市纳鑫电器商行', null, '03125535066', null, '博陵南街', null, null, '2019-08-05 19:02:59', 'collect');
INSERT INTO `sys_company` VALUES ('03167857127', '003010', '441', '霸州市霸州镇瑞达散热器厂', null, '03167857127', null, '霸州开发区', null, null, '2019-08-05 18:59:47', 'collect');
INSERT INTO `sys_company` VALUES ('03174583668', '003009', '260', '沧州亚迪特铸造机械有限公司', null, '03174583668', null, '工业开发区199号', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('03188686660', '003011', '243', '冀州市信诚采暖设备有限公司', null, '03188686660', null, '河北省冀州市大齐村', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('03735063179', '002001', '327', '新乡市奥派暖气片有限公司', null, '03735063179', null, '和平路与南环路交叉口绿地迪亚上郡对面', null, null, '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_company` VALUES ('03783921559', '016002', '1050', '开封市长风水表有限公司', null, '03783921559', null, '鼓楼区南柴屯', null, null, '2019-08-20 19:23:09', 'collect');
INSERT INTO `sys_company` VALUES ('05338018585', '015003', '179', '淄博万家融暖通设备有限公司', null, '05338018585', null, '城北工业园', null, null, '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_company` VALUES ('06346072616', '015001', '305', '山东连云铝业有限公司', null, '06346072616', null, '高庄街道办事处聚仙路98号', null, null, '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_company` VALUES ('07352331960', '018010', '783', '郴州市金旺水塔组装经营部', null, '07352331960', null, '燕泉北路14-28号', null, null, '2019-08-20 18:24:15', 'collect');
INSERT INTO `sys_company` VALUES ('13001474964', '003011', '432', '冀州市福暖多暖气片散热器暖气换散热水器材厂', null, '13001474964', null, '冀州市冀州镇', null, null, '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_company` VALUES ('13002720848', '015006', '517', '韩国电热工程有限公司', null, '13002720848', null, '山东莱阳市盛隆装饰城东门对面韩国电热炕13002720848', null, null, '2019-08-20 18:22:16', 'collect');
INSERT INTO `sys_company` VALUES ('13003619090', '011001', '984', '杭州竞达电子有限公司', null, '13003619090', null, '杭州市杭州市余杭仓前创业路竞达科技园', null, null, '2019-08-20 19:22:49', 'collect');
INSERT INTO `sys_company` VALUES ('13006557169', '015007', '192', '昌邑市鑫源暖通材料厂', null, '13006557169', null, '昌邑市山东省昌邑市', null, null, '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_company` VALUES ('13011223344', '006012', '108', '辽宁毕托巴科技有限公司', null, '13011223344', null, '经济开发区256号', null, null, '2019-08-05 15:40:13', 'collect');
INSERT INTO `sys_company` VALUES ('13011610717', '015003', '182', '魏衍修(个体经营)', null, '13011610717', null, '山东淄博', null, null, '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_company` VALUES ('13013974309', '010003', '175', '徐州晨光工业散热器制造厂', null, '13013974309', null, '三堡刁店工业园区', null, null, '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_company` VALUES ('13022275737', '002001', '603', '天津市新天智能仪表科技有限公司', null, '13022275737', null, '双港开发区惠科路7号', null, null, '2019-08-20 18:22:58', 'collect');
INSERT INTO `sys_company` VALUES ('13022390261', '022001', '812', '重庆金童机电有限公司', null, '13022390261', null, '下石门618号', null, null, '2019-08-20 19:21:34', 'collect');
INSERT INTO `sys_company` VALUES ('13036151645', '017001', '412', '武汉舒适家节能技术有限公司', null, '13036151645', null, '武昌团结大道园林路地铁口武丰佳园15栋2单1503-1504', null, null, '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_company` VALUES ('13046462116', '015007', '68', '潍坊智工电子有限公司', null, '13046462116', null, '山东安丘市和平东路22号', null, null, '2019-08-05 15:39:56', 'collect');
INSERT INTO `sys_company` VALUES ('13049628448', '019001', '1073', '广州德清环保科技有限公司', null, '13049628448', null, '广州市番禺区大石街石南一路1号潮联创业中心829室', null, null, '2019-08-20 19:25:19', 'collect');
INSERT INTO `sys_company` VALUES ('13052678866', '006014', '244', '葫芦岛市连山区晖雅特散热器厂', null, '13052678866', null, '钢屯镇', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('13055152352', '018003', '822', '湘潭雨湖区无塔供水设备厂', null, '13055152352', null, '湘潭市湘潭市砂子岭', null, null, '2019-08-20 19:21:39', 'collect');
INSERT INTO `sys_company` VALUES ('13057783910', '009013', '740', '上海彩康电子有限公司', null, '13057783910', null, '上海市嘉定区安亭镇黄渡工业园区', null, null, '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_company` VALUES ('13059701604', '003011', '256', '河北瀚玖实业有限公司', null, '13059701604', null, '冀州市高新工业区', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('13069543162', '016010', '385', '许昌一达机械制造有限公司', null, '13069543162', null, '许继大道西段霸陵桥东侧', null, null, '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_company` VALUES ('13072275606', '002010', '190', '天津市博尔特建材有限公司', null, '13072275606', null, '天津市东丽区金钟街道南何庄村村北', null, null, '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_company` VALUES ('13078508775', '024001', '922', '贵阳市南明区汇源五金水暖经营部', null, '13078508775', null, '贵阳市南明区贵阳市南明区解放路192号底楼附2号', null, null, '2019-08-20 19:22:41', 'collect');
INSERT INTO `sys_company` VALUES ('13081807766', '003011', '624', '河北华盛节能设备有限公司', null, '13081807766', null, '富强路东侧', null, null, '2019-08-20 18:23:09', 'collect');
INSERT INTO `sys_company` VALUES ('13100112118', '004001', '360', '太原市精诚镁合金科技有限公司', null, '13100112118', null, '山西省太原市清徐县集义乡中辽西村', null, null, '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_company` VALUES ('13110069022', '002016', '196', '芦台经济开发区暖联金属制品厂', null, '13110069022', null, '宁河县芦台经济开发区海北镇东董村', null, null, '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_company` VALUES ('13116342223', '024001', '1065', '贵州沪航阀门管道有限公司', null, '13116342223', null, '贵州沪航阀门管道有限公司', null, null, '2019-08-20 19:23:13', 'collect');
INSERT INTO `sys_company` VALUES ('13129966556', '017016', '990', '武汉科乐特科技有限公司', null, '13129966556', null, '刘口工业园叶河三号路', null, null, '2019-08-20 19:22:50', 'collect');
INSERT INTO `sys_company` VALUES ('13132408383', '003011', '204', '冀州市首春采暖设备销售处', null, '13132408383', null, '城南开发区', null, null, '2019-08-05 17:28:22', 'collect');
INSERT INTO `sys_company` VALUES ('13133583708', '003003', '1087', '秦皇岛天丰贸易有限公司', null, '13133583708', null, '秦皇岛市开发区西环路１２号青龙园区', null, null, '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_company` VALUES ('13136999918', '008008', '969', '佳木斯市远大进出口贸易有限公司', null, '13136999918', null, '长安路420号', null, null, '2019-08-20 19:22:47', 'collect');
INSERT INTO `sys_company` VALUES ('13146009767', '001001', '139', '北京必达信通科技有限公司', null, '13146009767', null, '甘雨胡同20号甘雨商务会馆1105', null, null, '2019-08-05 15:40:18', 'collect');
INSERT INTO `sys_company` VALUES ('13146226588', '001012', '527', '北京艺诺美家地暖装饰设计有限公司', null, '13146226588', null, '顺义新城金蝶软件园A座302', null, null, '2019-08-20 18:22:17', 'collect');
INSERT INTO `sys_company` VALUES ('13146883203', '001014', '410', '北京圣劳伦斯散热器制造有限公司', null, '13146883203', null, '北京市大兴区康庄路28号水晶广场8层', null, null, '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_company` VALUES ('13153660668', '015007', '425', '临朐县鑫亿达金属制品厂', null, '13153660668', null, '型材市场', null, null, '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_company` VALUES ('13156132613', '015001', '1088', '济南中恒商城达华电子器材经营部', null, '13156132613', null, '济南中恒电子电器批发市场三楼8612室', null, null, '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_company` VALUES ('13165550371', '003011', '249', '冀州市昊春暖通设备有限公司', null, '13165550371', null, '工业园区滏阳路顺平街', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('13167366366', '019006', '323', '佛山市太阳花散热器有限公司', null, '13167366366', null, '佛山市广东省佛山市顺德区北窖镇南河路东２号', null, null, '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_company` VALUES ('13173381798', '015001', '358', '姬胜强', null, '13173381798', null, '肥城市山东省肥城市汶阳开发区', null, null, '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_company` VALUES ('13174336700', '007002', '407', '榆树市华龙超导取暖产品有限公司', null, '13174336700', null, '向阳路财产保险公司对过', null, null, '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_company` VALUES ('13176129088', '015009', '48', '山东泰安山衡衡器有限公司', null, '13176129088', null, '泰安市经济开发区', null, null, '2019-08-05 15:39:51', 'collect');
INSERT INTO `sys_company` VALUES ('13179397466', '010011', '460', '镇江新区豪阳电子散热器厂', null, '13179397466', null, '镇江市东郊大路镇', null, null, '2019-08-05 19:50:55', 'collect');
INSERT INTO `sys_company` VALUES ('13180012164', '003011', '438', '枣强县刘后德辉水暖配件厂', null, '13180012164', null, '枣强县枣强县刘后168号', null, null, '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_company` VALUES ('13180568806', '003005', '658', '邢台垠通新能源科技开发有限公司', null, '13180568806', null, '邢台市开发区建业路天山工业园13号', null, null, '2019-08-20 18:24:01', 'collect');
INSERT INTO `sys_company` VALUES ('13181806009', '015009', '43', '泰安市山虎仪表科技有限公司', null, '13181806009', null, '山东省泰安市宁阳县环城科技产业园', null, null, '2019-08-05 15:39:50', 'collect');
INSERT INTO `sys_company` VALUES ('13182457277', '010001', '1040', '兴化市红明不锈钢水箱厂', null, '13182457277', null, '兴化市江苏省兴化市英武北路严家工业区内东侧', null, null, '2019-08-20 19:23:06', 'collect');
INSERT INTO `sys_company` VALUES ('13183233732', '016001', '821', '手握手电子商务有限公司', null, '13183233732', null, '郑州市开发区', null, null, '2019-08-20 19:21:39', 'collect');
INSERT INTO `sys_company` VALUES ('13185093609', '011001', '308', '杭州热家暖通设备有限公司', null, '13185093609', null, '杭州市江干区秋涛北路83号新城市广场B座1816室', null, null, '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_company` VALUES ('13185573657', '011001', '383', '浙江爱水宝管业有限公司', null, '13185573657', null, '诸暨市浙江省诸暨市店口工业区', null, null, '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_company` VALUES ('13185908181', '009015', '291', '宁海县赛跃金属制品有限公司', null, '13185908181', null, '宁海县宁海金山五路26号', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('13194313335', '007002', '373', '吉林省旭东科技有限公司', null, '13194313335', null, '长春市经济开发区长沙路2566号', null, null, '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_company` VALUES ('13207153908', '017001', '121', '湖北轻松仪表设备有限公司', null, '13207153908', null, '藏龙岛拓创产业园', null, null, '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_company` VALUES ('13216633667', '011002', '1036', '宁波国信仪表科技有限公司', null, '13216633667', null, '横街镇桃源村 水表之乡', null, null, '2019-08-20 19:23:05', 'collect');
INSERT INTO `sys_company` VALUES ('13218349339', '010011', '469', '镇江鹏辉电子科技有限公司', null, '13218349339', null, '大路镇闸北', null, null, '2019-08-05 19:50:56', 'collect');
INSERT INTO `sys_company` VALUES ('13218373666', '010011', '456', '镇江市艺源电子有限公司', null, '13218373666', null, '镇江新区大路镇大陆村6队', null, null, '2019-08-05 19:47:19', 'collect');
INSERT INTO `sys_company` VALUES ('13225364666', '015007', '1117', '青州华邦农牧机械装备有限公司', null, '13225364666', null, '青州市经济开发区', null, null, '2019-08-20 19:35:26', 'collect');
INSERT INTO `sys_company` VALUES ('13225471980', '015008', '104', '济宁莱森机电设备有限公司', null, '13225471980', null, '济宁市 高新区红星国际', null, null, '2019-08-05 15:40:11', 'collect');
INSERT INTO `sys_company` VALUES ('13230101955', '003001', '1010', '石家庄盈都环保科技有限公司', null, '13230101955', null, '石家庄赵县高村乡', null, null, '2019-08-20 19:22:56', 'collect');
INSERT INTO `sys_company` VALUES ('13231188067', '003001', '578', '石家庄碧通环保科技有限公司', null, '13231188067', null, '石家庄市联盟西路5号', null, null, '2019-08-20 18:22:29', 'collect');
INSERT INTO `sys_company` VALUES ('13231782358', '003009', '440', '任丘市军乐暖气片厂', null, '13231782358', null, '任丘市任丘市王家务村北', null, null, '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_company` VALUES ('13241665069', '004001', '697', '山西中信科技水表厂', null, '13241665069', null, '牛汇北五街九号', null, null, '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_company` VALUES ('13241985257', '015007', '754', '山东潍微科技股份有限公司', null, '13241985257', null, '青州市邵德南路3789号', null, null, '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_company` VALUES ('13245532000', '011002', '1108', '慈溪市思博特自控设备有限公司', null, '13245532000', null, '慈溪市浙江慈溪', null, null, '2019-08-20 19:35:25', 'collect');
INSERT INTO `sys_company` VALUES ('13255562236', '015002', '219', '李沧区彤润冷暖器材经销处', null, '13255562236', null, '青岛市李沧区青岛市李沧区滨河路1079号', null, null, '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_company` VALUES ('13256553125', '015013', '764', '临沂银江不锈钢水表制造有限公司', null, '13256553125', null, '临沂市临沂市高新技术开发区', null, null, '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_company` VALUES ('13263494981', '006013', '875', '北京华煜科技有限股份公司', null, '13263494981', null, '北京市朝阳区慈云寺住邦2000大厦1座东区19层', null, null, '2019-08-20 19:21:47', 'collect');
INSERT INTO `sys_company` VALUES ('13269868285', '002002', '929', '北京华世金阳智能科技有限公司（天津营销中心）', null, '13269868285', null, '天津市河东区潞城镇后北营3号', null, null, '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_company` VALUES ('13275382171', '015009', '949', '泰安市泰山区盛讯电子有限责任公司', null, '13275382171', null, '泰山区东岳大街东首', null, null, '2019-08-20 19:22:45', 'collect');
INSERT INTO `sys_company` VALUES ('13275890618', '010001', '910', '江苏四晟电子科技有限公司', null, '13275890618', null, '江苏省南京市浦口区威尼斯三街区', null, null, '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_company` VALUES ('13278894986', '018001', '794', '长沙市万博供水设备有限公司', null, '13278894986', null, '雨花区万家丽中路539号', null, null, '2019-08-20 18:24:18', 'collect');
INSERT INTO `sys_company` VALUES ('13282106027', '011001', '90', '杭州米科传感技术有限公司', null, '13282106027', null, '杭州经济技术开发区下沙白杨街道6号大街452号', null, null, '2019-08-05 15:40:04', 'collect');
INSERT INTO `sys_company` VALUES ('13298121357', '016001', '293', '河南领航暖通设备有限公司', null, '13298121357', null, '永平路康平路', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('13301184369', '001011', '281', '欧德宝丰(北京)能源设备有限公司', null, '13301184369', null, '北京市通州区前堰上工业园欧德宝生产基地', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('13302155762', '002012', '838', '天津市金凤来仪科技有限公司', null, '13302155762', null, '天津市津南区', null, null, '2019-08-20 19:21:42', 'collect');
INSERT INTO `sys_company` VALUES ('13303802200', '016007', '245', '新乡市新飞散热器有限公司', null, '13303802200', null, '新乡小店工业园区', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('13305420218', '015002', '265', '青岛金奥博散热器有限公司', null, '13305420218', null, '即墨市即墨辛庄工业园', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('13305912628', '013001', '724', '福州恺力华数码科技有限公司', null, '13305912628', null, '福州市福州市仓山科技园高仕路7号B座5层', null, null, '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_company` VALUES ('13306101369', '010011', '491', '镇江新区鑫海电子散热器厂', null, '13306101369', null, '大路镇冷家村9号', null, null, '2019-08-05 19:51:07', 'collect');
INSERT INTO `sys_company` VALUES ('13306139997', '010005', '199', '苏州荣茂地暖工程有限公司', null, '13306139997', null, '苏州市平江区城北东路1088号 银都商务广场2幢1202室', null, null, '2019-08-05 17:28:21', 'collect');
INSERT INTO `sys_company` VALUES ('13306812396', '011001', '181', '杭州军强机械制造有限公司', null, '13306812396', null, '杭州市杭州市西湖区转塘镇方家畈村163号', null, null, '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_company` VALUES ('13308492481', '018001', '676', '长沙沃野节能科技开发有限公司', null, '13308492481', null, '望城县高塘岭望城大道74号3栋2207', null, null, '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_company` VALUES ('13313080286', '003011', '337', '冀州市超春暖气片有限公司', null, '13313080286', null, '西环路', null, null, '2019-08-05 17:28:33', 'collect');
INSERT INTO `sys_company` VALUES ('13319207709', '027001', '85', '宁波甬港仪表有限公司', null, '13319207709', null, '西安市（太华路延伸线3环内）汇景国际建材城D区3排34-35号', null, null, '2019-08-05 15:40:02', 'collect');
INSERT INTO `sys_company` VALUES ('13319207716', '027001', '103', '西安市未央区永港阀门机电经销处', null, '13319207716', null, '汇景国际建材城D区3排34-35号', null, null, '2019-08-05 15:40:10', 'collect');
INSERT INTO `sys_company` VALUES ('13325888958', '011002', '901', '余姚市盛优铝合金阀门厂', null, '13325888958', null, '余姚市浙江省余姚市梨洲街道黄箭村一高311号', null, null, '2019-08-20 19:21:52', 'collect');
INSERT INTO `sys_company` VALUES ('13327941097', '010003', '528', '徐州四方供水设备有限公司', null, '13327941097', null, '徐州金山桥开发区金桥路21号', null, null, '2019-08-20 18:22:17', 'collect');
INSERT INTO `sys_company` VALUES ('13332099881', '002004', '1023', '天津市金超利达科技有限公司', null, '13332099881', null, '天津市南开区华苑产业园区榕苑路16号综合楼5楼', null, null, '2019-08-20 19:23:03', 'collect');
INSERT INTO `sys_company` VALUES ('13332099898', '002001', '846', '天津市中天电子发展有限公司', null, '13332099898', null, '长青科工贸园区翠泉路3号', null, null, '2019-08-20 19:21:43', 'collect');
INSERT INTO `sys_company` VALUES ('13333716115', '016001', '81', '河南创卓仓储科技有限公司', null, '13333716115', null, '郑州市高新技术开发区电厂路17号乐丁广场2号楼706', null, null, '2019-08-05 15:40:01', 'collect');
INSERT INTO `sys_company` VALUES ('13333832680', '016001', '378', '郑州市融悦科贸有限公司', null, '13333832680', null, '郑州市商都路22号香江市场C区16栋24-26号', null, null, '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_company` VALUES ('13333920366', '016006', '480', '鹤壁市沃德管业有限公司', null, '13333920366', null, '鹤壁市', null, null, '2019-08-05 19:50:59', 'collect');
INSERT INTO `sys_company` VALUES ('13335063019', '015002', '709', '青岛海川环保技术有限公司', null, '13335063019', null, '青岛市青岛市李沧区王家下河村144号', null, null, '2019-08-20 18:24:07', 'collect');
INSERT INTO `sys_company` VALUES ('13336268788', '015014', '1062', '德州鑫溢换热设备有限公司', null, '13336268788', null, '德州市经济技术开发区赵虎镇', null, null, '2019-08-20 19:23:12', 'collect');
INSERT INTO `sys_company` VALUES ('13336685888', '011002', '173', '宁波弘扬暖通制造有限公司', null, '13336685888', null, '宁海县宁海科技园区竹泉路372号', null, null, '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_company` VALUES ('13342060444', '001016', '396', '北京马可波罗建筑工程有限公司', null, '13342060444', null, '北京市怀柔区渤海镇怀沙路536号', null, null, '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_company` VALUES ('13343443022', '017001', '403', '武汉菲斯曼水暖经营部', null, '13343443022', null, '团结大道园林路地铁站武丰佳园15栋2单元1503-1504', null, null, '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_company` VALUES ('13352068972', '002001', '242', '天津泰鸥科技发展有限公司', null, '13352068972', null, '卫国道189号', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('13352903532', '019003', '448', '深圳市特来明科技有限公司', null, '13352903532', null, '嶂背村创业4路汉光科技园3幢5楼', null, null, '2019-08-05 19:47:15', 'collect');
INSERT INTO `sys_company` VALUES ('13354009743', '006002', '880', '大连道盛仪表有限公司', null, '13354009743', null, '红旗街道棠梨沟南工业园区', null, null, '2019-08-20 19:21:48', 'collect');
INSERT INTO `sys_company` VALUES ('13355258539', '015003', '427', '桓台县盛春散热器厂', null, '13355258539', null, '桓台县起凤镇辛泉村工业园', null, null, '2019-08-05 18:50:27', 'collect');
INSERT INTO `sys_company` VALUES ('13357681330', '009015', '1083', '上海顶霸机电有限公司', null, '13357681330', null, '金山区山阳镇向阳4029号', null, null, '2019-08-20 19:35:22', 'collect');
INSERT INTO `sys_company` VALUES ('13358396073', '013002', '554', '厦门市龙腾实业有限公司', null, '13358396073', null, '厦门市厦门市同安工业集中区湖里园38号2层', null, null, '2019-08-20 18:22:23', 'collect');
INSERT INTO `sys_company` VALUES ('13359217663', '027001', '1017', '陕西沃森环保设备有限公司', null, '13359217663', null, '西安市国际港务区华南城E区12街1栋24-26', null, null, '2019-08-20 19:22:57', 'collect');
INSERT INTO `sys_company` VALUES ('13361011596', '015001', '856', '张善伦', null, '13361011596', null, '济南市天桥区蓝翔路时代总部基地', null, null, '2019-08-20 19:21:44', 'collect');
INSERT INTO `sys_company` VALUES ('13361212131', '015002', '980', '胶州市春盛供水设备加工厂', null, '13361212131', null, '青岛胶州市胶州商城网点', null, null, '2019-08-20 19:22:49', 'collect');
INSERT INTO `sys_company` VALUES ('13363322008', '003011', '1058', '衡水衡美水处理设备有限公司', null, '13363322008', null, '新华西路2138号', null, null, '2019-08-20 19:23:10', 'collect');
INSERT INTO `sys_company` VALUES ('13363336688', '003011', '399', '河北金明春暖气片有限公司', null, '13363336688', null, '高新工业园区建设南大街', null, null, '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_company` VALUES ('13366697093', '001006', '240', '北京暖气片批发中心', null, '13366697093', null, '北京市丰台区美克大厦507室', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('13366879233', '001001', '303', '北京金旗舰暖通科技有限公司网络部', null, '13366879233', null, '西三环南路57号', null, null, '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_company` VALUES ('13370333136', '002001', '18', '天津市金凤来仪科技有限公司', null, '13370333136', null, '天津市华苑产业园区榕苑路16号鑫茂产业园综合楼5层', null, null, '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_company` VALUES ('13371566575', '015003', '426', '桓台县起凤镇春江暖气片厂', null, '13371566575', null, '桓台县桓台县起凤镇辛泉工业园', null, null, '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_company` VALUES ('13375381560', '015009', '1057', '泰安中能达电子有限公司', null, '13375381560', null, '泰安市泰山区高新开发区擂鼓石大街', null, null, '2019-08-20 19:23:10', 'collect');
INSERT INTO `sys_company` VALUES ('13377869229', '017001', '1020', '湖北申博泵业有限公司', null, '13377869229', null, '湖北现代五金机电城台商投资区', null, null, '2019-08-20 19:22:59', 'collect');
INSERT INTO `sys_company` VALUES ('13377894726', '017001', '1078', '武汉金榜轻工机械设备有限公司', null, '13377894726', null, '金水闸金康南路1号', null, null, '2019-08-20 19:25:20', 'collect');
INSERT INTO `sys_company` VALUES ('13381133116', '001006', '656', '北京优特鑫达科技有限公司', null, '13381133116', null, '丰台区富丰路2号610', null, null, '2019-08-20 18:24:00', 'collect');
INSERT INTO `sys_company` VALUES ('13382351808', '010006', '16', '南通市万能检测仪器有限公司', null, '13382351808', null, '凤山北路88号', null, null, '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_company` VALUES ('13382766789', '010001', '895', '南京市浦口区福惠阀门销售中心', null, '13382766789', null, '发启装饰城', null, null, '2019-08-20 19:21:51', 'collect');
INSERT INTO `sys_company` VALUES ('13383310613', '001008', '211', '斯美尔吉彩（北京）科技有限公司', null, '13383310613', null, '海淀区', null, null, '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_company` VALUES ('13383869298', '016001', '408', '郑州市管城区小松鼠暖通设备商行', null, '13383869298', null, '河南省郑州市管城区南曹乡', null, null, '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_company` VALUES ('13384911670', '027001', '1043', '陕西亚瀚机电科技有限公司', null, '13384911670', null, '陕西省西安市西咸新区自由贸易试验区沣东新城世纪大道紫气东来1号商住楼3单元0703室', null, null, '2019-08-20 19:23:08', 'collect');
INSERT INTO `sys_company` VALUES ('13385444466', '015014', '253', '禹城市汶鑫金属制品厂', null, '13385444466', null, '禹城市南工业区', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('13388025113', '002016', '310', '天津市宁河县顺平散热器厂', null, '13388025113', null, '天津宁河县', null, null, '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_company` VALUES ('13388802258', '025001', '840', '云南泽润环保科技有限公司', null, '13388802258', null, '西山区前兴路中天融域1－505', null, null, '2019-08-20 19:21:42', 'collect');
INSERT INTO `sys_company` VALUES ('13392218793', '019006', '304', '佛山市南海区里水骏荣五金加工厂', null, '13392218793', null, '佛山市南海区里水甘蕉上街开发区3号', null, null, '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_company` VALUES ('13392767666', '019006', '863', '佛山市南海区大沥航发建材经营部', null, '13392767666', null, '佛山市南海区大沥镇中建博美铝材五金城三路50、52、54、56号', null, null, '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_company` VALUES ('13393235528', '003001', '162', '石家庄品宏商贸有限公司', null, '13393235528', null, '石家庄市桥西区华北商贸城15区14排', null, null, '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_company` VALUES ('13393286561', '003011', '289', '河北冀中志翔科技集团有限责任公司', null, '13393286561', null, '河北 衡水 河北 冀州市 西环路东（双冢段）', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('13395999028', '013002', '1101', '厦门亿科成电子有限公司', null, '13395999028', null, '天安工业区4号厂房', null, null, '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_company` VALUES ('13401906228', '010001', '1006', '南京市雨花台区泽哲水暖销售中心', null, '13401906228', null, '南京市雨花台区板桥红太阳B8-212号', null, null, '2019-08-20 19:22:56', 'collect');
INSERT INTO `sys_company` VALUES ('13403176711', '003009', '380', '张晓诺（个体经营）', null, '13403176711', null, '中国河北沧州任丘', null, null, '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_company` VALUES ('13403185928', '003011', '367', '枣强鑫亿器件厂', null, '13403185928', null, '衡水市衡水', null, null, '2019-08-05 17:28:36', 'collect');
INSERT INTO `sys_company` VALUES ('13403189870', '003011', '389', '冀州市鑫程祥散热器有限公司', null, '13403189870', null, '冀码路工业区', null, null, '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_company` VALUES ('13405366861', '015007', '180', '山东隆泰暖通空调设备有限公司', null, '13405366861', null, '山东省高密市经济开发区曙光路东瑞源街106号', null, null, '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_company` VALUES ('13412066881', '019017', '30', '东莞市晟鼎精密仪器有限公司', null, '13412066881', null, '东莞市长安镇智能产业园振伟路6A号二楼', null, null, '2019-08-05 15:39:44', 'collect');
INSERT INTO `sys_company` VALUES ('13412442617', '019017', '95', '东莞七彩仪器设备有限公司', null, '13412442617', null, '东莞市莞城街道元岭路国汇大厦306室', null, null, '2019-08-05 15:40:05', 'collect');
INSERT INTO `sys_company` VALUES ('13423631415', '019001', '496', '广州市悦邦金属制品有限公司', null, '13423631415', null, '广东省广州市番禺区石基镇塱边工业园', null, null, '2019-08-05 19:51:12', 'collect');
INSERT INTO `sys_company` VALUES ('13423966800', '019003', '566', '富聚水表科技(深圳)有限公司', null, '13423966800', null, '深圳市宝安区观澜镇牛湖老二村兴业路85号', null, null, '2019-08-20 18:22:26', 'collect');
INSERT INTO `sys_company` VALUES ('13428971870', '019003', '124', '深圳市欧信高科科技有限公司', null, '13428971870', null, '深圳市南山区科技园科华路5号珠园大厦', null, null, '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_company` VALUES ('13431151088', '019017', '1082', '东莞市进创智能科技有限公司经营部', null, '13431151088', null, '中国 广东 东莞市 南城区科技大道中信新天地5栋37号首层', null, null, '2019-08-20 19:35:22', 'collect');
INSERT INTO `sys_company` VALUES ('13439017000', '001001', '1100', '北京纬鑫机电有限公司', null, '13439017000', null, '明珠商务办公基地C座1010', null, null, '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_company` VALUES ('13439885262', '001016', '208', '北京桃成蹊鲁信商贸有限公司', null, '13439885262', null, '北京市怀柔区开放路113号南四层409室', null, null, '2019-08-05 17:28:22', 'collect');
INSERT INTO `sys_company` VALUES ('13454675388', '011010', '1120', '温岭福莱尔工贸有限公司', null, '13454675388', null, '中国 浙江 温岭市 泽国镇珠山工业区', null, null, '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_company` VALUES ('13456188338', '011002', '713', '慈溪远传仪表科技有限公司', null, '13456188338', null, '慈溪市慈溪市掌起镇工业园区环城西路62号(严禁一切假发票推销骚乱！！）', null, null, '2019-08-20 18:24:07', 'collect');
INSERT INTO `sys_company` VALUES ('13460778000', '016002', '716', '开封豫洋供水设备有限公司', null, '13460778000', null, '开封市禹王台区汪屯工业园', null, null, '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_company` VALUES ('13463183908', '003011', '405', '冀州市恒纳采暖设备厂', null, '13463183908', null, '河北省冀州市城南工业区', null, null, '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_company` VALUES ('13466657733', '001001', '99', '北京盛世昌华科技有限公司', null, '13466657733', null, '中关村科技园仁和路4号', null, null, '2019-08-05 15:40:07', 'collect');
INSERT INTO `sys_company` VALUES ('13466745994', '001001', '771', '北京慧怡水表厂', null, '13466745994', null, '北京市北京智能水表厂北京插卡水表厂北京IC卡水表厂', null, null, '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_company` VALUES ('13472184499', '003001', '168', '石家庄圆邦散热器有限公司', null, '13472184499', null, '藁城市机场路杨马村经济开发区刘家佐村南', null, null, '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_company` VALUES ('13472517931', '009012', '694', '上海飘香冷暖设备有限公司', null, '13472517931', null, '上海松江区九亭镇涞坊路271号', null, null, '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_company` VALUES ('13473836120', '003011', '439', '冀州市春风进出口有限责任公司', null, '13473836120', null, '刘海华', null, null, '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_company` VALUES ('13475500488', '015003', '421', '桓台县起凤镇金城散热器厂', null, '13475500488', null, '桓台县起凤镇辛泉村', null, null, '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_company` VALUES ('13483708669', '003011', '209', '衡水市金旭采暖设备有限公司', null, '13483708669', null, '衡水市金旭采暖设备有限公司', null, null, '2019-08-05 17:28:22', 'collect');
INSERT INTO `sys_company` VALUES ('13487585323', '018001', '997', '湖南中赢环保设备有限公司', null, '13487585323', null, '香樟路255号云集大厦13层1302房', null, null, '2019-08-20 19:22:51', 'collect');
INSERT INTO `sys_company` VALUES ('13488709752', '001001', '1003', '北京慧怡顺水水表厂', null, '13488709752', null, '牛栏山工业区', null, null, '2019-08-20 19:22:54', 'collect');
INSERT INTO `sys_company` VALUES ('13501291669', '001015', '1074', '北京京海恒隆科技开发有限公司', null, '13501291669', null, '平谷镇平翔路2排2号', null, null, '2019-08-20 19:25:19', 'collect');
INSERT INTO `sys_company` VALUES ('13502141333', '002016', '195', '天津市联盛工贸有限公司', null, '13502141333', null, '宁河县天津市宁河县大北镇独立工业区', null, null, '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_company` VALUES ('13503171979', '003009', '429', '任丘市力普采暖设备厂', null, '13503171979', null, '任丘市于村东黄里工业区', null, null, '2019-08-05 18:58:08', 'collect');
INSERT INTO `sys_company` VALUES ('13503189938', '003011', '270', '冀州市虹阳散热器有限责任公司', null, '13503189938', null, '河北省冀州市冀州镇彭村开发区018号', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('13503507366', '004001', '229', '清徐县北录树永胜暖气片有限公司', null, '13503507366', null, '清徐县王答乡北录树村', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('13503736538', '016007', '217', '长垣县顺通暖气片厂', null, '13503736538', null, '樊相工业园区', null, null, '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_company` VALUES ('13505338625', '015003', '381', '桓台县纵横铸管厂', null, '13505338625', null, '桓台县山东淄博桓台开发区', null, null, '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_company` VALUES ('13505341362', '015014', '1063', '德州鑫溢换热设备有限公司', null, '13505341362', null, '山东省德州市经济技术开发区赵虎镇韩春村23-13-081', null, null, '2019-08-20 19:23:13', 'collect');
INSERT INTO `sys_company` VALUES ('13506395998', '015002', '732', '青岛福灵水暖阀门批发部', null, '13506395998', null, '青岛市城阳区重庆北路304号', null, null, '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_company` VALUES ('13506840095', '011002', '531', '宁波江北新浪仪表配件有限公司', null, '13506840095', null, '宁波市江北区宁波市江北甬江工业园振甬路178号', null, null, '2019-08-20 18:22:18', 'collect');
INSERT INTO `sys_company` VALUES ('13507432162', '018001', '674', '湖南华振供水设备有限公司', null, '13507432162', null, '长沙市雨花区湘府东路二段517号红星国际大厦28层', null, null, '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_company` VALUES ('13508895017', '025001', '532', '云南格兰工业发展有限公司', null, '13508895017', null, '里山工业园区', null, null, '2019-08-20 18:22:18', 'collect');
INSERT INTO `sys_company` VALUES ('13508965099', '015007', '355', '昌邑市鑫超散热器厂', null, '13508965099', null, '围子镇田家村', null, null, '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_company` VALUES ('13510014165', '019003', '1103', '深圳市华钜丰科技有限公司（销售部）', null, '13510014165', null, '西乡新安二工业区汇潮工业园C栋2楼', null, null, '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_company` VALUES ('13510206893', '019003', '505', '深圳市兴明星包装材料有限公司', null, '13510206893', null, '龙华新区大浪街道罗屋围第三工业区14栋', null, null, '2019-08-05 19:51:14', 'collect');
INSERT INTO `sys_company` VALUES ('13512278084', '002016', '259', '天津市华锐暖家散热器厂', null, '13512278084', null, '天津宁河经济技术开发（芦台）天津.宁河县宁河县芦台镇王前村', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('13512451228', '002004', '7', '天津新天智能仪表科技有限公司', null, '13512451228', null, '天津市南开区华苑产业园区榕苑路15号鑫茂科技园军民园1号楼B座2107室', null, null, '2019-08-05 15:39:41', 'collect');
INSERT INTO `sys_company` VALUES ('13512562268', '010003', '680', '徐州润物科技发展有限公司', null, '13512562268', null, '大庙工业园汇金路5号', null, null, '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_company` VALUES ('13513082737', '003011', '319', '冀州市冀上采暖设备有限公司', null, '13513082737', null, '彭村工业区', null, null, '2019-08-05 17:28:29', 'collect');
INSERT INTO `sys_company` VALUES ('13513278598', '031001', '705', '乌鲁木齐市米东区翼新恒亚五金经销部', null, '13513278598', null, '新疆乌鲁木齐市米东区米东中路1969号', null, null, '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_company` VALUES ('13515415157', '015001', '533', '济南泽宇机电设备有限公司', null, '13515415157', null, '济南市历城区济南市历城区王舍人镇幸福柳工业园开源路中段', null, null, '2019-08-20 18:22:18', 'collect');
INSERT INTO `sys_company` VALUES ('13516801191', '011001', '404', '杭州日新人工环境工程有限公司', null, '13516801191', null, '花园岗街168号易构大厦2-1506', null, null, '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_company` VALUES ('13516974704', '011007', '899', '金华市亚欣金属材料有限公司', null, '13516974704', null, '国际商贸城二区F4-19076', null, null, '2019-08-20 19:21:51', 'collect');
INSERT INTO `sys_company` VALUES ('13520203824', '001013', '276', '北京智鑫科贸有限公司', null, '13520203824', null, '北京市昌平区阳坊镇西贯市后街9号', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('13520288455', '001006', '588', '北京赛博伟业水处理设备有限公司', null, '13520288455', null, '北京市丰台区北京市丰台区南三环西路41号', null, null, '2019-08-20 18:22:32', 'collect');
INSERT INTO `sys_company` VALUES ('13520678759', '001012', '1025', '北京慧怡水表有限责任公司', null, '13520678759', null, '北京市顺义区牛栏山工业区', null, null, '2019-08-20 19:23:03', 'collect');
INSERT INTO `sys_company` VALUES ('13522369726', '001001', '279', '北京固源瑞禾农业设备有限公司', null, '13522369726', null, '北京市亦庄开发区景园北街2号院66号楼1203室', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('13523978012', '001006', '908', '北京市优特鑫达科技有限公司', null, '13523978012', null, '北京市丰台区星火科技大厦501', null, null, '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_company` VALUES ('13524171112', '009010', '761', '上海水务建设工程有限公司', null, '13524171112', null, '上海市闸北区沪太路815号', null, null, '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_company` VALUES ('13524828598', '009012', '1052', '上海倍拉机械设备有限公司', null, '13524828598', null, '上海市松江区银都西路215号B栋217', null, null, '2019-08-20 19:23:10', 'collect');
INSERT INTO `sys_company` VALUES ('13525003679', '016007', '452', '卫辉市众力散热器有限公司', null, '13525003679', null, '河南省卫辉市太公路东头段', null, null, '2019-08-05 19:47:17', 'collect');
INSERT INTO `sys_company` VALUES ('13525518819', '016001', '273', '远征智能电器有限公司', null, '13525518819', null, '郑州市金水区河南省郑州市经三路55号', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('13527675789', '019001', '608', '广州蓝林机电设备有限公司', null, '13527675789', null, '天河区黄村东路35号启星商务中心B区B座222室', null, null, '2019-08-20 18:23:01', 'collect');
INSERT INTO `sys_company` VALUES ('13530311890', '019003', '820', '深圳市捷先数码科技有限公司', null, '13530311890', null, '中山园路1001号国际E城E4栋2层', null, null, '2019-08-20 19:21:38', 'collect');
INSERT INTO `sys_company` VALUES ('13533088301', '019001', '509', '广州市通华达电器有限公司', null, '13533088301', null, '中国 广东 广州市 广州市荔湾区茶滘万兴街', null, null, '2019-08-05 19:52:06', 'collect');
INSERT INTO `sys_company` VALUES ('13537413488', '019017', '937', '东莞市涌泉供水设备有限公司', null, '13537413488', null, '黄江合路工业区', null, null, '2019-08-20 19:22:43', 'collect');
INSERT INTO `sys_company` VALUES ('13542580731', '015001', '83', '济南艾索电力科技有限公司', null, '13542580731', null, '济南市济阳县龙泰电子商务创业园', null, null, '2019-08-05 15:40:02', 'collect');
INSERT INTO `sys_company` VALUES ('13543266821', '019003', '466', '深圳市蜀易腾科技有限公司', null, '13543266821', null, '福永镇新田社区新田大道一巷28号A栋', null, null, '2019-08-05 19:50:56', 'collect');
INSERT INTO `sys_company` VALUES ('13545126583', '017001', '57', '湖北中科万成电子有限公司', null, '13545126583', null, '湖北省武汉市中南一路3#嘉园大厦2号楼7楼', null, null, '2019-08-05 15:39:53', 'collect');
INSERT INTO `sys_company` VALUES ('13548670698', '018001', '648', '长沙恒信供水设备有限公司', null, '13548670698', null, '长沙市雨花区中意一路66号亚商大厦2栋1833号', null, null, '2019-08-20 18:23:57', 'collect');
INSERT INTO `sys_company` VALUES ('13551180882', '023001', '241', '成都市金牛区华建机电阀门经营部', null, '13551180882', null, '成都市成都市万贯五金机电城B区13栋6号', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('13551181528', '023001', '546', '成都天府水表实业有限公司', null, '13551181528', null, '郫县石亭村1号', null, null, '2019-08-20 18:22:21', 'collect');
INSERT INTO `sys_company` VALUES ('13552377273', '001006', '551', '北京古登京源建材有限公司', null, '13552377273', null, '北京市丰台区北京.丰台区马家楼京开建材市场南区N道23号', null, null, '2019-08-20 18:22:23', 'collect');
INSERT INTO `sys_company` VALUES ('13553172561', '015001', '514', '天桥区文杰洗衣机配件经营部', null, '13553172561', null, '山东济南豪鲁大厦3003号', null, null, '2019-08-20 18:22:16', 'collect');
INSERT INTO `sys_company` VALUES ('13556067492', '019001', '924', '广州瑞桦商贸发展有限公司', null, '13556067492', null, '新港西路11号富力千禧商务中心810', null, null, '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_company` VALUES ('13562678195', '015007', '833', '山东川一水处理设备机械有限公司', null, '13562678195', null, '青州市益都路369号', null, null, '2019-08-20 19:21:40', 'collect');
INSERT INTO `sys_company` VALUES ('13563637216', '015007', '468', '奎文区东关汇丰柴油机配件经销处', null, '13563637216', null, '潍坊市奎文区潍州路北王国际汽配城16号楼2-06', null, null, '2019-08-05 19:50:56', 'collect');
INSERT INTO `sys_company` VALUES ('13563677929', '015007', '193', '昌邑市围子镇朝辉散热器厂', null, '13563677929', null, '昌邑市围子镇苑家庄', null, null, '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_company` VALUES ('13563923131', '015013', '672', '临沂市兰山区泉翔水表厂', null, '13563923131', null, '兰山区白沙埠镇', null, null, '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_company` VALUES ('13564228488', '009012', '548', '上海龙亚泵阀制造有限公司', null, '13564228488', null, '上海市松江区小昆山经济区崇南公路435弄20号', null, null, '2019-08-20 18:22:22', 'collect');
INSERT INTO `sys_company` VALUES ('13566473317', '011010', '1085', '台州新威乐机电有限公司', null, '13566473317', null, '大溪念母洋工业区', null, null, '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_company` VALUES ('13566615922', '011002', '869', '慈溪市泰德金属制品厂', null, '13566615922', null, '逍林镇樟新路东侧', null, null, '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_company` VALUES ('13566658905', '011010', '518', '台州时绮阀门有限公司', null, '13566658905', null, '古城杨家村工业区', null, null, '2019-08-20 18:22:16', 'collect');
INSERT INTO `sys_company` VALUES ('13566858568', '011010', '255', '玉环艾丁机械制造有限公司', null, '13566858568', null, '楚门龙溪小山外', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('13569899511', '016007', '347', '长垣县舒尔康暖气片厂', null, '13569899511', null, '新乡市蒲北开发区', null, null, '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_company` VALUES ('13573143202', '015001', '11', '济南普赛通信技术有限公司', null, '13573143202', null, '山东省济南市高新区颖秀路2766号留学人员创业园南楼四楼', null, null, '2019-08-05 15:39:41', 'collect');
INSERT INTO `sys_company` VALUES ('13573327999', '015003', '645', '淄博物华机电物资有限公司', null, '13573327999', null, '张店东二路都市家园', null, null, '2019-08-20 18:23:55', 'collect');
INSERT INTO `sys_company` VALUES ('13573359276', '015003', '257', '桓台县起凤镇鑫海散热器厂', null, '13573359276', null, '起凤镇乌河村', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('13573608567', '015007', '493', '潍坊科扬电器有限公司', null, '13573608567', null, '山东省潍坊市昌乐县东村街8号', null, null, '2019-08-05 19:51:08', 'collect');
INSERT INTO `sys_company` VALUES ('13574898623', '018001', '593', '长沙通德供水设备有限公司', null, '13574898623', null, '长沙芙蓉区人民东路111-115号', null, null, '2019-08-20 18:22:37', 'collect');
INSERT INTO `sys_company` VALUES ('13578914787', '007002', '390', '吉林省旭东科技有限公司', null, '13578914787', null, '吉林省长春市二道区英俊乡长江集团5688号', null, null, '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_company` VALUES ('13581891221', '001008', '331', '北京罗奇顿散热器有限公司', null, '13581891221', null, '北京市海淀区信息路甲28号C座 （二层）02B-077号', null, null, '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_company` VALUES ('13582003001', '003001', '934', '石家庄宇泉环保设备有限公司', null, '13582003001', null, '石家庄桥西区友谊南大街122号振头大厦', null, null, '2019-08-20 19:22:43', 'collect');
INSERT INTO `sys_company` VALUES ('13582713066', '003009', '235', '任丘市旭升采暖设备厂', null, '13582713066', null, '于村乡前王约村', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('13583276687', '015002', '568', '青岛亿加高机械设备工程有限公司', null, '13583276687', null, '即墨大信', null, null, '2019-08-20 18:22:26', 'collect');
INSERT INTO `sys_company` VALUES ('13583388712', '015003', '451', '张店鑫源冷暖风机厂', null, '13583388712', null, '联通路', null, null, '2019-08-05 19:47:16', 'collect');
INSERT INTO `sys_company` VALUES ('13583617977', '015007', '251', '临朐县鑫玘采暖器有限公司', null, '13583617977', null, '东城区东五路与朐阳路交叉口', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('13583803781', '015009', '837', '山东东岳智能水电表科技有限公司', null, '13583803781', null, '山东省泰安市城东开发区', null, null, '2019-08-20 19:21:41', 'collect');
INSERT INTO `sys_company` VALUES ('13583900039', '015013', '287', '中德合资天津御马散热器临沂专营店', null, '13583900039', null, '临西五路水暖市场81号', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('13583994199', '015013', '560', '临沂金海仪表制造有限公司', null, '13583994199', null, '临沂市兰山区白沙埠镇', null, null, '2019-08-20 18:22:25', 'collect');
INSERT INTO `sys_company` VALUES ('13585966770', '009001', '1128', '上海柳嘉山机电设备有限公司', null, '13585966770', null, '龙东大道5401弄25号202室', null, null, '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_company` VALUES ('13586520837', '011002', '707', '宁波乐力仪表有限公司', null, '13586520837', null, '宁波市中兴路762号开丰大厦1006室', null, null, '2019-08-20 18:24:07', 'collect');
INSERT INTO `sys_company` VALUES ('13587977112', '011003', '702', '永嘉县瓯北镇华众泵阀厂', null, '13587977112', null, '永嘉县瓯北镇林垟北路4号', null, null, '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_company` VALUES ('13589231208', '015002', '197', '即墨市瑞泰散热器厂', null, '13589231208', null, '环秀办事处国家泊子村', null, null, '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_company` VALUES ('13589549193', '015003', '387', '桓台县唐山镇晨曦太阳能热水器加工厂', null, '13589549193', null, '桓台县唐山镇前七村', null, null, '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_company` VALUES ('13589823308', '015006', '423', '莱州同信设备有限公司', null, '13589823308', null, '莱州市开发区恒通路8号', null, null, '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_company` VALUES ('13592513682', '016001', '130', '新天科技股份有限公司', null, '13592513682', null, '高新区国槐街19号', null, null, '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_company` VALUES ('13592717028', '019017', '804', '东莞市博迩迈环保科技有限公司', null, '13592717028', null, '东莞市东莞市横沥镇东环路62号', null, null, '2019-08-20 19:06:49', 'collect');
INSERT INTO `sys_company` VALUES ('13600071836', '019001', '981', '广州市越秀区普兰特制冷设备配件经营部', null, '13600071836', null, '广州市越秀区海珠北路212号高格美冷冻配件采购中心A区2012室', null, null, '2019-08-20 19:22:49', 'collect');
INSERT INTO `sys_company` VALUES ('13600318477', '019006', '483', '佛山市昱麟精密金属制品有限公司', null, '13600318477', null, '南海区狮山镇颜峰大道工业区1-2', null, null, '2019-08-05 19:51:00', 'collect');
INSERT INTO `sys_company` VALUES ('13601216595', '001012', '1009', '北京慧怡工贸有限责任公司', null, '13601216595', null, '顺义区牛山工业区牛汇路北5街9号', null, null, '2019-08-20 19:22:56', 'collect');
INSERT INTO `sys_company` VALUES ('13601296863', '001012', '844', '北京慧怡水表工贸有限公司', null, '13601296863', null, '北京市顺义牛栏山牛汇路', null, null, '2019-08-20 19:21:42', 'collect');
INSERT INTO `sys_company` VALUES ('13601363275', '001013', '974', '北京信远通环境工程技术有限责任公司', null, '13601363275', null, '北京市昌平区十三陵镇西山口工业园', null, null, '2019-08-20 19:22:48', 'collect');
INSERT INTO `sys_company` VALUES ('13602079688', '002009', '1035', '天津市天一净源水处理设备有限公司', null, '13602079688', null, '天津市大港油田创新路北8号', null, null, '2019-08-20 19:23:05', 'collect');
INSERT INTO `sys_company` VALUES ('13602137929', '002004', '28', '天津市金凤来仪科技有限公司', null, '13602137929', null, '天津市南开区榕苑路16号鑫茂科技园民营园综合楼', null, null, '2019-08-05 15:39:43', 'collect');
INSERT INTO `sys_company` VALUES ('13602265655', '019001', '569', '广州方韩仪器有限公司运营部', null, '13602265655', null, '广州市番禺区东环路429号', null, null, '2019-08-20 18:22:26', 'collect');
INSERT INTO `sys_company` VALUES ('13603037344', '019003', '739', '深圳市凯路创新科技有限公司', null, '13603037344', null, '宝安区固戍明金海工业区E栋三楼', null, null, '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_company` VALUES ('13603172964', '003009', '263', '任丘市中宽采暖设备厂', null, '13603172964', null, '于村工业区', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('13603185879', '003011', '379', '河北万德暖通设备有限公司', null, '13603185879', null, '冀州区周胡创业园', null, null, '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_company` VALUES ('13603225148', '003006', '349', '河北祥和冷暖设备有限公司', null, '13603225148', null, '保定市固城南店', null, null, '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_company` VALUES ('13605330363', '015003', '183', '桓台县起凤镇永盛器材厂', null, '13605330363', null, '淄博桓台（永盛暖气片厂）', null, null, '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_company` VALUES ('13606367480', '015007', '536', '青州百川水设备有限公司', null, '13606367480', null, '青州市经济开发区亚东街2399号', null, null, '2019-08-20 18:22:18', 'collect');
INSERT INTO `sys_company` VALUES ('13606461107', '015007', '336', '高密市利尔暖通空调设备有限公司', null, '13606461107', null, '高密市高密市醴泉工业园', null, null, '2019-08-05 17:28:33', 'collect');
INSERT INTO `sys_company` VALUES ('13606743158', '011002', '760', '宁波通球电子科技有限公司', null, '13606743158', null, '慈溪市附海家电园区', null, null, '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_company` VALUES ('13606746366', '011002', '543', '宁波市海州表业有限公司', null, '13606746366', null, '宁波市慈溪市新浦镇四塘江东路65号', null, null, '2019-08-20 18:22:20', 'collect');
INSERT INTO `sys_company` VALUES ('13607446773', '018001', '1080', '长沙威航新能源技术有限公司', null, '13607446773', null, '长沙高新开发区桐梓坡西路229号金泓园孵化大楼', null, null, '2019-08-20 19:25:21', 'collect');
INSERT INTO `sys_company` VALUES ('13608980122', '015002', '73', '青岛华能远见电气有限公司', null, '13608980122', null, '南京路27号', null, null, '2019-08-05 15:39:59', 'collect');
INSERT INTO `sys_company` VALUES ('13611465050', '019001', '580', '广州市冠沃阀门有限公司', null, '13611465050', null, '洪生.）', null, null, '2019-08-20 18:22:30', 'collect');
INSERT INTO `sys_company` VALUES ('13613069518', '019003', '105', '深圳鼎智达表计信息科技有限公司', null, '13613069518', null, '43区新安街道鸿都商务大厦A座', null, null, '2019-08-05 15:40:11', 'collect');
INSERT INTO `sys_company` VALUES ('13613129682', '003006', '153', '保定德恩普环保科技有限公司', null, '13613129682', null, '保定市新市区秀兰城市美居', null, null, '2019-08-05 17:28:17', 'collect');
INSERT INTO `sys_company` VALUES ('13613241569', '001006', '320', '北京金旗舰暖通科技有限公司', null, '13613241569', null, '丰台区丽泽桥南', null, null, '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_company` VALUES ('13619287288', '027001', '82', '西安市未央区永港阀门机电经销处', null, '13619287288', null, '西安市（太华路延伸线三环内）汇景国际建材城D区3排34-35号', null, null, '2019-08-05 15:40:01', 'collect');
INSERT INTO `sys_company` VALUES ('13623388006', '003011', '402', '河北嘉奥采暖设备有限公司', null, '13623388006', null, '衡水市冀州区冀州镇柳家寨村西', null, null, '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_company` VALUES ('13623883474', '016003', '743', '洛阳东龙机械设备有限公司', null, '13623883474', null, '洛阳市洛龙区李楼乡穆庄村聶西路', null, null, '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_company` VALUES ('13625316474', '015009', '861', '肥城市利林环保设备有限公司', null, '13625316474', null, '汶阳镇汶东工业区', null, null, '2019-08-20 19:21:45', 'collect');
INSERT INTO `sys_company` VALUES ('13625847113', '011002', '393', '谌宏玲', null, '13625847113', null, '浙江宁波慈溪新浦西工业园区', null, null, '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_company` VALUES ('13628980441', '017001', '92', '武汉骁仪科技有限公司', null, '13628980441', null, '湖北省武汉市光谷一路统建天成美雅7-204#', null, null, '2019-08-05 15:40:05', 'collect');
INSERT INTO `sys_company` VALUES ('13629243523', '027001', '960', '陕西荣琦环保科技有限公司', null, '13629243523', null, '西关正街198号', null, null, '2019-08-20 19:22:46', 'collect');
INSERT INTO `sys_company` VALUES ('13631726855', '019017', '29', '东莞市利拓检测仪器有限公司', null, '13631726855', null, '东莞市长安镇上角社区青龙东街2号厂房', null, null, '2019-08-05 15:39:43', 'collect');
INSERT INTO `sys_company` VALUES ('13631798117', '019017', '453', '东莞迅阳实业有限公司', null, '13631798117', null, '东莞市石排镇赤坎工业区', null, null, '2019-08-05 19:47:17', 'collect');
INSERT INTO `sys_company` VALUES ('13632188758', '019001', '830', '广州方韩仪器有限公司', null, '13632188758', null, '东环路429号', null, null, '2019-08-20 19:21:40', 'collect');
INSERT INTO `sys_company` VALUES ('13632212021', '019001', '683', '广州路加环保科技有限公司', null, '13632212021', null, '保利大都汇A3写字楼', null, null, '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_company` VALUES ('13632428828', '019001', '746', '卓森岩', null, '13632428828', null, '广州市番禺区洛溪新城洛湖居19-2-304', null, null, '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_company` VALUES ('13636404042', '015017', '834', '上海水表厂(有限)公司', null, '13636404042', null, '杨高南路4099号东明五金市场7幢38号', null, null, '2019-08-20 19:21:41', 'collect');
INSERT INTO `sys_company` VALUES ('13641118671', '006013', '541', '海鸥卫浴（Edison增压宝营销中心）', null, '13641118671', null, '北京市朝阳区酒仙桥路14号兆维科技园A区2号楼2门2层', null, null, '2019-08-20 18:22:19', 'collect');
INSERT INTO `sys_company` VALUES ('13648861607', '025001', '1047', '昆明市西山区恒太五金经营部', null, '13648861607', null, '大板桥', null, null, '2019-08-20 19:23:09', 'collect');
INSERT INTO `sys_company` VALUES ('13651081364', '001014', '274', '北京东方维拉科技有限公司', null, '13651081364', null, '北京市大兴区北京市大兴工业园区', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('13651597807', '010009', '627', '盐城联成供水设备有限公司', null, '13651597807', null, '建湖县民营科技创业园建宝北路53号', null, null, '2019-08-20 18:23:10', 'collect');
INSERT INTO `sys_company` VALUES ('13652018381', '002001', '400', '天津市亚格利散热器有限公司', null, '13652018381', null, '别山镇八里铺工业园区', null, null, '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_company` VALUES ('13652561206', '019017', '75', '东莞市长安择旺电子工具经营部', null, '13652561206', null, '东莞市长安镇上沙社区中富街3号之一', null, null, '2019-08-05 15:40:00', 'collect');
INSERT INTO `sys_company` VALUES ('13655280083', '010011', '449', '丹阳市稳源光电有限公司', null, '13655280083', null, '延陵镇五星村张庄', null, null, '2019-08-05 19:47:15', 'collect');
INSERT INTO `sys_company` VALUES ('13656662572', '011001', '371', '杭州东鼎暖通设备有限公司', null, '13656662572', null, '杭州市艮山西路78号东门大厦12BH', null, null, '2019-08-05 17:28:36', 'collect');
INSERT INTO `sys_company` VALUES ('13658047776', '023001', '501', '成都西河散热器厂', null, '13658047776', null, '成都市西河工业园区429号', null, null, '2019-08-05 19:51:13', 'collect');
INSERT INTO `sys_company` VALUES ('13658678188', '015002', '69', '青岛海威茨仪表有限公司', null, '13658678188', null, '崂山区株洲路153号', null, null, '2019-08-05 15:39:56', 'collect');
INSERT INTO `sys_company` VALUES ('13660226096', '019001', '866', '广州市乐净环保设备有限公司', null, '13660226096', null, '南洲北路燕安二街2-238号', null, null, '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_company` VALUES ('13662294557', '019003', '516', '深圳众业自控设备有限公司', null, '13662294557', null, '深圳市罗湖区宝安广场一楼', null, null, '2019-08-20 18:22:16', 'collect');
INSERT INTO `sys_company` VALUES ('13662998504', '019017', '497', '东莞市金戈电气科技有限公司', null, '13662998504', null, '黄江镇鸡啼岗村公园一巷11号A', null, null, '2019-08-05 19:51:12', 'collect');
INSERT INTO `sys_company` VALUES ('13663386040', '003011', '431', '冀州市冀宏散热器厂', null, '13663386040', null, '冀州市冀州镇后堤圈村', null, null, '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_company` VALUES ('13667396263', '018001', '787', '长沙中梁供水设备有限公司', null, '13667396263', null, '长沙市岳麓区合能洋湖公馆二期二栋1303', null, null, '2019-08-20 18:24:16', 'collect');
INSERT INTO `sys_company` VALUES ('13671536383', '009012', '745', '高子龙', null, '13671536383', null, '松江', null, null, '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_company` VALUES ('13674990378', '016001', '1122', '河南省拓联自控电子有限公司', null, '13674990378', null, '郑州市高新技术开发区', null, null, '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_company` VALUES ('13676588960', '011003', '795', '永嘉县山川泵阀厂', null, '13676588960', null, '浙江温州市东瓯工业区（堡二工业园）', null, null, '2019-08-20 18:24:18', 'collect');
INSERT INTO `sys_company` VALUES ('13676703153', '009001', '841', '上海战泉机电设备制造有限公司', null, '13676703153', null, '青高路368号3棟1755室', null, null, '2019-08-20 19:21:42', 'collect');
INSERT INTO `sys_company` VALUES ('13677360572', '018001', '859', '湖南供水设备有限公司', null, '13677360572', null, '雨花区中意一路66号', null, null, '2019-08-20 19:21:44', 'collect');
INSERT INTO `sys_company` VALUES ('13678680235', '015009', '553', '泰安宏达电子智能科技有限公司', null, '13678680235', null, '泰安市', null, null, '2019-08-20 18:22:23', 'collect');
INSERT INTO `sys_company` VALUES ('13679083094', '023001', '814', '四川凯扬立方供水设备有限公司', null, '13679083094', null, '成都市苏坡立交桥IT大道口金辉路51号', null, null, '2019-08-20 19:21:35', 'collect');
INSERT INTO `sys_company` VALUES ('13680258008', '019018', '581', '中山市皆安电子科技有限公司', null, '13680258008', null, '中山市小榄镇德来北路十横街九号', null, null, '2019-08-20 18:22:30', 'collect');
INSERT INTO `sys_company` VALUES ('13682080367', '002001', '1000', '濠津科技(天津)有限公司', null, '13682080367', null, '辰纬路1号辰赫创意产业园A座201', null, null, '2019-08-20 19:22:53', 'collect');
INSERT INTO `sys_company` VALUES ('13684903020', '019003', '957', '深圳市捷先数码科技有限公司', null, '13684903020', null, '中山园路1001号国际E城E4栋', null, null, '2019-08-20 19:22:46', 'collect');
INSERT INTO `sys_company` VALUES ('13685289792', '010004', '1084', '常州胜名电子有限公司', null, '13685289792', null, '常州市新北区新北区衡山路高新科技园区工业区', null, null, '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_company` VALUES ('13686182231', '019017', '1109', '积奇企业有限公司东莞办事处', null, '13686182231', null, '塘厦镇蒲心湖蒲龙西三路3号', null, null, '2019-08-20 19:35:25', 'collect');
INSERT INTO `sys_company` VALUES ('13687650751', '015002', '165', '青岛豪特散热器有限公司', null, '13687650751', null, '即墨市通济街道办事处陈家河', null, null, '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_company` VALUES ('13690333282', '019006', '563', '佛山市顺德区赛盛尔电子科技有限公司', null, '13690333282', null, '容桂容港路33号4楼', null, null, '2019-08-20 18:22:26', 'collect');
INSERT INTO `sys_company` VALUES ('13697673756', '015002', '637', '青岛金海迅科技有限公司', null, '13697673756', null, '青岛保税区上海路34号', null, null, '2019-08-20 18:23:43', 'collect');
INSERT INTO `sys_company` VALUES ('13700379667', '003009', '1095', '任丘市振峰电子产品有限公司', null, '13700379667', null, '香港街中街', null, null, '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_company` VALUES ('13701064021', '001014', '77', '北京捷迅通电子科技有限公司', null, '13701064021', null, '北京市大兴区西红门镇大件路1号北侧楼307室', null, null, '2019-08-05 15:40:00', 'collect');
INSERT INTO `sys_company` VALUES ('13701236309', '027001', '879', '陕西智能水表厂', null, '13701236309', null, '陕西西安市', null, null, '2019-08-20 19:21:47', 'collect');
INSERT INTO `sys_company` VALUES ('13701989448', '009017', '540', '上海启渡贸易有限公司', null, '13701989448', null, '上海市奉贤区环城东路499弄', null, null, '2019-08-20 18:22:19', 'collect');
INSERT INTO `sys_company` VALUES ('13703117333', '003001', '1071', '石家庄瑞辉机械设备有限公司', null, '13703117333', null, '胜利北大街178号、13703117333、13803391222', null, null, '2019-08-20 19:25:19', 'collect');
INSERT INTO `sys_company` VALUES ('13703215959', '003001', '867', '河北翔源仪表科技有限公司', null, '13703215959', null, '栾城县栾城县楼底镇', null, null, '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_company` VALUES ('13703714872', '016001', '210', '河南意斯暖节能环保设备有限公司', null, '13703714872', null, '商都路和谐大厦B座405', null, null, '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_company` VALUES ('13704113382', '004001', '189', '山西省清徐县北录树企业集团有限公司', null, '13704113382', null, '开发区钢材市场山西暖气片', null, null, '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_company` VALUES ('13705369993', '015007', '422', '昌邑市围子镇利民炉具厂', null, '13705369993', null, '昌邑市昌邑市围子工业园', null, null, '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_company` VALUES ('13706438122', '015003', '169', '桓台县起凤镇锐志水暖器材厂', null, '13706438122', null, '桓台辛泉工业园', null, null, '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_company` VALUES ('13706470877', '015005', '654', '胜利油田胜利石油仪表厂', null, '13706470877', null, '河口经济技术开发区92号', null, null, '2019-08-20 18:23:59', 'collect');
INSERT INTO `sys_company` VALUES ('13706742408', '011002', '792', '慈溪市新浦镇水表厂', null, '13706742408', null, '慈溪市新浦镇工业园区', null, null, '2019-08-20 18:24:18', 'collect');
INSERT INTO `sys_company` VALUES ('13709053439', '023001', '686', '四川凯扬立方供水设备有限公司', null, '13709053439', null, '成都市青羊区一环路西二段18号7楼706号', null, null, '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_company` VALUES ('13709061820', '023001', '542', '金牛区洪荣昌阀门经营部', null, '13709061820', null, '成都市金牛区金府机电城B区37栋10号', null, null, '2019-08-20 18:22:19', 'collect');
INSERT INTO `sys_company` VALUES ('13710947230', '019001', '893', '广州正峰电子科技有限公司', null, '13710947230', null, '番禺区迎宾路天安节能科技园产业大厦1-203', null, null, '2019-08-20 19:21:51', 'collect');
INSERT INTO `sys_company` VALUES ('13711262228', '019001', '544', '广州市兆基水表仪器制造厂', null, '13711262228', null, '广州市番禺区市莲路新桥路段祥兴大街2号', null, null, '2019-08-20 18:22:20', 'collect');
INSERT INTO `sys_company` VALUES ('13711630249', '019001', '962', '广州志航环保设备有限公司', null, '13711630249', null, '广州市番禺区大石街会江村石南二路自编3号132', null, null, '2019-08-20 19:22:46', 'collect');
INSERT INTO `sys_company` VALUES ('13713896842', '019003', '1024', '深圳市圳龙科技有限公司', null, '13713896842', null, '深圳市南山区西丽麻磡村南路31号益民工业区5栋', null, null, '2019-08-20 19:23:03', 'collect');
INSERT INTO `sys_company` VALUES ('13714552246', '019003', '359', '北京京致凯程装饰设计有限公司深圳分公司', null, '13714552246', null, '笋岗西路', null, null, '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_company` VALUES ('13716900928', '001001', '668', '北京延平水表厂', null, '13716900928', null, '牛栏山工业区牛汇北五街九号', null, null, '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_company` VALUES ('13721101344', '012001', '789', '合肥诚蕊电子有限公司', null, '13721101344', null, '汲桥新村A区6栋38号', null, null, '2019-08-20 18:24:18', 'collect');
INSERT INTO `sys_company` VALUES ('13721756852', '016009', '345', '河南中科建材有限公司', null, '13721756852', null, '京开大道烟草局南侧', null, null, '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_company` VALUES ('13722220581', '003006', '170', '唐县鑫旺热能设备制造有限公司', null, '13722220581', null, '唐县河北省保定市唐县白合工业区', null, null, '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_company` VALUES ('13722838650', '001008', '322', '艾丽日化有限公司', null, '13722838650', null, '北京市海淀区院南路明光寺农货市场北', null, null, '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_company` VALUES ('13723212786', '016002', '530', '开封市禹王台区景源机械设备厂', null, '13723212786', null, '开封市禹王台区禹王台区火神庙村', null, null, '2019-08-20 18:22:18', 'collect');
INSERT INTO `sys_company` VALUES ('13723271633', '016002', '979', '开封市天达无塔供水设备有限公司', null, '13723271633', null, '禹王台区精细化园区', null, null, '2019-08-20 19:22:49', 'collect');
INSERT INTO `sys_company` VALUES ('13723872142', '018001', '552', '长沙普宁电子科技有限公司', null, '13723872142', null, '长沙市雨花区长沙市香樟路口', null, null, '2019-08-20 18:22:23', 'collect');
INSERT INTO `sys_company` VALUES ('13726362826', '019006', '463', '佛山市顺德区勒流向山五金电子厂', null, '13726362826', null, '佛山市顺德区勒流众涌工业区众建路6号', null, null, '2019-08-05 19:50:56', 'collect');
INSERT INTO `sys_company` VALUES ('13727262669', '019010', '721', '肇庆市兆田金属制品厂有限公司', null, '13727262669', null, '高要市南岸镇西区马安开发区海星食品厂侧', null, null, '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_company` VALUES ('13728700481', '019003', '803', '深圳市宝安区石岩三合五金机电经营部', null, '13728700481', null, '深圳市光明新区公明街道合水口金星辉电子城B235柜台', null, null, '2019-08-20 19:06:49', 'collect');
INSERT INTO `sys_company` VALUES ('13730586542', '003009', '492', '南皮县东林五金制品有限公司', null, '13730586542', null, '大坊子工业区', null, null, '2019-08-05 19:51:08', 'collect');
INSERT INTO `sys_company` VALUES ('13731151203', '003001', '852', '石家庄源天科技有限公司', null, '13731151203', null, '石家庄市石家庄桥西区裕华西路67号', null, null, '2019-08-20 19:21:43', 'collect');
INSERT INTO `sys_company` VALUES ('13731167164', '003001', '1008', '桥西区宇瑞水处理设备经营部', null, '13731167164', null, '友谊南大街122号', null, null, '2019-08-20 19:22:56', 'collect');
INSERT INTO `sys_company` VALUES ('13732107323', '011002', '719', '上海水思源科技股份有限公司', null, '13732107323', null, '慈溪市附海工业区充公路168号', null, null, '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_company` VALUES ('13732202800', '011001', '774', '杭州庞瑞科技有限公司', null, '13732202800', null, '信诚路555号科达投资大厦1903室', null, null, '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_company` VALUES ('13736066933', '011002', '1089', '宁海县华深电子厂', null, '13736066933', null, '跃龙街道跃龙路24号', null, null, '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_company` VALUES ('13752007405', '002004', '37', '天津桂量量具刃具有限公司', null, '13752007405', null, '南开区密云路五金城2-30-109号', null, null, '2019-08-05 15:39:47', 'collect');
INSERT INTO `sys_company` VALUES ('13753138991', '004001', '447', '清徐县北录树刚盛暖气片有限公司', null, '13753138991', null, '北录树工业园', null, null, '2019-08-05 19:08:34', 'collect');
INSERT INTO `sys_company` VALUES ('13753691807', '004005', '632', '晋城市君浩环保科技有限公司', null, '13753691807', null, '山西省晋城市城区西环路5018号豪德光彩贸易广场二期', null, null, '2019-08-20 18:23:12', 'collect');
INSERT INTO `sys_company` VALUES ('13755037003', '018001', '633', '长沙中赢供水设备有限公司', null, '13755037003', null, '长沙市天心区左岸右岸B座2310', null, null, '2019-08-20 18:23:17', 'collect');
INSERT INTO `sys_company` VALUES ('13755070103', '018001', '685', '湖南华际环保设备有限公司', null, '13755070103', null, '韶山北路482号三重大厦', null, null, '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_company` VALUES ('13755139155', '018001', '776', '湖南艾格森科技有限公司', null, '13755139155', null, '长沙市万家丽中路美联天骄城3架5号', null, null, '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_company` VALUES ('13755180551', '018001', '630', '长沙中赢供水设备有限公司', null, '13755180551', null, '雨花区东塘北三重大厦19B', null, null, '2019-08-20 18:23:10', 'collect');
INSERT INTO `sys_company` VALUES ('13758560961', '011006', '921', '浙江科诚暖通设备有限公司', null, '13758560961', null, '浙江省绍兴市上虞区曹娥街道亚厦大道1078号', null, null, '2019-08-20 19:22:41', 'collect');
INSERT INTO `sys_company` VALUES ('13760115494', '010005', '109', '苏州九华工业设备有限公司', null, '13760115494', null, '苏州市相城区渭塘镇凤凰泾工业园', null, null, '2019-08-05 15:40:14', 'collect');
INSERT INTO `sys_company` VALUES ('13760885397', '019001', '519', '广州市杰捷机电设备有限公司', null, '13760885397', null, '广州市白云区嘉禾望岗村豪泉商务大厦8002', null, null, '2019-08-20 18:22:16', 'collect');
INSERT INTO `sys_company` VALUES ('13766392823', '014007', '793', '章贡区金鸿管道阀门批发部', null, '13766392823', null, '赣州市章贡区贸易广场西区五街11号', null, null, '2019-08-20 18:24:18', 'collect');
INSERT INTO `sys_company` VALUES ('13774280590', '009005', '227', '上海翰科管业有限公司', null, '13774280590', null, '上海市闵行区罗锦路55号', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('13775819715', '010003', '191', '沛县春晖散热器厂', null, '13775819715', null, '沛县江苏徐州沛县张庄镇（铁路东）', null, null, '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_company` VALUES ('13776506016', '010001', '547', '南京贝特空调设备有限公司', null, '13776506016', null, '六合经济开发区龙瑞路9号', null, null, '2019-08-20 18:22:21', 'collect');
INSERT INTO `sys_company` VALUES ('13777007634', '011002', '715', '宁波市鄞州凤岙电器厂', null, '13777007634', null, '宁波市鄞州区横街镇工业区金泉路3号', null, null, '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_company` VALUES ('13778432468', '023005', '989', '四川逸海卓诚科技发展有限公司', null, '13778432468', null, '四川省德阳市绵远街一段402号', null, null, '2019-08-20 19:22:50', 'collect');
INSERT INTO `sys_company` VALUES ('13780481689', '003011', '269', '冀州市暖气片公司', null, '13780481689', null, '高新技术开发区888号', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('13781104290', '016002', '1037', '开封市神龙供水设备有限公司', null, '13781104290', null, '开封市禹王台区汪屯乡火神庙村069号', null, null, '2019-08-20 19:23:05', 'collect');
INSERT INTO `sys_company` VALUES ('13783962072', '009015', '977', '驻马店市财源管业有限公司', null, '13783962072', null, '确山县工业集聚区金山大道北段', null, null, '2019-08-20 19:22:49', 'collect');
INSERT INTO `sys_company` VALUES ('13783999880', '016002', '641', '禹王台区七海供水设备厂', null, '13783999880', null, '汪屯乡精细化工园区', null, null, '2019-08-20 18:23:52', 'collect');
INSERT INTO `sys_company` VALUES ('13784859195', '003001', '156', '河北新太阳换散热水器有限公司', null, '13784859195', null, '河北省冀州市工业区', null, null, '2019-08-05 17:28:17', 'collect');
INSERT INTO `sys_company` VALUES ('13785105288', '003001', '1068', '石家庄博谊环保设备有限公司', null, '13785105288', null, '铜冶镇开发区', null, null, '2019-08-20 19:25:18', 'collect');
INSERT INTO `sys_company` VALUES ('13785883154', '003011', '290', '冀州市鑫淼采暖设备厂', null, '13785883154', null, '工业区', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('13787051577', '018001', '610', '长沙通德供水设备有限公司', null, '13787051577', null, '长沙市人民东路长房东郡4一405', null, null, '2019-08-20 18:23:02', 'collect');
INSERT INTO `sys_company` VALUES ('13787054256', '018001', '1119', '长沙索拓电子技术有限公司网络营销部', null, '13787054256', null, '劳动西路298号佳逸豪园A栋23楼', null, null, '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_company` VALUES ('13790278600', '019017', '34', '东莞市弘硕工业仪器有限公司', null, '13790278600', null, '东莞市厚街镇厚街村大塘工业区太和工业园1栋', null, null, '2019-08-05 15:39:46', 'collect');
INSERT INTO `sys_company` VALUES ('13790663069', '019017', '25', '东莞市日成精密仪器有限公司', null, '13790663069', null, '长安镇宵边社区上洋路齐庆楼', null, null, '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_company` VALUES ('13791777025', '015008', '873', '济宁启通工矿设备有限公司', null, '13791777025', null, '济安桥北路6号', null, null, '2019-08-20 19:21:47', 'collect');
INSERT INTO `sys_company` VALUES ('13792162101', '015003', '93', '山东盛康电气有限公司', null, '13792162101', null, '山东省淄博市高新区政通路135号A座', null, null, '2019-08-05 15:40:05', 'collect');
INSERT INTO `sys_company` VALUES ('13792240821', '015014', '133', '山东新宇科技发展有限公司', null, '13792240821', null, '山东省德州市高新技术创业服务中心B座', null, null, '2019-08-05 15:40:17', 'collect');
INSERT INTO `sys_company` VALUES ('13793688855', '015007', '968', '青州市伯达水处理设备厂', null, '13793688855', null, '山东青州黄楼经济开发区', null, null, '2019-08-20 19:22:47', 'collect');
INSERT INTO `sys_company` VALUES ('13801421501', '010012', '478', '泰州市鑫国泰换热设备制造有限公司', null, '13801421501', null, '泰州市', null, null, '2019-08-05 19:50:59', 'collect');
INSERT INTO `sys_company` VALUES ('13801938551', '009010', '297', '上海苍术建筑材料有限公司', null, '13801938551', null, '上海市上海市闸北区景凤路218弄12号702室', null, null, '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_company` VALUES ('13802308631', '017010', '689', '饶平港城仪表科技有限公司', null, '13802308631', null, '饶平县黄冈镇拥军路东寨上可池下（党校附近）', null, null, '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_company` VALUES ('13802587322', '019003', '842', '南丰洁具卫浴经营部', null, '13802587322', null, '深圳市龙岗区深圳龙岗龙东爱南路15号', null, null, '2019-08-20 19:21:42', 'collect');
INSERT INTO `sys_company` VALUES ('13803492246', '004001', '299', '山西省清徐县北铸暖气片有限公司', null, '13803492246', null, '徐沟镇', null, null, '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_company` VALUES ('13805312056', '015001', '579', '梁洪录', null, '13805312056', null, '济南市长清区水龙王工业园', null, null, '2019-08-20 18:22:29', 'collect');
INSERT INTO `sys_company` VALUES ('13805390717', '015013', '529', '临沂市跃翔水表有限公司', null, '13805390717', null, '临沂市白沙埠镇崖头工业园', null, null, '2019-08-20 18:22:18', 'collect');
INSERT INTO `sys_company` VALUES ('13805396836', '015013', '677', '临沂市环翔水表有限公司', null, '13805396836', null, '临沂市临沂市兰山区白沙埠镇', null, null, '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_company` VALUES ('13805819459', '011002', '731', '慈溪市鑫亮电器厂', null, '13805819459', null, '慈溪市新浦镇余家路村杜家路39号', null, null, '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_company` VALUES ('13805833915', '011002', '582', '宁波市宇星水表有限公司', null, '13805833915', null, '奉化市奉化市尚田镇开发区98号', null, null, '2019-08-20 18:22:30', 'collect');
INSERT INTO `sys_company` VALUES ('13805876136', '011002', '681', '宁波市鄞州通拓仪表塑料厂（普通合伙）', null, '13805876136', null, '宁波市浙江省宁波市鄞州区横街镇凤岙村', null, null, '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_company` VALUES ('13806463459', '015007', '417', '昌邑市同凯暖气片厂', null, '13806463459', null, '昌邑市鲁东铸造城东区４９号www.cy-tongkai.com', null, null, '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_company` VALUES ('13806834884', '011003', '1007', '浙江广正电气科技有限公司', null, '13806834884', null, '柳市方斗岩工业区', null, null, '2019-08-20 19:22:56', 'collect');
INSERT INTO `sys_company` VALUES ('13809236685', '019004', '735', '珠海市骏锐科技有限公司', null, '13809236685', null, '珠海市金鼎科技创新海岸科技4路6号科艺普园区4C', null, null, '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_company` VALUES ('13810166636', '002016', '301', '芦台经济开发区和家金属制品厂', null, '13810166636', null, '宁河县天津宁河海北镇工业区', null, null, '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_company` VALUES ('13810395332', '001001', '759', '北京华煜宏博科技公司', null, '13810395332', null, '慈云寺住邦2000大厦1号楼B区19层', null, null, '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_company` VALUES ('13811161986', '001013', '96', '北京中环蔚蓝科技有限公司', null, '13811161986', null, '北京市昌平区回龙观镇北郊农场办公室702室', null, null, '2019-08-05 15:40:06', 'collect');
INSERT INTO `sys_company` VALUES ('13811490810', '001012', '712', '北京自来水水表集团北京水表厂家', null, '13811490810', null, '北京顺义区牛栏山工业区', null, null, '2019-08-20 18:24:07', 'collect');
INSERT INTO `sys_company` VALUES ('13811593554', '006013', '584', '北京华水仪表系统有限公司', null, '13811593554', null, '北京市朝阳区朝阳路8号8层2单元816', null, null, '2019-08-20 18:22:30', 'collect');
INSERT INTO `sys_company` VALUES ('13811593954', '006013', '765', '北京华水仪表系统有限公司', null, '13811593954', null, '朝阳路8号朗廷大厦B座814室', null, null, '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_company` VALUES ('13811720595', '001012', '250', '北京市金马力锅炉有限公司', null, '13811720595', null, '北京市顺义区李桥', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('13811763835', '001011', '12', '北京三鑫亿安科技有限公司', null, '13811763835', null, '北京市中关村科技园通州园光机电一体产业基地嘉创路5号', null, null, '2019-08-05 15:39:41', 'collect');
INSERT INTO `sys_company` VALUES ('13811950183', '001001', '647', '北京华信万通科技有限公司', null, '13811950183', null, '朝外大街19号华普大厦708A', null, null, '2019-08-20 18:23:56', 'collect');
INSERT INTO `sys_company` VALUES ('13812008880', '010002', '52', '无锡东南彩色印刷有限公司', null, '13812008880', null, '无锡太湖国际旅游岛马山南堤路', null, null, '2019-08-05 15:39:52', 'collect');
INSERT INTO `sys_company` VALUES ('13813689060', '010004', '494', '常州市力度干燥设备有限公司', null, '13813689060', null, '郑陆镇三河口工业区', null, null, '2019-08-05 19:51:11', 'collect');
INSERT INTO `sys_company` VALUES ('13816179925', '009001', '1051', '上海山川泵业制造有限公司', null, '13816179925', null, '佘山工业区佘北公路1501号', null, null, '2019-08-20 19:23:10', 'collect');
INSERT INTO `sys_company` VALUES ('13816209150', '009008', '825', '上海瑾熙自动化设备有限公司', null, '13816209150', null, '上海市宝山区顾北路689弄8号楼', null, null, '2019-08-20 19:21:39', 'collect');
INSERT INTO `sys_company` VALUES ('13816457500', '011002', '992', '上海柯享阀门管道有限公司', null, '13816457500', null, '宁波路489号', null, null, '2019-08-20 19:22:50', 'collect');
INSERT INTO `sys_company` VALUES ('13816844217', '009016', '819', '上海溯灏流体设备有限公司', null, '13816844217', null, '上海市青浦区纪鹤公路2928弄229号', null, null, '2019-08-20 19:21:38', 'collect');
INSERT INTO `sys_company` VALUES ('13817047212', '009001', '32', '上海恩亿自控设备有限公司', null, '13817047212', null, '宁国路313弄9号1003', null, null, '2019-08-05 15:39:45', 'collect');
INSERT INTO `sys_company` VALUES ('13817177587', '009008', '1113', '上海威烁热能科技有限公司 销售部', null, '13817177587', null, '上海市宝山区顾北路666弄220号', null, null, '2019-08-20 19:35:26', 'collect');
INSERT INTO `sys_company` VALUES ('13818606778', '009005', '1135', '上海易通热能设备有限公司', null, '13818606778', null, '中国.上海.闵行区莘松路958弄', null, null, '2019-08-20 19:35:28', 'collect');
INSERT INTO `sys_company` VALUES ('13818630826', '009001', '1039', '上海格懿机械制造有限公司', null, '13818630826', null, 'http://www.sh-geyi.com', null, null, '2019-08-20 19:23:05', 'collect');
INSERT INTO `sys_company` VALUES ('13818708216', '009001', '1038', '上海格懿机械制造有限公司', null, '13818708216', null, '黄渡工业园区', null, null, '2019-08-20 19:23:05', 'collect');
INSERT INTO `sys_company` VALUES ('13819431042', '011002', '1092', '余姚市博阳电器有限公司', null, '13819431042', null, '余姚市阳明科技园区舜瑞路9号', null, null, '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_company` VALUES ('13819800461', '011002', '515', '宁波海曙炎黄电子科技有限公司IMIT项目部', null, '13819800461', null, '宁波市海曙区前丰街18弄4号', null, null, '2019-08-20 18:22:16', 'collect');
INSERT INTO `sys_company` VALUES ('13819830456', '011002', '1012', '慈溪市掌起鸿昌电子塑料五金厂(普通合伙)', null, '13819830456', null, '掌起镇陈家路一号', null, null, '2019-08-20 19:22:57', 'collect');
INSERT INTO `sys_company` VALUES ('13820305620', '002016', '315', '天津冬美热能科技有限公司', null, '13820305620', null, '天津市宁河县廉庄乡', null, null, '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_company` VALUES ('13820926545', '002001', '137', '天津新天智能仪表科技有限公司', null, '13820926545', null, '鑫茂科技园', null, null, '2019-08-05 15:40:17', 'collect');
INSERT INTO `sys_company` VALUES ('13821189998', '002010', '332', '天津市东丽区乐浪卫浴洁具经销部', null, '13821189998', null, '北方五金城E-6-116', null, null, '2019-08-05 17:28:33', 'collect');
INSERT INTO `sys_company` VALUES ('13821191397', '001006', '296', '天津耐鑫尔建筑材料贸易有限公司', null, '13821191397', null, '丰台镇开发区', null, null, '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_company` VALUES ('13823572570', '019003', '978', '深圳市科沃电气技术有限公司', null, '13823572570', null, '西乡固戍航城大道安乐工业区A2栋6楼A', null, null, '2019-08-20 19:22:49', 'collect');
INSERT INTO `sys_company` VALUES ('13824315101', '019003', '955', '深圳市创新高飞科技有限公司', null, '13824315101', null, '上横朗新工业区2栋9F', null, null, '2019-08-20 19:22:46', 'collect');
INSERT INTO `sys_company` VALUES ('13825155234', '019001', '882', '广州奥凯环保科技有限公司', null, '13825155234', null, '广州市黄埔区埔南路38号D栋', null, null, '2019-08-20 19:21:48', 'collect');
INSERT INTO `sys_company` VALUES ('13825789207', '019017', '56', '东莞市谱标实验器材科技有限公司', null, '13825789207', null, '东莞市莞城区八达路机安大厦8楼', null, null, '2019-08-05 15:39:53', 'collect');
INSERT INTO `sys_company` VALUES ('13826221235', '019001', '1021', '广州市本美电器有限公司', null, '13826221235', null, '广州市天河区渔沙坦渔北路150号', null, null, '2019-08-20 19:23:02', 'collect');
INSERT INTO `sys_company` VALUES ('13827452029', '019003', '862', '深圳市嘉荣华科技有限公司', null, '13827452029', null, '龙华新区民治街道民康路', null, null, '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_company` VALUES ('13827721478', '019006', '1118', '金昇联电器厂', null, '13827721478', null, '中国.广东省.佛山市.佛山市', null, null, '2019-08-20 19:35:26', 'collect');
INSERT INTO `sys_company` VALUES ('13827776035', '019006', '486', '广东兴发铝业有限公司', null, '13827776035', null, '三水区乐平中心科技园D区5号', null, null, '2019-08-05 19:51:01', 'collect');
INSERT INTO `sys_company` VALUES ('13831731915', '003009', '366', '任丘市飞腾采暖设备厂', null, '13831731915', null, '出岸镇刘家坞村', null, null, '2019-08-05 17:28:36', 'collect');
INSERT INTO `sys_company` VALUES ('13831759187', '003009', '435', '任丘市力创采暖设备厂', null, '13831759187', null, '任丘市任丘市王约工业区', null, null, '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_company` VALUES ('13831873966', '003011', '288', '冀州市宏阳散热器有限责任公司', null, '13831873966', null, '冀州市高新技术开发区', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('13831890178', '003001', '164', '冀州市明宇暖气片有限公司', null, '13831890178', null, '冀州市河北省冀州市工业园区建设南大街858号', null, null, '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_company` VALUES ('13833751317', '003009', '436', '任丘市雪姬兰散热器厂', null, '13833751317', null, '任丘市西于村（于村农场）', null, null, '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_company` VALUES ('13833788495', '003009', '283', '任丘市博燊散热器厂', null, '13833788495', null, '任丘市议论堡乡三杰村（东环路西侧）', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('13833886259', '003011', '348', '冀州市程祥翅片焊管加工厂', null, '13833886259', null, '桃园北大街', null, null, '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_company` VALUES ('13837192247', '016001', '611', '郑州松亚科技有限公司', null, '13837192247', null, '花园路农业路', null, null, '2019-08-20 18:23:03', 'collect');
INSERT INTO `sys_company` VALUES ('13837267628', '016005', '788', '安阳市腾瑞节能设备有限公司', null, '13837267628', null, '安钢大道中段金明达商务会所东胡同过铁道第一家', null, null, '2019-08-20 18:24:17', 'collect');
INSERT INTO `sys_company` VALUES ('13837826222', '016002', '567', '开封市九天无塔供水设备有限公司', null, '13837826222', null, '地址：开封市禹王台区汪屯工业园区', null, null, '2019-08-20 18:22:26', 'collect');
INSERT INTO `sys_company` VALUES ('13837884446', '016002', '1055', '开封市驰骋供水设备有限公司', null, '13837884446', null, '机场北路中段', null, null, '2019-08-20 19:23:10', 'collect');
INSERT INTO `sys_company` VALUES ('13837885025', '016002', '669', '河南天海压力容器设备有限公司', null, '13837885025', null, '精细化工产业园', null, null, '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_company` VALUES ('13850088152', '013002', '474', '厦门东乾国际贸易有限公司', null, '13850088152', null, '厦门思明区嘉禾路337号中关委大厦1508', null, null, '2019-08-05 19:50:58', 'collect');
INSERT INTO `sys_company` VALUES ('13852663058', '010012', '178', '姜堰区金鑫换热器制造厂', null, '13852663058', null, '泰州市姜堰区姜堰市娄庄先进工业区', null, null, '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_company` VALUES ('13852944446', '010011', '454', '镇江新区广发电子有限公司', null, '13852944446', null, '镇江新区大路新港村', null, null, '2019-08-05 19:47:18', 'collect');
INSERT INTO `sys_company` VALUES ('13853190761', '015001', '500', '济南诚田散热器有限公司', null, '13853190761', null, '山东省济南市槐荫区济齐路宋庄工业园', null, null, '2019-08-05 19:51:13', 'collect');
INSERT INTO `sys_company` VALUES ('13853372153', '015003', '420', '桓台县起凤镇大发水暖器材厂', null, '13853372153', null, '桓台县', null, null, '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_company` VALUES ('13853383497', '015003', '353', '桓台县起凤镇耐桓暖气片厂', null, '13853383497', null, '山东省淄博市桓台', null, null, '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_company` VALUES ('13853438448', '015014', '239', '武城县滕庄天一空调设备加工部', null, '13853438448', null, '武城县德州武城开发区', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('13853625056', '015007', '363', '寿光市鑫兴散热器厂', null, '13853625056', null, '寿光上口工业园', null, null, '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_company` VALUES ('13853799022', '015008', '228', '山东济宁天安工贸有限公司', null, '13853799022', null, '济宁市市中区济宁车站东路19号', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('13853851467', '015009', '615', '泰安沃特电子科技有限公司', null, '13853851467', null, '泰山区碧霞湖南路67号', null, null, '2019-08-20 18:23:08', 'collect');
INSERT INTO `sys_company` VALUES ('13854997008', '015013', '177', '临沂圣亚铝业有限公司', null, '13854997008', null, '高新技术产业开发区罗西街道西陆庄村', null, null, '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_company` VALUES ('13858526148', '011006', '445', '诸暨市奇百川不锈钢波纹管有限公司', null, '13858526148', null, '诸暨市阮市镇金岭村', null, null, '2019-08-05 19:08:34', 'collect');
INSERT INTO `sys_company` VALUES ('13860459593', '013002', '307', '厦门美佳盛新能源科技有限公司', null, '13860459593', null, '厦门市翔安区翔安区翔星路88号', null, null, '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_company` VALUES ('13863619957', '015007', '1112', '赵金鹏（个体经营）', null, '13863619957', null, '青州市山东省青州市工业原材料城B4-36', null, null, '2019-08-20 19:35:26', 'collect');
INSERT INTO `sys_company` VALUES ('13864197079', '015001', '871', '济南添东伟业自控技术有限公司', null, '13864197079', null, '济南市天桥区二环北路99号', null, null, '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_company` VALUES ('13864617960', '015001', '159', '山东驭能暖通科技有限公司', null, '13864617960', null, '', null, null, '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_company` VALUES ('13866105608', '012001', '247', '合肥恒暖暖通设备有限公司', null, '13866105608', null, '合肥市安徽省合肥市政务新区冬至路与休宁路交口丹青花园2栋102，QQ:962925642', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('13867623686', '011010', '375', '玉环县德鼎贸易有限公司', null, '13867623686', null, '玉环县科技工业园区（干江）', null, null, '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_company` VALUES ('13868430397', '011003', '1129', '乐清柳市胜格电器厂', null, '13868430397', null, '柳市工业区', null, null, '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_company` VALUES ('13868622060', '011003', '55', '永嘉美高仪表壳体有限公司', null, '13868622060', null, '瓯北镇五星工业区', null, null, '2019-08-05 15:39:52', 'collect');
INSERT INTO `sys_company` VALUES ('13868721625', '009001', '1096', '上海胤特电子科技有限公司', null, '13868721625', null, '乐清市柳市镇政府对面', null, null, '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_company` VALUES ('13869805252', '023001', '15', '上海艾可科技有限公司', null, '13869805252', null, '四川北路520号', null, null, '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_company` VALUES ('13875837340', '018001', '667', '长沙市长方供水设备有限公司', null, '13875837340', null, '地址：长沙市雨花区红星国际C栋1088号', null, null, '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_company` VALUES ('13877902368', '011006', '464', '诸暨市顺航船舶配件有限公司', null, '13877902368', null, '诸暨市店口工业区', null, null, '2019-08-05 19:50:56', 'collect');
INSERT INTO `sys_company` VALUES ('13889115350', '006002', '965', '大连大禹仪表有限公司', null, '13889115350', null, '甘井子区椒中街41号', null, null, '2019-08-20 19:22:47', 'collect');
INSERT INTO `sys_company` VALUES ('13889557878', '006002', '346', '大连经济技术开发区腾辉水暖经销处', null, '13889557878', null, '大连经济技术开发区铁山西路57号', null, null, '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_company` VALUES ('13897497167', '006013', '123', '西宁圣天商贸有限公司', null, '13897497167', null, '西宁市朝阳机电市场B区39号', null, null, '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_company` VALUES ('13898149022', '006001', '481', '沈阳市节新冷暖风机厂', null, '13898149022', null, '新民工业区东营北四路', null, null, '2019-08-05 19:50:59', 'collect');
INSERT INTO `sys_company` VALUES ('13901749702', '009001', '826', '上海申能炉具有限公司', null, '13901749702', null, '上海市浦东新区浦东新区川六公路1150号', null, null, '2019-08-20 19:21:39', 'collect');
INSERT INTO `sys_company` VALUES ('13901785658', '009012', '778', '上海新三星给排水设备有限公司', null, '13901785658', null, '上海市松江区上海市松江区车墩工业区泖亭路1056号', null, null, '2019-08-20 18:24:15', 'collect');
INSERT INTO `sys_company` VALUES ('13903127141', '003006', '76', '保定市源创电力设备制造有限公司', null, '13903127141', null, '保定市恒滨路89号1-1-504', null, null, '2019-08-05 15:40:00', 'collect');
INSERT INTO `sys_company` VALUES ('13903187056', '003011', '298', '冀州市华春散热器有限责任公司', null, '13903187056', null, '北环路工业区', null, null, '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_company` VALUES ('13903836092', '016001', '186', '王志强', null, '13903836092', null, '郑州市管城区十八里河宇通公司南门对面中浩搅拌站后大院19号院', null, null, '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_company` VALUES ('13905258957', '010010', '328', '扬州市共创热工器材有限公司', null, '13905258957', null, '江都市宜陵镇工业园区龙港路', null, null, '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_company` VALUES ('13905662113', '012016', '498', '池州脉纬散热器有限责任公司', null, '13905662113', null, '安徽省池州市高新技术开发区金安工业园', null, null, '2019-08-05 19:51:13', 'collect');
INSERT INTO `sys_company` VALUES ('13905774297', '011003', '325', '温州市阳泰紧固件有限公司', null, '13905774297', null, '温州市龙湾区状元镇前岩', null, null, '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_company` VALUES ('13906126648', '010004', '19', '常州市第一纺织设备有限公司', null, '13906126648', null, '江苏省常州市劳动西路40号', null, null, '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_company` VALUES ('13906183745', '010002', '286', '无锡市雪浪宏达热能设备厂', null, '13906183745', null, '滨湖区太湖镇雪浪陶墅107号', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('13906261773', '010005', '461', '昆山市东方散热器厂', null, '13906261773', null, '昆山昆太路50号', null, null, '2019-08-05 19:50:56', 'collect');
INSERT INTO `sys_company` VALUES ('13906462263', '015007', '415', '青州市万达采暖设备厂', null, '13906462263', null, '青州市益都办事处益都工业园', null, null, '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_company` VALUES ('13906743963', '011002', '726', '慈溪市新浦建冲水表配件厂', null, '13906743963', null, '慈溪市浙江省慈溪市新浦镇西街村仁丁路', null, null, '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_company` VALUES ('13910154499', '001006', '364', '北京捷捷顺兴供暖设备有限公司', null, '13910154499', null, '北京市丰台区波普公社4号517', null, null, '2019-08-05 17:28:36', 'collect');
INSERT INTO `sys_company` VALUES ('13910504630', '001001', '525', '北京慧怡科技有限责任公司', null, '13910504630', null, '高丽营镇文化营村北（临空二路1号）', null, null, '2019-08-20 18:22:17', 'collect');
INSERT INTO `sys_company` VALUES ('13910648209', '001001', '1059', '益都智能技术（北京）股份有限公司', null, '13910648209', null, '亦庄经济技术开发区兴盛街19号', null, null, '2019-08-20 19:23:11', 'collect');
INSERT INTO `sys_company` VALUES ('13910862877', '001011', '755', '北京华世金阳智能科技有限公司', null, '13910862877', null, '北京通州区潞城镇后北营3号', null, null, '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_company` VALUES ('13911620734', '001010', '923', '北京鑫高达给水设备有限公司', null, '13911620734', null, '北京市北京市房山区长阳镇稻田一村', null, null, '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_company` VALUES ('13911815299', '001001', '484', '北京日泰和机械有限公司', null, '13911815299', null, '珠市口西大街120号太丰惠中大厦1037-1039', null, null, '2019-08-05 19:51:01', 'collect');
INSERT INTO `sys_company` VALUES ('13915181617', '010008', '114', '金湖博锐仪表有限公司', null, '13915181617', null, '金湖县经济开发区工园路188号', null, null, '2019-08-05 15:40:15', 'collect');
INSERT INTO `sys_company` VALUES ('13915513800', '010005', '917', '苏州知非机电设备有限公司', null, '13915513800', null, '工业园区万盛街28号星海国际大厦1135室', null, null, '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_company` VALUES ('13916673163', '009001', '534', '上海法泉阀门机械有限公司', null, '13916673163', null, '上海市浦东新区沪南路9628号', null, null, '2019-08-20 18:22:18', 'collect');
INSERT INTO `sys_company` VALUES ('13916736966', '009008', '1133', '上海威烁热能科技有限公司-销售2部', null, '13916736966', null, '上海市宝山区顾北路666弄220号', null, null, '2019-08-20 19:35:28', 'collect');
INSERT INTO `sys_company` VALUES ('13916894526', '009008', '1121', '合肥市沃炼工贸有限公司', null, '13916894526', null, '上海市宝山工业区', null, null, '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_company` VALUES ('13917197912', '009001', '763', '上海嘉星环保设备有限公司', null, '13917197912', null, '上海市上海市北翟路1444弄258号', null, null, '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_company` VALUES ('13917890890', '009001', '188', '上海至运实业有限公司', null, '13917890890', null, '上海市龙江路130号', null, null, '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_company` VALUES ('13918707981', '009002', '1127', '上海斯普威尔电气有限公司', null, '13918707981', null, '黄浦区北京东路666号科技京城A537', null, null, '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_company` VALUES ('13920095266', '002011', '312', '天津市华峰盛达建材销售中心', null, '13920095266', null, '天津市西青区', null, null, '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_company` VALUES ('13920224423', '002011', '413', '天津市金裕祥金属制品有限公司', null, '13920224423', null, '西青区西青道外环线立交桥北', null, null, '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_company` VALUES ('13920803618', '002012', '1048', '天津市明奥泵业有限公司', null, '13920803618', null, '天津市津南区津南区双桥河工业园欣发路8号', null, null, '2019-08-20 19:23:09', 'collect');
INSERT INTO `sys_company` VALUES ('13921856058', '010009', '599', '盐城东海供水设备有限公司', null, '13921856058', null, '建湖县建湖县民营科技创业园4号路62号', null, null, '2019-08-20 18:22:49', 'collect');
INSERT INTO `sys_company` VALUES ('13922337970', '019001', '956', '广州金顺喜星信息科技有限公司', null, '13922337970', null, '天河区沙太南路85号三楼321室。', null, null, '2019-08-20 19:22:46', 'collect');
INSERT INTO `sys_company` VALUES ('13925158862', '019001', '762', '广州市晶源海水淡化与水处理有限公司', null, '13925158862', null, '新造镇海景路5号', null, null, '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_company` VALUES ('13926517392', '019003', '881', '深圳市优硕电子科技有限公司', null, '13926517392', null, '龙岗区坂田街道办四季花城', null, null, '2019-08-20 19:21:48', 'collect');
INSERT INTO `sys_company` VALUES ('13927209474', '019006', '1091', '佛山市南海腾亚电器有限公司', null, '13927209474', null, '丹灶镇金沙中学侧（销售部）', null, null, '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_company` VALUES ('13927731361', '019006', '511', '佛山市南海昶兴铝业有限公司', null, '13927731361', null, '狮山镇松岗石碣土名“印地岗”（五金车间F）', null, null, '2019-08-05 19:52:06', 'collect');
INSERT INTO `sys_company` VALUES ('13930252698', '003006', '39', '唐县汇丰工艺品厂', null, '13930252698', null, '田家庄工业区', null, null, '2019-08-05 15:39:48', 'collect');
INSERT INTO `sys_company` VALUES ('13930768540', '003009', '1098', '任丘市东方电器开关厂', null, '13930768540', null, '河北省任丘市经济技术开发区（林业大楼对面）', null, null, '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_company` VALUES ('13931796023', '003009', '258', '河北先知采暖设备有限公司', null, '13931796023', null, '吕公堡镇前李花村', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('13932155818', '003001', '773', '河北上高阀门有限公司', null, '13932155818', null, '石家庄建华大街与丰收路交叉口鼎坚市场6排02-04号', null, null, '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_company` VALUES ('13932226413', '003006', '744', '徐水县瑞祥食品机械厂', null, '13932226413', null, '南白塔村', null, null, '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_company` VALUES ('13932660062', '003010', '214', '环宇五金制品厂', null, '13932660062', null, '中国 河北 霸州市 河北霸州市康仙庄', null, null, '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_company` VALUES ('13932758176', '003009', '479', '沧县旭阳采暖电器设备有限公司', null, '13932758176', null, '李天木乡自来屯', null, null, '2019-08-05 19:50:59', 'collect');
INSERT INTO `sys_company` VALUES ('13932781389', '003009', '166', '田赶程', null, '13932781389', null, '任丘市城北工业区', null, null, '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_company` VALUES ('13932800505', '003011', '362', '冀州市雅春散热器有限责任公司', null, '13932800505', null, '冀州市城南工业区', null, null, '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_company` VALUES ('13932858460', '003011', '388', '衡水恒永暖通科技有限公司', null, '13932858460', null, '周村镇 工业园区', null, null, '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_company` VALUES ('13934136655', '004001', '264', '山西北录树散热器有限公司', null, '13934136655', null, '清徐县清徐县北录树', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('13934650335', '004001', '232', '山西晋海源镁业有限公司', null, '13934650335', null, '赵家堡村', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('13939028007', '016001', '813', '郑州松亚软件科技有限公司', null, '13939028007', null, '花园路农业路国贸中心A座26楼', null, null, '2019-08-20 19:21:34', 'collect');
INSERT INTO `sys_company` VALUES ('13950108836', '013002', '38', '厦门亨得利钟表眼镜有限公司', null, '13950108836', null, '厦门市思明区思明西路2号一层之三区', null, null, '2019-08-05 15:39:47', 'collect');
INSERT INTO `sys_company` VALUES ('13950169707', '013002', '54', '厦门科能千野仪表有限公司', null, '13950169707', null, '厦门市思明区塔埔东路（观音山国际商务营运中心）169号1803单', null, null, '2019-08-05 15:39:52', 'collect');
INSERT INTO `sys_company` VALUES ('13951568831', '010002', '490', '无锡双盛石化装备有限公司', null, '13951568831', null, '无锡市滨湖区胡埭工业园富来桥路10号', null, null, '2019-08-05 19:51:06', 'collect');
INSERT INTO `sys_company` VALUES ('13951828933', '010001', '613', '南京邦图电子有限公司', null, '13951828933', null, '宁南大道19号', null, null, '2019-08-20 18:23:08', 'collect');
INSERT INTO `sys_company` VALUES ('13952458592', '010005', '409', '苏州森德斯暖通设备工程有限公司', null, '13952458592', null, '开发区长江南路1128号', null, null, '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_company` VALUES ('13952511858', '010010', '330', '扬州永兴散热器有限公司', null, '13952511858', null, '宜陵工业区三号路', null, null, '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_company` VALUES ('13952651782', '010012', '513', '泰州市西墅福缘达新能源有限公司', null, '13952651782', null, '江苏省泰州市高港区永安洲标准厂区16号', null, null, '2019-08-20 18:22:16', 'collect');
INSERT INTO `sys_company` VALUES ('13953122688', '015001', '652', '山东百特淂威节能装备有限公司', null, '13953122688', null, '济南市长清区五峰山街道办事处万五路中段南侧500米', null, null, '2019-08-20 18:23:57', 'collect');
INSERT INTO `sys_company` VALUES ('13953302534', '015003', '416', '桓台县起凤镇顺达散热器厂', null, '13953302534', null, '桓台县起凤镇乌北村村委会', null, null, '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_company` VALUES ('13953431990', '015014', '1081', '德州海诚电子有限公司销售', null, '13953431990', null, '德州市天衢工业园', null, null, '2019-08-20 19:35:22', 'collect');
INSERT INTO `sys_company` VALUES ('13953663388', '015007', '876', '青州宇通电器设备有限公司', null, '13953663388', null, '山东省潍坊市青州市', null, null, '2019-08-20 19:21:47', 'collect');
INSERT INTO `sys_company` VALUES ('13953928808', '015013', '607', '胡发恩（个体经营）', null, '13953928808', null, '兰山区白沙埠镇', null, null, '2019-08-20 18:23:01', 'collect');
INSERT INTO `sys_company` VALUES ('13953976655', '015013', '617', '山东慧泽仪表科技有限公司', null, '13953976655', null, '兰山区枣沟头镇柳河村村南路西', null, null, '2019-08-20 18:23:09', 'collect');
INSERT INTO `sys_company` VALUES ('13956968779', '012001', '47', '安徽瑞仕物联网科技有限公司', null, '13956968779', null, '合肥市包河区马鞍山路与望江路交口铂金汉宫9栋2412', null, null, '2019-08-05 15:39:50', 'collect');
INSERT INTO `sys_company` VALUES ('13957853910', '011002', '855', '宁波胜德水表有限公司', null, '13957853910', null, '宁波市宁波市西郊望江工业区', null, null, '2019-08-20 19:21:44', 'collect');
INSERT INTO `sys_company` VALUES ('13958373858', '011002', '1094', '余姚市吉思特电子科技有限公司', null, '13958373858', null, '阳明西路789号', null, null, '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_company` VALUES ('13958454366', '011007', '444', '永康市索普铝业有限公司', null, '13958454366', null, '永康市永康唐先索普铝业', null, null, '2019-08-05 19:08:34', 'collect');
INSERT INTO `sys_company` VALUES ('13961811174', '010002', '324', '无锡聚意源冷暖设备有限公司', null, '13961811174', null, '金科米兰商铺43-235（三星中央空调）', null, null, '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_company` VALUES ('13962028000', '010009', '524', '盐城聚源供水设备有限公司', null, '13962028000', null, '建湖县建湖县近湖镇陈堡村新河组', null, null, '2019-08-20 18:22:17', 'collect');
INSERT INTO `sys_company` VALUES ('13964656617', '015007', '418', '青州市四海春韵采暖设备厂', null, '13964656617', null, '青州市邵庄工业园', null, null, '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_company` VALUES ('13965853983', '012006', '811', '淮北市晶鑫工贸有限公司', null, '13965853983', null, '92', null, null, '2019-08-20 19:21:34', 'collect');
INSERT INTO `sys_company` VALUES ('13965983208', '012001', '62', '安徽天康（集团）股份有限公司', null, '13965983208', null, '安徽省合肥市包河区绿地瀛海', null, null, '2019-08-05 15:39:55', 'collect');
INSERT INTO `sys_company` VALUES ('13967469486', '011007', '446', '永康市超佳五金工具厂', null, '13967469486', null, '永康市恒丰路168号6栋', null, null, '2019-08-05 19:08:34', 'collect');
INSERT INTO `sys_company` VALUES ('13968211176', '011002', '998', '慈溪市新浦镇益精塑料制盖厂', null, '13968211176', null, '慈溪市浙江省慈溪市新浦镇双庆浦工业区', null, null, '2019-08-20 19:22:52', 'collect');
INSERT INTO `sys_company` VALUES ('13968776787', '011003', '1106', '乐清市奥格节能自控系统有限公司', null, '13968776787', null, '乐清市柳市镇柳黄路2188号', null, null, '2019-08-20 19:35:25', 'collect');
INSERT INTO `sys_company` VALUES ('13968948686', '011003', '939', '永嘉凯茨流体科技有限公司', null, '13968948686', null, '永嘉县五星工业区', null, null, '2019-08-20 19:22:43', 'collect');
INSERT INTO `sys_company` VALUES ('13968983801', '009001', '932', '永嘉县山川泵阀厂', null, '13968983801', null, '工业园', null, null, '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_company` VALUES ('13969539356', '015015', '350', '冠县宜春暖气片制造有限公司', null, '13969539356', null, '南环路南首', null, null, '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_company` VALUES ('13969950115', '015013', '700', '山东沂龙仪表有限公司', null, '13969950115', null, '白沙埠镇双庄村', null, null, '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_company` VALUES ('13970476893', '014010', '558', '抚州市佳乐福供水设备制造有限公司', null, '13970476893', null, '抚州市江西省抚州市玉茗大道29号', null, null, '2019-08-20 18:22:24', 'collect');
INSERT INTO `sys_company` VALUES ('13973616617', '018007', '682', '湖南常德德山表业有限公司', null, '13973616617', null, '常德市鼎城区桥南工区园', null, null, '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_company` VALUES ('13974833225', '018001', '522', '长沙市博永机电科技有限公司', null, '13974833225', null, '长沙市雨花区雨花区万芙北路湘府名邸5栋1801房', null, null, '2019-08-20 18:22:17', 'collect');
INSERT INTO `sys_company` VALUES ('13978846363', '020001', '644', '南宁市千凯环保科技有限公司', null, '13978846363', null, '西乡塘区安吉大道东二里6号旁', null, null, '2019-08-20 18:23:55', 'collect');
INSERT INTO `sys_company` VALUES ('13980886927', '023001', '351', '成都兢峰工程设备有限公司', null, '13980886927', null, '成都市二环路西一段99号附7-8号', null, null, '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_company` VALUES ('13982290229', '023001', '343', '成都兢峰地暖安装有限公司', null, '13982290229', null, '成都市青羊区光华村街二环路西一段99号附7号', null, null, '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_company` VALUES ('13996087680', '022011', '78', '重庆嘉昂科技有限公司', null, '13996087680', null, '重庆市渝北区回兴兰馨大道2号五金机电城C2-4', null, null, '2019-08-05 15:40:01', 'collect');
INSERT INTO `sys_company` VALUES ('15001371894', '001012', '616', '北京慧怡工贸有限责任公司', null, '15001371894', null, '北京市顺义区牛栏山工业区', null, null, '2019-08-20 18:23:09', 'collect');
INSERT INTO `sys_company` VALUES ('15001377453', '001001', '976', '北京慧怡工贸有限责任公司', null, '15001377453', null, '牛栏山工业区', null, null, '2019-08-20 19:22:48', 'collect');
INSERT INTO `sys_company` VALUES ('15001875347', '009001', '267', '上海晟森环保科技有限公司', null, '15001875347', null, '上海市浦东新区外高桥保税区基隆路1号汤臣国际贸易大厦613', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('15002652238', '028001', '184', '贺秀红(个体经营)', null, '15002652238', null, '兰州市兰州市西固区', null, null, '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_company` VALUES ('15002713303', '017001', '374', '武汉易晟暖通技术有限公司', null, '15002713303', null, '和平大道三角路福星惠誉水岸国际2-26F', null, null, '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_company` VALUES ('15005608292', '012001', '97', '合肥智道智能科技有限公司', null, '15005608292', null, '安徽省合肥市立基大厦B座820', null, null, '2019-08-05 15:40:06', 'collect');
INSERT INTO `sys_company` VALUES ('15007002922', '014001', '995', '南昌誉昇鸿消防科技有限公司', null, '15007002922', null, '江西省南昌市西湖区赣抚路灌婴路599号丰源金润物流总部31-133号', null, null, '2019-08-20 19:22:50', 'collect');
INSERT INTO `sys_company` VALUES ('15011149008', '001006', '950', '北京京顺达水表有限公司', null, '15011149008', null, '北京市丰台区郑常庄天安街329号', null, null, '2019-08-20 19:22:45', 'collect');
INSERT INTO `sys_company` VALUES ('15011221766', '006013', '155', '山西省清徐县北铸暖气片有限公司', null, '15011221766', null, '北京市朝阳区十里河桥北联合国际大厦乙段705', null, null, '2019-08-05 17:28:17', 'collect');
INSERT INTO `sys_company` VALUES ('15011776479', '019006', '748', '宁波水表股份有限公司广东总代理', null, '15011776479', null, '佛山市禅城区佛山市禅城区南庄镇', null, null, '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_company` VALUES ('15017400981', '011002', '946', '宁波水表股份有限公司国内贸易部', null, '15017400981', null, '国际水暖卫浴城A9栋13-24号', null, null, '2019-08-20 19:22:44', 'collect');
INSERT INTO `sys_company` VALUES ('15022669099', '002016', '172', '天津宏奥暖通设备有限公司', null, '15022669099', null, '宁河县大北工业园区', null, null, '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_company` VALUES ('15022701293', '002016', '339', '天津市宁河县百瑞斯特散热器厂', null, '15022701293', null, '宁河县天津市宁河县贸易开发区', null, null, '2019-08-05 17:28:33', 'collect');
INSERT INTO `sys_company` VALUES ('15027600050', '003002', '1004', '唐山欧莱克仪器仪表有限公司', null, '15027600050', null, '路北区创业服务中心211号', null, null, '2019-08-20 19:22:55', 'collect');
INSERT INTO `sys_company` VALUES ('15034415927', '004001', '237', '山西丹帝散热器制造有限公司', null, '15034415927', null, '中国山西清徐县王答工业园区', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('15039027881', '016002', '653', '开封华邦仪表有限公司', null, '15039027881', null, '祥符区上禾大道06号', null, null, '2019-08-20 18:23:59', 'collect');
INSERT INTO `sys_company` VALUES ('15040196840', '006001', '1111', '沈阳莱珂暖通科技有限公司', null, '15040196840', null, '沈阳市铁西区兴华南街万达广场', null, null, '2019-08-20 19:35:25', 'collect');
INSERT INTO `sys_company` VALUES ('15044001999', '007002', '226', '长春市二道区英俊旭日散热器厂', null, '15044001999', null, '吉林 长春 二道区 吉林省长春市二道区英俊乡长江集团', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('15050111156', '010005', '618', '苏州埃美柯阀门销售公司', null, '15050111156', null, '姑苏区城北西路1599号', null, null, '2019-08-20 18:23:09', 'collect');
INSERT INTO `sys_company` VALUES ('15053376000', '015003', '221', '王帅', null, '15053376000', null, '起凤镇辛泉村', null, null, '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_company` VALUES ('15053857678', '015009', '750', '泰安优格电气设备有限公司', null, '15053857678', null, '龙潭路', null, null, '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_company` VALUES ('15053907061', '015013', '692', '山东沂龙仪表有限公司 销售部', null, '15053907061', null, '临沂市兰山区白沙埠镇南', null, null, '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_company` VALUES ('15061487729', '010011', '458', '镇江德瑞电子有限公司', null, '15061487729', null, '江苏 镇江 新区大路镇西戴村（南元何中队）', null, null, '2019-08-05 19:47:26', 'collect');
INSERT INTO `sys_company` VALUES ('15061896082', '010002', '687', '无锡易安得供水设备有限公司', null, '15061896082', null, '滨湖区蠡湖大道2018号', null, null, '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_company` VALUES ('15064012769', '015001', '80', '山东辰轩阀门制造有限公司', null, '15064012769', null, '山东省济南市历城区清河南路华山卫生院向北300米', null, null, '2019-08-05 15:40:01', 'collect');
INSERT INTO `sys_company` VALUES ('15064580478', '015006', '1132', '烟台市芝罘区运鑫物资经销处', null, '15064580478', null, '烟台市通伸南街23-33号', null, null, '2019-08-20 19:35:28', 'collect');
INSERT INTO `sys_company` VALUES ('15065098086', '029005', '849', '上海南元实业有限公司', null, '15065098086', null, '上海市嘉定区嘉罗公路1305号', null, null, '2019-08-20 19:21:43', 'collect');
INSERT INTO `sys_company` VALUES ('15066577797', '015014', '1061', '德州卓智冷暖设备有限公司', null, '15066577797', null, '百得路东首', null, null, '2019-08-20 19:23:11', 'collect');
INSERT INTO `sys_company` VALUES ('15070857785', '014001', '807', '南昌国美实业有限公司', null, '15070857785', null, '南昌市西湖区南昌市灌婴路鸿顺德建材城16栋6-7号', null, null, '2019-08-20 19:06:50', 'collect');
INSERT INTO `sys_company` VALUES ('15071166535', '017001', '59', '武汉斯弗明科技有限公司', null, '15071166535', null, '武汉市江夏区谭湖一路八号工坊一栋一单元205', null, null, '2019-08-05 15:39:53', 'collect');
INSERT INTO `sys_company` VALUES ('15073156390', '018001', '520', '长沙华都供水设备有限公司', null, '15073156390', null, '长沙市雨花区韶山北路488号东一国际大厦北栋2014室', null, null, '2019-08-20 18:22:16', 'collect');
INSERT INTO `sys_company` VALUES ('15073195572', '018001', '938', '长沙恒信供水有限公司', null, '15073195572', null, '中意一路798号高升时代广场写字楼6栋20层2006-2007室', null, null, '2019-08-20 19:22:43', 'collect');
INSERT INTO `sys_company` VALUES ('15074019153', '018006', '829', '湖南杜科供水设备有限公司', null, '15074019153', null, '湖南省岳阳市平江县天一科技东侧（原潜水泵厂）', null, null, '2019-08-20 19:21:40', 'collect');
INSERT INTO `sys_company` VALUES ('15074870051', '018001', '570', '湖南恒鑫环保科技有限公司', null, '15074870051', null, '中意一路红星商务中心', null, null, '2019-08-20 18:22:27', 'collect');
INSERT INTO `sys_company` VALUES ('15075808581', '003011', '437', '冀州市中欧华亿散热器有限责任公司', null, '15075808581', null, '冀州市冀州市开发区铸造园春风街东侧', null, null, '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_company` VALUES ('15077144449', '020001', '772', '南宁市瑞翔水暖管道设备销售中心', null, '15077144449', null, '安源路荣安五金建材市场', null, null, '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_company` VALUES ('15081580233', '003002', '321', '唐山市丰润区暖春散热器厂', null, '15081580233', null, '丰润区丰润镇一村', null, null, '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_company` VALUES ('15083222202', '016009', '314', '河南龙辉散热器有限公司', null, '15083222202', null, '人民路与京开道交叉口北20米路东', null, null, '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_company` VALUES ('15089895776', '019001', '586', '洪春莲', null, '15089895776', null, '广州市天河区黄埔区黄埔东路722号文盛商务大厦A座133室/手机：15089895776/18924113970/020-82333816)', null, null, '2019-08-20 18:22:32', 'collect');
INSERT INTO `sys_company` VALUES ('15092214168', '015002', '395', '青岛奥克斯暖通设备有限公司', null, '15092214168', null, '长城路万科中心城69号', null, null, '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_company` VALUES ('15097498382', '003011', '335', '冀州市广安钢制片厂', null, '15097498382', null, '西环工业园区', null, null, '2019-08-05 17:28:33', 'collect');
INSERT INTO `sys_company` VALUES ('15110177081', '001001', '10', '北京华信万通科技有限公司', null, '15110177081', null, '朝外大街19号华普大厦708A', null, null, '2019-08-05 15:39:41', 'collect');
INSERT INTO `sys_company` VALUES ('15111020266', '018001', '808', '长沙中崛科技设备有限公司', null, '15111020266', null, '金洲大道18号中崛创业集团', null, null, '2019-08-20 19:06:50', 'collect');
INSERT INTO `sys_company` VALUES ('15111463532', '018001', '562', '湖南欧锐环保科技有限公司', null, '15111463532', null, '湖南省长沙市雨花区迎新路499号', null, null, '2019-08-20 18:22:25', 'collect');
INSERT INTO `sys_company` VALUES ('15112114086', '019001', '587', '广州埃美柯商贸有限公司', null, '15112114086', null, '工业大道中276-3号', null, null, '2019-08-20 18:22:32', 'collect');
INSERT INTO `sys_company` VALUES ('15112624928', '019003', '661', '深圳市丰锐通科技有限公司', null, '15112624928', null, '龙华清华东路安之龙工业区', null, null, '2019-08-20 18:24:02', 'collect');
INSERT INTO `sys_company` VALUES ('15116152026', '018001', '74', '湖南索拓科技有限公司', null, '15116152026', null, '湖南省长沙市岳麓区文轩路27号麓谷高新区企业广场C4栋206', null, null, '2019-08-05 15:40:00', 'collect');
INSERT INTO `sys_company` VALUES ('15121876213', '030001', '117', '宁夏赛文节能股份有限公司', null, '15121876213', null, '经济技术开发区金凤工业园A区', null, null, '2019-08-05 15:40:15', 'collect');
INSERT INTO `sys_company` VALUES ('15122481280', '002016', '187', '天津市宁河县兴奇散热器厂', null, '15122481280', null, '宁河县芦台经济开发区', null, null, '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_company` VALUES ('15122683026', '002001', '33', '天津市迎云仪表科技有限公司', null, '15122683026', null, '南河工业区', null, null, '2019-08-05 15:39:46', 'collect');
INSERT INTO `sys_company` VALUES ('15130896611', '003011', '313', '河北锦都散热器有限公司', null, '15130896611', null, '冀州区桃园北大街', null, null, '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_company` VALUES ('15131786899', '003009', '538', '泊头市普惠仪表有限公司', null, '15131786899', null, '开发区2号路', null, null, '2019-08-20 18:22:19', 'collect');
INSERT INTO `sys_company` VALUES ('15131801130', '003011', '216', '冀州区首春采暖设备销售处', null, '15131801130', null, '中国 河北 衡水 冀州市 城南开发区', null, null, '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_company` VALUES ('15131845379', '003011', '886', '武强县恒通仪表厂', null, '15131845379', null, '武强县豆村乡西张庄村', null, null, '2019-08-20 19:21:49', 'collect');
INSERT INTO `sys_company` VALUES ('15131884127', '003001', '397', '河北冀州福源采暖公司', null, '15131884127', null, '冀州市迎宾大街68号', null, null, '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_company` VALUES ('15138496227', '016001', '357', '河南意斯暖节能环保设备有限公司', null, '15138496227', null, '河南 郑州 管城回族区 商都路正商和谐大厦B座405', null, null, '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_company` VALUES ('15150009676', '010005', '147', '苏州东剑智能科技有限公司', null, '15150009676', null, '江苏省苏州市高新区科技城五台山路588号（与s230省道交叉口）', null, null, '2019-08-05 15:40:20', 'collect');
INSERT INTO `sys_company` VALUES ('15151627330', '010005', '470', '昆山中工电子有限公司', null, '15151627330', null, '张浦工业区', null, null, '2019-08-05 19:50:58', 'collect');
INSERT INTO `sys_company` VALUES ('15153876008', '015009', '22', '山东春宇电气科技有限公司', null, '15153876008', null, '校场街南端（灵山大街）', null, null, '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_company` VALUES ('15153877866', '015009', '959', '山东春宇电气科技有限公司', null, '15153877866', null, '泰安市校场街南首', null, null, '2019-08-20 19:22:46', 'collect');
INSERT INTO `sys_company` VALUES ('15153988355', '015013', '791', '临沂市联翔水表制造有限公司', null, '15153988355', null, '临沂市临沂市河东工业园区中昇街2003号', null, null, '2019-08-20 18:24:18', 'collect');
INSERT INTO `sys_company` VALUES ('15158413926', '018001', '858', '长沙思壮能源科技有限公司', null, '15158413926', null, '长沙机电市场11栋', null, null, '2019-08-20 19:21:44', 'collect');
INSERT INTO `sys_company` VALUES ('15169002777', '015001', '302', '山东繁释工贸有限公司', null, '15169002777', null, '历山北路198号济南国际五金机电城', null, null, '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_company` VALUES ('15173164837', '018001', '699', '湖南欧锐环保科技有限公司', null, '15173164837', null, '雨花区迎新路499号', null, null, '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_company` VALUES ('15175803918', '003011', '225', '冀州市炜烨采暖设备有限责任公司', null, '15175803918', null, '河北省衡水市冀州市冀码路54号', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('15175809661', '001006', '294', '北京鑫圣通金属制品有限公司', null, '15175809661', null, '丰台区五里店651号10幢B0105号', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('15175856300', '003011', '202', '冀州市昊春暖通设备有限公司', null, '15175856300', null, '冀州市工业园区顺平街', null, null, '2019-08-05 17:28:21', 'collect');
INSERT INTO `sys_company` VALUES ('15192952284', '015013', '376', '临沂市新野广告有限公司', null, '15192952284', null, '山东临沂华强环保市场A3区3号', null, null, '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_company` VALUES ('15194190925', '015001', '1034', '山东隆泰安防科技有限公司', null, '15194190925', null, '蓝翔路15号时代总部基地二区29号', null, null, '2019-08-20 19:23:05', 'collect');
INSERT INTO `sys_company` VALUES ('15200819689', '018001', '824', '长沙恒信供水设备有限公司', null, '15200819689', null, '长沙市雨花区中意一路红星现代商务中心B4062', null, null, '2019-08-20 19:21:39', 'collect');
INSERT INTO `sys_company` VALUES ('15200848112', '018001', '659', '长沙兴崛供水设备有限公司', null, '15200848112', null, '长沙市雨花区芙蓉中路三段395号都市阳光大厦1504', null, null, '2019-08-20 18:24:02', 'collect');
INSERT INTO `sys_company` VALUES ('15200923383', '018001', '954', '长沙恒信供水设备有限公司', null, '15200923383', null, '雨花区中意一路798号高升时代广场写字楼6栋', null, null, '2019-08-20 19:22:46', 'collect');
INSERT INTO `sys_company` VALUES ('15201991300', '009012', '218', '上海雅驷热能设备科技有限公司', null, '15201991300', null, '上海松江区文涵路442号二楼', null, null, '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_company` VALUES ('15203119327', '003001', '634', '石家庄盈都环保设备有限公司', null, '15203119327', null, '石家庄高新技术开发区荣御府', null, null, '2019-08-20 18:23:32', 'collect');
INSERT INTO `sys_company` VALUES ('15209295851', '027001', '1046', '西安润捷机电科技有限公司', null, '15209295851', null, '西安市高新区丈八北路108号捷瑞新时代四单元二零二室', null, null, '2019-08-20 19:23:09', 'collect');
INSERT INTO `sys_company` VALUES ('15210166616', '002016', '238', '北京亨享通暖通设备有限公司', null, '15210166616', null, '天津市宁河县芦台经济开发区', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('15221306566', '009012', '205', '上海仁品环境科技有限公司', null, '15221306566', null, '松江区', null, null, '2019-08-05 17:28:22', 'collect');
INSERT INTO `sys_company` VALUES ('15222162033', '002015', '575', '天津市金凤凌云科技有限公司', null, '15222162033', null, '宝坻区黄庄产业功能区', null, null, '2019-08-20 18:22:27', 'collect');
INSERT INTO `sys_company` VALUES ('15222400822', '002001', '271', '天津.西双散热器丝堵配件厂', null, '15222400822', null, '天津、芦台。片头堵、D型堵、圆形堵、放气阀、工艺堵', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('15225091521', '016001', '883', '郑州天海给水设备有限公司', null, '15225091521', null, '郑州市金水区南阳路101号10层102号', null, null, '2019-08-20 19:21:49', 'collect');
INSERT INTO `sys_company` VALUES ('15226715191', '003009', '625', '河北普惠机电设备有限公司', null, '15226715191', null, '河北省泊头市工业开发区2号路', null, null, '2019-08-20 18:23:10', 'collect');
INSERT INTO `sys_company` VALUES ('15237897560', '016002', '991', '禹王台区净泉变频无塔供水设备厂', null, '15237897560', null, '开封市禹王台区', null, null, '2019-08-20 19:22:50', 'collect');
INSERT INTO `sys_company` VALUES ('15238579571', '009013', '150', '上海甬港电子科技有限公司', null, '15238579571', null, '上海市嘉定区瑞林路1280弄149号', null, null, '2019-08-05 15:40:22', 'collect');
INSERT INTO `sys_company` VALUES ('15239994008', '016009', '318', '河南巨烽生物能源开发有限公司', null, '15239994008', null, '铁丘路东段北侧、吉村路北段西侧', null, null, '2019-08-05 17:28:29', 'collect');
INSERT INTO `sys_company` VALUES ('15254701095', '015008', '651', '邹城华煤工矿设备有限公司', null, '15254701095', null, '山东省邹城市工业园', null, null, '2019-08-20 18:23:57', 'collect');
INSERT INTO `sys_company` VALUES ('15256698898', '001002', '94', '安徽春辉仪表线缆集团有限公司', null, '15256698898', null, '安徽省天长市西城区工业园1号', null, null, '2019-08-05 15:40:05', 'collect');
INSERT INTO `sys_company` VALUES ('15258107057', '011002', '782', '宁波市江北水表厂', null, '15258107057', null, '北海路150弄6号', null, null, '2019-08-20 18:24:15', 'collect');
INSERT INTO `sys_company` VALUES ('15263988298', '015013', '878', '临沂市贝泉水表有限公司', null, '15263988298', null, '临沂市兰山区白沙埠镇仁和路北首', null, null, '2019-08-20 19:21:47', 'collect');
INSERT INTO `sys_company` VALUES ('15267279100', '011010', '275', '玉环法宇水暖管件厂', null, '15267279100', null, '沙门镇灵门村', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('15274995007', '018001', '753', '长沙市长方供水设备有限公司', null, '15274995007', null, '长沙市雨花区中意一路1号金领家族A座1225-1228室', null, null, '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_company` VALUES ('15280588281', '013001', '475', '福建伯取自动化设备有限公司', null, '15280588281', null, '中庚城30#1006', null, null, '2019-08-05 19:50:58', 'collect');
INSERT INTO `sys_company` VALUES ('15281087241', '023001', '823', '成都华振供水设备有限公司', null, '15281087241', null, '大安东路61号太升大厦2406室', null, null, '2019-08-20 19:21:39', 'collect');
INSERT INTO `sys_company` VALUES ('15300318813', '001012', '897', '北京逸海卓诚科技有限公司', null, '15300318813', null, '北京市顺义区顺高路临10号', null, null, '2019-08-20 19:21:51', 'collect');
INSERT INTO `sys_company` VALUES ('15302024691', '002001', '8', '天津新天智能仪表科技有限公司', null, '15302024691', null, '鑫茂科技园军民园2号楼2107', null, null, '2019-08-05 15:39:41', 'collect');
INSERT INTO `sys_company` VALUES ('15303376677', '003009', '768', '泊头市佳乐仪器仪表有限公司', null, '15303376677', null, '泊头市红旗路', null, null, '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_company` VALUES ('15306566701', '011001', '472', '杭州华保电气有限公司', null, '15306566701', null, '杭州市西湖科技园振华路196号裕华大厦', null, null, '2019-08-05 19:50:58', 'collect');
INSERT INTO `sys_company` VALUES ('15311504789', '001012', '604', '北京逸海卓诚科技发展有限公司', null, '15311504789', null, '北京市顺义区顺高路临10号', null, null, '2019-08-20 18:22:59', 'collect');
INSERT INTO `sys_company` VALUES ('15312533899', '010004', '163', '常州虹洋暖通节能设备有限公司', null, '15312533899', null, '江苏省常州金坛市经济开发区复兴路2号金家园C幢41-43', null, null, '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_company` VALUES ('15315191306', '015008', '590', '济宁宇顺工矿设备有限公司', null, '15315191306', null, '高新区新闻大厦1单元1801室', null, null, '2019-08-20 18:22:35', 'collect');
INSERT INTO `sys_company` VALUES ('15318115236', '015009', '994', '泰安市智慧能源科技有限公司', null, '15318115236', null, '工业三路中段高新技术创业服务中心', null, null, '2019-08-20 19:22:50', 'collect');
INSERT INTO `sys_company` VALUES ('15318568033', '015013', '747', '临沂银江不锈钢水表制造有限公司', null, '15318568033', null, '临沂市临沂市高新技术开发区科技创业园', null, null, '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_company` VALUES ('15318596287', '015013', '928', '临沂华仪仪表有限公司', null, '15318596287', null, '兰山', null, null, '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_company` VALUES ('15320098357', '002001', '927', '天津金凤凌云科技有限公司', null, '15320098357', null, '华苑产业园区鑫茂科技园', null, null, '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_company` VALUES ('15320098930', '002004', '24', '天津市金凤凌云科技有限公司', null, '15320098930', null, '天津市南开区榕苑路16号', null, null, '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_company` VALUES ('15321344403', '001001', '455', '北京康拉德科技有限公司', null, '15321344403', null, '定福庄北里东领鉴筑3号楼5层7号', null, null, '2019-08-05 19:47:19', 'collect');
INSERT INTO `sys_company` VALUES ('15324088292', '003011', '434', '冀州市春风器材有限公司', null, '15324088292', null, '冀州市冀新西路86号', null, null, '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_company` VALUES ('15324189960', '003011', '306', '冀州市中欧华亿散热器有限责任公司', null, '15324189960', null, '河北省冀州市现代铸造园区春风街东侧', null, null, '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_company` VALUES ('15332119879', '002001', '2', '天津市新天智能仪表科技有限公司', null, '15332119879', null, '榕苑路鑫茂科技园军民园1号楼B座2107室', null, null, '2019-08-05 15:39:39', 'collect');
INSERT INTO `sys_company` VALUES ('15332132956', '002001', '51', '天津市新天智能仪表科技有限公司', null, '15332132956', null, '华苑产业园区15号B座2107室', null, null, '2019-08-05 15:39:51', 'collect');
INSERT INTO `sys_company` VALUES ('15332155256', '002001', '49', '天津市金凤来仪科技有限公司', null, '15332155256', null, '华苑产业园区鑫茂科技园', null, null, '2019-08-05 15:39:51', 'collect');
INSERT INTO `sys_company` VALUES ('15332175853', '002004', '5', '天津新天智能仪表科技有限公司', null, '15332175853', null, '南开区华苑产业园区榕苑路15号鑫茂科技园', null, null, '2019-08-05 15:39:41', 'collect');
INSERT INTO `sys_company` VALUES ('15332195529', '002001', '107', '天津市新天智能仪表科技有限公司', null, '15332195529', null, '华苑产业园区榕苑路15号鑫茂科技园军民园1号楼B座2107室', null, null, '2019-08-05 15:40:13', 'collect');
INSERT INTO `sys_company` VALUES ('15332300820', '027001', '1031', '西安鼎兴自控工程有限公司', null, '15332300820', null, '西安莲湖区大庆路陕鼓西仪厂内合资楼', null, null, '2019-08-20 19:23:04', 'collect');
INSERT INTO `sys_company` VALUES ('15339067761', '027003', '911', '宝鸡市丰源仪表有限责任公司国内销售部', null, '15339067761', null, '丰镐东路130号紫玉华园1303', null, null, '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_company` VALUES ('15339101775', '027001', '657', '西安秦威仪表厂', null, '15339101775', null, '大庆路129号', null, null, '2019-08-20 18:24:00', 'collect');
INSERT INTO `sys_company` VALUES ('15342060290', '015013', '126', '临沂华仪仪表有限公司', null, '15342060290', null, '河西区梅江工业区', null, null, '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_company` VALUES ('15353501852', '027001', '127', '西安秦威仪表厂', null, '15353501852', null, '大庆路129号', null, null, '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_company` VALUES ('15358602942', '010011', '450', '镇江新区晨鑫五金散热器厂', null, '15358602942', null, '镇江新区大路镇普照村', null, null, '2019-08-05 19:47:16', 'collect');
INSERT INTO `sys_company` VALUES ('15360613733', '019001', '1026', '广州市嘉亮电子科技有限公司', null, '15360613733', null, '棠下荷光五横路6号天逸商务大厦B座213房', null, null, '2019-08-20 19:23:03', 'collect');
INSERT INTO `sys_company` VALUES ('15365099371', '010001', '1064', '南京玄通电气设备有限公司', null, '15365099371', null, '南京市秦淮区集庆路127号宏安大厦2802室', null, null, '2019-08-20 19:23:13', 'collect');
INSERT INTO `sys_company` VALUES ('15365791220', '010009', '848', '盐城金泽供水设备有限公司', null, '15365791220', null, '建阳工业园区冠华西路21号(五洲国际城向西1公里)', null, null, '2019-08-20 19:21:43', 'collect');
INSERT INTO `sys_company` VALUES ('15367811192', '018001', '564', '仁湖环保有限公司', null, '15367811192', null, '雨花区湘府东路二段517号红星大厦B座28层', null, null, '2019-08-20 18:22:26', 'collect');
INSERT INTO `sys_company` VALUES ('15367813233', '018001', '565', '湖南华振供水设备有限公司', null, '15367813233', null, '雨花区红星国际大厦B座28层', null, null, '2019-08-20 18:22:26', 'collect');
INSERT INTO `sys_company` VALUES ('15367815557', '018001', '591', '湖南中航鼎盛供水设备有限公司', null, '15367815557', null, '雨花区中意一路540号b4034', null, null, '2019-08-20 18:22:35', 'collect');
INSERT INTO `sys_company` VALUES ('15369861995', '003011', '600', '河北道成电子科技有限公司', null, '15369861995', null, '开发区裕华西路', null, null, '2019-08-20 18:22:49', 'collect');
INSERT INTO `sys_company` VALUES ('15370537666', '010013', '1067', '宿迁市力源保温水箱有限公司', null, '15370537666', null, '宿豫经济开发区峨眉山路78号', null, null, '2019-08-20 19:23:13', 'collect');
INSERT INTO `sys_company` VALUES ('15371080086', '010002', '284', '无锡明俊冷暖设备有限公司', null, '15371080086', null, '新联家园3-1贡湖大道入口处', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('15374051070', '019001', '854', '广州中甲电力设备有限公司', null, '15374051070', null, '文华路', null, null, '2019-08-20 19:21:43', 'collect');
INSERT INTO `sys_company` VALUES ('15377677997', '017001', '411', '武汉诚德昌暖通空调工程有限公司', null, '15377677997', null, '武汉白沙洲八坦路140号', null, null, '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_company` VALUES ('15378724450', '016001', '623', '上海泸泉泵业有限公司', null, '15378724450', null, '郑州市大学路华城国际中心1731房间', null, null, '2019-08-20 18:23:09', 'collect');
INSERT INTO `sys_company` VALUES ('15382389008', '011001', '798', '杭州博世锅炉有限公司', null, '15382389008', null, '莲花商务中心', null, null, '2019-08-20 18:47:38', 'collect');
INSERT INTO `sys_company` VALUES ('15383873598', '003009', '640', '泊头市科元仪表有限公司', null, '15383873598', null, '泊头市开发区', null, null, '2019-08-20 18:23:52', 'collect');
INSERT INTO `sys_company` VALUES ('15386413935', '018001', '894', '长沙斯科供水设备有限公司', null, '15386413935', null, '湖南省长沙市开福区湘江世纪城富湾国际7-3703号', null, null, '2019-08-20 19:21:51', 'collect');
INSERT INTO `sys_company` VALUES ('15388991193', '018001', '1028', '湖南省欧朗环保科技有限公司', null, '15388991193', null, '天心区竹塘西路天鸿天府15栋三单元306', null, null, '2019-08-20 19:23:03', 'collect');
INSERT INTO `sys_company` VALUES ('15399982057', '018001', '752', '长沙林茂供水设备有限公司', null, '15399982057', null, '沙湾路308号星城映象家园1栋503号', null, null, '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_company` VALUES ('15503298989', '003011', '392', '冀州市冀中暖气片有限责任公司', null, '15503298989', null, '高新开发区开元路', null, null, '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_company` VALUES ('15510133988', '001006', '246', '北京亚龙翔宇科技发展有限公司', null, '15510133988', null, '北京市丰台区新宫商业街', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('15511776679', '003001', '1033', '河北天诺仪表有限公司', null, '15511776679', null, '西环路电视台西侧', null, null, '2019-08-20 19:23:04', 'collect');
INSERT INTO `sys_company` VALUES ('15512656545', '003011', '161', '冀州市科鑫采暖设备有限责任公司', null, '15512656545', null, '滨湖大道', null, null, '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_company` VALUES ('15522004838', '002001', '614', '天津津仪汇通科技发展有限公司', null, '15522004838', null, '上谷商业街A座510', null, null, '2019-08-20 18:23:08', 'collect');
INSERT INTO `sys_company` VALUES ('15530152246', '003001', '122', '河北海峰电子科技有限公司', null, '15530152246', null, '新石北路368号金石工业园区', null, null, '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_company` VALUES ('15530159233', '003001', '1045', '河北海峰电子科技有限公司', null, '15530159233', null, '石家庄桥西区新石北路368号', null, null, '2019-08-20 19:23:09', 'collect');
INSERT INTO `sys_company` VALUES ('15531383238', '003007', '751', '河北巨灵仪表制造有限公司', null, '15531383238', null, '张家口市高新区许家庄工业园', null, null, '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_company` VALUES ('15532492198', '003001', '1011', '赵县盈都电气焊修理部', null, '15532492198', null, '河北省石家庄市', null, null, '2019-08-20 19:22:56', 'collect');
INSERT INTO `sys_company` VALUES ('15533730501', '003009', '282', '任丘市大旗采暖设备厂', null, '15533730501', null, '任丘市西于村炉具园区', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('15550018759', '015001', '799', '济南信盈自动化设备有限公司', null, '15550018759', null, '济南市高新区颖秀路500号聚鑫旺园2-3-102室', null, null, '2019-08-20 18:47:39', 'collect');
INSERT INTO `sys_company` VALUES ('15560269680', '016007', '185', '长垣县盛春暖通设备厂', null, '15560269680', null, '樊相镇张新店', null, null, '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_company` VALUES ('15570898446', '018001', '943', '湖南嘉威供水设备有限公司', null, '15570898446', null, '韶山南路上海城1栋401', null, null, '2019-08-20 19:22:44', 'collect');
INSERT INTO `sys_company` VALUES ('15575800043', '018001', '775', '长沙万博供水设备有限公司', null, '15575800043', null, '长沙市万家丽中路539号', null, null, '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_company` VALUES ('15581621480', '018001', '655', '长沙中赢供水设备有限公司', null, '15581621480', null, '长沙市雨花区韶山北路三重大厦19B', null, null, '2019-08-20 18:23:59', 'collect');
INSERT INTO `sys_company` VALUES ('15589636637', '015007', '424', '昌邑市石埠金源散热器销售处', null, '15589636637', null, '昌邑市昌邑市石埠309国道288公里处', null, null, '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_company` VALUES ('15589715136', '015008', '142', '济宁浩博工矿机械设备有限公司', null, '15589715136', null, '任城区洸河路开泰花园21号楼', null, null, '2019-08-05 15:40:18', 'collect');
INSERT INTO `sys_company` VALUES ('15589717043', '015008', '1014', '济宁市龙汲工矿设备有限公司', null, '15589717043', null, '山东省济宁市', null, null, '2019-08-20 19:22:57', 'collect');
INSERT INTO `sys_company` VALUES ('15594801238', '027001', '972', '西安鼎兴自控工程有限公司', null, '15594801238', null, '西安市大庆路029-68966269', null, null, '2019-08-20 19:22:48', 'collect');
INSERT INTO `sys_company` VALUES ('15600106589', '001008', '1005', '北京格乐普高新技术有限公司', null, '15600106589', null, '北京市海淀区上地三街嘉华大厦4层', null, null, '2019-08-20 19:22:55', 'collect');
INSERT INTO `sys_company` VALUES ('15605251888', '010010', '157', '扬州永兴散热器有限公司', null, '15605251888', null, '江都市宜陵镇工业区3号路', null, null, '2019-08-05 17:28:17', 'collect');
INSERT INTO `sys_company` VALUES ('15610898282', '003011', '292', '河北超春暖气片有限公司', null, '15610898282', null, '河北冀州市春风大街南侧', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('15613165013', '003001', '112', '河北丰源智控科技股份有限公司', null, '15613165013', null, '石家庄市鹿泉开发区昌盛大街丰源路南', null, null, '2019-08-05 15:40:15', 'collect');
INSERT INTO `sys_company` VALUES ('15613165016', '003001', '535', '石家庄丰源仪表有限公司', null, '15613165016', null, '鹿泉市开发区昌盛大街双剑东路', null, null, '2019-08-20 18:22:18', 'collect');
INSERT INTO `sys_company` VALUES ('15613685361', '003010', '944', '河北廊坊信安防火材料有限公司', null, '15613685361', null, '河北省廊坊市大城县大广安工业区', null, null, '2019-08-20 19:22:44', 'collect');
INSERT INTO `sys_company` VALUES ('15613696199', '003010', '1001', '廊坊全亨新型材料有限公司', null, '15613696199', null, '河北省廊坊市大城县大广安工业区', null, null, '2019-08-20 19:22:53', 'collect');
INSERT INTO `sys_company` VALUES ('15614310947', '003001', '757', '河北罗斯纳德新能源科技有限公司', null, '15614310947', null, '建设南大街269号河北师大科技园A-2107、2108室', null, null, '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_company` VALUES ('15618580760', '009013', '971', '上海昶玮电气自动化工程有限公司', null, '15618580760', null, '嘉定区外冈五金城107号', null, null, '2019-08-20 19:22:48', 'collect');
INSERT INTO `sys_company` VALUES ('15618856897', '009012', '902', '上海子盈商贸有限公司', null, '15618856897', null, '上海市松江区石湖荡镇张庄村799弄13号-136室', null, null, '2019-08-20 19:21:52', 'collect');
INSERT INTO `sys_company` VALUES ('15618918888', '009001', '508', '上海荣舟机电有限公司', null, '15618918888', null, '上海市浦东新区茂兴路88号仁恒广场4座407室', null, null, '2019-08-05 19:51:14', 'collect');
INSERT INTO `sys_company` VALUES ('15628889929', '015001', '131', '山东美标贸易有限公司', null, '15628889929', null, '重汽彩世界8-2-813室', null, null, '2019-08-05 15:40:17', 'collect');
INSERT INTO `sys_company` VALUES ('15638598029', '016001', '212', '郑州博睿德暖通有限公司', null, '15638598029', null, '郑州高新区冬青街55号C9-5号四楼', null, null, '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_company` VALUES ('15643493333', '007002', '138', '吉林省安亿家热能计量有限责任公司', null, '15643493333', null, '高新北区盛北大街3333号北湖科技园A3栋', null, null, '2019-08-05 15:40:18', 'collect');
INSERT INTO `sys_company` VALUES ('15653318001', '003002', '377', '桓台县新颖散热器厂', null, '15653318001', null, '唐山镇兴旺村', null, null, '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_company` VALUES ('15666231555', '015007', '222', '昌邑市围子镇三合铸造厂', null, '15666231555', null, '昌邑市围子镇', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('15668655293', '006002', '136', '大连海峰伟业仪器有限公司', null, '15668655293', null, '张前路588号A区4号', null, null, '2019-08-05 15:40:17', 'collect');
INSERT INTO `sys_company` VALUES ('15669895518', '011003', '1124', '乐清市柳市赤子仪表厂', null, '15669895518', null, '柳市镇前西垟村', null, null, '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_company` VALUES ('15674923822', '018001', '631', '长沙中赢供水设备有限公司', null, '15674923822', null, '长沙市雨花区东塘北三重大厦19b', null, null, '2019-08-20 18:23:11', 'collect');
INSERT INTO `sys_company` VALUES ('15684796588', '015014', '975', '德州泰岳供水设备有限公司', null, '15684796588', null, '德州天衢街道办事处康宁路', null, null, '2019-08-20 19:22:48', 'collect');
INSERT INTO `sys_company` VALUES ('15688822786', '015009', '58', '山东科德电子有限公司', null, '15688822786', null, '山东省泰安市高新区凤祥路西规划支路北', null, null, '2019-08-05 15:39:53', 'collect');
INSERT INTO `sys_company` VALUES ('15715733082', '011001', '539', '富阳华亨实业有限公司', null, '15715733082', null, '东洲街道木桥头村', null, null, '2019-08-20 18:22:19', 'collect');
INSERT INTO `sys_company` VALUES ('15725420180', '015002', '801', '青岛麦禾机电科技有限公司', null, '15725420180', null, '青岛市黄岛区灵港路685号', null, null, '2019-08-20 18:47:39', 'collect');
INSERT INTO `sys_company` VALUES ('15728242772', '019003', '506', '深圳市长鸿精密科技有限公司', null, '15728242772', null, '大浪街道办事处浪口社区顺城基工业园1栋3楼', null, null, '2019-08-05 19:51:14', 'collect');
INSERT INTO `sys_company` VALUES ('15736760376', '016001', '609', '河南省大恒水务有限公司', null, '15736760376', null, '南阳路170号三江大厦A座308室', null, null, '2019-08-20 18:23:02', 'collect');
INSERT INTO `sys_company` VALUES ('15737877787', '016002', '521', '开封市禹王台区金原恒压供水设备厂', null, '15737877787', null, '开封市禹王台区310国道（中段）', null, null, '2019-08-20 18:22:17', 'collect');
INSERT INTO `sys_company` VALUES ('15753090312', '015017', '118', '山东水立方电子有限公司', null, '15753090312', null, '开发区太湖路1919号', null, null, '2019-08-05 15:40:15', 'collect');
INSERT INTO `sys_company` VALUES ('15753841739', '015009', '868', '泰安启航电子科技有限公司', null, '15753841739', null, '泰山区佛光路296北上高工业园', null, null, '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_company` VALUES ('15766226351', '019006', '485', '广东兴发铝业有限公司', null, '15766226351', null, '中心科技工业园区D区5号', null, null, '2019-08-05 19:51:01', 'collect');
INSERT INTO `sys_company` VALUES ('15773175017', '018001', '628', '湖南中赢环保设备有限公司', null, '15773175017', null, '香樟路云集大厦', null, null, '2019-08-20 18:23:10', 'collect');
INSERT INTO `sys_company` VALUES ('15800620705', '009001', '1131', '源延实业(上海)有限公司', null, '15800620705', null, '莘凌路211号6楼', null, null, '2019-08-20 19:35:28', 'collect');
INSERT INTO `sys_company` VALUES ('15801258118', '001012', '79', '北京空港北光仪表有限公司', null, '15801258118', null, '北京市顺义区天竺空港工业区A区', null, null, '2019-08-05 15:40:01', 'collect');
INSERT INTO `sys_company` VALUES ('15802197345', '009006', '800', '上海郑蝶阀门制造有限公司', null, '15802197345', null, '上海市长宁区武夷路418弄1号武定大厦2402', null, null, '2019-08-20 18:47:39', 'collect');
INSERT INTO `sys_company` VALUES ('15802539578', '018001', '1116', '长沙索拓电子技术有限公司', null, '15802539578', null, '劳动西路298号佳逸豪园A栋23楼', null, null, '2019-08-20 19:35:26', 'collect');
INSERT INTO `sys_company` VALUES ('15802618165', '018001', '952', '博兹（上海流体设备有限公司）', null, '15802618165', null, '长沙市雨花区', null, null, '2019-08-20 19:22:45', 'collect');
INSERT INTO `sys_company` VALUES ('15806820857', '015014', '903', '德州万维空调设备有限公司', null, '15806820857', null, '经济开发区', null, null, '2019-08-20 19:22:36', 'collect');
INSERT INTO `sys_company` VALUES ('15810308927', '001012', '734', '北京惠依有限责任公司', null, '15810308927', null, '北京市顺义区牛山工业区', null, null, '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_company` VALUES ('15814048070', '019003', '769', '深圳市众恒测控技术有限公司', null, '15814048070', null, '科技园30区3栋4楼', null, null, '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_company` VALUES ('15816805020', '019017', '459', '东莞市迅阳实业有限公司', null, '15816805020', null, '石排镇赤坎村工业区', null, null, '2019-08-05 19:50:55', 'collect');
INSERT INTO `sys_company` VALUES ('15822790222', '002016', '311', '天津市宁河县鑫盛荣金属制品厂', null, '15822790222', null, '天津市宁河县芦台经济开发区', null, null, '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_company` VALUES ('15826880219', '017016', '592', '武汉科乐特科技有限公司', null, '15826880219', null, '湖北省仙桃市刘口工业园叶河三号路', null, null, '2019-08-20 18:22:36', 'collect');
INSERT INTO `sys_company` VALUES ('15829710054', '027001', '947', '西安富川科技有限公司销售部', null, '15829710054', null, '高新区高新一路正信大厦A座1803', null, null, '2019-08-20 19:22:45', 'collect');
INSERT INTO `sys_company` VALUES ('15831449955', '003001', '1053', '石家庄博谊环保设备有限公司', null, '15831449955', null, '石家庄鹿泉铜冶镇北铜冶村北', null, null, '2019-08-20 19:23:10', 'collect');
INSERT INTO `sys_company` VALUES ('15831801618', '003011', '233', '冀州市昊春暖通设备有限公司', null, '15831801618', null, '冀州市滏阳路顺平街一号', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('15832284431', '003006', '394', '北京瑞嘉祥和散热器有限公司', null, '15832284431', null, '京港澳高速徐水出口北200米', null, null, '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_company` VALUES ('15832784829', '003009', '176', '东光县春华采暖设备经销处', null, '15832784829', null, '东光县东光县找王镇小曹村', null, null, '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_company` VALUES ('15837141151', '016001', '706', '郑州市松亚软件科技有限公司', null, '15837141151', null, '国贸中心A座26层', null, null, '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_company` VALUES ('15841128368', '006002', '148', '大连计测机器有限公司', null, '15841128368', null, '大连保税区泰华B510号', null, null, '2019-08-05 15:40:20', 'collect');
INSERT INTO `sys_company` VALUES ('15850701137', '010001', '1015', '南京三益动力电子系统有限公司', null, '15850701137', null, '尧化门尧佳路上城风景北苑16栋704', null, null, '2019-08-20 19:22:57', 'collect');
INSERT INTO `sys_company` VALUES ('15852805975', '010002', '391', '无i恒兴世嘉冷暖设备有限公司', null, '15852805975', null, '无锡市滨湖区周新西路11号(东绛实验学校对面)', null, null, '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_company` VALUES ('15853187128', '015001', '40', '青岛积成电子有限公司', null, '15853187128', null, '华阳路69号留学人员创业园1号楼6层C座', null, null, '2019-08-05 15:39:48', 'collect');
INSERT INTO `sys_company` VALUES ('15854807003', '015009', '128', '山东鲁源仪表科技有限公司', null, '15854807003', null, '环城科技产业园', null, null, '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_company` VALUES ('15854808279', '015009', '31', '泰安泰全电子有限公司', null, '15854808279', null, '泰安市泰山区徐家楼街道办事处前灌村迎胜路546号', null, null, '2019-08-05 15:39:45', 'collect');
INSERT INTO `sys_company` VALUES ('15863775288', '015001', '696', '山东泉城阀门有限公司', null, '15863775288', null, '临港经济开发区临港街698号', null, null, '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_company` VALUES ('15865252918', '015001', '785', '山东普利龙压力容器有限公司', null, '15865252918', null, '济南市天桥区小鲁庄工业园三区七号', null, null, '2019-08-20 18:24:16', 'collect');
INSERT INTO `sys_company` VALUES ('15869008826', '011001', '890', '杭州东龙电子科技有限公司', null, '15869008826', null, '杭州市余杭区闲林街道闲兴路31号8幢2楼', null, null, '2019-08-20 19:21:50', 'collect');
INSERT INTO `sys_company` VALUES ('15869380633', '011002', '571', '慈溪市新浦其乔五金配件厂', null, '15869380633', null, '慈溪市新浦西街村沙滩路9弄8号4064', null, null, '2019-08-20 18:22:27', 'collect');
INSERT INTO `sys_company` VALUES ('15869739623', '018001', '725', '长沙华都供水设备公司', null, '15869739623', null, '雨花区东塘东一国际南栋1028', null, null, '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_company` VALUES ('15871439013', '002004', '665', '天津市金佳同达科技有限公司', null, '15871439013', null, '南开区华苑产业园鑫茂科技园', null, null, '2019-08-20 18:24:03', 'collect');
INSERT INTO `sys_company` VALUES ('15871811266', '017001', '42', '武汉华瑞远大电力设备有限公司', null, '15871811266', null, '江夏大道特一号', null, null, '2019-08-05 15:39:49', 'collect');
INSERT INTO `sys_company` VALUES ('15872679556', '017004', '904', '宜昌市思源水处理设备有限公司', null, '15872679556', null, '湖北省宜昌市发展的恒信中央公园', null, null, '2019-08-20 19:22:36', 'collect');
INSERT INTO `sys_company` VALUES ('15874008397', '009001', '888', '博兹（上海)流体设备有限公司', null, '15874008397', null, '翔乐路318号', null, null, '2019-08-20 19:21:50', 'collect');
INSERT INTO `sys_company` VALUES ('15874159171', '018001', '646', '长沙中梁供水设备有限公司', null, '15874159171', null, '天心区芙蓉中路三段558号建鸿达现代空间1栋1306室', null, null, '2019-08-20 18:23:56', 'collect');
INSERT INTO `sys_company` VALUES ('15877965891', '025001', '1016', '昆明市官渡区红叶太阳能配件经营部', null, '15877965891', null, '昌宏路宏盛达宸瑞五金机电市场A1-4号6号门旁', null, null, '2019-08-20 19:22:57', 'collect');
INSERT INTO `sys_company` VALUES ('15888386060', '011004', '277', '海盐耐普机电有限公司', null, '15888386060', null, '元通街道元通工业区', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('15889131063', '019017', '471', '东莞市雅杰电子材料有限公司', null, '15889131063', null, '东莞市黄江镇胜前岗江北二路17号', null, null, '2019-08-05 19:50:58', 'collect');
INSERT INTO `sys_company` VALUES ('15890457521', '016009', '174', '河南中科建材有限公司', null, '15890457521', null, '濮阳市京开大道451号', null, null, '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_company` VALUES ('15890991858', '016002', '711', '开封市天泉供水设备有限公司', null, '15890991858', null, '开封市机场北路东段', null, null, '2019-08-20 18:24:07', 'collect');
INSERT INTO `sys_company` VALUES ('15895559907', '010005', '621', '苏州双耐阀门有限公司', null, '15895559907', null, '吴中经济区', null, null, '2019-08-20 18:23:09', 'collect');
INSERT INTO `sys_company` VALUES ('15895562792', '010005', '1066', '广发伟业（北京）科技有限公司', null, '15895562792', null, '苏州市吴中区苏蠡路90号旺吴金座1109', null, null, '2019-08-20 19:23:13', 'collect');
INSERT INTO `sys_company` VALUES ('15896642509', '016003', '125', '洛阳暖盈电子技术有限公司', null, '15896642509', null, '丰华路6号', null, null, '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_company` VALUES ('15898634235', '015008', '650', '邹城华煤工矿设备有限公司', null, '15898634235', null, '工业园', null, null, '2019-08-20 18:23:57', 'collect');
INSERT INTO `sys_company` VALUES ('15898739393', '015003', '545', '淄博三元换热设备有限公司', null, '15898739393', null, '淄博市博山区淄博市博山区土门头路9号', null, null, '2019-08-20 18:22:21', 'collect');
INSERT INTO `sys_company` VALUES ('15900888742', '009001', '951', '臻淼（上海）供水设备制造有限公司', null, '15900888742', null, '柘林镇新林路578号', null, null, '2019-08-20 19:22:45', 'collect');
INSERT INTO `sys_company` VALUES ('15900990400', '009007', '149', '上海铭万智能仪表有限公司', null, '15900990400', null, '普陀区真北路2500号2001室', null, null, '2019-08-05 15:40:20', 'collect');
INSERT INTO `sys_company` VALUES ('15901377790', '006013', '1107', '宏冠嘉业（北京）科贸有限公司', null, '15901377790', null, '北京市朝阳区东环北路13号', null, null, '2019-08-20 19:35:25', 'collect');
INSERT INTO `sys_company` VALUES ('15902956918', '027001', '933', '西安旌旗电子股份有限公司', null, '15902956918', null, '西安市雁塔区高新新区丈八六路11号旌旗科技产业园', null, null, '2019-08-20 19:22:43', 'collect');
INSERT INTO `sys_company` VALUES ('15903468850', '004001', '326', '清徐县北录树东森暖气片经销部', null, '15903468850', null, '北录树', null, null, '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_company` VALUES ('15916204197', '019004', '806', '珠海市京澳特电子有限公司', null, '15916204197', null, '兴华198号发泉大厦一楼A座', null, null, '2019-08-20 19:06:49', 'collect');
INSERT INTO `sys_company` VALUES ('15919418145', '019003', '914', '深圳市凯路创新科技有限公司', null, '15919418145', null, '西乡固戍红湾新村明金海工业区E栋', null, null, '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_company` VALUES ('15921483702', '009001', '261', '上海晟森环保科技有限公司销售部', null, '15921483702', null, '上海市浦东新区外高桥保税区基隆路1号汤臣国际贸易大厦613室', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('15921591628', '009001', '36', '上海艾稳自动化科技有限公司', null, '15921591628', null, '安亭镇震川路39号', null, null, '2019-08-05 15:39:47', 'collect');
INSERT INTO `sys_company` VALUES ('15922250295', '002010', '796', '天津亚鸿节能热控科技有限公司', null, '15922250295', null, '天津市东丽区大毕庄北方五金城D17--123', null, null, '2019-08-20 18:47:38', 'collect');
INSERT INTO `sys_company` VALUES ('15927166215', '017001', '1022', '陈少彬 （个体经营)', null, '15927166215', null, '湖北武汉江岸区统一街楚风阁12楼', null, null, '2019-08-20 19:23:02', 'collect');
INSERT INTO `sys_company` VALUES ('15930380560', '003011', '430', '冀州市爱春散热器有限责任公司', null, '15930380560', null, '冀州市冀州市冀码路89号', null, null, '2019-08-05 18:58:08', 'collect');
INSERT INTO `sys_company` VALUES ('15933292016', '003009', '220', '沧州金旭采暖设备有限公司', null, '15933292016', null, '新开路村', null, null, '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_company` VALUES ('15934112333', '015001', '171', '济南市天桥区德暖建材经营部', null, '15934112333', null, '小清河北路和蓝翔路十字路口往西600米“德佳机器对面”', null, null, '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_company` VALUES ('15949803008', '015009', '620', '泰安市一诺电子科技有限公司', null, '15949803008', null, '泰安市泰山区泰前大街东首', null, null, '2019-08-20 18:23:09', 'collect');
INSERT INTO `sys_company` VALUES ('15952904688', '010011', '482', '镇江新区大路龙腾电子散热器厂', null, '15952904688', null, '镇江新区大路镇西戴村顾家巷', null, null, '2019-08-05 19:50:59', 'collect');
INSERT INTO `sys_company` VALUES ('15953699597', '015007', '612', '潍坊云雁电子有限公司', null, '15953699597', null, '银通大厦', null, null, '2019-08-20 18:23:07', 'collect');
INSERT INTO `sys_company` VALUES ('15957888696', '011002', '802', '宁波长三角水表有限公司', null, '15957888696', null, '新浦镇西街村仁丁路70号', null, null, '2019-08-20 18:47:39', 'collect');
INSERT INTO `sys_company` VALUES ('15959154529', '013001', '113', '福州图瑞工业自动化设备有限公司', null, '15959154529', null, '福州仓山区金山水印长天', null, null, '2019-08-05 15:40:15', 'collect');
INSERT INTO `sys_company` VALUES ('15961289738', '010004', '106', '常州酷特仪器仪表有限公司', null, '15961289738', null, '科教城科教会堂南四楼', null, null, '2019-08-05 15:40:13', 'collect');
INSERT INTO `sys_company` VALUES ('15961702012', '010002', '361', '无锡弘腾众辉暖通设备有限公司', null, '15961702012', null, '友谊南路83号', null, null, '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_company` VALUES ('15963612288', '015007', '382', '诸城市舜王暖通设备厂', null, '15963612288', null, '开发区横五路', null, null, '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_company` VALUES ('15964485757', '015003', '384', '桓台县起凤镇锐志水暖器材厂', null, '15964485757', null, '起凤镇辛泉村', null, null, '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_company` VALUES ('15965338414', '015003', '368', '桓台县起凤镇彤邦暖气片厂', null, '15965338414', null, '淄博市桓台', null, null, '2019-08-05 17:28:36', 'collect');
INSERT INTO `sys_company` VALUES ('15966046004', '015009', '6', '泰安市丰华电子有限公司', null, '15966046004', null, '泰安市泰山区环山路', null, null, '2019-08-05 15:39:41', 'collect');
INSERT INTO `sys_company` VALUES ('15968090937', '019003', '896', '富聚水表科技(深圳)有限公司', null, '15968090937', null, '横街工业区', null, null, '2019-08-20 19:21:51', 'collect');
INSERT INTO `sys_company` VALUES ('15970780712', '014007', '781', '金鑫水电材料制品中心', null, '15970780712', null, '赣州市金丰路C1-10号九牧管店【万福人家斜对面】', null, null, '2019-08-20 18:24:15', 'collect');
INSERT INTO `sys_company` VALUES ('15974149233', '018001', '626', '长沙恒恩自动化成套设备有限公司', null, '15974149233', null, '中意一路红星现代商务中心B4062', null, null, '2019-08-20 18:23:10', 'collect');
INSERT INTO `sys_company` VALUES ('15975260953', '019010', '510', '广东高登铝业有限公司', null, '15975260953', null, '四会市大沙镇南江工业园工业大道21号', null, null, '2019-08-05 19:52:06', 'collect');
INSERT INTO `sys_company` VALUES ('15978164228', '020001', '919', '南宁市泰至塑胶经营部', null, '15978164228', null, '南宁市良庆区银海大道路581号（胶管批发场地）', null, null, '2019-08-20 19:22:39', 'collect');
INSERT INTO `sys_company` VALUES ('15986380205', '019001', '639', '清远市骏宇化工有限公司', null, '15986380205', null, '广州市番禺区市莲路石楼路段239号花城创意产业园', null, null, '2019-08-20 18:23:52', 'collect');
INSERT INTO `sys_company` VALUES ('15988671717', '011002', '961', '宁波市宏顺机械电器仪表厂', null, '15988671717', null, '宁波市江北区洪塘投资创业B区北海路238弄西邵318号北门', null, null, '2019-08-20 19:22:46', 'collect');
INSERT INTO `sys_company` VALUES ('15988865996', '011001', '784', '杭州长城机电市场贵龙阀门经营部', null, '15988865996', null, '长城机电市场北区263号', null, null, '2019-08-20 18:24:15', 'collect');
INSERT INTO `sys_company` VALUES ('15991665573', '027001', '900', '陕西君昊机电设备有限公司', null, '15991665573', null, '西安市未央区汇景国际建材城C5-5', null, null, '2019-08-20 19:21:51', 'collect');
INSERT INTO `sys_company` VALUES ('15991893576', '027001', '144', '西安居然楼宇智能自动化有限公司', null, '15991893576', null, '自强西路口新元大厦A座1106室', null, null, '2019-08-05 15:40:19', 'collect');
INSERT INTO `sys_company` VALUES ('15998551030', '006002', '1069', '大连海峰仪器发展有限公司', null, '15998551030', null, '龙头分园龙兴路51号', null, null, '2019-08-20 19:25:18', 'collect');
INSERT INTO `sys_company` VALUES ('15999658296', '019003', '622', '深圳市领路达方电子科技有限公司', null, '15999658296', null, '宝安区龙华民治街道3栋2楼B区', null, null, '2019-08-20 18:23:09', 'collect');
INSERT INTO `sys_company` VALUES ('15999729348', '019017', '65', '东莞市向达仪器有限公司', null, '15999729348', null, '东莞市南城区袁屋边沙井头坊五巷二号', null, null, '2019-08-05 15:39:55', 'collect');
INSERT INTO `sys_company` VALUES ('15999808957', '019017', '730', '东莞市莞城凯泰水暖器材经营部', null, '15999808957', null, '东莞市莞城新苑街17巷1号', null, null, '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_company` VALUES ('17068020942', '012001', '86', '合肥南鼎智能科技有限公司', null, '17068020942', null, '合肥市蜀山区科园创业中心1#208', null, null, '2019-08-05 15:40:03', 'collect');
INSERT INTO `sys_company` VALUES ('17094016479', '019017', '87', '东莞市虎门群美机电经营部', null, '17094016479', null, '东莞市虎门镇北栅358省道723号铺位', null, null, '2019-08-05 15:40:03', 'collect');
INSERT INTO `sys_company` VALUES ('17096185340', '016001', '84', '巩义市电子仪器厂', null, '17096185340', null, '河南省巩义市南环西路工商新村南', null, null, '2019-08-05 15:40:02', 'collect');
INSERT INTO `sys_company` VALUES ('17172930609', '019001', '503', '广州希铭仪器有限公司', null, '17172930609', null, '广州市天河区荟龙路12号之一1301房', null, null, '2019-08-05 19:51:13', 'collect');
INSERT INTO `sys_company` VALUES ('17303816163', '016001', '89', '郑州硕硕商贸有限公司', null, '17303816163', null, '郑州市中原区航海西路与西三环交叉口', null, null, '2019-08-05 15:40:03', 'collect');
INSERT INTO `sys_company` VALUES ('17395035528', '030001', '143', '宁夏隆基智能电子科技有限公司', null, '17395035528', null, '工业园区平运路2号', null, null, '2019-08-05 15:40:19', 'collect');
INSERT INTO `sys_company` VALUES ('17632100210', '003008', '23', '承德龙志达智能仪器仪表科技有限公司', null, '17632100210', null, '河北省承德市高新技术产业开发区电子工业园区龙志达路3号', null, null, '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_company` VALUES ('17692710196', '003005', '1060', '河北旭康仪表制造有限公司', null, '17692710196', null, '中国 河北省 邢台市 威县经济开发区银海路7号', null, null, '2019-08-20 19:23:11', 'collect');
INSERT INTO `sys_company` VALUES ('17705421226', '015017', '140', '山东水立方电子有限责任公司', null, '17705421226', null, '太湖路1919号', null, null, '2019-08-05 15:40:18', 'collect');
INSERT INTO `sys_company` VALUES ('17708458503', '018001', '816', '湖南沃尔特水设备有限公司', null, '17708458503', null, '高新区咸嘉湖西路338号翡翠华庭5栋508', null, null, '2019-08-20 19:21:35', 'collect');
INSERT INTO `sys_company` VALUES ('17721194048', '009003', '1076', '广发伟业（北京）科技有限公司', null, '17721194048', null, '上海市杨浦区黄兴路1818号', null, null, '2019-08-20 19:25:20', 'collect');
INSERT INTO `sys_company` VALUES ('17722001233', '019003', '574', '深圳市怀忆电子科技有限公司', null, '17722001233', null, '深圳市龙华新区龙华街道大和路硅谷动力清湖园竟凯大厦326室', null, null, '2019-08-20 18:22:27', 'collect');
INSERT INTO `sys_company` VALUES ('17732221909', '003006', '102', '保定市华青仪器仪表有限公司', null, '17732221909', null, '三丰中路543号', null, null, '2019-08-05 15:40:10', 'collect');
INSERT INTO `sys_company` VALUES ('17753203092', '015002', '870', '青岛伊日电子科技有限公司', null, '17753203092', null, '王沙路438号', null, null, '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_company` VALUES ('17753815709', '015009', '152', '泰安创拓表计电子有限公司', null, '17753815709', null, '山东泰安高新开发区', null, null, '2019-08-05 15:40:23', 'collect');
INSERT INTO `sys_company` VALUES ('17800219883', '001012', '839', '北京山川众合科技发展有限公司', null, '17800219883', null, '北京市顺义区南陈路118号', null, null, '2019-08-20 19:21:42', 'collect');
INSERT INTO `sys_company` VALUES ('18002087942', '002012', '4', '天津金凤来仪科技有限公司', null, '18002087942', null, '天津市津南区双港工业园区楚惟大厦（慧科路7号）', null, null, '2019-08-05 15:39:39', 'collect');
INSERT INTO `sys_company` VALUES ('18002087950', '002001', '601', '天津市新天智能仪表科技有限公司', null, '18002087950', null, '双港工作园区惠科路7号楚惟大厦', null, null, '2019-08-20 18:22:52', 'collect');
INSERT INTO `sys_company` VALUES ('18002507615', '019003', '1079', '深圳市领路达方电子科技有限公司', null, '18002507615', null, '民治民兴工业区一号楼四层', null, null, '2019-08-20 19:25:21', 'collect');
INSERT INTO `sys_company` VALUES ('18006653288', '011002', '912', '余姚市雷普日用品厂', null, '18006653288', null, '浙江余姚市阳明工业区', null, null, '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_company` VALUES ('18008467985', '018001', '678', '湖南中建供水设备有限责任公司', null, '18008467985', null, '雨花区中意一路66号', null, null, '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_company` VALUES ('18008477149', '018001', '1027', '湖南诚铭供水设备有限公司', null, '18008477149', null, '金井路99号颐和佳园3栋', null, null, '2019-08-20 19:23:03', 'collect');
INSERT INTO `sys_company` VALUES ('18009915099', '003009', '892', '泊头市普惠仪表有限公司', null, '18009915099', null, '米东北路***号', null, null, '2019-08-20 19:21:50', 'collect');
INSERT INTO `sys_company` VALUES ('18011778966', '019001', '860', '广州广一泵业有限公司', null, '18011778966', null, '广州市海珠区科韵南路133号', null, null, '2019-08-20 19:21:45', 'collect');
INSERT INTO `sys_company` VALUES ('18012531632', '010009', '596', '江苏华厦给排水科技有限公司', null, '18012531632', null, '江苏建湖民营科技创业园', null, null, '2019-08-20 18:22:38', 'collect');
INSERT INTO `sys_company` VALUES ('18012669172', '010005', '66', '颖远仪器科技（苏州）有限公司', null, '18012669172', null, '昆山市张浦镇新江路18号', null, null, '2019-08-05 15:39:55', 'collect');
INSERT INTO `sys_company` VALUES ('18015380190', '010001', '60', '江苏斯菲尔电气股份有限公司', null, '18015380190', null, '江苏省江阴市澄江东路99号', null, null, '2019-08-05 15:39:54', 'collect');
INSERT INTO `sys_company` VALUES ('18017067606', '009001', '495', '上海佑晟铝业有限公司', null, '18017067606', null, '洞泾镇蔡家浜路999号', null, null, '2019-08-05 19:51:12', 'collect');
INSERT INTO `sys_company` VALUES ('18023075813', '019004', '1123', '珠海艾迪西软件科技有限公司', null, '18023075813', null, '乾务镇富山工业园海鸥卫浴16栋4楼', null, null, '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_company` VALUES ('18028262969', '019017', '488', '东莞市智高实业有限公司', null, '18028262969', null, '东莞市大朗镇美景西路 大冚墟正街163号', null, null, '2019-08-05 19:51:01', 'collect');
INSERT INTO `sys_company` VALUES ('18028298784', '019017', '487', '东莞市东坑骏泰机电设备经营部', null, '18028298784', null, '东坑镇东坑大道南435号', null, null, '2019-08-05 19:51:01', 'collect');
INSERT INTO `sys_company` VALUES ('18031886699', '003011', '207', '河北春光暖气片有限责任公司', null, '18031886699', null, '衡水市冀州区工业园区', null, null, '2019-08-05 17:28:22', 'collect');
INSERT INTO `sys_company` VALUES ('18032169437', '003001', '507', '石家庄永欣干燥设备有限公司', null, '18032169437', null, '石家庄无极县张段固工业区', null, null, '2019-08-05 19:51:14', 'collect');
INSERT INTO `sys_company` VALUES ('18036286369', '010009', '758', '江苏华厦给排水科技有限公司', null, '18036286369', null, '建湖科技创业园', null, null, '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_company` VALUES ('18036288553', '010009', '857', '江苏华厦给排水科技有限公司', null, '18036288553', null, '建湖县建阳科技创业园华夏路1号', null, null, '2019-08-20 19:21:44', 'collect');
INSERT INTO `sys_company` VALUES ('18036289030', '010009', '742', '江苏华厦给排水科技有限公司', null, '18036289030', null, '江苏建湖县民营科技创业园4号29号', null, null, '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_company` VALUES ('18036952863', '010013', '906', '江苏中科君达电子科技有限公司', null, '18036952863', null, '经济开发区苏州路8号', null, null, '2019-08-20 19:22:37', 'collect');
INSERT INTO `sys_company` VALUES ('18037270632', '016001', '91', '郑州鼎恒电子科技有限公司', null, '18037270632', null, '河南省郑州市高新区电子电器产业园西区9号楼3单元2层', null, null, '2019-08-05 15:40:05', 'collect');
INSERT INTO `sys_company` VALUES ('18039778129', '013007', '701', '福建凯泉泵业有限公司', null, '18039778129', null, '建阳市海西工贸城1-03（2）地块', null, null, '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_company` VALUES ('18049296191', '027001', '636', '西安甘霖机电科技有限公司', null, '18049296191', null, '莲湖区开远半岛1号楼3009室', null, null, '2019-08-20 18:23:42', 'collect');
INSERT INTO `sys_company` VALUES ('18053766998', '015008', '115', '济宁五颗星表计有限公司', null, '18053766998', null, '高新区同济路125号', null, null, '2019-08-05 15:40:15', 'collect');
INSERT INTO `sys_company` VALUES ('18067703039', '011010', '931', '玉环县勇增机械有限公司', null, '18067703039', null, '汽摩工业区', null, null, '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_company` VALUES ('18068883691', '010009', '777', '盐城金球不锈钢有限公司', null, '18068883691', null, '民营工业园陈堡路10号', null, null, '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_company` VALUES ('18073139090', '018001', '770', '长沙优控自动化科技有限公司', null, '18073139090', null, '长沙市芙蓉南路481号上林国际1栋', null, null, '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_company` VALUES ('18075185708', '018001', '1049', '长沙市长方供水设备有限公司', null, '18075185708', null, '长沙市雨花区红星国际C栋1088号', null, null, '2019-08-20 19:23:09', 'collect');
INSERT INTO `sys_company` VALUES ('18098970189', '019003', '877', '深圳合众致达科技有限公司', null, '18098970189', null, '南山区', null, null, '2019-08-20 19:21:47', 'collect');
INSERT INTO `sys_company` VALUES ('18105116620', '010009', '827', '江苏铭星供水设备有限公司', null, '18105116620', null, '科技创业园铭星北路1号', null, null, '2019-08-20 19:21:39', 'collect');
INSERT INTO `sys_company` VALUES ('18108415046', '018001', '864', '长沙知昌供水设备有限公司', null, '18108415046', null, '张公岭知昌路', null, null, '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_company` VALUES ('18116155126', '009001', '828', '上海羿博仪器仪表有限公司', null, '18116155126', null, '佘山镇天宅路215号', null, null, '2019-08-20 19:21:40', 'collect');
INSERT INTO `sys_company` VALUES ('18119623681', '012001', '280', '德国银屋暖通国际', null, '18119623681', null, '政务区潜山南路188号蔚蓝商务港A座402', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('18121210715', '009001', '266', '上海锦韵环境设备工程有限公司', null, '18121210715', null, '上海市浦东新区沪南路3168号三楼北面', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('18122828888', '019017', '476', '东莞市天文光电科技有限公司', null, '18122828888', null, '长安镇建安路振华园C座', null, null, '2019-08-05 19:50:58', 'collect');
INSERT INTO `sys_company` VALUES ('18123850239', '019003', '987', '深圳市创新高飞科技有限公司', null, '18123850239', null, '龙华新区大浪街道同胜社区上横朗新工业区二栋9楼F', null, null, '2019-08-20 19:22:50', 'collect');
INSERT INTO `sys_company` VALUES ('18144000278', '013001', '119', '福州天助人和信息技术有限公司', null, '18144000278', null, '福州市仓山区万达广场', null, null, '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_company` VALUES ('18152309850', '030001', '120', '宁夏银创智能电子有限公司', null, '18152309850', null, '银川市兴庆区丽景街商贸城33-28', null, null, '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_company` VALUES ('18165156441', '027001', '948', '陕西秉峰工贸有限公司', null, '18165156441', null, '大庆路129号', null, null, '2019-08-20 19:22:45', 'collect');
INSERT INTO `sys_company` VALUES ('18186513301', '017001', '966', '武汉星世弘仪表有限公司', null, '18186513301', null, '阳逻经济开发区金阳大道8号', null, null, '2019-08-20 19:22:47', 'collect');
INSERT INTO `sys_company` VALUES ('18209256871', '027001', '72', '西安旭之辉机电科技有限公司', null, '18209256871', null, '西安市碑林区火炬路18号楼创业园三层', null, null, '2019-08-05 15:39:59', 'collect');
INSERT INTO `sys_company` VALUES ('18210363881', '001010', '973', '北京蓝海宇达光电科技有限公司', null, '18210363881', null, '北京市房山区城关街道顾八路', null, null, '2019-08-20 19:22:48', 'collect');
INSERT INTO `sys_company` VALUES ('18210603867', '001007', '704', '北京德能杰米特科技有限公司', null, '18210603867', null, '北京市石景山区八达岭处路22号国防教育训练基地教学楼天爵酒店6层6061房间', null, null, '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_company` VALUES ('18215151614', '028001', '317', '陇星集团-兰州沃尔凯采暖设备制造有限公司', null, '18215151614', null, '兰州高新技术开发区飞雁街118号陇星大厦', null, null, '2019-08-05 17:28:29', 'collect');
INSERT INTO `sys_company` VALUES ('18215678995', '023001', '341', '四川河图机电设备工程有限公司', null, '18215678995', null, '成都市青羊区二环路西一段99号附8号', null, null, '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_company` VALUES ('18216985284', '024001', '201', '贵州金阳如春暖通科技有限责任公司', null, '18216985284', null, '观山湖区会展城SOHO办公楼F座3-14号', null, null, '2019-08-05 17:28:21', 'collect');
INSERT INTO `sys_company` VALUES ('18222233678', '001001', '406', '北京圣世德斯暖通科技有限公司', null, '18222233678', null, '大华山镇大华山工业园区', null, null, '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_company` VALUES ('18222758872', '002011', '780', '天津市华仪晨隆科技有限公司', null, '18222758872', null, '天津市西青区精武镇工业园区', null, null, '2019-08-20 18:24:15', 'collect');
INSERT INTO `sys_company` VALUES ('18226551033', '012003', '1104', '安徽优提普自控系统有限公司', null, '18226551033', null, '安徽省蚌埠市怀远经济开发区', null, null, '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_company` VALUES ('18229498600', '018001', '642', '湖南中赢环保设备有限公司', null, '18229498600', null, '湖南省长沙市雨花区香樟路云集大厦1302', null, null, '2019-08-20 18:23:53', 'collect');
INSERT INTO `sys_company` VALUES ('18229499117', '018001', '585', '长沙中赢环保科技有限公司', null, '18229499117', null, '长沙市芙蓉区左岸右岸B座2310', null, null, '2019-08-20 18:22:30', 'collect');
INSERT INTO `sys_company` VALUES ('18229782903', '018001', '698', '长沙中梁供水设备有限公司', null, '18229782903', null, '长沙市天心区芙蓉中路三段建鸿达现代空间A座1306室', null, null, '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_company` VALUES ('18229872287', '018001', '738', '河南中梁供水设备有限公司', null, '18229872287', null, '长沙市天心区芙蓉中路三段558号建鸿达现代空间A座1306室', null, null, '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_company` VALUES ('18229878270', '018001', '779', '长沙中梁供水设备有限公司', null, '18229878270', null, '芙蓉中路三段558号建鸿达现代空间一栋1306', null, null, '2019-08-20 18:24:15', 'collect');
INSERT INTO `sys_company` VALUES ('18229972269', '018001', '660', '长沙中梁供水有限公司', null, '18229972269', null, '长沙市岳麓区和顺路269号合能洋湖公馆二期二栋1301-1', null, null, '2019-08-20 18:24:02', 'collect');
INSERT INTO `sys_company` VALUES ('18232188191', '003001', '679', '河北大霖环保设备有限公司', null, '18232188191', null, '石家庄藁城区岗上镇东邑村村西800米处', null, null, '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_company` VALUES ('18242474111', '006006', '926', '辽宁东仪自控技术股份有限公司', null, '18242474111', null, '辽宁丹东临港产业园区仪器仪表产业基地启动区标准厂房文庆路70-20', null, null, '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_company` VALUES ('18253158566', '015001', '963', '山东国信工业设备有限公司', null, '18253158566', null, '五峰山工业园', null, null, '2019-08-20 19:22:47', 'collect');
INSERT INTO `sys_company` VALUES ('18253485377', '015014', '936', '德州普铭电气设备有限公司', null, '18253485377', null, '德州市德城区东北城建材二区', null, null, '2019-08-20 19:22:43', 'collect');
INSERT INTO `sys_company` VALUES ('18256953135', '012001', '215', '安徽金泽暖通工程有限公司', null, '18256953135', null, '安徽省合肥市包河区马鞍山路与皖江路交口向东五十米金泽供暖二楼', null, null, '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_company` VALUES ('18264742888', '015008', '370', '山东东辉散热器有限公司', null, '18264742888', null, '李营镇李营工业园', null, null, '2019-08-05 17:28:36', 'collect');
INSERT INTO `sys_company` VALUES ('18266505658', '015009', '64', '山东风光机电有限公司', null, '18266505658', null, '泰安市高新区凤翔路规划支路', null, null, '2019-08-05 15:39:55', 'collect');
INSERT INTO `sys_company` VALUES ('18301475883', '001012', '688', '北京智能水表厂', null, '18301475883', null, '北京市顺义区牛栏山工业区牛汇北五街九号', null, null, '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_company` VALUES ('18332750808', '003002', '35', '天津欧莱克仪器仪表有限公司', null, '18332750808', null, '高新区创业服务中心C座五楼', null, null, '2019-08-05 15:39:46', 'collect');
INSERT INTO `sys_company` VALUES ('18332816520', '003006', '442', '徐水县四通散热器制造有限公司', null, '18332816520', null, '徐水县高林村镇申庄村', null, null, '2019-08-05 19:02:59', 'collect');
INSERT INTO `sys_company` VALUES ('18333808487', '003001', '386', '冀州市圣烨采暖设备有限责任公司', null, '18333808487', null, '冀码路54公里处路南', null, null, '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_company` VALUES ('18351385817', '009001', '851', '上海中一泵业制造有限公司', null, '18351385817', null, '沪青平公路5599弄113号201室', null, null, '2019-08-20 19:21:43', 'collect');
INSERT INTO `sys_company` VALUES ('18356017654', '012001', '236', '合肥恒暖暖通设备有限公司', null, '18356017654', null, '安徽省合肥市政务区潜山南路188号蔚蓝商务港', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('18370595554', '011003', '489', '浙江昆二晶整流器有限公司', null, '18370595554', null, '乐清市象阳镇工业区百特路2号', null, null, '2019-08-05 19:51:06', 'collect');
INSERT INTO `sys_company` VALUES ('18373140190', '018001', '638', '长沙远科供水设备有限公司', null, '18373140190', null, '长沙市雨花区中意一路66号亚商大厦1栋2823号', null, null, '2019-08-20 18:23:43', 'collect');
INSERT INTO `sys_company` VALUES ('18390836131', '018001', '884', '湖南智康环保节能科技有限公司', null, '18390836131', null, '湖南省长沙市雨花区五金机电市场D区6栋114', null, null, '2019-08-20 19:21:49', 'collect');
INSERT INTO `sys_company` VALUES ('18390904696', '018001', '831', '湖南华振供水设备有限公司', null, '18390904696', null, '雨花区湘府东路二段517号红星国际大厦B座28层', null, null, '2019-08-20 19:21:40', 'collect');
INSERT INTO `sys_company` VALUES ('18390917003', '018001', '576', '长沙中赢供水设备有限公司', null, '18390917003', null, '雨花区韶山北路480号三重大厦', null, null, '2019-08-20 18:22:28', 'collect');
INSERT INTO `sys_company` VALUES ('18390972823', '018001', '872', '湖南长沙中赢供水设备有限公司', null, '18390972823', null, '雨花区人民中路左岸右岸B座2310', null, null, '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_company` VALUES ('18505209009', '010004', '20', '常州鑫铭禹电子科技有限公司', null, '18505209009', null, '武进区科教城创研港2号楼 3B 7层', null, null, '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_company` VALUES ('18508435814', '018001', '832', '威胜集团有限公司', null, '18508435814', null, '国家高新技术产业开发区桐梓坡西路468号', null, null, '2019-08-20 19:21:40', 'collect');
INSERT INTO `sys_company` VALUES ('18508477249', '018001', '737', '长沙中梁供水设备有限公司', null, '18508477249', null, '长沙市天心区芙蓉中路三段558建鸿达现代空间Ａ座30楼', null, null, '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_company` VALUES ('18509280980', '027004', '999', '杨凌鸿宇智能科技有限公司', null, '18509280980', null, '水运东路8号', null, null, '2019-08-20 19:22:52', 'collect');
INSERT INTO `sys_company` VALUES ('18510275953', '001010', '1077', '涿州晟泽鸿通节能设备有限公司', null, '18510275953', null, '北京市房山区天星街1号院14号楼1817室', null, null, '2019-08-20 19:25:20', 'collect');
INSERT INTO `sys_company` VALUES ('18522251970', '002001', '61', '天津市新天智能仪表科技有限公司', null, '18522251970', null, '鑫茂科技园', null, null, '2019-08-05 15:39:54', 'collect');
INSERT INTO `sys_company` VALUES ('18531358559', '015001', '649', '山东国翔仪表有限公司', null, '18531358559', null, '北京', null, null, '2019-08-20 18:23:57', 'collect');
INSERT INTO `sys_company` VALUES ('18537750850', '016013', '940', '郭松伟', null, '18537750850', null, '南阳市南阳市高新技术开发区', null, null, '2019-08-20 19:22:43', 'collect');
INSERT INTO `sys_company` VALUES ('18538806022', '016003', '499', '洛阳瑞鑫盛电热科技有限公司', null, '18538806022', null, '洛阳市西工区红山乡五洲国际', null, null, '2019-08-05 19:51:13', 'collect');
INSERT INTO `sys_company` VALUES ('18553822812', '015009', '662', '山东丰功电子科技有限公司', null, '18553822812', null, '中国 山东 泰安市 泰山区佛光路302号', null, null, '2019-08-20 18:24:03', 'collect');
INSERT INTO `sys_company` VALUES ('18553876533', '015009', '141', '山东贝能电子科技有限公司', null, '18553876533', null, '泰安市泰山区明堂路中段', null, null, '2019-08-05 15:40:18', 'collect');
INSERT INTO `sys_company` VALUES ('18560177973', '015001', '50', '济南工达捷能科技发展有限公司', null, '18560177973', null, '高新区环保科技园国际商务中心B座', null, null, '2019-08-05 15:39:51', 'collect');
INSERT INTO `sys_company` VALUES ('18560292197', '015003', '945', '淄博海容水处理设备有限公司', null, '18560292197', null, '淄博临淄一诺路南首', null, null, '2019-08-20 19:22:44', 'collect');
INSERT INTO `sys_company` VALUES ('18565115694', '019001', '690', '广州昆正阀门有限公司', null, '18565115694', null, '棠东商业大夏', null, null, '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_company` VALUES ('18569072902', '018001', '853', '湖南凌宏环保设备有限公司', null, '18569072902', null, '长沙环保工业园', null, null, '2019-08-20 19:21:43', 'collect');
INSERT INTO `sys_company` VALUES ('18573627127', '018001', '1018', '长沙中赢供水设备有限公司', null, '18573627127', null, '湖南省长沙市雨花区香樟路云集大厦1305', null, null, '2019-08-20 19:22:59', 'collect');
INSERT INTO `sys_company` VALUES ('18581853739', '023001', '606', '四川博海供水设备有限公司', null, '18581853739', null, '成都市二环路西三段119号金港湾商务楼二楼35-37号', null, null, '2019-08-20 18:23:00', 'collect');
INSERT INTO `sys_company` VALUES ('18600070290', '001001', '905', '北京东联华安仪表科技有限公司', null, '18600070290', null, '百善镇二德庄村南宏鑫工业园内', null, null, '2019-08-20 19:22:37', 'collect');
INSERT INTO `sys_company` VALUES ('18600627712', '003010', '889', '廊坊德能智能仪表有限公司', null, '18600627712', null, '河北省廊坊市固安县工业园区南区世纪路东、中小企业南路', null, null, '2019-08-20 19:21:50', 'collect');
INSERT INTO `sys_company` VALUES ('18601781747', '009016', '718', '上海朗科阀业科技有限公司', null, '18601781747', null, '上海市青浦区工业园区北青公路', null, null, '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_company` VALUES ('18602245993', '002016', '300', '天津市宁河县双雅散热器厂', null, '18602245993', null, '宁河县天津市宁河县大北工业区内', null, null, '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_company` VALUES ('18602688560', '027004', '786', '天津启隆机电设备有限公司', null, '18602688560', null, '咸阳路蓝馨大厦435室', null, null, '2019-08-20 18:24:16', 'collect');
INSERT INTO `sys_company` VALUES ('18602809709', '029005', '45', '南京大彻电子科技有限公司', null, '18602809709', null, '上海市宝山区长江西路200号316室', null, null, '2019-08-05 15:39:50', 'collect');
INSERT INTO `sys_company` VALUES ('18602809769', '009008', '46', '上海秉时测控技术有限公司', null, '18602809769', null, '上海市宝山区长江西路200号316室', null, null, '2019-08-05 15:39:50', 'collect');
INSERT INTO `sys_company` VALUES ('18605334908', '015003', '815', '博山二泵水泵厂', null, '18605334908', null, '淄博市博山区秋谷横里河57号', null, null, '2019-08-20 19:21:35', 'collect');
INSERT INTO `sys_company` VALUES ('18605385506', '015009', '920', '泰安科维电子科技有限公司', null, '18605385506', null, '泰安市岱岳区大汶口工业园', null, null, '2019-08-20 19:22:39', 'collect');
INSERT INTO `sys_company` VALUES ('18605856277', '011006', '356', '丹妮珂水暖五金店', null, '18605856277', null, '华东水暖城35栋886', null, null, '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_company` VALUES ('18606161086', '010003', '129', '徐州润物科技发展有限公司', null, '18606161086', null, '徐州经济技术开发区汇金路5号', null, null, '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_company` VALUES ('18606198581', '010001', '27', '南京梦溪测绘技术有限公司', null, '18606198581', null, '四平二路191号', null, null, '2019-08-05 15:39:43', 'collect');
INSERT INTO `sys_company` VALUES ('18608408680', '018001', '810', '湖南纵天电气设备有限责任公司', null, '18608408680', null, '枫林路608号罗马商业广场A座7016室', null, null, '2019-08-20 19:21:34', 'collect');
INSERT INTO `sys_company` VALUES ('18610499588', '001001', '898', '北京中铂钢联金属制品有限公司', null, '18610499588', null, '三台山路小红门不锈钢城A14栋10-11（4号门）', null, null, '2019-08-20 19:21:51', 'collect');
INSERT INTO `sys_company` VALUES ('18610735121', '001013', '334', '北京北七家京晋盛隆五金水暖门市部', null, '18610735121', null, '北京市昌平区北七家镇东沙各庄村80号', null, null, '2019-08-05 17:28:33', 'collect');
INSERT INTO `sys_company` VALUES ('18611133089', '006013', '1044', '北京华煜博远科技发展有限公司', null, '18611133089', null, '朝阳区慈云寺桥住邦2000商务楼2座2205室', null, null, '2019-08-20 19:23:08', 'collect');
INSERT INTO `sys_company` VALUES ('18611368869', '001001', '369', '北京圣劳伦斯散热器制造有限公司', null, '18611368869', null, '公益西桥城南大道', null, null, '2019-08-05 17:28:36', 'collect');
INSERT INTO `sys_company` VALUES ('18611682686', '001013', '1115', '北京高标自控设备有限公司', null, '18611682686', null, '北京市昌平区昌平路97号京昌高科技产业园', null, null, '2019-08-20 19:35:26', 'collect');
INSERT INTO `sys_company` VALUES ('18611697733', '001001', '101', '北京盛世昌华科技有限公司', null, '18611697733', null, '中关村科技园仁和路4号', null, null, '2019-08-05 15:40:10', 'collect');
INSERT INTO `sys_company` VALUES ('18612372798', '001012', '598', '北京逸海卓诚科技有限公司', null, '18612372798', null, '北京市顺义区顺高路临10号', null, null, '2019-08-20 18:22:45', 'collect');
INSERT INTO `sys_company` VALUES ('18614088757', '001001', '3', '北京域能汇通科技有限公司', null, '18614088757', null, '立清路8号院', null, null, '2019-08-05 15:39:39', 'collect');
INSERT INTO `sys_company` VALUES ('18615531169', '015001', '63', '济南杰工衡器有限公司', null, '18615531169', null, '济南市槐荫区美里路工业园', null, null, '2019-08-05 15:39:55', 'collect');
INSERT INTO `sys_company` VALUES ('18616302865', '009015', '577', '上海双解给排水设备有限公司', null, '18616302865', null, '上海市金山区亭林镇南亭公路5305号', null, null, '2019-08-20 18:22:28', 'collect');
INSERT INTO `sys_company` VALUES ('18618118515', '006013', '1102', '天正瑞德工程技术有限公司', null, '18618118515', null, '北京市朝阳区朝阳路红星美凯龙3F-天正地暖旗舰店', null, null, '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_company` VALUES ('18621747778', '009017', '722', '上海日泉泵业制造有限公司', null, '18621747778', null, '上海市奉贤区上海市浦东新区浦三路', null, null, '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_company` VALUES ('18621994001', '007003', '116', '上海驰浦电子有限公司', null, '18621994001', null, '四平路775弄1号804', null, null, '2019-08-05 15:40:15', 'collect');
INSERT INTO `sys_company` VALUES ('18622115002', '001016', '398', '北京枫度暖通设备有限公司', null, '18622115002', null, '北京市怀柔经济开发区', null, null, '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_company` VALUES ('18622238076', '010001', '670', '天津赛力斯自动化科技有限公司', null, '18622238076', null, '南京路235号河川大厦A座26A', null, null, '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_company` VALUES ('18622815981', '002016', '365', '天津华诺散热制品有限公司', null, '18622815981', null, '天津市宁河县芦台镇', null, null, '2019-08-05 17:28:36', 'collect');
INSERT INTO `sys_company` VALUES ('18624392677', '006002', '1072', '大连圣世援测控技术有限公司', null, '18624392677', null, '华东路94号', null, null, '2019-08-20 19:25:19', 'collect');
INSERT INTO `sys_company` VALUES ('18629019851', '027001', '589', '陕西凯普威机电科技有限公司', null, '18629019851', null, '唐延路41号通达国际大厦2207', null, null, '2019-08-20 18:22:32', 'collect');
INSERT INTO `sys_company` VALUES ('18630124443', '003001', '1013', '河北精金电器有限公司', null, '18630124443', null, '时光街与裕华路交叉口世纪公馆', null, null, '2019-08-20 19:22:57', 'collect');
INSERT INTO `sys_company` VALUES ('18630360055', '003003', '53', '秦皇岛富田电气设备有限公司', null, '18630360055', null, '秦皇岛市北戴河区牛头崖镇戴河新城A区25号门市', null, null, '2019-08-05 15:39:52', 'collect');
INSERT INTO `sys_company` VALUES ('18631811018', '003011', '198', '冀州市昊春暖通设备有限公司', null, '18631811018', null, '工业园区滏阳路顺平街', null, null, '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_company` VALUES ('18631818387', '003011', '203', '冀州市超春暖气片有限公司', null, '18631818387', null, '冀州镇小漳村村南', null, null, '2019-08-05 17:28:22', 'collect');
INSERT INTO `sys_company` VALUES ('18631838625', '003011', '372', '冀州市周村镇金典采暖设备销售处', null, '18631838625', null, '冀州市河北省冀州市', null, null, '2019-08-05 17:28:36', 'collect');
INSERT INTO `sys_company` VALUES ('18631840702', '003011', '352', '冀州市昊日阳光太阳能热水器厂', null, '18631840702', null, '河北省冀州市城南两公里高新技术开发区', null, null, '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_company` VALUES ('18631895108', '003011', '766', '河北鑫亿华仪表有限公司', null, '18631895108', null, '武强县河北省衡水市武强县城东开发区', null, null, '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_company` VALUES ('18632726822', '003009', '433', '李全胜', null, '18632726822', null, '任丘市于村乡西于村', null, null, '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_company` VALUES ('18632819932', '003011', '285', '衡水裕泽金属制品有限公司', null, '18632819932', null, '冀州区西环工业园区', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('18633027581', '003001', '982', '孙彦光（个体经营）', null, '18633027581', null, '石家庄市长安区石家庄鼎坚市场', null, null, '2019-08-20 19:22:49', 'collect');
INSERT INTO `sys_company` VALUES ('18633075361', '003001', '1054', '石家庄宇泉环保设备有限公司', null, '18633075361', null, '红旗大街南二环交口', null, null, '2019-08-20 19:23:10', 'collect');
INSERT INTO `sys_company` VALUES ('18633730883', '003009', '473', '任丘市瑞康采暖设备厂', null, '18633730883', null, '苟各庄镇黄召村', null, null, '2019-08-05 19:50:58', 'collect');
INSERT INTO `sys_company` VALUES ('18634412729', '004001', '817', '太原市安吉利达机电设备有限公司', null, '18634412729', null, '山西省太原市晋源区南堰新万水物贸城西外区55号', null, null, '2019-08-20 19:21:35', 'collect');
INSERT INTO `sys_company` VALUES ('18636882966', '004001', '234', '清徐县亚德威钢铝散热器厂', null, '18636882966', null, '清徐县山西省清徐县王答', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('18637923372', '016003', '254', '洛阳新生水暖制造有限公司', null, '18637923372', null, '洛阳市定鼎北路310国道北钢材城中路2号', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('18640095080', '006001', '21', '沈阳华博科技有限公司', null, '18640095080', null, '浑南新区世纪路22号火炬信息园304', null, null, '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_company` VALUES ('18653342091', '015003', '419', '桓台起凤镇铧炜散热器厂', null, '18653342091', null, '起凤镇穆寨村', null, null, '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_company` VALUES ('18653412699', '015014', '1070', '山东汇友玻璃钢股份公司', null, '18653412699', null, '山东德州武城鲁腾工业园', null, null, '2019-08-20 19:25:19', 'collect');
INSERT INTO `sys_company` VALUES ('18653605045', '015007', '224', '青州凯文暖气片厂', null, '18653605045', null, '云门山街道办事处', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('18653649899', '015007', '428', '王立国', null, '18653649899', null, '昌邑市', null, null, '2019-08-05 18:50:27', 'collect');
INSERT INTO `sys_company` VALUES ('18653673532', '015008', '1056', '济宁神东工矿设备有限公司', null, '18653673532', null, '高新区', null, null, '2019-08-20 19:23:10', 'collect');
INSERT INTO `sys_company` VALUES ('18653802335', '015009', '809', '泰安图成电子有限公司', null, '18653802335', null, '泰安高新技术创业服务中心', null, null, '2019-08-20 19:21:34', 'collect');
INSERT INTO `sys_company` VALUES ('18653822288', '015009', '17', '山东环宇地理信息工程有限公司', null, '18653822288', null, '岱岳区政府广场南，泰山文化发展中心', null, null, '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_company` VALUES ('18653835712', '015009', '550', '泰安市岱岳区岳喜水电表销售中心', null, '18653835712', null, '佛光路中段', null, null, '2019-08-20 18:22:23', 'collect');
INSERT INTO `sys_company` VALUES ('18653856062', '015009', '134', '山东丰功电子科技有限公司', null, '18653856062', null, '佛光路302号', null, null, '2019-08-05 15:40:17', 'collect');
INSERT INTO `sys_company` VALUES ('18653861905', '015009', '146', '泰安万众电子有限公司', null, '18653861905', null, '泰安市北上高村擂鼓石大街122号', null, null, '2019-08-05 15:40:20', 'collect');
INSERT INTO `sys_company` VALUES ('18653868323', '015009', '918', '山东孚曼信息科技有限公司', null, '18653868323', null, '泰安市泰山区佛光路长虹纸业工贸中心1-3', null, null, '2019-08-20 19:22:39', 'collect');
INSERT INTO `sys_company` VALUES ('18653868973', '015009', '1029', '泰安万众电子有限公司', null, '18653868973', null, '泰安市北上高村擂鼓石大街122号', null, null, '2019-08-20 19:23:04', 'collect');
INSERT INTO `sys_company` VALUES ('18653869121', '015009', '145', '泰安万众电子有限公司', null, '18653869121', null, '泰安市北上高村擂鼓石大街122号', null, null, '2019-08-05 15:40:20', 'collect');
INSERT INTO `sys_company` VALUES ('18654634494', '015005', '111', '山东联强节能科技有限公司', null, '18654634494', null, '西四路870号节能设备厂', null, null, '2019-08-05 15:40:15', 'collect');
INSERT INTO `sys_company` VALUES ('18654645356', '015005', '88', '山东海德瑞仪表股份有限公司', null, '18654645356', null, '广饶县广码路635号', null, null, '2019-08-05 15:40:03', 'collect');
INSERT INTO `sys_company` VALUES ('18658217700', '011002', '907', '宁波诺曼特仪表有限公司', null, '18658217700', null, '余姚市余姚市梨洲街道竹山村邵家渡', null, null, '2019-08-20 19:22:37', 'collect');
INSERT INTO `sys_company` VALUES ('18658351211', '009013', '559', '博兹（上海）流体设备有限公司', null, '18658351211', null, '嘉定区南翔镇翔乐路318号', null, null, '2019-08-20 18:22:24', 'collect');
INSERT INTO `sys_company` VALUES ('18658406916', '011002', '602', '宁波优静水表有限公司', null, '18658406916', null, '附海镇花塘村', null, null, '2019-08-20 18:22:58', 'collect');
INSERT INTO `sys_company` VALUES ('18660195238', '015001', '1042', '济南华煤工矿设备有限公司', null, '18660195238', null, '济南高新区工业南路66号', null, null, '2019-08-20 19:23:07', 'collect');
INSERT INTO `sys_company` VALUES ('18660832018', '015009', '135', '山东强胜电子科技有限公司', null, '18660832018', null, '山东省泰安市泰山区明堂路中段', null, null, '2019-08-05 15:40:17', 'collect');
INSERT INTO `sys_company` VALUES ('18663728752', '015001', '477', '张明伟(个体经营)', null, '18663728752', null, '市中区西山汽配城', null, null, '2019-08-05 19:50:58', 'collect');
INSERT INTO `sys_company` VALUES ('18665581389', '019001', '70', '广州市建美美容仪器有限公司', null, '18665581389', null, '广州市白云区石井镇夏茅二社欣迪集团', null, null, '2019-08-05 15:39:58', 'collect');
INSERT INTO `sys_company` VALUES ('18673533227', '018010', '749', '桂东华星不锈钢制品厂', null, '18673533227', null, '桂东县寨前镇白竹村下麻垅组', null, null, '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_company` VALUES ('18673920935', '019003', '502', '深圳市百惠祥电子有限公司', null, '18673920935', null, '石岩镇水田社区三民工业园第四栋2楼', null, null, '2019-08-05 19:51:13', 'collect');
INSERT INTO `sys_company` VALUES ('18674863713', '018001', '664', '长沙华旭环保科技有限公司', null, '18674863713', null, '长沙市雨花区湘府中路198号豪布斯卡CEO行政公馆1604室', null, null, '2019-08-20 18:24:03', 'collect');
INSERT INTO `sys_company` VALUES ('18675781329', '019017', '504', '东莞市凯诚自动化设备有限公司', null, '18675781329', null, '道滘镇道厚路新里城2期7栋109号商铺', null, null, '2019-08-05 19:51:13', 'collect');
INSERT INTO `sys_company` VALUES ('18678109687', '015003', '252', '淄博弘润亚机械设备有限公司', null, '18678109687', null, '淄博市淄博市桓台县', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('18678655032', '015001', '151', '济南工达捷能科技发展有限公司', null, '18678655032', null, '正丰路环保科技园', null, null, '2019-08-05 15:40:23', 'collect');
INSERT INTO `sys_company` VALUES ('18678879650', '015001', '1002', '山东博泰容器有限公司', null, '18678879650', null, '经济开发区', null, null, '2019-08-20 19:22:54', 'collect');
INSERT INTO `sys_company` VALUES ('18681191735', '019017', '71', '东莞市嘉多利精密电子有限公司', null, '18681191735', null, '东莞市长安镇霞边振安东路76号平谦工业园I栋2楼', null, null, '2019-08-05 15:39:59', 'collect');
INSERT INTO `sys_company` VALUES ('18681815615', '011008', '158', '衢州市衢江区鑫达绝缘材料厂', null, '18681815615', null, '衢州市衢江区樟潭街道高塘路41-1号', null, null, '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_company` VALUES ('18684870588', '018001', '835', '湖南亚瑞流体设备科技有限公司', null, '18684870588', null, '国际企业中心2栋B座202', null, null, '2019-08-20 19:21:41', 'collect');
INSERT INTO `sys_company` VALUES ('18684878985', '018001', '865', '长沙国赢供水设备有限公司', null, '18684878985', null, '汽车南站', null, null, '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_company` VALUES ('18684883140', '018001', '684', '长沙市雨花区沁铭机电设备经营部', null, '18684883140', null, '雨花区中意一路1号', null, null, '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_company` VALUES ('18688818767', '019017', '710', '东莞市莞发供水设备有限公司', null, '18688818767', null, '东莞市塘厦镇莆心湖鹅颈村26A-27B', null, null, '2019-08-20 18:24:07', 'collect');
INSERT INTO `sys_company` VALUES ('18688970167', '018001', '1090', '长沙迈瑞暖通工程有限公司', null, '18688970167', null, '长沙雨花区唐湘国际电器城14D栋9号', null, null, '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_company` VALUES ('18701502378', '001012', '720', '慧怡工贸有限公司', null, '18701502378', null, '顺义区牛栏山工业区牛汇北街九号', null, null, '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_company` VALUES ('18701508978', '001001', '666', '北京慧怡工贸有限责任公司', null, '18701508978', null, '牛栏山工业区牛汇北五街9号', null, null, '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_company` VALUES ('18702821603', '023001', '338', '成都维罗娜暖通设备有限公司', null, '18702821603', null, '成都市武侯区二环路南四段51号莱蒙都会3-1213', null, null, '2019-08-05 17:28:33', 'collect');
INSERT INTO `sys_company` VALUES ('18711078393', '018001', '741', '长沙中梁供水设备有限公司', null, '18711078393', null, '天心区芙蓉中路三段558号建鸿达现代空间A座1306室', null, null, '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_company` VALUES ('18711090564', '018001', '885', '长沙远科供水设备有限公司', null, '18711090564', null, '长沙市雨花区中意一路66号亚商大厦2栋2823号', null, null, '2019-08-20 19:21:49', 'collect');
INSERT INTO `sys_company` VALUES ('18713515627', '003003', '462', '秦皇岛维克托国际贸易有限公司', null, '18713515627', null, '河北省秦皇岛市海港区河北大街146号金源国际商务大厦25楼C05室', null, null, '2019-08-05 19:50:56', 'collect');
INSERT INTO `sys_company` VALUES ('18717181115', '017001', '1093', '武汉旷远电子技术有限公司', null, '18717181115', null, '中南路10号鹏程时代18层16号', null, null, '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_company` VALUES ('18717952802', '009001', '316', '上海暖嘉供热工程有限公司', null, '18717952802', null, '上海市场中路', null, null, '2019-08-05 17:28:29', 'collect');
INSERT INTO `sys_company` VALUES ('18721151648', '009012', '467', '上海稻兴精密机械有限公司', null, '18721151648', null, '松江工业区松胜路738号', null, null, '2019-08-05 19:50:56', 'collect');
INSERT INTO `sys_company` VALUES ('18732832299', '003011', '213', '河北冀明昊暖通设备有限公司', null, '18732832299', null, '省级高新工业园区', null, null, '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_company` VALUES ('18749093311', '016013', '767', '南阳市卧龙区盛隆锅炉厂', null, '18749093311', null, '南阳市王村龙升工业园', null, null, '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_company` VALUES ('18752970886', '010011', '457', '镇江新区恒益电子有限公司', null, '18752970886', null, '江苏镇江新区大路镇大路村2组', null, null, '2019-08-05 19:47:19', 'collect');
INSERT INTO `sys_company` VALUES ('18757727662', '011003', '1125', '乐清市赛邦电气有限公司', null, '18757727662', null, '柳市工业区', null, null, '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_company` VALUES ('18762657563', '010002', '915', '无锡水表有限责任公司', null, '18762657563', null, '江苏省无锡市中桥尤巷', null, null, '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_company` VALUES ('18764815899', '015009', '891', '泰安市岱岳区岳喜水电表销售中心', null, '18764815899', null, '高新区东区', null, null, '2019-08-20 19:21:50', 'collect');
INSERT INTO `sys_company` VALUES ('18765275999', '015002', '733', '青岛良邦机电设备有限公司', null, '18765275999', null, '前金工业园888号', null, null, '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_company` VALUES ('18769705248', '015001', '874', '山东秉恬信息科技有限公司', null, '18769705248', null, '山东省济南市高新区世纪大道2966号', null, null, '2019-08-20 19:21:47', 'collect');
INSERT INTO `sys_company` VALUES ('18771551998', '017005', '465', '襄阳君雷汽车配件有限公司', null, '18771551998', null, '襄阳市高新区锦绣汽配城', null, null, '2019-08-05 19:50:56', 'collect');
INSERT INTO `sys_company` VALUES ('18773111062', '018001', '843', '长沙远科供水设备有限公司', null, '18773111062', null, '长沙市雨花区中意一路66号亚商大厦 长沙市雨花区黎托产业园', null, null, '2019-08-20 19:21:42', 'collect');
INSERT INTO `sys_company` VALUES ('18773128906', '018001', '561', '长沙远科环保供水设备有限公司', null, '18773128906', null, '中意一路66号2栋1732', null, null, '2019-08-20 18:22:25', 'collect');
INSERT INTO `sys_company` VALUES ('18774019224', '018001', '935', '长沙中赢供水设备有限公司', null, '18774019224', null, '长沙市雨花区香樟路云集大厦1302', null, null, '2019-08-20 19:22:43', 'collect');
INSERT INTO `sys_company` VALUES ('18774832763', '018001', '523', '华人犀牛供水设备有限公司', null, '18774832763', null, '韶山南路中意一路亚商国际B座2941中建五局旁', null, null, '2019-08-20 18:22:17', 'collect');
INSERT INTO `sys_company` VALUES ('18774899665', '018001', '597', '长沙中赢供水设备公司', null, '18774899665', null, '长沙市雨花区人民东路左岸右岸B座2310', null, null, '2019-08-20 18:22:40', 'collect');
INSERT INTO `sys_company` VALUES ('18774937497', '018001', '723', '贵州中梁供水设备有限公司', null, '18774937497', null, '长沙市天心区芙蓉中路三段558号建鸿达现代空间A座1306室', null, null, '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_company` VALUES ('18774983945', '018001', '916', '山西远科供水设备有限公司', null, '18774983945', null, '中意一路亚商大厦1栋2823', null, null, '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_company` VALUES ('18788182558', '025001', '988', '昆明格日安机电设备有限公司', null, '18788182558', null, '昆明市昌宏路新高原明珠国际五金机电城B4-6号', null, null, '2019-08-20 19:22:50', 'collect');
INSERT INTO `sys_company` VALUES ('18795550155', '010007', '887', '连云港浪花水表厂', null, '18795550155', null, '江苏省连云港市海连西路16号', null, null, '2019-08-20 19:21:49', 'collect');
INSERT INTO `sys_company` VALUES ('18795619612', '010002', '1032', '无锡吉盛环保科技有限公司', null, '18795619612', null, '江苏省无锡市锡山区东亭门楼工业园春联路12号', null, null, '2019-08-20 19:23:04', 'collect');
INSERT INTO `sys_company` VALUES ('18805365955', '015007', '942', '潍坊金达自动化设备有限公司', null, '18805365955', null, '山东省潍坊市经济开发区泰祥街与长松路交叉口东北角', null, null, '2019-08-20 19:22:44', 'collect');
INSERT INTO `sys_company` VALUES ('18805772262', '011003', '1105', '温州驰马自动化科技有限公司', null, '18805772262', null, '翁洋工业区', null, null, '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_company` VALUES ('18810290193', '001001', '818', '北京慧怡工贸有限责任公司', null, '18810290193', null, '牛栏山工业区', null, null, '2019-08-20 19:21:35', 'collect');
INSERT INTO `sys_company` VALUES ('18810290667', '001012', '850', '北京慧怡科技责任有限公司', null, '18810290667', null, '北京市顺义牛栏山镇工业区牛汇北5街9号', null, null, '2019-08-20 19:21:43', 'collect');
INSERT INTO `sys_company` VALUES ('18814946201', '011003', '1030', '浙江登泉电气科技有限公司', null, '18814946201', null, '瓯北街道和三村', null, null, '2019-08-20 19:23:04', 'collect');
INSERT INTO `sys_company` VALUES ('18823798418', '019003', '41', '深圳市跃顺螺丝紧固设备有限公司', null, '18823798418', null, '深圳市龙华新区民治街道梅坂大道1号民乐工业园圆梦科技大厦513', null, null, '2019-08-05 15:39:49', 'collect');
INSERT INTO `sys_company` VALUES ('18832275330', '003011', '619', '河北道成电子科技有限公司', null, '18832275330', null, '高新技术产业开发区', null, null, '2019-08-20 18:23:09', 'collect');
INSERT INTO `sys_company` VALUES ('18832803739', '003011', '200', '衡水市圣兴春采暖设备有限公司', null, '18832803739', null, '高新工业开发区', null, null, '2019-08-05 17:28:21', 'collect');
INSERT INTO `sys_company` VALUES ('18832804904', '001001', '340', '北京鑫圣通金属制品有限公司', null, '18832804904', null, '五里店651号', null, null, '2019-08-05 17:28:33', 'collect');
INSERT INTO `sys_company` VALUES ('18832822651', '003011', '206', '冀州市春博采暖设备有限公司', null, '18832822651', null, '冀州市彭村106国道西侧314.5公里处路西', null, null, '2019-08-05 17:28:22', 'collect');
INSERT INTO `sys_company` VALUES ('18832831283', '003011', '333', '衡水泽隆贝迪商贸有限公司', null, '18832831283', null, '衡水市冀州区迎宾南大街门店1-4号', null, null, '2019-08-05 17:28:33', 'collect');
INSERT INTO `sys_company` VALUES ('18832832688', '003011', '230', '河北省冀州市昊春暖通设备有限公司', null, '18832832688', null, '滏阳路顺平街1号', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('18837832177', '016002', '643', '开封国安供水设备有限公司', null, '18837832177', null, '黄龙工业园区', null, null, '2019-08-20 18:23:55', 'collect');
INSERT INTO `sys_company` VALUES ('18854170998', '015001', '549', '山东易安换热设备有限公司', null, '18854170998', null, '济南市历城区王舍人街道坝王路', null, null, '2019-08-20 18:22:23', 'collect');
INSERT INTO `sys_company` VALUES ('18855323318', '012001', '958', '合肥菲源水工业设备有限公司', null, '18855323318', null, '望江西路203号4栋1201室', null, null, '2019-08-20 19:22:46', 'collect');
INSERT INTO `sys_company` VALUES ('18858063184', '011002', '1130', '余姚市威科自控设备厂', null, '18858063184', null, '城东经济开发区双河工业园区', null, null, '2019-08-20 19:35:28', 'collect');
INSERT INTO `sys_company` VALUES ('18858595557', '011006', '268', '浙江亿科管业有限公司', null, '18858595557', null, '店口工业区上畈路22号', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('18859912233', '013005', '572', '泉州市盛泰金属制品有限公司', null, '18859912233', null, '西坑路口', null, null, '2019-08-20 18:22:27', 'collect');
INSERT INTO `sys_company` VALUES ('18861550930', '010002', '537', '宜兴市高塍镇万达五金配件经营部', null, '18861550930', null, '宜兴市高塍镇国际环保城9栋22号', null, null, '2019-08-20 18:22:19', 'collect');
INSERT INTO `sys_company` VALUES ('18868682147', '011002', '756', '慈溪市慈东流量仪表有限公司', null, '18868682147', null, '慈溪市慈溪市龙山工业区龙镇大道148号', null, null, '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_company` VALUES ('18874182935', '018001', '573', '湖南长沙中梁供水设备有限公司', null, '18874182935', null, '长沙市天心区芙蓉中路三段558号建鸿达现代空间A座30楼', null, null, '2019-08-20 18:22:27', 'collect');
INSERT INTO `sys_company` VALUES ('18874700310', '018001', '675', '湖南中建供水设备有限责任公司', null, '18874700310', null, '中意一路66号亚商国际大厦2栋2035室', null, null, '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_company` VALUES ('18888291927', '015001', '309', '济南一诺热能科技有限公司', null, '18888291927', null, '二环西路9405号', null, null, '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_company` VALUES ('18896781919', '010005', '925', '宁波埃美柯铜阀门有限公司', null, '18896781919', null, '苏州省苏州市平江区东中市14号', null, null, '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_company` VALUES ('18900710689', '018001', '629', '长沙久华供水设备有限公司', null, '18900710689', null, '雨花区机电市场C区', null, null, '2019-08-20 18:23:10', 'collect');
INSERT INTO `sys_company` VALUES ('18900710692', '018001', '594', '久华长沙供水设备有限公司', null, '18900710692', null, '雨花区湘府中路18号德思勤城市广场A-2地块A7栋7003', null, null, '2019-08-20 18:22:37', 'collect');
INSERT INTO `sys_company` VALUES ('18900710693', '018001', '595', '长沙久华供水设备有限公司', null, '18900710693', null, '湖南长沙市雨花区韶山南路和湘府路交汇处德思勤A7栋703', null, null, '2019-08-20 18:22:38', 'collect');
INSERT INTO `sys_company` VALUES ('18900732505', '018001', '727', '湖南智康环保节能科技有限公司', null, '18900732505', null, '得思勤A7栋1106', null, null, '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_company` VALUES ('18900738260', '018001', '967', '湖南智康环保科技有限公司', null, '18900738260', null, '长沙市雨花区五金机电市场D区6栋114号', null, null, '2019-08-20 19:22:47', 'collect');
INSERT INTO `sys_company` VALUES ('18901022113', '001001', '663', '迅泽达方（北京）科技有限公司', null, '18901022113', null, '清河永泰中路25号中关村创新园A座106', null, null, '2019-08-20 18:24:03', 'collect');
INSERT INTO `sys_company` VALUES ('18903188282', '003001', '154', '冀州市红太阳采暖设备厂', null, '18903188282', null, '冀州市河北省冀州市孔五工业区', null, null, '2019-08-05 17:28:17', 'collect');
INSERT INTO `sys_company` VALUES ('18905393769', '015013', '695', '山东省临沂市兰山区鹏翔水表厂', null, '18905393769', null, '临沂市兰山区白沙镇朱潘村', null, null, '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_company` VALUES ('18905485277', '015009', '110', '泰安万和电子有限公司', null, '18905485277', null, '泰安市东岳大街东首', null, null, '2019-08-05 15:40:14', 'collect');
INSERT INTO `sys_company` VALUES ('18910263993', '001010', '986', '北京创福新锐电器设备有限公司', null, '18910263993', null, '北京市房山区阎村镇二合庄28号', null, null, '2019-08-20 19:22:50', 'collect');
INSERT INTO `sys_company` VALUES ('18910799923', '001001', '14', '北京京源水仪器仪表有限公司', null, '18910799923', null, '良乡经济开发区白杨路甲2号', null, null, '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_company` VALUES ('18911633970', '001001', '272', '绿色鹏鸿（北京）建材有限公司', null, '18911633970', null, '世界公园', null, null, '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_company` VALUES ('18911843001', '001016', '160', '北京戴瑞雅暖通设备有限公司', null, '18911843001', null, '北京市怀柔区杨宋镇凤翔东大街9号A座1953室', null, null, '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_company` VALUES ('18914060529', '010005', '354', '苏州新时尚家族楼宇设备有限公司', null, '18914060529', null, '苏州园区林泉街399号东南大学', null, null, '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_company` VALUES ('18916031297', '009001', '1126', '上海堤琦西温控设备有限公司', null, '18916031297', null, '上海', null, null, '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_company` VALUES ('18916136128', '009001', '797', '上海威烁热能科技有限公司', null, '18916136128', null, '顾北路666弄220号', null, null, '2019-08-20 18:47:38', 'collect');
INSERT INTO `sys_company` VALUES ('18918042547', '009012', '44', '上海爱泽工业设备有限公司', null, '18918042547', null, '上海市松江区申港路215号裕居商务园A幢', null, null, '2019-08-05 15:39:50', 'collect');
INSERT INTO `sys_company` VALUES ('18920165182', '002011', '132', '天津市华仪晨隆科技有限公司', null, '18920165182', null, '天津市西青区精武镇工业园', null, null, '2019-08-05 15:40:17', 'collect');
INSERT INTO `sys_company` VALUES ('18920532565', '002001', '9', '天津金凤来仪科技有限公司', null, '18920532565', null, '鑫茂科技园民营楼5楼', null, null, '2019-08-05 15:39:41', 'collect');
INSERT INTO `sys_company` VALUES ('18920583733', '002001', '673', '天津市华仪晨隆科技有限公司', null, '18920583733', null, '精武镇', null, null, '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_company` VALUES ('18920778276', '002004', '1', '天津新天智能仪表科技有限公司', null, '18920778276', null, '天津市南开区华苑产业园区榕苑路15号鑫茂科技园军民园1号楼B座2107室', null, null, '2019-08-05 15:39:39', 'collect');
INSERT INTO `sys_company` VALUES ('18920903187', '002001', '100', '天津市承刚科技发展有限公司', null, '18920903187', null, '华苑产业区榕苑路16号', null, null, '2019-08-05 15:40:09', 'collect');
INSERT INTO `sys_company` VALUES ('18924109323', '019001', '555', '广州高泉通用设备有限公司', null, '18924109323', null, '南村镇里仁洞隔岗', null, null, '2019-08-20 18:22:23', 'collect');
INSERT INTO `sys_company` VALUES ('18924287221', '019001', '1075', '广州市永东环保科技有限公司', null, '18924287221', null, '广东省广州市海珠区南洲路28号', null, null, '2019-08-20 19:25:19', 'collect');
INSERT INTO `sys_company` VALUES ('18925095853', '019001', '671', '广州方韩仪器有限公司', null, '18925095853', null, '桥南街下破西街18号之二', null, null, '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_company` VALUES ('18928862340', '019001', '1041', '广州全一泵业有限公司', null, '18928862340', null, '广州市番禺区南村镇坑头村西线路全一工业园', null, null, '2019-08-20 19:23:07', 'collect');
INSERT INTO `sys_company` VALUES ('18930968126', '009012', '941', '上海隆蕴仪表有限公司', null, '18930968126', null, '上海市松江区天马工业园', null, null, '2019-08-20 19:22:43', 'collect');
INSERT INTO `sys_company` VALUES ('18931003555', '003004', '98', '河北润福仪器仪表制造有限公司', null, '18931003555', null, '开发区润福路1号', null, null, '2019-08-05 15:40:07', 'collect');
INSERT INTO `sys_company` VALUES ('18931867264', '003001', '985', '石家庄宇泉环保设备股份有限公司', null, '18931867264', null, '桥西区友谊南大街122号振头大厦', null, null, '2019-08-20 19:22:49', 'collect');
INSERT INTO `sys_company` VALUES ('18932810766', '003011', '401', '北京鲁泰易嘉金属制品有限公司', null, '18932810766', null, '河北省衡水市冀州区西环路南', null, null, '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_company` VALUES ('18936752888', '010008', '67', '江苏红昇仪表有限公司', null, '18936752888', null, '金湖县工业园区工二路28号', null, null, '2019-08-05 15:39:56', 'collect');
INSERT INTO `sys_company` VALUES ('18942553814', '018001', '635', '湖南中升联众环保有限公司', null, '18942553814', null, '芙蓉南路凯旋大厦', null, null, '2019-08-20 18:23:42', 'collect');
INSERT INTO `sys_company` VALUES ('18951748886', '010001', '996', '南京优信达智能科技有限公司', null, '18951748886', null, '大厂镇芳庭潘园67幢', null, null, '2019-08-20 19:22:51', 'collect');
INSERT INTO `sys_company` VALUES ('18957415783', '011002', '691', '宁波市精诚科技有限公司', null, '18957415783', null, '宁波市宁波市江北创业园B区北海路188弄65号', null, null, '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_company` VALUES ('18958809811', '011003', '26', '华邦电力科技股份有限公司', null, '18958809811', null, '浙江省温州乐清市北白象龙河路75号', null, null, '2019-08-05 15:39:43', 'collect');
INSERT INTO `sys_company` VALUES ('18962694313', '010005', '836', '苏州富工阀业有限公司', null, '18962694313', null, 'QQ:595633923', null, null, '2019-08-20 19:21:41', 'collect');
INSERT INTO `sys_company` VALUES ('18963509366', '015015', '953', '聊城市宏盛环保设备有限公司', null, '18963509366', null, '洪屯开发区', null, null, '2019-08-20 19:22:45', 'collect');
INSERT INTO `sys_company` VALUES ('18964346352', '009005', '1110', '王凤彩', null, '18964346352', null, '上海市闵行区吴中路889号3号楼18D室', null, null, '2019-08-20 19:35:25', 'collect');
INSERT INTO `sys_company` VALUES ('18964996577', '009012', '526', '上海龙亚泵阀制造有限公司', null, '18964996577', null, '上海市松江区小昆山经济区崇南公路435弄20号', null, null, '2019-08-20 18:22:17', 'collect');
INSERT INTO `sys_company` VALUES ('18967038068', '011008', '557', '浙江贝德泵业有限公司', null, '18967038068', null, '衢州市浙江衢州航埠工业区兴航一路17号', null, null, '2019-08-20 18:22:23', 'collect');
INSERT INTO `sys_company` VALUES ('18968806955', '011003', '847', '水手供水设备有限公司', null, '18968806955', null, '浙江省温州市永嘉县瓯北镇堡二工业区', null, null, '2019-08-20 19:21:43', 'collect');
INSERT INTO `sys_company` VALUES ('18971536297', '017001', '845', '武汉华德林科技有限公司', null, '18971536297', null, '阳逻开发区高新路68号', null, null, '2019-08-20 19:21:42', 'collect');
INSERT INTO `sys_company` VALUES ('18975177180', '018001', '605', '长沙通德供水设备有限公司', null, '18975177180', null, '雨花区上和国际酒店12024', null, null, '2019-08-20 18:22:59', 'collect');
INSERT INTO `sys_company` VALUES ('18975800239', '018001', '970', '长沙国赢供水设备有限公司', null, '18975800239', null, '雨花区汽车南站', null, null, '2019-08-20 19:22:48', 'collect');
INSERT INTO `sys_company` VALUES ('18975821068', '018001', '708', '长沙市雨花区沁铭机电设备经营部', null, '18975821068', null, '中意一路1号', null, null, '2019-08-20 18:24:07', 'collect');
INSERT INTO `sys_company` VALUES ('18977113697', '020008', '790', '广西国量仪表制造有限公司', null, '18977113697', null, '广西平南县上渡镇下渡社区桥南茅冲小区75号', null, null, '2019-08-20 18:24:18', 'collect');
INSERT INTO `sys_company` VALUES ('18980604807', '023001', '295', '成都春意暖通设备有限公司', null, '18980604807', null, '成都市红星国际广场D栋720', null, null, '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_company` VALUES ('18991768277', '027003', '717', '陕西大华智能仪表有限公司', null, '18991768277', null, '宝鸡市渭滨区宝鸡市渭滨区马营镇明星工业园', null, null, '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_company` VALUES ('5103732153', '010002', '1086', '无锡市惠山华宏自动控制有限公司', null, '5103732153', null, '', null, null, '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_company` VALUES ('51885383190', '010007', '13', '连云港腾越电子科技有限公司', null, '51885383190', null, '海州开发区创业路2号', null, null, '2019-08-05 15:39:41', 'collect');
INSERT INTO `sys_company` VALUES ('51985166906', '010004', '930', '常州给力机电设备有限公司', null, '51985166906', null, '江苏省常州市斗巷商务中心', null, null, '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_company` VALUES ('53181251292', '015001', '194', '济南诚田散热器有限公司', null, '53181251292', null, '济南市槐荫区济齐路宋庄工业园', null, null, '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_company` VALUES ('53188266086', '015001', '1134', '济南齐鲁阳光电子设备厂', null, '53188266086', null, '济南市山东省济南市历城区华山北路8号', null, null, '2019-08-20 19:35:28', 'collect');
INSERT INTO `sys_company` VALUES ('53313583308', '015003', '278', '桓台县起凤镇明杰瑞暖气片厂', null, '53313583308', null, '起凤镇', null, null, '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_company` VALUES ('53313706430', '015003', '414', '桓台县起凤镇华光水暖器材厂', null, '53313706430', null, '', null, null, '2019-08-05 18:50:25', 'collect');
INSERT INTO `sys_company` VALUES ('53981212181', '015013', '714', '临沂高翔水表有限公司', null, '53981212181', null, '兰山区白沙埠工业园', null, null, '2019-08-20 18:24:07', 'collect');
INSERT INTO `sys_company` VALUES ('55039538953', '012010', '909', '安徽金大仪器有限公司', null, '55039538953', null, '滁州市城南科技工业园3#', null, null, '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_company` VALUES ('5528713999', '012003', '1114', '优提普自控系统有限公司', null, '5528713999', null, '安徽省蚌埠市怀远经济开发区', null, null, '2019-08-20 19:35:26', 'collect');
INSERT INTO `sys_company` VALUES ('57186517327', '011001', '993', '杭州水表有限公司', null, '57186517327', null, '浙江杭州市凯旋路1号', null, null, '2019-08-20 19:22:50', 'collect');
INSERT INTO `sys_company` VALUES ('57462352988', '011002', '805', '余姚市欧博朗仪表科技有限公司', null, '57462352988', null, '余姚市远东工业城', null, null, '2019-08-20 19:06:49', 'collect');
INSERT INTO `sys_company` VALUES ('57463560698', '011002', '913', '宁波宁桥水表有限公司', null, '57463560698', null, '附海镇工业园区', null, null, '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_company` VALUES ('57463578768', '011002', '736', '宁波佳洁水表有限公司', null, '57463578768', null, '宁波慈溪新浦工业区', null, null, '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_company` VALUES ('57757755597', '011003', '703', '温州市格鲁仕机械设备有限公司', null, '57757755597', null, '瓯北镇浦二工业园区', null, null, '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_company` VALUES ('57762778200', '011003', '1099', '乐清市奥格电气有限公司', null, '57762778200', null, '柳市镇柳黄路2188号', null, null, '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_company` VALUES ('57765109111', '011003', '556', '瑞安市富安不锈钢水塔厂', null, '57765109111', null, '浙江省瑞安市汀田镇凤利街90号', null, null, '2019-08-20 18:22:23', 'collect');
INSERT INTO `sys_company` VALUES ('57989701235', '011001', '231', '浙江恒泰铝业有限公司', null, '57989701235', null, '总部中心金典大厦3楼', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('73182156311', '018001', '1019', '长沙莱瑞自动化设备科技有限公司', null, '73182156311', null, '环保大道188号国际企业中心2栋B座202', null, null, '2019-08-20 19:22:59', 'collect');
INSERT INTO `sys_company` VALUES ('75589610877', '019003', '983', '深圳市龙岗区力盾阀门批发部', null, '75589610877', null, '杨梅岗杨田路五金商业街105-107-109铺面', null, null, '2019-08-20 19:22:49', 'collect');
INSERT INTO `sys_company` VALUES ('79186515364', '014001', '728', '江西长江仪表有限责任公司', null, '79186515364', null, '九州大街', null, null, '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_company` VALUES ('86010873654', '001011', '329', '北京金色太阳暖通设备有限公司', null, '86010873654', null, '北京市通州区前堰上工业园', null, null, '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_company` VALUES ('86533868755', '015003', '223', '桓台县起凤镇安超采暖设备厂', null, '86533868755', null, '桓台县起凤镇辛泉村', null, null, '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_company` VALUES ('e2d3c35c704e46308f28768d0d5698d1', '001001', '1136', '111', '111', 'root', '11111', '1111', '111', null, '2019-10-17 14:09:57', 'root');

-- ----------------------------
-- Table structure for `sys_db_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_db_config`;
CREATE TABLE `sys_db_config` (
  `dbconfig_id` varchar(36) NOT NULL,
  `data_source_id` varchar(36) DEFAULT NULL,
  `driver` varchar(255) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(41) DEFAULT NULL,
  `initialsize` decimal(8,0) DEFAULT NULL,
  `maxactive` decimal(8,0) DEFAULT NULL,
  `maxwait` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`dbconfig_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_db_config
-- ----------------------------
INSERT INTO `sys_db_config` VALUES ('1', '12', '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `sys_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `dictionary_id` varchar(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(36) DEFAULT NULL,
  `value` varchar(63) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `updator` varchar(36) DEFAULT NULL,
  `state` decimal(1,0) DEFAULT NULL,
  PRIMARY KEY (`dictionary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES ('38d2a5ff05d541efb5fe2c869c890601', '采集域名', null, null, '采集域名', '0', '2019-06-01 22:31:48', '2019-06-01 22:31:48', 'root', 'root', '1');
INSERT INTO `sys_dictionary` VALUES ('6c149ca83a654a4ea7bb1dcba2976193', '222', null, null, '2222', 'debfecbfb9e64d68b5f11edfb24ed9c5', '2019-06-01 19:59:54', '2019-06-01 19:59:54', 'root', 'root', '1');
INSERT INTO `sys_dictionary` VALUES ('debfecbfb9e64d68b5f11edfb24ed9c5', '111', null, null, '111', '0', '2019-06-01 19:59:43', '2019-06-01 19:59:43', 'root', 'root', '1');

-- ----------------------------
-- Table structure for `sys_front_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_front_menu`;
CREATE TABLE `sys_front_menu` (
  `menuid` varchar(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(36) DEFAULT NULL,
  `pid` varchar(36) DEFAULT NULL,
  `cseq` decimal(3,0) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `enabled` decimal(2,0) DEFAULT NULL,
  `isopen` decimal(1,0) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  `updator` varchar(36) DEFAULT NULL,
  `icon` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_front_menu
-- ----------------------------
INSERT INTO `sys_front_menu` VALUES ('36', '首页', 'front-home', '0', '0', 'home/index', '1', '0', '2019-03-19 13:42:12', 'root', '2019-07-04 19:22:10', 'root', 'ace-icon fa fa-home');
INSERT INTO `sys_front_menu` VALUES ('37', '票房核验', 'front-check', '0', '1', 'verify/heyan', '1', '0', '2019-02-20 08:58:42', 'root', '2019-02-20 08:58:55', 'root', 'ace-icon fa fa-edit');
INSERT INTO `sys_front_menu` VALUES ('38', '核验统计分析', 'front-state', '37', '1', 'verify/tendency', '1', '0', '2019-02-20 08:58:09', 'root', '2019-02-20 08:59:09', 'root', '');
INSERT INTO `sys_front_menu` VALUES ('39', '影厅核验详情', 'front-detailed', '37', '2', 'verify/detailed', '1', '0', '2019-02-20 08:58:16', 'root', '2019-02-20 08:59:16', 'root', '');
INSERT INTO `sys_front_menu` VALUES ('40', '放映监测', 'front-monitor', '0', '2', 'screenMonitor/fyMonitor', '1', '0', '2019-02-20 08:58:38', 'root', '2019-02-20 08:58:59', 'root', 'ace-icon fa fa-edit');
INSERT INTO `sys_front_menu` VALUES ('42', '放映质量统计', 'front-screen', '40', '2', 'screenMonitor/screenQuality', '1', '0', '2019-02-20 08:58:25', 'root', '2019-02-20 08:59:19', 'root', null);
INSERT INTO `sys_front_menu` VALUES ('43', '影院质量详情', 'front-envir', '40', '3', 'screenMonitor/envirQuality', '1', '0', '2019-02-20 08:58:30', 'root', '2019-02-20 08:59:22', 'root', null);
INSERT INTO `sys_front_menu` VALUES ('44', '票房信息', 'front-statics', '0', '3', 'statics/index', '1', '0', '2019-02-20 08:58:19', 'root', '2019-02-20 08:59:01', 'root', 'ace-icon fa fa-inbox');
INSERT INTO `sys_front_menu` VALUES ('45', '状态', 'front-state', '0', '4', 'state/index', '1', '0', '2019-02-20 08:58:36', 'root', '2019-02-20 08:59:06', 'root', 'ace-icon fa fa-bookmark');
INSERT INTO `sys_front_menu` VALUES ('97e1c841fa2d4e788e20da907eba6ca5', '影院放映报警', 'front-alarm', '40', '1', 'screenMonitor/screenAlarm', '1', '0', '2019-02-20 08:58:33', 'root', '2019-02-20 08:59:25', 'root', null);

-- ----------------------------
-- Table structure for `sys_layout`
-- ----------------------------
DROP TABLE IF EXISTS `sys_layout`;
CREATE TABLE `sys_layout` (
  `layout_id` varchar(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `page` varchar(64) DEFAULT NULL,
  `id` varchar(64) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `div_id` varchar(128) DEFAULT NULL,
  `position` varchar(16) DEFAULT NULL,
  `method` varchar(64) DEFAULT NULL,
  `show` decimal(1,0) DEFAULT NULL,
  `cseq` decimal(3,0) DEFAULT NULL,
  `row_num` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_layout
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `log_id` varchar(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `alias` varchar(128) DEFAULT NULL,
  `rep` varchar(60) DEFAULT NULL,
  `logtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `FK_Relationship_42` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('0183a7ee622b4e0f9c8f2c3967612a93', 'root', '用户登录', '正常', '2019-10-24 15:23:56', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('024d3b9386f54a62aad640577a5646c0', 'root', '用户登录', '正常', '2019-10-22 15:02:31', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('0299960d08cc4d8089a6a5547e076f76', 'root', '删除产品', '正常', '2019-08-05 19:52:42', '成功');
INSERT INTO `sys_log` VALUES ('03f60a7fe43c4b70b944984c986b9493', 'root', '添加产品类型', '正常', '2019-10-19 16:09:19', '成功');
INSERT INTO `sys_log` VALUES ('04d307cd063f41a7ac898f4c99720042', 'ffffff66666', '添加产品', '正常', '2019-08-08 11:08:10', '成功');
INSERT INTO `sys_log` VALUES ('054c1c77ba2f45a99c303fcaf0d24ff8', 'root', '用户登录', '正常', '2019-10-22 14:48:31', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('06f06cf564144276b4d65296ab3ac8cd', 'root', '用户登录', '正常', '2019-10-22 14:35:58', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('08884ebde1ff41379b9088b2435a7c90', 'root', '用户登录', '正常', '2019-10-21 13:57:11', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('09b3462674c54fd2a8d668158e49a632', 'root', '用户登录', '正常', '2019-10-20 11:20:14', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('0a6ccf112cb74dfd89b979b5e4d98234', 'root', '删除故障记录', '正常', '2019-10-21 15:33:27', '成功');
INSERT INTO `sys_log` VALUES ('0acf733a723941f2b5ea74580d4eead3', 'root', '删除采集产品', '正常', '2019-08-05 19:11:17', '成功');
INSERT INTO `sys_log` VALUES ('0c41c15211be4767b0d41a940bf3ac40', 'root', '添加产品类型', '正常', '2019-10-17 15:26:31', '成功');
INSERT INTO `sys_log` VALUES ('0c71e030199540dead350c7a9b2a35ce', 'root', '删除采集产品', '正常', '2019-08-05 19:48:31', '成功');
INSERT INTO `sys_log` VALUES ('0c858401ab564f84a968cc6318e9ea00', 'root', '修改采集产品', '正常', '2019-08-05 19:51:57', '成功');
INSERT INTO `sys_log` VALUES ('0d60e531827a4b09ae2771ca78829789', 'root', '新增菜单', '正常', '2019-10-17 13:23:31', '新增菜单:监控阈值设置');
INSERT INTO `sys_log` VALUES ('0e0765cdfdf94056957e589e7c38892b', 'root', '添加监控阈值', '正常', '2019-10-22 14:27:06', '成功');
INSERT INTO `sys_log` VALUES ('0e8cbffd445b48bcb84cfcbe63551a67', 'root', '用户登录', '正常', '2019-10-21 13:51:39', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('0ecfbb2591b940f3b92f14708f5fd3e5', 'root', '用户登录', '正常', '2019-10-17 15:24:47', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('0ff87ef7982042d4a4f9612e935caef4', 'root', '用户登录', '正常', '2019-08-05 16:52:59', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('100c0ce34f5b49d886d80108996ad4d6', 'root', '用户登录', '正常', '2019-08-20 20:00:29', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('110b3f26a9644754b7ec5b2de2887fde', 'root', '删除搜索项', '正常', '2019-08-05 16:54:42', '成功');
INSERT INTO `sys_log` VALUES ('113bdb5acc0e46d19185e0c5d880ff09', 'root', '用户登录', '正常', '2019-10-25 08:37:41', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('11ed722e009241b0bba4f41898509d0a', 'ffffff66666', '修改产品', '正常', '2019-08-08 11:12:14', '成功');
INSERT INTO `sys_log` VALUES ('12b57f28930c49e29500321f569a1d44', 'root', '添加字段', '正常', '2019-10-21 10:12:44', '成功');
INSERT INTO `sys_log` VALUES ('13291f47dbb44810ae4b7beea27a73e0', 'root', '用户登录', '正常', '2019-08-05 10:05:55', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('15e3c90ed6534ed4ac585b55172369ad', 'root', '用户登录', '正常', '2019-10-21 16:16:34', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('16397162cf6a4cf3863a67295a4e0813', 'root', '修改模拟器', '正常', '2019-10-21 14:20:10', '成功');
INSERT INTO `sys_log` VALUES ('16ecaa70260c4fc6961f4a9dbf5b8f30', 'root', '修改产品类型', '正常', '2019-10-23 08:31:16', '成功');
INSERT INTO `sys_log` VALUES ('172d8b51f13b4e619c95c55698da6846', 'root', '添加模拟器', '正常', '2019-10-21 14:20:53', '成功');
INSERT INTO `sys_log` VALUES ('180425bf9a31458a91eec16ab527f275', 'root', '删除字段', '正常', '2019-10-20 11:20:21', '成功');
INSERT INTO `sys_log` VALUES ('18d3c9686414475a9de1abbc8580aaa6', 'root', '修改日志', '失败', '2019-10-21 17:19:18', '修改日志失败:\r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'simulator_plat.t_sim_add_log\' doesn\'t exist\r\n### The error may involve com.cinema.biz.dao.SimAddLogMapper.updateByPrimaryKeySelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: UPDATE t_sim_add_log  SET device_id = device_id,simulator_id = ?,type_id = ?,name = ?,code = ?,location = ?,pc = ?,ip = ?,mac = ?,operate_times = ?,fault_times = ?,repair_times = ?,maintenance_times = ?,operate = ?,cpu_rate = ?,extend_attr = ?,create_time = ?,creator = ?,updator = ? WHERE  device_id = ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'simulator_plat.t_sim_add_log\' doesn\'t exist');
INSERT INTO `sys_log` VALUES ('192e5d07ed354c6199465ebdca576938', 'root', '修改采集产品', '正常', '2019-08-05 15:50:25', '成功');
INSERT INTO `sys_log` VALUES ('1b9a540ed755425ebca425486af91122', 'abc33333', '用户登录', '正常', '2019-08-08 14:39:26', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('1c0c7d8546194235884c27a82381254a', 'root', '用户登录', '正常', '2019-10-17 16:32:07', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('1c722710124240878d50eb12b0fd7cf6', 'root', '新增菜单', '正常', '2019-10-17 13:28:47', '新增菜单:值班登记');
INSERT INTO `sys_log` VALUES ('1cb5aa24721349729afecac5ef22460e', 'root', '用户登录', '正常', '2019-10-22 14:54:41', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('1cea56bf4197415dab243652f9549940', 'root', '删除字段', '正常', '2019-10-21 10:37:10', '成功');
INSERT INTO `sys_log` VALUES ('1cf1a9461bc543899e43d9309d69cba7', 'root', '用户登录', '正常', '2019-10-22 15:48:16', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('2050f0b15178420382ebfcf55e862cd1', 'root', '用户登录', '正常', '2019-10-21 17:13:53', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('210bd268f46f4258be7ef236a080213e', 'root', '新增菜单', '正常', '2019-10-17 13:20:15', '新增菜单:计算机开关机控制');
INSERT INTO `sys_log` VALUES ('214da81631cf4873a1ff55201bb34423', 'root', '添加操作记录', '正常', '2019-10-21 16:21:39', '成功');
INSERT INTO `sys_log` VALUES ('220f83e6ca3742179426dc23d806f610', 'root', '用户登录', '正常', '2019-10-17 10:55:41', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('226081094f664ec8989d61a7ef5b80d3', 'root', '用户登录', '正常', '2019-10-21 10:11:14', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('23215344cce34236b23b297b258216e2', 'root', '用户登录', '正常', '2019-10-21 17:53:52', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('241c2a04121c42b7882ab443205eaab5', 'ffffff66666', '添加产品', '正常', '2019-08-08 11:10:08', '成功');
INSERT INTO `sys_log` VALUES ('243870e782a24b36b65a4ca6fd368c77', 'root', '用户登录', '正常', '2019-10-22 15:20:12', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('24815a7d3f60440591419ac18aafa4e2', 'root', '用户登录', '正常', '2019-08-20 19:57:56', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('251dcd5393cf46008880a44ca65f8992', 'abc33333', '修改密码', '正常', '2019-08-08 14:39:14', '成功');
INSERT INTO `sys_log` VALUES ('25355bdf795b468a9b1cb58f4f09778a', 'root', '用户登录', '正常', '2019-10-21 10:03:49', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('25cab2921a36409caf2c215b58bf8856', 'root', '用户登录', '正常', '2019-10-24 16:18:33', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('2610c9cf388c4db2a543156d0740f58b', 'root', '用户登录', '正常', '2019-10-21 16:13:41', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('27280065529e4170bb3858d0e8b9f2fb', 'root', '用户登录', '正常', '2019-10-22 14:40:37', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('27281c3191a14e958874b515fc53d03f', 'root', '用户登录', '正常', '2019-10-20 10:38:35', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('291b5230026b48e3bdb5c35085b43a26', 'root', '用户登录', '正常', '2019-10-24 16:14:48', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('29ae6f0201a84824ae60750d9e6050a5', 'root', '修改采集产品', '正常', '2019-08-04 22:55:14', '成功');
INSERT INTO `sys_log` VALUES ('2a3b316625364b199ef595becc0b2e80', 'root', '删除采集产品', '正常', '2019-08-05 15:49:59', '成功');
INSERT INTO `sys_log` VALUES ('2a45ad8691584820be31110693ad6e0d', 'root', '用户登录', '正常', '2019-10-19 15:58:15', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('2b893f5ad6ad4c0b9e16e77459619e0b', 'root', '新增菜单', '正常', '2019-10-17 11:50:20', '新增菜单:模拟器系统');
INSERT INTO `sys_log` VALUES ('2bef84b30cab4243926ef387bfc511db', 'cccc222bbb', '用户登录', '正常', '2019-08-07 19:50:39', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('2ca07823e51046cd94910c759b845aca', 'root', '新增菜单', '正常', '2019-10-17 13:20:45', '新增菜单:故障管理与健康管理');
INSERT INTO `sys_log` VALUES ('2d3fe0284249480a9a7eb16ad50a23b0', 'ffffff66666', '用户登录', '正常', '2019-08-08 10:56:30', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('2d51f30602884ba5a87af5a62eeab08c', 'root', '用户登录', '正常', '2019-10-21 10:02:05', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('2d850b77d86347ab8a2a2cc9b66f822f', 'root', '添加字段', '正常', '2019-10-21 10:04:03', '成功');
INSERT INTO `sys_log` VALUES ('2efd2d1680354ed993d8cb9549a2a4c1', 'root', '用户登录', '正常', '2019-10-22 14:46:21', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('3005f5608cad4e36954b12956f56d1d4', 'root', '添加故障记录', '正常', '2019-10-21 15:28:19', '成功');
INSERT INTO `sys_log` VALUES ('3071611f59414dd58ffdba85e5db679e', 'root', '用户登录', '正常', '2019-10-24 16:34:25', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('3091a61ff66540139fdc31ec4541efcc', 'root', '用户登录', '正常', '2019-10-22 13:48:53', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('31405ac8ac6343e8a1850747b295e88e', 'root', '用户登录', '正常', '2019-10-24 17:53:17', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('321a997b325d4cef8c18096a80daf1d6', 'root', '用户登录', '正常', '2019-10-25 11:07:29', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('32334c70fca44d81a9f9a00dc00fb7ab', 'root', '修改采集产品', '正常', '2019-08-05 15:48:43', '成功');
INSERT INTO `sys_log` VALUES ('332f594bd68b46228e2689b9b08fc973', 'root', '添加故障库', '正常', '2019-10-22 15:03:19', '成功');
INSERT INTO `sys_log` VALUES ('34b1120cf04d4d1baa81fa2a1fd43f2c', 'root', '添加模拟器', '正常', '2019-10-21 14:19:14', '成功');
INSERT INTO `sys_log` VALUES ('35e01a61a0674efaba6668740c02b275', null, '用户退出', '正常', '2019-08-07 20:08:18', '用户：退出成功！');
INSERT INTO `sys_log` VALUES ('35e98b33d64e454f992b6f66e0cb0206', 'root', '删除产品', '正常', '2019-08-04 16:49:56', '成功');
INSERT INTO `sys_log` VALUES ('36e1ca229fb5488ba29595231477588e', 'ffffff66666', '添加产品', '正常', '2019-08-08 11:07:12', '成功');
INSERT INTO `sys_log` VALUES ('37502f138d7e4f0184c08e950d574de2', 'root', '用户登录', '正常', '2019-10-22 11:39:27', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('3789c796e1fa4a6886752117b5b4c2ea', 'root', '用户登录', '正常', '2019-10-24 15:09:25', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('3851c801713a464ebbfd343918844427', 'abc33333', '添加分类', '正常', '2019-08-08 14:36:55', '成功');
INSERT INTO `sys_log` VALUES ('3929d0b23f424125a3e156f26d41c8c1', 'root', '用户登录', '正常', '2019-10-25 13:37:10', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('39a19959323848258ae42a9c7dbdea17', 'ffffff66666', '添加产品', '正常', '2019-08-08 10:58:19', '成功');
INSERT INTO `sys_log` VALUES ('3b0924ecfc114b709c3b9cc008486de1', 'root', '用户登录', '正常', '2019-10-21 14:40:16', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('3b0d195672d04814a5a033eb863a7c21', 'root', '修改菜单', '正常', '2019-10-22 15:51:13', '修改菜单:依赖关系设置');
INSERT INTO `sys_log` VALUES ('3b5166327b304a3392784d34ef8a8d46', 'root', '用户登录', '正常', '2019-10-17 15:29:19', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('3b669b8bcdb843139c907b60081988d1', 'root', '修改产品类型', '正常', '2019-10-23 08:31:21', '成功');
INSERT INTO `sys_log` VALUES ('3b93da46392748c78b8d065a0daa79da', 'root', '用户登录', '正常', '2019-10-21 17:58:15', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('3be9e3c5c6a04512950873939ee3a33d', 'root', '用户登录', '正常', '2019-08-05 17:03:44', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('3c341f977fe4473189c17e0af182ccf1', 'root', '修改依赖关系', '正常', '2019-10-25 11:23:04', '成功');
INSERT INTO `sys_log` VALUES ('3d6070db96414f5a9018fa7d29a4413e', 'root', '修改菜单', '正常', '2019-10-21 17:34:50', '修改菜单:设备属性配置');
INSERT INTO `sys_log` VALUES ('3d83925eb10b442b9460bb215b28112c', null, '用户退出', '正常', '2019-08-08 14:32:30', '用户：退出成功！');
INSERT INTO `sys_log` VALUES ('3df3557fe77d4bd4b0ff84376dca3315', 'root', '修改公司', '正常', '2019-10-17 14:09:57', '成功');
INSERT INTO `sys_log` VALUES ('3e06b5b02d42430ba72554bf97942601', 'root', '删除留言', '正常', '2019-08-20 09:43:09', '成功');
INSERT INTO `sys_log` VALUES ('3e2a8b7b94674228b0fcf3659f093fe1', 'root', '添加设备', '正常', '2019-10-21 13:57:26', '成功');
INSERT INTO `sys_log` VALUES ('3fec965d2b294c2ba82c2ea5ca3ed01f', 'abc33333', '用户登录', '正常', '2019-08-08 14:27:25', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('4084fcecbaa141988ccbdcb24a1c8229', 'root', '修改产品类型', '正常', '2019-10-19 16:16:33', '成功');
INSERT INTO `sys_log` VALUES ('40d9b6c7abb34ff990dbda7bbc64573a', 'root', '新增菜单', '正常', '2019-10-17 13:21:58', '新增菜单:值班管理');
INSERT INTO `sys_log` VALUES ('413ce06d7f244b56b52bda14f1c36d37', 'root', '用户登录', '正常', '2019-10-22 13:32:44', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('41987ead998b4b3497616337bb40d362', 'root', '修改菜单', '正常', '2019-10-22 14:22:22', '修改菜单:监控阈值设置');
INSERT INTO `sys_log` VALUES ('4205ab5f707545ad995a5b9c119e3d40', 'root', '用户登录', '正常', '2019-10-22 13:45:12', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('4211a3700ce24232a4c78b15c4478fdb', 'root', '修改依赖关系设置', '正常', '2019-10-25 11:25:18', '成功');
INSERT INTO `sys_log` VALUES ('42a556487ff449208397bca49426246b', 'root', '用户登录', '正常', '2019-08-20 19:39:16', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('42cd1d69b4594a9689c5b5d67ef4dfdf', 'root', '修改依赖关系设置', '正常', '2019-10-25 13:17:37', '成功');
INSERT INTO `sys_log` VALUES ('4329b6e2587446ed918ef54eabb51a12', 'root', '修改采集产品', '正常', '2019-08-05 17:09:00', '成功');
INSERT INTO `sys_log` VALUES ('4352ebc1b0c746cf80743861c09655b7', 'root', '添加依赖关系', '正常', '2019-10-22 14:55:08', '成功');
INSERT INTO `sys_log` VALUES ('43cc9594704245a8a4a9791687af587e', 'ffffff66666', '添加产品', '正常', '2019-08-08 10:58:11', '成功');
INSERT INTO `sys_log` VALUES ('4402bf7a67e84fd29da4a970f9108f7e', 'root', '用户登录', '正常', '2019-10-17 13:19:00', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('441030bc31b14b878378f0fd6c94b945', 'root', '删除权限', '正常', '2019-10-22 11:47:17', '成功');
INSERT INTO `sys_log` VALUES ('445f4833ba78451bb21ed5d5a8414c14', 'root', '删除产品类型', '正常', '2019-10-19 16:16:43', '成功');
INSERT INTO `sys_log` VALUES ('448c53dfdc2548e0b3a61299ceacbfd9', null, '用户退出', '正常', '2019-08-07 19:43:08', '用户：退出成功！');
INSERT INTO `sys_log` VALUES ('45bc98c0f3c946248573dfdb77124a9d', 'root', '删除采集产品', '正常', '2019-08-04 22:54:55', '成功');
INSERT INTO `sys_log` VALUES ('45ce7ca1839044e783d8c6c718ac4279', 'abc33333', '添加产品', '正常', '2019-08-08 14:30:10', '成功');
INSERT INTO `sys_log` VALUES ('461f3fede30442cd835227c296d51a85', 'root', '修改产品类型', '正常', '2019-10-21 17:35:25', '成功');
INSERT INTO `sys_log` VALUES ('46e159243d5449eb9945e22d1a881b64', 'root', '修改依赖关系设置', '正常', '2019-10-25 09:31:30', '成功');
INSERT INTO `sys_log` VALUES ('470f12ebb0684f209345861600131286', 'root', '修改菜单', '正常', '2019-10-22 16:05:28', '修改菜单:值班任务安排');
INSERT INTO `sys_log` VALUES ('4771e1f30cb04129ad9c054a127ace4e', 'root', '用户登录', '正常', '2019-08-08 14:26:32', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('4923ad62c74147a1af01df2ad06f9f66', 'root', '用户登录', '正常', '2019-10-22 08:54:33', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('492625ed02204399b24e8299a2e9d878', 'root', '用户登录', '正常', '2019-10-24 18:27:00', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('4a2f3b5de9c74d29a7c6bd92f3ad087e', 'root', '用户登录', '正常', '2019-10-22 16:11:00', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('4b60f9315464452197aef8eee116ed14', 'root', '添加模拟器', '正常', '2019-10-21 14:20:44', '成功');
INSERT INTO `sys_log` VALUES ('4dfb8b7241654e90ba6ede90f1582bb2', 'root', '添加值班登记', '正常', '2019-10-22 16:12:32', '成功');
INSERT INTO `sys_log` VALUES ('4e14ee5269d2482f92b38e9f47f923f6', 'root', '用户登录', '正常', '2019-10-17 16:46:16', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('4f290ca8b3c24ae6b47a959a879df9ed', 'root', '修改采集产品', '正常', '2019-08-20 18:39:34', '成功');
INSERT INTO `sys_log` VALUES ('4f3016fb8950492a802629ce5c1d4cc0', 'root', '添加依赖关系', '失败', '2019-10-25 08:46:37', '添加依赖关系失败:For input string: \"fd\"');
INSERT INTO `sys_log` VALUES ('50a9ed9d1ae84e2eb72d4ba7571d602e', 'root', '用户登录', '正常', '2019-10-20 10:59:04', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('50b9af2763f84efc9dc937303eedc77b', 'root', '修改产品类型', '正常', '2019-10-17 15:18:32', '成功');
INSERT INTO `sys_log` VALUES ('5106d170a0e24246a828b9389d848138', 'root', '修改依赖关系设置', '正常', '2019-10-25 09:42:27', '成功');
INSERT INTO `sys_log` VALUES ('51d18ae9cb774986be5dbdcea02a1604', 'root', '添加产品类型', '正常', '2019-10-19 16:10:41', '成功');
INSERT INTO `sys_log` VALUES ('51d3b95d3d5c483189915eaecbd0de84', 'root', '用户登录', '正常', '2019-10-24 14:52:17', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('524e4ff263ad4ddc9c7feb205cb8d198', 'root', '用户登录', '正常', '2019-10-21 17:18:11', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('52f644ad9e9a46799e3c13ed90701e7b', 'root', '删除采集产品', '正常', '2019-08-05 17:27:52', '成功');
INSERT INTO `sys_log` VALUES ('5307344c38d84d408c292ca2d616c22c', 'root', '用户登录', '正常', '2019-10-17 10:59:19', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('531054356f10419ea4983d182b2a790c', 'root', '用户登录', '正常', '2019-10-22 11:10:11', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('53779a6856b64dcb99b02c871c6a1d98', 'root', '用户登录', '正常', '2019-10-21 17:43:11', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('545cb186b66d4470b5a0f7ab07219813', 'aaaaccccc333', '用户登录', '正常', '2019-08-07 19:42:13', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('5498dc6378c748fda5b8a6c0c3e01111', 'root', '修改菜单', '正常', '2019-10-22 13:33:09', '修改菜单:日志记录配置');
INSERT INTO `sys_log` VALUES ('54e295704ea8424384b63d3a560fa6a8', 'root', '修改菜单', '正常', '2019-10-21 15:27:49', '修改菜单:故障记录');
INSERT INTO `sys_log` VALUES ('54f9bddae85a46c3b18d9b679700ddb3', 'root', '用户登录', '正常', '2019-10-24 17:58:46', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('5758a4809ead48829863c41f024b6907', 'root', '删除产品类型', '正常', '2019-10-17 15:26:19', '成功');
INSERT INTO `sys_log` VALUES ('57bdb204731c484eb6b8513cace259bc', 'root', '用户登录', '正常', '2019-10-21 18:06:16', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('58da35084cc84098895e5964ad5af4af', 'root', '修改菜单', '正常', '2019-10-21 17:18:35', '修改菜单:添加日志记录');
INSERT INTO `sys_log` VALUES ('5937113b34ee49368b402257eed1be6a', 'root', '修改权限', '正常', '2019-10-22 11:49:58', '成功');
INSERT INTO `sys_log` VALUES ('5a92b3bab7c84cfa9dede58773666ef9', 'root', '添加故障记录', '正常', '2019-10-21 15:34:04', '成功');
INSERT INTO `sys_log` VALUES ('5cebea86952f46f59ab110281777a93e', 'root', '删除产品', '正常', '2019-08-05 11:20:48', '成功');
INSERT INTO `sys_log` VALUES ('5d278f6bc83048378b7e0380385f23c2', 'root', '用户登录', '正常', '2019-10-21 14:18:31', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('5d63fc75ab494e1083ee2fe89ccd8b26', 'root', '删除产品', '正常', '2019-08-05 10:23:16', '成功');
INSERT INTO `sys_log` VALUES ('5ea5998abf614474ae9618c9300e3e2c', 'root', '用户登录', '正常', '2019-10-25 13:47:37', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('5ef394fe43074e89ac4ab3901bd2f71f', 'root', '新增菜单', '正常', '2019-10-17 11:52:13', '新增菜单:设备属性管理');
INSERT INTO `sys_log` VALUES ('5f365cd894c24784991462902ba4714d', 'root', '用户登录', '正常', '2019-10-21 17:34:11', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('5f6c565d0a474cc5952af14739c53f7e', 'root', '用户登录', '正常', '2019-10-25 14:00:13', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('5ffe58ead9ce471f85c4968ab229c606', 'root', '修改菜单', '正常', '2019-10-22 16:11:24', '修改菜单:值班登记');
INSERT INTO `sys_log` VALUES ('6066ddde49c249eab6a5fc072c981568', 'root', '用户登录', '正常', '2019-10-21 15:47:00', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('60e86c5a47934b8aba0bdb8d06b2939f', 'root', '用户登录', '正常', '2019-08-04 22:26:39', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('626dfa642ec64f9d9a952d93fea5391b', 'root', '用户登录', '正常', '2019-10-21 16:18:29', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('62d4db45fdd94e3986ebaf0d1a28d22a', 'root', '新增菜单', '正常', '2019-10-17 11:48:23', '新增菜单:基本信息配置管理');
INSERT INTO `sys_log` VALUES ('65de8c9661554b588f26302cdaa091fd', 'root', '用户登录', '正常', '2019-08-20 19:55:08', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('66c8f141a79d49568b18bc24b969692a', 'root', '用户登录', '正常', '2019-10-21 18:03:10', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('687fba37280e4587a939f2fbbfe3b56a', null, '用户退出', '正常', '2019-10-21 17:59:22', '用户：退出成功！');
INSERT INTO `sys_log` VALUES ('689f10facb254ffe9ed71b81630b0479', 'root', '修改菜单', '正常', '2019-10-21 17:54:17', '修改菜单:计算机开关机控制');
INSERT INTO `sys_log` VALUES ('699424c694b04c62a4a624e41e797b84', 'root', '用户登录', '正常', '2019-10-24 16:57:19', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('6aa94d80cb0c435ba4794510d517559c', 'root', '删除产品类型', '正常', '2019-10-20 10:38:59', '成功');
INSERT INTO `sys_log` VALUES ('6ad75e1b5a5d495b9d49c0ea96968e8f', 'root', '用户登录', '正常', '2019-10-25 13:02:41', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('6b0ad834eb894560bb58d9f678425203', 'root', '修改分类', '正常', '2019-08-06 08:55:12', '成功');
INSERT INTO `sys_log` VALUES ('6d2d290dff5f4fddad879acb6f80be42', 'root', '修改菜单', '正常', '2019-10-19 15:58:42', '修改菜单:产品类型');
INSERT INTO `sys_log` VALUES ('6e8fc5e9e64340548efc133758c9e2a8', 'root', '新增菜单', '正常', '2019-10-21 16:23:12', '新增菜单:添加日志记录');
INSERT INTO `sys_log` VALUES ('6fd21c76fbb24471a7fa6b347a0f425a', 'ffffff66666', '修改产品', '正常', '2019-08-08 11:12:36', '成功');
INSERT INTO `sys_log` VALUES ('7023cb29067144dcad09375e340a9dc5', 'root', '删除产品', '正常', '2019-08-20 09:40:55', '成功');
INSERT INTO `sys_log` VALUES ('704e8b8a070e4e3bab1438a108934aee', 'root', '用户登录', '正常', '2019-10-17 15:47:33', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('71459716b1c04c27bad1a2d64cca9354', 'root', '用户登录', '正常', '2019-10-20 09:52:42', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('7155299db0b24d559a4de793dbd94544', 'root', '用户登录', '正常', '2019-10-21 18:01:05', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('717822041dd24281aa906b4ebbef1204', 'root', '删除产品', '正常', '2019-08-05 10:38:07', '成功');
INSERT INTO `sys_log` VALUES ('738e5262957446a79982b8fbb80b8838', 'admin', '用户登录', '正常', '2019-10-21 17:59:14', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('73d3a22eee8f4323b45cde0679a79d64', 'root', '用户登录', '正常', '2019-10-22 15:57:13', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('73ec30144a104b9d9b0c0bb3d748acc4', 'root', '添加依赖关系', '正常', '2019-10-22 14:41:26', '成功');
INSERT INTO `sys_log` VALUES ('74594230f5394583a4ec445c3f47b204', 'root', '用户登录', '正常', '2019-10-24 15:41:26', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('7459d4798dc44d9db8022d7e663be3a2', 'root', '用户登录', '正常', '2019-10-19 11:07:36', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('748c8fd5b32a48ef916e05aed67cb557', 'root', '用户登录', '正常', '2019-10-21 16:02:03', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('74a5fd61c59f40d2960775675dcd1b50', 'abc33333', '用户登录', '正常', '2019-08-08 14:36:38', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('751c89ea2aa347ae86dfa961b9dcb7dd', 'root', '新增菜单', '正常', '2019-10-17 13:21:36', '新增菜单:日志记录');
INSERT INTO `sys_log` VALUES ('763e92e9762744628c7a17c1845dafbe', 'root', '用户登录', '正常', '2019-10-19 10:08:50', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('76e1ea41d0ad4fa48839b9c8824a7c28', 'root', '用户登录', '正常', '2019-10-21 14:53:19', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('7756277fcedc496ca2d6663fd90999b9', 'root', '用户登录', '正常', '2019-08-20 19:59:26', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('7945854d2ce24b468950a6ad7db78ff5', 'root', '用户登录', '正常', '2019-10-22 13:08:32', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('7b0dc9cf90b74f71873a353dccabc58d', 'root', '用户登录', '正常', '2019-10-17 15:17:50', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('7bb1b9c91f2f422cb2baee4ebf71311a', 'root', '用户登录', '正常', '2019-10-24 15:19:27', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('7d0ac59094294cd0bd18270f8473640d', 'root', '新增菜单', '正常', '2019-10-17 13:24:47', '新增菜单:依赖关系管理');
INSERT INTO `sys_log` VALUES ('7d7e00eeacb04a299e4a2231ff9957f2', 'ffffff66666', '删除产品', '正常', '2019-08-08 11:12:27', '成功');
INSERT INTO `sys_log` VALUES ('7d80fada238d436ca7d8cbde2e37d542', 'root', '用户登录', '正常', '2019-08-04 22:04:12', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('7decf9e84dae46c0861a5c51811f32cf', 'root', '用户登录', '正常', '2019-10-22 15:50:49', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('7e7f79cb362644b5905af57c547c9d3d', 'root', '用户登录', '正常', '2019-10-21 14:57:28', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('7f32c2a8b5ef40aea62d6cf5940d68ac', 'root', '添加设备', '正常', '2019-10-21 14:56:07', '成功');
INSERT INTO `sys_log` VALUES ('7f3fe5b34b69415b93897f577db685f8', 'root', '修改采集产品', '正常', '2019-08-05 17:11:02', '成功');
INSERT INTO `sys_log` VALUES ('7f5bff4a1ebf4d9298b9c53fefe90cd1', 'root', '用户登录', '正常', '2019-08-08 11:18:55', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('81ae3087431b473d9fe9c153f8d4d3d4', 'root', '修改产品类型', '正常', '2019-10-20 10:38:50', '成功');
INSERT INTO `sys_log` VALUES ('81c51f2c96ac4d76bb83b5a41ef94f7a', 'root', '添加字段', '正常', '2019-10-21 10:10:14', '成功');
INSERT INTO `sys_log` VALUES ('828b995aec4a4d2ea7728e1d70060d42', 'root', '删除权限', '正常', '2019-10-22 11:48:39', '成功');
INSERT INTO `sys_log` VALUES ('84af92e1817e4cbe9152b44b02abf22f', 'root', '修改依赖关系设置', '正常', '2019-10-25 09:47:40', '成功');
INSERT INTO `sys_log` VALUES ('852f469a9ff7450fa5f5623ca029b590', 'root', '修改采集产品', '正常', '2019-08-20 18:44:53', '成功');
INSERT INTO `sys_log` VALUES ('86025f0d6e434f43b6b4bfd85975366e', null, '用户退出', '正常', '2019-08-08 14:39:16', '用户：退出成功！');
INSERT INTO `sys_log` VALUES ('862938e32d6c41fc999f9589fcf42cf4', 'root', '用户登录', '正常', '2019-10-17 14:09:05', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('86e7d9912f284901af0ad9752da2c3f4', 'root', '添加采集产品', '正常', '2019-08-20 18:57:40', '成功');
INSERT INTO `sys_log` VALUES ('87b910fc04044a5d8b003b081fcf0909', 'root', '新增菜单', '正常', '2019-10-17 11:50:49', '新增菜单:产品类型');
INSERT INTO `sys_log` VALUES ('87cf24e05f5a4a8b9f0ef20553f36cec', 'root', '添加值班任务', '正常', '2019-10-22 16:05:57', '成功');
INSERT INTO `sys_log` VALUES ('8831333dad6f4e36931615507c5f66fb', 'root', '用户登录', '正常', '2019-10-24 15:27:44', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('883bc0fdedfc464b818e5cfb1bd16639', 'root', '修改菜单', '正常', '2019-10-22 15:10:06', '修改菜单:依赖关系设置');
INSERT INTO `sys_log` VALUES ('8a27d160fc51443c900f14e9ac67c3e1', 'root', '修改菜单', '正常', '2019-10-21 13:52:03', '修改菜单:设备管理');
INSERT INTO `sys_log` VALUES ('8a9e21ab612b4499abf69fa65ded4fa9', 'root', '修改产品类型', '正常', '2019-10-21 17:35:35', '成功');
INSERT INTO `sys_log` VALUES ('8b334de4ce4d45948d84b0de113e957e', 'root', '添加依赖关系', '正常', '2019-10-25 08:46:58', '成功');
INSERT INTO `sys_log` VALUES ('8bf9941341fa442e8a4c43e072b03be4', 'ffffff66666', '用户登录', '正常', '2019-08-08 10:55:41', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('8c94fdf90e3648f1b5e0ba9333ebc42b', 'root', '删除依赖关系', '正常', '2019-10-25 08:59:30', '成功');
INSERT INTO `sys_log` VALUES ('8e76e573b5ec4edaa5b715ac6c441661', 'root', '修改菜单', '正常', '2019-10-21 14:18:52', '修改菜单:模拟器系统');
INSERT INTO `sys_log` VALUES ('8fa2d286742a4f37b221f659db120204', 'root', '修改采集产品', '正常', '2019-08-05 19:50:21', '成功');
INSERT INTO `sys_log` VALUES ('9071ced305474d8bba1eed08522f6d55', 'root', '用户登录', '正常', '2019-10-10 13:26:42', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('90e34632ee1247bcb972950db747c3e9', 'root', '删除设备', '正常', '2019-10-21 14:56:12', '成功');
INSERT INTO `sys_log` VALUES ('90ebf518ca3047a4a122fd4f3303f75f', 'root', '用户登录', '正常', '2019-08-07 20:33:20', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('91b25877ec264a26ab8a367b696cad7e', 'root', '用户登录', '正常', '2019-10-21 15:38:01', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('92d670b7e2bf43729e98a5678df6d598', 'root', '修改菜单', '正常', '2019-10-17 13:19:29', '修改菜单:设备管理及数据采集');
INSERT INTO `sys_log` VALUES ('9323053df258461eb8c3c59761640ace', 'root', '修改产品类型', '正常', '2019-10-19 16:14:57', '成功');
INSERT INTO `sys_log` VALUES ('9332c93768444854a9b8ca231cedbb06', 'root', '修改依赖关系设置', '正常', '2019-10-25 09:22:08', '成功');
INSERT INTO `sys_log` VALUES ('933696a1e2964a918793560993cf54d1', 'root', '用户登录', '正常', '2019-10-21 15:58:15', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('93726b733dbc41e6a1ab5a363787bade', 'root', '删除搜索项', '正常', '2019-08-05 16:54:29', '成功');
INSERT INTO `sys_log` VALUES ('94fe3528464340c6a7bc7586a032c52f', 'root', '添加故障记录', '正常', '2019-10-21 15:38:10', '成功');
INSERT INTO `sys_log` VALUES ('96bdce6da42e4f93bf073056f4fdf448', 'root', '用户登录', '正常', '2019-10-22 14:56:49', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('97bb4783509b45be85d0b8bf823ec3e3', 'root', '用户登录', '正常', '2019-08-05 15:01:20', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('98db5340aac54c84b8d8c5e8d7e2f07e', 'root', '用户登录', '正常', '2019-10-20 10:46:37', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('99572063e0c74a9b8569ea5e1e23feef', 'root', '新增菜单', '正常', '2019-10-17 11:51:47', '新增菜单:设备属性配置');
INSERT INTO `sys_log` VALUES ('99b1ae1cd9994f18a668008ca87603d3', 'root', '修改依赖关系设置', '正常', '2019-10-25 09:42:33', '成功');
INSERT INTO `sys_log` VALUES ('9a71983528534e2baeacf8a729275b7e', 'root', '删除权限', '正常', '2019-10-22 11:47:54', '成功');
INSERT INTO `sys_log` VALUES ('9a7664d8099446baa4c7aee0da62c084', null, '用户退出', '正常', '2019-08-07 19:55:08', '用户：退出成功！');
INSERT INTO `sys_log` VALUES ('9be4038b0f624848b02c2458c39ed468', 'root', '添加维修记录', '正常', '2019-10-21 15:58:31', '成功');
INSERT INTO `sys_log` VALUES ('9c8e3c1580354ebc83064890b0d951c8', 'root', '用户登录', '正常', '2019-10-24 15:50:05', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('9cdb66e4fa884ffe8348029ab07af07e', 'root', '修改依赖关系', '正常', '2019-10-22 14:54:47', '成功');
INSERT INTO `sys_log` VALUES ('9dc2cb1ae1b2413dbb8fff823e96c1b4', 'root', '用户登录', '正常', '2019-10-25 09:42:12', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('9e87f267298a4ddea39cec4e5c9830b7', 'root', '添加依赖关系', '正常', '2019-10-22 14:56:00', '成功');
INSERT INTO `sys_log` VALUES ('9edc69b7a27c400b9a03bb8012e05e8b', 'root', '删除权限', '正常', '2019-10-22 11:49:01', '成功');
INSERT INTO `sys_log` VALUES ('9f281a27d51c41978b69a804d54ab395', 'root', '添加字段', '失败', '2019-10-20 10:59:14', '添加字段失败:\r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'field_id\' in \'field list\'\r\n### The error may involve com.cinema.biz.dao.SimFieldMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sim_type  ( field_id,create_time,creator ) VALUES( ?,?,? )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'field_id\' in \'field list\'');
INSERT INTO `sys_log` VALUES ('a14bd55df9b840a1969e5d00196cae6a', 'root', '用户登录', '正常', '2019-10-23 09:41:00', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('a1d0457fb7a6487e938e2261cbe227ef', 'root', '新增菜单', '正常', '2019-10-17 13:27:33', '新增菜单:维修记录');
INSERT INTO `sys_log` VALUES ('a23e6c3b1cb2403080c49e669f7c6e24', 'root', '用户登录', '正常', '2019-10-21 17:55:48', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('a3098292852a48bd89ff6c8084afb805', 'root', '修改依赖关系设置', '正常', '2019-10-25 13:17:32', '成功');
INSERT INTO `sys_log` VALUES ('a3313e579f4a4846a4bd29e8ac76eb01', 'root', '修改采集产品', '正常', '2019-08-20 18:41:36', '成功');
INSERT INTO `sys_log` VALUES ('a3a5bb7ac02744c9ac13a6c9745a418f', 'root', '删除产品类型', '正常', '2019-10-21 17:35:44', '成功');
INSERT INTO `sys_log` VALUES ('a3acf79154074925a7162d48b5565d59', 'root', '添加操作记录', '正常', '2019-10-21 16:14:17', '成功');
INSERT INTO `sys_log` VALUES ('a44b1979a0914adbbbfb96ce67e4d19d', 'root', '用户登录', '正常', '2019-10-21 14:07:50', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('a5b7293cfa7b4db8a92eb633daadc288', 'root', '用户登录', '正常', '2019-10-24 14:28:53', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('a5c55852504b41b0a442e9d217986c0d', null, '用户退出', '正常', '2019-08-07 21:08:40', '用户：退出成功！');
INSERT INTO `sys_log` VALUES ('a5f4cf0847cc4b6f94373147eb19dd80', 'root', '修改菜单', '正常', '2019-10-22 15:02:52', '修改菜单:设备故障库设置');
INSERT INTO `sys_log` VALUES ('a66ad6f7b58842b1884af7c17a3e3671', 'root', '修改依赖关系设置', '正常', '2019-10-25 09:28:42', '成功');
INSERT INTO `sys_log` VALUES ('a683c46e38ca4a0884b8ca48cff0c340', 'root', '添加依赖关系设置', '正常', '2019-10-25 09:50:22', '成功');
INSERT INTO `sys_log` VALUES ('a7228ce82bec481c8d937efb1bf893fa', 'root', '用户登录', '正常', '2019-10-24 17:20:47', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('a7749f7cf43f45b59ece4e08741251de', 'root', '用户登录', '正常', '2019-10-23 08:27:27', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('a7da1a61ae9b41a7bae5f1550e3f7e58', 'root', '添加字段', '正常', '2019-10-21 10:14:55', '成功');
INSERT INTO `sys_log` VALUES ('a83e07f5a416487fb1dda9d5a9e796a7', 'root', '用户登录', '正常', '2019-10-24 16:16:24', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('a863904f9f5646a1966a0fd1374aa6e1', 'root', '添加值班任务', '正常', '2019-10-22 16:06:04', '成功');
INSERT INTO `sys_log` VALUES ('a939566d4aea41de948dfbce36582472', 'ffffff66666', '添加产品', '正常', '2019-08-08 11:11:30', '成功');
INSERT INTO `sys_log` VALUES ('aaf3bebe9de0428c87dad695e9946987', 'root', '添加设备属性配置', '正常', '2019-10-21 17:41:50', '成功');
INSERT INTO `sys_log` VALUES ('ac196137835943b09cae72c1078b9ca9', 'root', '用户登录', '正常', '2019-10-20 11:16:12', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('adbeb04698dc45fc84fcdcb4e362d5ee', 'root', '修改依赖关系设置', '正常', '2019-10-25 09:32:22', '成功');
INSERT INTO `sys_log` VALUES ('ae2af828a95b43ef99b5fd4f028b4583', 'root', '修改菜单', '正常', '2019-10-21 15:50:06', '修改菜单:维护保养记录');
INSERT INTO `sys_log` VALUES ('ae4574fd4d8c4949b95ae493ef690a83', 'root', '修改产品类型', '正常', '2019-10-17 15:25:11', '成功');
INSERT INTO `sys_log` VALUES ('aedfb637474e468aa5f86e2faa57d48b', 'root', '用户登录', '正常', '2019-10-22 15:09:52', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('aee2df9ae7e1430495ffd3e1a1d91ace', 'root', '用户登录', '正常', '2019-10-24 18:12:14', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('b1058f9e13f34908b4fbd2281862dfe1', 'root', '修改菜单', '正常', '2019-10-21 15:50:20', '修改菜单:维修记录');
INSERT INTO `sys_log` VALUES ('b10821229d5f46458a518e8bf3a347a9', 'root', '用户登录', '正常', '2019-10-24 16:20:59', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('b211b3e6e4b340259e367f77823efbe1', 'root', '用户登录', '正常', '2019-08-20 18:19:21', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('b58f6564f079457eb9a19897e318a923', 'ffffff66666', '修改产品', '正常', '2019-08-08 11:13:16', '成功');
INSERT INTO `sys_log` VALUES ('b61593b7ca154cf58324f268f1eea04a', 'root', '修改模拟器', '正常', '2019-10-21 14:20:30', '成功');
INSERT INTO `sys_log` VALUES ('b78250e439cb4b5494bc38f49d147487', 'root', '删除搜索项', '正常', '2019-08-05 16:55:08', '成功');
INSERT INTO `sys_log` VALUES ('b8a2cf22e34248f3884907e2268919be', 'root', '新增菜单', '正常', '2019-10-17 13:26:16', '新增菜单:维护保养记录');
INSERT INTO `sys_log` VALUES ('b9cb732af6794a8497ede53d36b2f76a', 'root', '用户登录', '正常', '2019-10-24 14:20:01', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('ba17995e9d444970812a4a30a6314d73', 'ffffff66666', '用户登录', '正常', '2019-08-08 11:07:59', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('ba7e1237636e4ee19cc1f06f2d18d139', 'root', '添加监控阈值', '正常', '2019-10-22 14:27:23', '成功');
INSERT INTO `sys_log` VALUES ('bc0f90c5e1ea45b9b5ddeb26bb4c2d6f', 'root', '添加产品类型', '正常', '2019-10-20 10:38:56', '成功');
INSERT INTO `sys_log` VALUES ('bc224549c0fc4aacb869275ff12cc343', null, '用户退出', '正常', '2019-08-07 20:41:07', '用户：退出成功！');
INSERT INTO `sys_log` VALUES ('bc32fcbcb8d74c0196f180e3da5ff604', 'root', '新增菜单', '正常', '2019-10-17 13:27:01', '新增菜单:故障记录');
INSERT INTO `sys_log` VALUES ('bc3d55ffa5b34b4a868cdf77ec0023f0', 'root', '修改产品类型', '正常', '2019-10-17 15:18:02', '成功');
INSERT INTO `sys_log` VALUES ('bc65258c2cfa40368357b78f5fbe7c61', 'root', '用户登录', '正常', '2019-10-21 17:57:25', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('bc90b23aedea432e9cb924bc4e9c430d', 'root', '添加产品类型', '正常', '2019-10-17 15:26:10', '成功');
INSERT INTO `sys_log` VALUES ('bdb6eaeee73c4332a9210bf8ac65b3b6', 'ffffff66666', '添加产品', '正常', '2019-08-08 11:02:23', '成功');
INSERT INTO `sys_log` VALUES ('be17d0a876cf405fa026c7376760b91d', 'aaaa1111', '用户登录', '正常', '2019-08-07 21:08:34', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('be7bcf121fa94d5caa4324be305c718f', 'root', '删除产品', '正常', '2019-08-05 15:50:44', '成功');
INSERT INTO `sys_log` VALUES ('bfa80b52ab0d40dc922bda4ca5de369b', 'abc33333', '修改产品', '正常', '2019-08-08 14:37:08', '成功');
INSERT INTO `sys_log` VALUES ('c061c5b7b8824b7ca184a093580004ae', 'root', '用户登录', '正常', '2019-10-22 16:05:14', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('c0c6ba5a868147c5983ad1713861f968', null, '用户退出', '正常', '2019-08-08 10:56:04', '用户：退出成功！');
INSERT INTO `sys_log` VALUES ('c150adb81faa40b0b7322ed3bd748aa1', 'root', '用户登录', '正常', '2019-10-21 15:27:29', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('c1b2dfd90f2844919485658990c6c0c0', 'root', '用户登录', '正常', '2019-10-24 17:46:59', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('c28fbc1c54da488b819a5c5b6327c287', 'root', '用户登录', '正常', '2019-10-24 14:25:31', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('c2b8fa9823174b2eadeb14426d01fd52', 'root', '用户登录', '正常', '2019-08-05 11:20:31', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('c2f78dfdf3ca4a8490085b181e3465db', 'root', '新增菜单', '正常', '2019-10-17 13:24:04', '新增菜单:依赖关系设置');
INSERT INTO `sys_log` VALUES ('c3e6a351ff76498a9f5719400b40a2a7', 'root', '修改采集产品', '正常', '2019-08-20 18:44:00', '成功');
INSERT INTO `sys_log` VALUES ('c478b4e1405f4fc8985c1077f769230a', 'root', '用户登录', '正常', '2019-08-06 08:27:50', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('c48057e2335f43a2875fd740bcc66c1d', null, '用户退出', '正常', '2019-08-08 14:26:38', '用户：退出成功！');
INSERT INTO `sys_log` VALUES ('c5f8f6e823474870840be6b0329c4824', 'root', '用户登录', '正常', '2019-10-22 14:21:57', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('c613de2ce6d745b2b2dac99f9dee226e', 'root', '修改采集产品', '正常', '2019-08-20 18:42:35', '成功');
INSERT INTO `sys_log` VALUES ('c6941ec87fcd44abbca7a926a063b1d3', 'root', '修改菜单', '正常', '2019-10-22 14:41:05', '修改菜单:依赖关系管理');
INSERT INTO `sys_log` VALUES ('c6a1b378063f4dd390ce6a746841c311', 'root', '修改菜单', '正常', '2019-10-20 10:41:57', '修改菜单:设备属性管理');
INSERT INTO `sys_log` VALUES ('c6c320919982429bbb0932f6f7cdd26f', 'root', '用户登录', '正常', '2019-10-21 17:59:33', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('c6e310d88dd244a7923f9b0b89f8e254', 'root', '用户登录', '正常', '2019-08-05 15:38:24', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('c759b1b09dbb4558b75a0fe47e6024bb', 'root', '删除采集产品', '正常', '2019-08-20 18:54:09', '成功');
INSERT INTO `sys_log` VALUES ('c775380541ca41b39190e43fac7e9700', 'root', '删除依赖关系', '正常', '2019-10-22 14:54:51', '成功');
INSERT INTO `sys_log` VALUES ('c7d467e3512c4729867c486f677b0f0f', 'root', '用户登录', '正常', '2019-10-25 11:01:15', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('c8e85b30a3554fe1b3eca1e83bebe5b0', 'root', '添加设备', '正常', '2019-10-21 13:57:37', '成功');
INSERT INTO `sys_log` VALUES ('c999a65d4e4342668b0fa7cc501fef5c', 'root', '用户登录', '正常', '2019-10-20 11:18:06', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('ca7174067e974620b830fae7e48f28c7', 'root', '修改产品类型', '正常', '2019-10-17 15:25:02', '成功');
INSERT INTO `sys_log` VALUES ('cab0af29f7a3492cb0fec7d73e56334d', 'root', '用户登录', '正常', '2019-10-21 08:32:53', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('cae8730ddea0447cb5dc197809990c3f', 'root', '用户登录', '正常', '2019-08-05 08:55:00', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('cb2065097ab24451a917ba9eaee81242', 'root', '用户登录', '正常', '2019-08-05 18:34:45', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('cbee8074351e4b688ead1b15066f68ae', 'root', '用户登录', '正常', '2019-10-19 16:03:49', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('cc0f3c79ecca4049ba2835d0fce99437', 'root', '添加分类', '正常', '2019-10-17 14:10:13', '成功');
INSERT INTO `sys_log` VALUES ('cf2f32ddfdf4416e8c21dc129f209037', 'root', '用户登录', '正常', '2019-10-24 15:11:44', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('cfe59d0a92e24e9e983f1beb065b2d55', 'root', '用户登录', '正常', '2019-10-25 14:10:50', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('d047ae1a863c4b0692cf2ae0f15d6beb', 'root', '修改产品类型', '正常', '2019-10-17 15:47:43', '成功');
INSERT INTO `sys_log` VALUES ('d0799ffa5c7b4618813de598e8b32f4a', 'root', '用户登录', '正常', '2019-10-22 14:26:05', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('d1d6ee707fb04db2a75aaf65dc475cc7', 'root', '用户登录', '正常', '2019-10-21 14:33:06', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('d1e7fe66f1d349649578fedc84157258', 'abc33333', '修改产品', '正常', '2019-08-08 14:32:20', '成功');
INSERT INTO `sys_log` VALUES ('d25cf793870f4df782929662852e106b', 'root', '添加故障记录', '正常', '2019-10-21 15:33:50', '成功');
INSERT INTO `sys_log` VALUES ('d3be5d04e04843168afd109a712da1a5', 'root', '修改采集产品', '正常', '2019-08-05 17:10:26', '成功');
INSERT INTO `sys_log` VALUES ('d554924744854d5ca8f473f3f04393f9', 'root', '修改菜单', '正常', '2019-10-21 15:49:49', '修改菜单:操作记录');
INSERT INTO `sys_log` VALUES ('d5aef6e5d6074036aad30b4e99eca541', 'root', '添加维护保养', '正常', '2019-10-21 16:14:51', '成功');
INSERT INTO `sys_log` VALUES ('d5ebcac27e614df1b571d75266273f81', 'ffffff66666', '添加产品', '正常', '2019-08-08 10:57:39', '成功');
INSERT INTO `sys_log` VALUES ('d652f6cdedfa4acfbc4957a586b54389', 'ffffff66666', '添加产品', '正常', '2019-08-08 11:08:53', '成功');
INSERT INTO `sys_log` VALUES ('d68b1c2a78f0439dbc7841377831aa40', 'root', '删除用户', '正常', '2019-08-20 09:44:02', '成功');
INSERT INTO `sys_log` VALUES ('d6a7d026861a4c3e8fd3e8373a26551e', 'root', '添加依赖关系', '正常', '2019-10-22 14:55:39', '成功');
INSERT INTO `sys_log` VALUES ('d71d84d08950412c8caa2e09ce842224', 'root', '修改菜单', '正常', '2019-10-17 14:26:16', '修改菜单:产品类型');
INSERT INTO `sys_log` VALUES ('d7ba3c916ff64513b7b871319cf617a5', 'root', '用户登录', '正常', '2019-08-05 11:11:29', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('d7c0c9d75e864853a2610d563ec3f590', 'root', '删除依赖关系', '正常', '2019-10-22 14:52:46', '成功');
INSERT INTO `sys_log` VALUES ('d8b3d5c6f8794964802c0d4642f3b037', 'root', '用户登录', '正常', '2019-10-22 13:51:21', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('d92793547c1a4b069e5dc6a552828cda', 'root', '用户登录', '正常', '2019-10-24 16:42:40', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('d982fc91c44d4636982a80231e281130', 'root', '删除产品类型', '正常', '2019-10-17 15:26:24', '成功');
INSERT INTO `sys_log` VALUES ('daf4311abd2a48de94fa471563b9ccbc', 'cccc222bbb', '添加产品', '失败', '2019-08-07 19:52:52', '添加产品失败:\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'area_id\' cannot be null\r\n### The error may exist in file [C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\wtpwebapps\\zproduct-web\\WEB-INF\\classes\\com\\cinema\\biz\\dao\\impl\\TotalProductMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into pro_total_product (cat_id,area_id,total,is_audit)values(?,?,1,1)\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'area_id\' cannot be null');
INSERT INTO `sys_log` VALUES ('db22604bfa46436f863841dd05c8ffd7', 'root', '修改依赖关系设置', '正常', '2019-10-25 14:51:04', '成功');
INSERT INTO `sys_log` VALUES ('db737cb484774448bace73068d7e7b84', 'root', '添加字段', '正常', '2019-10-21 10:04:18', '成功');
INSERT INTO `sys_log` VALUES ('dc78aeec45204adb9784586e429d1285', 'root', '修改产品类型', '正常', '2019-10-19 16:16:40', '成功');
INSERT INTO `sys_log` VALUES ('dc8a821c173343218cf7bb79e18096df', 'root', '新增菜单', '正常', '2019-10-17 11:49:48', '新增菜单:设备管理控制及数据采集');
INSERT INTO `sys_log` VALUES ('de4bf02c13cf469797f6c559402c4546', 'root', '新增菜单', '正常', '2019-10-17 13:28:11', '新增菜单:值班任务安排');
INSERT INTO `sys_log` VALUES ('df55afd4637b49cb91a9b3e9c132568b', 'root', '用户登录', '正常', '2019-10-21 14:51:15', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('e17776eaff7744ed958ff36bb42da218', 'root', '删除产品', '正常', '2019-08-05 19:11:57', '成功');
INSERT INTO `sys_log` VALUES ('e1f64287c7db44efb937987f5a9e735f', 'root', '用户登录', '正常', '2019-10-17 14:27:55', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('e20ca6f6d9db4a49b9b40695fee507b5', 'root', '修改产品类型', '正常', '2019-10-21 08:40:22', '成功');
INSERT INTO `sys_log` VALUES ('e2fca53a49ab4c6c8b9206993c3ae1e7', 'root', '添加设备属性配置', '正常', '2019-10-21 17:43:28', '成功');
INSERT INTO `sys_log` VALUES ('e523e50b84b44d719aabd02099a37888', 'root', '用户登录', '正常', '2019-10-24 16:27:12', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('e60b9338a1014d9aac8d79f1b3e975f8', 'root', '用户登录', '正常', '2019-10-24 17:27:42', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('e60be19017de4cbe8ccccec7a2fa6eba', 'root', '用户登录', '正常', '2019-08-07 19:55:09', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('e6249089529d46d79cd311edad0c05de', 'ffffff66666', '添加产品', '正常', '2019-08-08 11:13:54', '成功');
INSERT INTO `sys_log` VALUES ('e673e67fa4ed4868b2ceb7698904f8fd', 'root', '删除产品', '正常', '2019-08-05 15:44:22', '成功');
INSERT INTO `sys_log` VALUES ('e6e7991ae92340b1a61ae32757be5538', 'root', '添加维修记录', '正常', '2019-10-21 16:02:21', '成功');
INSERT INTO `sys_log` VALUES ('e776094aff944362ab31f7b8778fea11', 'abc33333', '添加分类', '正常', '2019-08-08 14:36:58', '成功');
INSERT INTO `sys_log` VALUES ('e8c306783f2746ab81fce0c77fd28306', 'root', '用户登录', '正常', '2019-10-25 13:42:24', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('e9639df3a4064d14a1315a3d288b5a51', 'root', '新增菜单', '正常', '2019-10-17 13:25:44', '新增菜单:操作记录');
INSERT INTO `sys_log` VALUES ('ea4dd7839b48455abde94bbc7189ae85', 'root', '添加依赖关系', '正常', '2019-10-22 14:55:18', '成功');
INSERT INTO `sys_log` VALUES ('eb2c4067cf8846eabcfff074b48d1985', 'root', '添加依赖关系', '正常', '2019-10-22 14:52:37', '成功');
INSERT INTO `sys_log` VALUES ('eb89aa06bb28420eaaaae947966b3876', 'root', '用户登录', '正常', '2019-08-20 09:40:30', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('eba6966d10ed474fb73fec128e953d4a', 'root', '用户登录', '正常', '2019-08-20 19:59:47', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('ed01610a2e8748f78b8fd41320828248', 'root', '新增菜单', '正常', '2019-10-17 11:52:36', '新增菜单:设备管理');
INSERT INTO `sys_log` VALUES ('eed50191b71c4047a700c00917c42026', 'root', '添加分类', '正常', '2019-10-17 14:11:09', '成功');
INSERT INTO `sys_log` VALUES ('f2feba7c14eb4bd296094619dc93e41f', 'root', '添加依赖关系', '正常', '2019-10-22 14:55:51', '成功');
INSERT INTO `sys_log` VALUES ('f3496253ac0643e9b9dd140b6214c4a1', 'ffffff66666', '删除产品', '正常', '2019-08-08 11:14:00', '成功');
INSERT INTO `sys_log` VALUES ('f458599030504c8794fe22e93516c18f', 'root', '新增菜单', '正常', '2019-10-17 13:19:18', '新增菜单:日志记录配置');
INSERT INTO `sys_log` VALUES ('f60068f03e7f4f01826d966ae77dd9fc', 'root', '删除字段', '正常', '2019-10-21 10:36:52', '成功');
INSERT INTO `sys_log` VALUES ('f6497d6e542e45b88c86df20ada83c4d', 'root', '添加产品类型', '失败', '2019-10-17 15:14:38', '添加产品类型失败:\r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'simulator_plat.t_type\' doesn\'t exist\r\n### The error may involve com.cinema.biz.dao.TypeMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_type  ( type_id,name,create_time,creator ) VALUES( ?,?,?,? )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'simulator_plat.t_type\' doesn\'t exist');
INSERT INTO `sys_log` VALUES ('f6f62d14abda4ebba1bda4eb67530fb1', 'root', '添加维护保养', '正常', '2019-10-21 16:14:41', '成功');
INSERT INTO `sys_log` VALUES ('f725bda51b5c4e6f9fa9b110fe226185', 'root', '用户登录', '正常', '2019-10-22 13:43:49', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('f8014d4e06c1488188f1bcd451fddc34', 'root', '用户登录', '正常', '2019-10-17 10:51:40', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('f851bd07334241169e1a63329aead4ab', 'root', '添加值班登记', '正常', '2019-10-22 16:12:23', '成功');
INSERT INTO `sys_log` VALUES ('f8f18930686d4b439acd9fb09ff4c1f8', 'root', '添加依赖关系', '正常', '2019-10-22 14:55:28', '成功');
INSERT INTO `sys_log` VALUES ('f94478c1f5c04512ac8db57d84beb986', 'ffffff66666', '删除产品', '正常', '2019-08-08 11:07:30', '成功');
INSERT INTO `sys_log` VALUES ('f979a73470574ed486bb7f9813e39786', 'root', '新增菜单', '正常', '2019-10-17 13:25:19', '新增菜单:设备故障库设置');
INSERT INTO `sys_log` VALUES ('fac335124378487dbafa7f4a7a1287c1', 'root', '修改依赖关系设置', '正常', '2019-10-25 09:23:38', '成功');
INSERT INTO `sys_log` VALUES ('facbc18195c04abf88c75c7a637564ef', 'root', '添加产品类型', '正常', '2019-10-17 15:17:55', '成功');
INSERT INTO `sys_log` VALUES ('fafc768f28134e9da4c21b7fa527b178', 'root', '删除公司', '正常', '2019-08-20 09:43:34', '成功');
INSERT INTO `sys_log` VALUES ('fb136bfce49d4b4faaa2053c99a1f226', 'root', '用户登录', '正常', '2019-10-19 16:09:08', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('fb3a223325924f1bb69d5ecdff74e60a', 'root', '用户登录', '正常', '2019-10-24 16:03:10', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('fb4742ac45904ec9a386b9c0e3982011', 'root', '用户登录', '正常', '2019-10-24 14:41:33', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('fbcb11ee3a224ae7a689a16c693fc93e', 'root', '用户登录', '正常', '2019-08-05 11:16:17', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('fc47ee66e92a4bf58bdab5f0f8a9801d', 'root', '添加模拟器', '正常', '2019-10-21 14:19:10', '成功');
INSERT INTO `sys_log` VALUES ('fc878d491c3b4001b90378531f0f98f2', 'root', '用户登录', '正常', '2019-10-25 13:34:51', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('fd6c770f1a3f4d0fa7bc10b971d47852', 'root', '用户登录', '正常', '2019-10-22 08:25:22', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('fdf13cc1958f43199662b1ee3ce4df76', 'root', '用户登录', '正常', '2019-10-17 11:47:35', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('fe6b8aa3c71f44e58a29f78413a97abf', 'root', '用户登录', '正常', '2019-10-22 13:41:53', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('fe88c8b076af4445b80144d429cf1c7f', 'root', '删除搜索项', '正常', '2019-08-05 16:54:12', '成功');
INSERT INTO `sys_log` VALUES ('febac6f3d5c447fda1d748d889727c43', 'root', '用户登录', '正常', '2019-10-21 16:21:20', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('fedea02091f840e2912034350a44794d', 'root', '用户登录', '正常', '2019-10-22 14:28:48', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('ffb956a942654af5945f72f48f72e7ac', 'root', '修改菜单', '正常', '2019-10-21 18:04:03', '修改菜单:计算机开关机控制');
INSERT INTO `sys_log` VALUES ('ffe00cbdb6bc45608a0ecd1b192ffd62', 'root', '用户登录', '正常', '2019-10-17 14:26:00', '用户：登录成功！');
INSERT INTO `sys_log` VALUES ('ffe85c538983427385d5875c5c6767b5', 'root', '用户登录', '正常', '2019-10-25 11:22:30', '用户：登录成功！');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menuid` varchar(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(36) DEFAULT NULL,
  `pid` varchar(36) DEFAULT NULL,
  `cseq` decimal(3,0) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `enabled` decimal(2,0) DEFAULT NULL,
  `isopen` decimal(1,0) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  `updator` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0f791ab15d7a407db9487d916b5810fb', '命令状态', 'cmdState', '3f8827ed228447c9bb88aae468e1ec24', '4', 'cmdState', '1', null, '2018-10-24 00:00:00', 'root', '2019-03-07 13:42:26', null);
INSERT INTO `sys_menu` VALUES ('1', '系统功能管理', 'system', '0', '5', 'system', '1', '0', '2019-03-19 13:42:05', 'admin', '2018-05-23 00:00:00', 'root');
INSERT INTO `sys_menu` VALUES ('10', '日志管理', 'log', '1', '5', 'log', '1', '0', '2017-07-01 00:00:00', 'admin', '2019-03-07 13:42:26', null);
INSERT INTO `sys_menu` VALUES ('19d24a4dcb824855ba8908071ada6ce5', '人工核验', 'rengongheyan', '1b233b9b06e844f9a517732abb621e83', '0', 'rengongheyan', '1', '0', '2018-02-27 00:00:00', 'zhangt', '2019-03-07 13:42:26', null);
INSERT INTO `sys_menu` VALUES ('2ab0a309f54840898e62483e242ae834', '依赖关系设置', 'simdevicedependency', '5cf93e4b98934ae0aa052cbdf66405f8', '2', 'simdevicedependency', '1', null, '2019-10-17 13:24:04', 'root', '2019-10-17 13:24:04', 'root');
INSERT INTO `sys_menu` VALUES ('2ad42dfe5a8b4565b815adefb2d36a21', '发行版本', 'filmversion', 'c6710a80aab542ea99910636f1bc1789', null, 'filmversion', '0', '0', '2018-02-26 00:00:00', 'admin', '2018-04-09 00:00:00', 'root');
INSERT INTO `sys_menu` VALUES ('2b8135d1c0184c4fa853a58b77092557', '监控阈值设置', 'simthreshold', '5cf93e4b98934ae0aa052cbdf66405f8', '1', 'simthreshold', '1', null, '2019-10-17 13:23:31', 'root', '2019-10-17 13:23:31', 'root');
INSERT INTO `sys_menu` VALUES ('2c36823d86aa43c08074506b8b0b1979', '维护保养记录', 'simmaintenance', '81b4ff02d9be458ca10bbec97e75394b', '2', 'simmaintenance', '1', null, '2019-10-17 13:26:16', 'root', '2019-10-17 13:26:16', 'root');
INSERT INTO `sys_menu` VALUES ('3a7bd514ff654117a65575ed3b024600', '前台菜单管理', 'frontmenu', '1', '2', 'frontmenu', '1', null, '2019-02-22 00:00:00', 'root', '2019-03-07 13:42:26', null);
INSERT INTO `sys_menu` VALUES ('4', '用户管理', 'userManager', '1', '3', 'user', '1', '0', '2017-07-01 00:00:00', 'admin', '2017-08-28 00:00:00', 'root');
INSERT INTO `sys_menu` VALUES ('457a34e8e29148dab43e761afc6caaa4', '基本信息配置管理', 'baseinfo', '0', '0', 'baseinfo', '1', null, '2019-10-17 11:48:23', 'root', '2019-10-17 11:48:23', 'root');
INSERT INTO `sys_menu` VALUES ('47ba7bd3a4fb42399eede6f8681a820a', '报警日志', 'alarmlog', '8f6fc238e1db432bbb3969b8b1003a71', '1', 'alarmlog', '1', '0', '2018-03-30 00:00:00', 'root', '2018-05-23 00:00:00', 'root');
INSERT INTO `sys_menu` VALUES ('4e5d720c590443838e7f121f91a59661', '计算机开关机控制', 'simpccontrol', '8ad44aa9bc4b42f69c870e24158117ab', '3', 'simpccontrol', '1', null, '2019-10-17 13:20:15', 'root', '2019-10-17 13:20:15', 'root');
INSERT INTO `sys_menu` VALUES ('5', '后台菜单管理', 'menu', '1', '1', 'menu', '1', '0', '2019-04-28 08:30:05', 'admin', '2018-05-24 00:00:00', 'hanxu');
INSERT INTO `sys_menu` VALUES ('5cf93e4b98934ae0aa052cbdf66405f8', '故障管理与健康管理', 'faltmodule', '0', '2', 'faltmodule', '1', null, '2019-10-17 13:20:45', 'root', '2019-10-17 13:20:45', 'root');
INSERT INTO `sys_menu` VALUES ('6', '角色管理', 'role', '1', '4', 'role', '1', '0', '2017-07-01 00:00:00', 'admin', '2019-03-07 13:42:26', null);
INSERT INTO `sys_menu` VALUES ('630ff4854930465fbf2bc85a2a29d760', '日志记录配置', 'simlogconfig', '8ad44aa9bc4b42f69c870e24158117ab', '2', 'simlogconfig', '1', null, '2019-10-17 13:19:18', 'root', '2019-10-17 13:19:18', 'root');
INSERT INTO `sys_menu` VALUES ('64', '核验监控', 'hyMonitor', '3f8827ed228447c9bb88aae468e1ec24', '1', 'hyMonitor', '1', '0', '2019-03-07 13:42:26', null, '2019-03-07 13:42:26', null);
INSERT INTO `sys_menu` VALUES ('6472187452c94badbe221cd8371e3bc0', '操作记录', 'simoperate', '81b4ff02d9be458ca10bbec97e75394b', '1', 'simoperate', '1', null, '2019-10-17 13:25:44', 'root', '2019-10-17 13:25:44', 'root');
INSERT INTO `sys_menu` VALUES ('64e8cd4a84e2409a9f9758c69740d777', '产品类型', 'simtype', '457a34e8e29148dab43e761afc6caaa4', '2', 'simtype', '1', null, '2019-10-17 11:50:49', 'root', '2019-10-17 11:50:49', 'root');
INSERT INTO `sys_menu` VALUES ('65', '报警监控', 'realtimealarm', '3f8827ed228447c9bb88aae468e1ec24', '2', 'realtimealarm', '1', '0', '2018-03-12 00:00:00', 'admin', '2018-03-22 00:00:00', 'root');
INSERT INTO `sys_menu` VALUES ('66532828ac0f48838e83f30edf5b2aaf', '值班管理', 'dutymodule', '0', '4', 'dutymodule', '1', null, '2019-10-17 13:21:58', 'root', '2019-10-17 13:21:58', 'root');
INSERT INTO `sys_menu` VALUES ('6a426315ad7c408d9796c264a5830d7d', '设备属性管理', 'simfield', '457a34e8e29148dab43e761afc6caaa4', '4', 'simfield', '1', null, '2019-10-17 11:52:13', 'root', '2019-10-17 11:52:13', 'root');
INSERT INTO `sys_menu` VALUES ('7ccb821d6bc8432e8f34d31a944150e1', '设备控制', 'deviceControl', '3f8827ed228447c9bb88aae468e1ec24', '3', 'deviceControl', '1', null, '2018-10-08 00:00:00', 'root', '2019-03-07 13:42:26', null);
INSERT INTO `sys_menu` VALUES ('7ec40b7fe5a340e78efbafbd7973f478', '模拟器系统', 'simsimulator', '457a34e8e29148dab43e761afc6caaa4', '1', 'simsimulator', '1', null, '2019-10-17 11:50:20', 'root', '2019-10-17 11:50:20', 'root');
INSERT INTO `sys_menu` VALUES ('8147fc54caf74a8ebbcb361f7b69dda7', '设备故障库设置', 'simfaultlib', '5cf93e4b98934ae0aa052cbdf66405f8', '4', 'simfaultlib', '1', null, '2019-10-17 13:25:19', 'root', '2019-10-17 13:25:19', 'root');
INSERT INTO `sys_menu` VALUES ('81b4ff02d9be458ca10bbec97e75394b', '日志记录', 'logmodule', '0', '3', '日志记录', '1', null, '2019-10-17 13:21:36', 'root', '2019-10-17 13:21:36', 'root');
INSERT INTO `sys_menu` VALUES ('8ad44aa9bc4b42f69c870e24158117ab', '设备管理及数据采集', 'deviceadminmodule', '0', '1', 'deviceadminmodule', '1', null, '2019-10-17 11:49:48', 'root', '2019-10-17 11:49:48', 'root');
INSERT INTO `sys_menu` VALUES ('8d5e3f610736496a9b6a85eeb065b5f0', '数据库配置', 'dbconfig', '1', '7', 'dbconfig', '0', null, '2018-09-26 00:00:00', 'root', '2019-03-07 13:42:26', null);
INSERT INTO `sys_menu` VALUES ('9501e30a3d3d4a2c95fd93f8898cb2d9', '片种', 'filmkinds', 'c6710a80aab542ea99910636f1bc1789', null, 'filmkinds', '0', '0', '2018-02-26 00:00:00', 'admin', '2018-04-09 00:00:00', 'root');
INSERT INTO `sys_menu` VALUES ('96fbcaed389f44ef89f196acca0a8abf', '影厅管理', 'hall', '028103282aa948b5bd3e4d8b83e7f27f', '2', 'hall', '1', '0', '2018-05-23 00:00:00', 'root', '2018-06-11 00:00:00', 'root');
INSERT INTO `sys_menu` VALUES ('9f13dcea489d44aba25999a01f7d9b3c', '运维报警管理', 'operate', '8f6fc238e1db432bbb3969b8b1003a71', '0', 'operate', '1', '0', '2018-02-27 00:00:00', 'zhangt', '2018-03-02 00:00:00', 'zhangt');
INSERT INTO `sys_menu` VALUES ('a10926d5bf704df19c7af2eafe7938cf', '设备管理', 'simdevice', '8ad44aa9bc4b42f69c870e24158117ab', '1', 'simdevice', '1', null, '2019-10-17 11:52:36', 'root', '2019-10-17 11:52:36', 'root');
INSERT INTO `sys_menu` VALUES ('a169e5d5103d4bda81d7ae39e3e63b40', '字典管理', 'dictionary', '1', '6', 'dictionary', '1', null, '2019-01-31 00:00:00', 'root', '2019-03-07 13:42:26', null);
INSERT INTO `sys_menu` VALUES ('a3595d43d1f445ccba7178511edc46a0', '设备监控', 'deviceManage', '3f8827ed228447c9bb88aae468e1ec24', '0', 'device', '1', '0', '2018-02-26 00:00:00', 'zhangt', '2018-05-14 00:00:00', 'haofugui');
INSERT INTO `sys_menu` VALUES ('b9772e3ca71f48de9b48a21c96738db6', '影片类别', 'filmtype', 'c6710a80aab542ea99910636f1bc1789', null, 'filmtype', '0', '0', '2018-02-26 00:00:00', 'admin', '2018-04-09 00:00:00', 'root');
INSERT INTO `sys_menu` VALUES ('bbfca3575fa94c9b8b8d240291d935d1', '依赖关系管理', 'simdependency', '5cf93e4b98934ae0aa052cbdf66405f8', '3', 'simdependency', '1', null, '2019-10-17 13:24:47', 'root', '2019-10-17 13:24:47', 'root');
INSERT INTO `sys_menu` VALUES ('c6710a80aab542ea99910636f1bc1789', '影片信息管理', 'filminfo', '9a3c3cfcc9fe4c8da1d0f94a174769f2', null, 'filminfo', '1', '0', '2018-02-26 00:00:00', 'admin', '2018-02-28 00:00:00', 'admin');
INSERT INTO `sys_menu` VALUES ('c6de3ed71f654574b8ccc209ead9120d', '值班任务安排', 'simdutytask', '66532828ac0f48838e83f30edf5b2aaf', '1', 'simdutytask', '1', null, '2019-10-17 13:28:11', 'root', '2019-10-17 13:28:11', 'root');
INSERT INTO `sys_menu` VALUES ('c747db278ca14228ba8094389d7da72a', '故障记录', 'simfault', '81b4ff02d9be458ca10bbec97e75394b', '3', 'simfault', '1', null, '2019-10-17 13:27:01', 'root', '2019-10-17 13:27:01', 'root');
INSERT INTO `sys_menu` VALUES ('d7b0c47452754c489d1c669f24197720', '系统维护', 'weihu', '0', '6', 'weihu', '1', '0', '2018-02-27 00:00:00', 'zhangt', '2019-03-07 13:42:26', null);
INSERT INTO `sys_menu` VALUES ('d866503942a547899ef1da0cbca1f43b', '地区管理', 'filmAddress', '028103282aa948b5bd3e4d8b83e7f27f', '5', 'filmAddress', '0', '0', '2018-03-12 00:00:00', 'hanxu', '2018-05-21 00:00:00', 'hanxu');
INSERT INTO `sys_menu` VALUES ('d866503942a5478asgc1da0cbca1f43b', '属性管理', 'properties', '028103282aa948b5bd3e4d8b83e7f27f', '4', 'properties', '1', '0', '2018-06-01 00:00:00', 'root', '2019-03-07 13:42:26', null);
INSERT INTO `sys_menu` VALUES ('da814c64cd134839a2bcbee5e3d22644', '添加日志记录', 'simaddlog', '81b4ff02d9be458ca10bbec97e75394b', '0', 'simaddlog', '1', null, '2019-10-21 16:23:12', 'root', '2019-10-21 16:23:12', 'root');
INSERT INTO `sys_menu` VALUES ('e37e60871848411983f075caddab9ad9', '值班登记', 'simdutyreg', '66532828ac0f48838e83f30edf5b2aaf', '2', 'simdutyreg', '1', null, '2019-10-17 13:28:47', 'root', '2019-10-17 13:28:47', 'root');
INSERT INTO `sys_menu` VALUES ('e5f5486e359249dbb16b05f64aa1e4fc', '设备属性配置', 'simtypefield', '457a34e8e29148dab43e761afc6caaa4', '3', 'simtypefield', '1', null, '2019-10-17 11:51:47', 'root', '2019-10-17 11:51:47', 'root');
INSERT INTO `sys_menu` VALUES ('ec7e3d6d1e134e4b82f2f15e23cb184f', '数据导入', 'dataimport', 'd7b0c47452754c489d1c669f24197720', '0', 'dataimport', '1', '0', '2018-02-28 00:00:00', 'zhangt', '2018-05-28 00:00:00', 'root');
INSERT INTO `sys_menu` VALUES ('f676ce7a5f654554bafab72f9e0bb926', '维修记录', 'simrepair', '81b4ff02d9be458ca10bbec97e75394b', '4', 'simrepair', '1', null, '2019-10-17 13:27:33', 'root', '2019-10-17 13:27:33', 'root');
INSERT INTO `sys_menu` VALUES ('fdc93887283a4703a2d4b46c84ecc5bc', '院线管理', 'company', '028103282aa948b5bd3e4d8b83e7f27f', '0', 'company', '1', '0', '2018-02-05 00:00:00', 'zhangt', '2018-02-27 00:00:00', 'zhangt');
INSERT INTO `sys_menu` VALUES ('ffa2a525334f43bf975f8395e43923ff', '权限管理2', 'auth2', '1', '8', 'auth2', '1', null, '2019-03-21 08:24:32', 'root', '2019-03-13 08:24:24', null);

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` varchar(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `state` decimal(1,0) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('0', '普通会员', '普通会员', '1', '2019-05-24 15:42:08', 'admin');
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '所有影院管理权限', '1', '2019-01-28 00:00:00', 'admin');
INSERT INTO `sys_role` VALUES ('40f8e240116340dd916fddff371235d8', '影院管理员', '11', '1', '2018-08-20 00:00:00', 'admin');
INSERT INTO `sys_role` VALUES ('8e22728d8a1a4f6da485e168ddc7fe12', '电影协会12', '112', '1', '2019-04-26 14:41:47', 'admin');
INSERT INTO `sys_role` VALUES ('c8cbf59a390846458e7ae986fa53a569', '11', '11', '1', '2019-04-26 20:28:42', 'root');
INSERT INTO `sys_role` VALUES ('f09b9581206b4d34a4ab56e359966d13', '系统管理员', '所有菜单角色', '1', '2019-04-25 10:37:53', 'admin');
INSERT INTO `sys_role` VALUES ('ff076768fcf24375b9e43c66e3fe21d4', '领导权限', '领导权限', '1', '2019-03-19 15:18:26', 'admin');

-- ----------------------------
-- Table structure for `sys_role_auth`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_auth`;
CREATE TABLE `sys_role_auth` (
  `role_auth_id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `auth_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`role_auth_id`),
  KEY `FK_Relationship_44` (`role_id`),
  KEY `FK_Relationship_45` (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_auth
-- ----------------------------
INSERT INTO `sys_role_auth` VALUES ('0187cc50218c429a9a922bccd3e8ba12', '0', 'f03328b13ee64cb3986557984f9ee711');
INSERT INTO `sys_role_auth` VALUES ('021dcc4ee87f45cd8d5a277c9bb2699f', '0', 'c667ac35e6f34f40ad18edcba0205676');
INSERT INTO `sys_role_auth` VALUES ('024eee599d3648ccabaf7b5e19e51b93', 'c8cbf59a390846458e7ae986fa53a569', 'e6dee33eedcb4f3ea44b32401673e97e');
INSERT INTO `sys_role_auth` VALUES ('044a541aadb74f139a0914127c7a713f', 'f09b9581206b4d34a4ab56e359966d13', '13');
INSERT INTO `sys_role_auth` VALUES ('04bca62a65064cf88af4a9bba227120e', '0', 'f03328b13ee64cb3986557984f9ee711');
INSERT INTO `sys_role_auth` VALUES ('09dfa72d45224c40aa8bf91a44361699', 'f09b9581206b4d34a4ab56e359966d13', '0dbbd39665034c4683fe7b2c7e76a4a1');
INSERT INTO `sys_role_auth` VALUES ('09e1e56b212548049741ce8adba2a23c', '0', 'ab01e40c04f14113b972e2ce6a764248');
INSERT INTO `sys_role_auth` VALUES ('0ad445d9c9644610bbdab69ba6e8e6e0', 'c8cbf59a390846458e7ae986fa53a569', '4c8c76dbec554c1892bce77ddf60d123');
INSERT INTO `sys_role_auth` VALUES ('0b44b40aa1fe4cfbae1b840ad210ea23', 'f09b9581206b4d34a4ab56e359966d13', '15');
INSERT INTO `sys_role_auth` VALUES ('0b44dd24b2c248d59463ef5ad227a89c', 'f09b9581206b4d34a4ab56e359966d13', '37');
INSERT INTO `sys_role_auth` VALUES ('0c87af91eca84dca8dd8b1944c22aa62', '0', '475d71c52e01452ab9b34ca3230526fa');
INSERT INTO `sys_role_auth` VALUES ('0dd6e763dd354e0ab4a952cc7b852e27', 'f09b9581206b4d34a4ab56e359966d13', '83d58eeab622489a929775b28eaf2fd2');
INSERT INTO `sys_role_auth` VALUES ('0f957bdbcd5b4b7da982042778911f5d', 'f09b9581206b4d34a4ab56e359966d13', '14');
INSERT INTO `sys_role_auth` VALUES ('0fbdc27926df4297a81e0837aa6e82cd', '40f8e240116340dd916fddff371235d8', '15');
INSERT INTO `sys_role_auth` VALUES ('174231723de640c3ba7ac7a120b2653f', 'f09b9581206b4d34a4ab56e359966d13', '41');
INSERT INTO `sys_role_auth` VALUES ('19153938ce2245c0b233ac32c78efa4b', '0', 'b2be84eacb154d068721cf27b80398ea');
INSERT INTO `sys_role_auth` VALUES ('1a262f84ee96427c8ee2c774652a9c34', 'f09b9581206b4d34a4ab56e359966d13', '31');
INSERT INTO `sys_role_auth` VALUES ('1a2f63d53c4f4334a88fd266484cb6c6', '0', 'ab01e40c04f14113b972e2ce6a764248');
INSERT INTO `sys_role_auth` VALUES ('1aa28da2d8c54f828537c40bb3c5e39f', 'f09b9581206b4d34a4ab56e359966d13', '10');
INSERT INTO `sys_role_auth` VALUES ('1aba39f2339e4b65a7fe97d85f9e94b1', '0', 'f03328b13ee64cb3986557984f9ee711');
INSERT INTO `sys_role_auth` VALUES ('1ad904d89cbb4411996ed6729bcc6e2b', 'f09b9581206b4d34a4ab56e359966d13', '7');
INSERT INTO `sys_role_auth` VALUES ('1bc4a1ddfbae4f7589baa143382f3fe8', 'c8cbf59a390846458e7ae986fa53a569', '4c8c76dbec554c1892bce77ddf60d123');
INSERT INTO `sys_role_auth` VALUES ('1cce5df0da3a41789214121f5dab974d', 'f09b9581206b4d34a4ab56e359966d13', '54');
INSERT INTO `sys_role_auth` VALUES ('1d9df495827f4730b05f55e821d59183', 'f09b9581206b4d34a4ab56e359966d13', '51');
INSERT INTO `sys_role_auth` VALUES ('1e5752f2ed094de5bd66d5512411d53e', '0', 'b2be84eacb154d068721cf27b80398ea');
INSERT INTO `sys_role_auth` VALUES ('1e7cc21bb88946afbfb1fd2fa5423bb9', 'c8cbf59a390846458e7ae986fa53a569', 'e6dee33eedcb4f3ea44b32401673e97e');
INSERT INTO `sys_role_auth` VALUES ('20281f2c16294ddb90f6c57c0e3ca7bf', '40f8e240116340dd916fddff371235d8', '17');
INSERT INTO `sys_role_auth` VALUES ('22de0d85e28a4046b2c2bcd4bb72f2c7', 'f09b9581206b4d34a4ab56e359966d13', '36');
INSERT INTO `sys_role_auth` VALUES ('2441e4c048dc4246b30a7b0faf7d3e1d', '40f8e240116340dd916fddff371235d8', '28');
INSERT INTO `sys_role_auth` VALUES ('2537715aadd144098389b5fa0462e30b', '54e1e57717154fbf8c1e902ecd977f72', '8');
INSERT INTO `sys_role_auth` VALUES ('25bcc43b45be450abb671695ca9f5f31', '54e1e57717154fbf8c1e902ecd977f72', '2');
INSERT INTO `sys_role_auth` VALUES ('2669f7e0cd3b4b7684b037cd73ca081f', '40f8e240116340dd916fddff371235d8', '16');
INSERT INTO `sys_role_auth` VALUES ('276eb23ae6e24c03b41301a064507e46', '0', '30ac78f31e91472eab4f5ef8e8b372e6');
INSERT INTO `sys_role_auth` VALUES ('281c330d0aa44aa8a2a53920fea42e57', 'c8cbf59a390846458e7ae986fa53a569', 'ce9fbd5988e949878ee2a4591c2c272c');
INSERT INTO `sys_role_auth` VALUES ('283f1172d79e43a6a36ace40eb9f5ec7', 'f09b9581206b4d34a4ab56e359966d13', '4c8c76dbec554c1892bce77ddf60d123');
INSERT INTO `sys_role_auth` VALUES ('2841050b66764cc58a1bcc74aa110727', 'f09b9581206b4d34a4ab56e359966d13', '3');
INSERT INTO `sys_role_auth` VALUES ('2882f78dec794cf1a5074d457c84b96b', '0', '86997871250b43f8861f8b6e63e5c74d');
INSERT INTO `sys_role_auth` VALUES ('28987ddf7ff64f56bc403f6e965f1859', '54e1e57717154fbf8c1e902ecd977f72', '3');
INSERT INTO `sys_role_auth` VALUES ('303ebbd83a8c474c9cbdfa923bcd5881', '0', '30ac78f31e91472eab4f5ef8e8b372e6');
INSERT INTO `sys_role_auth` VALUES ('31c1e4fd96cb428a9344c7bb778b5483', '0', '7e64df9cf73b4f9bb13950510a68c29f');
INSERT INTO `sys_role_auth` VALUES ('337cf1f0a95446389f47fa47c8369b2e', 'f09b9581206b4d34a4ab56e359966d13', 'e6dee33eedcb4f3ea44b32401673e97e');
INSERT INTO `sys_role_auth` VALUES ('34ae3d4f64bf4f0b9529913e8a2ce62c', 'c8cbf59a390846458e7ae986fa53a569', '007551ad40954d4d86778fa28f9b6de8');
INSERT INTO `sys_role_auth` VALUES ('37577d93b0fe4a8e92d0d4e740c48adc', 'f09b9581206b4d34a4ab56e359966d13', '28');
INSERT INTO `sys_role_auth` VALUES ('379678df41f44582884027a71791311c', 'f09b9581206b4d34a4ab56e359966d13', '58');
INSERT INTO `sys_role_auth` VALUES ('37982ad33bf34999b53fb719a812026a', '0', '30ac78f31e91472eab4f5ef8e8b372e6');
INSERT INTO `sys_role_auth` VALUES ('39014e59b5194ea397f7a778561656a7', '0', '1549ff00c84a4c23b52a3ceeed7dad79');
INSERT INTO `sys_role_auth` VALUES ('39f8f8719de34f2d9ebfeb2b69a0dd2d', '0', 'f03328b13ee64cb3986557984f9ee711');
INSERT INTO `sys_role_auth` VALUES ('3a25a41be1eb44dd8e097d9574ea4f59', '40f8e240116340dd916fddff371235d8', '10');
INSERT INTO `sys_role_auth` VALUES ('3b9c19d4389d42d48119abd368096dc4', 'f09b9581206b4d34a4ab56e359966d13', '8');
INSERT INTO `sys_role_auth` VALUES ('3b9ef3a9152b4b1ab81b447f23ad04c1', 'f09b9581206b4d34a4ab56e359966d13', '40');
INSERT INTO `sys_role_auth` VALUES ('3c03075b2ec84d5082d8bcc5eec8e84d', '40f8e240116340dd916fddff371235d8', '10');
INSERT INTO `sys_role_auth` VALUES ('3d9a55d63ab44d3c8e3c0f786ae5caea', '40f8e240116340dd916fddff371235d8', '9');
INSERT INTO `sys_role_auth` VALUES ('3f5f210afdfd4e27b2eaf16b9855833d', '0', '475d71c52e01452ab9b34ca3230526fa');
INSERT INTO `sys_role_auth` VALUES ('447c76ac304f44a398e2af1e10de83b9', 'f09b9581206b4d34a4ab56e359966d13', '5');
INSERT INTO `sys_role_auth` VALUES ('4607a0c4031a4c37889813c8145eb86d', '0', '475d71c52e01452ab9b34ca3230526fa');
INSERT INTO `sys_role_auth` VALUES ('47ae20aafb5447d0ae6a4442a9e24d74', 'c8cbf59a390846458e7ae986fa53a569', '06efc88221ea43679a84e40761685069');
INSERT INTO `sys_role_auth` VALUES ('4b49233d6e2a4dcbbe13ad5569d0a18d', 'f09b9581206b4d34a4ab56e359966d13', '38f355b94a6e4f49835dc36058564089');
INSERT INTO `sys_role_auth` VALUES ('4c292fe310c34ce2b8832ccf0f760fde', '0', '30ac78f31e91472eab4f5ef8e8b372e6');
INSERT INTO `sys_role_auth` VALUES ('4dcc6aa14ce244a08da57c7706d8c98c', 'c8cbf59a390846458e7ae986fa53a569', '007551ad40954d4d86778fa28f9b6de8');
INSERT INTO `sys_role_auth` VALUES ('4f6fb1a3b7ad4e3e83ee0db686f4d277', '0', '475d71c52e01452ab9b34ca3230526fa');
INSERT INTO `sys_role_auth` VALUES ('4f8c5aa6aa72471e9538b8eaecb98167', 'f09b9581206b4d34a4ab56e359966d13', '4');
INSERT INTO `sys_role_auth` VALUES ('50e4048991514b75bbe2d7e62b2f5b66', 'f09b9581206b4d34a4ab56e359966d13', '30');
INSERT INTO `sys_role_auth` VALUES ('5344f01db0c14aa1a13fadafc656b66c', 'f09b9581206b4d34a4ab56e359966d13', '9');
INSERT INTO `sys_role_auth` VALUES ('534e13ca96a7458c8d2b27abb7175b77', 'f09b9581206b4d34a4ab56e359966d13', '49');
INSERT INTO `sys_role_auth` VALUES ('54172526109e47279fc0cfa165455e54', 'f09b9581206b4d34a4ab56e359966d13', '43');
INSERT INTO `sys_role_auth` VALUES ('57701f4aebce433ca6fd3431a19072eb', 'c8cbf59a390846458e7ae986fa53a569', '6ce5d16ab0cc4bbdb39dff35adf48a04');
INSERT INTO `sys_role_auth` VALUES ('587e5ddf43e148ec8312ad21f5546e61', '0', 'ab01e40c04f14113b972e2ce6a764248');
INSERT INTO `sys_role_auth` VALUES ('5b05de8ca2ea4723bf858fafe763d3bf', '0', '475d71c52e01452ab9b34ca3230526fa');
INSERT INTO `sys_role_auth` VALUES ('5c9bacb9198e4085a14d2a9fb242664b', 'f09b9581206b4d34a4ab56e359966d13', 'e468023e61524cb28f1454e665c7f458');
INSERT INTO `sys_role_auth` VALUES ('5d20221becff49e4936cf5b68fcd3a02', 'f09b9581206b4d34a4ab56e359966d13', '24');
INSERT INTO `sys_role_auth` VALUES ('6169d7996e7b4f99a899ed956a3df4bc', '0', 'f03328b13ee64cb3986557984f9ee711');
INSERT INTO `sys_role_auth` VALUES ('624db704830f4e71a2673b587a1193e7', '0', 'ab01e40c04f14113b972e2ce6a764248');
INSERT INTO `sys_role_auth` VALUES ('654c1669517742ce9fa50aca62f997b9', '0', '1549ff00c84a4c23b52a3ceeed7dad79');
INSERT INTO `sys_role_auth` VALUES ('65f15e8d6c6d4f75bbc91126f9d182f1', '54e1e57717154fbf8c1e902ecd977f72', '13');
INSERT INTO `sys_role_auth` VALUES ('66bfebf973f34c6585edb20d272480f1', '0', 'b2be84eacb154d068721cf27b80398ea');
INSERT INTO `sys_role_auth` VALUES ('66cae2bf32f749999a7ddeaf784001a8', '40f8e240116340dd916fddff371235d8', '11');
INSERT INTO `sys_role_auth` VALUES ('69b6fb4654ff4818a9352be3eca8fe24', 'f09b9581206b4d34a4ab56e359966d13', '7359caa194b2452094182d10e553ef6f');
INSERT INTO `sys_role_auth` VALUES ('6c1553c378c7447294a58b56c32c0d54', '54e1e57717154fbf8c1e902ecd977f72', '15');
INSERT INTO `sys_role_auth` VALUES ('6c481fd2ff014c239d98522d2d3f352c', '0', '475d71c52e01452ab9b34ca3230526fa');
INSERT INTO `sys_role_auth` VALUES ('6c8a2386ca0f438ab36bae3a295fd1be', '0', '86997871250b43f8861f8b6e63e5c74d');
INSERT INTO `sys_role_auth` VALUES ('6e3b93cb63d842f0a383c3fc68640d35', 'f09b9581206b4d34a4ab56e359966d13', '56');
INSERT INTO `sys_role_auth` VALUES ('72a1e39bd4ac49c7a1f01ecb373ea3c4', '40f8e240116340dd916fddff371235d8', '28');
INSERT INTO `sys_role_auth` VALUES ('7362194cf41b42d5859b7927317d8001', 'f09b9581206b4d34a4ab56e359966d13', '33');
INSERT INTO `sys_role_auth` VALUES ('7532f89f0a9c43df9a54ec462921eafa', 'c8cbf59a390846458e7ae986fa53a569', '007551ad40954d4d86778fa28f9b6de8');
INSERT INTO `sys_role_auth` VALUES ('770a91aa103c4017aa36f4d1ca58d7da', 'f09b9581206b4d34a4ab56e359966d13', '23');
INSERT INTO `sys_role_auth` VALUES ('7a0e9f307a65400a9d164e9b77932333', '0', '86997871250b43f8861f8b6e63e5c74d');
INSERT INTO `sys_role_auth` VALUES ('7b2b00a58b83479ba140790c1cd1bdbc', '0', '1549ff00c84a4c23b52a3ceeed7dad79');
INSERT INTO `sys_role_auth` VALUES ('7c3efef200d0442cbed256b26f3bbd8c', 'f09b9581206b4d34a4ab56e359966d13', '6ce5d16ab0cc4bbdb39dff35adf48a04');
INSERT INTO `sys_role_auth` VALUES ('7c52aa7c052a4286b9b5140f8713102e', '0', '86997871250b43f8861f8b6e63e5c74d');
INSERT INTO `sys_role_auth` VALUES ('7ce42f3bc49042fcb6d8b1dc209da8aa', '0', '30ac78f31e91472eab4f5ef8e8b372e6');
INSERT INTO `sys_role_auth` VALUES ('7e777c0b4243462391ceb6d9bc105945', '40f8e240116340dd916fddff371235d8', '8');
INSERT INTO `sys_role_auth` VALUES ('7ff3fdf6e57b40748867f766c4e47483', 'c8cbf59a390846458e7ae986fa53a569', 'e6dee33eedcb4f3ea44b32401673e97e');
INSERT INTO `sys_role_auth` VALUES ('81313edf9a71444192465d39c6e630af', '0', '7e64df9cf73b4f9bb13950510a68c29f');
INSERT INTO `sys_role_auth` VALUES ('81c33ada4eff4d95ba9858549a69139c', '54e1e57717154fbf8c1e902ecd977f72', '30');
INSERT INTO `sys_role_auth` VALUES ('82593416d61f40618b1b83aeeffda76f', 'f09b9581206b4d34a4ab56e359966d13', '5e35208fc73b4ccf8214ff14f70914e6');
INSERT INTO `sys_role_auth` VALUES ('8448ede80ded48f799dcae1e2ef690cf', '0', '475d71c52e01452ab9b34ca3230526fa');
INSERT INTO `sys_role_auth` VALUES ('8487774d017249429b574becbb0de1d5', 'ff076768fcf24375b9e43c66e3fe21d4', '28');
INSERT INTO `sys_role_auth` VALUES ('84c00b8811f8418490f3499b0472dd37', '8e22728d8a1a4f6da485e168ddc7fe12', '1');
INSERT INTO `sys_role_auth` VALUES ('84f780dd3dfc4e7bbf477245809a84f2', '0', '30ac78f31e91472eab4f5ef8e8b372e6');
INSERT INTO `sys_role_auth` VALUES ('8752f38022fb4a8b939211e134c5b022', 'f09b9581206b4d34a4ab56e359966d13', '42');
INSERT INTO `sys_role_auth` VALUES ('88a6286ac89a4ce0a3349fb5471a4b2b', 'f09b9581206b4d34a4ab56e359966d13', '32');
INSERT INTO `sys_role_auth` VALUES ('8b8a590b9f1b41d08208fece0e7982a6', 'f09b9581206b4d34a4ab56e359966d13', '55');
INSERT INTO `sys_role_auth` VALUES ('8be199625fd04a9994c4ee95b5e2152a', 'f09b9581206b4d34a4ab56e359966d13', '39');
INSERT INTO `sys_role_auth` VALUES ('8c50168c76084c999623828425ced160', 'f09b9581206b4d34a4ab56e359966d13', '6');
INSERT INTO `sys_role_auth` VALUES ('93d0b8dbdab048808f70b938df7b34cc', 'f09b9581206b4d34a4ab56e359966d13', '3ab6190d9362420b920f1a77aa176e8e');
INSERT INTO `sys_role_auth` VALUES ('96981dae56cd4724b56c9e5b521dec0f', 'f09b9581206b4d34a4ab56e359966d13', '29');
INSERT INTO `sys_role_auth` VALUES ('97413365c97d4e00ab32cfeaefc136a1', '0', 'ab01e40c04f14113b972e2ce6a764248');
INSERT INTO `sys_role_auth` VALUES ('997125f136b042039d7b4d44ea111bba', '0', 'ab01e40c04f14113b972e2ce6a764248');
INSERT INTO `sys_role_auth` VALUES ('9c12343ea2ec4e32a5f808c961e2907a', '0', '1549ff00c84a4c23b52a3ceeed7dad79');
INSERT INTO `sys_role_auth` VALUES ('9c5a2d143dab49d3875bcb534387ec29', 'c8cbf59a390846458e7ae986fa53a569', 'ce9fbd5988e949878ee2a4591c2c272c');
INSERT INTO `sys_role_auth` VALUES ('9c63aad8376d4c3cb8f8ecb92103188b', '0', '86997871250b43f8861f8b6e63e5c74d');
INSERT INTO `sys_role_auth` VALUES ('9d3d41b57a62409981c7662f04426d20', 'f09b9581206b4d34a4ab56e359966d13', '34');
INSERT INTO `sys_role_auth` VALUES ('9f6b8db49c814f4088d2481098b80c55', 'f09b9581206b4d34a4ab56e359966d13', '46');
INSERT INTO `sys_role_auth` VALUES ('a2c7171c6e094b50a452f579e7e23b64', '0', '86997871250b43f8861f8b6e63e5c74d');
INSERT INTO `sys_role_auth` VALUES ('a3b036661f924707a2a6a6b749e8dfce', '0', '86997871250b43f8861f8b6e63e5c74d');
INSERT INTO `sys_role_auth` VALUES ('a5d10e018d644bc68811a27897bdef7f', '0', '1549ff00c84a4c23b52a3ceeed7dad79');
INSERT INTO `sys_role_auth` VALUES ('a5d4cd18c47f4f95be46d6d32aea0f26', '40f8e240116340dd916fddff371235d8', '29');
INSERT INTO `sys_role_auth` VALUES ('a5e90a7ed1df4a4c8490d40a657641eb', 'c8cbf59a390846458e7ae986fa53a569', '0dbbd39665034c4683fe7b2c7e76a4a1');
INSERT INTO `sys_role_auth` VALUES ('a77d51577f5744bab84987c8443a9307', '40f8e240116340dd916fddff371235d8', '15');
INSERT INTO `sys_role_auth` VALUES ('aad3eb034a904189bc1c1613823f42d7', 'c8cbf59a390846458e7ae986fa53a569', '40bd5aa8637a4f83b15590d3c51fc2ed');
INSERT INTO `sys_role_auth` VALUES ('abd38ff8a0f9400a86f44250b2a236c1', '54e1e57717154fbf8c1e902ecd977f72', '14');
INSERT INTO `sys_role_auth` VALUES ('abe5439602764fc9b4b09e0431894958', 'f09b9581206b4d34a4ab56e359966d13', '97e1c841fa2d4e788e20da907eba6ca5');
INSERT INTO `sys_role_auth` VALUES ('ac014fdfa7f143fbbfbd8a73fa82cc76', 'f09b9581206b4d34a4ab56e359966d13', '50');
INSERT INTO `sys_role_auth` VALUES ('ad24673aa3084a9d9c1413bf9daafeeb', 'f09b9581206b4d34a4ab56e359966d13', '27');
INSERT INTO `sys_role_auth` VALUES ('ad5429c58c624aef8e5bc5252aad475b', 'c8cbf59a390846458e7ae986fa53a569', 'e6dee33eedcb4f3ea44b32401673e97e');
INSERT INTO `sys_role_auth` VALUES ('ae8543b1d6db44cf81a8c9448e142e75', '0', '475d71c52e01452ab9b34ca3230526fa');
INSERT INTO `sys_role_auth` VALUES ('aea9aac872de474ba20b5c799f650dba', '40f8e240116340dd916fddff371235d8', '13');
INSERT INTO `sys_role_auth` VALUES ('af85c901e16b40f5ba55d358afed055c', 'f09b9581206b4d34a4ab56e359966d13', 'ce9fbd5988e949878ee2a4591c2c272c');
INSERT INTO `sys_role_auth` VALUES ('b13f0a2bb7894c9fb0e6ee89a933511d', 'f09b9581206b4d34a4ab56e359966d13', '44');
INSERT INTO `sys_role_auth` VALUES ('b319cc6560dd41868189a8e17508cd8c', '54e1e57717154fbf8c1e902ecd977f72', '11');
INSERT INTO `sys_role_auth` VALUES ('b3e093778f4342bba21d736c05c4a4dd', 'f09b9581206b4d34a4ab56e359966d13', '35');
INSERT INTO `sys_role_auth` VALUES ('b5e80cbd1ebe482aa570c08d73583ab9', '40f8e240116340dd916fddff371235d8', '29');
INSERT INTO `sys_role_auth` VALUES ('b64b99b72cfa407896b69d5b73920343', 'f09b9581206b4d34a4ab56e359966d13', '26');
INSERT INTO `sys_role_auth` VALUES ('b653d4f6bd4b4321a1ebcbfa36ab96d1', 'f09b9581206b4d34a4ab56e359966d13', '19');
INSERT INTO `sys_role_auth` VALUES ('bea94a65e54c46bfbbf2d79b84fe2f2a', '40f8e240116340dd916fddff371235d8', '14');
INSERT INTO `sys_role_auth` VALUES ('c3429c8bc5414a51b1a4ec9ac1b51610', '54e1e57717154fbf8c1e902ecd977f72', '9');
INSERT INTO `sys_role_auth` VALUES ('c3623687b03a40e8b1d7f3a56dea30fd', '54e1e57717154fbf8c1e902ecd977f72', '10');
INSERT INTO `sys_role_auth` VALUES ('c4f8b29c1659457ab69cd58e20f0531f', '0', '1549ff00c84a4c23b52a3ceeed7dad79');
INSERT INTO `sys_role_auth` VALUES ('c8156c5a4f854ebcb8f09020025feaa7', 'c8cbf59a390846458e7ae986fa53a569', '007551ad40954d4d86778fa28f9b6de8');
INSERT INTO `sys_role_auth` VALUES ('c8c1817756d942e3830437db6d638d52', '40f8e240116340dd916fddff371235d8', '9');
INSERT INTO `sys_role_auth` VALUES ('caa1258928dc4bfa8a76a0997b4cd8ee', 'c8cbf59a390846458e7ae986fa53a569', '6ce5d16ab0cc4bbdb39dff35adf48a04');
INSERT INTO `sys_role_auth` VALUES ('cabd5e73d5ae48d8af52e3f55a2f3fb9', 'f09b9581206b4d34a4ab56e359966d13', '11');
INSERT INTO `sys_role_auth` VALUES ('cb094a219a16436595ee14a9bb115746', 'f09b9581206b4d34a4ab56e359966d13', '21');
INSERT INTO `sys_role_auth` VALUES ('cb3c2f9d327743268989ef893eefe2cc', '0', 'f03328b13ee64cb3986557984f9ee711');
INSERT INTO `sys_role_auth` VALUES ('cb95f9f135e648358d4976896c7ab0bd', 'f09b9581206b4d34a4ab56e359966d13', '16');
INSERT INTO `sys_role_auth` VALUES ('cbb64e4a69524622b2e135696c69cdf0', 'f09b9581206b4d34a4ab56e359966d13', '57');
INSERT INTO `sys_role_auth` VALUES ('cddfa9a3dcec4461ba177539ba54adb6', '40f8e240116340dd916fddff371235d8', '8');
INSERT INTO `sys_role_auth` VALUES ('d190522adc404dadbe97b3ffd188ec3f', '40f8e240116340dd916fddff371235d8', '11');
INSERT INTO `sys_role_auth` VALUES ('d1bb67a968d54289896d839064c2f554', 'f09b9581206b4d34a4ab56e359966d13', '1');
INSERT INTO `sys_role_auth` VALUES ('d4ec20363c06475fa1d0f45467378097', '0', '86997871250b43f8861f8b6e63e5c74d');
INSERT INTO `sys_role_auth` VALUES ('d602a7a57ef443dcb0f079c8345649f9', '0', 'f03328b13ee64cb3986557984f9ee711');
INSERT INTO `sys_role_auth` VALUES ('d678721d7a4d458ebde0961ded9d4ead', 'f09b9581206b4d34a4ab56e359966d13', '20');
INSERT INTO `sys_role_auth` VALUES ('d96ed9ef745647a89dace2fb042351d8', 'f09b9581206b4d34a4ab56e359966d13', '47');
INSERT INTO `sys_role_auth` VALUES ('da393f36f5f34861a83caa7e8ac9e5f6', '40f8e240116340dd916fddff371235d8', '13');
INSERT INTO `sys_role_auth` VALUES ('da98956237744396977802cd5635cd97', '40f8e240116340dd916fddff371235d8', '16');
INSERT INTO `sys_role_auth` VALUES ('dd378541d4104e86b2a552a966706a8f', '0', '1549ff00c84a4c23b52a3ceeed7dad79');
INSERT INTO `sys_role_auth` VALUES ('debb6fa350d14c578332de394ade2374', 'c8cbf59a390846458e7ae986fa53a569', '0dbbd39665034c4683fe7b2c7e76a4a1');
INSERT INTO `sys_role_auth` VALUES ('df3de9f658f04d54aa006bd29df105cf', 'f09b9581206b4d34a4ab56e359966d13', '18');
INSERT INTO `sys_role_auth` VALUES ('dfc24ffe2333466290442053411f33a1', '0', 'c667ac35e6f34f40ad18edcba0205676');
INSERT INTO `sys_role_auth` VALUES ('e20591155f8b43d9b1072427b8c14d29', '40f8e240116340dd916fddff371235d8', '17');
INSERT INTO `sys_role_auth` VALUES ('e27974be5f6348a6ad20585cd851cf40', '0', '3ab6190d9362420b920f1a77aa176e8e');
INSERT INTO `sys_role_auth` VALUES ('e334c082fbf442aa93d3a4870426fe4a', 'f09b9581206b4d34a4ab56e359966d13', '17');
INSERT INTO `sys_role_auth` VALUES ('e405032fd6704d15a03ca648c35cc4d0', '0', 'ab01e40c04f14113b972e2ce6a764248');
INSERT INTO `sys_role_auth` VALUES ('e645ff746af8436f93d1024f3554e656', 'f09b9581206b4d34a4ab56e359966d13', '48');
INSERT INTO `sys_role_auth` VALUES ('e689807d1bf1408f80afb7f825a18577', '0', 'ab01e40c04f14113b972e2ce6a764248');
INSERT INTO `sys_role_auth` VALUES ('e87fb8f19d8249c38b90869e5d03c9f4', 'f09b9581206b4d34a4ab56e359966d13', 'a169e5d5103d4bda81d7ae39e3e63b40');
INSERT INTO `sys_role_auth` VALUES ('e88e27c29d014244a8f5bae55e46957b', 'f09b9581206b4d34a4ab56e359966d13', '45');
INSERT INTO `sys_role_auth` VALUES ('edfa89a49afd48eb9bbb1101e990042d', 'f09b9581206b4d34a4ab56e359966d13', '7e64df9cf73b4f9bb13950510a68c29f');
INSERT INTO `sys_role_auth` VALUES ('f03de78d581d4042aafb2f5e2e749a9e', '0', '30ac78f31e91472eab4f5ef8e8b372e6');
INSERT INTO `sys_role_auth` VALUES ('f063e9774246415b8cee083688c9a5c7', '40f8e240116340dd916fddff371235d8', '30');
INSERT INTO `sys_role_auth` VALUES ('f222ac85aac946908c7b926262853046', 'f09b9581206b4d34a4ab56e359966d13', '22');
INSERT INTO `sys_role_auth` VALUES ('f7a75f140f27403da417f2bd3daa80fd', 'f09b9581206b4d34a4ab56e359966d13', '38');
INSERT INTO `sys_role_auth` VALUES ('f88938251e31454f90803920d760a084', 'f09b9581206b4d34a4ab56e359966d13', '2');
INSERT INTO `sys_role_auth` VALUES ('f8f7c43d5d9c43019dc254d9096ce5dc', '0', 'f03328b13ee64cb3986557984f9ee711');
INSERT INTO `sys_role_auth` VALUES ('fa947ff79c194d668ae5cc962b2a5c60', 'f09b9581206b4d34a4ab56e359966d13', 'b2be84eacb154d068721cf27b80398ea');
INSERT INTO `sys_role_auth` VALUES ('fab813ee7c37458fb7f64ab59a91493d', 'f09b9581206b4d34a4ab56e359966d13', '007551ad40954d4d86778fa28f9b6de8');
INSERT INTO `sys_role_auth` VALUES ('fb09383fb30e47cea9247a620ac344af', 'c8cbf59a390846458e7ae986fa53a569', '40bd5aa8637a4f83b15590d3c51fc2ed');
INSERT INTO `sys_role_auth` VALUES ('fb8fd81db4e4434881e7fb9b2098b3ce', 'c8cbf59a390846458e7ae986fa53a569', '06efc88221ea43679a84e40761685069');
INSERT INTO `sys_role_auth` VALUES ('fbab91be45214268be11d82bb972a6ff', '0', '3ab6190d9362420b920f1a77aa176e8e');
INSERT INTO `sys_role_auth` VALUES ('fbb83dd7171d465ca67fd79b7c28cdd0', '0', '1549ff00c84a4c23b52a3ceeed7dad79');
INSERT INTO `sys_role_auth` VALUES ('fc624308133342e7abc87564ef65ee94', '54e1e57717154fbf8c1e902ecd977f72', '28');
INSERT INTO `sys_role_auth` VALUES ('fc8a6d8692e64103b60d4c8f001cbcc7', '40f8e240116340dd916fddff371235d8', '30');
INSERT INTO `sys_role_auth` VALUES ('fc9b7842c33e48b1aa671efaf7869c54', '40f8e240116340dd916fddff371235d8', '14');
INSERT INTO `sys_role_auth` VALUES ('fedff7fd746d456cb32cd2123c5d25f3', 'f09b9581206b4d34a4ab56e359966d13', 'aaba7ed5df9e456c84fe283c803a94d0');
INSERT INTO `sys_role_auth` VALUES ('ff67e5167c1745a28cdefe8c3bf8530c', 'f09b9581206b4d34a4ab56e359966d13', '25');
INSERT INTO `sys_role_auth` VALUES ('ffc40151e6e34b7d812d353f0fddc7d0', '0', '30ac78f31e91472eab4f5ef8e8b372e6');

-- ----------------------------
-- Table structure for `sys_role_hall`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_hall`;
CREATE TABLE `sys_role_hall` (
  `ref_id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ref_id`),
  KEY `FK_Relationship_36` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_hall
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_site`
-- ----------------------------
DROP TABLE IF EXISTS `sys_site`;
CREATE TABLE `sys_site` (
  `site_id` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `keywords` varchar(200) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `record` varchar(50) DEFAULT NULL,
  `copyright` varchar(50) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `default_area_nid` mediumint(6) DEFAULT NULL,
  `is_token` bit(1) DEFAULT NULL,
  `ftp_enabled` bit(1) DEFAULT NULL,
  `upload_path` varchar(100) DEFAULT NULL,
  `ftp_host` varchar(100) DEFAULT NULL,
  `ftp_user` varchar(50) DEFAULT NULL,
  `ftp_password` varchar(50) DEFAULT NULL,
  `ftp_port` int(5) DEFAULT NULL,
  `ftp_path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_site
-- ----------------------------
INSERT INTO `sys_site` VALUES ('1', '模拟器运维平台', '模拟器运维平台', '模拟器运维平台', '模拟器运维平台', '', '2016-2020', '', null, '', '', '', '', '', '', '21', '');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` varchar(36) NOT NULL,
  `orgid` varchar(36) DEFAULT NULL,
  `groupid` varchar(36) DEFAULT NULL,
  `area_id` varchar(9) DEFAULT NULL,
  `company_id` varchar(32) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sex` bit(1) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `audit` bit(1) DEFAULT NULL,
  `password` varchar(41) DEFAULT NULL,
  `tel` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `qq` varchar(32) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  `updator` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('admin', null, null, null, null, '系统管理员', '', '', null, '*238349A71C24ACCFEFEC48A1778B4DA76CDA1526', '', '13500998788', '', '99@qq.com', '2019-06-20 21:32:26', 'admin', '2019-06-02 00:00:00', 'root');
INSERT INTO `sys_user` VALUES ('root', '9ce02de057f34d108dc8e36a70cb6b24', '3e0d6b4b-f126-4551-a0f0-661495957e0d', null, 'ad73e66a4d5d11e9a83554ee7505d388', 'root', '', '', null, '*238349A71C24ACCFEFEC48A1778B4DA76CDA1526', '77', '15369869986', '11111', '1232@111.com', '2019-06-20 21:30:09', 'admin', '2019-06-02 00:00:00', 'root');
INSERT INTO `sys_user` VALUES ('test', null, null, null, 'ad73e66a4d5d11e9a83554ee7505d388', 'test', null, '', null, '*238349A71C24ACCFEFEC48A1778B4DA76CDA1526', '', '779', '779', '779', '2019-06-20 21:32:17', null, '2019-06-02 00:00:00', 'root');
INSERT INTO `sys_user` VALUES ('13818606778', null, null, null, '13818606778', '黄珠珠', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86-021-61675766 86-021-6167114', '13818606778', null, null, '2019-08-20 19:35:28', 'collect', '2019-08-20 19:35:28', 'collect');
INSERT INTO `sys_user` VALUES ('53188266086', null, null, null, '53188266086', '孙丰忠', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-88266086', '0531-88266086', null, null, '2019-08-20 19:35:28', 'collect', '2019-08-20 19:35:28', 'collect');
INSERT INTO `sys_user` VALUES ('13916736966', null, null, null, '13916736966', '杨默芬', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 021 60519366', '13916736966', null, null, '2019-08-20 19:35:28', 'collect', '2019-08-20 19:35:28', 'collect');
INSERT INTO `sys_user` VALUES ('15064580478', null, null, null, '15064580478', '陈爱民', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15064580478', null, null, '2019-08-20 19:35:28', 'collect', '2019-08-20 19:35:28', 'collect');
INSERT INTO `sys_user` VALUES ('15800620705', null, null, null, '15800620705', '施辉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15800620705', null, null, '2019-08-20 19:35:28', 'collect', '2019-08-20 19:35:28', 'collect');
INSERT INTO `sys_user` VALUES ('18858063184', null, null, null, '18858063184', '熊场生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-22686908/22689782', '18858063184', null, null, '2019-08-20 19:35:28', 'collect', '2019-08-20 19:35:28', 'collect');
INSERT INTO `sys_user` VALUES ('13868430397', null, null, null, '13868430397', '胡胜祥', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0577 27878532', '13868430397', null, null, '2019-08-20 19:35:27', 'collect', '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_user` VALUES ('13585966770', null, null, null, '13585966770', '任玉福', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13585966770', null, null, '2019-08-20 19:35:27', 'collect', '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_user` VALUES ('13918707981', null, null, null, '13918707981', '嵇常太', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13918707981', null, null, '2019-08-20 19:35:27', 'collect', '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_user` VALUES ('18916031297', null, null, null, '18916031297', '汤启存', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18916031297', null, null, '2019-08-20 19:35:27', 'collect', '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_user` VALUES ('18757727662', null, null, null, '18757727662', '闫肖静', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18757727662', null, null, '2019-08-20 19:35:27', 'collect', '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_user` VALUES ('15669895518', null, null, null, '15669895518', '唐发国', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0577 15669895518', '15669895518', null, null, '2019-08-20 19:35:27', 'collect', '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_user` VALUES ('18023075813', null, null, null, '18023075813', '李云雷', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0756-5577168-8859', '18023075813', null, null, '2019-08-20 19:35:27', 'collect', '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_user` VALUES ('13674990378', null, null, null, '13674990378', '张建华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-13674990378', '13674990378', null, null, '2019-08-20 19:35:27', 'collect', '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_user` VALUES ('13916894526', null, null, null, '13916894526', '顾玥', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-53080607-8007', '13916894526', null, null, '2019-08-20 19:35:27', 'collect', '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_user` VALUES ('13454675388', null, null, null, '13454675388', '钟会', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13454675388', null, null, '2019-08-20 19:35:27', 'collect', '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_user` VALUES ('13787054256', null, null, null, '13787054256', '索拓', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-82732027', '13787054256', null, null, '2019-08-20 19:35:27', 'collect', '2019-08-20 19:35:27', 'collect');
INSERT INTO `sys_user` VALUES ('13827721478', null, null, null, '13827721478', '向元军', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13827721478', null, null, '2019-08-20 19:35:26', 'collect', '2019-08-20 19:35:26', 'collect');
INSERT INTO `sys_user` VALUES ('13225364666', null, null, null, '13225364666', '吉侨', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-3529092', '13225364666', null, null, '2019-08-20 19:35:26', 'collect', '2019-08-20 19:35:26', 'collect');
INSERT INTO `sys_user` VALUES ('15802539578', null, null, null, '15802539578', '廖炯', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-82732027', '15802539578', null, null, '2019-08-20 19:35:26', 'collect', '2019-08-20 19:35:26', 'collect');
INSERT INTO `sys_user` VALUES ('18611682686', null, null, null, '18611682686', '梅玲玲', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-80701002-811', '18611682686', null, null, '2019-08-20 19:35:26', 'collect', '2019-08-20 19:35:26', 'collect');
INSERT INTO `sys_user` VALUES ('5528713999', null, null, null, '5528713999', '裴雷', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '552-8713999', null, null, '2019-08-20 19:35:26', 'collect', '2019-08-20 19:35:26', 'collect');
INSERT INTO `sys_user` VALUES ('13817177587', null, null, null, '13817177587', '王梦攀', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-36621722', '13817177587', null, null, '2019-08-20 19:35:26', 'collect', '2019-08-20 19:35:26', 'collect');
INSERT INTO `sys_user` VALUES ('13863619957', null, null, null, '13863619957', '陈爱华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-2139209', '13863619957', null, null, '2019-08-20 19:35:26', 'collect', '2019-08-20 19:35:26', 'collect');
INSERT INTO `sys_user` VALUES ('15040196840', null, null, null, '15040196840', '马莹', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '024-31089865', '15040196840', null, null, '2019-08-20 19:35:25', 'collect', '2019-08-20 19:35:25', 'collect');
INSERT INTO `sys_user` VALUES ('18964346352', null, null, null, '18964346352', '王凤彩', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 021 64050079', '18964346352', null, null, '2019-08-20 19:35:25', 'collect', '2019-08-20 19:35:25', 'collect');
INSERT INTO `sys_user` VALUES ('13686182231', null, null, null, '13686182231', '陈燕', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13686182231', null, null, '2019-08-20 19:35:25', 'collect', '2019-08-20 19:35:25', 'collect');
INSERT INTO `sys_user` VALUES ('13245532000', null, null, null, '13245532000', '谢晓峰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-63333660', '13245532000', null, null, '2019-08-20 19:35:25', 'collect', '2019-08-20 19:35:25', 'collect');
INSERT INTO `sys_user` VALUES ('15901377790', null, null, null, '15901377790', '张绪春', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-67708629', '15901377790', null, null, '2019-08-20 19:35:25', 'collect', '2019-08-20 19:35:25', 'collect');
INSERT INTO `sys_user` VALUES ('13968776787', null, null, null, '13968776787', '罗道关', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0577-62778200', '13968776787', null, null, '2019-08-20 19:35:25', 'collect', '2019-08-20 19:35:25', 'collect');
INSERT INTO `sys_user` VALUES ('18805772262', null, null, null, '18805772262', '虞仲洁', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18805772262', null, null, '2019-08-20 19:35:24', 'collect', '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_user` VALUES ('18226551033', null, null, null, '18226551033', '赵培帅', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18226551033', null, null, '2019-08-20 19:35:24', 'collect', '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_user` VALUES ('13510014165', null, null, null, '13510014165', '孙永年', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0755 29792772', '13510014165', null, null, '2019-08-20 19:35:24', 'collect', '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_user` VALUES ('18618118515', null, null, null, '18618118515', '叶长春', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '4006400418', '18618118515', null, null, '2019-08-20 19:35:24', 'collect', '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_user` VALUES ('13395999028', null, null, null, '13395999028', '张源彬', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0592-5518008', '13395999028', null, null, '2019-08-20 19:35:24', 'collect', '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_user` VALUES ('13439017000', null, null, null, '13439017000', '王经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13439017000', null, null, '2019-08-20 19:35:24', 'collect', '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_user` VALUES ('57762778200', null, null, null, '57762778200', '叶娟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0577-62778200', '0577-62778200', null, null, '2019-08-20 19:35:24', 'collect', '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_user` VALUES ('13930768540', null, null, null, '13930768540', '侯增鸿', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13930768540', null, null, '2019-08-20 19:35:24', 'collect', '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_user` VALUES ('02988630938', null, null, null, '02988630938', '屈楠', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '029-86 029 88630938', '029 88630938', null, null, '2019-08-20 19:35:24', 'collect', '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_user` VALUES ('13868721625', null, null, null, '13868721625', '马宝光', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13868721625', null, null, '2019-08-20 19:35:24', 'collect', '2019-08-20 19:35:24', 'collect');
INSERT INTO `sys_user` VALUES ('13700379667', null, null, null, '13700379667', '张玉成', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0317 2235070', '13700379667', null, null, '2019-08-20 19:35:23', 'collect', '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_user` VALUES ('13958373858', null, null, null, '13958373858', '蒋民', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13958373858', null, null, '2019-08-20 19:35:23', 'collect', '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_user` VALUES ('18717181115', null, null, null, '18717181115', '曾明明', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '027-87737141', '18717181115', null, null, '2019-08-20 19:35:23', 'collect', '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_user` VALUES ('13819431042', null, null, null, '13819431042', '宋永芳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13819431042', null, null, '2019-08-20 19:35:23', 'collect', '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_user` VALUES ('13927209474', null, null, null, '13927209474', '冉启波', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13927209474', null, null, '2019-08-20 19:35:23', 'collect', '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_user` VALUES ('18688970167', null, null, null, '18688970167', '关天明', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18688970167', null, null, '2019-08-20 19:35:23', 'collect', '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_user` VALUES ('13736066933', null, null, null, '13736066933', '施德捍', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13736066933', null, null, '2019-08-20 19:35:23', 'collect', '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_user` VALUES ('13156132613', null, null, null, '13156132613', '刘家君', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13156132613', null, null, '2019-08-20 19:35:23', 'collect', '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_user` VALUES ('13133583708', null, null, null, '13133583708', '张强', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13133583708', null, null, '2019-08-20 19:35:23', 'collect', '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_user` VALUES ('5103732153', null, null, null, '5103732153', '销售部', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '510-3732153', '510-3732153', null, null, '2019-08-20 19:35:23', 'collect', '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_user` VALUES ('13566473317', null, null, null, '13566473317', '赵荣智', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13566473317', null, null, '2019-08-20 19:35:23', 'collect', '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_user` VALUES ('13685289792', null, null, null, '13685289792', '王长鹏', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0519-81690383/83729393/8371332', '13685289792', null, null, '2019-08-20 19:35:23', 'collect', '2019-08-20 19:35:23', 'collect');
INSERT INTO `sys_user` VALUES ('13357681330', null, null, null, '13357681330', '范继国', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13357681330', null, null, '2019-08-20 19:35:22', 'collect', '2019-08-20 19:35:22', 'collect');
INSERT INTO `sys_user` VALUES ('13431151088', null, null, null, '13431151088', '苏国兰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13431151088', null, null, '2019-08-20 19:35:22', 'collect', '2019-08-20 19:35:22', 'collect');
INSERT INTO `sys_user` VALUES ('13953431990', null, null, null, '13953431990', '邱经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13953431990', null, null, '2019-08-20 19:35:22', 'collect', '2019-08-20 19:35:22', 'collect');
INSERT INTO `sys_user` VALUES ('13607446773', null, null, null, '13607446773', '陈丽华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13607446773', null, null, '2019-08-20 19:25:21', 'collect', '2019-08-20 19:25:21', 'collect');
INSERT INTO `sys_user` VALUES ('18002507615', null, null, null, '18002507615', '孟经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-29503891', '18002507615', null, null, '2019-08-20 19:25:21', 'collect', '2019-08-20 19:25:21', 'collect');
INSERT INTO `sys_user` VALUES ('13377894726', null, null, null, '13377894726', '刘新华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '027-88161243', '13377894726', null, null, '2019-08-20 19:25:20', 'collect', '2019-08-20 19:25:20', 'collect');
INSERT INTO `sys_user` VALUES ('18510275953', null, null, null, '18510275953', '汤玉霞', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-89360086', '18510275953', null, null, '2019-08-20 19:25:20', 'collect', '2019-08-20 19:25:20', 'collect');
INSERT INTO `sys_user` VALUES ('17721194048', null, null, null, '17721194048', '张女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-65635988', '17721194048', null, null, '2019-08-20 19:25:20', 'collect', '2019-08-20 19:25:20', 'collect');
INSERT INTO `sys_user` VALUES ('18924287221', null, null, null, '18924287221', '黎生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-66206717', '18924287221', null, null, '2019-08-20 19:25:19', 'collect', '2019-08-20 19:25:19', 'collect');
INSERT INTO `sys_user` VALUES ('13501291669', null, null, null, '13501291669', '韩小国', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-89981827/89980289/89996048', '13501291669', null, null, '2019-08-20 19:25:19', 'collect', '2019-08-20 19:25:19', 'collect');
INSERT INTO `sys_user` VALUES ('13049628448', null, null, null, '13049628448', '黄雪玲', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-66391030', '13049628448', null, null, '2019-08-20 19:25:19', 'collect', '2019-08-20 19:25:19', 'collect');
INSERT INTO `sys_user` VALUES ('18624392677', null, null, null, '18624392677', '康女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0411-39949712', '18624392677', null, null, '2019-08-20 19:25:19', 'collect', '2019-08-20 19:25:19', 'collect');
INSERT INTO `sys_user` VALUES ('13703117333', null, null, null, '13703117333', '许文辉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-86023888', '13703117333', null, null, '2019-08-20 19:25:19', 'collect', '2019-08-20 19:25:19', 'collect');
INSERT INTO `sys_user` VALUES ('18653412699', null, null, null, '18653412699', '熊永辉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0534-2387598', '18653412699', null, null, '2019-08-20 19:25:19', 'collect', '2019-08-20 19:25:19', 'collect');
INSERT INTO `sys_user` VALUES ('15998551030', null, null, null, '15998551030', '鲁先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15998551030', null, null, '2019-08-20 19:25:18', 'collect', '2019-08-20 19:25:18', 'collect');
INSERT INTO `sys_user` VALUES ('13785105288', null, null, null, '13785105288', '付雪飞', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-82236170', '13785105288', null, null, '2019-08-20 19:25:18', 'collect', '2019-08-20 19:25:18', 'collect');
INSERT INTO `sys_user` VALUES ('15370537666', null, null, null, '15370537666', '徐春光', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0527-88999222', '15370537666', null, null, '2019-08-20 19:23:13', 'collect', '2019-08-20 19:23:13', 'collect');
INSERT INTO `sys_user` VALUES ('15895562792', null, null, null, '15895562792', '陈君洁', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-65635988', '15895562792', null, null, '2019-08-20 19:23:13', 'collect', '2019-08-20 19:23:13', 'collect');
INSERT INTO `sys_user` VALUES ('13116342223', null, null, null, '13116342223', '吕荣裕', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13116342223', null, null, '2019-08-20 19:23:13', 'collect', '2019-08-20 19:23:13', 'collect');
INSERT INTO `sys_user` VALUES ('15365099371', null, null, null, '15365099371', '杨经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '025-58789380', '15365099371', null, null, '2019-08-20 19:23:13', 'collect', '2019-08-20 19:23:13', 'collect');
INSERT INTO `sys_user` VALUES ('13505341362', null, null, null, '13505341362', '张明', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0534-8158166', '13505341362', null, null, '2019-08-20 19:23:13', 'collect', '2019-08-20 19:23:13', 'collect');
INSERT INTO `sys_user` VALUES ('13336268788', null, null, null, '13336268788', '方旺', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0534-2711345', '13336268788', null, null, '2019-08-20 19:23:12', 'collect', '2019-08-20 19:23:12', 'collect');
INSERT INTO `sys_user` VALUES ('15066577797', null, null, null, '15066577797', '张明', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0534-2711345', '15066577797', null, null, '2019-08-20 19:23:11', 'collect', '2019-08-20 19:23:11', 'collect');
INSERT INTO `sys_user` VALUES ('17692710196', null, null, null, '17692710196', '王路风', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0319-6162516', '17692710196', null, null, '2019-08-20 19:23:11', 'collect', '2019-08-20 19:23:11', 'collect');
INSERT INTO `sys_user` VALUES ('13910648209', null, null, null, '13910648209', '刘经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-67876801', '13910648209', null, null, '2019-08-20 19:23:11', 'collect', '2019-08-20 19:23:11', 'collect');
INSERT INTO `sys_user` VALUES ('13363322008', null, null, null, '13363322008', '赵衡', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-7705875', '13363322008', null, null, '2019-08-20 19:23:10', 'collect', '2019-08-20 19:23:10', 'collect');
INSERT INTO `sys_user` VALUES ('13375381560', null, null, null, '13375381560', '杜恒涛', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13375381560', null, null, '2019-08-20 19:23:10', 'collect', '2019-08-20 19:23:10', 'collect');
INSERT INTO `sys_user` VALUES ('18653673532', null, null, null, '18653673532', '张梅', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0537-2987870', '18653673532', null, null, '2019-08-20 19:23:10', 'collect', '2019-08-20 19:23:10', 'collect');
INSERT INTO `sys_user` VALUES ('13837884446', null, null, null, '13837884446', '侯经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0378-2668678', '13837884446', null, null, '2019-08-20 19:23:10', 'collect', '2019-08-20 19:23:10', 'collect');
INSERT INTO `sys_user` VALUES ('18633075361', null, null, null, '18633075361', '彭根元', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-83038832', '18633075361', null, null, '2019-08-20 19:23:10', 'collect', '2019-08-20 19:23:10', 'collect');
INSERT INTO `sys_user` VALUES ('15831449955', null, null, null, '15831449955', '初娅君', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-82236168', '15831449955', null, null, '2019-08-20 19:23:10', 'collect', '2019-08-20 19:23:10', 'collect');
INSERT INTO `sys_user` VALUES ('13524828598', null, null, null, '13524828598', '范范', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-67686291', '13524828598', null, null, '2019-08-20 19:23:10', 'collect', '2019-08-20 19:23:10', 'collect');
INSERT INTO `sys_user` VALUES ('13816179925', null, null, null, '13816179925', '解先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-57796281', '13816179925', null, null, '2019-08-20 19:23:10', 'collect', '2019-08-20 19:23:10', 'collect');
INSERT INTO `sys_user` VALUES ('03783921559', null, null, null, '03783921559', '张新燕', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0086-0378-3921559', '0378-3921559', null, null, '2019-08-20 19:23:09', 'collect', '2019-08-20 19:23:09', 'collect');
INSERT INTO `sys_user` VALUES ('18075185708', null, null, null, '18075185708', '刘小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85575748', '18075185708', null, null, '2019-08-20 19:23:09', 'collect', '2019-08-20 19:23:09', 'collect');
INSERT INTO `sys_user` VALUES ('13920803618', null, null, null, '13920803618', '刘凤鑫', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-28679568', '13920803618', null, null, '2019-08-20 19:23:09', 'collect', '2019-08-20 19:23:09', 'collect');
INSERT INTO `sys_user` VALUES ('13648861607', null, null, null, '13648861607', '陈佳庆', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 871 67187640', '13648861607', null, null, '2019-08-20 19:23:09', 'collect', '2019-08-20 19:23:09', 'collect');
INSERT INTO `sys_user` VALUES ('15209295851', null, null, null, '15209295851', '蔡先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15209295851', null, null, '2019-08-20 19:23:09', 'collect', '2019-08-20 19:23:09', 'collect');
INSERT INTO `sys_user` VALUES ('15530159233', null, null, null, '15530159233', '许经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-67900315', '15530159233', null, null, '2019-08-20 19:23:09', 'collect', '2019-08-20 19:23:09', 'collect');
INSERT INTO `sys_user` VALUES ('18611133089', null, null, null, '18611133089', '王先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '018-61113308', '18611133089', null, null, '2019-08-20 19:23:08', 'collect', '2019-08-20 19:23:08', 'collect');
INSERT INTO `sys_user` VALUES ('13384911670', null, null, null, '13384911670', '牛瑞强', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '029-33131882', '13384911670', null, null, '2019-08-20 19:23:08', 'collect', '2019-08-20 19:23:08', 'collect');
INSERT INTO `sys_user` VALUES ('18660195238', null, null, null, '18660195238', '王远志', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-88275636', '18660195238', null, null, '2019-08-20 19:23:07', 'collect', '2019-08-20 19:23:07', 'collect');
INSERT INTO `sys_user` VALUES ('18928862340', null, null, null, '18928862340', '罗小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-89230513', '18928862340', null, null, '2019-08-20 19:23:07', 'collect', '2019-08-20 19:23:07', 'collect');
INSERT INTO `sys_user` VALUES ('13182457277', null, null, null, '13182457277', '杨红明', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0523-13236151888', '13182457277', null, null, '2019-08-20 19:23:06', 'collect', '2019-08-20 19:23:06', 'collect');
INSERT INTO `sys_user` VALUES ('13818630826', null, null, null, '13818630826', '刘经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-60556906', '13818630826', null, null, '2019-08-20 19:23:05', 'collect', '2019-08-20 19:23:05', 'collect');
INSERT INTO `sys_user` VALUES ('13818708216', null, null, null, '13818708216', '徐良', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-60556906', '13818708216', null, null, '2019-08-20 19:23:05', 'collect', '2019-08-20 19:23:05', 'collect');
INSERT INTO `sys_user` VALUES ('13781104290', null, null, null, '13781104290', '程素华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-22633053', '13781104290', null, null, '2019-08-20 19:23:05', 'collect', '2019-08-20 19:23:05', 'collect');
INSERT INTO `sys_user` VALUES ('13216633667', null, null, null, '13216633667', '唐经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-88295850', '13216633667', null, null, '2019-08-20 19:23:05', 'collect', '2019-08-20 19:23:05', 'collect');
INSERT INTO `sys_user` VALUES ('13602079688', null, null, null, '13602079688', '王传宝', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-25971388', '13602079688', null, null, '2019-08-20 19:23:05', 'collect', '2019-08-20 19:23:05', 'collect');
INSERT INTO `sys_user` VALUES ('15194190925', null, null, null, '15194190925', '逯朝于', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-88275636', '15194190925', null, null, '2019-08-20 19:23:05', 'collect', '2019-08-20 19:23:05', 'collect');
INSERT INTO `sys_user` VALUES ('15511776679', null, null, null, '15511776679', '刘飞', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0317 3376000', '15511776679', null, null, '2019-08-20 19:23:04', 'collect', '2019-08-20 19:23:04', 'collect');
INSERT INTO `sys_user` VALUES ('18795619612', null, null, null, '18795619612', '周婉迪', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18795619612', null, null, '2019-08-20 19:23:04', 'collect', '2019-08-20 19:23:04', 'collect');
INSERT INTO `sys_user` VALUES ('15332300820', null, null, null, '15332300820', '王小姐15594904612', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '029-68813631', '15332300820', null, null, '2019-08-20 19:23:04', 'collect', '2019-08-20 19:23:04', 'collect');
INSERT INTO `sys_user` VALUES ('18814946201', null, null, null, '18814946201', '朱仙龙', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0577-89891652', '18814946201', null, null, '2019-08-20 19:23:04', 'collect', '2019-08-20 19:23:04', 'collect');
INSERT INTO `sys_user` VALUES ('18653868973', null, null, null, '18653868973', '孙媚', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-8880067', '18653868973', null, null, '2019-08-20 19:23:04', 'collect', '2019-08-20 19:23:04', 'collect');
INSERT INTO `sys_user` VALUES ('15388991193', null, null, null, '15388991193', '戴小军', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-88758025', '15388991193', null, null, '2019-08-20 19:23:03', 'collect', '2019-08-20 19:23:03', 'collect');
INSERT INTO `sys_user` VALUES ('18008477149', null, null, null, '18008477149', '刘成荣', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-84394977', '18008477149', null, null, '2019-08-20 19:23:03', 'collect', '2019-08-20 19:23:03', 'collect');
INSERT INTO `sys_user` VALUES ('15360613733', null, null, null, '15360613733', '张小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-85675744', '15360613733', null, null, '2019-08-20 19:23:03', 'collect', '2019-08-20 19:23:03', 'collect');
INSERT INTO `sys_user` VALUES ('13520678759', null, null, null, '13520678759', '直先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13520678759', null, null, '2019-08-20 19:23:03', 'collect', '2019-08-20 19:23:03', 'collect');
INSERT INTO `sys_user` VALUES ('13713896842', null, null, null, '13713896842', '柴卫红', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '755-13713896842', '13713896842', null, null, '2019-08-20 19:23:03', 'collect', '2019-08-20 19:23:03', 'collect');
INSERT INTO `sys_user` VALUES ('13332099881', null, null, null, '13332099881', '刘春然', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-58620536', '13332099881', null, null, '2019-08-20 19:23:03', 'collect', '2019-08-20 19:23:03', 'collect');
INSERT INTO `sys_user` VALUES ('15927166215', null, null, null, '15927166215', '陈少彬', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 027 15927166215', '15927166215', null, null, '2019-08-20 19:23:02', 'collect', '2019-08-20 19:23:02', 'collect');
INSERT INTO `sys_user` VALUES ('13826221235', null, null, null, '13826221235', '路海空', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-87053115', '13826221235', null, null, '2019-08-20 19:23:02', 'collect', '2019-08-20 19:23:02', 'collect');
INSERT INTO `sys_user` VALUES ('13377869229', null, null, null, '13377869229', '邓文清', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '027-83266165', '13377869229', null, null, '2019-08-20 19:22:59', 'collect', '2019-08-20 19:22:59', 'collect');
INSERT INTO `sys_user` VALUES ('73182156311', null, null, null, '73182156311', '刘炜', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-82156311', '0731-82156311', null, null, '2019-08-20 19:22:59', 'collect', '2019-08-20 19:22:59', 'collect');
INSERT INTO `sys_user` VALUES ('18573627127', null, null, null, '18573627127', '小董', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18573627127', null, null, '2019-08-20 19:22:59', 'collect', '2019-08-20 19:22:59', 'collect');
INSERT INTO `sys_user` VALUES ('13359217663', null, null, null, '13359217663', '张经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '029-83338144', '13359217663', null, null, '2019-08-20 19:22:57', 'collect', '2019-08-20 19:22:57', 'collect');
INSERT INTO `sys_user` VALUES ('15877965891', null, null, null, '15877965891', '代孔兵', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0871 7176824/7237098', '15877965891', null, null, '2019-08-20 19:22:57', 'collect', '2019-08-20 19:22:57', 'collect');
INSERT INTO `sys_user` VALUES ('15850701137', null, null, null, '15850701137', '王芳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 025 83344277', '15850701137', null, null, '2019-08-20 19:22:57', 'collect', '2019-08-20 19:22:57', 'collect');
INSERT INTO `sys_user` VALUES ('15589717043', null, null, null, '15589717043', '王艳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0537-2882816', '15589717043', null, null, '2019-08-20 19:22:57', 'collect', '2019-08-20 19:22:57', 'collect');
INSERT INTO `sys_user` VALUES ('18630124443', null, null, null, '18630124443', '路帅', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18630124443', null, null, '2019-08-20 19:22:57', 'collect', '2019-08-20 19:22:57', 'collect');
INSERT INTO `sys_user` VALUES ('13819830456', null, null, null, '13819830456', '谢骏马', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0574 63742863', '13819830456', null, null, '2019-08-20 19:22:57', 'collect', '2019-08-20 19:22:57', 'collect');
INSERT INTO `sys_user` VALUES ('15532492198', null, null, null, '15532492198', '焦世涛', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-84901613', '15532492198', null, null, '2019-08-20 19:22:56', 'collect', '2019-08-20 19:22:56', 'collect');
INSERT INTO `sys_user` VALUES ('13230101955', null, null, null, '13230101955', '焦世涛', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-80856278', '13230101955', null, null, '2019-08-20 19:22:56', 'collect', '2019-08-20 19:22:56', 'collect');
INSERT INTO `sys_user` VALUES ('13601216595', null, null, null, '13601216595', '张亚静', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-52882609', '13601216595', null, null, '2019-08-20 19:22:56', 'collect', '2019-08-20 19:22:56', 'collect');
INSERT INTO `sys_user` VALUES ('13731167164', null, null, null, '13731167164', '左经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-83038839', '13731167164', null, null, '2019-08-20 19:22:56', 'collect', '2019-08-20 19:22:56', 'collect');
INSERT INTO `sys_user` VALUES ('13806834884', null, null, null, '13806834884', '蔡雪菲', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0577-62708930', '13806834884', null, null, '2019-08-20 19:22:56', 'collect', '2019-08-20 19:22:56', 'collect');
INSERT INTO `sys_user` VALUES ('13401906228', null, null, null, '13401906228', '吴清哲', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '025-13914778775', '13401906228', null, null, '2019-08-20 19:22:56', 'collect', '2019-08-20 19:22:56', 'collect');
INSERT INTO `sys_user` VALUES ('15600106589', null, null, null, '15600106589', '孟成', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-61234567', '15600106589', null, null, '2019-08-20 19:22:55', 'collect', '2019-08-20 19:22:55', 'collect');
INSERT INTO `sys_user` VALUES ('15027600050', null, null, null, '15027600050', '韩洪武', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0315 8675818', '15027600050', null, null, '2019-08-20 19:22:55', 'collect', '2019-08-20 19:22:55', 'collect');
INSERT INTO `sys_user` VALUES ('13488709752', null, null, null, '13488709752', '赵恒松', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0134-88709752', '13488709752', null, null, '2019-08-20 19:22:54', 'collect', '2019-08-20 19:22:54', 'collect');
INSERT INTO `sys_user` VALUES ('18678879650', null, null, null, '18678879650', '王先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18678879650', null, null, '2019-08-20 19:22:54', 'collect', '2019-08-20 19:22:54', 'collect');
INSERT INTO `sys_user` VALUES ('15613696199', null, null, null, '15613696199', '赵经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0316-5960062', '15613696199', null, null, '2019-08-20 19:22:53', 'collect', '2019-08-20 19:22:53', 'collect');
INSERT INTO `sys_user` VALUES ('13682080367', null, null, null, '13682080367', '赵勇', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 22 26268802', '13682080367', null, null, '2019-08-20 19:22:53', 'collect', '2019-08-20 19:22:53', 'collect');
INSERT INTO `sys_user` VALUES ('18509280980', null, null, null, '18509280980', '郑海云', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '029-62716580', '18509280980', null, null, '2019-08-20 19:22:52', 'collect', '2019-08-20 19:22:52', 'collect');
INSERT INTO `sys_user` VALUES ('13968211176', null, null, null, '13968211176', '周泽孟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0-13780043952', '13968211176', null, null, '2019-08-20 19:22:52', 'collect', '2019-08-20 19:22:52', 'collect');
INSERT INTO `sys_user` VALUES ('13487585323', null, null, null, '13487585323', '李佳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13487585323', null, null, '2019-08-20 19:22:51', 'collect', '2019-08-20 19:22:51', 'collect');
INSERT INTO `sys_user` VALUES ('18951748886', null, null, null, '18951748886', '陈小锋', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '025-57018769', '18951748886', null, null, '2019-08-20 19:22:51', 'collect', '2019-08-20 19:22:51', 'collect');
INSERT INTO `sys_user` VALUES ('15007002922', null, null, null, '15007002922', '杨志君', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0791-86530119', '15007002922', null, null, '2019-08-20 19:22:50', 'collect', '2019-08-20 19:22:50', 'collect');
INSERT INTO `sys_user` VALUES ('15318115236', null, null, null, '15318115236', '管培银', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-3260777', '15318115236', null, null, '2019-08-20 19:22:50', 'collect', '2019-08-20 19:22:50', 'collect');
INSERT INTO `sys_user` VALUES ('57186517327', null, null, null, '57186517327', '叶伦斐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 571 56920139', '571-86517327', null, null, '2019-08-20 19:22:50', 'collect', '2019-08-20 19:22:50', 'collect');
INSERT INTO `sys_user` VALUES ('13816457500', null, null, null, '13816457500', '张林', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '21-33316075', '13816457500', null, null, '2019-08-20 19:22:50', 'collect', '2019-08-20 19:22:50', 'collect');
INSERT INTO `sys_user` VALUES ('15237897560', null, null, null, '15237897560', '刘占营', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-22238339', '15237897560', null, null, '2019-08-20 19:22:50', 'collect', '2019-08-20 19:22:50', 'collect');
INSERT INTO `sys_user` VALUES ('13129966556', null, null, null, '13129966556', '孙生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0728-3221285', '13129966556', null, null, '2019-08-20 19:22:50', 'collect', '2019-08-20 19:22:50', 'collect');
INSERT INTO `sys_user` VALUES ('13778432468', null, null, null, '13778432468', '黄跃生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13778432468', null, null, '2019-08-20 19:22:50', 'collect', '2019-08-20 19:22:50', 'collect');
INSERT INTO `sys_user` VALUES ('18788182558', null, null, null, '18788182558', '王凤艳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0871 5636919', '18788182558', null, null, '2019-08-20 19:22:50', 'collect', '2019-08-20 19:22:50', 'collect');
INSERT INTO `sys_user` VALUES ('18123850239', null, null, null, '18123850239', '祝小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '4007-886116', '18123850239', null, null, '2019-08-20 19:22:50', 'collect', '2019-08-20 19:22:50', 'collect');
INSERT INTO `sys_user` VALUES ('18910263993', null, null, null, '18910263993', '张经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-61277310', '18910263993', null, null, '2019-08-20 19:22:49', 'collect', '2019-08-20 19:22:49', 'collect');
INSERT INTO `sys_user` VALUES ('18931867264', null, null, null, '18931867264', '左经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-83038839', '18931867264', null, null, '2019-08-20 19:22:49', 'collect', '2019-08-20 19:22:49', 'collect');
INSERT INTO `sys_user` VALUES ('13003619090', null, null, null, '13003619090', '孙峥', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0571-28028686', '13003619090', null, null, '2019-08-20 19:22:49', 'collect', '2019-08-20 19:22:49', 'collect');
INSERT INTO `sys_user` VALUES ('75589610877', null, null, null, '75589610877', '吴明助', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-89610877', '0755-89610877', null, null, '2019-08-20 19:22:49', 'collect', '2019-08-20 19:22:49', 'collect');
INSERT INTO `sys_user` VALUES ('18633027581', null, null, null, '18633027581', '孙彦光', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-67266185', '18633027581', null, null, '2019-08-20 19:22:49', 'collect', '2019-08-20 19:22:49', 'collect');
INSERT INTO `sys_user` VALUES ('13600071836', null, null, null, '13600071836', '吴强', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13600071836', null, null, '2019-08-20 19:22:49', 'collect', '2019-08-20 19:22:49', 'collect');
INSERT INTO `sys_user` VALUES ('13361212131', null, null, null, '13361212131', '李春生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0532-87270873', '13361212131', null, null, '2019-08-20 19:22:49', 'collect', '2019-08-20 19:22:49', 'collect');
INSERT INTO `sys_user` VALUES ('13723271633', null, null, null, '13723271633', '陈丹丹', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-25845555', '13723271633', null, null, '2019-08-20 19:22:49', 'collect', '2019-08-20 19:22:49', 'collect');
INSERT INTO `sys_user` VALUES ('13823572570', null, null, null, '13823572570', '李淼', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13823572570', null, null, '2019-08-20 19:22:49', 'collect', '2019-08-20 19:22:49', 'collect');
INSERT INTO `sys_user` VALUES ('13783962072', null, null, null, '13783962072', '李雪玲', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0396-7059099', '13783962072', null, null, '2019-08-20 19:22:49', 'collect', '2019-08-20 19:22:49', 'collect');
INSERT INTO `sys_user` VALUES ('15001377453', null, null, null, '15001377453', '高方', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-60439281', '15001377453', null, null, '2019-08-20 19:22:48', 'collect', '2019-08-20 19:22:48', 'collect');
INSERT INTO `sys_user` VALUES ('15684796588', null, null, null, '15684796588', '苏经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0534-2665288', '15684796588', null, null, '2019-08-20 19:22:48', 'collect', '2019-08-20 19:22:48', 'collect');
INSERT INTO `sys_user` VALUES ('13601363275', null, null, null, '13601363275', '李琼', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-60775519', '13601363275', null, null, '2019-08-20 19:22:48', 'collect', '2019-08-20 19:22:48', 'collect');
INSERT INTO `sys_user` VALUES ('18210363881', null, null, null, '18210363881', '郝经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18210363881', null, null, '2019-08-20 19:22:48', 'collect', '2019-08-20 19:22:48', 'collect');
INSERT INTO `sys_user` VALUES ('15594801238', null, null, null, '15594801238', '梁瑞芳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '029-68966269', '15594801238', null, null, '2019-08-20 19:22:48', 'collect', '2019-08-20 19:22:48', 'collect');
INSERT INTO `sys_user` VALUES ('15618580760', null, null, null, '15618580760', '李小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15618580760', null, null, '2019-08-20 19:22:48', 'collect', '2019-08-20 19:22:48', 'collect');
INSERT INTO `sys_user` VALUES ('18975800239', null, null, null, '18975800239', '杨经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-89916976', '18975800239', null, null, '2019-08-20 19:22:48', 'collect', '2019-08-20 19:22:48', 'collect');
INSERT INTO `sys_user` VALUES ('13136999918', null, null, null, '13136999918', '赵文洪', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0454-8686400', '13136999918', null, null, '2019-08-20 19:22:47', 'collect', '2019-08-20 19:22:47', 'collect');
INSERT INTO `sys_user` VALUES ('13793688855', null, null, null, '13793688855', '杨海刚', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-3839938', '13793688855', null, null, '2019-08-20 19:22:47', 'collect', '2019-08-20 19:22:47', 'collect');
INSERT INTO `sys_user` VALUES ('18900738260', null, null, null, '18900738260', '阳韶飞', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-84458533', '18900738260', null, null, '2019-08-20 19:22:47', 'collect', '2019-08-20 19:22:47', 'collect');
INSERT INTO `sys_user` VALUES ('18186513301', null, null, null, '18186513301', '周军', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '027-86977997', '18186513301', null, null, '2019-08-20 19:22:47', 'collect', '2019-08-20 19:22:47', 'collect');
INSERT INTO `sys_user` VALUES ('13889115350', null, null, null, '13889115350', '齐峰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0138-89115350', '13889115350', null, null, '2019-08-20 19:22:47', 'collect', '2019-08-20 19:22:47', 'collect');
INSERT INTO `sys_user` VALUES ('02986492717', null, null, null, '02986492717', '魏小锋', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 029 86492717', '029 86492717', null, null, '2019-08-20 19:22:47', 'collect', '2019-08-20 19:22:47', 'collect');
INSERT INTO `sys_user` VALUES ('18253158566', null, null, null, '18253158566', '沈丹丹', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-87958988', '18253158566', null, null, '2019-08-20 19:22:47', 'collect', '2019-08-20 19:22:47', 'collect');
INSERT INTO `sys_user` VALUES ('13711630249', null, null, null, '13711630249', '常志航', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-31032782', '13711630249', null, null, '2019-08-20 19:22:46', 'collect', '2019-08-20 19:22:46', 'collect');
INSERT INTO `sys_user` VALUES ('15988671717', null, null, null, '15988671717', '应科杰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-87581386', '15988671717', null, null, '2019-08-20 19:22:46', 'collect', '2019-08-20 19:22:46', 'collect');
INSERT INTO `sys_user` VALUES ('13629243523', null, null, null, '13629243523', '郭勇', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13629243523', null, null, '2019-08-20 19:22:46', 'collect', '2019-08-20 19:22:46', 'collect');
INSERT INTO `sys_user` VALUES ('15153877866', null, null, null, '15153877866', '王莹', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15153877866', null, null, '2019-08-20 19:22:46', 'collect', '2019-08-20 19:22:46', 'collect');
INSERT INTO `sys_user` VALUES ('18855323318', null, null, null, '18855323318', '石云鹏', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0551-65671653', '18855323318', null, null, '2019-08-20 19:22:46', 'collect', '2019-08-20 19:22:46', 'collect');
INSERT INTO `sys_user` VALUES ('13684903020', null, null, null, '13684903020', '侯立军', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-86114728', '13684903020', null, null, '2019-08-20 19:22:46', 'collect', '2019-08-20 19:22:46', 'collect');
INSERT INTO `sys_user` VALUES ('13922337970', null, null, null, '13922337970', '罗生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-37215677', '13922337970', null, null, '2019-08-20 19:22:46', 'collect', '2019-08-20 19:22:46', 'collect');
INSERT INTO `sys_user` VALUES ('13824315101', null, null, null, '13824315101', '吴先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-33106530', '13824315101', null, null, '2019-08-20 19:22:46', 'collect', '2019-08-20 19:22:46', 'collect');
INSERT INTO `sys_user` VALUES ('15200923383', null, null, null, '15200923383', '小常', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15200923383', null, null, '2019-08-20 19:22:46', 'collect', '2019-08-20 19:22:46', 'collect');
INSERT INTO `sys_user` VALUES ('18963509366', null, null, null, '18963509366', '陈清杰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '400-011-9366', '18963509366', null, null, '2019-08-20 19:22:45', 'collect', '2019-08-20 19:22:45', 'collect');
INSERT INTO `sys_user` VALUES ('15802618165', null, null, null, '15802618165', '蒋先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-84862489', '15802618165', null, null, '2019-08-20 19:22:45', 'collect', '2019-08-20 19:22:45', 'collect');
INSERT INTO `sys_user` VALUES ('15900888742', null, null, null, '15900888742', '王瑞', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-67155552', '15900888742', null, null, '2019-08-20 19:22:45', 'collect', '2019-08-20 19:22:45', 'collect');
INSERT INTO `sys_user` VALUES ('15011149008', null, null, null, '15011149008', '孙江', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-52458233', '15011149008', null, null, '2019-08-20 19:22:45', 'collect', '2019-08-20 19:22:45', 'collect');
INSERT INTO `sys_user` VALUES ('13275382171', null, null, null, '13275382171', '李延峰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13275382171', null, null, '2019-08-20 19:22:45', 'collect', '2019-08-20 19:22:45', 'collect');
INSERT INTO `sys_user` VALUES ('18165156441', null, null, null, '18165156441', '曹经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '029-88636860', '18165156441', null, null, '2019-08-20 19:22:45', 'collect', '2019-08-20 19:22:45', 'collect');
INSERT INTO `sys_user` VALUES ('15829710054', null, null, null, '15829710054', '李珍', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 029 83151560', '15829710054', null, null, '2019-08-20 19:22:45', 'collect', '2019-08-20 19:22:45', 'collect');
INSERT INTO `sys_user` VALUES ('15017400981', null, null, null, '15017400981', '陈秀红', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 150 17400981', '15017400981', null, null, '2019-08-20 19:22:44', 'collect', '2019-08-20 19:22:44', 'collect');
INSERT INTO `sys_user` VALUES ('18560292197', null, null, null, '18560292197', '韩先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18560292197', null, null, '2019-08-20 19:22:44', 'collect', '2019-08-20 19:22:44', 'collect');
INSERT INTO `sys_user` VALUES ('15613685361', null, null, null, '15613685361', '张经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0316-5960062', '15613685361', null, null, '2019-08-20 19:22:44', 'collect', '2019-08-20 19:22:44', 'collect');
INSERT INTO `sys_user` VALUES ('15570898446', null, null, null, '15570898446', '陈先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-88627077', '15570898446', null, null, '2019-08-20 19:22:44', 'collect', '2019-08-20 19:22:44', 'collect');
INSERT INTO `sys_user` VALUES ('18805365955', null, null, null, '18805365955', '南经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-2875955', '18805365955', null, null, '2019-08-20 19:22:44', 'collect', '2019-08-20 19:22:44', 'collect');
INSERT INTO `sys_user` VALUES ('18930968126', null, null, null, '18930968126', '卜二侠', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-37694976', '18930968126', null, null, '2019-08-20 19:22:43', 'collect', '2019-08-20 19:22:43', 'collect');
INSERT INTO `sys_user` VALUES ('18537750850', null, null, null, '18537750850', '郭松伟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0377-63290690', '18537750850', null, null, '2019-08-20 19:22:43', 'collect', '2019-08-20 19:22:43', 'collect');
INSERT INTO `sys_user` VALUES ('13968948686', null, null, null, '13968948686', '陶小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0577-66998005', '13968948686', null, null, '2019-08-20 19:22:43', 'collect', '2019-08-20 19:22:43', 'collect');
INSERT INTO `sys_user` VALUES ('15073195572', null, null, null, '15073195572', '小邓', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85594258', '15073195572', null, null, '2019-08-20 19:22:43', 'collect', '2019-08-20 19:22:43', 'collect');
INSERT INTO `sys_user` VALUES ('13537413488', null, null, null, '13537413488', '孙中平', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0769-89783478', '13537413488', null, null, '2019-08-20 19:22:43', 'collect', '2019-08-20 19:22:43', 'collect');
INSERT INTO `sys_user` VALUES ('18253485377', null, null, null, '18253485377', '刘经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0534-8156821', '18253485377', null, null, '2019-08-20 19:22:43', 'collect', '2019-08-20 19:22:43', 'collect');
INSERT INTO `sys_user` VALUES ('18774019224', null, null, null, '18774019224', '周丹', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85261150', '18774019224', null, null, '2019-08-20 19:22:43', 'collect', '2019-08-20 19:22:43', 'collect');
INSERT INTO `sys_user` VALUES ('13582003001', null, null, null, '13582003001', '陈洪波', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-83038835', '13582003001', null, null, '2019-08-20 19:22:43', 'collect', '2019-08-20 19:22:43', 'collect');
INSERT INTO `sys_user` VALUES ('15902956918', null, null, null, '15902956918', '丛岩', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '29-81881211-105', '15902956918', null, null, '2019-08-20 19:22:43', 'collect', '2019-08-20 19:22:43', 'collect');
INSERT INTO `sys_user` VALUES ('13968983801', null, null, null, '13968983801', '叶志通', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0577-67316263', '13968983801', null, null, '2019-08-20 19:22:42', 'collect', '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_user` VALUES ('18067703039', null, null, null, '18067703039', '范红兰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0576-81712282', '18067703039', null, null, '2019-08-20 19:22:42', 'collect', '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_user` VALUES ('51985166906', null, null, null, '51985166906', '江金华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0519 85166906', '0519 85166906', null, null, '2019-08-20 19:22:42', 'collect', '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_user` VALUES ('13269868285', null, null, null, '13269868285', '焦广华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-4006-236-238', '13269868285', null, null, '2019-08-20 19:22:42', 'collect', '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_user` VALUES ('15318596287', null, null, null, '15318596287', '华仪', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '400-0998960', '15318596287', null, null, '2019-08-20 19:22:42', 'collect', '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_user` VALUES ('15320098357', null, null, null, '15320098357', '杨杰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15320098357', null, null, '2019-08-20 19:22:42', 'collect', '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_user` VALUES ('18242474111', null, null, null, '18242474111', '陈经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0415-3850156', '18242474111', null, null, '2019-08-20 19:22:42', 'collect', '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_user` VALUES ('18896781919', null, null, null, '18896781919', '刘振河', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0512-67774225', '18896781919', null, null, '2019-08-20 19:22:42', 'collect', '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_user` VALUES ('13556067492', null, null, null, '13556067492', '李小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-84412640', '13556067492', null, null, '2019-08-20 19:22:42', 'collect', '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_user` VALUES ('13911620734', null, null, null, '13911620734', '韩晶', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-80358012', '13911620734', null, null, '2019-08-20 19:22:42', 'collect', '2019-08-20 19:22:42', 'collect');
INSERT INTO `sys_user` VALUES ('13078508775', null, null, null, '13078508775', '潘绍兵', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0851-5981654', '13078508775', null, null, '2019-08-20 19:22:41', 'collect', '2019-08-20 19:22:41', 'collect');
INSERT INTO `sys_user` VALUES ('13758560961', null, null, null, '13758560961', '孟苗水', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0575-82913618', '13758560961', null, null, '2019-08-20 19:22:41', 'collect', '2019-08-20 19:22:41', 'collect');
INSERT INTO `sys_user` VALUES ('18605385506', null, null, null, '18605385506', '张民', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-5888891', '18605385506', null, null, '2019-08-20 19:22:39', 'collect', '2019-08-20 19:22:39', 'collect');
INSERT INTO `sys_user` VALUES ('15978164228', null, null, null, '15978164228', '肖传宝', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0771-4720170', '15978164228', null, null, '2019-08-20 19:22:39', 'collect', '2019-08-20 19:22:39', 'collect');
INSERT INTO `sys_user` VALUES ('18653868323', null, null, null, '18653868323', '赵静', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-8585977', '18653868323', null, null, '2019-08-20 19:22:39', 'collect', '2019-08-20 19:22:39', 'collect');
INSERT INTO `sys_user` VALUES ('13915513800', null, null, null, '13915513800', '黄永', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0512-68733420', '13915513800', null, null, '2019-08-20 19:22:38', 'collect', '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_user` VALUES ('18774983945', null, null, null, '18774983945', '彭小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-82698708', '18774983945', null, null, '2019-08-20 19:22:38', 'collect', '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_user` VALUES ('18762657563', null, null, null, '18762657563', '樊女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0510-68893601', '18762657563', null, null, '2019-08-20 19:22:38', 'collect', '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_user` VALUES ('15919418145', null, null, null, '15919418145', '江亲富', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-36823869', '15919418145', null, null, '2019-08-20 19:22:38', 'collect', '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_user` VALUES ('57463560698', null, null, null, '57463560698', '周浓加', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0574 63560698/63569978', '0574-63560698/63569978', null, null, '2019-08-20 19:22:38', 'collect', '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_user` VALUES ('18006653288', null, null, null, '18006653288', '黄共峰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0574 62606118', '18006653288', null, null, '2019-08-20 19:22:38', 'collect', '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_user` VALUES ('15339067761', null, null, null, '15339067761', '张艳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 029 85363878', '15339067761', null, null, '2019-08-20 19:22:38', 'collect', '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_user` VALUES ('13275890618', null, null, null, '13275890618', '郭先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '025-58869691', '13275890618', null, null, '2019-08-20 19:22:38', 'collect', '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_user` VALUES ('55039538953', null, null, null, '55039538953', '马秀梅', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0550 3951982/3953896', '0550-3953895/3953896', null, null, '2019-08-20 19:22:38', 'collect', '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_user` VALUES ('13523978012', null, null, null, '13523978012', '王总', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-89943139', '13523978012', null, null, '2019-08-20 19:22:38', 'collect', '2019-08-20 19:22:38', 'collect');
INSERT INTO `sys_user` VALUES ('18658217700', null, null, null, '18658217700', '王从金', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-22225509', '18658217700', null, null, '2019-08-20 19:22:37', 'collect', '2019-08-20 19:22:37', 'collect');
INSERT INTO `sys_user` VALUES ('18036952863', null, null, null, '18036952863', '霍奎', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0527-88018861', '18036952863', null, null, '2019-08-20 19:22:37', 'collect', '2019-08-20 19:22:37', 'collect');
INSERT INTO `sys_user` VALUES ('18600070290', null, null, null, '18600070290', '付生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-60701415', '18600070290', null, null, '2019-08-20 19:22:37', 'collect', '2019-08-20 19:22:37', 'collect');
INSERT INTO `sys_user` VALUES ('15872679556', null, null, null, '15872679556', '郑经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15872679556', null, null, '2019-08-20 19:22:36', 'collect', '2019-08-20 19:22:36', 'collect');
INSERT INTO `sys_user` VALUES ('15806820857', null, null, null, '15806820857', '李经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0534-2327360', '15806820857', null, null, '2019-08-20 19:22:36', 'collect', '2019-08-20 19:22:36', 'collect');
INSERT INTO `sys_user` VALUES ('15618856897', null, null, null, '15618856897', '王颖', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-50005945', '15618856897', null, null, '2019-08-20 19:21:52', 'collect', '2019-08-20 19:21:52', 'collect');
INSERT INTO `sys_user` VALUES ('13325888958', null, null, null, '13325888958', '陈莉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-62586288', '13325888958', null, null, '2019-08-20 19:21:52', 'collect', '2019-08-20 19:21:52', 'collect');
INSERT INTO `sys_user` VALUES ('15991665573', null, null, null, '15991665573', '罗时荣', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '029-86190709', '15991665573', null, null, '2019-08-20 19:21:51', 'collect', '2019-08-20 19:21:51', 'collect');
INSERT INTO `sys_user` VALUES ('13516974704', null, null, null, '13516974704', '李紫辉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '579-85199076', '13516974704', null, null, '2019-08-20 19:21:51', 'collect', '2019-08-20 19:21:51', 'collect');
INSERT INTO `sys_user` VALUES ('18610499588', null, null, null, '18610499588', '冯杰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-87608879/87608897', '18610499588', null, null, '2019-08-20 19:21:51', 'collect', '2019-08-20 19:21:51', 'collect');
INSERT INTO `sys_user` VALUES ('15300318813', null, null, null, '15300318813', '小卓', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-57184142', '15300318813', null, null, '2019-08-20 19:21:51', 'collect', '2019-08-20 19:21:51', 'collect');
INSERT INTO `sys_user` VALUES ('15968090937', null, null, null, '15968090937', '王磊', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-88285908', '15968090937', null, null, '2019-08-20 19:21:51', 'collect', '2019-08-20 19:21:51', 'collect');
INSERT INTO `sys_user` VALUES ('13382766789', null, null, null, '13382766789', '叶湘婷', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 025 58608216', '13382766789', null, null, '2019-08-20 19:21:51', 'collect', '2019-08-20 19:21:51', 'collect');
INSERT INTO `sys_user` VALUES ('15386413935', null, null, null, '15386413935', '曾女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-89879995', '15386413935', null, null, '2019-08-20 19:21:51', 'collect', '2019-08-20 19:21:51', 'collect');
INSERT INTO `sys_user` VALUES ('13710947230', null, null, null, '13710947230', '刘小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-22883140', '13710947230', null, null, '2019-08-20 19:21:50', 'collect', '2019-08-20 19:21:50', 'collect');
INSERT INTO `sys_user` VALUES ('18009915099', null, null, null, '18009915099', '商钊鑫', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0991-3388599', '18009915099', null, null, '2019-08-20 19:21:50', 'collect', '2019-08-20 19:21:50', 'collect');
INSERT INTO `sys_user` VALUES ('18764815899', null, null, null, '18764815899', '李斋', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-6227787', '18764815899', null, null, '2019-08-20 19:21:50', 'collect', '2019-08-20 19:21:50', 'collect');
INSERT INTO `sys_user` VALUES ('15869008826', null, null, null, '15869008826', '张朝东', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '571-88262130', '15869008826', null, null, '2019-08-20 19:21:50', 'collect', '2019-08-20 19:21:50', 'collect');
INSERT INTO `sys_user` VALUES ('18600627712', null, null, null, '18600627712', '宋昱', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0316-6192830', '18600627712', null, null, '2019-08-20 19:21:50', 'collect', '2019-08-20 19:21:50', 'collect');
INSERT INTO `sys_user` VALUES ('15874008397', null, null, null, '15874008397', '刘先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85263818', '15874008397', null, null, '2019-08-20 19:21:50', 'collect', '2019-08-20 19:21:50', 'collect');
INSERT INTO `sys_user` VALUES ('18795550155', null, null, null, '18795550155', '孙先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0518-85500650', '18795550155', null, null, '2019-08-20 19:21:49', 'collect', '2019-08-20 19:21:49', 'collect');
INSERT INTO `sys_user` VALUES ('15131845379', null, null, null, '15131845379', '张大恒', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-3839557', '15131845379', null, null, '2019-08-20 19:21:49', 'collect', '2019-08-20 19:21:49', 'collect');
INSERT INTO `sys_user` VALUES ('18711090564', null, null, null, '18711090564', '肖小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-89920469', '18711090564', null, null, '2019-08-20 19:21:49', 'collect', '2019-08-20 19:21:49', 'collect');
INSERT INTO `sys_user` VALUES ('18390836131', null, null, null, '18390836131', '彭洋', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18390836131', null, null, '2019-08-20 19:21:49', 'collect', '2019-08-20 19:21:49', 'collect');
INSERT INTO `sys_user` VALUES ('15225091521', null, null, null, '15225091521', '邱先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-69067102', '15225091521', null, null, '2019-08-20 19:21:49', 'collect', '2019-08-20 19:21:49', 'collect');
INSERT INTO `sys_user` VALUES ('13825155234', null, null, null, '13825155234', '田先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '400-82334825', '13825155234', null, null, '2019-08-20 19:21:48', 'collect', '2019-08-20 19:21:48', 'collect');
INSERT INTO `sys_user` VALUES ('13926517392', null, null, null, '13926517392', '李小姐价格', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-33560537', '13926517392', null, null, '2019-08-20 19:21:48', 'collect', '2019-08-20 19:21:48', 'collect');
INSERT INTO `sys_user` VALUES ('13354009743', null, null, null, '13354009743', '赵新城', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0411-39526786', '13354009743', null, null, '2019-08-20 19:21:48', 'collect', '2019-08-20 19:21:48', 'collect');
INSERT INTO `sys_user` VALUES ('13701236309', null, null, null, '13701236309', '白经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-52882601', '13701236309', null, null, '2019-08-20 19:21:47', 'collect', '2019-08-20 19:21:47', 'collect');
INSERT INTO `sys_user` VALUES ('15263988298', null, null, null, '15263988298', '刘广彬', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0539-6173869', '15263988298', null, null, '2019-08-20 19:21:47', 'collect', '2019-08-20 19:21:47', 'collect');
INSERT INTO `sys_user` VALUES ('18098970189', null, null, null, '18098970189', '藏青', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-86570035', '18098970189', null, null, '2019-08-20 19:21:47', 'collect', '2019-08-20 19:21:47', 'collect');
INSERT INTO `sys_user` VALUES ('13953663388', null, null, null, '13953663388', '陈树伟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-3280899', '13953663388', null, null, '2019-08-20 19:21:47', 'collect', '2019-08-20 19:21:47', 'collect');
INSERT INTO `sys_user` VALUES ('13263494981', null, null, null, '13263494981', '李鸣', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13263494981', null, null, '2019-08-20 19:21:47', 'collect', '2019-08-20 19:21:47', 'collect');
INSERT INTO `sys_user` VALUES ('18769705248', null, null, null, '18769705248', '张涛', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-88999253', '18769705248', null, null, '2019-08-20 19:21:47', 'collect', '2019-08-20 19:21:47', 'collect');
INSERT INTO `sys_user` VALUES ('13791777025', null, null, null, '13791777025', '刘经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0537-2789971', '13791777025', null, null, '2019-08-20 19:21:47', 'collect', '2019-08-20 19:21:47', 'collect');
INSERT INTO `sys_user` VALUES ('18390972823', null, null, null, '18390972823', '文小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85531110', '18390972823', null, null, '2019-08-20 19:21:46', 'collect', '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_user` VALUES ('13864197079', null, null, null, '13864197079', '李萍', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13864197079', null, null, '2019-08-20 19:21:46', 'collect', '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_user` VALUES ('17753203092', null, null, null, '17753203092', '谭女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0532-00000000', '17753203092', null, null, '2019-08-20 19:21:46', 'collect', '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_user` VALUES ('13566615922', null, null, null, '13566615922', '周利亮', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13566615922', null, null, '2019-08-20 19:21:46', 'collect', '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_user` VALUES ('15753841739', null, null, null, '15753841739', '范学娜', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-8080868', '15753841739', null, null, '2019-08-20 19:21:46', 'collect', '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_user` VALUES ('13703215959', null, null, null, '13703215959', '彭文理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-88669968', '13703215959', null, null, '2019-08-20 19:21:46', 'collect', '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_user` VALUES ('13660226096', null, null, null, '13660226096', '何生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-84712186', '13660226096', null, null, '2019-08-20 19:21:46', 'collect', '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_user` VALUES ('18684878985', null, null, null, '18684878985', '杨先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-89916976', '18684878985', null, null, '2019-08-20 19:21:46', 'collect', '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_user` VALUES ('18108415046', null, null, null, '18108415046', '吉先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-84202401', '18108415046', null, null, '2019-08-20 19:21:46', 'collect', '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_user` VALUES ('13392767666', null, null, null, '13392767666', '陈良友', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0757-85553411', '13392767666', null, null, '2019-08-20 19:21:46', 'collect', '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_user` VALUES ('13827452029', null, null, null, '13827452029', '万志强', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-85280860', '13827452029', null, null, '2019-08-20 19:21:46', 'collect', '2019-08-20 19:21:46', 'collect');
INSERT INTO `sys_user` VALUES ('13625316474', null, null, null, '13625316474', '李慧', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-6822968', '13625316474', null, null, '2019-08-20 19:21:45', 'collect', '2019-08-20 19:21:45', 'collect');
INSERT INTO `sys_user` VALUES ('18011778966', null, null, null, '18011778966', '胡先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-37754806', '18011778966', null, null, '2019-08-20 19:21:45', 'collect', '2019-08-20 19:21:45', 'collect');
INSERT INTO `sys_user` VALUES ('13677360572', null, null, null, '13677360572', '肖小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-82698728', '13677360572', null, null, '2019-08-20 19:21:44', 'collect', '2019-08-20 19:21:44', 'collect');
INSERT INTO `sys_user` VALUES ('15158413926', null, null, null, '15158413926', '李聪', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0730-7638524', '15158413926', null, null, '2019-08-20 19:21:44', 'collect', '2019-08-20 19:21:44', 'collect');
INSERT INTO `sys_user` VALUES ('18036288553', null, null, null, '18036288553', '蔡婉婷', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0515-80693777', '18036288553', null, null, '2019-08-20 19:21:44', 'collect', '2019-08-20 19:21:44', 'collect');
INSERT INTO `sys_user` VALUES ('13361011596', null, null, null, '13361011596', '张善伦', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-87510628', '13361011596', null, null, '2019-08-20 19:21:44', 'collect', '2019-08-20 19:21:44', 'collect');
INSERT INTO `sys_user` VALUES ('13957853910', null, null, null, '13957853910', '李家顶', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-88006003/88440229', '13957853910', null, null, '2019-08-20 19:21:44', 'collect', '2019-08-20 19:21:44', 'collect');
INSERT INTO `sys_user` VALUES ('15374051070', null, null, null, '15374051070', '洪诗福', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-38325419', '15374051070', null, null, '2019-08-20 19:21:43', 'collect', '2019-08-20 19:21:43', 'collect');
INSERT INTO `sys_user` VALUES ('18569072902', null, null, null, '18569072902', '李经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18569072902', null, null, '2019-08-20 19:21:43', 'collect', '2019-08-20 19:21:43', 'collect');
INSERT INTO `sys_user` VALUES ('13731151203', null, null, null, '13731151203', '刘志峰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-86681889', '13731151203', null, null, '2019-08-20 19:21:43', 'collect', '2019-08-20 19:21:43', 'collect');
INSERT INTO `sys_user` VALUES ('18351385817', null, null, null, '18351385817', '黄丽春', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 021 60794233', '18351385817', null, null, '2019-08-20 19:21:43', 'collect', '2019-08-20 19:21:43', 'collect');
INSERT INTO `sys_user` VALUES ('18810290667', null, null, null, '18810290667', '齐亚勋', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-69411710', '18810290667', null, null, '2019-08-20 19:21:43', 'collect', '2019-08-20 19:21:43', 'collect');
INSERT INTO `sys_user` VALUES ('15065098086', null, null, null, '15065098086', '袁经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15065098086', null, null, '2019-08-20 19:21:43', 'collect', '2019-08-20 19:21:43', 'collect');
INSERT INTO `sys_user` VALUES ('15365791220', null, null, null, '15365791220', '左武霞', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15365791220', null, null, '2019-08-20 19:21:43', 'collect', '2019-08-20 19:21:43', 'collect');
INSERT INTO `sys_user` VALUES ('18968806955', null, null, null, '18968806955', '金寅', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0577-67110966', '18968806955', null, null, '2019-08-20 19:21:43', 'collect', '2019-08-20 19:21:43', 'collect');
INSERT INTO `sys_user` VALUES ('13332099898', null, null, null, '13332099898', '蔡松', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-88829221', '13332099898', null, null, '2019-08-20 19:21:43', 'collect', '2019-08-20 19:21:43', 'collect');
INSERT INTO `sys_user` VALUES ('18971536297', null, null, null, '18971536297', '汪林', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '027-86976669', '18971536297', null, null, '2019-08-20 19:21:42', 'collect', '2019-08-20 19:21:42', 'collect');
INSERT INTO `sys_user` VALUES ('13601296863', null, null, null, '13601296863', '姚经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '13601296863', '13601296863', null, null, '2019-08-20 19:21:42', 'collect', '2019-08-20 19:21:42', 'collect');
INSERT INTO `sys_user` VALUES ('18773111062', null, null, null, '18773111062', '唐小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-89920489', '18773111062', null, null, '2019-08-20 19:21:42', 'collect', '2019-08-20 19:21:42', 'collect');
INSERT INTO `sys_user` VALUES ('13802587322', null, null, null, '13802587322', '洪应平', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-84861515', '13802587322', null, null, '2019-08-20 19:21:42', 'collect', '2019-08-20 19:21:42', 'collect');
INSERT INTO `sys_user` VALUES ('13676703153', null, null, null, '13676703153', '吴建军', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13676703153', null, null, '2019-08-20 19:21:42', 'collect', '2019-08-20 19:21:42', 'collect');
INSERT INTO `sys_user` VALUES ('13388802258', null, null, null, '13388802258', '王丰武', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0871-64581468', '13388802258', null, null, '2019-08-20 19:21:42', 'collect', '2019-08-20 19:21:42', 'collect');
INSERT INTO `sys_user` VALUES ('17800219883', null, null, null, '17800219883', '李超', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-89423503', '17800219883', null, null, '2019-08-20 19:21:42', 'collect', '2019-08-20 19:21:42', 'collect');
INSERT INTO `sys_user` VALUES ('13302155762', null, null, null, '13302155762', '赵先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13302155762', null, null, '2019-08-20 19:21:42', 'collect', '2019-08-20 19:21:42', 'collect');
INSERT INTO `sys_user` VALUES ('13583803781', null, null, null, '13583803781', '李经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '13583803781', '13583803781', null, null, '2019-08-20 19:21:41', 'collect', '2019-08-20 19:21:41', 'collect');
INSERT INTO `sys_user` VALUES ('18962694313', null, null, null, '18962694313', '洪开荒', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0512-57310619', '18962694313', null, null, '2019-08-20 19:21:41', 'collect', '2019-08-20 19:21:41', 'collect');
INSERT INTO `sys_user` VALUES ('18684870588', null, null, null, '18684870588', '唐先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-82519733', '18684870588', null, null, '2019-08-20 19:21:41', 'collect', '2019-08-20 19:21:41', 'collect');
INSERT INTO `sys_user` VALUES ('13636404042', null, null, null, '13636404042', '洪礼旭', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 021 50856879', '13636404042', null, null, '2019-08-20 19:21:41', 'collect', '2019-08-20 19:21:41', 'collect');
INSERT INTO `sys_user` VALUES ('13562678195', null, null, null, '13562678195', '王淑静', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-3297589', '13562678195', null, null, '2019-08-20 19:21:40', 'collect', '2019-08-20 19:21:40', 'collect');
INSERT INTO `sys_user` VALUES ('18508435814', null, null, null, '18508435814', '付德明', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18508435814', null, null, '2019-08-20 19:21:40', 'collect', '2019-08-20 19:21:40', 'collect');
INSERT INTO `sys_user` VALUES ('18390904696', null, null, null, '18390904696', '贺水银', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85224861', '18390904696', null, null, '2019-08-20 19:21:40', 'collect', '2019-08-20 19:21:40', 'collect');
INSERT INTO `sys_user` VALUES ('13632188758', null, null, null, '13632188758', '张天泽', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-29038187', '13632188758', null, null, '2019-08-20 19:21:40', 'collect', '2019-08-20 19:21:40', 'collect');
INSERT INTO `sys_user` VALUES ('15074019153', null, null, null, '15074019153', '袁经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0730-6221551', '15074019153', null, null, '2019-08-20 19:21:40', 'collect', '2019-08-20 19:21:40', 'collect');
INSERT INTO `sys_user` VALUES ('18116155126', null, null, null, '18116155126', '陈允浩', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-57660798', '18116155126', null, null, '2019-08-20 19:21:40', 'collect', '2019-08-20 19:21:40', 'collect');
INSERT INTO `sys_user` VALUES ('18105116620', null, null, null, '18105116620', '张红婷', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18105116620', null, null, '2019-08-20 19:21:39', 'collect', '2019-08-20 19:21:39', 'collect');
INSERT INTO `sys_user` VALUES ('13901749702', null, null, null, '13901749702', '顾志奇', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-58591877', '13901749702', null, null, '2019-08-20 19:21:39', 'collect', '2019-08-20 19:21:39', 'collect');
INSERT INTO `sys_user` VALUES ('13816209150', null, null, null, '13816209150', '郁华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-61128126/4000580288', '13816209150', null, null, '2019-08-20 19:21:39', 'collect', '2019-08-20 19:21:39', 'collect');
INSERT INTO `sys_user` VALUES ('15200819689', null, null, null, '15200819689', '曾惠娟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15200819689', null, null, '2019-08-20 19:21:39', 'collect', '2019-08-20 19:21:39', 'collect');
INSERT INTO `sys_user` VALUES ('15281087241', null, null, null, '15281087241', '孙先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '028-61298077', '15281087241', null, null, '2019-08-20 19:21:39', 'collect', '2019-08-20 19:21:39', 'collect');
INSERT INTO `sys_user` VALUES ('13055152352', null, null, null, '13055152352', '何桂秋', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-58639526', '13055152352', null, null, '2019-08-20 19:21:39', 'collect', '2019-08-20 19:21:39', 'collect');
INSERT INTO `sys_user` VALUES ('13183233732', null, null, null, '13183233732', '王一翔', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0394-6859002', '13183233732', null, null, '2019-08-20 19:21:39', 'collect', '2019-08-20 19:21:39', 'collect');
INSERT INTO `sys_user` VALUES ('13530311890', null, null, null, '13530311890', '莫一峰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-86114728', '13530311890', null, null, '2019-08-20 19:21:38', 'collect', '2019-08-20 19:21:38', 'collect');
INSERT INTO `sys_user` VALUES ('13816844217', null, null, null, '13816844217', '姚玉桥', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-61014305', '13816844217', null, null, '2019-08-20 19:21:38', 'collect', '2019-08-20 19:21:38', 'collect');
INSERT INTO `sys_user` VALUES ('18810290193', null, null, null, '18810290193', '王宏未', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18810290193', null, null, '2019-08-20 19:21:35', 'collect', '2019-08-20 19:21:35', 'collect');
INSERT INTO `sys_user` VALUES ('18634412729', null, null, null, '18634412729', '马经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0351-6696110', '18634412729', null, null, '2019-08-20 19:21:35', 'collect', '2019-08-20 19:21:35', 'collect');
INSERT INTO `sys_user` VALUES ('17708458503', null, null, null, '17708458503', '毛绵', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-82244988', '17708458503', null, null, '2019-08-20 19:21:35', 'collect', '2019-08-20 19:21:35', 'collect');
INSERT INTO `sys_user` VALUES ('18605334908', null, null, null, '18605334908', '于瀚晨', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0533-4180950/4112333/4230718', '18605334908', null, null, '2019-08-20 19:21:35', 'collect', '2019-08-20 19:21:35', 'collect');
INSERT INTO `sys_user` VALUES ('13679083094', null, null, null, '13679083094', '张德威', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '028-87384909', '13679083094', null, null, '2019-08-20 19:21:35', 'collect', '2019-08-20 19:21:35', 'collect');
INSERT INTO `sys_user` VALUES ('13939028007', null, null, null, '13939028007', '李先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13939028007', null, null, '2019-08-20 19:21:34', 'collect', '2019-08-20 19:21:34', 'collect');
INSERT INTO `sys_user` VALUES ('13022390261', null, null, null, '13022390261', '张经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '023-67609528', '13022390261', null, null, '2019-08-20 19:21:34', 'collect', '2019-08-20 19:21:34', 'collect');
INSERT INTO `sys_user` VALUES ('13965853983', null, null, null, '13965853983', '杨志永', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0561-2133418', '13965853983', null, null, '2019-08-20 19:21:34', 'collect', '2019-08-20 19:21:34', 'collect');
INSERT INTO `sys_user` VALUES ('18608408680', null, null, null, '18608408680', '邓波', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-86453295', '18608408680', null, null, '2019-08-20 19:21:34', 'collect', '2019-08-20 19:21:34', 'collect');
INSERT INTO `sys_user` VALUES ('18653802335', null, null, null, '18653802335', '王聪', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-6525588', '18653802335', null, null, '2019-08-20 19:21:34', 'collect', '2019-08-20 19:21:34', 'collect');
INSERT INTO `sys_user` VALUES ('15111020266', null, null, null, '15111020266', '杨琳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-7631623', '15111020266', null, null, '2019-08-20 19:06:50', 'collect', '2019-08-20 19:06:50', 'collect');
INSERT INTO `sys_user` VALUES ('15070857785', null, null, null, '15070857785', '杨少辉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0791-87086606', '15070857785', null, null, '2019-08-20 19:06:50', 'collect', '2019-08-20 19:06:50', 'collect');
INSERT INTO `sys_user` VALUES ('15916204197', null, null, null, '15916204197', '宋云霞', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0756-2119980/6100028', '15916204197', null, null, '2019-08-20 19:06:49', 'collect', '2019-08-20 19:06:49', 'collect');
INSERT INTO `sys_user` VALUES ('57462352988', null, null, null, '57462352988', '黄共峰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0574 62510811/13705842958', '574-62352988/13705842958', null, null, '2019-08-20 19:06:49', 'collect', '2019-08-20 19:06:49', 'collect');
INSERT INTO `sys_user` VALUES ('13592717028', null, null, null, '13592717028', '黄柏坚', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0769-81180298', '13592717028', null, null, '2019-08-20 19:06:49', 'collect', '2019-08-20 19:06:49', 'collect');
INSERT INTO `sys_user` VALUES ('13728700481', null, null, null, '13728700481', '颜贵双', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-32891512', '13728700481', null, null, '2019-08-20 19:06:49', 'collect', '2019-08-20 19:06:49', 'collect');
INSERT INTO `sys_user` VALUES ('15957888696', null, null, null, '15957888696', '史海宇', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-63578392', '15957888696', null, null, '2019-08-20 18:47:39', 'collect', '2019-08-20 18:47:39', 'collect');
INSERT INTO `sys_user` VALUES ('15725420180', null, null, null, '15725420180', '李建伟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0532-86889943', '15725420180', null, null, '2019-08-20 18:47:39', 'collect', '2019-08-20 18:47:39', 'collect');
INSERT INTO `sys_user` VALUES ('15802197345', null, null, null, '15802197345', '于先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-61550462', '15802197345', null, null, '2019-08-20 18:47:39', 'collect', '2019-08-20 18:47:39', 'collect');
INSERT INTO `sys_user` VALUES ('15550018759', null, null, null, '15550018759', '杨钦燕', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-62327076', '15550018759', null, null, '2019-08-20 18:47:39', 'collect', '2019-08-20 18:47:39', 'collect');
INSERT INTO `sys_user` VALUES ('15382389008', null, null, null, '15382389008', '凌小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0571-86054253', '15382389008', null, null, '2019-08-20 18:47:38', 'collect', '2019-08-20 18:47:38', 'collect');
INSERT INTO `sys_user` VALUES ('18916136128', null, null, null, '18916136128', '郑玲', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-36621722', '18916136128', null, null, '2019-08-20 18:47:38', 'collect', '2019-08-20 18:47:38', 'collect');
INSERT INTO `sys_user` VALUES ('15922250295', null, null, null, '15922250295', '于纪强', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-84811835', '15922250295', null, null, '2019-08-20 18:47:38', 'collect', '2019-08-20 18:47:38', 'collect');
INSERT INTO `sys_user` VALUES ('13676588960', null, null, null, '13676588960', '叶志通', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13676588960', null, null, '2019-08-20 18:24:18', 'collect', '2019-08-20 18:24:18', 'collect');
INSERT INTO `sys_user` VALUES ('13278894986', null, null, null, '13278894986', '郭先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-88577004', '13278894986', null, null, '2019-08-20 18:24:18', 'collect', '2019-08-20 18:24:18', 'collect');
INSERT INTO `sys_user` VALUES ('13766392823', null, null, null, '13766392823', '陈金国', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0797-8487652', '13766392823', null, null, '2019-08-20 18:24:18', 'collect', '2019-08-20 18:24:18', 'collect');
INSERT INTO `sys_user` VALUES ('13706742408', null, null, null, '13706742408', '陈再清', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '574-63578285', '13706742408', null, null, '2019-08-20 18:24:18', 'collect', '2019-08-20 18:24:18', 'collect');
INSERT INTO `sys_user` VALUES ('15153988355', null, null, null, '15153988355', '杨东', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0539-2933676/2933677/2933678', '15153988355', null, null, '2019-08-20 18:24:18', 'collect', '2019-08-20 18:24:18', 'collect');
INSERT INTO `sys_user` VALUES ('18977113697', null, null, null, '18977113697', '林林', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18977113697', null, null, '2019-08-20 18:24:18', 'collect', '2019-08-20 18:24:18', 'collect');
INSERT INTO `sys_user` VALUES ('13721101344', null, null, null, '13721101344', '小徐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0551-66010992', '13721101344', null, null, '2019-08-20 18:24:18', 'collect', '2019-08-20 18:24:18', 'collect');
INSERT INTO `sys_user` VALUES ('13837267628', null, null, null, '13837267628', '陈经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0372-3302206', '13837267628', null, null, '2019-08-20 18:24:17', 'collect', '2019-08-20 18:24:17', 'collect');
INSERT INTO `sys_user` VALUES ('13667396263', null, null, null, '13667396263', '向香', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13667396263', null, null, '2019-08-20 18:24:16', 'collect', '2019-08-20 18:24:16', 'collect');
INSERT INTO `sys_user` VALUES ('18602688560', null, null, null, '18602688560', '张亮', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-27698160', '18602688560', null, null, '2019-08-20 18:24:16', 'collect', '2019-08-20 18:24:16', 'collect');
INSERT INTO `sys_user` VALUES ('15865252918', null, null, null, '15865252918', '薄峰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-88083079', '15865252918', null, null, '2019-08-20 18:24:16', 'collect', '2019-08-20 18:24:16', 'collect');
INSERT INTO `sys_user` VALUES ('15988865996', null, null, null, '15988865996', '洪旗伟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0571 85562666', '15988865996', null, null, '2019-08-20 18:24:15', 'collect', '2019-08-20 18:24:15', 'collect');
INSERT INTO `sys_user` VALUES ('07352331960', null, null, null, '07352331960', '肖德松', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0735 2331960', '0735 2331960', null, null, '2019-08-20 18:24:15', 'collect', '2019-08-20 18:24:15', 'collect');
INSERT INTO `sys_user` VALUES ('15258107057', null, null, null, '15258107057', '童松康', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-87577577', '15258107057', null, null, '2019-08-20 18:24:15', 'collect', '2019-08-20 18:24:15', 'collect');
INSERT INTO `sys_user` VALUES ('15970780712', null, null, null, '15970780712', '陈清楚', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0797-7098073', '15970780712', null, null, '2019-08-20 18:24:15', 'collect', '2019-08-20 18:24:15', 'collect');
INSERT INTO `sys_user` VALUES ('18222758872', null, null, null, '18222758872', '李玉春', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-87170062', '18222758872', null, null, '2019-08-20 18:24:15', 'collect', '2019-08-20 18:24:15', 'collect');
INSERT INTO `sys_user` VALUES ('18229878270', null, null, null, '18229878270', '唐小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85235418', '18229878270', null, null, '2019-08-20 18:24:15', 'collect', '2019-08-20 18:24:15', 'collect');
INSERT INTO `sys_user` VALUES ('13901785658', null, null, null, '13901785658', '陈忠孝', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-57774222-627', '13901785658', null, null, '2019-08-20 18:24:15', 'collect', '2019-08-20 18:24:15', 'collect');
INSERT INTO `sys_user` VALUES ('18068883691', null, null, null, '18068883691', '夏丽君', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0515-80610199', '18068883691', null, null, '2019-08-20 18:24:14', 'collect', '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_user` VALUES ('13755139155', null, null, null, '13755139155', '王经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85315513', '13755139155', null, null, '2019-08-20 18:24:14', 'collect', '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_user` VALUES ('15575800043', null, null, null, '15575800043', '付工', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-88032912', '15575800043', null, null, '2019-08-20 18:24:14', 'collect', '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_user` VALUES ('13732202800', null, null, null, '13732202800', '曾保华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0571-86433485', '13732202800', null, null, '2019-08-20 18:24:14', 'collect', '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_user` VALUES ('13932155818', null, null, null, '13932155818', '彭伟伟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-67795778', '13932155818', null, null, '2019-08-20 18:24:14', 'collect', '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_user` VALUES ('15077144449', null, null, null, '15077144449', '李保军', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0771-6769597', '15077144449', null, null, '2019-08-20 18:24:14', 'collect', '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_user` VALUES ('13466745994', null, null, null, '13466745994', '孔先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-52882601', '13466745994', null, null, '2019-08-20 18:24:14', 'collect', '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_user` VALUES ('18073139090', null, null, null, '18073139090', '唐午', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-89822820', '18073139090', null, null, '2019-08-20 18:24:14', 'collect', '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_user` VALUES ('15814048070', null, null, null, '15814048070', '宣秀红', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-26500708', '15814048070', null, null, '2019-08-20 18:24:14', 'collect', '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_user` VALUES ('15303376677', null, null, null, '15303376677', '李先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0317-8182299', '15303376677', null, null, '2019-08-20 18:24:14', 'collect', '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_user` VALUES ('18749093311', null, null, null, '18749093311', '刘磊', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0132-71390566', '18749093311', null, null, '2019-08-20 18:24:14', 'collect', '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_user` VALUES ('18631895108', null, null, null, '18631895108', '于红', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-3835366', '18631895108', null, null, '2019-08-20 18:24:14', 'collect', '2019-08-20 18:24:14', 'collect');
INSERT INTO `sys_user` VALUES ('13811593954', null, null, null, '13811593954', '李思敬', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '10-65735962', '13811593954', null, null, '2019-08-20 18:24:13', 'collect', '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_user` VALUES ('13256553125', null, null, null, '13256553125', '李龙文', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0539-8288390', '13256553125', null, null, '2019-08-20 18:24:13', 'collect', '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_user` VALUES ('13917197912', null, null, null, '13917197912', '孟庆峰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '139-17197912', '13917197912', null, null, '2019-08-20 18:24:13', 'collect', '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_user` VALUES ('13925158862', null, null, null, '13925158862', '邹沁格', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-22863315', '13925158862', null, null, '2019-08-20 18:24:13', 'collect', '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_user` VALUES ('13524171112', null, null, null, '13524171112', '谈勇', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 021 56610210', '13524171112', null, null, '2019-08-20 18:24:13', 'collect', '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_user` VALUES ('13606743158', null, null, null, '13606743158', '周加明', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '574-63682001', '13606743158', null, null, '2019-08-20 18:24:13', 'collect', '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_user` VALUES ('13810395332', null, null, null, '13810395332', '冯先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-13810395-332', '13810395332', null, null, '2019-08-20 18:24:13', 'collect', '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_user` VALUES ('18036286369', null, null, null, '18036286369', '刘晓娟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0515-80693555', '18036286369', null, null, '2019-08-20 18:24:13', 'collect', '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_user` VALUES ('15614310947', null, null, null, '15614310947', '赵女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-85559890', '15614310947', null, null, '2019-08-20 18:24:13', 'collect', '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_user` VALUES ('18868682147', null, null, null, '18868682147', '施金瑛', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-63674258', '18868682147', null, null, '2019-08-20 18:24:13', 'collect', '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_user` VALUES ('13910862877', null, null, null, '13910862877', '朱东力', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '10-400-623-623-8', '13910862877', null, null, '2019-08-20 18:24:13', 'collect', '2019-08-20 18:24:13', 'collect');
INSERT INTO `sys_user` VALUES ('13241985257', null, null, null, '13241985257', '孙江', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-52458233', '13241985257', null, null, '2019-08-20 18:24:12', 'collect', '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_user` VALUES ('15274995007', null, null, null, '15274995007', '刘小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85575748', '15274995007', null, null, '2019-08-20 18:24:12', 'collect', '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_user` VALUES ('15399982057', null, null, null, '15399982057', '金先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-89703115', '15399982057', null, null, '2019-08-20 18:24:12', 'collect', '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_user` VALUES ('15531383238', null, null, null, '15531383238', '杨先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15531383238', null, null, '2019-08-20 18:24:12', 'collect', '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_user` VALUES ('15053857678', null, null, null, '15053857678', '李伟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15053857678', null, null, '2019-08-20 18:24:12', 'collect', '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_user` VALUES ('18673533227', null, null, null, '18673533227', '黄新星', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0735-8673281', '18673533227', null, null, '2019-08-20 18:24:12', 'collect', '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_user` VALUES ('15011776479', null, null, null, '15011776479', '卓文枝', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0757-15011776479', '15011776479', null, null, '2019-08-20 18:24:12', 'collect', '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_user` VALUES ('15318568033', null, null, null, '15318568033', '李龙文', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0539-8288390', '15318568033', null, null, '2019-08-20 18:24:12', 'collect', '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_user` VALUES ('13632428828', null, null, null, '13632428828', '卓森岩', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 020 61133128', '13632428828', null, null, '2019-08-20 18:24:12', 'collect', '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_user` VALUES ('13671536383', null, null, null, '13671536383', '高子龙', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-61920533', '13671536383', null, null, '2019-08-20 18:24:12', 'collect', '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_user` VALUES ('13932226413', null, null, null, '13932226413', '周建光', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0312 8778011', '13932226413', null, null, '2019-08-20 18:24:12', 'collect', '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_user` VALUES ('13623883474', null, null, null, '13623883474', '董经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0379-65823690', '13623883474', null, null, '2019-08-20 18:24:12', 'collect', '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_user` VALUES ('18036289030', null, null, null, '18036289030', '臧先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18036289030', null, null, '2019-08-20 18:24:12', 'collect', '2019-08-20 18:24:12', 'collect');
INSERT INTO `sys_user` VALUES ('18711078393', null, null, null, '18711078393', '曾小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85235418', '18711078393', null, null, '2019-08-20 18:24:11', 'collect', '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_user` VALUES ('13057783910', null, null, null, '13057783910', '秦晓果', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-13057783910', '13057783910', null, null, '2019-08-20 18:24:11', 'collect', '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_user` VALUES ('13603037344', null, null, null, '13603037344', '任祥勇', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-26460430', '13603037344', null, null, '2019-08-20 18:24:11', 'collect', '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_user` VALUES ('18229872287', null, null, null, '18229872287', '尹思思', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85234418', '18229872287', null, null, '2019-08-20 18:24:11', 'collect', '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_user` VALUES ('18508477249', null, null, null, '18508477249', '张小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85235418', '18508477249', null, null, '2019-08-20 18:24:11', 'collect', '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_user` VALUES ('57463578768', null, null, null, '57463578768', '吴威威', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-63578768', '0574-63578768', null, null, '2019-08-20 18:24:11', 'collect', '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_user` VALUES ('13809236685', null, null, null, '13809236685', '蔡细黑', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0756-3631152', '13809236685', null, null, '2019-08-20 18:24:11', 'collect', '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_user` VALUES ('15810308927', null, null, null, '15810308927', '赵燕华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '01069414068', '15810308927', null, null, '2019-08-20 18:24:11', 'collect', '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_user` VALUES ('18765275999', null, null, null, '18765275999', '张金杰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0532-87938248', '18765275999', null, null, '2019-08-20 18:24:11', 'collect', '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_user` VALUES ('13506395998', null, null, null, '13506395998', '吴明欺', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0532-66911751', '13506395998', null, null, '2019-08-20 18:24:11', 'collect', '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_user` VALUES ('13805819459', null, null, null, '13805819459', '徐佰达', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-63579975', '13805819459', null, null, '2019-08-20 18:24:11', 'collect', '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_user` VALUES ('15999808957', null, null, null, '15999808957', '郑春梅', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0769-22469309', '15999808957', null, null, '2019-08-20 18:24:11', 'collect', '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_user` VALUES ('02156957466', null, null, null, '02156957466', '石加荣', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 021 56957466', '021 56957466', null, null, '2019-08-20 18:24:11', 'collect', '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_user` VALUES ('79186515364', null, null, null, '79186515364', '张定弘', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0791 86515364', '0791 86515364', null, null, '2019-08-20 18:24:11', 'collect', '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_user` VALUES ('18900732505', null, null, null, '18900732505', '苏基锐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-84458533', '18900732505', null, null, '2019-08-20 18:24:11', 'collect', '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_user` VALUES ('13906743963', null, null, null, '13906743963', '张建冲', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-63575173', '13906743963', null, null, '2019-08-20 18:24:11', 'collect', '2019-08-20 18:24:11', 'collect');
INSERT INTO `sys_user` VALUES ('15869739623', null, null, null, '15869739623', '刘先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-89740696', '15869739623', null, null, '2019-08-20 18:24:08', 'collect', '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_user` VALUES ('13305912628', null, null, null, '13305912628', '刘英', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0591-87879565', '13305912628', null, null, '2019-08-20 18:24:08', 'collect', '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_user` VALUES ('18774937497', null, null, null, '18774937497', '朱思诗', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85234418', '18774937497', null, null, '2019-08-20 18:24:08', 'collect', '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_user` VALUES ('18621747778', null, null, null, '18621747778', '黄芳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-51036470', '18621747778', null, null, '2019-08-20 18:24:08', 'collect', '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_user` VALUES ('13727262669', null, null, null, '13727262669', '邓志东', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0758 8322286', '13727262669', null, null, '2019-08-20 18:24:08', 'collect', '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_user` VALUES ('18701502378', null, null, null, '18701502378', '唐翠琴经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-69414068', '18701502378', null, null, '2019-08-20 18:24:08', 'collect', '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_user` VALUES ('13732107323', null, null, null, '13732107323', '黄俊霞', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '574-63688300-8000', '13732107323', null, null, '2019-08-20 18:24:08', 'collect', '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_user` VALUES ('18601781747', null, null, null, '18601781747', '陈先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-61555895', '18601781747', null, null, '2019-08-20 18:24:08', 'collect', '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_user` VALUES ('18991768277', null, null, null, '18991768277', '秦毅', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0917-3155887', '18991768277', null, null, '2019-08-20 18:24:08', 'collect', '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_user` VALUES ('13460778000', null, null, null, '13460778000', '周涛', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-23623377', '13460778000', null, null, '2019-08-20 18:24:08', 'collect', '2019-08-20 18:24:08', 'collect');
INSERT INTO `sys_user` VALUES ('13777007634', null, null, null, '13777007634', '严小君', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-88285388', '13777007634', null, null, '2019-08-20 18:24:07', 'collect', '2019-08-20 18:24:07', 'collect');
INSERT INTO `sys_user` VALUES ('53981212181', null, null, null, '53981212181', '臧艳丽', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0539 8121218/18553905120', '0539 8121218/18553905120', null, null, '2019-08-20 18:24:07', 'collect', '2019-08-20 18:24:07', 'collect');
INSERT INTO `sys_user` VALUES ('13456188338', null, null, null, '13456188338', '戎彪', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-23696868/23667888', '13456188338', null, null, '2019-08-20 18:24:07', 'collect', '2019-08-20 18:24:07', 'collect');
INSERT INTO `sys_user` VALUES ('13811490810', null, null, null, '13811490810', '姚经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-52882600', '13811490810', null, null, '2019-08-20 18:24:07', 'collect', '2019-08-20 18:24:07', 'collect');
INSERT INTO `sys_user` VALUES ('15890991858', null, null, null, '15890991858', '陈新成', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-22198886', '15890991858', null, null, '2019-08-20 18:24:07', 'collect', '2019-08-20 18:24:07', 'collect');
INSERT INTO `sys_user` VALUES ('18688818767', null, null, null, '18688818767', '秦国亮', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0769-88036161', '18688818767', null, null, '2019-08-20 18:24:07', 'collect', '2019-08-20 18:24:07', 'collect');
INSERT INTO `sys_user` VALUES ('13335063019', null, null, null, '13335063019', '王存栋', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0532-87677566', '13335063019', null, null, '2019-08-20 18:24:07', 'collect', '2019-08-20 18:24:07', 'collect');
INSERT INTO `sys_user` VALUES ('18975821068', null, null, null, '18975821068', '易工', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85534140', '18975821068', null, null, '2019-08-20 18:24:07', 'collect', '2019-08-20 18:24:07', 'collect');
INSERT INTO `sys_user` VALUES ('13586520837', null, null, null, '13586520837', '贺智', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-27820331', '13586520837', null, null, '2019-08-20 18:24:07', 'collect', '2019-08-20 18:24:07', 'collect');
INSERT INTO `sys_user` VALUES ('15837141151', null, null, null, '15837141151', '师鹏博', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-87090988', '15837141151', null, null, '2019-08-20 18:24:06', 'collect', '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_user` VALUES ('13513278598', null, null, null, '13513278598', '商在松', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13513278598', null, null, '2019-08-20 18:24:06', 'collect', '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_user` VALUES ('18210603867', null, null, null, '18210603867', '王慧', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18210603867', null, null, '2019-08-20 18:24:06', 'collect', '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_user` VALUES ('57757755597', null, null, null, '57757755597', '徐时建', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0577 67955718', '0577-57755597', null, null, '2019-08-20 18:24:06', 'collect', '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_user` VALUES ('13587977112', null, null, null, '13587977112', '陈文文', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0577-67982165', '13587977112', null, null, '2019-08-20 18:24:06', 'collect', '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_user` VALUES ('18039778129', null, null, null, '18039778129', '毛明来', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0599-5678000', '18039778129', null, null, '2019-08-20 18:24:06', 'collect', '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_user` VALUES ('13969950115', null, null, null, '13969950115', '姜杰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0539-7572888', '13969950115', null, null, '2019-08-20 18:24:06', 'collect', '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_user` VALUES ('15173164837', null, null, null, '15173164837', '赵女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-89876101', '15173164837', null, null, '2019-08-20 18:24:06', 'collect', '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_user` VALUES ('18229782903', null, null, null, '18229782903', '林风', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85235418', '18229782903', null, null, '2019-08-20 18:24:06', 'collect', '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_user` VALUES ('13241665069', null, null, null, '13241665069', '黄佳佳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-60369659', '13241665069', null, null, '2019-08-20 18:24:06', 'collect', '2019-08-20 18:24:06', 'collect');
INSERT INTO `sys_user` VALUES ('15863775288', null, null, null, '15863775288', '洪钦赐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-88611119', '15863775288', null, null, '2019-08-20 18:24:05', 'collect', '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_user` VALUES ('18905393769', null, null, null, '18905393769', '姜开存', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0539-8651708', '18905393769', null, null, '2019-08-20 18:24:05', 'collect', '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_user` VALUES ('13472517931', null, null, null, '13472517931', '罗中香', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13472517931', null, null, '2019-08-20 18:24:05', 'collect', '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_user` VALUES ('02034784556', null, null, null, '02034784556', '李银波', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '086 020 22159067', '020-34784556', null, null, '2019-08-20 18:24:05', 'collect', '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_user` VALUES ('15053907061', null, null, null, '15053907061', '张翠萍', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0539-8650888', '15053907061', null, null, '2019-08-20 18:24:05', 'collect', '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_user` VALUES ('18957415783', null, null, null, '18957415783', '吴锦兰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '574-83021038', '18957415783', null, null, '2019-08-20 18:24:05', 'collect', '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_user` VALUES ('18565115694', null, null, null, '18565115694', '廖良约', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-38354378//13640872225', '18565115694', null, null, '2019-08-20 18:24:05', 'collect', '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_user` VALUES ('13802308631', null, null, null, '13802308631', '吴焕明', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '768-8880696', '13802308631', null, null, '2019-08-20 18:24:05', 'collect', '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_user` VALUES ('18301475883', null, null, null, '18301475883', '李海侠', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-69411710', '18301475883', null, null, '2019-08-20 18:24:05', 'collect', '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_user` VALUES ('15061896082', null, null, null, '15061896082', '陈女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15061896082', null, null, '2019-08-20 18:24:05', 'collect', '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_user` VALUES ('13709053439', null, null, null, '13709053439', '张经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '028-87028920', '13709053439', null, null, '2019-08-20 18:24:05', 'collect', '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_user` VALUES ('13755070103', null, null, null, '13755070103', '许伊', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13755070103', null, null, '2019-08-20 18:24:05', 'collect', '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_user` VALUES ('18684883140', null, null, null, '18684883140', '匡小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85534140', '18684883140', null, null, '2019-08-20 18:24:05', 'collect', '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_user` VALUES ('13632212021', null, null, null, '13632212021', '杨经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-37667566', '13632212021', null, null, '2019-08-20 18:24:05', 'collect', '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_user` VALUES ('13973616617', null, null, null, '13973616617', '陈祥文', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0736-7378000', '13973616617', null, null, '2019-08-20 18:24:05', 'collect', '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_user` VALUES ('13805876136', null, null, null, '13805876136', '汪文通', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-88425436', '13805876136', null, null, '2019-08-20 18:24:05', 'collect', '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_user` VALUES ('13512562268', null, null, null, '13512562268', '高经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13512562268', null, null, '2019-08-20 18:24:05', 'collect', '2019-08-20 18:24:05', 'collect');
INSERT INTO `sys_user` VALUES ('18232188191', null, null, null, '18232188191', '吴哲', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-67167888', '18232188191', null, null, '2019-08-20 18:24:04', 'collect', '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_user` VALUES ('18008467985', null, null, null, '18008467985', '毛玮芳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-83846963', '18008467985', null, null, '2019-08-20 18:24:04', 'collect', '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_user` VALUES ('13805396836', null, null, null, '13805396836', '周超', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '539-8651028', '13805396836', null, null, '2019-08-20 18:24:04', 'collect', '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_user` VALUES ('13308492481', null, null, null, '13308492481', '蔡海波', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '731-13755133178', '13308492481', null, null, '2019-08-20 18:24:04', 'collect', '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_user` VALUES ('18874700310', null, null, null, '18874700310', '邓应婷', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-83846963', '18874700310', null, null, '2019-08-20 18:24:04', 'collect', '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_user` VALUES ('13507432162', null, null, null, '13507432162', '林俊', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85224861', '13507432162', null, null, '2019-08-20 18:24:04', 'collect', '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_user` VALUES ('18920583733', null, null, null, '18920583733', '王金利', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-88888888', '18920583733', null, null, '2019-08-20 18:24:04', 'collect', '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_user` VALUES ('13563923131', null, null, null, '13563923131', '张开金', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0539-8652606', '13563923131', null, null, '2019-08-20 18:24:04', 'collect', '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_user` VALUES ('18925095853', null, null, null, '18925095853', '张天', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18925095853', null, null, '2019-08-20 18:24:04', 'collect', '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_user` VALUES ('18622238076', null, null, null, '18622238076', '高宇鹏', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-27312816', '18622238076', null, null, '2019-08-20 18:24:04', 'collect', '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_user` VALUES ('13837885025', null, null, null, '13837885025', '雷长建', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-22679999', '13837885025', null, null, '2019-08-20 18:24:04', 'collect', '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_user` VALUES ('13716900928', null, null, null, '13716900928', '徐延平', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-60439267', '13716900928', null, null, '2019-08-20 18:24:04', 'collect', '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_user` VALUES ('13875837340', null, null, null, '13875837340', '谢小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '85575748', '13875837340', null, null, '2019-08-20 18:24:04', 'collect', '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_user` VALUES ('18701508978', null, null, null, '18701508978', '刘威宏', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '01069439225', '18701508978', null, null, '2019-08-20 18:24:04', 'collect', '2019-08-20 18:24:04', 'collect');
INSERT INTO `sys_user` VALUES ('15871439013', null, null, null, '15871439013', '魏先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '400-8867329', '15871439013', null, null, '2019-08-20 18:24:03', 'collect', '2019-08-20 18:24:03', 'collect');
INSERT INTO `sys_user` VALUES ('18674863713', null, null, null, '18674863713', '王路', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85413066', '18674863713', null, null, '2019-08-20 18:24:03', 'collect', '2019-08-20 18:24:03', 'collect');
INSERT INTO `sys_user` VALUES ('18901022113', null, null, null, '18901022113', '田东刚', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-62991360', '18901022113', null, null, '2019-08-20 18:24:03', 'collect', '2019-08-20 18:24:03', 'collect');
INSERT INTO `sys_user` VALUES ('18553822812', null, null, null, '18553822812', '田经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18553822812', null, null, '2019-08-20 18:24:03', 'collect', '2019-08-20 18:24:03', 'collect');
INSERT INTO `sys_user` VALUES ('15112624928', null, null, null, '15112624928', '李小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-83933150', '15112624928', null, null, '2019-08-20 18:24:02', 'collect', '2019-08-20 18:24:02', 'collect');
INSERT INTO `sys_user` VALUES ('18229972269', null, null, null, '18229972269', '罗兰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18229972269', null, null, '2019-08-20 18:24:02', 'collect', '2019-08-20 18:24:02', 'collect');
INSERT INTO `sys_user` VALUES ('15200848112', null, null, null, '15200848112', '罗经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-83882440', '15200848112', null, null, '2019-08-20 18:24:02', 'collect', '2019-08-20 18:24:02', 'collect');
INSERT INTO `sys_user` VALUES ('13180568806', null, null, null, '13180568806', '金经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0319-7300766', '13180568806', null, null, '2019-08-20 18:24:01', 'collect', '2019-08-20 18:24:01', 'collect');
INSERT INTO `sys_user` VALUES ('15339101775', null, null, null, '15339101775', '安梅', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '029-68888163', '15339101775', null, null, '2019-08-20 18:24:00', 'collect', '2019-08-20 18:24:00', 'collect');
INSERT INTO `sys_user` VALUES ('13381133116', null, null, null, '13381133116', '赵占芹', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '89943159', '13381133116', null, null, '2019-08-20 18:24:00', 'collect', '2019-08-20 18:24:00', 'collect');
INSERT INTO `sys_user` VALUES ('15581621480', null, null, null, '15581621480', '小万', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85531110', '15581621480', null, null, '2019-08-20 18:23:59', 'collect', '2019-08-20 18:23:59', 'collect');
INSERT INTO `sys_user` VALUES ('13706470877', null, null, null, '13706470877', '王女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0546-3633078', '13706470877', null, null, '2019-08-20 18:23:59', 'collect', '2019-08-20 18:23:59', 'collect');
INSERT INTO `sys_user` VALUES ('15039027881', null, null, null, '15039027881', '许秋雨', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-26680208', '15039027881', null, null, '2019-08-20 18:23:59', 'collect', '2019-08-20 18:23:59', 'collect');
INSERT INTO `sys_user` VALUES ('13953122688', null, null, null, '13953122688', '张经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-87317999', '13953122688', null, null, '2019-08-20 18:23:57', 'collect', '2019-08-20 18:23:57', 'collect');
INSERT INTO `sys_user` VALUES ('15254701095', null, null, null, '15254701095', '王雪', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0537-2882816', '15254701095', null, null, '2019-08-20 18:23:57', 'collect', '2019-08-20 18:23:57', 'collect');
INSERT INTO `sys_user` VALUES ('15898634235', null, null, null, '15898634235', '王经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0537-2882816', '15898634235', null, null, '2019-08-20 18:23:57', 'collect', '2019-08-20 18:23:57', 'collect');
INSERT INTO `sys_user` VALUES ('18531358559', null, null, null, '18531358559', '刘涛', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18531358559', null, null, '2019-08-20 18:23:57', 'collect', '2019-08-20 18:23:57', 'collect');
INSERT INTO `sys_user` VALUES ('13548670698', null, null, null, '13548670698', '小惠', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85594528', '13548670698', null, null, '2019-08-20 18:23:57', 'collect', '2019-08-20 18:23:57', 'collect');
INSERT INTO `sys_user` VALUES ('13811950183', null, null, null, '13811950183', '孙守波', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0138-11950183', '13811950183', null, null, '2019-08-20 18:23:56', 'collect', '2019-08-20 18:23:56', 'collect');
INSERT INTO `sys_user` VALUES ('15874159171', null, null, null, '15874159171', '邓小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85234418', '15874159171', null, null, '2019-08-20 18:23:56', 'collect', '2019-08-20 18:23:56', 'collect');
INSERT INTO `sys_user` VALUES ('13573327999', null, null, null, '13573327999', '陈晓峰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0533-2156096', '13573327999', null, null, '2019-08-20 18:23:55', 'collect', '2019-08-20 18:23:55', 'collect');
INSERT INTO `sys_user` VALUES ('13978846363', null, null, null, '13978846363', '黄祖立', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0771-3903136', '13978846363', null, null, '2019-08-20 18:23:55', 'collect', '2019-08-20 18:23:55', 'collect');
INSERT INTO `sys_user` VALUES ('18837832177', null, null, null, '18837832177', '张经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-26680357', '18837832177', null, null, '2019-08-20 18:23:55', 'collect', '2019-08-20 18:23:55', 'collect');
INSERT INTO `sys_user` VALUES ('18229498600', null, null, null, '18229498600', '周经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85531110', '18229498600', null, null, '2019-08-20 18:23:53', 'collect', '2019-08-20 18:23:53', 'collect');
INSERT INTO `sys_user` VALUES ('13783999880', null, null, null, '13783999880', '马建国', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-22633210', '13783999880', null, null, '2019-08-20 18:23:52', 'collect', '2019-08-20 18:23:52', 'collect');
INSERT INTO `sys_user` VALUES ('15383873598', null, null, null, '15383873598', '刘哓文', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0317-8298158', '15383873598', null, null, '2019-08-20 18:23:52', 'collect', '2019-08-20 18:23:52', 'collect');
INSERT INTO `sys_user` VALUES ('15986380205', null, null, null, '15986380205', '金总', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-85821852', '15986380205', null, null, '2019-08-20 18:23:52', 'collect', '2019-08-20 18:23:52', 'collect');
INSERT INTO `sys_user` VALUES ('18373140190', null, null, null, '18373140190', '付小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-89920489', '18373140190', null, null, '2019-08-20 18:23:43', 'collect', '2019-08-20 18:23:43', 'collect');
INSERT INTO `sys_user` VALUES ('13697673756', null, null, null, '13697673756', '张云', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13697673756', null, null, '2019-08-20 18:23:43', 'collect', '2019-08-20 18:23:43', 'collect');
INSERT INTO `sys_user` VALUES ('18049296191', null, null, null, '18049296191', '周马玮', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '029-84273496', '18049296191', null, null, '2019-08-20 18:23:42', 'collect', '2019-08-20 18:23:42', 'collect');
INSERT INTO `sys_user` VALUES ('18942553814', null, null, null, '18942553814', '刘龙', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18942553814', null, null, '2019-08-20 18:23:42', 'collect', '2019-08-20 18:23:42', 'collect');
INSERT INTO `sys_user` VALUES ('15203119327', null, null, null, '15203119327', '焦经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-80856278', '15203119327', null, null, '2019-08-20 18:23:32', 'collect', '2019-08-20 18:23:32', 'collect');
INSERT INTO `sys_user` VALUES ('13755037003', null, null, null, '13755037003', '小杨', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85531110', '13755037003', null, null, '2019-08-20 18:23:17', 'collect', '2019-08-20 18:23:17', 'collect');
INSERT INTO `sys_user` VALUES ('13753691807', null, null, null, '13753691807', '李静芳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0356-3016885', '13753691807', null, null, '2019-08-20 18:23:12', 'collect', '2019-08-20 18:23:12', 'collect');
INSERT INTO `sys_user` VALUES ('15674923822', null, null, null, '15674923822', '李欢', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85531110', '15674923822', null, null, '2019-08-20 18:23:11', 'collect', '2019-08-20 18:23:11', 'collect');
INSERT INTO `sys_user` VALUES ('13755180551', null, null, null, '13755180551', '小周', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85531110', '13755180551', null, null, '2019-08-20 18:23:10', 'collect', '2019-08-20 18:23:10', 'collect');
INSERT INTO `sys_user` VALUES ('18900710689', null, null, null, '18900710689', '杨杨', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-89975945', '18900710689', null, null, '2019-08-20 18:23:10', 'collect', '2019-08-20 18:23:10', 'collect');
INSERT INTO `sys_user` VALUES ('15773175017', null, null, null, '15773175017', '胡杏', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15773175017', null, null, '2019-08-20 18:23:10', 'collect', '2019-08-20 18:23:10', 'collect');
INSERT INTO `sys_user` VALUES ('13651597807', null, null, null, '13651597807', '张丹', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0515-80680158', '13651597807', null, null, '2019-08-20 18:23:10', 'collect', '2019-08-20 18:23:10', 'collect');
INSERT INTO `sys_user` VALUES ('15974149233', null, null, null, '15974149233', '刘经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15974149233', null, null, '2019-08-20 18:23:10', 'collect', '2019-08-20 18:23:10', 'collect');
INSERT INTO `sys_user` VALUES ('15226715191', null, null, null, '15226715191', '王丽', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0317-8294124', '15226715191', null, null, '2019-08-20 18:23:10', 'collect', '2019-08-20 18:23:10', 'collect');
INSERT INTO `sys_user` VALUES ('13081807766', null, null, null, '13081807766', '赵经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8386677', '13081807766', null, null, '2019-08-20 18:23:09', 'collect', '2019-08-20 18:23:09', 'collect');
INSERT INTO `sys_user` VALUES ('15378724450', null, null, null, '15378724450', '张旭阳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0186-38600890', '15378724450', null, null, '2019-08-20 18:23:09', 'collect', '2019-08-20 18:23:09', 'collect');
INSERT INTO `sys_user` VALUES ('15999658296', null, null, null, '15999658296', '张平', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-29503891', '15999658296', null, null, '2019-08-20 18:23:09', 'collect', '2019-08-20 18:23:09', 'collect');
INSERT INTO `sys_user` VALUES ('15895559907', null, null, null, '15895559907', '吕先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15895559907', null, null, '2019-08-20 18:23:09', 'collect', '2019-08-20 18:23:09', 'collect');
INSERT INTO `sys_user` VALUES ('15949803008', null, null, null, '15949803008', '刘女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-5895007', '15949803008', null, null, '2019-08-20 18:23:09', 'collect', '2019-08-20 18:23:09', 'collect');
INSERT INTO `sys_user` VALUES ('18832275330', null, null, null, '18832275330', '李亚民', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18832275330', null, null, '2019-08-20 18:23:09', 'collect', '2019-08-20 18:23:09', 'collect');
INSERT INTO `sys_user` VALUES ('15050111156', null, null, null, '15050111156', '陈先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0512-88981668', '15050111156', null, null, '2019-08-20 18:23:09', 'collect', '2019-08-20 18:23:09', 'collect');
INSERT INTO `sys_user` VALUES ('13953976655', null, null, null, '13953976655', '杜庆秀', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0539-8628005', '13953976655', null, null, '2019-08-20 18:23:09', 'collect', '2019-08-20 18:23:09', 'collect');
INSERT INTO `sys_user` VALUES ('15001371894', null, null, null, '15001371894', '芮艳洁', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-52882603', '15001371894', null, null, '2019-08-20 18:23:09', 'collect', '2019-08-20 18:23:09', 'collect');
INSERT INTO `sys_user` VALUES ('13853851467', null, null, null, '13853851467', '张先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-6587606', '13853851467', null, null, '2019-08-20 18:23:08', 'collect', '2019-08-20 18:23:08', 'collect');
INSERT INTO `sys_user` VALUES ('15522004838', null, null, null, '15522004838', '张晶', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-49030030', '15522004838', null, null, '2019-08-20 18:23:08', 'collect', '2019-08-20 18:23:08', 'collect');
INSERT INTO `sys_user` VALUES ('13951828933', null, null, null, '13951828933', '周斌', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '025-58015159', '13951828933', null, null, '2019-08-20 18:23:08', 'collect', '2019-08-20 18:23:08', 'collect');
INSERT INTO `sys_user` VALUES ('15953699597', null, null, null, '15953699597', '鲁先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-3251005', '15953699597', null, null, '2019-08-20 18:23:07', 'collect', '2019-08-20 18:23:07', 'collect');
INSERT INTO `sys_user` VALUES ('13837192247', null, null, null, '13837192247', '郭子', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-87091533', '13837192247', null, null, '2019-08-20 18:23:03', 'collect', '2019-08-20 18:23:03', 'collect');
INSERT INTO `sys_user` VALUES ('13787051577', null, null, null, '13787051577', '肖霞', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-88673180', '13787051577', null, null, '2019-08-20 18:23:02', 'collect', '2019-08-20 18:23:02', 'collect');
INSERT INTO `sys_user` VALUES ('15736760376', null, null, null, '15736760376', '乔颖', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-56658985', '15736760376', null, null, '2019-08-20 18:23:02', 'collect', '2019-08-20 18:23:02', 'collect');
INSERT INTO `sys_user` VALUES ('13527675789', null, null, null, '13527675789', '吴腾辉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-82575060', '13527675789', null, null, '2019-08-20 18:23:01', 'collect', '2019-08-20 18:23:01', 'collect');
INSERT INTO `sys_user` VALUES ('13953928808', null, null, null, '13953928808', '胡发恩', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '400-6365815', '13953928808', null, null, '2019-08-20 18:23:01', 'collect', '2019-08-20 18:23:01', 'collect');
INSERT INTO `sys_user` VALUES ('18581853739', null, null, null, '18581853739', '熊女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '028-65381336', '18581853739', null, null, '2019-08-20 18:23:00', 'collect', '2019-08-20 18:23:00', 'collect');
INSERT INTO `sys_user` VALUES ('18975177180', null, null, null, '18975177180', '方小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18975177180', null, null, '2019-08-20 18:22:59', 'collect', '2019-08-20 18:22:59', 'collect');
INSERT INTO `sys_user` VALUES ('15311504789', null, null, null, '15311504789', '小逸', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '57477712', '15311504789', null, null, '2019-08-20 18:22:59', 'collect', '2019-08-20 18:22:59', 'collect');
INSERT INTO `sys_user` VALUES ('13022275737', null, null, null, '13022275737', '徐先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13022275737', null, null, '2019-08-20 18:22:58', 'collect', '2019-08-20 18:22:58', 'collect');
INSERT INTO `sys_user` VALUES ('18658406916', null, null, null, '18658406916', '赵庆昌', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-27808011', '18658406916', null, null, '2019-08-20 18:22:58', 'collect', '2019-08-20 18:22:58', 'collect');
INSERT INTO `sys_user` VALUES ('18002087950', null, null, null, '18002087950', '杜君生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18002087950', null, null, '2019-08-20 18:22:52', 'collect', '2019-08-20 18:22:52', 'collect');
INSERT INTO `sys_user` VALUES ('15369861995', null, null, null, '15369861995', '王经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-5871995', '15369861995', null, null, '2019-08-20 18:22:49', 'collect', '2019-08-20 18:22:49', 'collect');
INSERT INTO `sys_user` VALUES ('13921856058', null, null, null, '13921856058', '李志亚', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0515-86165608/13813229509', '13921856058', null, null, '2019-08-20 18:22:49', 'collect', '2019-08-20 18:22:49', 'collect');
INSERT INTO `sys_user` VALUES ('18612372798', null, null, null, '18612372798', '小卓', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-57184142', '18612372798', null, null, '2019-08-20 18:22:45', 'collect', '2019-08-20 18:22:45', 'collect');
INSERT INTO `sys_user` VALUES ('18774899665', null, null, null, '18774899665', '周双', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85531110', '18774899665', null, null, '2019-08-20 18:22:40', 'collect', '2019-08-20 18:22:40', 'collect');
INSERT INTO `sys_user` VALUES ('18012531632', null, null, null, '18012531632', '王欢', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0515-80693777', '18012531632', null, null, '2019-08-20 18:22:38', 'collect', '2019-08-20 18:22:38', 'collect');
INSERT INTO `sys_user` VALUES ('18900710693', null, null, null, '18900710693', '周小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-89974943', '18900710693', null, null, '2019-08-20 18:22:38', 'collect', '2019-08-20 18:22:38', 'collect');
INSERT INTO `sys_user` VALUES ('18900710692', null, null, null, '18900710692', '周周', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-89975942', '18900710692', null, null, '2019-08-20 18:22:37', 'collect', '2019-08-20 18:22:37', 'collect');
INSERT INTO `sys_user` VALUES ('13574898623', null, null, null, '13574898623', '黄小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-88710428', '13574898623', null, null, '2019-08-20 18:22:37', 'collect', '2019-08-20 18:22:37', 'collect');
INSERT INTO `sys_user` VALUES ('15826880219', null, null, null, '15826880219', '肖小丽', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0728-3221285', '15826880219', null, null, '2019-08-20 18:22:36', 'collect', '2019-08-20 18:22:36', 'collect');
INSERT INTO `sys_user` VALUES ('15367815557', null, null, null, '15367815557', '王路', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '8541-3066', '15367815557', null, null, '2019-08-20 18:22:35', 'collect', '2019-08-20 18:22:35', 'collect');
INSERT INTO `sys_user` VALUES ('15315191306', null, null, null, '15315191306', '郭经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15315191306', null, null, '2019-08-20 18:22:35', 'collect', '2019-08-20 18:22:35', 'collect');
INSERT INTO `sys_user` VALUES ('18629019851', null, null, null, '18629019851', '张先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '029-89181132', '18629019851', null, null, '2019-08-20 18:22:32', 'collect', '2019-08-20 18:22:32', 'collect');
INSERT INTO `sys_user` VALUES ('13520288455', null, null, null, '13520288455', '张胜福', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-86050533--63560673', '13520288455', null, null, '2019-08-20 18:22:32', 'collect', '2019-08-20 18:22:32', 'collect');
INSERT INTO `sys_user` VALUES ('15112114086', null, null, null, '15112114086', '周锦华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 020 84128865', '15112114086', null, null, '2019-08-20 18:22:32', 'collect', '2019-08-20 18:22:32', 'collect');
INSERT INTO `sys_user` VALUES ('15089895776', null, null, null, '15089895776', '洪春莲', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-82333816-18924113970', '15089895776', null, null, '2019-08-20 18:22:32', 'collect', '2019-08-20 18:22:32', 'collect');
INSERT INTO `sys_user` VALUES ('18229499117', null, null, null, '18229499117', '李经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18229499117', null, null, '2019-08-20 18:22:30', 'collect', '2019-08-20 18:22:30', 'collect');
INSERT INTO `sys_user` VALUES ('13811593554', null, null, null, '13811593554', '邓少超', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-65735962', '13811593554', null, null, '2019-08-20 18:22:30', 'collect', '2019-08-20 18:22:30', 'collect');
INSERT INTO `sys_user` VALUES ('02133510117', null, null, null, '02133510117', '吴先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-33510117', '021-33510117', null, null, '2019-08-20 18:22:30', 'collect', '2019-08-20 18:22:30', 'collect');
INSERT INTO `sys_user` VALUES ('13805833915', null, null, null, '13805833915', '任巍', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-88637938', '13805833915', null, null, '2019-08-20 18:22:30', 'collect', '2019-08-20 18:22:30', 'collect');
INSERT INTO `sys_user` VALUES ('13680258008', null, null, null, '13680258008', '刘建刚', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0760-23821087/87820311', '13680258008', null, null, '2019-08-20 18:22:30', 'collect', '2019-08-20 18:22:30', 'collect');
INSERT INTO `sys_user` VALUES ('13611465050', null, null, null, '13611465050', '洪现金', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-28637050', '13611465050', null, null, '2019-08-20 18:22:30', 'collect', '2019-08-20 18:22:30', 'collect');
INSERT INTO `sys_user` VALUES ('13805312056', null, null, null, '13805312056', '梁洪录', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-87488126', '13805312056', null, null, '2019-08-20 18:22:29', 'collect', '2019-08-20 18:22:29', 'collect');
INSERT INTO `sys_user` VALUES ('13231188067', null, null, null, '13231188067', '许尽欢', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-89642386', '13231188067', null, null, '2019-08-20 18:22:29', 'collect', '2019-08-20 18:22:29', 'collect');
INSERT INTO `sys_user` VALUES ('18616302865', null, null, null, '18616302865', '胡龙文', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-54375650', '18616302865', null, null, '2019-08-20 18:22:28', 'collect', '2019-08-20 18:22:28', 'collect');
INSERT INTO `sys_user` VALUES ('18390917003', null, null, null, '18390917003', '小兰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85531110', '18390917003', null, null, '2019-08-20 18:22:28', 'collect', '2019-08-20 18:22:28', 'collect');
INSERT INTO `sys_user` VALUES ('15222162033', null, null, null, '15222162033', '王总', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-58136483', '15222162033', null, null, '2019-08-20 18:22:27', 'collect', '2019-08-20 18:22:27', 'collect');
INSERT INTO `sys_user` VALUES ('17722001233', null, null, null, '17722001233', '张经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '400-179-3663', '17722001233', null, null, '2019-08-20 18:22:27', 'collect', '2019-08-20 18:22:27', 'collect');
INSERT INTO `sys_user` VALUES ('18874182935', null, null, null, '18874182935', '王婷婷', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85235418', '18874182935', null, null, '2019-08-20 18:22:27', 'collect', '2019-08-20 18:22:27', 'collect');
INSERT INTO `sys_user` VALUES ('18859912233', null, null, null, '18859912233', '林金镔', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0595-88082133', '18859912233', null, null, '2019-08-20 18:22:27', 'collect', '2019-08-20 18:22:27', 'collect');
INSERT INTO `sys_user` VALUES ('15869380633', null, null, null, '15869380633', '岑其乔', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-63578737', '15869380633', null, null, '2019-08-20 18:22:27', 'collect', '2019-08-20 18:22:27', 'collect');
INSERT INTO `sys_user` VALUES ('15074870051', null, null, null, '15074870051', '小罗', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85594528', '15074870051', null, null, '2019-08-20 18:22:27', 'collect', '2019-08-20 18:22:27', 'collect');
INSERT INTO `sys_user` VALUES ('13602265655', null, null, null, '13602265655', '方彦彪', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-34964189', '13602265655', null, null, '2019-08-20 18:22:26', 'collect', '2019-08-20 18:22:26', 'collect');
INSERT INTO `sys_user` VALUES ('13583276687', null, null, null, '13583276687', '陈绪江', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0532 83517535', '13583276687', null, null, '2019-08-20 18:22:26', 'collect', '2019-08-20 18:22:26', 'collect');
INSERT INTO `sys_user` VALUES ('13837826222', null, null, null, '13837826222', '陈开军', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-22633330', '13837826222', null, null, '2019-08-20 18:22:26', 'collect', '2019-08-20 18:22:26', 'collect');
INSERT INTO `sys_user` VALUES ('13423966800', null, null, null, '13423966800', '王磊', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0755 28162629', '13423966800', null, null, '2019-08-20 18:22:26', 'collect', '2019-08-20 18:22:26', 'collect');
INSERT INTO `sys_user` VALUES ('15367813233', null, null, null, '15367813233', '唐女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85560852', '15367813233', null, null, '2019-08-20 18:22:26', 'collect', '2019-08-20 18:22:26', 'collect');
INSERT INTO `sys_user` VALUES ('15367811192', null, null, null, '15367811192', '朱欢', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-85224861', '15367811192', null, null, '2019-08-20 18:22:26', 'collect', '2019-08-20 18:22:26', 'collect');
INSERT INTO `sys_user` VALUES ('13690333282', null, null, null, '13690333282', '敬小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0757-26113779', '13690333282', null, null, '2019-08-20 18:22:26', 'collect', '2019-08-20 18:22:26', 'collect');
INSERT INTO `sys_user` VALUES ('15111463532', null, null, null, '15111463532', '唐女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-89876101', '15111463532', null, null, '2019-08-20 18:22:25', 'collect', '2019-08-20 18:22:25', 'collect');
INSERT INTO `sys_user` VALUES ('18773128906', null, null, null, '18773128906', '冯女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-89920469', '18773128906', null, null, '2019-08-20 18:22:25', 'collect', '2019-08-20 18:22:25', 'collect');
INSERT INTO `sys_user` VALUES ('13583994199', null, null, null, '13583994199', '王友涛', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0539-8669229', '13583994199', null, null, '2019-08-20 18:22:25', 'collect', '2019-08-20 18:22:25', 'collect');
INSERT INTO `sys_user` VALUES ('18658351211', null, null, null, '18658351211', '邓志强', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0577-66998009', '18658351211', null, null, '2019-08-20 18:22:24', 'collect', '2019-08-20 18:22:24', 'collect');
INSERT INTO `sys_user` VALUES ('13970476893', null, null, null, '13970476893', '熊斯平', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0794-13970476895', '13970476893', null, null, '2019-08-20 18:22:24', 'collect', '2019-08-20 18:22:24', 'collect');
INSERT INTO `sys_user` VALUES ('18967038068', null, null, null, '18967038068', '陈华升', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0570-3010999', '18967038068', null, null, '2019-08-20 18:22:23', 'collect', '2019-08-20 18:22:23', 'collect');
INSERT INTO `sys_user` VALUES ('57765109111', null, null, null, '57765109111', '张同者', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0577 65109111', '0577 65109111', null, null, '2019-08-20 18:22:23', 'collect', '2019-08-20 18:22:23', 'collect');
INSERT INTO `sys_user` VALUES ('18924109323', null, null, null, '18924109323', '刘颂春', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-39951933', '18924109323', null, null, '2019-08-20 18:22:23', 'collect', '2019-08-20 18:22:23', 'collect');
INSERT INTO `sys_user` VALUES ('13358396073', null, null, null, '13358396073', '李溪竹', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0592-5815930', '13358396073', null, null, '2019-08-20 18:22:23', 'collect', '2019-08-20 18:22:23', 'collect');
INSERT INTO `sys_user` VALUES ('13678680235', null, null, null, '13678680235', '朱法军', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-6637232', '13678680235', null, null, '2019-08-20 18:22:23', 'collect', '2019-08-20 18:22:23', 'collect');
INSERT INTO `sys_user` VALUES ('13723872142', null, null, null, '13723872142', '邝贤秀', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-84251700', '13723872142', null, null, '2019-08-20 18:22:23', 'collect', '2019-08-20 18:22:23', 'collect');
INSERT INTO `sys_user` VALUES ('13552377273', null, null, null, '13552377273', '李辞海', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-83600976', '13552377273', null, null, '2019-08-20 18:22:23', 'collect', '2019-08-20 18:22:23', 'collect');
INSERT INTO `sys_user` VALUES ('18653835712', null, null, null, '18653835712', '邱志强', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18653835712', null, null, '2019-08-20 18:22:23', 'collect', '2019-08-20 18:22:23', 'collect');
INSERT INTO `sys_user` VALUES ('18854170998', null, null, null, '18854170998', '王巧云', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-88987969', '18854170998', null, null, '2019-08-20 18:22:23', 'collect', '2019-08-20 18:22:23', 'collect');
INSERT INTO `sys_user` VALUES ('13564228488', null, null, null, '13564228488', '吴林健', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-61557088', '13564228488', null, null, '2019-08-20 18:22:22', 'collect', '2019-08-20 18:22:22', 'collect');
INSERT INTO `sys_user` VALUES ('13776506016', null, null, null, '13776506016', '薛素珍', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '025-58866352', '13776506016', null, null, '2019-08-20 18:22:21', 'collect', '2019-08-20 18:22:21', 'collect');
INSERT INTO `sys_user` VALUES ('13551181528', null, null, null, '13551181528', '何禧学', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '028-66299355', '13551181528', null, null, '2019-08-20 18:22:21', 'collect', '2019-08-20 18:22:21', 'collect');
INSERT INTO `sys_user` VALUES ('15898739393', null, null, null, '15898739393', '马鹏生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0533-4178966', '15898739393', null, null, '2019-08-20 18:22:21', 'collect', '2019-08-20 18:22:21', 'collect');
INSERT INTO `sys_user` VALUES ('13711262228', null, null, null, '13711262228', '温碧波', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-84553219', '13711262228', null, null, '2019-08-20 18:22:20', 'collect', '2019-08-20 18:22:20', 'collect');
INSERT INTO `sys_user` VALUES ('13606746366', null, null, null, '13606746366', '岑孟利', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-63581658', '13606746366', null, null, '2019-08-20 18:22:20', 'collect', '2019-08-20 18:22:20', 'collect');
INSERT INTO `sys_user` VALUES ('13709061820', null, null, null, '13709061820', '洪荣昌', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '028-87618011', '13709061820', null, null, '2019-08-20 18:22:19', 'collect', '2019-08-20 18:22:19', 'collect');
INSERT INTO `sys_user` VALUES ('13641118671', null, null, null, '13641118671', '焦广华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-13641118671', '13641118671', null, null, '2019-08-20 18:22:19', 'collect', '2019-08-20 18:22:19', 'collect');
INSERT INTO `sys_user` VALUES ('13701989448', null, null, null, '13701989448', '缪平强', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-33588180', '13701989448', null, null, '2019-08-20 18:22:19', 'collect', '2019-08-20 18:22:19', 'collect');
INSERT INTO `sys_user` VALUES ('15715733082', null, null, null, '15715733082', '何洪秋', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 571 23298090', '15715733082', null, null, '2019-08-20 18:22:19', 'collect', '2019-08-20 18:22:19', 'collect');
INSERT INTO `sys_user` VALUES ('15131786899', null, null, null, '15131786899', '孙建', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0317-8299972', '15131786899', null, null, '2019-08-20 18:22:19', 'collect', '2019-08-20 18:22:19', 'collect');
INSERT INTO `sys_user` VALUES ('18861550930', null, null, null, '18861550930', '唐俊', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0510-87891534', '18861550930', null, null, '2019-08-20 18:22:19', 'collect', '2019-08-20 18:22:19', 'collect');
INSERT INTO `sys_user` VALUES ('13606367480', null, null, null, '13606367480', '孙明东', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-3266328', '13606367480', null, null, '2019-08-20 18:22:18', 'collect', '2019-08-20 18:22:18', 'collect');
INSERT INTO `sys_user` VALUES ('15613165016', null, null, null, '15613165016', '唐计爽', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-83984066', '15613165016', null, null, '2019-08-20 18:22:18', 'collect', '2019-08-20 18:22:18', 'collect');
INSERT INTO `sys_user` VALUES ('13916673163', null, null, null, '13916673163', '石建国', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-36350373', '13916673163', null, null, '2019-08-20 18:22:18', 'collect', '2019-08-20 18:22:18', 'collect');
INSERT INTO `sys_user` VALUES ('13515415157', null, null, null, '13515415157', '杨智', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '531-66564318', '13515415157', null, null, '2019-08-20 18:22:18', 'collect', '2019-08-20 18:22:18', 'collect');
INSERT INTO `sys_user` VALUES ('13508895017', null, null, null, '13508895017', '陈建运', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0877-3015909', '13508895017', null, null, '2019-08-20 18:22:18', 'collect', '2019-08-20 18:22:18', 'collect');
INSERT INTO `sys_user` VALUES ('13506840095', null, null, null, '13506840095', '杨其方', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-83097005', '13506840095', null, null, '2019-08-20 18:22:18', 'collect', '2019-08-20 18:22:18', 'collect');
INSERT INTO `sys_user` VALUES ('13723212786', null, null, null, '13723212786', '程素华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-22633053', '13723212786', null, null, '2019-08-20 18:22:18', 'collect', '2019-08-20 18:22:18', 'collect');
INSERT INTO `sys_user` VALUES ('13805390717', null, null, null, '13805390717', '刘高源', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '539-8664196', '13805390717', null, null, '2019-08-20 18:22:18', 'collect', '2019-08-20 18:22:18', 'collect');
INSERT INTO `sys_user` VALUES ('13327941097', null, null, null, '13327941097', '沈学云', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0516-87793220', '13327941097', null, null, '2019-08-20 18:22:17', 'collect', '2019-08-20 18:22:17', 'collect');
INSERT INTO `sys_user` VALUES ('13146226588', null, null, null, '13146226588', '王琴', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '400-8878980', '13146226588', null, null, '2019-08-20 18:22:17', 'collect', '2019-08-20 18:22:17', 'collect');
INSERT INTO `sys_user` VALUES ('18964996577', null, null, null, '18964996577', '吴林健', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-33510117', '18964996577', null, null, '2019-08-20 18:22:17', 'collect', '2019-08-20 18:22:17', 'collect');
INSERT INTO `sys_user` VALUES ('13910504630', null, null, null, '13910504630', '王志会', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-69419726', '13910504630', null, null, '2019-08-20 18:22:17', 'collect', '2019-08-20 18:22:17', 'collect');
INSERT INTO `sys_user` VALUES ('13962028000', null, null, null, '13962028000', '袁仁凤', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0515-80603799', '13962028000', null, null, '2019-08-20 18:22:17', 'collect', '2019-08-20 18:22:17', 'collect');
INSERT INTO `sys_user` VALUES ('18774832763', null, null, null, '18774832763', '田双玉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0187-74832763', '18774832763', null, null, '2019-08-20 18:22:17', 'collect', '2019-08-20 18:22:17', 'collect');
INSERT INTO `sys_user` VALUES ('13974833225', null, null, null, '13974833225', '宋为良', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-400-0731-210/89824400', '13974833225', null, null, '2019-08-20 18:22:17', 'collect', '2019-08-20 18:22:17', 'collect');
INSERT INTO `sys_user` VALUES ('15737877787', null, null, null, '15737877787', '毕文琦', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-22233367', '15737877787', null, null, '2019-08-20 18:22:17', 'collect', '2019-08-20 18:22:17', 'collect');
INSERT INTO `sys_user` VALUES ('15073156390', null, null, null, '15073156390', '侯赛', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-83586869', '15073156390', null, null, '2019-08-20 18:22:16', 'collect', '2019-08-20 18:22:16', 'collect');
INSERT INTO `sys_user` VALUES ('13760885397', null, null, null, '13760885397', '尹荣学', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-62297731', '13760885397', null, null, '2019-08-20 18:22:16', 'collect', '2019-08-20 18:22:16', 'collect');
INSERT INTO `sys_user` VALUES ('13566658905', null, null, null, '13566658905', '庄丹君', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0576-87217769/87225809/1336269', '13566658905', null, null, '2019-08-20 18:22:16', 'collect', '2019-08-20 18:22:16', 'collect');
INSERT INTO `sys_user` VALUES ('13662294557', null, null, null, '13662294557', '申少菊', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '086 000 00000000', '13662294557', null, null, '2019-08-20 18:22:16', 'collect', '2019-08-20 18:22:16', 'collect');
INSERT INTO `sys_user` VALUES ('13002720848', null, null, null, '13002720848', '高瑜谦', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0535-13002720848', '13002720848', null, null, '2019-08-20 18:22:16', 'collect', '2019-08-20 18:22:16', 'collect');
INSERT INTO `sys_user` VALUES ('13819800461', null, null, null, '13819800461', '余其松', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-87329315', '13819800461', null, null, '2019-08-20 18:22:16', 'collect', '2019-08-20 18:22:16', 'collect');
INSERT INTO `sys_user` VALUES ('13952651782', null, null, null, '13952651782', '肖华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0523 86990188', '13952651782', null, null, '2019-08-20 18:22:16', 'collect', '2019-08-20 18:22:16', 'collect');
INSERT INTO `sys_user` VALUES ('13553172561', null, null, null, '13553172561', '李天佑', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13553172561', null, null, '2019-08-20 18:22:16', 'collect', '2019-08-20 18:22:16', 'collect');
INSERT INTO `sys_user` VALUES ('01052118561', null, null, null, '01052118561', '曹炜', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '010 52118561', null, null, '2019-08-20 18:22:16', 'collect', '2019-08-20 18:22:16', 'collect');
INSERT INTO `sys_user` VALUES ('13927731361', null, null, null, '13927731361', '金先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13927731361', null, null, '2019-08-05 19:52:06', 'collect', '2019-08-05 19:52:06', 'collect');
INSERT INTO `sys_user` VALUES ('15975260953', null, null, null, '15975260953', '金经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15975260953', null, null, '2019-08-05 19:52:06', 'collect', '2019-08-05 19:52:06', 'collect');
INSERT INTO `sys_user` VALUES ('13533088301', null, null, null, '13533088301', '黄雪锋', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13533088301', null, null, '2019-08-05 19:52:06', 'collect', '2019-08-05 19:52:06', 'collect');
INSERT INTO `sys_user` VALUES ('15618918888', null, null, null, '15618918888', '王韬', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-68868305', '15618918888', null, null, '2019-08-05 19:51:14', 'collect', '2019-08-05 19:51:14', 'collect');
INSERT INTO `sys_user` VALUES ('18032169437', null, null, null, '18032169437', '郭永庆', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18032169437', null, null, '2019-08-05 19:51:14', 'collect', '2019-08-05 19:51:14', 'collect');
INSERT INTO `sys_user` VALUES ('15728242772', null, null, null, '15728242772', '胡长生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-81717678', '15728242772', null, null, '2019-08-05 19:51:14', 'collect', '2019-08-05 19:51:14', 'collect');
INSERT INTO `sys_user` VALUES ('13510206893', null, null, null, '13510206893', '张惠琼', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-81475795', '13510206893', null, null, '2019-08-05 19:51:14', 'collect', '2019-08-05 19:51:14', 'collect');
INSERT INTO `sys_user` VALUES ('18675781329', null, null, null, '18675781329', '陈飞', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0769-89776657', '18675781329', null, null, '2019-08-05 19:51:13', 'collect', '2019-08-05 19:51:13', 'collect');
INSERT INTO `sys_user` VALUES ('17172930609', null, null, null, '17172930609', '丁莉萍', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '17172930609', null, null, '2019-08-05 19:51:13', 'collect', '2019-08-05 19:51:13', 'collect');
INSERT INTO `sys_user` VALUES ('18673920935', null, null, null, '18673920935', '罗维维', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18673920935', null, null, '2019-08-05 19:51:13', 'collect', '2019-08-05 19:51:13', 'collect');
INSERT INTO `sys_user` VALUES ('13658047776', null, null, null, '13658047776', '景海明', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '028-84890051', '13658047776', null, null, '2019-08-05 19:51:13', 'collect', '2019-08-05 19:51:13', 'collect');
INSERT INTO `sys_user` VALUES ('13853190761', null, null, null, '13853190761', '赵斌', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-81251292', '13853190761', null, null, '2019-08-05 19:51:13', 'collect', '2019-08-05 19:51:13', 'collect');
INSERT INTO `sys_user` VALUES ('18538806022', null, null, null, '18538806022', '申晓鹏', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0379-65528005', '18538806022', null, null, '2019-08-05 19:51:13', 'collect', '2019-08-05 19:51:13', 'collect');
INSERT INTO `sys_user` VALUES ('13905662113', null, null, null, '13905662113', '舒先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0566-2222113', '13905662113', null, null, '2019-08-05 19:51:13', 'collect', '2019-08-05 19:51:13', 'collect');
INSERT INTO `sys_user` VALUES ('13662998504', null, null, null, '13662998504', '何家成', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0769-82253866', '13662998504', null, null, '2019-08-05 19:51:12', 'collect', '2019-08-05 19:51:12', 'collect');
INSERT INTO `sys_user` VALUES ('13423631415', null, null, null, '13423631415', '王先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-84761478', '13423631415', null, null, '2019-08-05 19:51:12', 'collect', '2019-08-05 19:51:12', 'collect');
INSERT INTO `sys_user` VALUES ('18017067606', null, null, null, '18017067606', '张叶花', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-39875265', '18017067606', null, null, '2019-08-05 19:51:12', 'collect', '2019-08-05 19:51:12', 'collect');
INSERT INTO `sys_user` VALUES ('13813689060', null, null, null, '13813689060', '查先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0519-81183690', '13813689060', null, null, '2019-08-05 19:51:11', 'collect', '2019-08-05 19:51:11', 'collect');
INSERT INTO `sys_user` VALUES ('13573608567', null, null, null, '13573608567', '张经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-6285551', '13573608567', null, null, '2019-08-05 19:51:08', 'collect', '2019-08-05 19:51:08', 'collect');
INSERT INTO `sys_user` VALUES ('13730586542', null, null, null, '13730586542', '林辉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0317-8617385', '13730586542', null, null, '2019-08-05 19:51:08', 'collect', '2019-08-05 19:51:08', 'collect');
INSERT INTO `sys_user` VALUES ('13306101369', null, null, null, '13306101369', '殷家海', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0511-83722369', '13306101369', null, null, '2019-08-05 19:51:07', 'collect', '2019-08-05 19:51:07', 'collect');
INSERT INTO `sys_user` VALUES ('13951568831', null, null, null, '13951568831', '杭军锋', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0510-85182188', '13951568831', null, null, '2019-08-05 19:51:06', 'collect', '2019-08-05 19:51:06', 'collect');
INSERT INTO `sys_user` VALUES ('18370595554', null, null, null, '18370595554', '黄钏', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0577-62627555', '18370595554', null, null, '2019-08-05 19:51:06', 'collect', '2019-08-05 19:51:06', 'collect');
INSERT INTO `sys_user` VALUES ('18028262969', null, null, null, '18028262969', '杨小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18028262969', null, null, '2019-08-05 19:51:01', 'collect', '2019-08-05 19:51:01', 'collect');
INSERT INTO `sys_user` VALUES ('18028298784', null, null, null, '18028298784', '刘先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0769-81015210', '18028298784', null, null, '2019-08-05 19:51:01', 'collect', '2019-08-05 19:51:01', 'collect');
INSERT INTO `sys_user` VALUES ('13827776035', null, null, null, '13827776035', '施方', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0757-66695200', '13827776035', null, null, '2019-08-05 19:51:01', 'collect', '2019-08-05 19:51:01', 'collect');
INSERT INTO `sys_user` VALUES ('15766226351', null, null, null, '15766226351', '蔡黠', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0757-66695200', '15766226351', null, null, '2019-08-05 19:51:01', 'collect', '2019-08-05 19:51:01', 'collect');
INSERT INTO `sys_user` VALUES ('13911815299', null, null, null, '13911815299', '仲经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-63023589', '13911815299', null, null, '2019-08-05 19:51:01', 'collect', '2019-08-05 19:51:01', 'collect');
INSERT INTO `sys_user` VALUES ('13600318477', null, null, null, '13600318477', '周欢', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0757-85580937', '13600318477', null, null, '2019-08-05 19:51:00', 'collect', '2019-08-05 19:51:00', 'collect');
INSERT INTO `sys_user` VALUES ('15952904688', null, null, null, '15952904688', '孙志超', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15952904688', null, null, '2019-08-05 19:50:59', 'collect', '2019-08-05 19:50:59', 'collect');
INSERT INTO `sys_user` VALUES ('13898149022', null, null, null, '13898149022', '周东东', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '024-87507177', '13898149022', null, null, '2019-08-05 19:50:59', 'collect', '2019-08-05 19:50:59', 'collect');
INSERT INTO `sys_user` VALUES ('13333920366', null, null, null, '13333920366', '连旭', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0392-3291666', '13333920366', null, null, '2019-08-05 19:50:59', 'collect', '2019-08-05 19:50:59', 'collect');
INSERT INTO `sys_user` VALUES ('13932758176', null, null, null, '13932758176', '仲经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0317-4880822', '13932758176', null, null, '2019-08-05 19:50:59', 'collect', '2019-08-05 19:50:59', 'collect');
INSERT INTO `sys_user` VALUES ('13801421501', null, null, null, '13801421501', '杨先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0523-89608736', '13801421501', null, null, '2019-08-05 19:50:59', 'collect', '2019-08-05 19:50:59', 'collect');
INSERT INTO `sys_user` VALUES ('18663728752', null, null, null, '18663728752', '张先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-88828833', '18663728752', null, null, '2019-08-05 19:50:58', 'collect', '2019-08-05 19:50:58', 'collect');
INSERT INTO `sys_user` VALUES ('18122828888', null, null, null, '18122828888', '韩贤文', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0769-85536698', '18122828888', null, null, '2019-08-05 19:50:58', 'collect', '2019-08-05 19:50:58', 'collect');
INSERT INTO `sys_user` VALUES ('15280588281', null, null, null, '15280588281', '邓福清', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0591-87912207', '15280588281', null, null, '2019-08-05 19:50:58', 'collect', '2019-08-05 19:50:58', 'collect');
INSERT INTO `sys_user` VALUES ('13850088152', null, null, null, '13850088152', '陈小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0592-5325165', '13850088152', null, null, '2019-08-05 19:50:58', 'collect', '2019-08-05 19:50:58', 'collect');
INSERT INTO `sys_user` VALUES ('18633730883', null, null, null, '18633730883', '黄伯宁', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0317-2935598', '18633730883', null, null, '2019-08-05 19:50:58', 'collect', '2019-08-05 19:50:58', 'collect');
INSERT INTO `sys_user` VALUES ('15306566701', null, null, null, '15306566701', '缪靖娣', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0571-89969646', '15306566701', null, null, '2019-08-05 19:50:58', 'collect', '2019-08-05 19:50:58', 'collect');
INSERT INTO `sys_user` VALUES ('15889131063', null, null, null, '15889131063', '伍小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0769-33661717', '15889131063', null, null, '2019-08-05 19:50:58', 'collect', '2019-08-05 19:50:58', 'collect');
INSERT INTO `sys_user` VALUES ('15151627330', null, null, null, '15151627330', '王淑婷', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0512-57952127', '15151627330', null, null, '2019-08-05 19:50:58', 'collect', '2019-08-05 19:50:58', 'collect');
INSERT INTO `sys_user` VALUES ('13218349339', null, null, null, '13218349339', '樊莉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0135-25316269', '13218349339', null, null, '2019-08-05 19:50:56', 'collect', '2019-08-05 19:50:56', 'collect');
INSERT INTO `sys_user` VALUES ('13563637216', null, null, null, '13563637216', '刘长营', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-8204628', '13563637216', null, null, '2019-08-05 19:50:56', 'collect', '2019-08-05 19:50:56', 'collect');
INSERT INTO `sys_user` VALUES ('18721151648', null, null, null, '18721151648', '罗燕', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-67627662', '18721151648', null, null, '2019-08-05 19:50:56', 'collect', '2019-08-05 19:50:56', 'collect');
INSERT INTO `sys_user` VALUES ('13543266821', null, null, null, '13543266821', '周经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-27492593', '13543266821', null, null, '2019-08-05 19:50:56', 'collect', '2019-08-05 19:50:56', 'collect');
INSERT INTO `sys_user` VALUES ('18771551998', null, null, null, '18771551998', '张磊', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18771551998', null, null, '2019-08-05 19:50:56', 'collect', '2019-08-05 19:50:56', 'collect');
INSERT INTO `sys_user` VALUES ('13877902368', null, null, null, '13877902368', '虞华尧', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13877902368', null, null, '2019-08-05 19:50:56', 'collect', '2019-08-05 19:50:56', 'collect');
INSERT INTO `sys_user` VALUES ('13726362826', null, null, null, '13726362826', '麦小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '400-8698232', '13726362826', null, null, '2019-08-05 19:50:56', 'collect', '2019-08-05 19:50:56', 'collect');
INSERT INTO `sys_user` VALUES ('18713515627', null, null, null, '18713515627', '张妍', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18713515627', null, null, '2019-08-05 19:50:56', 'collect', '2019-08-05 19:50:56', 'collect');
INSERT INTO `sys_user` VALUES ('13906261773', null, null, null, '13906261773', '顾雪林', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0512-57661099', '13906261773', null, null, '2019-08-05 19:50:56', 'collect', '2019-08-05 19:50:56', 'collect');
INSERT INTO `sys_user` VALUES ('13179397466', null, null, null, '13179397466', '张斌', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0511-83722588', '13179397466', null, null, '2019-08-05 19:50:55', 'collect', '2019-08-05 19:50:55', 'collect');
INSERT INTO `sys_user` VALUES ('15816805020', null, null, null, '15816805020', '叶志辉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15816805020', null, null, '2019-08-05 19:50:55', 'collect', '2019-08-05 19:50:55', 'collect');
INSERT INTO `sys_user` VALUES ('15061487729', null, null, null, '15061487729', '何澄', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15061487729', null, null, '2019-08-05 19:47:26', 'collect', '2019-08-05 19:47:26', 'collect');
INSERT INTO `sys_user` VALUES ('18752970886', null, null, null, '18752970886', '左秀峰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18752970886', null, null, '2019-08-05 19:47:19', 'collect', '2019-08-05 19:47:19', 'collect');
INSERT INTO `sys_user` VALUES ('13218373666', null, null, null, '13218373666', '李力', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13218373666', null, null, '2019-08-05 19:47:19', 'collect', '2019-08-05 19:47:19', 'collect');
INSERT INTO `sys_user` VALUES ('15321344403', null, null, null, '15321344403', '张敏', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-58466575', '15321344403', null, null, '2019-08-05 19:47:19', 'collect', '2019-08-05 19:47:19', 'collect');
INSERT INTO `sys_user` VALUES ('13852944446', null, null, null, '13852944446', '吴智国', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0511-83723578', '13852944446', null, null, '2019-08-05 19:47:18', 'collect', '2019-08-05 19:47:18', 'collect');
INSERT INTO `sys_user` VALUES ('13631798117', null, null, null, '13631798117', '魏厚光', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13631798117', null, null, '2019-08-05 19:47:17', 'collect', '2019-08-05 19:47:17', 'collect');
INSERT INTO `sys_user` VALUES ('13525003679', null, null, null, '13525003679', '张钰霖', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13525003679', null, null, '2019-08-05 19:47:17', 'collect', '2019-08-05 19:47:17', 'collect');
INSERT INTO `sys_user` VALUES ('13583388712', null, null, null, '13583388712', '李业林', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13583388712', null, null, '2019-08-05 19:47:16', 'collect', '2019-08-05 19:47:16', 'collect');
INSERT INTO `sys_user` VALUES ('15358602942', null, null, null, '15358602942', '徐学军', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15358602942', null, null, '2019-08-05 19:47:16', 'collect', '2019-08-05 19:47:16', 'collect');
INSERT INTO `sys_user` VALUES ('13655280083', null, null, null, '13655280083', '戴文君', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0511-86844888', '13655280083', null, null, '2019-08-05 19:47:15', 'collect', '2019-08-05 19:47:15', 'collect');
INSERT INTO `sys_user` VALUES ('13352903532', null, null, null, '13352903532', '周先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0757-86085171', '13352903532', null, null, '2019-08-05 19:47:15', 'collect', '2019-08-05 19:47:15', 'collect');
INSERT INTO `sys_user` VALUES ('13753138991', null, null, null, '13753138991', '董贵生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0351 7430075', '13753138991', null, null, '2019-08-05 19:08:34', 'collect', '2019-08-05 19:08:34', 'collect');
INSERT INTO `sys_user` VALUES ('13967469486', null, null, null, '13967469486', '徐闻享', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0579-87128859', '13967469486', null, null, '2019-08-05 19:08:34', 'collect', '2019-08-05 19:08:34', 'collect');
INSERT INTO `sys_user` VALUES ('13858526148', null, null, null, '13858526148', '蒋天奇', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0575-87606697', '13858526148', null, null, '2019-08-05 19:08:34', 'collect', '2019-08-05 19:08:34', 'collect');
INSERT INTO `sys_user` VALUES ('13958454366', null, null, null, '13958454366', '吕继光', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '579-87503266', '13958454366', null, null, '2019-08-05 19:08:34', 'collect', '2019-08-05 19:08:34', 'collect');
INSERT INTO `sys_user` VALUES ('03125535066', null, null, null, '03125535066', '张庆祥', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0312 5535006', '0312-5535066', null, null, '2019-08-05 19:02:59', 'collect', '2019-08-05 19:02:59', 'collect');
INSERT INTO `sys_user` VALUES ('18332816520', null, null, null, '18332816520', '赵效英', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0312-5958395', '18332816520', null, null, '2019-08-05 19:02:59', 'collect', '2019-08-05 19:02:59', 'collect');
INSERT INTO `sys_user` VALUES ('03167857127', null, null, null, '03167857127', '高雪青', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0316-7857127', '0316-7857127', null, null, '2019-08-05 18:59:47', 'collect', '2019-08-05 18:59:47', 'collect');
INSERT INTO `sys_user` VALUES ('13231782358', null, null, null, '13231782358', '王庆蒙', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0317-2892739', '13231782358', null, null, '2019-08-05 18:58:09', 'collect', '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_user` VALUES ('13473836120', null, null, null, '13473836120', '刘海华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8612545', '13473836120', null, null, '2019-08-05 18:58:09', 'collect', '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_user` VALUES ('13180012164', null, null, null, '13180012164', '刘德辉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8286067', '13180012164', null, null, '2019-08-05 18:58:09', 'collect', '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_user` VALUES ('15075808581', null, null, null, '15075808581', '李明泉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-5259716', '15075808581', null, null, '2019-08-05 18:58:09', 'collect', '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_user` VALUES ('13833751317', null, null, null, '13833751317', '王宝平', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0317-3359577', '13833751317', null, null, '2019-08-05 18:58:09', 'collect', '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_user` VALUES ('13831759187', null, null, null, '13831759187', '郭中奎', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0317-2620118', '13831759187', null, null, '2019-08-05 18:58:09', 'collect', '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_user` VALUES ('15324088292', null, null, null, '15324088292', '孙华利', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-5259821', '15324088292', null, null, '2019-08-05 18:58:09', 'collect', '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_user` VALUES ('18632726822', null, null, null, '18632726822', '李全胜', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0317-3356168', '18632726822', null, null, '2019-08-05 18:58:09', 'collect', '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_user` VALUES ('13001474964', null, null, null, '13001474964', '刘庆川', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-13001474964', '13001474964', null, null, '2019-08-05 18:58:09', 'collect', '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_user` VALUES ('13663386040', null, null, null, '13663386040', '李根洪', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8633315', '13663386040', null, null, '2019-08-05 18:58:09', 'collect', '2019-08-05 18:58:09', 'collect');
INSERT INTO `sys_user` VALUES ('15930380560', null, null, null, '15930380560', '陈瑜娥', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8696116/13833808000', '15930380560', null, null, '2019-08-05 18:58:08', 'collect', '2019-08-05 18:58:08', 'collect');
INSERT INTO `sys_user` VALUES ('13503171979', null, null, null, '13503171979', '赵文华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0317-2951898', '13503171979', null, null, '2019-08-05 18:58:08', 'collect', '2019-08-05 18:58:08', 'collect');
INSERT INTO `sys_user` VALUES ('18653649899', null, null, null, '18653649899', '王立国', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0536 7877179', '18653649899', null, null, '2019-08-05 18:50:27', 'collect', '2019-08-05 18:50:27', 'collect');
INSERT INTO `sys_user` VALUES ('13355258539', null, null, null, '13355258539', '王树秀', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0533-8687715', '13355258539', null, null, '2019-08-05 18:50:27', 'collect', '2019-08-05 18:50:27', 'collect');
INSERT INTO `sys_user` VALUES ('13371566575', null, null, null, '13371566575', '巩秀庭', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0533-8687006', '13371566575', null, null, '2019-08-05 18:50:26', 'collect', '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_user` VALUES ('13153660668', null, null, null, '13153660668', '窦立娟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-3150989', '13153660668', null, null, '2019-08-05 18:50:26', 'collect', '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_user` VALUES ('15589636637', null, null, null, '15589636637', '孙金元', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-7792295', '15589636637', null, null, '2019-08-05 18:50:26', 'collect', '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_user` VALUES ('13589823308', null, null, null, '13589823308', '滕升义', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0535-2482898/2480238', '13589823308', null, null, '2019-08-05 18:50:26', 'collect', '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_user` VALUES ('13705369993', null, null, null, '13705369993', '安刚波', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '536-13792685439', '13705369993', null, null, '2019-08-05 18:50:26', 'collect', '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_user` VALUES ('13475500488', null, null, null, '13475500488', '傅仁光', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0533-8687061', '13475500488', null, null, '2019-08-05 18:50:26', 'collect', '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_user` VALUES ('13853372153', null, null, null, '13853372153', '傅敬信', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0533-8687549', '13853372153', null, null, '2019-08-05 18:50:26', 'collect', '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_user` VALUES ('18653342091', null, null, null, '18653342091', '田华伟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0533-8685896', '18653342091', null, null, '2019-08-05 18:50:26', 'collect', '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_user` VALUES ('13964656617', null, null, null, '13964656617', '陶元欣', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0536 3802765', '13964656617', null, null, '2019-08-05 18:50:26', 'collect', '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_user` VALUES ('13806463459', null, null, null, '13806463459', '张兆锡', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-4006083583', '13806463459', null, null, '2019-08-05 18:50:26', 'collect', '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_user` VALUES ('13953302534', null, null, null, '13953302534', '孙茂伦', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0533-8687840', '13953302534', null, null, '2019-08-05 18:50:26', 'collect', '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_user` VALUES ('13906462263', null, null, null, '13906462263', '牛毅', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-3826785', '13906462263', null, null, '2019-08-05 18:50:26', 'collect', '2019-08-05 18:50:26', 'collect');
INSERT INTO `sys_user` VALUES ('53313706430', null, null, null, '53313706430', '王涛', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '0533-13706430135', null, null, '2019-08-05 18:50:25', 'collect', '2019-08-05 18:50:25', 'collect');
INSERT INTO `sys_user` VALUES ('13920224423', null, null, null, '13920224423', '安全', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-60987620', '13920224423', null, null, '2019-08-05 17:28:39', 'collect', '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_user` VALUES ('13036151645', null, null, null, '13036151645', '王经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13036151645', null, null, '2019-08-05 17:28:39', 'collect', '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_user` VALUES ('15377677997', null, null, null, '15377677997', '王先', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '027-88188028', '15377677997', null, null, '2019-08-05 17:28:39', 'collect', '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_user` VALUES ('13146883203', null, null, null, '13146883203', '葛飞', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '400-7005525', '13146883203', null, null, '2019-08-05 17:28:39', 'collect', '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_user` VALUES ('13952458592', null, null, null, '13952458592', '高云美', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0512-55214810', '13952458592', null, null, '2019-08-05 17:28:39', 'collect', '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_user` VALUES ('13383869298', null, null, null, '13383869298', '梁雪松', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13383869298', null, null, '2019-08-05 17:28:39', 'collect', '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_user` VALUES ('13174336700', null, null, null, '13174336700', '陈先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '83982898', '13174336700', null, null, '2019-08-05 17:28:39', 'collect', '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_user` VALUES ('18222233678', null, null, null, '18222233678', '朱经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18222233678', null, null, '2019-08-05 17:28:39', 'collect', '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_user` VALUES ('13463183908', null, null, null, '13463183908', '赵经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8683811', '13463183908', null, null, '2019-08-05 17:28:39', 'collect', '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_user` VALUES ('13516801191', null, null, null, '13516801191', '陈经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0571-86579331', '13516801191', null, null, '2019-08-05 17:28:39', 'collect', '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_user` VALUES ('13343443022', null, null, null, '13343443022', '陈琦', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0133-43443022', '13343443022', null, null, '2019-08-05 17:28:39', 'collect', '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_user` VALUES ('13623388006', null, null, null, '13623388006', '李建宝', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8688817', '13623388006', null, null, '2019-08-05 17:28:39', 'collect', '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_user` VALUES ('18932810766', null, null, null, '18932810766', '李建宝', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8628817', '18932810766', null, null, '2019-08-05 17:28:39', 'collect', '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_user` VALUES ('13652018381', null, null, null, '13652018381', '吴卫国', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-29162371', '13652018381', null, null, '2019-08-05 17:28:39', 'collect', '2019-08-05 17:28:39', 'collect');
INSERT INTO `sys_user` VALUES ('13363336688', null, null, null, '13363336688', '张经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8686999', '13363336688', null, null, '2019-08-05 17:28:38', 'collect', '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_user` VALUES ('18622115002', null, null, null, '18622115002', '张经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '400-066-8270', '18622115002', null, null, '2019-08-05 17:28:38', 'collect', '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_user` VALUES ('15131884127', null, null, null, '15131884127', '杜金霞', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8689027', '15131884127', null, null, '2019-08-05 17:28:38', 'collect', '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_user` VALUES ('13342060444', null, null, null, '13342060444', '于经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-69106321', '13342060444', null, null, '2019-08-05 17:28:38', 'collect', '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_user` VALUES ('15092214168', null, null, null, '15092214168', '徐林', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15092214168', null, null, '2019-08-05 17:28:38', 'collect', '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_user` VALUES ('15832284431', null, null, null, '15832284431', '何经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15832284431', null, null, '2019-08-05 17:28:38', 'collect', '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_user` VALUES ('13625847113', null, null, null, '13625847113', '谌宏玲', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-63074811', '13625847113', null, null, '2019-08-05 17:28:38', 'collect', '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_user` VALUES ('15503298989', null, null, null, '15503298989', '高丽', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8691010', '15503298989', null, null, '2019-08-05 17:28:38', 'collect', '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_user` VALUES ('15852805975', null, null, null, '15852805975', '朱晓婉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0510-89897799', '15852805975', null, null, '2019-08-05 17:28:38', 'collect', '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_user` VALUES ('13578914787', null, null, null, '13578914787', '梁宇', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0135-78914787', '13578914787', null, null, '2019-08-05 17:28:38', 'collect', '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_user` VALUES ('13403189870', null, null, null, '13403189870', '高经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8762999', '13403189870', null, null, '2019-08-05 17:28:38', 'collect', '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_user` VALUES ('13932858460', null, null, null, '13932858460', '韩福江', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-7973232', '13932858460', null, null, '2019-08-05 17:28:38', 'collect', '2019-08-05 17:28:38', 'collect');
INSERT INTO `sys_user` VALUES ('13589549193', null, null, null, '13589549193', '张经斌', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0533-2391296', '13589549193', null, null, '2019-08-05 17:28:37', 'collect', '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_user` VALUES ('18333808487', null, null, null, '18333808487', '张林', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8769799', '18333808487', null, null, '2019-08-05 17:28:37', 'collect', '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_user` VALUES ('13069543162', null, null, null, '13069543162', '王俊霞', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0374-3362215', '13069543162', null, null, '2019-08-05 17:28:37', 'collect', '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_user` VALUES ('15964485757', null, null, null, '15964485757', '魏衍盟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0533-8686700', '15964485757', null, null, '2019-08-05 17:28:37', 'collect', '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_user` VALUES ('13185573657', null, null, null, '13185573657', '汤吉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0575-87616620', '13185573657', null, null, '2019-08-05 17:28:37', 'collect', '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_user` VALUES ('15963612288', null, null, null, '15963612288', '范跟会', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-6053369', '15963612288', null, null, '2019-08-05 17:28:37', 'collect', '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_user` VALUES ('13505338625', null, null, null, '13505338625', '王兵', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0533-8407266', '13505338625', null, null, '2019-08-05 17:28:37', 'collect', '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_user` VALUES ('13403176711', null, null, null, '13403176711', '张国超', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0317 9988000', '13403176711', null, null, '2019-08-05 17:28:37', 'collect', '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_user` VALUES ('13603185879', null, null, null, '13603185879', '朱德生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13603185879', null, null, '2019-08-05 17:28:37', 'collect', '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_user` VALUES ('13333832680', null, null, null, '13333832680', '王经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-53397334', '13333832680', null, null, '2019-08-05 17:28:37', 'collect', '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_user` VALUES ('15653318001', null, null, null, '15653318001', '巩曰辉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15653318001', null, null, '2019-08-05 17:28:37', 'collect', '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_user` VALUES ('15192952284', null, null, null, '15192952284', '王靖彩', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0539 8236867', '15192952284', null, null, '2019-08-05 17:28:37', 'collect', '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_user` VALUES ('13867623686', null, null, null, '13867623686', '林帮丰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0576-87453362', '13867623686', null, null, '2019-08-05 17:28:37', 'collect', '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_user` VALUES ('15002713303', null, null, null, '15002713303', '徐婷婷', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '15002713303', '15002713303', null, null, '2019-08-05 17:28:37', 'collect', '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_user` VALUES ('13194313335', null, null, null, '13194313335', '梁榆', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0131-94313335', '13194313335', null, null, '2019-08-05 17:28:37', 'collect', '2019-08-05 17:28:37', 'collect');
INSERT INTO `sys_user` VALUES ('18631838625', null, null, null, '18631838625', '刘伟娜', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8622863', '18631838625', null, null, '2019-08-05 17:28:36', 'collect', '2019-08-05 17:28:36', 'collect');
INSERT INTO `sys_user` VALUES ('13656662572', null, null, null, '13656662572', '袁丽娜', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0571-87978860', '13656662572', null, null, '2019-08-05 17:28:36', 'collect', '2019-08-05 17:28:36', 'collect');
INSERT INTO `sys_user` VALUES ('18264742888', null, null, null, '18264742888', '徐经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0537-2584566', '18264742888', null, null, '2019-08-05 17:28:36', 'collect', '2019-08-05 17:28:36', 'collect');
INSERT INTO `sys_user` VALUES ('18611368869', null, null, null, '18611368869', '金涛', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-87598439', '18611368869', null, null, '2019-08-05 17:28:36', 'collect', '2019-08-05 17:28:36', 'collect');
INSERT INTO `sys_user` VALUES ('15965338414', null, null, null, '15965338414', '董献礼', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0533-8683345', '15965338414', null, null, '2019-08-05 17:28:36', 'collect', '2019-08-05 17:28:36', 'collect');
INSERT INTO `sys_user` VALUES ('13403185928', null, null, null, '13403185928', '邱学文', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8286271', '13403185928', null, null, '2019-08-05 17:28:36', 'collect', '2019-08-05 17:28:36', 'collect');
INSERT INTO `sys_user` VALUES ('13831731915', null, null, null, '13831731915', '刘坤', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0317-2891333', '13831731915', null, null, '2019-08-05 17:28:36', 'collect', '2019-08-05 17:28:36', 'collect');
INSERT INTO `sys_user` VALUES ('18622815981', null, null, null, '18622815981', '马福增', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 022 69112256', '18622815981', null, null, '2019-08-05 17:28:36', 'collect', '2019-08-05 17:28:36', 'collect');
INSERT INTO `sys_user` VALUES ('13910154499', null, null, null, '13910154499', '黄福忠', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-60299430', '13910154499', null, null, '2019-08-05 17:28:36', 'collect', '2019-08-05 17:28:36', 'collect');
INSERT INTO `sys_user` VALUES ('13853625056', null, null, null, '13853625056', '杨玉兴', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0536 5773567', '13853625056', null, null, '2019-08-05 17:28:35', 'collect', '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_user` VALUES ('13932800505', null, null, null, '13932800505', '桂冀敏', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0318 8683508', '13932800505', null, null, '2019-08-05 17:28:35', 'collect', '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_user` VALUES ('15961702012', null, null, null, '15961702012', '戴龙', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0510-82405141', '15961702012', null, null, '2019-08-05 17:28:35', 'collect', '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_user` VALUES ('13100112118', null, null, null, '13100112118', '王美萍', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0351-5715111', '13100112118', null, null, '2019-08-05 17:28:35', 'collect', '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_user` VALUES ('13714552246', null, null, null, '13714552246', '关润平', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-13714552246', '13714552246', null, null, '2019-08-05 17:28:35', 'collect', '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_user` VALUES ('13173381798', null, null, null, '13173381798', '姬胜强', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-3860168', '13173381798', null, null, '2019-08-05 17:28:35', 'collect', '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_user` VALUES ('15138496227', null, null, null, '15138496227', '刘劭辉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-56785039', '15138496227', null, null, '2019-08-05 17:28:35', 'collect', '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_user` VALUES ('18605856277', null, null, null, '18605856277', '朱丹丹', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '575-87661158', '18605856277', null, null, '2019-08-05 17:28:35', 'collect', '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_user` VALUES ('13508965099', null, null, null, '13508965099', '田光辉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0536 7877181', '13508965099', null, null, '2019-08-05 17:28:35', 'collect', '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_user` VALUES ('18914060529', null, null, null, '18914060529', '林形铭', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18914060529', null, null, '2019-08-05 17:28:35', 'collect', '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_user` VALUES ('13853383497', null, null, null, '13853383497', '魏瑞锋', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0533-8682383', '13853383497', null, null, '2019-08-05 17:28:35', 'collect', '2019-08-05 17:28:35', 'collect');
INSERT INTO `sys_user` VALUES ('18631840702', null, null, null, '18631840702', '胡国忠', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8678618', '18631840702', null, null, '2019-08-05 17:28:34', 'collect', '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_user` VALUES ('13980886927', null, null, null, '13980886927', '周女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '028-61982776', '13980886927', null, null, '2019-08-05 17:28:34', 'collect', '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_user` VALUES ('13969539356', null, null, null, '13969539356', '苏立宾', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0635-5287377', '13969539356', null, null, '2019-08-05 17:28:34', 'collect', '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_user` VALUES ('13603225148', null, null, null, '13603225148', '李晓辉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0312-6966789', '13603225148', null, null, '2019-08-05 17:28:34', 'collect', '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_user` VALUES ('13833886259', null, null, null, '13833886259', '高陆', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8626289', '13833886259', null, null, '2019-08-05 17:28:34', 'collect', '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_user` VALUES ('13569899511', null, null, null, '13569899511', '杨国强', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0373 8951950', '13569899511', null, null, '2019-08-05 17:28:34', 'collect', '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_user` VALUES ('13889557878', null, null, null, '13889557878', '于海岩', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0411-87878706', '13889557878', null, null, '2019-08-05 17:28:34', 'collect', '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_user` VALUES ('13721756852', null, null, null, '13721756852', '李星美', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0393-8127272', '13721756852', null, null, '2019-08-05 17:28:34', 'collect', '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_user` VALUES ('02288630287', null, null, null, '02288630287', '张妍', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 022 88630287', '022-88630287', null, null, '2019-08-05 17:28:34', 'collect', '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_user` VALUES ('13982290229', null, null, null, '13982290229', '杨女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13982290229', null, null, '2019-08-05 17:28:34', 'collect', '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_user` VALUES ('01052669976', null, null, null, '01052669976', '余丽莉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-52669976', '010-52669976', null, null, '2019-08-05 17:28:34', 'collect', '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_user` VALUES ('18215678995', null, null, null, '18215678995', '杨经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18215678995', null, null, '2019-08-05 17:28:34', 'collect', '2019-08-05 17:28:34', 'collect');
INSERT INTO `sys_user` VALUES ('18832804904', null, null, null, '18832804904', '李先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18832804904', null, null, '2019-08-05 17:28:33', 'collect', '2019-08-05 17:28:33', 'collect');
INSERT INTO `sys_user` VALUES ('15022701293', null, null, null, '15022701293', '董力柱', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-69190259', '15022701293', null, null, '2019-08-05 17:28:33', 'collect', '2019-08-05 17:28:33', 'collect');
INSERT INTO `sys_user` VALUES ('18702821603', null, null, null, '18702821603', '张艳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '028-65539648', '18702821603', null, null, '2019-08-05 17:28:33', 'collect', '2019-08-05 17:28:33', 'collect');
INSERT INTO `sys_user` VALUES ('13313080286', null, null, null, '13313080286', '刘翠丽', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8631209', '13313080286', null, null, '2019-08-05 17:28:33', 'collect', '2019-08-05 17:28:33', 'collect');
INSERT INTO `sys_user` VALUES ('13606461107', null, null, null, '13606461107', '林云峰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '536-2319207', '13606461107', null, null, '2019-08-05 17:28:33', 'collect', '2019-08-05 17:28:33', 'collect');
INSERT INTO `sys_user` VALUES ('15097498382', null, null, null, '15097498382', '李敬', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15097498382', null, null, '2019-08-05 17:28:33', 'collect', '2019-08-05 17:28:33', 'collect');
INSERT INTO `sys_user` VALUES ('18610735121', null, null, null, '18610735121', '赵勇文', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-80148225', '18610735121', null, null, '2019-08-05 17:28:33', 'collect', '2019-08-05 17:28:33', 'collect');
INSERT INTO `sys_user` VALUES ('18832831283', null, null, null, '18832831283', '李经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8635156', '18832831283', null, null, '2019-08-05 17:28:33', 'collect', '2019-08-05 17:28:33', 'collect');
INSERT INTO `sys_user` VALUES ('13821189998', null, null, null, '13821189998', '洪怀玉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 022 26799558/13821189998', '13821189998', null, null, '2019-08-05 17:28:33', 'collect', '2019-08-05 17:28:33', 'collect');
INSERT INTO `sys_user` VALUES ('13581891221', null, null, null, '13581891221', '刘先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '400-0030996', '13581891221', null, null, '2019-08-05 17:28:32', 'collect', '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_user` VALUES ('13952511858', null, null, null, '13952511858', '陈永来', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0514-86738156', '13952511858', null, null, '2019-08-05 17:28:32', 'collect', '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_user` VALUES ('86010873654', null, null, null, '86010873654', '王廷国', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 010 87365475', '4000867688', null, null, '2019-08-05 17:28:32', 'collect', '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_user` VALUES ('13905258957', null, null, null, '13905258957', '马奔腾', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0514-86565166', '13905258957', null, null, '2019-08-05 17:28:32', 'collect', '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_user` VALUES ('03735063179', null, null, null, '03735063179', '侯东鑫', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '086 0373 5063179', '0373-5063179', null, null, '2019-08-05 17:28:32', 'collect', '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_user` VALUES ('15903468850', null, null, null, '15903468850', '李小东', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15903468850', null, null, '2019-08-05 17:28:32', 'collect', '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_user` VALUES ('13905774297', null, null, null, '13905774297', '周建', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0577-86382996', '13905774297', null, null, '2019-08-05 17:28:32', 'collect', '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_user` VALUES ('13961811174', null, null, null, '13961811174', '严经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0510-82449022', '13961811174', null, null, '2019-08-05 17:28:32', 'collect', '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_user` VALUES ('13167366366', null, null, null, '13167366366', '刘刚', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-63707908-603', '13167366366', null, null, '2019-08-05 17:28:32', 'collect', '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_user` VALUES ('13722838650', null, null, null, '13722838650', '路明竹', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8631050', '13722838650', null, null, '2019-08-05 17:28:32', 'collect', '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_user` VALUES ('15081580233', null, null, null, '15081580233', '邱东勇', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15081580233', null, null, '2019-08-05 17:28:32', 'collect', '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_user` VALUES ('13613241569', null, null, null, '13613241569', '殷经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13613241569', null, null, '2019-08-05 17:28:32', 'collect', '2019-08-05 17:28:32', 'collect');
INSERT INTO `sys_user` VALUES ('13513082737', null, null, null, '13513082737', '翟经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '8693737', '13513082737', null, null, '2019-08-05 17:28:29', 'collect', '2019-08-05 17:28:29', 'collect');
INSERT INTO `sys_user` VALUES ('15239994008', null, null, null, '15239994008', '孙丽红', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0393-3277666', '15239994008', null, null, '2019-08-05 17:28:29', 'collect', '2019-08-05 17:28:29', 'collect');
INSERT INTO `sys_user` VALUES ('18215151614', null, null, null, '18215151614', '刘存飞', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18215151614', null, null, '2019-08-05 17:28:29', 'collect', '2019-08-05 17:28:29', 'collect');
INSERT INTO `sys_user` VALUES ('18717952802', null, null, null, '18717952802', '王米', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-66506757', '18717952802', null, null, '2019-08-05 17:28:29', 'collect', '2019-08-05 17:28:29', 'collect');
INSERT INTO `sys_user` VALUES ('13820305620', null, null, null, '13820305620', '张经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-69453046', '13820305620', null, null, '2019-08-05 17:28:28', 'collect', '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_user` VALUES ('15083222202', null, null, null, '15083222202', '石振帅', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0393-8983891', '15083222202', null, null, '2019-08-05 17:28:28', 'collect', '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_user` VALUES ('15130896611', null, null, null, '15130896611', '杨福祥', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8631933', '15130896611', null, null, '2019-08-05 17:28:28', 'collect', '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_user` VALUES ('13920095266', null, null, null, '13920095266', '白先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-27712375', '13920095266', null, null, '2019-08-05 17:28:28', 'collect', '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_user` VALUES ('15822790222', null, null, null, '15822790222', '杨学军', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-69122223/4001-599-669', '15822790222', null, null, '2019-08-05 17:28:28', 'collect', '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_user` VALUES ('13388025113', null, null, null, '13388025113', '尹顺平', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 022 13388025113', '13388025113', null, null, '2019-08-05 17:28:28', 'collect', '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_user` VALUES ('18888291927', null, null, null, '18888291927', '徐瑞珠', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-69921483', '18888291927', null, null, '2019-08-05 17:28:28', 'collect', '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_user` VALUES ('13185093609', null, null, null, '13185093609', '张小财', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '086 0571 87162516', '13185093609', null, null, '2019-08-05 17:28:28', 'collect', '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_user` VALUES ('13860459593', null, null, null, '13860459593', '杨全江', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0592-7615155', '13860459593', null, null, '2019-08-05 17:28:28', 'collect', '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_user` VALUES ('15324189960', null, null, null, '15324189960', '贾秋菊', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-5259718', '15324189960', null, null, '2019-08-05 17:28:28', 'collect', '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_user` VALUES ('06346072616', null, null, null, '06346072616', '魏烈斌', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0634 6072616', '0634-6072616', null, null, '2019-08-05 17:28:28', 'collect', '2019-08-05 17:28:28', 'collect');
INSERT INTO `sys_user` VALUES ('13392218793', null, null, null, '13392218793', '朱三荣', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0757-85653259', '13392218793', null, null, '2019-08-05 17:28:27', 'collect', '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_user` VALUES ('13366879233', null, null, null, '13366879233', '殷经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13366879233', null, null, '2019-08-05 17:28:27', 'collect', '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_user` VALUES ('15169002777', null, null, null, '15169002777', '孟庆辉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-88638200', '15169002777', null, null, '2019-08-05 17:28:27', 'collect', '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_user` VALUES ('13810166636', null, null, null, '13810166636', '苏学贵', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-59323585', '13810166636', null, null, '2019-08-05 17:28:27', 'collect', '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_user` VALUES ('18602245993', null, null, null, '18602245993', '李国良', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-69546629', '18602245993', null, null, '2019-08-05 17:28:27', 'collect', '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_user` VALUES ('13803492246', null, null, null, '13803492246', '闫经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0351-5677739', '13803492246', null, null, '2019-08-05 17:28:27', 'collect', '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_user` VALUES ('13903187056', null, null, null, '13903187056', '韩秋霞', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '318-8686353', '13903187056', null, null, '2019-08-05 17:28:27', 'collect', '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_user` VALUES ('13801938551', null, null, null, '13801938551', '丁建芳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-66149397', '13801938551', null, null, '2019-08-05 17:28:27', 'collect', '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_user` VALUES ('13821191397', null, null, null, '13821191397', '张建行', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 022 69169677', '13821191397', null, null, '2019-08-05 17:28:27', 'collect', '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_user` VALUES ('18980604807', null, null, null, '18980604807', '吴经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18980604807', null, null, '2019-08-05 17:28:27', 'collect', '2019-08-05 17:28:27', 'collect');
INSERT INTO `sys_user` VALUES ('15175809661', null, null, null, '15175809661', '李建卜', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15175809661', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('13298121357', null, null, null, '13298121357', '许女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13298121357', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('15610898282', null, null, null, '15610898282', '孙华利', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8696088', '15610898282', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('13185908181', null, null, null, '13185908181', '童军彪', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-82538329/825338331', '13185908181', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('13785883154', null, null, null, '13785883154', '段金涛', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8777465', '13785883154', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('13393286561', null, null, null, '13393286561', '高继祥', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8628119', '13393286561', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('13831873966', null, null, null, '13831873966', '孔经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8631908', '13831873966', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('13583900039', null, null, null, '13583900039', '李庆三', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0539 13583900039', '13583900039', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('13906183745', null, null, null, '13906183745', '邵建良', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0510 85186177', '13906183745', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('18632819932', null, null, null, '18632819932', '李经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18632819932', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('15371080086', null, null, null, '15371080086', '刘月霞', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15371080086', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('13833788495', null, null, null, '13833788495', '牛庆元', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0317-2317990', '13833788495', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('15533730501', null, null, null, '15533730501', '李春友', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0317-3352899', '15533730501', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('13301184369', null, null, null, '13301184369', '柴经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '400-650-2918', '13301184369', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('18119623681', null, null, null, '18119623681', '张伟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0551-63523967', '18119623681', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('13522369726', null, null, null, '13522369726', '段华磊', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-87220258', '13522369726', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('53313583308', null, null, null, '53313583308', '胥瑟芳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0533 13583308330', '0533 13583308330', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('15888386060', null, null, null, '15888386060', '白云峰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0573-86885589', '15888386060', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('13520203824', null, null, null, '13520203824', '薛全英', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-52567190', '13520203824', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('15267279100', null, null, null, '15267279100', '蔡水明', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15267279100', null, null, '2019-08-05 17:28:26', 'collect', '2019-08-05 17:28:26', 'collect');
INSERT INTO `sys_user` VALUES ('13651081364', null, null, null, '13651081364', '王增春', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-59145567', '13651081364', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('13525518819', null, null, null, '13525518819', '杜光远', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-60901354', '13525518819', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('18911633970', null, null, null, '18911633970', '张经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18911633970', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('15222400822', null, null, null, '15222400822', '苏欣', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 022 15222400822', '15222400822', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('13503189938', null, null, null, '13503189938', '杨朝国', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8681858', '13503189938', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('13780481689', null, null, null, '13780481689', '胡景通', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8674566', '13780481689', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('18858595557', null, null, null, '18858595557', '池沈剑', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0575-87652016/87653223', '18858595557', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('15001875347', null, null, null, '15001875347', '汪姗', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 021 61656527', '15001875347', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('18121210715', null, null, null, '18121210715', '黄小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-68052328', '18121210715', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('13305420218', null, null, null, '13305420218', '张永芹', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0532-83500018', '13305420218', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('13934136655', null, null, null, '13934136655', '黄富刚', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0351-2958968', '13934136655', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('13603172964', null, null, null, '13603172964', '李中宽', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0317 2951206', '13603172964', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('02227996795', null, null, null, '02227996795', '潘洪盛', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 022 27996795', '022 27996795', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('15921483702', null, null, null, '15921483702', '李媛媛', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 021 61656527', '15921483702', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('03174583668', null, null, null, '03174583668', '杨冰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0317 4583668', '0317 4583668', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('13512278084', null, null, null, '13512278084', '王瑞华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-69190077', '13512278084', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('13931796023', null, null, null, '13931796023', '朱清涛', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13931796023', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('13573359276', null, null, null, '13573359276', '孙茂理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0533 8698678', '13573359276', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('13059701604', null, null, null, '13059701604', '陈坤', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13059701604', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('13566858568', null, null, null, '13566858568', '冯云伟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0576-80730668', '13566858568', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('18637923372', null, null, null, '18637923372', '崔经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18637923372', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('13385444466', null, null, null, '13385444466', '李经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0534-7220996', '13385444466', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('18678109687', null, null, null, '18678109687', '魏瑞筠', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0533-8681870', '18678109687', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('13583617977', null, null, null, '13583617977', '袁水训', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-3717518', '13583617977', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('13811720595', null, null, null, '13811720595', '郭启顺', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-61497193', '13811720595', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('13165550371', null, null, null, '13165550371', '何宁', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8636713', '13165550371', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('02152210370', null, null, null, '02152210370', '刘鹏程', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 021 52210370', '021 52210370', null, null, '2019-08-05 17:28:25', 'collect', '2019-08-05 17:28:25', 'collect');
INSERT INTO `sys_user` VALUES ('13866105608', null, null, null, '13866105608', '张伟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0551-63515506', '13866105608', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('15510133988', null, null, null, '15510133988', '丛亚兹', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-67915775', '15510133988', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('13303802200', null, null, null, '13303802200', '朱经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13303802200', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('13052678866', null, null, null, '13052678866', '王强', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0429 4074777', '13052678866', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('03188686660', null, null, null, '03188686660', '刘迎彤', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0086 0318 8686660', '0318 8686660', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('13352068972', null, null, null, '13352068972', '于洪永', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-81198595', '13352068972', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('13551180882', null, null, null, '13551180882', '王永会', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '028-66157322', '13551180882', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('13366697093', null, null, null, '13366697093', '殷二昭', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-52876609', '13366697093', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('13853438448', null, null, null, '13853438448', '孟强', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0534-18653414321', '13853438448', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('15210166616', null, null, null, '15210166616', '苏文章', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 010 57103681', '15210166616', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('15034415927', null, null, null, '15034415927', '郭经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0351-2769451', '15034415927', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('18356017654', null, null, null, '18356017654', '郝经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0551-63521967', '18356017654', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('13582713066', null, null, null, '13582713066', '曹赶祥', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0317-3350788', '13582713066', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('18636882966', null, null, null, '18636882966', '杜海龙', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0351-2963073', '18636882966', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('15831801618', null, null, null, '15831801618', '刘经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8691289', '15831801618', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('13934650335', null, null, null, '13934650335', '赵红柱', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0351-2959803/2959877', '13934650335', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('57989701235', null, null, null, '57989701235', '吴中和', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0579 87299233', '0579-89701235', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('18832832688', null, null, null, '18832832688', '辛经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8691289', '18832832688', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('13503507366', null, null, null, '13503507366', '董雅贵', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0351-2958989', '13503507366', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('13853799022', null, null, null, '13853799022', '谷世超', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0537-7971299', '13853799022', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('13774280590', null, null, null, '13774280590', '徐小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13774280590', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('15044001999', null, null, null, '15044001999', '赵金桥', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0431-81922425', '15044001999', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('15175803918', null, null, null, '15175803918', '张经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8761888', '15175803918', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('18653605045', null, null, null, '18653605045', '曲凯文', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0186-53605045', '018653605045', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('86533868755', null, null, null, '86533868755', '胡安超', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 533 8687553', '533 8687553', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('15666231555', null, null, null, '15666231555', '丁晓辉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-7877966', '15666231555', null, null, '2019-08-05 17:28:24', 'collect', '2019-08-05 17:28:24', 'collect');
INSERT INTO `sys_user` VALUES ('15053376000', null, null, null, '15053376000', '王帅 先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0533 8687597/15053376000', '15053376000', null, null, '2019-08-05 17:28:23', 'collect', '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_user` VALUES ('15933292016', null, null, null, '15933292016', '李经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0317-4880822', '15933292016', null, null, '2019-08-05 17:28:23', 'collect', '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_user` VALUES ('13255562236', null, null, null, '13255562236', '王追厚', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0532-80677500', '13255562236', null, null, '2019-08-05 17:28:23', 'collect', '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_user` VALUES ('15201991300', null, null, null, '15201991300', '吴经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15201991300', null, null, '2019-08-05 17:28:23', 'collect', '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_user` VALUES ('13503736538', null, null, null, '13503736538', '张红亮', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0373-8956318/8955318', '13503736538', null, null, '2019-08-05 17:28:23', 'collect', '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_user` VALUES ('15131801130', null, null, null, '15131801130', '李经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8671130', '15131801130', null, null, '2019-08-05 17:28:23', 'collect', '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_user` VALUES ('18256953135', null, null, null, '18256953135', '汪经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0551-63806688', '18256953135', null, null, '2019-08-05 17:28:23', 'collect', '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_user` VALUES ('13932660062', null, null, null, '13932660062', '孟凡彬', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0316-6911747', '13932660062', null, null, '2019-08-05 17:28:23', 'collect', '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_user` VALUES ('18732832299', null, null, null, '18732832299', '司经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8636713', '18732832299', null, null, '2019-08-05 17:28:23', 'collect', '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_user` VALUES ('15638598029', null, null, null, '15638598029', '刘经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-89915100', '15638598029', null, null, '2019-08-05 17:28:23', 'collect', '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_user` VALUES ('13383310613', null, null, null, '13383310613', '孙女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13383310613', null, null, '2019-08-05 17:28:23', 'collect', '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_user` VALUES ('13703714872', null, null, null, '13703714872', '丁鹏', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-63318036', '13703714872', null, null, '2019-08-05 17:28:23', 'collect', '2019-08-05 17:28:23', 'collect');
INSERT INTO `sys_user` VALUES ('13483708669', null, null, null, '13483708669', '段经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-7079923', '13483708669', null, null, '2019-08-05 17:28:22', 'collect', '2019-08-05 17:28:22', 'collect');
INSERT INTO `sys_user` VALUES ('13439885262', null, null, null, '13439885262', '王玉泽', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-57146150', '13439885262', null, null, '2019-08-05 17:28:22', 'collect', '2019-08-05 17:28:22', 'collect');
INSERT INTO `sys_user` VALUES ('18031886699', null, null, null, '18031886699', '胡景通', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18031886699', null, null, '2019-08-05 17:28:22', 'collect', '2019-08-05 17:28:22', 'collect');
INSERT INTO `sys_user` VALUES ('18832822651', null, null, null, '18832822651', '孙晓琦', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8683229', '18832822651', null, null, '2019-08-05 17:28:22', 'collect', '2019-08-05 17:28:22', 'collect');
INSERT INTO `sys_user` VALUES ('15221306566', null, null, null, '15221306566', '孙小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-61559950', '15221306566', null, null, '2019-08-05 17:28:22', 'collect', '2019-08-05 17:28:22', 'collect');
INSERT INTO `sys_user` VALUES ('13132408383', null, null, null, '13132408383', '李经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8671130', '13132408383', null, null, '2019-08-05 17:28:22', 'collect', '2019-08-05 17:28:22', 'collect');
INSERT INTO `sys_user` VALUES ('18631818387', null, null, null, '18631818387', '孙华利', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8696088', '18631818387', null, null, '2019-08-05 17:28:22', 'collect', '2019-08-05 17:28:22', 'collect');
INSERT INTO `sys_user` VALUES ('15175856300', null, null, null, '15175856300', '辛经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8636713', '15175856300', null, null, '2019-08-05 17:28:21', 'collect', '2019-08-05 17:28:21', 'collect');
INSERT INTO `sys_user` VALUES ('18216985284', null, null, null, '18216985284', '钟豪松', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '400-0735112', '18216985284', null, null, '2019-08-05 17:28:21', 'collect', '2019-08-05 17:28:21', 'collect');
INSERT INTO `sys_user` VALUES ('18832803739', null, null, null, '18832803739', '韩经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-7973097', '18832803739', null, null, '2019-08-05 17:28:21', 'collect', '2019-08-05 17:28:21', 'collect');
INSERT INTO `sys_user` VALUES ('13306139997', null, null, null, '13306139997', '朱经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0512-69356613', '13306139997', null, null, '2019-08-05 17:28:21', 'collect', '2019-08-05 17:28:21', 'collect');
INSERT INTO `sys_user` VALUES ('18631811018', null, null, null, '18631811018', '何琳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8636713', '18631811018', null, null, '2019-08-05 17:28:20', 'collect', '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_user` VALUES ('13589231208', null, null, null, '13589231208', '董淑红', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0532-88562612', '13589231208', null, null, '2019-08-05 17:28:20', 'collect', '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_user` VALUES ('13110069022', null, null, null, '13110069022', '于克增', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-69359161', '13110069022', null, null, '2019-08-05 17:28:20', 'collect', '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_user` VALUES ('13502141333', null, null, null, '13502141333', '张伯东', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-4001866955', '13502141333', null, null, '2019-08-05 17:28:20', 'collect', '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_user` VALUES ('53181251292', null, null, null, '53181251292', '赵斌', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0531 81251292', '0531-81251292', null, null, '2019-08-05 17:28:20', 'collect', '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_user` VALUES ('13563677929', null, null, null, '13563677929', '张兆辉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-7876811', '13563677929', null, null, '2019-08-05 17:28:20', 'collect', '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_user` VALUES ('13006557169', null, null, null, '13006557169', '苑振英', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-7872915', '13006557169', null, null, '2019-08-05 17:28:20', 'collect', '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_user` VALUES ('13775819715', null, null, null, '13775819715', '马亚峰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0516-89874096', '13775819715', null, null, '2019-08-05 17:28:20', 'collect', '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_user` VALUES ('13072275606', null, null, null, '13072275606', '戴学雨', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-26793869', '13072275606', null, null, '2019-08-05 17:28:20', 'collect', '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_user` VALUES ('13704113382', null, null, null, '13704113382', '杨晓勇', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0411 39557661/0351-5553710', '13704113382', null, null, '2019-08-05 17:28:20', 'collect', '2019-08-05 17:28:20', 'collect');
INSERT INTO `sys_user` VALUES ('13917890890', null, null, null, '13917890890', '童新康', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '400-0929567', '13917890890', null, null, '2019-08-05 17:28:19', 'collect', '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_user` VALUES ('15122481280', null, null, null, '15122481280', '肖志强', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-59327098', '15122481280', null, null, '2019-08-05 17:28:19', 'collect', '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_user` VALUES ('13903836092', null, null, null, '13903836092', '王志强', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '000-00000000', '13903836092', null, null, '2019-08-05 17:28:19', 'collect', '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_user` VALUES ('15560269680', null, null, null, '15560269680', '张顺行', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '373-8955666', '15560269680', null, null, '2019-08-05 17:28:19', 'collect', '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_user` VALUES ('15002652238', null, null, null, '15002652238', '贺秀红', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0931-7146697', '15002652238', null, null, '2019-08-05 17:28:19', 'collect', '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_user` VALUES ('13605330363', null, null, null, '13605330363', '宗可海', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0533-8687857', '13605330363', null, null, '2019-08-05 17:28:19', 'collect', '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_user` VALUES ('13011610717', null, null, null, '13011610717', '魏衍修', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0533-8689158', '13011610717', null, null, '2019-08-05 17:28:19', 'collect', '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_user` VALUES ('13306812396', null, null, null, '13306812396', '张国强', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0571-23291508', '13306812396', null, null, '2019-08-05 17:28:19', 'collect', '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_user` VALUES ('13405366861', null, null, null, '13405366861', '杜春洁', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-2591388', '13405366861', null, null, '2019-08-05 17:28:19', 'collect', '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_user` VALUES ('05338018585', null, null, null, '05338018585', '李方成', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0533-8018585', '0533-8018585', null, null, '2019-08-05 17:28:19', 'collect', '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_user` VALUES ('13852663058', null, null, null, '13852663058', '刘云鑫', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0523-88691065,88605802', '13852663058', null, null, '2019-08-05 17:28:19', 'collect', '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_user` VALUES ('13854997008', null, null, null, '13854997008', '祝鹏飞', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0539 2929123', '13854997008', null, null, '2019-08-05 17:28:19', 'collect', '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_user` VALUES ('15832784829', null, null, null, '15832784829', '曹树春', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0317-5538565', '15832784829', null, null, '2019-08-05 17:28:19', 'collect', '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_user` VALUES ('13013974309', null, null, null, '13013974309', '吴洪英', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0516-82309618', '13013974309', null, null, '2019-08-05 17:28:19', 'collect', '2019-08-05 17:28:19', 'collect');
INSERT INTO `sys_user` VALUES ('15890457521', null, null, null, '15890457521', '石振帅', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0393-8983891', '15890457521', null, null, '2019-08-05 17:28:18', 'collect', '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_user` VALUES ('13336685888', null, null, null, '13336685888', '李安平', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0574-65220616', '13336685888', null, null, '2019-08-05 17:28:18', 'collect', '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_user` VALUES ('15022669099', null, null, null, '15022669099', '李洪亮', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-69121858', '15022669099', null, null, '2019-08-05 17:28:18', 'collect', '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_user` VALUES ('15934112333', null, null, null, '15934112333', '王新刚', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0351-5960329', '15934112333', null, null, '2019-08-05 17:28:18', 'collect', '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_user` VALUES ('13722220581', null, null, null, '13722220581', '王浩然', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0312-6453571', '13722220581', null, null, '2019-08-05 17:28:18', 'collect', '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_user` VALUES ('13706438122', null, null, null, '13706438122', '傅敬合', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0533-8687152', '13706438122', null, null, '2019-08-05 17:28:18', 'collect', '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_user` VALUES ('13472184499', null, null, null, '13472184499', '孙玉华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-88189756', '13472184499', null, null, '2019-08-05 17:28:18', 'collect', '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_user` VALUES ('02259328208', null, null, null, '02259328208', '付振东', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-59328208', '022-59328208', null, null, '2019-08-05 17:28:18', 'collect', '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_user` VALUES ('13932781389', null, null, null, '13932781389', '田赶程', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '86 0317 3350030', '13932781389', null, null, '2019-08-05 17:28:18', 'collect', '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_user` VALUES ('13687650751', null, null, null, '13687650751', '刘晓东', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '532-82520677', '13687650751', null, null, '2019-08-05 17:28:18', 'collect', '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_user` VALUES ('13831890178', null, null, null, '13831890178', '刘淑梅', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8615000', '13831890178', null, null, '2019-08-05 17:28:18', 'collect', '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_user` VALUES ('15312533899', null, null, null, '15312533899', '杨一虹', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0519-82797939', '15312533899', null, null, '2019-08-05 17:28:18', 'collect', '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_user` VALUES ('13393235528', null, null, null, '13393235528', '王园园', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0311-83638222', '13393235528', null, null, '2019-08-05 17:28:18', 'collect', '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_user` VALUES ('15512656545', null, null, null, '15512656545', '崔群彦', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15512656545', null, null, '2019-08-05 17:28:18', 'collect', '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_user` VALUES ('18911843001', null, null, null, '18911843001', '杨连柱', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '400-6871039', '18911843001', null, null, '2019-08-05 17:28:18', 'collect', '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_user` VALUES ('13864617960', null, null, null, '13864617960', '陈胜玉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13864617960', null, null, '2019-08-05 17:28:18', 'collect', '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_user` VALUES ('18681815615', null, null, null, '18681815615', '李懿霖', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0-18681815615', '18681815615', null, null, '2019-08-05 17:28:18', 'collect', '2019-08-05 17:28:18', 'collect');
INSERT INTO `sys_user` VALUES ('15605251888', null, null, null, '15605251888', '陈永秋', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0514-86738156', '15605251888', null, null, '2019-08-05 17:28:17', 'collect', '2019-08-05 17:28:17', 'collect');
INSERT INTO `sys_user` VALUES ('13784859195', null, null, null, '13784859195', '范振川', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8632625', '13784859195', null, null, '2019-08-05 17:28:17', 'collect', '2019-08-05 17:28:17', 'collect');
INSERT INTO `sys_user` VALUES ('15011221766', null, null, null, '15011221766', '孙苏道', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-87664625', '15011221766', null, null, '2019-08-05 17:28:17', 'collect', '2019-08-05 17:28:17', 'collect');
INSERT INTO `sys_user` VALUES ('18903188282', null, null, null, '18903188282', '孙华利', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0318-8631209', '18903188282', null, null, '2019-08-05 17:28:17', 'collect', '2019-08-05 17:28:17', 'collect');
INSERT INTO `sys_user` VALUES ('13613129682', null, null, null, '13613129682', '付小宇', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0312-3376500', '13613129682', null, null, '2019-08-05 17:28:17', 'collect', '2019-08-05 17:28:17', 'collect');
INSERT INTO `sys_user` VALUES ('17753815709', null, null, null, '17753815709', '王经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-6368691', '17753815709', null, null, '2019-08-05 15:40:23', 'collect', '2019-08-05 15:40:23', 'collect');
INSERT INTO `sys_user` VALUES ('18678655032', null, null, null, '18678655032', '王楠楠', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-67809899', '18678655032', null, null, '2019-08-05 15:40:23', 'collect', '2019-08-05 15:40:23', 'collect');
INSERT INTO `sys_user` VALUES ('15238579571', null, null, null, '15238579571', '盛红伟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-32313202', '15238579571', null, null, '2019-08-05 15:40:22', 'collect', '2019-08-05 15:40:22', 'collect');
INSERT INTO `sys_user` VALUES ('15900990400', null, null, null, '15900990400', '盛红伟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-51691353', '15900990400', null, null, '2019-08-05 15:40:20', 'collect', '2019-08-05 15:40:20', 'collect');
INSERT INTO `sys_user` VALUES ('15841128368', null, null, null, '15841128368', '齐小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0411-66776875', '15841128368', null, null, '2019-08-05 15:40:20', 'collect', '2019-08-05 15:40:20', 'collect');
INSERT INTO `sys_user` VALUES ('15150009676', null, null, null, '15150009676', '薛先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15150009676', null, null, '2019-08-05 15:40:20', 'collect', '2019-08-05 15:40:20', 'collect');
INSERT INTO `sys_user` VALUES ('18653861905', null, null, null, '18653861905', '邱经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-8880067', '18653861905', null, null, '2019-08-05 15:40:20', 'collect', '2019-08-05 15:40:20', 'collect');
INSERT INTO `sys_user` VALUES ('18653869121', null, null, null, '18653869121', '张君雪', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-8880067', '18653869121', null, null, '2019-08-05 15:40:20', 'collect', '2019-08-05 15:40:20', 'collect');
INSERT INTO `sys_user` VALUES ('15991893576', null, null, null, '15991893576', '蒲女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '029-86363898', '15991893576', null, null, '2019-08-05 15:40:19', 'collect', '2019-08-05 15:40:19', 'collect');
INSERT INTO `sys_user` VALUES ('17395035528', null, null, null, '17395035528', '张经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0951-6876881', '17395035528', null, null, '2019-08-05 15:40:19', 'collect', '2019-08-05 15:40:19', 'collect');
INSERT INTO `sys_user` VALUES ('15589715136', null, null, null, '15589715136', '杜经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0537-2228388', '15589715136', null, null, '2019-08-05 15:40:18', 'collect', '2019-08-05 15:40:18', 'collect');
INSERT INTO `sys_user` VALUES ('18553876533', null, null, null, '18553876533', '郭广胜', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-6051818', '18553876533', null, null, '2019-08-05 15:40:18', 'collect', '2019-08-05 15:40:18', 'collect');
INSERT INTO `sys_user` VALUES ('17705421226', null, null, null, '17705421226', '魏女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '17705421226', null, null, '2019-08-05 15:40:18', 'collect', '2019-08-05 15:40:18', 'collect');
INSERT INTO `sys_user` VALUES ('13146009767', null, null, null, '13146009767', '王先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-65911327', '13146009767', null, null, '2019-08-05 15:40:18', 'collect', '2019-08-05 15:40:18', 'collect');
INSERT INTO `sys_user` VALUES ('15643493333', null, null, null, '15643493333', '张经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0431-89630229', '15643493333', null, null, '2019-08-05 15:40:18', 'collect', '2019-08-05 15:40:18', 'collect');
INSERT INTO `sys_user` VALUES ('15668655293', null, null, null, '15668655293', '鲁文斌', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0411-86867705', '15668655293', null, null, '2019-08-05 15:40:17', 'collect', '2019-08-05 15:40:17', 'collect');
INSERT INTO `sys_user` VALUES ('13820926545', null, null, null, '13820926545', '徐萌', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13820926545', null, null, '2019-08-05 15:40:17', 'collect', '2019-08-05 15:40:17', 'collect');
INSERT INTO `sys_user` VALUES ('18660832018', null, null, null, '18660832018', '万经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-8265977', '18660832018', null, null, '2019-08-05 15:40:17', 'collect', '2019-08-05 15:40:17', 'collect');
INSERT INTO `sys_user` VALUES ('18653856062', null, null, null, '18653856062', '孙女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-8085677', '18653856062', null, null, '2019-08-05 15:40:17', 'collect', '2019-08-05 15:40:17', 'collect');
INSERT INTO `sys_user` VALUES ('13792240821', null, null, null, '13792240821', '李静', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0534-2182888', '13792240821', null, null, '2019-08-05 15:40:17', 'collect', '2019-08-05 15:40:17', 'collect');
INSERT INTO `sys_user` VALUES ('18920165182', null, null, null, '18920165182', '程伟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-58554428', '18920165182', null, null, '2019-08-05 15:40:17', 'collect', '2019-08-05 15:40:17', 'collect');
INSERT INTO `sys_user` VALUES ('15628889929', null, null, null, '15628889929', '王昌永', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15628889929', null, null, '2019-08-05 15:40:17', 'collect', '2019-08-05 15:40:17', 'collect');
INSERT INTO `sys_user` VALUES ('13592513682', null, null, null, '13592513682', '王小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13592513682', null, null, '2019-08-05 15:40:16', 'collect', '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_user` VALUES ('18606161086', null, null, null, '18606161086', '陈贯利', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0516-66885568', '18606161086', null, null, '2019-08-05 15:40:16', 'collect', '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_user` VALUES ('15854807003', null, null, null, '15854807003', '李茂丽', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15854807003', null, null, '2019-08-05 15:40:16', 'collect', '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_user` VALUES ('15353501852', null, null, null, '15353501852', '赵薇', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15353501852', null, null, '2019-08-05 15:40:16', 'collect', '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_user` VALUES ('15342060290', null, null, null, '15342060290', '韩经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15342060290', null, null, '2019-08-05 15:40:16', 'collect', '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_user` VALUES ('15896642509', null, null, null, '15896642509', '杜女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0379-64588155', '15896642509', null, null, '2019-08-05 15:40:16', 'collect', '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_user` VALUES ('13428971870', null, null, null, '13428971870', '高杰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-27589066', '13428971870', null, null, '2019-08-05 15:40:16', 'collect', '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_user` VALUES ('13897497167', null, null, null, '13897497167', '王经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13897497167', null, null, '2019-08-05 15:40:16', 'collect', '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_user` VALUES ('15530152246', null, null, null, '15530152246', '梁经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15530152246', null, null, '2019-08-05 15:40:16', 'collect', '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_user` VALUES ('13207153908', null, null, null, '13207153908', '肖经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13207153908', null, null, '2019-08-05 15:40:16', 'collect', '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_user` VALUES ('18152309850', null, null, null, '18152309850', '李东刚', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0951-8681110', '18152309850', null, null, '2019-08-05 15:40:16', 'collect', '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_user` VALUES ('18144000278', null, null, null, '18144000278', '王冲', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0591-83264511', '18144000278', null, null, '2019-08-05 15:40:16', 'collect', '2019-08-05 15:40:16', 'collect');
INSERT INTO `sys_user` VALUES ('15753090312', null, null, null, '15753090312', '姚远', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0530-5191393', '15753090312', null, null, '2019-08-05 15:40:15', 'collect', '2019-08-05 15:40:15', 'collect');
INSERT INTO `sys_user` VALUES ('15121876213', null, null, null, '15121876213', '小苏', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0951-3028256', '15121876213', null, null, '2019-08-05 15:40:15', 'collect', '2019-08-05 15:40:15', 'collect');
INSERT INTO `sys_user` VALUES ('18621994001', null, null, null, '18621994001', '区域经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-65083039', '18621994001', null, null, '2019-08-05 15:40:15', 'collect', '2019-08-05 15:40:15', 'collect');
INSERT INTO `sys_user` VALUES ('18053766998', null, null, null, '18053766998', '李肖', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0537-3169296', '18053766998', null, null, '2019-08-05 15:40:15', 'collect', '2019-08-05 15:40:15', 'collect');
INSERT INTO `sys_user` VALUES ('13915181617', null, null, null, '13915181617', '晓荷', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0517-86992405', '13915181617', null, null, '2019-08-05 15:40:15', 'collect', '2019-08-05 15:40:15', 'collect');
INSERT INTO `sys_user` VALUES ('15959154529', null, null, null, '15959154529', '邱先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0591-83051253', '15959154529', null, null, '2019-08-05 15:40:15', 'collect', '2019-08-05 15:40:15', 'collect');
INSERT INTO `sys_user` VALUES ('15613165013', null, null, null, '15613165013', '张女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15613165013', null, null, '2019-08-05 15:40:15', 'collect', '2019-08-05 15:40:15', 'collect');
INSERT INTO `sys_user` VALUES ('18654634494', null, null, null, '18654634494', '山东联强', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0546-8271915', '18654634494', null, null, '2019-08-05 15:40:15', 'collect', '2019-08-05 15:40:15', 'collect');
INSERT INTO `sys_user` VALUES ('18905485277', null, null, null, '18905485277', '杜经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18905485277', null, null, '2019-08-05 15:40:14', 'collect', '2019-08-05 15:40:14', 'collect');
INSERT INTO `sys_user` VALUES ('13760115494', null, null, null, '13760115494', '张志东', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0512-66709537', '13760115494', null, null, '2019-08-05 15:40:14', 'collect', '2019-08-05 15:40:14', 'collect');
INSERT INTO `sys_user` VALUES ('13011223344', null, null, null, '13011223344', '孙先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '024-72669731', '13011223344', null, null, '2019-08-05 15:40:13', 'collect', '2019-08-05 15:40:13', 'collect');
INSERT INTO `sys_user` VALUES ('15332195529', null, null, null, '15332195529', '戎小莹', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15332195529', null, null, '2019-08-05 15:40:13', 'collect', '2019-08-05 15:40:13', 'collect');
INSERT INTO `sys_user` VALUES ('15961289738', null, null, null, '15961289738', '吕先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0519-83095205', '15961289738', null, null, '2019-08-05 15:40:13', 'collect', '2019-08-05 15:40:13', 'collect');
INSERT INTO `sys_user` VALUES ('13613069518', null, null, null, '13613069518', '肖经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13613069518', null, null, '2019-08-05 15:40:11', 'collect', '2019-08-05 15:40:11', 'collect');
INSERT INTO `sys_user` VALUES ('13225471980', null, null, null, '13225471980', '杨经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0537-1600016', '13225471980', null, null, '2019-08-05 15:40:11', 'collect', '2019-08-05 15:40:11', 'collect');
INSERT INTO `sys_user` VALUES ('13319207716', null, null, null, '13319207716', '黄翠尔', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '029-86246098', '13319207716', null, null, '2019-08-05 15:40:10', 'collect', '2019-08-05 15:40:10', 'collect');
INSERT INTO `sys_user` VALUES ('17732221909', null, null, null, '17732221909', '孙经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0312-2136625', '17732221909', null, null, '2019-08-05 15:40:10', 'collect', '2019-08-05 15:40:10', 'collect');
INSERT INTO `sys_user` VALUES ('18611697733', null, null, null, '18611697733', '康建华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-60753072', '18611697733', null, null, '2019-08-05 15:40:10', 'collect', '2019-08-05 15:40:10', 'collect');
INSERT INTO `sys_user` VALUES ('18920903187', null, null, null, '18920903187', '刘俊丽', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18920903187', null, null, '2019-08-05 15:40:09', 'collect', '2019-08-05 15:40:09', 'collect');
INSERT INTO `sys_user` VALUES ('13466657733', null, null, null, '13466657733', '康建华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-60753072', '13466657733', null, null, '2019-08-05 15:40:07', 'collect', '2019-08-05 15:40:07', 'collect');
INSERT INTO `sys_user` VALUES ('18931003555', null, null, null, '18931003555', '赵振凯', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18931003555', null, null, '2019-08-05 15:40:07', 'collect', '2019-08-05 15:40:07', 'collect');
INSERT INTO `sys_user` VALUES ('15005608292', null, null, null, '15005608292', '余有春', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0551-63640078', '15005608292', null, null, '2019-08-05 15:40:06', 'collect', '2019-08-05 15:40:06', 'collect');
INSERT INTO `sys_user` VALUES ('13811161986', null, null, null, '13811161986', '周慧平', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-52886093', '13811161986', null, null, '2019-08-05 15:40:06', 'collect', '2019-08-05 15:40:06', 'collect');
INSERT INTO `sys_user` VALUES ('13412442617', null, null, null, '13412442617', '李成协', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0769-89023609', '13412442617', null, null, '2019-08-05 15:40:05', 'collect', '2019-08-05 15:40:05', 'collect');
INSERT INTO `sys_user` VALUES ('15256698898', null, null, null, '15256698898', '李经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0550-7621958', '15256698898', null, null, '2019-08-05 15:40:05', 'collect', '2019-08-05 15:40:05', 'collect');
INSERT INTO `sys_user` VALUES ('13792162101', null, null, null, '13792162101', '姜志鸿', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13792162101', null, null, '2019-08-05 15:40:05', 'collect', '2019-08-05 15:40:05', 'collect');
INSERT INTO `sys_user` VALUES ('13628980441', null, null, null, '13628980441', '刘琳琳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13628980441', null, null, '2019-08-05 15:40:05', 'collect', '2019-08-05 15:40:05', 'collect');
INSERT INTO `sys_user` VALUES ('18037270632', null, null, null, '18037270632', '刘愉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-55810601', '18037270632', null, null, '2019-08-05 15:40:05', 'collect', '2019-08-05 15:40:05', 'collect');
INSERT INTO `sys_user` VALUES ('13282106027', null, null, null, '13282106027', '任经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '400-870-7576', '13282106027', null, null, '2019-08-05 15:40:04', 'collect', '2019-08-05 15:40:04', 'collect');
INSERT INTO `sys_user` VALUES ('17303816163', null, null, null, '17303816163', '郑圣杰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-69082289', '17303816163', null, null, '2019-08-05 15:40:03', 'collect', '2019-08-05 15:40:03', 'collect');
INSERT INTO `sys_user` VALUES ('18654645356', null, null, null, '18654645356', '崔红', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0546-6449019', '18654645356', null, null, '2019-08-05 15:40:03', 'collect', '2019-08-05 15:40:03', 'collect');
INSERT INTO `sys_user` VALUES ('17094016479', null, null, null, '17094016479', '张昆明', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '17094016479', null, null, '2019-08-05 15:40:03', 'collect', '2019-08-05 15:40:03', 'collect');
INSERT INTO `sys_user` VALUES ('17068020942', null, null, null, '17068020942', '赵献童', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '17068020942', null, null, '2019-08-05 15:40:02', 'collect', '2019-08-05 15:40:02', 'collect');
INSERT INTO `sys_user` VALUES ('13319207709', null, null, null, '13319207709', '苏洪镇', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '029-86246098', '13319207709', null, null, '2019-08-05 15:40:02', 'collect', '2019-08-05 15:40:02', 'collect');
INSERT INTO `sys_user` VALUES ('17096185340', null, null, null, '17096185340', '李朝文', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '17096185340', null, null, '2019-08-05 15:40:02', 'collect', '2019-08-05 15:40:02', 'collect');
INSERT INTO `sys_user` VALUES ('13542580731', null, null, null, '13542580731', '张亮', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13542580731', null, null, '2019-08-05 15:40:02', 'collect', '2019-08-05 15:40:02', 'collect');
INSERT INTO `sys_user` VALUES ('13619287288', null, null, null, '13619287288', '苏永水', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '029-86246098', '13619287288', null, null, '2019-08-05 15:40:01', 'collect', '2019-08-05 15:40:01', 'collect');
INSERT INTO `sys_user` VALUES ('13333716115', null, null, null, '13333716115', '经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0371-55661762', '13333716115', null, null, '2019-08-05 15:40:01', 'collect', '2019-08-05 15:40:01', 'collect');
INSERT INTO `sys_user` VALUES ('15064012769', null, null, null, '15064012769', '宋莹莹', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15064012769', null, null, '2019-08-05 15:40:01', 'collect', '2019-08-05 15:40:01', 'collect');
INSERT INTO `sys_user` VALUES ('15801258118', null, null, null, '15801258118', '王北光', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-80493720', '15801258118', null, null, '2019-08-05 15:40:01', 'collect', '2019-08-05 15:40:01', 'collect');
INSERT INTO `sys_user` VALUES ('13996087680', null, null, null, '13996087680', '肖代龙', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '023-67188842', '13996087680', null, null, '2019-08-05 15:40:01', 'collect', '2019-08-05 15:40:01', 'collect');
INSERT INTO `sys_user` VALUES ('13701064021', null, null, null, '13701064021', '于京光', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-69293653', '13701064021', null, null, '2019-08-05 15:40:00', 'collect', '2019-08-05 15:40:00', 'collect');
INSERT INTO `sys_user` VALUES ('13903127141', null, null, null, '13903127141', '闫宁', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0312-3156008', '13903127141', null, null, '2019-08-05 15:40:00', 'collect', '2019-08-05 15:40:00', 'collect');
INSERT INTO `sys_user` VALUES ('13652561206', null, null, null, '13652561206', '汪旺群', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0769-85077633', '13652561206', null, null, '2019-08-05 15:40:00', 'collect', '2019-08-05 15:40:00', 'collect');
INSERT INTO `sys_user` VALUES ('15116152026', null, null, null, '15116152026', '苏经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0731-82732023', '15116152026', null, null, '2019-08-05 15:40:00', 'collect', '2019-08-05 15:40:00', 'collect');
INSERT INTO `sys_user` VALUES ('13608980122', null, null, null, '13608980122', '车高平', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0532-88365027', '13608980122', null, null, '2019-08-05 15:39:59', 'collect', '2019-08-05 15:39:59', 'collect');
INSERT INTO `sys_user` VALUES ('18209256871', null, null, null, '18209256871', '乔艳红', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '029-82565867', '18209256871', null, null, '2019-08-05 15:39:59', 'collect', '2019-08-05 15:39:59', 'collect');
INSERT INTO `sys_user` VALUES ('18681191735', null, null, null, '18681191735', '梁静', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0769-85098277', '18681191735', null, null, '2019-08-05 15:39:59', 'collect', '2019-08-05 15:39:59', 'collect');
INSERT INTO `sys_user` VALUES ('18665581389', null, null, null, '18665581389', '王贞俭', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '020-62924560', '18665581389', null, null, '2019-08-05 15:39:58', 'collect', '2019-08-05 15:39:58', 'collect');
INSERT INTO `sys_user` VALUES ('13658678188', null, null, null, '13658678188', '冯经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0532-80663632', '13658678188', null, null, '2019-08-05 15:39:56', 'collect', '2019-08-05 15:39:56', 'collect');
INSERT INTO `sys_user` VALUES ('13046462116', null, null, null, '13046462116', '智工', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0536-4962666', '13046462116', null, null, '2019-08-05 15:39:56', 'collect', '2019-08-05 15:39:56', 'collect');
INSERT INTO `sys_user` VALUES ('18936752888', null, null, null, '18936752888', '吕义生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0517-86863345', '18936752888', null, null, '2019-08-05 15:39:56', 'collect', '2019-08-05 15:39:56', 'collect');
INSERT INTO `sys_user` VALUES ('18012669172', null, null, null, '18012669172', '孟小辉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0512-57017568', '18012669172', null, null, '2019-08-05 15:39:55', 'collect', '2019-08-05 15:39:55', 'collect');
INSERT INTO `sys_user` VALUES ('15999729348', null, null, null, '15999729348', '石煊昕', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0769-22980894', '15999729348', null, null, '2019-08-05 15:39:55', 'collect', '2019-08-05 15:39:55', 'collect');
INSERT INTO `sys_user` VALUES ('18266505658', null, null, null, '18266505658', '杨勇', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-5078908', '18266505658', null, null, '2019-08-05 15:39:55', 'collect', '2019-08-05 15:39:55', 'collect');
INSERT INTO `sys_user` VALUES ('18615531169', null, null, null, '18615531169', '孙俊峰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-85966899', '18615531169', null, null, '2019-08-05 15:39:55', 'collect', '2019-08-05 15:39:55', 'collect');
INSERT INTO `sys_user` VALUES ('13965983208', null, null, null, '13965983208', '天康', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0551-00000000', '13965983208', null, null, '2019-08-05 15:39:55', 'collect', '2019-08-05 15:39:55', 'collect');
INSERT INTO `sys_user` VALUES ('18522251970', null, null, null, '18522251970', '晨曦', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18522251970', null, null, '2019-08-05 15:39:54', 'collect', '2019-08-05 15:39:54', 'collect');
INSERT INTO `sys_user` VALUES ('18015380190', null, null, null, '18015380190', '张凤雏', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0510-86199195', '18015380190', null, null, '2019-08-05 15:39:54', 'collect', '2019-08-05 15:39:54', 'collect');
INSERT INTO `sys_user` VALUES ('15071166535', null, null, null, '15071166535', '刘磊', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '027-87878268', '15071166535', null, null, '2019-08-05 15:39:53', 'collect', '2019-08-05 15:39:53', 'collect');
INSERT INTO `sys_user` VALUES ('15688822786', null, null, null, '15688822786', '王芳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-5078800', '15688822786', null, null, '2019-08-05 15:39:53', 'collect', '2019-08-05 15:39:53', 'collect');
INSERT INTO `sys_user` VALUES ('13545126583', null, null, null, '13545126583', '孙绪强', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '027-86652733', '13545126583', null, null, '2019-08-05 15:39:53', 'collect', '2019-08-05 15:39:53', 'collect');
INSERT INTO `sys_user` VALUES ('13825789207', null, null, null, '13825789207', '张俊晓', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0769-89872545', '13825789207', null, null, '2019-08-05 15:39:53', 'collect', '2019-08-05 15:39:53', 'collect');
INSERT INTO `sys_user` VALUES ('13868622060', null, null, null, '13868622060', '李锦华', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13868622060', null, null, '2019-08-05 15:39:52', 'collect', '2019-08-05 15:39:52', 'collect');
INSERT INTO `sys_user` VALUES ('13950169707', null, null, null, '13950169707', '罗希茜', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0592-5197842', '13950169707', null, null, '2019-08-05 15:39:52', 'collect', '2019-08-05 15:39:52', 'collect');
INSERT INTO `sys_user` VALUES ('18630360055', null, null, null, '18630360055', '顾伟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0335-7979008', '18630360055', null, null, '2019-08-05 15:39:52', 'collect', '2019-08-05 15:39:52', 'collect');
INSERT INTO `sys_user` VALUES ('13812008880', null, null, null, '13812008880', '孟东南', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0510-83298888', '13812008880', null, null, '2019-08-05 15:39:52', 'collect', '2019-08-05 15:39:52', 'collect');
INSERT INTO `sys_user` VALUES ('15332132956', null, null, null, '15332132956', '王进', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-58139496', '15332132956', null, null, '2019-08-05 15:39:51', 'collect', '2019-08-05 15:39:51', 'collect');
INSERT INTO `sys_user` VALUES ('18560177973', null, null, null, '18560177973', '董经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-67807077', '18560177973', null, null, '2019-08-05 15:39:51', 'collect', '2019-08-05 15:39:51', 'collect');
INSERT INTO `sys_user` VALUES ('15332155256', null, null, null, '15332155256', '乔经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15332155256', null, null, '2019-08-05 15:39:51', 'collect', '2019-08-05 15:39:51', 'collect');
INSERT INTO `sys_user` VALUES ('13176129088', null, null, null, '13176129088', '程经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-6212869', '13176129088', null, null, '2019-08-05 15:39:51', 'collect', '2019-08-05 15:39:51', 'collect');
INSERT INTO `sys_user` VALUES ('13956968779', null, null, null, '13956968779', '李海景', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0551-63822832', '13956968779', null, null, '2019-08-05 15:39:50', 'collect', '2019-08-05 15:39:50', 'collect');
INSERT INTO `sys_user` VALUES ('18602809769', null, null, null, '18602809769', '钱凯', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-62220238', '18602809769', null, null, '2019-08-05 15:39:50', 'collect', '2019-08-05 15:39:50', 'collect');
INSERT INTO `sys_user` VALUES ('18602809709', null, null, null, '18602809709', '大彻', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-62220238', '18602809709', null, null, '2019-08-05 15:39:50', 'collect', '2019-08-05 15:39:50', 'collect');
INSERT INTO `sys_user` VALUES ('18918042547', null, null, null, '18918042547', '杨文', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-35350722', '18918042547', null, null, '2019-08-05 15:39:50', 'collect', '2019-08-05 15:39:50', 'collect');
INSERT INTO `sys_user` VALUES ('13181806009', null, null, null, '13181806009', '王希康', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-5558777', '13181806009', null, null, '2019-08-05 15:39:50', 'collect', '2019-08-05 15:39:50', 'collect');
INSERT INTO `sys_user` VALUES ('15871811266', null, null, null, '15871811266', '简鸿莹', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '027-87596115', '15871811266', null, null, '2019-08-05 15:39:49', 'collect', '2019-08-05 15:39:49', 'collect');
INSERT INTO `sys_user` VALUES ('18823798418', null, null, null, '18823798418', '钟小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0755-83999416', '18823798418', null, null, '2019-08-05 15:39:49', 'collect', '2019-08-05 15:39:49', 'collect');
INSERT INTO `sys_user` VALUES ('15853187128', null, null, null, '15853187128', '徐经历', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-88018000', '15853187128', null, null, '2019-08-05 15:39:48', 'collect', '2019-08-05 15:39:48', 'collect');
INSERT INTO `sys_user` VALUES ('13930252698', null, null, null, '13930252698', '邸志峰', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0312-4980589', '13930252698', null, null, '2019-08-05 15:39:48', 'collect', '2019-08-05 15:39:48', 'collect');
INSERT INTO `sys_user` VALUES ('13950108836', null, null, null, '13950108836', '陈学祥', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0592-2055868', '13950108836', null, null, '2019-08-05 15:39:47', 'collect', '2019-08-05 15:39:47', 'collect');
INSERT INTO `sys_user` VALUES ('13752007405', null, null, null, '13752007405', '李克辉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13752007405', null, null, '2019-08-05 15:39:47', 'collect', '2019-08-05 15:39:47', 'collect');
INSERT INTO `sys_user` VALUES ('15921591628', null, null, null, '15921591628', '王前', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-59948108', '15921591628', null, null, '2019-08-05 15:39:47', 'collect', '2019-08-05 15:39:47', 'collect');
INSERT INTO `sys_user` VALUES ('18332750808', null, null, null, '18332750808', '任先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0315-5775276', '18332750808', null, null, '2019-08-05 15:39:46', 'collect', '2019-08-05 15:39:46', 'collect');
INSERT INTO `sys_user` VALUES ('13790278600', null, null, null, '13790278600', '杨先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0769-85899565', '13790278600', null, null, '2019-08-05 15:39:46', 'collect', '2019-08-05 15:39:46', 'collect');
INSERT INTO `sys_user` VALUES ('15122683026', null, null, null, '15122683026', '刘女士', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15122683026', null, null, '2019-08-05 15:39:46', 'collect', '2019-08-05 15:39:46', 'collect');
INSERT INTO `sys_user` VALUES ('13817047212', null, null, null, '13817047212', '陈欣', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '021-61995610', '13817047212', null, null, '2019-08-05 15:39:45', 'collect', '2019-08-05 15:39:45', 'collect');
INSERT INTO `sys_user` VALUES ('15854808279', null, null, null, '15854808279', '孙经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0538-6111189', '15854808279', null, null, '2019-08-05 15:39:45', 'collect', '2019-08-05 15:39:45', 'collect');
INSERT INTO `sys_user` VALUES ('13412066881', null, null, null, '13412066881', '彭小姐', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0769-82885570', '13412066881', null, null, '2019-08-05 15:39:44', 'collect', '2019-08-05 15:39:44', 'collect');
INSERT INTO `sys_user` VALUES ('13631726855', null, null, null, '13631726855', '赵小丽', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0769-81551929', '13631726855', null, null, '2019-08-05 15:39:43', 'collect', '2019-08-05 15:39:43', 'collect');
INSERT INTO `sys_user` VALUES ('13602137929', null, null, null, '13602137929', '徐义顺', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13602137929', null, null, '2019-08-05 15:39:43', 'collect', '2019-08-05 15:39:43', 'collect');
INSERT INTO `sys_user` VALUES ('18606198581', null, null, null, '18606198581', '沈真', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '025-58751292', '18606198581', null, null, '2019-08-05 15:39:43', 'collect', '2019-08-05 15:39:43', 'collect');
INSERT INTO `sys_user` VALUES ('18958809811', null, null, null, '18958809811', '吴莉', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0577-62988111', '18958809811', null, null, '2019-08-05 15:39:43', 'collect', '2019-08-05 15:39:43', 'collect');
INSERT INTO `sys_user` VALUES ('13790663069', null, null, null, '13790663069', '石先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0769-85384121', '13790663069', null, null, '2019-08-05 15:39:42', 'collect', '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_user` VALUES ('15320098930', null, null, null, '15320098930', '孙经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15320098930', null, null, '2019-08-05 15:39:42', 'collect', '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_user` VALUES ('17632100210', null, null, null, '17632100210', '张经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0314-2070906', '17632100210', null, null, '2019-08-05 15:39:42', 'collect', '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_user` VALUES ('15153876008', null, null, null, '15153876008', '赵玲', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15153876008', null, null, '2019-08-05 15:39:42', 'collect', '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_user` VALUES ('18640095080', null, null, null, '18640095080', '徐鸿宇', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '024-23751504', '18640095080', null, null, '2019-08-05 15:39:42', 'collect', '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_user` VALUES ('18505209009', null, null, null, '18505209009', '任经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0519-69863072', '18505209009', null, null, '2019-08-05 15:39:42', 'collect', '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_user` VALUES ('13906126648', null, null, null, '13906126648', '张哲', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0519-86665007', '13906126648', null, null, '2019-08-05 15:39:42', 'collect', '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_user` VALUES ('13370333136', null, null, null, '13370333136', '刘阳', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13370333136', null, null, '2019-08-05 15:39:42', 'collect', '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_user` VALUES ('18653822288', null, null, null, '18653822288', '李经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18653822288', null, null, '2019-08-05 15:39:42', 'collect', '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_user` VALUES ('13382351808', null, null, null, '13382351808', '万先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13382351808', null, null, '2019-08-05 15:39:42', 'collect', '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_user` VALUES ('13869805252', null, null, null, '13869805252', '艾可', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '13869805252', null, null, '2019-08-05 15:39:42', 'collect', '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_user` VALUES ('18910799923', null, null, null, '18910799923', '董经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18910799923', null, null, '2019-08-05 15:39:42', 'collect', '2019-08-05 15:39:42', 'collect');
INSERT INTO `sys_user` VALUES ('51885383190', null, null, null, '51885383190', '丁伟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0518-85916595', '0518-85383190/85916595', null, null, '2019-08-05 15:39:41', 'collect', '2019-08-05 15:39:41', 'collect');
INSERT INTO `sys_user` VALUES ('13811763835', null, null, null, '13811763835', '郝政达', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-56371262', '13811763835', null, null, '2019-08-05 15:39:41', 'collect', '2019-08-05 15:39:41', 'collect');
INSERT INTO `sys_user` VALUES ('13573143202', null, null, null, '13573143202', '王龙龙', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '0531-88683882', '13573143202', null, null, '2019-08-05 15:39:41', 'collect', '2019-08-05 15:39:41', 'collect');
INSERT INTO `sys_user` VALUES ('15110177081', null, null, null, '15110177081', '孙玉明', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-52836018', '15110177081', null, null, '2019-08-05 15:39:41', 'collect', '2019-08-05 15:39:41', 'collect');
INSERT INTO `sys_user` VALUES ('18920532565', null, null, null, '18920532565', '马云龙', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-58139496', '18920532565', null, null, '2019-08-05 15:39:41', 'collect', '2019-08-05 15:39:41', 'collect');
INSERT INTO `sys_user` VALUES ('18920778276', null, null, null, '18920778276', '先生', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18920778276', null, null, '2019-08-05 15:39:39', 'collect', '2019-08-05 15:39:39', 'collect');
INSERT INTO `sys_user` VALUES ('15332119879', null, null, null, '15332119879', '申晓静', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15332119879', null, null, '2019-08-05 15:39:39', 'collect', '2019-08-05 15:39:39', 'collect');
INSERT INTO `sys_user` VALUES ('18614088757', null, null, null, '18614088757', '王经理', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '010-65911327', '18614088757', null, null, '2019-08-05 15:39:39', 'collect', '2019-08-05 15:39:39', 'collect');
INSERT INTO `sys_user` VALUES ('18002087942', null, null, null, '18002087942', '张学海', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '18002087942', null, null, '2019-08-05 15:39:39', 'collect', '2019-08-05 15:39:39', 'collect');
INSERT INTO `sys_user` VALUES ('15332175853', null, null, null, '15332175853', '候晓霞', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-58171276', '15332175853', null, null, '2019-08-05 15:39:41', 'collect', '2019-08-05 15:39:41', 'collect');
INSERT INTO `sys_user` VALUES ('15966046004', null, null, null, '15966046004', '红磊', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '', '15966046004', null, null, '2019-08-05 15:39:41', 'collect', '2019-08-05 15:39:41', 'collect');
INSERT INTO `sys_user` VALUES ('13512451228', null, null, null, '13512451228', '白雅利', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-58139496', '13512451228', null, null, '2019-08-05 15:39:41', 'collect', '2019-08-05 15:39:41', 'collect');
INSERT INTO `sys_user` VALUES ('15302024691', null, null, null, '15302024691', '李晟', null, '', null, '*346921217641B99F77ADF4E7A632F0275B1694B7', '022-58139496', '15302024691', null, null, '2019-08-05 15:39:41', 'collect', '2019-08-05 15:39:41', 'collect');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_role_id` varchar(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `FK_Relationship_33` (`user_id`),
  KEY `FK_Relationship_47` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
