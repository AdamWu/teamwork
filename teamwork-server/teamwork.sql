/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : teamwork

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 12/07/2020 23:15:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for team_collection
-- ----------------------------
DROP TABLE IF EXISTS `team_collection`;
CREATE TABLE `team_collection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `source_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '任务ID',
  `member_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '成员id',
  `create_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for team_department
-- ----------------------------
DROP TABLE IF EXISTS `team_department`;
CREATE TABLE `team_department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  `organization_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `pcode` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '上级编号',
  `icon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `create_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '上级路径',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for team_department_member
-- ----------------------------
DROP TABLE IF EXISTS `team_department_member`;
CREATE TABLE `team_department_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'id',
  `department_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门id',
  `organization_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织id',
  `account_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '成员id',
  `join_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加入时间',
  `is_principal` tinyint(1) NULL DEFAULT NULL COMMENT '是否负责人',
  `is_owner` tinyint(1) NULL DEFAULT 0 COMMENT '拥有者',
  `authorize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门-成员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for team_file
-- ----------------------------
DROP TABLE IF EXISTS `team_file`;
CREATE TABLE `team_file`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '编号',
  `path_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相对路径',
  `title` char(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `extension` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展名',
  `size` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '文件大小',
  `object_type` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对象类型',
  `organization_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织编码',
  `task_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务编码',
  `project_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目编码',
  `create_by` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '上传人',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `downloads` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '下载次数',
  `extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '额外信息',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '删除标记',
  `file_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '完整地址',
  `file_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `deleted_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件表' ROW_FORMAT = Dynamic;



-- ----------------------------
-- Table structure for team_invite_link
-- ----------------------------
DROP TABLE IF EXISTS `team_invite_link`;
CREATE TABLE `team_invite_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邀请人',
  `invite_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接类型',
  `source_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源编码',
  `create_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `over_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '邀请链接表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for team_lock
-- ----------------------------
DROP TABLE IF EXISTS `team_lock`;
CREATE TABLE `team_lock`  (
  `pid` bigint(20) UNSIGNED NOT NULL COMMENT 'IP+TYPE',
  `pvalue` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '次数',
  `expiretime` int(11) NOT NULL DEFAULT 0 COMMENT '锁定截止时间',
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '防灌水表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for team_mailqueue
-- ----------------------------
DROP TABLE IF EXISTS `team_mailqueue`;
CREATE TABLE `team_mailqueue`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `toList` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ccList` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addedBy` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addedDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sendTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'wait',
  `failReason` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sendTime`(`sendTime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31858 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮件队列' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for team_member
-- ----------------------------
DROP TABLE IF EXISTS `team_member`;
CREATE TABLE `team_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统前台用户表',
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户登陆账号',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登陆密码，32位加密串',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `realname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态',
  `last_login_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次登录时间',
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '性别',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像',
  `idcard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `province` int(11) NULL DEFAULT 0 COMMENT '省',
  `city` int(11) NULL DEFAULT 0 COMMENT '市',
  `area` int(11) NULL DEFAULT 0 COMMENT '区',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地址',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `dingtalk_openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钉钉openid',
  `dingtalk_unionid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钉钉unionid',
  `dingtalk_userid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钉钉用户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `username`(`account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 654 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team_member
-- ----------------------------
INSERT INTO `team_member` VALUES (582, 'admin', '14e1b600b1fd579f47433b88e8d85291', 'admin', '', 'admin', NULL, 1, '2020-06-20 17:24:48', '', 'http://127.0.0.1:8881/common/image?filePathName=/user.jpg&realFileName=user.jpg', '', 0, 0, 0, NULL, '', 'wmeng@autof.cn', '6v7be19pwman2fird04gqu53', NULL, NULL, NULL);


-- ----------------------------
-- Table structure for team_member_account
-- ----------------------------
DROP TABLE IF EXISTS `team_member_account`;
CREATE TABLE `team_member_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `member_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '所属账号id',
  `organization_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '所属组织',
  `department_code` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门编号',
  `authorize` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色',
  `is_owner` tinyint(1) NULL DEFAULT 0 COMMENT '是否主账号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮件',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `last_login_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次登录时间',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职位',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织账号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team_member_account
-- ----------------------------
INSERT INTO `team_member_account` VALUES (21, '6v7be19pwman2fird04gqu11', '6v7be19pwman2fird04gqu53', '6v7be19pwman2fird04gqu53', '', '3', 1, 'admin', '', 'wmeng@autof.cn', '2019-01-05 21:57:01', NULL, 1, '描述12', '', '', '');


-- ----------------------------
-- Table structure for team_notify
-- ----------------------------
DROP TABLE IF EXISTS `team_notify`;
CREATE TABLE `team_notify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `type` enum('notice','message','task') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知类型。通知：notice，消息：message，待办：task',
  `from` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '发送人id',
  `to` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '送达用户id',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成时间',
  `is_read` tinyint(1) NULL DEFAULT 0 COMMENT '是否已读',
  `read_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阅读时间',
  `send_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关联数据',
  `finally_send_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最终发送时间',
  `send_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送时间',
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'none' COMMENT '场景：task，project',
  `terminal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推送终端。pc端：project，移动端：wap',
  `from_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\'project\',\'system\'',
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像/图片',
  `source_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '资源code',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4326 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '动态通知表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for team_organization
-- ----------------------------
DROP TABLE IF EXISTS `team_organization`;
CREATE TABLE `team_organization`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `owner_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拥有者',
  `create_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `personal` tinyint(1) NULL DEFAULT 0 COMMENT '是否个人项目',
  `code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '编号',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `province` int(11) NULL DEFAULT 0 COMMENT '省',
  `city` int(11) NULL DEFAULT 0 COMMENT '市',
  `area` int(11) NULL DEFAULT 0 COMMENT '区',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team_organization
-- ----------------------------
INSERT INTO `team_organization` VALUES (1, 'admin的个人项目', NULL, NULL, '6v7be19pwman2fird04gqu53', '2018-10-12', 1, '6v7be19pwman2fird04gqu53', '', 0, 0, 0);

-- ----------------------------
-- Table structure for team_project
-- ----------------------------
DROP TABLE IF EXISTS `team_project`;
CREATE TABLE `team_project`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `name` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `access_control_type` enum('open','private','custom') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'open' COMMENT '访问控制l类型',
  `white_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可以访问项目的权限组（白名单）',
  `order` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '删除标记',
  `template_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '项目类型',
  `schedule` double(5, 2) NULL DEFAULT 0.00 COMMENT '进度',
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `organization_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织id',
  `deleted_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除时间',
  `private` tinyint(1) NULL DEFAULT 0 COMMENT '是否私有',
  `prefix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目前缀',
  `open_prefix` tinyint(1) NULL DEFAULT 0 COMMENT '是否开启项目前缀',
  `archive` tinyint(1) NULL DEFAULT 0 COMMENT '是否归档',
  `archive_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归档时间',
  `open_begin_time` tinyint(1) NULL DEFAULT 0 COMMENT '是否开启任务开始时间',
  `open_task_private` tinyint(1) NULL DEFAULT 0 COMMENT '是否开启新任务默认开启隐私模式',
  `task_board_theme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'default' COMMENT '看板风格',
  `begin_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目开始日期',
  `end_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目截止日期',
  `auto_update_schedule` tinyint(1) NULL DEFAULT 1 COMMENT '自动更新项目进度',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `project`(`order`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13078 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目表' ROW_FORMAT = Dynamic;



-- ----------------------------
-- Table structure for team_project_auth
-- ----------------------------
DROP TABLE IF EXISTS `team_project_auth`;
CREATE TABLE `team_project_auth`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `status` tinyint(3) UNSIGNED NULL DEFAULT 1 COMMENT '状态(1:禁用,2:启用)',
  `sort` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '排序权重',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_by` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '创建人',
  `create_at` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `organization_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '所属组织',
  `is_default` tinyint(1) NULL DEFAULT 0 COMMENT '是否默认',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team_project_auth
-- ----------------------------
INSERT INTO `team_project_auth` VALUES (1, '管理员', 1, 0, '管理员', 0, '2018-08-01 14:20:46', '', 0, 'admin');
INSERT INTO `team_project_auth` VALUES (2, '成员', 1, 0, '成员', 0, '2018-12-20 13:39:59', '', 1, 'member');
INSERT INTO `team_project_auth` VALUES (3, '管理员', 1, 0, '管理员', 0, '2018-08-01 14:20:46', '6v7be19pwman2fird04gqu53', 0, 'admin');
INSERT INTO `team_project_auth` VALUES (4, '成员', 1, 0, '成员', 0, '2018-12-20 13:39:59', '6v7be19pwman2fird04gqu53', 1, 'member');


-- ----------------------------
-- Table structure for team_project_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `team_project_auth_node`;
CREATE TABLE `team_project_auth_node`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `auth` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '角色ID',
  `node` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点路径',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_system_auth_auth`(`auth`) USING BTREE,
  INDEX `index_system_auth_node`(`node`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16728 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目角色与节点绑定' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team_project_auth_node
-- ----------------------------
INSERT INTO `team_project_auth_node` VALUES (3097, 1, 'project');
INSERT INTO `team_project_auth_node` VALUES (3098, 1, 'project/account');
INSERT INTO `team_project_auth_node` VALUES (3099, 1, 'project/account/index');
INSERT INTO `team_project_auth_node` VALUES (3100, 1, 'project/account/auth');
INSERT INTO `team_project_auth_node` VALUES (3101, 1, 'project/account/add');
INSERT INTO `team_project_auth_node` VALUES (3102, 1, 'project/account/edit');
INSERT INTO `team_project_auth_node` VALUES (3103, 1, 'project/account/del');
INSERT INTO `team_project_auth_node` VALUES (3104, 1, 'project/account/forbid');
INSERT INTO `team_project_auth_node` VALUES (3105, 1, 'project/account/resume');
INSERT INTO `team_project_auth_node` VALUES (3106, 1, 'project/auth');
INSERT INTO `team_project_auth_node` VALUES (3107, 1, 'project/auth/index');
INSERT INTO `team_project_auth_node` VALUES (3108, 1, 'project/auth/apply');
INSERT INTO `team_project_auth_node` VALUES (3109, 1, 'project/auth/add');
INSERT INTO `team_project_auth_node` VALUES (3110, 1, 'project/auth/edit');
INSERT INTO `team_project_auth_node` VALUES (3111, 1, 'project/auth/forbid');
INSERT INTO `team_project_auth_node` VALUES (3112, 1, 'project/auth/resume');
INSERT INTO `team_project_auth_node` VALUES (3113, 1, 'project/auth/setdefault');
INSERT INTO `team_project_auth_node` VALUES (3114, 1, 'project/auth/del');
INSERT INTO `team_project_auth_node` VALUES (3115, 1, 'project/department');
INSERT INTO `team_project_auth_node` VALUES (3116, 1, 'project/department/index');
INSERT INTO `team_project_auth_node` VALUES (3117, 1, 'project/department/read');
INSERT INTO `team_project_auth_node` VALUES (3118, 1, 'project/department/save');
INSERT INTO `team_project_auth_node` VALUES (3119, 1, 'project/department/edit');
INSERT INTO `team_project_auth_node` VALUES (3120, 1, 'project/department/delete');
INSERT INTO `team_project_auth_node` VALUES (3121, 1, 'project/department_member');
INSERT INTO `team_project_auth_node` VALUES (3122, 1, 'project/department_member/index');
INSERT INTO `team_project_auth_node` VALUES (3123, 1, 'project/department_member/searchinvitemember');
INSERT INTO `team_project_auth_node` VALUES (3124, 1, 'project/department_member/invitemember');
INSERT INTO `team_project_auth_node` VALUES (3125, 1, 'project/department_member/removemember');
INSERT INTO `team_project_auth_node` VALUES (3126, 1, 'project/index');
INSERT INTO `team_project_auth_node` VALUES (3127, 1, 'project/index/index');
INSERT INTO `team_project_auth_node` VALUES (3128, 1, 'project/index/changecurrentorganization');
INSERT INTO `team_project_auth_node` VALUES (3129, 1, 'project/index/systemconfig');
INSERT INTO `team_project_auth_node` VALUES (3130, 1, 'project/index/info');
INSERT INTO `team_project_auth_node` VALUES (3131, 1, 'project/index/editpersonal');
INSERT INTO `team_project_auth_node` VALUES (3132, 1, 'project/index/editpassword');
INSERT INTO `team_project_auth_node` VALUES (3133, 1, 'project/index/uploadimg');
INSERT INTO `team_project_auth_node` VALUES (3134, 1, 'project/index/uploadavatar');
INSERT INTO `team_project_auth_node` VALUES (3135, 1, 'project/menu');
INSERT INTO `team_project_auth_node` VALUES (3136, 1, 'project/menu/menu');
INSERT INTO `team_project_auth_node` VALUES (3137, 1, 'project/menu/menuadd');
INSERT INTO `team_project_auth_node` VALUES (3138, 1, 'project/menu/menuedit');
INSERT INTO `team_project_auth_node` VALUES (3139, 1, 'project/menu/menuforbid');
INSERT INTO `team_project_auth_node` VALUES (3140, 1, 'project/menu/menuresume');
INSERT INTO `team_project_auth_node` VALUES (3141, 1, 'project/menu/menudel');
INSERT INTO `team_project_auth_node` VALUES (3142, 1, 'project/node');
INSERT INTO `team_project_auth_node` VALUES (3143, 1, 'project/node/index');
INSERT INTO `team_project_auth_node` VALUES (3144, 1, 'project/node/alllist');
INSERT INTO `team_project_auth_node` VALUES (3145, 1, 'project/node/clear');
INSERT INTO `team_project_auth_node` VALUES (3146, 1, 'project/node/save');
INSERT INTO `team_project_auth_node` VALUES (3147, 1, 'project/notify');
INSERT INTO `team_project_auth_node` VALUES (3148, 1, 'project/notify/index');
INSERT INTO `team_project_auth_node` VALUES (3149, 1, 'project/notify/noreads');
INSERT INTO `team_project_auth_node` VALUES (3150, 1, 'project/notify/setreadied');
INSERT INTO `team_project_auth_node` VALUES (3151, 1, 'project/notify/batchdel');
INSERT INTO `team_project_auth_node` VALUES (3152, 1, 'project/notify/read');
INSERT INTO `team_project_auth_node` VALUES (3153, 1, 'project/notify/delete');
INSERT INTO `team_project_auth_node` VALUES (3154, 1, 'project/organization');
INSERT INTO `team_project_auth_node` VALUES (3155, 1, 'project/organization/index');
INSERT INTO `team_project_auth_node` VALUES (3156, 1, 'project/organization/save');
INSERT INTO `team_project_auth_node` VALUES (3157, 1, 'project/organization/read');
INSERT INTO `team_project_auth_node` VALUES (3158, 1, 'project/organization/edit');
INSERT INTO `team_project_auth_node` VALUES (3159, 1, 'project/organization/delete');
INSERT INTO `team_project_auth_node` VALUES (3160, 1, 'project/project');
INSERT INTO `team_project_auth_node` VALUES (3161, 1, 'project/project/index');
INSERT INTO `team_project_auth_node` VALUES (3162, 1, 'project/project/selflist');
INSERT INTO `team_project_auth_node` VALUES (3163, 1, 'project/project/save');
INSERT INTO `team_project_auth_node` VALUES (3164, 1, 'project/project/read');
INSERT INTO `team_project_auth_node` VALUES (3165, 1, 'project/project/edit');
INSERT INTO `team_project_auth_node` VALUES (3166, 1, 'project/project/uploadcover');
INSERT INTO `team_project_auth_node` VALUES (3167, 1, 'project/project/recycle');
INSERT INTO `team_project_auth_node` VALUES (3168, 1, 'project/project/recovery');
INSERT INTO `team_project_auth_node` VALUES (3169, 1, 'project/project/archive');
INSERT INTO `team_project_auth_node` VALUES (3170, 1, 'project/project/recoveryarchive');
INSERT INTO `team_project_auth_node` VALUES (3171, 1, 'project/project/quit');
INSERT INTO `team_project_auth_node` VALUES (3172, 1, 'project/project_collect');
INSERT INTO `team_project_auth_node` VALUES (3173, 1, 'project/project_collect/collect');
INSERT INTO `team_project_auth_node` VALUES (3174, 1, 'project/project_member');
INSERT INTO `team_project_auth_node` VALUES (3175, 1, 'project/project_member/index');
INSERT INTO `team_project_auth_node` VALUES (3176, 1, 'project/project_member/searchinvitemember');
INSERT INTO `team_project_auth_node` VALUES (3177, 1, 'project/project_member/invitemember');
INSERT INTO `team_project_auth_node` VALUES (3178, 1, 'project/project_template');
INSERT INTO `team_project_auth_node` VALUES (3179, 1, 'project/project_template/index');
INSERT INTO `team_project_auth_node` VALUES (3180, 1, 'project/project_template/save');
INSERT INTO `team_project_auth_node` VALUES (3181, 1, 'project/project_template/uploadcover');
INSERT INTO `team_project_auth_node` VALUES (3182, 1, 'project/project_template/edit');
INSERT INTO `team_project_auth_node` VALUES (3183, 1, 'project/project_template/delete');
INSERT INTO `team_project_auth_node` VALUES (3184, 1, 'project/task');
INSERT INTO `team_project_auth_node` VALUES (3185, 1, 'project/task/index');
INSERT INTO `team_project_auth_node` VALUES (3186, 1, 'project/task/selflist');
INSERT INTO `team_project_auth_node` VALUES (3187, 1, 'project/task/read');
INSERT INTO `team_project_auth_node` VALUES (3188, 1, 'project/task/save');
INSERT INTO `team_project_auth_node` VALUES (3189, 1, 'project/task/taskdone');
INSERT INTO `team_project_auth_node` VALUES (3190, 1, 'project/task/assigntask');
INSERT INTO `team_project_auth_node` VALUES (3191, 1, 'project/task/sort');
INSERT INTO `team_project_auth_node` VALUES (3192, 1, 'project/task/createcomment');
INSERT INTO `team_project_auth_node` VALUES (3193, 1, 'project/task/edit');
INSERT INTO `team_project_auth_node` VALUES (3194, 1, 'project/task/like');
INSERT INTO `team_project_auth_node` VALUES (3195, 1, 'project/task/star');
INSERT INTO `team_project_auth_node` VALUES (3196, 1, 'project/task/recycle');
INSERT INTO `team_project_auth_node` VALUES (3197, 1, 'project/task/recovery');
INSERT INTO `team_project_auth_node` VALUES (3198, 1, 'project/task/delete');
INSERT INTO `team_project_auth_node` VALUES (3199, 1, 'project/task_log');
INSERT INTO `team_project_auth_node` VALUES (3200, 1, 'project/task_log/index');
INSERT INTO `team_project_auth_node` VALUES (3201, 1, 'project/task_log/getlistbyselfproject');
INSERT INTO `team_project_auth_node` VALUES (3202, 1, 'project/task_member');
INSERT INTO `team_project_auth_node` VALUES (3203, 1, 'project/task_member/index');
INSERT INTO `team_project_auth_node` VALUES (3204, 1, 'project/task_member/searchinvitemember');
INSERT INTO `team_project_auth_node` VALUES (3205, 1, 'project/task_member/invitemember');
INSERT INTO `team_project_auth_node` VALUES (3206, 1, 'project/task_member/invitememberbatch');
INSERT INTO `team_project_auth_node` VALUES (3207, 1, 'project/task_stages');
INSERT INTO `team_project_auth_node` VALUES (3208, 1, 'project/task_stages/index');
INSERT INTO `team_project_auth_node` VALUES (3209, 1, 'project/task_stages/tasks');
INSERT INTO `team_project_auth_node` VALUES (3210, 1, 'project/task_stages/sort');
INSERT INTO `team_project_auth_node` VALUES (3211, 1, 'project/task_stages/save');
INSERT INTO `team_project_auth_node` VALUES (3212, 1, 'project/task_stages/edit');
INSERT INTO `team_project_auth_node` VALUES (3213, 1, 'project/task_stages/delete');
INSERT INTO `team_project_auth_node` VALUES (3214, 1, 'project/task_stages_template');
INSERT INTO `team_project_auth_node` VALUES (3215, 1, 'project/task_stages_template/index');
INSERT INTO `team_project_auth_node` VALUES (3216, 1, 'project/task_stages_template/save');
INSERT INTO `team_project_auth_node` VALUES (3217, 1, 'project/task_stages_template/edit');
INSERT INTO `team_project_auth_node` VALUES (3218, 1, 'project/task_stages_template/delete');
INSERT INTO `team_project_auth_node` VALUES (3219, 2, 'project/account/index');
INSERT INTO `team_project_auth_node` VALUES (3220, 2, 'project/auth/index');
INSERT INTO `team_project_auth_node` VALUES (3221, 2, 'project/index/index');
INSERT INTO `team_project_auth_node` VALUES (3222, 2, 'project/index');
INSERT INTO `team_project_auth_node` VALUES (3223, 2, 'project/index/changecurrentorganization');
INSERT INTO `team_project_auth_node` VALUES (3224, 2, 'project/index/systemconfig');
INSERT INTO `team_project_auth_node` VALUES (3225, 2, 'project/index/info');
INSERT INTO `team_project_auth_node` VALUES (3226, 2, 'project/index/editpersonal');
INSERT INTO `team_project_auth_node` VALUES (3227, 2, 'project/index/editpassword');
INSERT INTO `team_project_auth_node` VALUES (3228, 2, 'project/index/uploadimg');
INSERT INTO `team_project_auth_node` VALUES (3229, 2, 'project/index/uploadavatar');
INSERT INTO `team_project_auth_node` VALUES (3230, 2, 'project/menu/menu');
INSERT INTO `team_project_auth_node` VALUES (3231, 2, 'project/node/index');
INSERT INTO `team_project_auth_node` VALUES (3232, 2, 'project/node/alllist');
INSERT INTO `team_project_auth_node` VALUES (3233, 2, 'project/notify/index');
INSERT INTO `team_project_auth_node` VALUES (3234, 2, 'project/notify');
INSERT INTO `team_project_auth_node` VALUES (3235, 2, 'project/notify/noreads');
INSERT INTO `team_project_auth_node` VALUES (3236, 2, 'project/notify/setreadied');
INSERT INTO `team_project_auth_node` VALUES (3237, 2, 'project/notify/batchdel');
INSERT INTO `team_project_auth_node` VALUES (3238, 2, 'project/notify/read');
INSERT INTO `team_project_auth_node` VALUES (3239, 2, 'project/notify/delete');
INSERT INTO `team_project_auth_node` VALUES (3240, 2, 'project/organization/index');
INSERT INTO `team_project_auth_node` VALUES (3241, 2, 'project/organization');
INSERT INTO `team_project_auth_node` VALUES (3242, 2, 'project/organization/save');
INSERT INTO `team_project_auth_node` VALUES (3243, 2, 'project/organization/read');
INSERT INTO `team_project_auth_node` VALUES (3244, 2, 'project/organization/edit');
INSERT INTO `team_project_auth_node` VALUES (3245, 2, 'project/organization/delete');
INSERT INTO `team_project_auth_node` VALUES (3246, 2, 'project/project/index');
INSERT INTO `team_project_auth_node` VALUES (3247, 2, 'project/project/read');
INSERT INTO `team_project_auth_node` VALUES (3248, 2, 'project/project_collect/collect');
INSERT INTO `team_project_auth_node` VALUES (3249, 2, 'project/project_collect');
INSERT INTO `team_project_auth_node` VALUES (3250, 2, 'project/project_member/index');
INSERT INTO `team_project_auth_node` VALUES (3251, 2, 'project/project_template/index');
INSERT INTO `team_project_auth_node` VALUES (3252, 2, 'project/task/index');
INSERT INTO `team_project_auth_node` VALUES (3253, 2, 'project/task/read');
INSERT INTO `team_project_auth_node` VALUES (3254, 2, 'project/task/save');
INSERT INTO `team_project_auth_node` VALUES (3255, 2, 'project/task/taskdone');
INSERT INTO `team_project_auth_node` VALUES (3256, 2, 'project/task/assigntask');
INSERT INTO `team_project_auth_node` VALUES (3257, 2, 'project/task/sort');
INSERT INTO `team_project_auth_node` VALUES (3258, 2, 'project/task/createcomment');
INSERT INTO `team_project_auth_node` VALUES (3259, 2, 'project/task/like');
INSERT INTO `team_project_auth_node` VALUES (3260, 2, 'project/task/star');
INSERT INTO `team_project_auth_node` VALUES (3261, 2, 'project/task_log/index');
INSERT INTO `team_project_auth_node` VALUES (3262, 2, 'project/task_log');
INSERT INTO `team_project_auth_node` VALUES (3263, 2, 'project/task_log/getlistbyselfproject');
INSERT INTO `team_project_auth_node` VALUES (3264, 2, 'project/task_member/index');
INSERT INTO `team_project_auth_node` VALUES (3265, 2, 'project/task_member/searchinvitemember');
INSERT INTO `team_project_auth_node` VALUES (3266, 2, 'project/task_stages/index');
INSERT INTO `team_project_auth_node` VALUES (3267, 2, 'project/task_stages/tasks');
INSERT INTO `team_project_auth_node` VALUES (3268, 2, 'project/task_stages/sort');
INSERT INTO `team_project_auth_node` VALUES (3269, 2, 'project/task_stages_template/index');
INSERT INTO `team_project_auth_node` VALUES (3270, 2, 'project/department/index');
INSERT INTO `team_project_auth_node` VALUES (3271, 2, 'project/department/read');
INSERT INTO `team_project_auth_node` VALUES (3272, 2, 'project/department_member/index');
INSERT INTO `team_project_auth_node` VALUES (3273, 2, 'project/department_member/searchinvitemember');
INSERT INTO `team_project_auth_node` VALUES (3274, 2, 'project/project/selflist');
INSERT INTO `team_project_auth_node` VALUES (3275, 2, 'project/project/save');
INSERT INTO `team_project_auth_node` VALUES (3276, 2, 'project/task/selflist');
INSERT INTO `team_project_auth_node` VALUES (5459, 3, 'project/account/index');
INSERT INTO `team_project_auth_node` VALUES (5460, 3, 'project/account');
INSERT INTO `team_project_auth_node` VALUES (5461, 3, 'project/account/read');
INSERT INTO `team_project_auth_node` VALUES (5462, 3, 'project/account/auth');
INSERT INTO `team_project_auth_node` VALUES (5463, 3, 'project/account/add');
INSERT INTO `team_project_auth_node` VALUES (5464, 3, 'project/account/edit');
INSERT INTO `team_project_auth_node` VALUES (5465, 3, 'project/account/del');
INSERT INTO `team_project_auth_node` VALUES (5466, 3, 'project/account/forbid');
INSERT INTO `team_project_auth_node` VALUES (5467, 3, 'project/account/resume');
INSERT INTO `team_project_auth_node` VALUES (5468, 3, 'project/auth/index');
INSERT INTO `team_project_auth_node` VALUES (5469, 3, 'project/auth');
INSERT INTO `team_project_auth_node` VALUES (5470, 3, 'project/auth/apply');
INSERT INTO `team_project_auth_node` VALUES (5471, 3, 'project/auth/add');
INSERT INTO `team_project_auth_node` VALUES (5472, 3, 'project/auth/edit');
INSERT INTO `team_project_auth_node` VALUES (5473, 3, 'project/auth/forbid');
INSERT INTO `team_project_auth_node` VALUES (5474, 3, 'project/auth/resume');
INSERT INTO `team_project_auth_node` VALUES (5475, 3, 'project/auth/setdefault');
INSERT INTO `team_project_auth_node` VALUES (5476, 3, 'project/auth/del');
INSERT INTO `team_project_auth_node` VALUES (5477, 3, 'project/department/index');
INSERT INTO `team_project_auth_node` VALUES (5478, 3, 'project/department');
INSERT INTO `team_project_auth_node` VALUES (5479, 3, 'project/department/read');
INSERT INTO `team_project_auth_node` VALUES (5480, 3, 'project/department/save');
INSERT INTO `team_project_auth_node` VALUES (5481, 3, 'project/department/edit');
INSERT INTO `team_project_auth_node` VALUES (5482, 3, 'project/department/delete');
INSERT INTO `team_project_auth_node` VALUES (5483, 3, 'project/department_member/index');
INSERT INTO `team_project_auth_node` VALUES (5484, 3, 'project/department_member');
INSERT INTO `team_project_auth_node` VALUES (5485, 3, 'project/department_member/detail');
INSERT INTO `team_project_auth_node` VALUES (5486, 3, 'project/department_member/searchinvitemember');
INSERT INTO `team_project_auth_node` VALUES (5487, 3, 'project/department_member/invitemember');
INSERT INTO `team_project_auth_node` VALUES (5488, 3, 'project/department_member/removemember');
INSERT INTO `team_project_auth_node` VALUES (5489, 3, 'project/department_member/uploadfile');
INSERT INTO `team_project_auth_node` VALUES (5490, 3, 'project/file/index');
INSERT INTO `team_project_auth_node` VALUES (5491, 3, 'project/file');
INSERT INTO `team_project_auth_node` VALUES (5492, 3, 'project/file/read');
INSERT INTO `team_project_auth_node` VALUES (5493, 3, 'project/file/uploadfiles');
INSERT INTO `team_project_auth_node` VALUES (5494, 3, 'project/file/edit');
INSERT INTO `team_project_auth_node` VALUES (5495, 3, 'project/file/recycle');
INSERT INTO `team_project_auth_node` VALUES (5496, 3, 'project/file/recovery');
INSERT INTO `team_project_auth_node` VALUES (5497, 3, 'project/file/delete');
INSERT INTO `team_project_auth_node` VALUES (5498, 3, 'project/index/index');
INSERT INTO `team_project_auth_node` VALUES (5499, 3, 'project/index');
INSERT INTO `team_project_auth_node` VALUES (5500, 3, 'project/index/changecurrentorganization');
INSERT INTO `team_project_auth_node` VALUES (5501, 3, 'project/index/systemconfig');
INSERT INTO `team_project_auth_node` VALUES (5502, 3, 'project/index/info');
INSERT INTO `team_project_auth_node` VALUES (5503, 3, 'project/index/editpersonal');
INSERT INTO `team_project_auth_node` VALUES (5504, 3, 'project/index/editpassword');
INSERT INTO `team_project_auth_node` VALUES (5505, 3, 'project/index/uploadimg');
INSERT INTO `team_project_auth_node` VALUES (5506, 3, 'project/index/uploadavatar');
INSERT INTO `team_project_auth_node` VALUES (5507, 3, 'project/invite_link/save');
INSERT INTO `team_project_auth_node` VALUES (5508, 3, 'project/invite_link');
INSERT INTO `team_project_auth_node` VALUES (5509, 3, 'project/menu/menu');
INSERT INTO `team_project_auth_node` VALUES (5510, 3, 'project/menu');
INSERT INTO `team_project_auth_node` VALUES (5511, 3, 'project/menu/menuadd');
INSERT INTO `team_project_auth_node` VALUES (5512, 3, 'project/menu/menuedit');
INSERT INTO `team_project_auth_node` VALUES (5513, 3, 'project/menu/menuforbid');
INSERT INTO `team_project_auth_node` VALUES (5514, 3, 'project/menu/menuresume');
INSERT INTO `team_project_auth_node` VALUES (5515, 3, 'project/menu/menudel');
INSERT INTO `team_project_auth_node` VALUES (5516, 3, 'project/node/index');
INSERT INTO `team_project_auth_node` VALUES (5517, 3, 'project/node');
INSERT INTO `team_project_auth_node` VALUES (5518, 3, 'project/node/alllist');
INSERT INTO `team_project_auth_node` VALUES (5519, 3, 'project/node/clear');
INSERT INTO `team_project_auth_node` VALUES (5520, 3, 'project/node/save');
INSERT INTO `team_project_auth_node` VALUES (5521, 3, 'project/notify/index');
INSERT INTO `team_project_auth_node` VALUES (5522, 3, 'project/notify');
INSERT INTO `team_project_auth_node` VALUES (5523, 3, 'project/notify/noreads');
INSERT INTO `team_project_auth_node` VALUES (5524, 3, 'project/notify/setreadied');
INSERT INTO `team_project_auth_node` VALUES (5525, 3, 'project/notify/batchdel');
INSERT INTO `team_project_auth_node` VALUES (5526, 3, 'project/notify/read');
INSERT INTO `team_project_auth_node` VALUES (5527, 3, 'project/notify/delete');
INSERT INTO `team_project_auth_node` VALUES (5528, 3, 'project/organization/index');
INSERT INTO `team_project_auth_node` VALUES (5529, 3, 'project/organization');
INSERT INTO `team_project_auth_node` VALUES (5530, 3, 'project/organization/save');
INSERT INTO `team_project_auth_node` VALUES (5531, 3, 'project/organization/read');
INSERT INTO `team_project_auth_node` VALUES (5532, 3, 'project/organization/edit');
INSERT INTO `team_project_auth_node` VALUES (5533, 3, 'project/organization/delete');
INSERT INTO `team_project_auth_node` VALUES (5534, 3, 'project/project/index');
INSERT INTO `team_project_auth_node` VALUES (5535, 3, 'project/project');
INSERT INTO `team_project_auth_node` VALUES (5536, 3, 'project/project/analysis');
INSERT INTO `team_project_auth_node` VALUES (5537, 3, 'project/project/selflist');
INSERT INTO `team_project_auth_node` VALUES (5538, 3, 'project/project/save');
INSERT INTO `team_project_auth_node` VALUES (5539, 3, 'project/project/read');
INSERT INTO `team_project_auth_node` VALUES (5540, 3, 'project/project/edit');
INSERT INTO `team_project_auth_node` VALUES (5541, 3, 'project/project/getlogbyselfproject');
INSERT INTO `team_project_auth_node` VALUES (5542, 3, 'project/project/uploadcover');
INSERT INTO `team_project_auth_node` VALUES (5543, 3, 'project/project/recycle');
INSERT INTO `team_project_auth_node` VALUES (5544, 3, 'project/project/recovery');
INSERT INTO `team_project_auth_node` VALUES (5545, 3, 'project/project/archive');
INSERT INTO `team_project_auth_node` VALUES (5546, 3, 'project/project/recoveryarchive');
INSERT INTO `team_project_auth_node` VALUES (5547, 3, 'project/project/quit');
INSERT INTO `team_project_auth_node` VALUES (5548, 3, 'project/project_collect/collect');
INSERT INTO `team_project_auth_node` VALUES (5549, 3, 'project/project_collect');
INSERT INTO `team_project_auth_node` VALUES (5550, 3, 'project/project_features/index');
INSERT INTO `team_project_auth_node` VALUES (5551, 3, 'project/project_features');
INSERT INTO `team_project_auth_node` VALUES (5552, 3, 'project/project_features/save');
INSERT INTO `team_project_auth_node` VALUES (5553, 3, 'project/project_features/edit');
INSERT INTO `team_project_auth_node` VALUES (5554, 3, 'project/project_features/delete');
INSERT INTO `team_project_auth_node` VALUES (5555, 3, 'project/project_member/index');
INSERT INTO `team_project_auth_node` VALUES (5556, 3, 'project/project_member');
INSERT INTO `team_project_auth_node` VALUES (5557, 3, 'project/project_member/searchinvitemember');
INSERT INTO `team_project_auth_node` VALUES (5558, 3, 'project/project_member/invitemember');
INSERT INTO `team_project_auth_node` VALUES (5559, 3, 'project/project_member/removemember');
INSERT INTO `team_project_auth_node` VALUES (5560, 3, 'project/project_template/index');
INSERT INTO `team_project_auth_node` VALUES (5561, 3, 'project/project_template');
INSERT INTO `team_project_auth_node` VALUES (5562, 3, 'project/project_template/save');
INSERT INTO `team_project_auth_node` VALUES (5563, 3, 'project/project_template/uploadcover');
INSERT INTO `team_project_auth_node` VALUES (5564, 3, 'project/project_template/edit');
INSERT INTO `team_project_auth_node` VALUES (5565, 3, 'project/project_template/delete');
INSERT INTO `team_project_auth_node` VALUES (5566, 3, 'project/project_version/index');
INSERT INTO `team_project_auth_node` VALUES (5567, 3, 'project/project_version');
INSERT INTO `team_project_auth_node` VALUES (5568, 3, 'project/project_version/save');
INSERT INTO `team_project_auth_node` VALUES (5569, 3, 'project/project_version/edit');
INSERT INTO `team_project_auth_node` VALUES (5570, 3, 'project/project_version/changestatus');
INSERT INTO `team_project_auth_node` VALUES (5571, 3, 'project/project_version/read');
INSERT INTO `team_project_auth_node` VALUES (5572, 3, 'project/project_version/addversiontask');
INSERT INTO `team_project_auth_node` VALUES (5573, 3, 'project/project_version/removeversiontask');
INSERT INTO `team_project_auth_node` VALUES (5574, 3, 'project/project_version/delete');
INSERT INTO `team_project_auth_node` VALUES (5575, 3, 'project/source_link/delete');
INSERT INTO `team_project_auth_node` VALUES (5576, 3, 'project/source_link');
INSERT INTO `team_project_auth_node` VALUES (5577, 3, 'project/task/index');
INSERT INTO `team_project_auth_node` VALUES (5578, 3, 'project/task');
INSERT INTO `team_project_auth_node` VALUES (5579, 3, 'project/task/datetotalforproject');
INSERT INTO `team_project_auth_node` VALUES (5580, 3, 'project/task/selflist');
INSERT INTO `team_project_auth_node` VALUES (5581, 3, 'project/task/tasksources');
INSERT INTO `team_project_auth_node` VALUES (5582, 3, 'project/task/getlistbytasktag');
INSERT INTO `team_project_auth_node` VALUES (5583, 3, 'project/task/read');
INSERT INTO `team_project_auth_node` VALUES (5584, 3, 'project/task/save');
INSERT INTO `team_project_auth_node` VALUES (5585, 3, 'project/task/taskdone');
INSERT INTO `team_project_auth_node` VALUES (5586, 3, 'project/task/assigntask');
INSERT INTO `team_project_auth_node` VALUES (5587, 3, 'project/task/batchassigntask');
INSERT INTO `team_project_auth_node` VALUES (5588, 3, 'project/task/sort');
INSERT INTO `team_project_auth_node` VALUES (5589, 3, 'project/task/createcomment');
INSERT INTO `team_project_auth_node` VALUES (5590, 3, 'project/task/edit');
INSERT INTO `team_project_auth_node` VALUES (5591, 3, 'project/task/setprivate');
INSERT INTO `team_project_auth_node` VALUES (5592, 3, 'project/task/like');
INSERT INTO `team_project_auth_node` VALUES (5593, 3, 'project/task/tasktotags');
INSERT INTO `team_project_auth_node` VALUES (5594, 3, 'project/task/settag');
INSERT INTO `team_project_auth_node` VALUES (5595, 3, 'project/task/star');
INSERT INTO `team_project_auth_node` VALUES (5596, 3, 'project/task/tasklog');
INSERT INTO `team_project_auth_node` VALUES (5597, 3, 'project/task/savetaskworktime');
INSERT INTO `team_project_auth_node` VALUES (5598, 3, 'project/task/edittaskworktime');
INSERT INTO `team_project_auth_node` VALUES (5599, 3, 'project/task/deltaskworktime');
INSERT INTO `team_project_auth_node` VALUES (5600, 3, 'project/task/uploadfile');
INSERT INTO `team_project_auth_node` VALUES (5601, 3, 'project/task/recyclebatch');
INSERT INTO `team_project_auth_node` VALUES (5602, 3, 'project/task/recycle');
INSERT INTO `team_project_auth_node` VALUES (5603, 3, 'project/task/recovery');
INSERT INTO `team_project_auth_node` VALUES (5604, 3, 'project/task/delete');
INSERT INTO `team_project_auth_node` VALUES (5605, 3, 'project/task_member/index');
INSERT INTO `team_project_auth_node` VALUES (5606, 3, 'project/task_member');
INSERT INTO `team_project_auth_node` VALUES (5607, 3, 'project/task_member/searchinvitemember');
INSERT INTO `team_project_auth_node` VALUES (5608, 3, 'project/task_member/invitemember');
INSERT INTO `team_project_auth_node` VALUES (5609, 3, 'project/task_member/invitememberbatch');
INSERT INTO `team_project_auth_node` VALUES (5610, 3, 'project/task_stages/index');
INSERT INTO `team_project_auth_node` VALUES (5611, 3, 'project/task_stages');
INSERT INTO `team_project_auth_node` VALUES (5612, 3, 'project/task_stages/tasks');
INSERT INTO `team_project_auth_node` VALUES (5613, 3, 'project/task_stages/sort');
INSERT INTO `team_project_auth_node` VALUES (5614, 3, 'project/task_stages/save');
INSERT INTO `team_project_auth_node` VALUES (5615, 3, 'project/task_stages/edit');
INSERT INTO `team_project_auth_node` VALUES (5616, 3, 'project/task_stages/delete');
INSERT INTO `team_project_auth_node` VALUES (5617, 3, 'project/task_stages_template/index');
INSERT INTO `team_project_auth_node` VALUES (5618, 3, 'project/task_stages_template');
INSERT INTO `team_project_auth_node` VALUES (5619, 3, 'project/task_stages_template/save');
INSERT INTO `team_project_auth_node` VALUES (5620, 3, 'project/task_stages_template/edit');
INSERT INTO `team_project_auth_node` VALUES (5621, 3, 'project/task_stages_template/delete');
INSERT INTO `team_project_auth_node` VALUES (5622, 3, 'project/task_tag/index');
INSERT INTO `team_project_auth_node` VALUES (5623, 3, 'project/task_tag');
INSERT INTO `team_project_auth_node` VALUES (5624, 3, 'project/task_tag/save');
INSERT INTO `team_project_auth_node` VALUES (5625, 3, 'project/task_tag/edit');
INSERT INTO `team_project_auth_node` VALUES (5626, 3, 'project/task_tag/delete');
INSERT INTO `team_project_auth_node` VALUES (5627, 3, 'project/task_workflow/index');
INSERT INTO `team_project_auth_node` VALUES (5628, 3, 'project/task_workflow');
INSERT INTO `team_project_auth_node` VALUES (5629, 3, 'project/task_workflow/save');
INSERT INTO `team_project_auth_node` VALUES (5630, 3, 'project/task_workflow/edit');
INSERT INTO `team_project_auth_node` VALUES (5631, 3, 'project/task_workflow/delete');
INSERT INTO `team_project_auth_node` VALUES (6968, 3, 'project/organization/_getorglist');
INSERT INTO `team_project_auth_node` VALUES (6969, 3, 'project/login/_bindmobile');
INSERT INTO `team_project_auth_node` VALUES (6970, 3, 'project/login/_bindmail');
INSERT INTO `team_project_auth_node` VALUES (6971, 3, 'project/task_stages/_getAll');
INSERT INTO `team_project_auth_node` VALUES (6972, 3, 'project/task/_taskworktimelist');
INSERT INTO `team_project_auth_node` VALUES (7151, 3, 'project/project_member/_listforinvite');
INSERT INTO `team_project_auth_node` VALUES (13588, 4, 'project/account');
-- INSERT INTO `team_project_auth_node` VALUES (13589, 4, 'project/account/add');
-- INSERT INTO `team_project_auth_node` VALUES (13590, 4, 'project/account/auth');
-- INSERT INTO `team_project_auth_node` VALUES (13591, 4, 'project/account/del');
-- INSERT INTO `team_project_auth_node` VALUES (13592, 4, 'project/account/edit');
-- INSERT INTO `team_project_auth_node` VALUES (13593, 4, 'project/account/forbid');
INSERT INTO `team_project_auth_node` VALUES (13594, 4, 'project/account/index');
INSERT INTO `team_project_auth_node` VALUES (13595, 4, 'project/account/read');
INSERT INTO `team_project_auth_node` VALUES (13596, 4, 'project/account/resume');
INSERT INTO `team_project_auth_node` VALUES (13597, 4, 'project/auth');
-- INSERT INTO `team_project_auth_node` VALUES (13598, 4, 'project/auth/add');
-- INSERT INTO `team_project_auth_node` VALUES (13599, 4, 'project/auth/apply');
-- INSERT INTO `team_project_auth_node` VALUES (13600, 4, 'project/auth/del');
-- INSERT INTO `team_project_auth_node` VALUES (13601, 4, 'project/auth/edit');
-- INSERT INTO `team_project_auth_node` VALUES (13602, 4, 'project/auth/forbid');
INSERT INTO `team_project_auth_node` VALUES (13603, 4, 'project/auth/index');
INSERT INTO `team_project_auth_node` VALUES (13604, 4, 'project/auth/resume');
INSERT INTO `team_project_auth_node` VALUES (13605, 4, 'project/auth/setdefault');
INSERT INTO `team_project_auth_node` VALUES (13606, 4, 'project/department');
INSERT INTO `team_project_auth_node` VALUES (13607, 4, 'project/department/delete');
INSERT INTO `team_project_auth_node` VALUES (13608, 4, 'project/department/edit');
INSERT INTO `team_project_auth_node` VALUES (13609, 4, 'project/department/index');
INSERT INTO `team_project_auth_node` VALUES (13610, 4, 'project/department/read');
INSERT INTO `team_project_auth_node` VALUES (13611, 4, 'project/department/save');
INSERT INTO `team_project_auth_node` VALUES (13612, 4, 'project/department_member');
INSERT INTO `team_project_auth_node` VALUES (13613, 4, 'project/department_member/detail');
INSERT INTO `team_project_auth_node` VALUES (13614, 4, 'project/department_member/index');
INSERT INTO `team_project_auth_node` VALUES (13615, 4, 'project/department_member/invitemember');
INSERT INTO `team_project_auth_node` VALUES (13616, 4, 'project/department_member/removemember');
INSERT INTO `team_project_auth_node` VALUES (13617, 4, 'project/department_member/searchinvitemember');
INSERT INTO `team_project_auth_node` VALUES (13618, 4, 'project/department_member/uploadfile');
INSERT INTO `team_project_auth_node` VALUES (13619, 4, 'project/file');
INSERT INTO `team_project_auth_node` VALUES (13620, 4, 'project/file/delete');
INSERT INTO `team_project_auth_node` VALUES (13621, 4, 'project/file/edit');
INSERT INTO `team_project_auth_node` VALUES (13622, 4, 'project/file/index');
INSERT INTO `team_project_auth_node` VALUES (13623, 4, 'project/file/read');
INSERT INTO `team_project_auth_node` VALUES (13624, 4, 'project/file/recovery');
INSERT INTO `team_project_auth_node` VALUES (13625, 4, 'project/file/recycle');
INSERT INTO `team_project_auth_node` VALUES (13626, 4, 'project/file/uploadfiles');
INSERT INTO `team_project_auth_node` VALUES (13627, 4, 'project/index');
INSERT INTO `team_project_auth_node` VALUES (13628, 4, 'project/index/changecurrentorganization');
INSERT INTO `team_project_auth_node` VALUES (13629, 4, 'project/index/editpassword');
INSERT INTO `team_project_auth_node` VALUES (13630, 4, 'project/index/editpersonal');
INSERT INTO `team_project_auth_node` VALUES (13631, 4, 'project/index/index');
INSERT INTO `team_project_auth_node` VALUES (13632, 4, 'project/index/info');
INSERT INTO `team_project_auth_node` VALUES (13633, 4, 'project/index/systemconfig');
INSERT INTO `team_project_auth_node` VALUES (13634, 4, 'project/index/uploadavatar');
INSERT INTO `team_project_auth_node` VALUES (13635, 4, 'project/index/uploadimg');
INSERT INTO `team_project_auth_node` VALUES (13636, 4, 'project/invite_link');
INSERT INTO `team_project_auth_node` VALUES (13637, 4, 'project/invite_link/save');
INSERT INTO `team_project_auth_node` VALUES (13638, 4, 'project/login/_bindmail');
INSERT INTO `team_project_auth_node` VALUES (13639, 4, 'project/login/_bindmobile');
INSERT INTO `team_project_auth_node` VALUES (13640, 4, 'project/menu');
INSERT INTO `team_project_auth_node` VALUES (13641, 4, 'project/menu/menu');
-- INSERT INTO `team_project_auth_node` VALUES (13642, 4, 'project/menu/menuadd');
-- INSERT INTO `team_project_auth_node` VALUES (13643, 4, 'project/menu/menudel');
-- INSERT INTO `team_project_auth_node` VALUES (13644, 4, 'project/menu/menuedit');
-- INSERT INTO `team_project_auth_node` VALUES (13645, 4, 'project/menu/menuforbid');
-- INSERT INTO `team_project_auth_node` VALUES (13646, 4, 'project/menu/menuresume');
INSERT INTO `team_project_auth_node` VALUES (13647, 4, 'project/node');
INSERT INTO `team_project_auth_node` VALUES (13648, 4, 'project/node/alllist');
-- INSERT INTO `team_project_auth_node` VALUES (13649, 4, 'project/node/clear');
INSERT INTO `team_project_auth_node` VALUES (13650, 4, 'project/node/index');
-- INSERT INTO `team_project_auth_node` VALUES (13651, 4, 'project/node/save');
INSERT INTO `team_project_auth_node` VALUES (13652, 4, 'project/notify');
INSERT INTO `team_project_auth_node` VALUES (13653, 4, 'project/notify/batchdel');
INSERT INTO `team_project_auth_node` VALUES (13654, 4, 'project/notify/delete');
INSERT INTO `team_project_auth_node` VALUES (13655, 4, 'project/notify/index');
INSERT INTO `team_project_auth_node` VALUES (13656, 4, 'project/notify/noreads');
INSERT INTO `team_project_auth_node` VALUES (13657, 4, 'project/notify/read');
INSERT INTO `team_project_auth_node` VALUES (13658, 4, 'project/notify/setreadied');
INSERT INTO `team_project_auth_node` VALUES (13659, 4, 'project/organization');
-- INSERT INTO `team_project_auth_node` VALUES (13660, 4, 'project/organization/delete');
-- INSERT INTO `team_project_auth_node` VALUES (13661, 4, 'project/organization/edit');
INSERT INTO `team_project_auth_node` VALUES (13662, 4, 'project/organization/index');
INSERT INTO `team_project_auth_node` VALUES (13663, 4, 'project/organization/read');
-- INSERT INTO `team_project_auth_node` VALUES (13664, 4, 'project/organization/save');
INSERT INTO `team_project_auth_node` VALUES (13665, 4, 'project/organization/_getorglist');
INSERT INTO `team_project_auth_node` VALUES (13666, 4, 'project/project');
INSERT INTO `team_project_auth_node` VALUES (13667, 4, 'project/project/analysis');
INSERT INTO `team_project_auth_node` VALUES (13668, 4, 'project/project/archive');
INSERT INTO `team_project_auth_node` VALUES (13669, 4, 'project/project/edit');
INSERT INTO `team_project_auth_node` VALUES (13670, 4, 'project/project/getlogbyselfproject');
INSERT INTO `team_project_auth_node` VALUES (13671, 4, 'project/project/index');
INSERT INTO `team_project_auth_node` VALUES (13672, 4, 'project/project/quit');
INSERT INTO `team_project_auth_node` VALUES (13673, 4, 'project/project/read');
INSERT INTO `team_project_auth_node` VALUES (13674, 4, 'project/project/recovery');
INSERT INTO `team_project_auth_node` VALUES (13675, 4, 'project/project/recoveryarchive');
INSERT INTO `team_project_auth_node` VALUES (13676, 4, 'project/project/recycle');
-- INSERT INTO `team_project_auth_node` VALUES (13677, 4, 'project/project/save');
INSERT INTO `team_project_auth_node` VALUES (13678, 4, 'project/project/selflist');
INSERT INTO `team_project_auth_node` VALUES (13679, 4, 'project/project/uploadcover');
INSERT INTO `team_project_auth_node` VALUES (13680, 4, 'project/project_collect');
INSERT INTO `team_project_auth_node` VALUES (13681, 4, 'project/project_collect/collect');
INSERT INTO `team_project_auth_node` VALUES (13682, 4, 'project/project_features');
INSERT INTO `team_project_auth_node` VALUES (13683, 4, 'project/project_features/delete');
INSERT INTO `team_project_auth_node` VALUES (13684, 4, 'project/project_features/edit');
INSERT INTO `team_project_auth_node` VALUES (13685, 4, 'project/project_features/index');
INSERT INTO `team_project_auth_node` VALUES (13686, 4, 'project/project_features/save');
INSERT INTO `team_project_auth_node` VALUES (13687, 4, 'project/project_member');
INSERT INTO `team_project_auth_node` VALUES (13688, 4, 'project/project_member/index');
INSERT INTO `team_project_auth_node` VALUES (13689, 4, 'project/project_member/invitemember');
INSERT INTO `team_project_auth_node` VALUES (13690, 4, 'project/project_member/removemember');
INSERT INTO `team_project_auth_node` VALUES (13691, 4, 'project/project_member/searchinvitemember');
INSERT INTO `team_project_auth_node` VALUES (13692, 4, 'project/project_member/_listforinvite');
INSERT INTO `team_project_auth_node` VALUES (13693, 4, 'project/project_template');
INSERT INTO `team_project_auth_node` VALUES (13694, 4, 'project/project_template/delete');
INSERT INTO `team_project_auth_node` VALUES (13695, 4, 'project/project_template/edit');
INSERT INTO `team_project_auth_node` VALUES (13696, 4, 'project/project_template/index');
INSERT INTO `team_project_auth_node` VALUES (13697, 4, 'project/project_template/save');
INSERT INTO `team_project_auth_node` VALUES (13698, 4, 'project/project_template/uploadcover');
INSERT INTO `team_project_auth_node` VALUES (13699, 4, 'project/project_version');
INSERT INTO `team_project_auth_node` VALUES (13700, 4, 'project/project_version/addversiontask');
INSERT INTO `team_project_auth_node` VALUES (13701, 4, 'project/project_version/changestatus');
INSERT INTO `team_project_auth_node` VALUES (13702, 4, 'project/project_version/delete');
INSERT INTO `team_project_auth_node` VALUES (13703, 4, 'project/project_version/edit');
INSERT INTO `team_project_auth_node` VALUES (13704, 4, 'project/project_version/index');
INSERT INTO `team_project_auth_node` VALUES (13705, 4, 'project/project_version/read');
INSERT INTO `team_project_auth_node` VALUES (13706, 4, 'project/project_version/removeversiontask');
INSERT INTO `team_project_auth_node` VALUES (13707, 4, 'project/project_version/save');
INSERT INTO `team_project_auth_node` VALUES (13708, 4, 'project/source_link');
INSERT INTO `team_project_auth_node` VALUES (13709, 4, 'project/source_link/delete');
INSERT INTO `team_project_auth_node` VALUES (13710, 4, 'project/task');
INSERT INTO `team_project_auth_node` VALUES (13711, 4, 'project/task/assigntask');
INSERT INTO `team_project_auth_node` VALUES (13712, 4, 'project/task/batchassigntask');
INSERT INTO `team_project_auth_node` VALUES (13713, 4, 'project/task/createcomment');
INSERT INTO `team_project_auth_node` VALUES (13714, 4, 'project/task/datetotalforproject');
INSERT INTO `team_project_auth_node` VALUES (13715, 4, 'project/task/delete');
INSERT INTO `team_project_auth_node` VALUES (13716, 4, 'project/task/deltaskworktime');
INSERT INTO `team_project_auth_node` VALUES (13717, 4, 'project/task/edit');
INSERT INTO `team_project_auth_node` VALUES (13718, 4, 'project/task/edittaskworktime');
INSERT INTO `team_project_auth_node` VALUES (13719, 4, 'project/task/getlistbytasktag');
INSERT INTO `team_project_auth_node` VALUES (13720, 4, 'project/task/index');
INSERT INTO `team_project_auth_node` VALUES (13721, 4, 'project/task/like');
INSERT INTO `team_project_auth_node` VALUES (13722, 4, 'project/task/read');
INSERT INTO `team_project_auth_node` VALUES (13723, 4, 'project/task/recovery');
INSERT INTO `team_project_auth_node` VALUES (13724, 4, 'project/task/recycle');
INSERT INTO `team_project_auth_node` VALUES (13725, 4, 'project/task/recyclebatch');
INSERT INTO `team_project_auth_node` VALUES (13726, 4, 'project/task/save');
INSERT INTO `team_project_auth_node` VALUES (13727, 4, 'project/task/savetaskworktime');
INSERT INTO `team_project_auth_node` VALUES (13728, 4, 'project/task/selflist');
INSERT INTO `team_project_auth_node` VALUES (13729, 4, 'project/task/setprivate');
INSERT INTO `team_project_auth_node` VALUES (13730, 4, 'project/task/settag');
INSERT INTO `team_project_auth_node` VALUES (13731, 4, 'project/task/sort');
INSERT INTO `team_project_auth_node` VALUES (13732, 4, 'project/task/star');
INSERT INTO `team_project_auth_node` VALUES (13733, 4, 'project/task/taskdone');
INSERT INTO `team_project_auth_node` VALUES (13734, 4, 'project/task/tasklog');
INSERT INTO `team_project_auth_node` VALUES (13735, 4, 'project/task/tasksources');
INSERT INTO `team_project_auth_node` VALUES (13736, 4, 'project/task/tasktotags');
INSERT INTO `team_project_auth_node` VALUES (13737, 4, 'project/task/uploadfile');
INSERT INTO `team_project_auth_node` VALUES (13738, 4, 'project/task/_taskworktimelist');
INSERT INTO `team_project_auth_node` VALUES (13739, 4, 'project/task_member');
INSERT INTO `team_project_auth_node` VALUES (13740, 4, 'project/task_member/index');
INSERT INTO `team_project_auth_node` VALUES (13741, 4, 'project/task_member/invitemember');
INSERT INTO `team_project_auth_node` VALUES (13742, 4, 'project/task_member/invitememberbatch');
INSERT INTO `team_project_auth_node` VALUES (13743, 4, 'project/task_member/searchinvitemember');
INSERT INTO `team_project_auth_node` VALUES (13744, 4, 'project/task_stages');
INSERT INTO `team_project_auth_node` VALUES (13745, 4, 'project/task_stages/delete');
INSERT INTO `team_project_auth_node` VALUES (13746, 4, 'project/task_stages/edit');
INSERT INTO `team_project_auth_node` VALUES (13747, 4, 'project/task_stages/index');
INSERT INTO `team_project_auth_node` VALUES (13748, 4, 'project/task_stages/save');
INSERT INTO `team_project_auth_node` VALUES (13749, 4, 'project/task_stages/sort');
INSERT INTO `team_project_auth_node` VALUES (13750, 4, 'project/task_stages/tasks');
INSERT INTO `team_project_auth_node` VALUES (13751, 4, 'project/task_stages/_getall');
INSERT INTO `team_project_auth_node` VALUES (13752, 4, 'project/task_stages_template');
INSERT INTO `team_project_auth_node` VALUES (13753, 4, 'project/task_stages_template/delete');
INSERT INTO `team_project_auth_node` VALUES (13754, 4, 'project/task_stages_template/edit');
INSERT INTO `team_project_auth_node` VALUES (13755, 4, 'project/task_stages_template/index');
INSERT INTO `team_project_auth_node` VALUES (13756, 4, 'project/task_stages_template/save');
INSERT INTO `team_project_auth_node` VALUES (13757, 4, 'project/task_tag');
INSERT INTO `team_project_auth_node` VALUES (13758, 4, 'project/task_tag/delete');
INSERT INTO `team_project_auth_node` VALUES (13759, 4, 'project/task_tag/edit');
INSERT INTO `team_project_auth_node` VALUES (13760, 4, 'project/task_tag/index');
INSERT INTO `team_project_auth_node` VALUES (13761, 4, 'project/task_tag/save');
INSERT INTO `team_project_auth_node` VALUES (13762, 4, 'project/task_workflow');
INSERT INTO `team_project_auth_node` VALUES (13763, 4, 'project/task_workflow/delete');
INSERT INTO `team_project_auth_node` VALUES (13764, 4, 'project/task_workflow/edit');
INSERT INTO `team_project_auth_node` VALUES (13765, 4, 'project/task_workflow/index');
INSERT INTO `team_project_auth_node` VALUES (13766, 4, 'project/task_workflow/save');
INSERT INTO `team_project_auth_node` VALUES (16631, 3, 'project/project/_projectstats');
INSERT INTO `team_project_auth_node` VALUES (16632, 3, 'project/project/_getprojectreport');
INSERT INTO `team_project_auth_node` VALUES (16633, 3, 'project/project_info');
INSERT INTO `team_project_auth_node` VALUES (16634, 3, 'project/task_stages/_getall');
INSERT INTO `team_project_auth_node` VALUES (16635, 4, 'project/project/_projectstats');
INSERT INTO `team_project_auth_node` VALUES (16636, 4, 'project/project/_getprojectreport');
INSERT INTO `team_project_auth_node` VALUES (16637, 4, 'project/project_info');
INSERT INTO `team_project_auth_node` VALUES (16638, 4, 'project/task_stages/_getall');
INSERT INTO `team_project_auth_node` VALUES (16687, 1, 'project/project_version/_getversiontask');
INSERT INTO `team_project_auth_node` VALUES (16688, 2, 'project/project_version/_getversiontask');
INSERT INTO `team_project_auth_node` VALUES (16689, 3, 'project/project_version/_getversiontask');
INSERT INTO `team_project_auth_node` VALUES (16690, 4, 'project/project_version/_getversiontask');
INSERT INTO `team_project_auth_node` VALUES (16707, 1, 'project/project_version/_getversionlog');
INSERT INTO `team_project_auth_node` VALUES (16708, 2, 'project/project_version/_getversionlog');
INSERT INTO `team_project_auth_node` VALUES (16709, 3, 'project/project_version/_getversionlog');
INSERT INTO `team_project_auth_node` VALUES (16710, 4, 'project/project_version/_getversionlog');

INSERT INTO `team_project_auth_node` VALUES (17000, 1, 'project/project/gettoplist');
INSERT INTO `team_project_auth_node` VALUES (17001, 2, 'project/project/gettoplist');
INSERT INTO `team_project_auth_node` VALUES (17002, 3, 'project/project/gettoplist');
INSERT INTO `team_project_auth_node` VALUES (17003, 4, 'project/project/gettoplist');
INSERT INTO `team_project_auth_node` VALUES (17004, 1, 'project/project/taskpriority');
INSERT INTO `team_project_auth_node` VALUES (17005, 2, 'project/project/taskpriority');
INSERT INTO `team_project_auth_node` VALUES (17006, 3, 'project/project/taskpriority');
INSERT INTO `team_project_auth_node` VALUES (17007, 4, 'project/project/taskpriority');


-- ----------------------------
-- Table structure for team_project_collection
-- ----------------------------
DROP TABLE IF EXISTS `team_project_collection`;
CREATE TABLE `team_project_collection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '项目id',
  `member_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '成员id',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加入时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目-收藏表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for team_project_config
-- ----------------------------
DROP TABLE IF EXISTS `team_project_config`;
CREATE TABLE `team_project_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `project_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for team_project_features
-- ----------------------------
DROP TABLE IF EXISTS `team_project_features`;
CREATE TABLE `team_project_features`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本库名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organization_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织id',
  `project_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '项目id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `project_code`(`project_code`) USING BTREE,
  INDEX `organization_code`(`organization_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '版本库表' ROW_FORMAT = Dynamic;



-- ----------------------------
-- Table structure for team_project_info
-- ----------------------------
DROP TABLE IF EXISTS `team_project_info`;
CREATE TABLE `team_project_info`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organization_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织id',
  `project_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '项目id',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'code',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `project_code`(`project_code`) USING BTREE,
  INDEX `organization_code`(`organization_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目自定义信息表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for team_project_log
-- ----------------------------
DROP TABLE IF EXISTS `team_project_log`;
CREATE TABLE `team_project_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `member_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '操作人id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作内容',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'create' COMMENT '操作类型',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  `source_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '任务id',
  `action_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场景类型',
  `to_member_code` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `is_comment` tinyint(1) NULL DEFAULT 0 COMMENT '是否评论，0：否',
  `project_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_robot` tinyint(1) NULL DEFAULT 0 COMMENT '是否机器人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `member_code`(`member_code`) USING BTREE,
  INDEX `source_code`(`source_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4875 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目日志表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for team_project_member
-- ----------------------------
DROP TABLE IF EXISTS `team_project_member`;
CREATE TABLE `team_project_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '项目id',
  `member_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '成员id',
  `join_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加入时间',
  `is_owner` int(11) NULL DEFAULT 0 COMMENT '拥有者',
  `authorize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`project_code`, `member_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目-成员表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for team_project_menu
-- ----------------------------
DROP TABLE IF EXISTS `team_project_menu`;
CREATE TABLE `team_project_menu`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `file_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `params` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '链接参数',
  `node` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '权限节点',
  `sort` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '菜单排序',
  `status` tinyint(3) UNSIGNED NULL DEFAULT 1 COMMENT '状态(0:禁用,1:启用)',
  `create_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_at` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `is_inner` tinyint(1) NULL DEFAULT 0 COMMENT '是否内页',
  `values` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数默认值',
  `show_slider` tinyint(1) NULL DEFAULT 1 COMMENT '是否显示侧栏',
  `_values` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 175 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team_project_menu
-- ----------------------------
INSERT INTO `team_project_menu` VALUES (120, 0, '工作台', 'appstore-o', 'home', 'home', ':org', '#', 0, 1, 0, '2018-09-30 16:30:01', 0, '', 0, NULL);
INSERT INTO `team_project_menu` VALUES (121, 0, '项目管理', 'project', '#', '#', '', '#', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (122, 121, '项目列表', 'branches', '#', '#', '', '#', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (124, 0, '系统设置', 'setting', '#', '#', '', '#', 100, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (125, 124, '成员管理', 'unlock', '#', '#', '', '#', 10, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (126, 125, '账号列表', '', 'system/account', 'system/account', '', 'project/account/index', 10, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (127, 122, '我的组织', '', 'organization', 'organization', '', 'project/organization/index', 30, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (130, 125, '访问授权', '', 'system/account/auth', 'system/account/auth', '', 'project/auth/index', 20, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (131, 125, '授权页面', '', 'system/account/apply', 'system/account/apply', ':id', 'project/auth/apply', 30, 1, 0, '0000-00-00 00:00:00', 1, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (138, 121, '消息提醒', 'info-circle-o', '#', '#', '', '#', 30, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (139, 138, '站内消息', '', 'notify/notice', 'notify/notice', '', 'project/notify/index', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (140, 138, '系统公告', '', 'notify/system', 'notify/system', '', 'project/notify/index', 10, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (143, 124, '系统管理', 'appstore', '#', '#', '', '#', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (144, 143, '菜单路由', '', 'system/config/menu', 'system/config/menu', '', 'project/menu/menuadd', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (145, 143, '访问节点', '', 'system/config/node', 'system/config/node', '', 'project/node/save', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (148, 124, '个人管理', 'user', '#', '#', '', '#', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (149, 148, '个人设置', '', 'account/setting/base', 'account/setting/base', '', 'project/index/editpersonal', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (150, 148, '安全设置', '', 'account/setting/security', 'account/setting/security', '', 'project/index/editpersonal', 0, 1, 0, '0000-00-00 00:00:00', 1, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (151, 122, '我的项目', '', 'project/list', 'project/list', ':type', 'project/project/index', 0, 1, 0, '0000-00-00 00:00:00', 0, 'my', 1, NULL);
INSERT INTO `team_project_menu` VALUES (152, 122, '回收站', '', 'project/recycle', 'project/recycle', '', 'project/project/index', 20, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (153, 121, '项目空间', 'heat-map', 'project/space/task', 'project/space/task', ':code', '#', 20, 1, 0, '0000-00-00 00:00:00', 1, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (154, 153, '任务详情', '', 'project/space/task/:code/detail', 'project/space/taskdetail', ':code', 'project/task/read', 0, 1, 0, '0000-00-00 00:00:00', 1, '', 0, NULL);
INSERT INTO `team_project_menu` VALUES (155, 122, '我的收藏', '', 'project/list', 'project/list', ':type', 'project/project/index', 10, 1, 0, '0000-00-00 00:00:00', 0, 'collect', 1, NULL);
INSERT INTO `team_project_menu` VALUES (156, 121, '基础设置', 'experiment', '#', '#', '', '#', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (157, 156, '项目模板', '', 'project/template', 'project/template', '', 'project/project_template/index', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (158, 156, '项目列表模板', '', 'project/template/taskStages', 'project/template/taskStages', ':code', 'project/task_stages_template/index', 0, 1, 0, '0000-00-00 00:00:00', 1, '', 0, NULL);
INSERT INTO `team_project_menu` VALUES (159, 122, '已归档项目', '', 'project/archive', 'project/archive', '', 'project/project/index', 10, 1, 0, NULL, 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (160, 0, '团队成员', 'team', '#', '#', '', '#', 0, 1, 0, NULL, 1, '', 0, NULL);
INSERT INTO `team_project_menu` VALUES (161, 153, '项目概况', '', 'project/space/overview', 'project/space/overview', ':code', 'project/index/info', 20, 1, 0, NULL, 1, '', 0, NULL);
INSERT INTO `team_project_menu` VALUES (162, 153, '项目文件', '', 'project/space/files', 'project/space/files', ':code', 'project/index/info', 10, 1, 0, NULL, 1, '', 0, NULL);
INSERT INTO `team_project_menu` VALUES (163, 122, '项目分析', '', 'project/analysis', 'project/analysis', '', 'project/index/info', 5, 1, 0, NULL, 0, '', 1, NULL);
INSERT INTO `team_project_menu` VALUES (164, 160, '团队成员', '', '#', '#', '', '#', 0, 1, 0, NULL, 1, '', 0, NULL);
INSERT INTO `team_project_menu` VALUES (166, 164, '团队成员', '', 'members', 'members', '', 'project/department/index', 0, 1, 0, NULL, 1, '', 0, NULL);
INSERT INTO `team_project_menu` VALUES (167, 164, '成员信息', '', 'members/profile', 'members/profile', ':code', 'project/department/read', 0, 1, 0, NULL, 1, '', 0, NULL);
INSERT INTO `team_project_menu` VALUES (168, 153, '版本管理', '', 'project/space/features', 'project/space/features', ':code', 'project/index/info', 20, 1, 0, NULL, 1, '', 0, NULL);

-- ----------------------------
-- Table structure for team_project_node
-- ----------------------------
DROP TABLE IF EXISTS `team_project_node`;
CREATE TABLE `team_project_node`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `node` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点标题',
  `is_menu` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '是否可设置为菜单',
  `is_auth` tinyint(3) UNSIGNED NULL DEFAULT 1 COMMENT '是否启动RBAC权限控制',
  `is_login` tinyint(3) UNSIGNED NULL DEFAULT 1 COMMENT '是否启动登录控制',
  `create_at` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_system_node_node`(`node`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 648 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目端节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team_project_node
-- ----------------------------
INSERT INTO `team_project_node` VALUES (360, 'project', '项目管理模块', 0, 1, 1, '2018-09-19 17:48:16');
INSERT INTO `team_project_node` VALUES (361, 'project/index/info', '详情', 0, 1, 1, '2018-09-19 17:48:34');
INSERT INTO `team_project_node` VALUES (362, 'project/index', '基础版块', 0, 1, 1, '2018-09-19 17:48:34');
INSERT INTO `team_project_node` VALUES (363, 'project/index/index', '框架布局', 0, 1, 1, '2018-09-30 16:48:35');
INSERT INTO `team_project_node` VALUES (364, 'project/index/systemconfig', '系统信息', 0, 1, 1, '2018-09-30 16:55:11');
INSERT INTO `team_project_node` VALUES (365, 'project/index/editpersonal', '修改个人资料', 0, 1, 1, '2018-09-30 17:42:42');
INSERT INTO `team_project_node` VALUES (366, 'project/index/uploadavatar', '上传头像', 0, 1, 1, '2018-09-30 17:42:46');
INSERT INTO `team_project_node` VALUES (370, 'project/account', '账号管理', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (371, 'project/account/index', '账号列表', 0, 0, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (372, 'project/organization/index', '组织列表', 0, 0, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (373, 'project/organization/save', '创建组织', 0, 0, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (374, 'project/organization/read', '组织信息', 0, 0, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (375, 'project/organization/edit', '编辑组织', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (376, 'project/organization/delete', '删除组织', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (377, 'project/organization', '组织管理', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (388, 'project/auth/index', '权限列表', 0, 0, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (389, 'project/auth/add', '添加权限角色', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (390, 'project/auth/edit', '编辑权限', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (391, 'project/auth/forbid', '禁用权限', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (392, 'project/auth/resume', '启用权限', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (393, 'project/auth/del', '删除权限', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (394, 'project/auth', '访问授权', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (395, 'project/auth/apply', '应用权限', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (396, 'project/notify/index', '通知列表', 0, 0, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (397, 'project/notify/noreads', '未读通知', 0, 0, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (399, 'project/notify/read', '通知信息', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (401, 'project/notify/delete', '删除通知', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (402, 'project/notify', '通知管理', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (434, 'project/account/auth', '授权管理', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (435, 'project/account/add', '添加账号', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (436, 'project/account/edit', '编辑账号', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (437, 'project/account/del', '删除账号', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (438, 'project/account/forbid', '禁用账号', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (439, 'project/account/resume', '启用账号', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (498, 'project/notify/setreadied', '设置已读', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (499, 'project/notify/batchdel', '批量删除', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `team_project_node` VALUES (500, 'project/auth/setdefault', '设置默认权限', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (501, 'project/department', '部门管理', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (502, 'project/department/index', '部门列表', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (503, 'project/department/read', '部门信息', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (504, 'project/department/save', '创建部门', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (505, 'project/department/edit', '编辑部门', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (506, 'project/department/delete', '删除部门', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (507, 'project/department_member', '部门成员管理', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (508, 'project/department_member/index', '部门成员列表', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (509, 'project/department_member/searchinvitemember', '搜索部门成员', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (510, 'project/department_member/invitemember', '添加部门成员', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (511, 'project/department_member/removemember', '移除部门成员', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (512, 'project/index/changecurrentorganization', '切换当前组织', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (513, 'project/index/editpassword', '修改密码', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (514, 'project/index/uploadimg', '上传图片', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (515, 'project/menu', '菜单管理', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (516, 'project/menu/menu', '菜单列表', 0, 0, 0, NULL);
INSERT INTO `team_project_node` VALUES (517, 'project/menu/menuadd', '添加菜单', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (518, 'project/menu/menuedit', '编辑菜单', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (519, 'project/menu/menuforbid', '禁用菜单', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (520, 'project/menu/menuresume', '启用菜单', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (521, 'project/menu/menudel', '删除菜单', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (522, 'project/node', '节点管理', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (523, 'project/node/index', '节点列表', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (524, 'project/node/alllist', '全部节点列表', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (525, 'project/node/clear', '清理节点', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (526, 'project/node/save', '编辑节点', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (527, 'project/project', '项目管理', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (528, 'project/project/index', '项目列表', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (529, 'project/project/selflist', '个人项目列表', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (530, 'project/project/save', '创建项目', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (531, 'project/project/read', '项目信息', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (532, 'project/project/edit', '编辑项目', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (533, 'project/project/uploadcover', '上传项目封面', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (534, 'project/project/recycle', '项目放入回收站', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (535, 'project/project/recovery', '恢复项目', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (536, 'project/project/archive', '归档项目', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (537, 'project/project/recoveryarchive', '取消归档项目', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (538, 'project/project/quit', '退出项目', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (539, 'project/project_collect', '项目收藏管理', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (540, 'project/project_collect/collect', '收藏项目', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (541, 'project/project_member', '项目成员管理', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (542, 'project/project_member/index', '项目成员列表', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (543, 'project/project_member/searchinvitemember', '搜索项目成员', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (544, 'project/project_member/invitemember', '邀请项目成员', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (545, 'project/project_template', '项目模板管理', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (546, 'project/project_template/index', '项目模板列表', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (547, 'project/project_template/save', '创建项目模板', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (548, 'project/project_template/uploadcover', '上传项目模板封面', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (549, 'project/project_template/edit', '编辑项目模板', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (550, 'project/project_template/delete', '删除项目模板', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (551, 'project/task/index', '任务列表', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (552, 'project/task/selflist', '个人任务列表', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (553, 'project/task/read', '任务信息', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (554, 'project/task/save', '创建任务', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (555, 'project/task/taskdone', '更改任务状态', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (556, 'project/task/assigntask', '指派任务执行者', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (557, 'project/task/sort', '任务排序', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (558, 'project/task/createcomment', '发表任务评论', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (559, 'project/task/edit', '编辑任务', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (560, 'project/task/like', '点赞任务', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (561, 'project/task/star', '收藏任务', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (562, 'project/task/recycle', '移动任务到回收站', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (563, 'project/task/recovery', '恢复任务', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (564, 'project/task/delete', '删除任务', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (565, 'project/task', '任务管理', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (569, 'project/task_member/index', '任务成员列表', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (570, 'project/task_member/searchinvitemember', '搜索任务成员', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (571, 'project/task_member/invitemember', '添加任务成员', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (572, 'project/task_member/invitememberbatch', '批量添加任务成员', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (573, 'project/task_member', '任务成员管理', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (574, 'project/task_stages', '任务分组管理', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (575, 'project/task_stages/index', '任务分组列表', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (576, 'project/task_stages/tasks', '任务分组任务列表', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (577, 'project/task_stages/sort', '任务分组排序', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (578, 'project/task_stages/save', '添加任务分组', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (579, 'project/task_stages/edit', '编辑任务分组', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (580, 'project/task_stages/delete', '删除任务分组', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (581, 'project/task_stages_template/index', '任务分组模板列表', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (582, 'project/task_stages_template/save', '创建任务分组模板', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (583, 'project/task_stages_template/edit', '编辑任务分组模板', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (584, 'project/task_stages_template/delete', '删除任务分组模板', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (585, 'project/task_stages_template', '任务分组模板管理', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (587, 'project/project_member/removemember', '移除项目成员', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (588, 'project/task/datetotalforproject', '任务统计', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (589, 'project/task/tasksources', '任务资源列表', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (590, 'project/file', '文件管理', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (591, 'project/file/index', '文件列表', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (592, 'project/file/read', '文件详情', 0, 0, 1, NULL);
INSERT INTO `team_project_node` VALUES (593, 'project/file/uploadfiles', '上传文件', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (594, 'project/file/edit', '编辑文件', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (595, 'project/file/recycle', '文件移至回收站', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (596, 'project/file/recovery', '恢复文件', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (597, 'project/file/delete', '删除文件', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (598, 'project/project/getlogbyselfproject', '项目概况', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (599, 'project/source_link', '资源关联管理', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (600, 'project/source_link/delete', '取消关联', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (601, 'project/task/tasklog', '任务动态', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (602, 'project/task/recyclebatch', '批量移动任务到回收站', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (603, 'project/invite_link', '邀请链接管理', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (604, 'project/invite_link/save', '创建邀请链接', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (605, 'project/task/setprivate', '设置任务隐私模式', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (606, 'project/account/read', '账号信息', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (607, 'project/task/batchassigntask', '批量指派任务', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (608, 'project/task/tasktotags', '任务标签', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (609, 'project/task/settag', '设置任务标签', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (610, 'project/task_tag', '任务标签管理', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (611, 'project/task_tag/index', '任务标签列表', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (612, 'project/task_tag/save', '创建任务标签', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (613, 'project/task_tag/edit', '编辑任务标签', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (614, 'project/task_tag/delete', '删除任务标签', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (615, 'project/project_features', '项目版本库管理', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (616, 'project/project_features/index', '版本库列表', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (617, 'project/project_features/save', '添加版本库', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (618, 'project/project_features/edit', '编辑版本库', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (619, 'project/project_features/delete', '删除版本库', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (620, 'project/project_version', '项目版本管理', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (621, 'project/project_version/index', '项目版本列表', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (622, 'project/project_version/save', '添加项目版本', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (623, 'project/project_version/edit', '编辑项目版本', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (624, 'project/project_version/changestatus', '更改项目版本状态', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (625, 'project/project_version/read', '项目版本详情', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (626, 'project/project_version/addversiontask', '关联项目版本任务', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (627, 'project/project_version/removeversiontask', '移除项目版本任务', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (628, 'project/project_version/delete', '删除项目版本', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (629, 'project/task/getlistbytasktag', '标签任务列表', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (630, 'project/task_workflow', '任务流转管理', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (631, 'project/task_workflow/index', '任务流转列表', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (632, 'project/task_workflow/save', '添加任务流转', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (633, 'project/task_workflow/edit', '编辑任务流转', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (634, 'project/task_workflow/delete', '删除任务流转', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (635, 'project/department_member/detail', '部门成员详情', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (636, 'project/department_member/uploadfile', '上传头像', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (637, 'project/task/savetaskworktime', '保存任务流转', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (638, 'project/task/edittaskworktime', '编辑任务流转', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (639, 'project/task/deltaskworktime', '删除任务流转', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (640, 'project/task/uploadfile', '上传文件', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (641, 'project/task_stages/_getall', '创建规则', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (642, 'project/login/_bindmobile', '绑定号码', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (643, 'project/login/_bindmail', '绑定邮箱', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (644, 'project/task/_taskworktimelist', '任务工时', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (645, 'project/project_member/_listforinvite', '邀请新成员', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (646, 'project/project_info', '项目信息', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (647, 'project/project/_getprojectreport', '项目报告', 0, 1, 1, NULL);
INSERT INTO `team_project_node` VALUES (648, 'project/project/_projectstats', '项目统计资料', 0, 1, 1, NULL);

-- ----------------------------
-- Table structure for team_project_report
-- ----------------------------
DROP TABLE IF EXISTS `team_project_report`;
CREATE TABLE `team_project_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目编号',
  `date` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日期',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `union`(`project_code`, `date`) USING BTREE,
  INDEX `code`(`project_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目报表统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for team_project_template
-- ----------------------------
DROP TABLE IF EXISTS `team_project_template`;
CREATE TABLE `team_project_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `sort` tinyint(4) NULL DEFAULT 0,
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  `organization_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '组织id',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
  `member_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建人',
  `is_system` tinyint(1) NULL DEFAULT 0 COMMENT '系统默认',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team_project_template
-- ----------------------------
INSERT INTO `team_project_template` VALUES (11, '产品进展', '适用于互联网产品人员对产品计划、跟进及发布管理', 0, '2018-04-30 22:15:10', 'd85f1bvwpml2nhxe94zu7tyi', '6v7be19pwman2fird04gqu53', 'http://easyproject.net/static/image/default/cover.png', '', 1);
INSERT INTO `team_project_template` VALUES (12, '需求管理', '适用于产品部门对需求的收集、评估及反馈管理', 0, '2018-04-30 22:16:29', 'd85f1bvwpml2nhxe92zu7tyi', '6v7be19pwman2fird04gqu53', 'http://easyproject.net/static/image/default/cover.png', '', 1);

-- ----------------------------
-- Table structure for team_project_version
-- ----------------------------
DROP TABLE IF EXISTS `team_project_version`;
CREATE TABLE `team_project_version`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本库名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organization_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织id',
  `publish_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布时间',
  `start_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态。0：未开始，1：进行中，2：延期发布，3：已发布',
  `schedule` int(11) NULL DEFAULT 0 COMMENT '进度百分比',
  `plan_publish_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预计发布时间',
  `features_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本库编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `organization_code`(`organization_code`) USING BTREE,
  INDEX `features_code`(`features_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目版本表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for team_project_version_log
-- ----------------------------
DROP TABLE IF EXISTS `team_project_version_log`;
CREATE TABLE `team_project_version_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `member_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作内容',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '日志描述',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'create' COMMENT '操作类型',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  `source_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '任务id',
  `project_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目编号',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `features_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本库编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `project_code`(`project_code`) USING BTREE,
  INDEX `features_code`(`features_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目日志表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for team_source_link
-- ----------------------------
DROP TABLE IF EXISTS `team_source_link`;
CREATE TABLE `team_source_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  `source_type` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源类型',
  `source_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源编号',
  `link_type` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联类型',
  `link_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联编号',
  `organization_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织编码',
  `create_by` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源关联表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for team_system_config
-- ----------------------------
DROP TABLE IF EXISTS `team_system_config`;
CREATE TABLE `team_system_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置编码',
  `value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_system_config_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统参数配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team_system_config
-- ----------------------------
INSERT INTO `team_system_config` VALUES (1, 'app_name', 'Pear Project');
INSERT INTO `team_system_config` VALUES (2, 'site_name', 'Pear Project');
INSERT INTO `team_system_config` VALUES (3, 'app_version', '2.0');
INSERT INTO `team_system_config` VALUES (4, 'site_copy', 'Copyright © 2018 Pear Project出品');
INSERT INTO `team_system_config` VALUES (5, 'browser_icon', '');
INSERT INTO `team_system_config` VALUES (6, 'tongji_baidu_key', '');
INSERT INTO `team_system_config` VALUES (7, 'miitbeian', '粤ICP备16eeeee2号-2');
INSERT INTO `team_system_config` VALUES (8, 'storage_type', 'local');
INSERT INTO `team_system_config` VALUES (9, 'storage_local_exts', 'png,jpg,rar,doc,icon,mp4,zip,gif,jpeg,bmp,webp,mp4,m3u8,rmvb,avi,swf,3gp,mkv,flv,txt,docx,pages,epub,pdf,numbers,csv,xls,xlsx,keynote,ppt,pptx,mp3,wav,wma,ogg,aac,flac;');
INSERT INTO `team_system_config` VALUES (10, 'storage_qiniu_bucket', 'static');
INSERT INTO `team_system_config` VALUES (11, 'storage_qiniu_domain', 'example.xyz');
INSERT INTO `team_system_config` VALUES (12, 'storage_qiniu_access_key', 'example');
INSERT INTO `team_system_config` VALUES (13, 'storage_qiniu_secret_key', 'example');
INSERT INTO `team_system_config` VALUES (14, 'storage_oss_bucket', 'vilson-static');
INSERT INTO `team_system_config` VALUES (15, 'storage_oss_endpoint', 'oss-cn-shenzhen.aliyuncs.com');
INSERT INTO `team_system_config` VALUES (16, 'storage_oss_domain', 'example.xyz');
INSERT INTO `team_system_config` VALUES (17, 'storage_oss_keyid', 'example');
INSERT INTO `team_system_config` VALUES (18, 'storage_oss_secret', 'example');
INSERT INTO `team_system_config` VALUES (34, 'wechat_appid', '');
INSERT INTO `team_system_config` VALUES (35, 'wechat_appkey', '');
INSERT INTO `team_system_config` VALUES (36, 'storage_oss_is_https', 'https');
INSERT INTO `team_system_config` VALUES (37, 'wechat_type', 'thr');
INSERT INTO `team_system_config` VALUES (38, 'wechat_token', 'test');
INSERT INTO `team_system_config` VALUES (39, 'wechat_appsecret', '');
INSERT INTO `team_system_config` VALUES (40, 'wechat_encodingaeskey', '');
INSERT INTO `team_system_config` VALUES (41, 'wechat_thr_appid', '');
INSERT INTO `team_system_config` VALUES (42, 'wechat_thr_appkey', '');
INSERT INTO `team_system_config` VALUES (43, 'storage_qiniu_is_https', 'https');
INSERT INTO `team_system_config` VALUES (44, 'single_mode', '0');
INSERT INTO `team_system_config` VALUES (45, 'single_org_code', '');

-- ----------------------------
-- Table structure for team_system_log
-- ----------------------------
DROP TABLE IF EXISTS `team_system_log`;
CREATE TABLE `team_system_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `node` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `action` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作行为',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作内容描述',
  `create_at` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for team_task
-- ----------------------------
DROP TABLE IF EXISTS `team_task`;
CREATE TABLE `team_task`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `project_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '项目编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pri` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '紧急程度',
  `execute_status` enum('wait','doing','done','pause','cancel','closed') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'wait' COMMENT '执行状态',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  `create_by` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建日期',
  `assign_to` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '指派给谁',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '回收站',
  `stage_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '任务列表',
  `task_tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务标签',
  `done` tinyint(4) NULL DEFAULT 0 COMMENT '是否完成',
  `begin_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '截止时间',
  `remind_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提醒时间',
  `pcode` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '父任务id',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `like` int(11) NULL DEFAULT 0 COMMENT '点赞数',
  `star` int(11) NULL DEFAULT 0 COMMENT '收藏数',
  `deleted_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除时间',
  `private` tinyint(1) NULL DEFAULT 0 COMMENT '是否隐私模式',
  `id_num` int(11) NULL DEFAULT 1 COMMENT '任务id编号',
  `path` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '上级任务路径',
  `schedule` int(11) NULL DEFAULT 0 COMMENT '进度百分比',
  `version_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '版本id',
  `features_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '版本库id',
  `work_time` int(11) NULL DEFAULT 0 COMMENT '预估工时',
  `status` int(11) NULL DEFAULT NULL COMMENT '\'执行状态。0：未开始，1：已完成，2：进行中，3：挂起，4：测试中\'',
  `liked` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `project_code`) USING BTREE,
  UNIQUE INDEX `task`(`code`) USING BTREE,
  INDEX `stage_code`(`stage_code`) USING BTREE,
  INDEX `project_code`(`project_code`) USING BTREE,
  INDEX `pcode`(`pcode`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12467 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for team_task_like
-- ----------------------------
DROP TABLE IF EXISTS `team_task_like`;
CREATE TABLE `team_task_like`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '任务ID',
  `member_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '成员id',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务点赞表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for team_task_member
-- ----------------------------
DROP TABLE IF EXISTS `team_task_member`;
CREATE TABLE `team_task_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '任务ID',
  `is_executor` tinyint(1) NULL DEFAULT 0 COMMENT '执行者',
  `member_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '成员id',
  `join_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_owner` tinyint(1) NULL DEFAULT 0 COMMENT '是否创建人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 311 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务-成员表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for team_task_stages
-- ----------------------------
DROP TABLE IF EXISTS `team_task_stages`;
CREATE TABLE `team_task_stages`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `project_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '项目id',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 216 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务列表表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for team_task_stages_template
-- ----------------------------
DROP TABLE IF EXISTS `team_task_stages_template`;
CREATE TABLE `team_task_stages_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `project_template_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '项目id',
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT 0,
  `code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务列表模板表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team_task_stages_template
-- ----------------------------
INSERT INTO `team_task_stages_template` VALUES (72, '需求收集', 'd85f1bvwpml2nhxe92zu7tyi', '2018-12-24 22:01:30', 0, '48h13usk7en6ljyxbqgiw02z');
INSERT INTO `team_task_stages_template` VALUES (73, '评估确认', 'd85f1bvwpml2nhxe92zu7tyi', '2018-12-24 22:02:17', 0, '70z1fpxytvchbadkgsieowuj');
INSERT INTO `team_task_stages_template` VALUES (74, '需求暂缓', 'd85f1bvwpml2nhxe92zu7tyi', '2018-12-24 22:02:22', 0, 'bkyunf9jr2c37m4oi81sxzqp');
INSERT INTO `team_task_stages_template` VALUES (75, '研发中', 'd85f1bvwpml2nhxe92zu7tyi', '2018-12-24 22:02:27', 0, 'zu0vrhpoi835klgxqndmf6w9');
INSERT INTO `team_task_stages_template` VALUES (76, '内测中', 'd85f1bvwpml2nhxe92zu7tyi', '2018-12-24 22:02:32', 0, 'j4d5l7s6rgvk9o32ayt1uefc');
INSERT INTO `team_task_stages_template` VALUES (77, '通知用户', 'd85f1bvwpml2nhxe92zu7tyi', '2018-12-24 22:02:40', 0, 'cjk6al7f2ygp39des148iwzh');
INSERT INTO `team_task_stages_template` VALUES (78, '已完成&归档', 'd85f1bvwpml2nhxe92zu7tyi', '2018-12-24 22:02:45', 0, 'vn6dxyzme1g8ucbl3ikq0awt');
INSERT INTO `team_task_stages_template` VALUES (79, '产品计划', 'd85f1bvwpml2nhxe94zu7tyi', '2018-12-24 22:06:03', 0, '3atxfsv5rhz64pk8jl0enqd2');
INSERT INTO `team_task_stages_template` VALUES (80, '即将发布', 'd85f1bvwpml2nhxe94zu7tyi', '2018-12-24 22:06:09', 0, '1nucptea9b2vl7yfj8xgz4d6');
INSERT INTO `team_task_stages_template` VALUES (81, '测试', 'd85f1bvwpml2nhxe94zu7tyi', '2018-12-24 22:06:13', 0, 'pfidejaq2vn653h8zmsytrlb');
INSERT INTO `team_task_stages_template` VALUES (82, '准备发布', 'd85f1bvwpml2nhxe94zu7tyi', '2018-12-24 22:06:17', 0, 'uc1etmw4k5gys8jfpdbo7zrh');
INSERT INTO `team_task_stages_template` VALUES (83, '发布成功', 'd85f1bvwpml2nhxe94zu7tyi', '2018-12-24 22:06:23', 0, 'rmutqozd51shfp4w70n96iel');

-- ----------------------------
-- Table structure for team_task_tag
-- ----------------------------
DROP TABLE IF EXISTS `team_task_tag`;
CREATE TABLE `team_task_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `project_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签名',
  `color` enum('blue','red','orange','green','brown','purple') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'blue' COMMENT '颜色',
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务标签表' ROW_FORMAT = Dynamic;



-- ----------------------------
-- Table structure for team_task_to_tag
-- ----------------------------
DROP TABLE IF EXISTS `team_task_to_tag`;
CREATE TABLE `team_task_to_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `task_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `tag_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 210 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务标签映射表' ROW_FORMAT = Dynamic;



-- ----------------------------
-- Table structure for team_task_work_time
-- ----------------------------
DROP TABLE IF EXISTS `team_task_work_time`;
CREATE TABLE `team_task_work_time`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '任务ID',
  `member_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '成员id',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `begin_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `num` int(11) NULL DEFAULT 0 COMMENT '工时',
  `code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务工时表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for team_task_workflow
-- ----------------------------
DROP TABLE IF EXISTS `team_task_workflow`;
CREATE TABLE `team_task_workflow`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organization_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织id',
  `project_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '项目id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务工作流表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for team_task_workflow_rule
-- ----------------------------
DROP TABLE IF EXISTS `team_task_workflow_rule`;
CREATE TABLE `team_task_workflow_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `type` tinyint(1) NULL DEFAULT 0 COMMENT '规则类型，0：任务分组，1：人员，2：条件',
  `object_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对象id',
  `action` tinyint(1) NULL DEFAULT 0 COMMENT '场景。0：任何条件，1：被完成，2：被重做，3：设置执行人，4：截止时间，5：优先级',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `workflow_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '工作流id',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务工作流规则表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for team_user_token
-- ----------------------------
DROP TABLE IF EXISTS `team_user_token`;
CREATE TABLE `team_user_token`  (
  `token_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '令牌编号',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户编号',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录令牌',
  `login_time` int(10) UNSIGNED NOT NULL COMMENT '登录时间',
  `client_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端类型 android wap',
  `login_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'PC端登录令牌表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
