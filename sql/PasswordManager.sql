-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: PasswordManager
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept`
(
    `id`          bigint unsigned                                              NOT NULL AUTO_INCREMENT COMMENT '主键',
    `parent_id`   bigint                                                       NOT NULL COMMENT '上级部门ID。一级部门为0',
    `name`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门名称',
    `type`        tinyint                                                      NOT NULL COMMENT '类型。0：公司；1：部门；2：科室/小组',
    `area_id`     bigint                                                                DEFAULT NULL COMMENT '所在区域ID',
    `sort`        int                                                          NOT NULL DEFAULT '0' COMMENT '排序值。越小越靠前',
    `status`      tinyint                                                      NOT NULL DEFAULT '0' COMMENT '状态。0：正常；1：禁用',
    `update_time` timestamp                                                    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    `create_by`   bigint                                                                DEFAULT NULL COMMENT '创建人',
    `create_time` timestamp                                                    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = COMPACT COMMENT ='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_dept`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict`
(
    `id`     bigint                                                       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
    `code`   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典码',
    `value`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '字典值',
    `status` tinyint                                                      NOT NULL DEFAULT '0' COMMENT '状态。0：有效；1：无效',
    `sort`   int                                                          NOT NULL DEFAULT '0' COMMENT '排序值。越小越靠前',
    `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 21
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict`
    DISABLE KEYS */;
INSERT INTO `sys_dict`
VALUES (23, '海带教务', '20213007250', '3c41bbea415e77519ab4d2c7f30758cc', 0, 1, '教务系统'),
       (24, 'QQ', '1493182431', '7036a1f28365257ba96326421ac95eec', 0, 2, 'QQ'),
       (25, 'bilibili', '18876783540', 'f165722310e5babb3dbecb0ebfdc505f', 0, 3, 'B站'),
       (26, '爱奇艺', '2767705267', '7108fe61970ffc21c8909810ed8973a58d837338a553e1a4c2673273b625d4e88d1906bc44afa474c7f198b9ebb59254', 0, 4, '爱奇艺'),
       (27, '微信', '17771649252', '144039ba754bf3249be1a0f5d498345f', 0, 5, '');
/*!40000 ALTER TABLE `sys_dict`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_log`
(
    `id`             bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id`        bigint                                                        NOT NULL COMMENT '用户ID',
    `username`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '登录名称',
    `operation`      varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作功能',
    `forward_action` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作uri',
    `ip`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT 'IP',
    `browser`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT '0' COMMENT '浏览器',
    `os`             varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '系统',
    `time`           bigint                                                        NOT NULL DEFAULT '0' COMMENT '请求耗时。毫秒',
    `create_time`    timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 20
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log`
    DISABLE KEYS */;
INSERT INTO `sys_log`
VALUES (1, 1, 'admin', '登录', '/login', '127.0.0.1', 'Chrome 124.0.0.0', 'Windows', 47, '2024-05-18 12:35:40'),
       (2, 1, 'admin', '登录', '/login', '127.0.0.1', 'Chrome 124.0.0.0', 'Windows', 335, '2024-05-18 12:36:19'),
       (3, 1, 'admin', '登录', '/login', '127.0.0.1', 'Chrome 124.0.0.0', 'Windows', 305, '2024-05-18 12:38:38'),
       (4, 1, 'admin', '登录', '/login', '127.0.0.1', 'Chrome 124.0.0.0', 'Windows', 306, '2024-05-18 12:39:55'),
       (5, 1, 'admin', '登录', '/login', '127.0.0.1', 'Chrome 124.0.0.0', 'Windows', 303, '2024-05-18 12:43:48'),
       (6, 1, 'admin', '登录', '/login', '127.0.0.1', 'Chrome 124.0.0.0', 'Windows', 329, '2024-05-18 12:45:18'),
       (7, 1, 'admin', '登录', '/login', '127.0.0.1', 'Chrome 124.0.0.0', 'Windows', 305, '2024-05-18 12:50:38'),
       (8, 1, 'admin', '登录', '/login', '127.0.0.1', 'Chrome 124.0.0.0', 'Windows', 305, '2024-05-18 12:52:09'),
       (9, 1, 'admin', '登录', '/login', '127.0.0.1', 'Chrome 124.0.0.0', 'Windows', 303, '2024-05-18 12:53:16'),
       (10, 1, 'admin', '登录', '/login', '127.0.0.1', 'Chrome 124.0.0.0', 'Windows', 299, '2024-05-18 12:53:59'),
       (11, 1, 'admin', '登录', '/login', '127.0.0.1', 'Chrome 124.0.0.0', 'Windows', 303, '2024-05-18 12:55:11'),
       (12, 1, 'admin', '登录', '/login', '127.0.0.1', 'Chrome 124.0.0.0', 'Windows', 314, '2024-05-18 13:00:59'),
       (13, 1, 'admin', '登录', '/login', '127.0.0.1', 'Chrome 124.0.0.0', 'Windows', 298, '2024-05-18 13:02:42'),
       (14, 1, 'admin', '登录', '/login', '127.0.0.1', 'Chrome 124.0.0.0', 'Windows', 340, '2024-05-18 13:04:00'),
       (15, 1, 'admin', '登录', '/login', '127.0.0.1', 'Chrome 124.0.0.0', 'Windows', 306, '2024-05-18 13:09:22'),
       (16, 1, 'admin', '登录', '/login', '127.0.0.1', 'Chrome 124.0.0.0', 'Windows', 430, '2024-05-18 13:10:22'),
       (17, 1, 'admin', '登录', '/login', '127.0.0.1', 'Chrome 124.0.0.0', 'Windows', 472, '2024-05-18 13:10:51'),
       (18, 1, 'admin', '登录', '/login', '127.0.0.1', 'Chrome 124.0.0.0', 'Windows', 464, '2024-05-18 13:14:44'),
       (19, 1, 'admin', '登录', '/login', '127.0.0.1', 'Chrome 124.0.0.0', 'Windows', 451, '2024-05-18 13:19:05');
/*!40000 ALTER TABLE `sys_log`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu`
(
    `id`          bigint unsigned                                              NOT NULL AUTO_INCREMENT COMMENT '主键',
    `parent_id`   bigint                                                       NOT NULL COMMENT '父菜单ID。一级菜单为0',
    `name`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
    `url`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '菜单URL',
    `permission`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '授权标识。多个用逗号分隔，如：user:list,user:create',
    `type`        tinyint                                                               DEFAULT NULL COMMENT '类型。0：目录；1：菜单；2：按钮；3：导航菜单',
    `icon`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '菜单图标',
    `status`      tinyint                                                      NOT NULL DEFAULT '0' COMMENT '状态。0：正常；1：禁用',
    `sort`        int                                                          NOT NULL DEFAULT '0' COMMENT '排序值。越小越靠前',
    `create_by`   bigint                                                                DEFAULT NULL COMMENT '创建人',
    `create_time` timestamp                                                    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 40
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = COMPACT COMMENT ='菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu`
    DISABLE KEYS */;
INSERT INTO `sys_menu`
VALUES (1, 0, '系统管理', NULL, '', 0, 'fa fa-cogs', 0, 0, NULL, '2019-05-06 21:46:33'),
       (2, 1, '用户管理', 'sys/user/index', 'sys:user:index', 1, NULL, 0, 1, NULL, '2019-05-06 21:46:47'),
       (4, 1, '角色管理', 'sys/role/index', 'sys:role:index', 1, NULL, 0, 3, NULL, '2019-05-11 11:51:31'),
       (7, 0, '系统审计', NULL, '', 0, 'fa fa-industry', 0, 1, NULL, '2019-05-11 12:04:09'),
       (9, 7, '操作日志', 'sys/log/index', 'sys:log:index', 1, NULL, 0, 0, NULL, '2019-05-11 13:26:02'),
       (10, 2, '添加', NULL, 'sys:user:add', 2, NULL, 0, 0, NULL, '2019-05-07 21:25:46'),
       (11, 2, '删除', NULL, 'sys:user:del', 2, NULL, 0, 2, NULL, '2019-05-11 14:26:54'),
       (12, 2, '编辑', NULL, 'sys:user:edit', 2, NULL, 0, 1, NULL, '2019-05-11 14:28:06'),
       (13, 3, '添加', NULL, 'sys:menu:add', 2, NULL, 0, 0, NULL, '2019-05-11 14:28:59'),
       (14, 3, '编辑', NULL, 'sys:menu:edit', 2, NULL, 0, 1, NULL, '2019-05-11 14:29:35'),
       (15, 3, '删除', NULL, 'sys:menu:del', 2, NULL, 0, 2, NULL, '2019-05-11 14:29:55'),
       (16, 4, '添加', NULL, 'sys:role:add', 2, NULL, 0, 0, NULL, '2019-05-11 14:30:07'),
       (17, 4, '编辑', NULL, 'sys:role:edit', 2, NULL, 0, 1, NULL, '2019-05-11 14:30:28'),
       (18, 4, '删除', NULL, 'sys:role:del', 2, NULL, 0, 2, NULL, '2019-05-11 14:30:37'),
       (19, 4, '权限设置', NULL, 'sys:role:permission', 2, NULL, 0, 3, NULL, '2019-05-11 14:30:37'),
       (20, 5, '添加', NULL, 'sys:dept:add', 2, NULL, 0, 0, NULL, '2019-05-11 14:30:47'),
       (21, 5, '编辑', NULL, 'sys:dept:edit', 2, NULL, 0, 1, NULL, '2019-05-11 14:30:58'),
       (22, 5, '删除', NULL, 'sys:dept:del', 2, NULL, 0, 2, NULL, '2019-05-11 14:31:13'),
       (23, 2, '重置密码', NULL, 'sys:user:reset', 2, NULL, 0, 3, NULL, '2019-05-12 18:01:10'),
       (26, 25, '生成管理', 'generator/table/index', 'gen:table:index', 1, NULL, 0, 0, NULL, '2019-06-10 22:50:09'),
       (27, 1, '密码管理', 'sys/dict/index', 'sys:dict:index', 1, NULL, 0, 0, NULL, '2019-08-12 09:47:31'),
       (28, 27, '添加', NULL, 'sys:dict:add', 2, NULL, 0, 0, NULL, '2019-08-12 09:48:03'),
       (29, 27, '编辑', NULL, 'sys:dict:edit', 2, NULL, 0, 0, NULL, '2019-08-12 09:48:20'),
       (30, 27, '删除', NULL, 'sys:dict:del', 2, NULL, 0, 0, NULL, '2019-08-12 09:48:45'),
       (32, 31, '添加', NULL, 'schedule:job:add', 2, NULL, 0, 0, NULL, '2019-08-17 18:14:20'),
       (33, 31, '编辑', NULL, 'schedule:job:edit', 2, NULL, 0, 0, NULL, '2019-08-17 18:14:36'),
       (34, 31, '删除', NULL, 'schedule:job:del', 2, NULL, 0, 0, NULL, '2019-08-17 18:14:55'),
       (35, 31, '暂停', NULL, 'schedule:job:pause', 2, NULL, 0, 0, NULL, '2019-08-17 18:16:10'),
       (36, 31, '恢复', NULL, 'schedule:job:resume', 2, NULL, 0, 0, NULL, '2019-08-17 18:16:28'),
       (38, 37, '富文本', 'sys/component/ueditor/index', 'component:ueditor:index', 1, NULL, 0, 1, NULL,
        '2020-03-31 11:17:55'),
       (39, 37, '图标库', 'sys/component/icons/index', 'component:icons:index', 1, NULL, 0, 0, NULL,
        '2020-03-31 11:22:09');
/*!40000 ALTER TABLE `sys_menu`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role`
(
    `id`          bigint unsigned                                               NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
    `parent_id`   bigint                                                        NOT NULL COMMENT '父级ID',
    `type`        tinyint                                                       NOT NULL COMMENT '类型。0：分类；1：角色',
    `remarks`     varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '备注',
    `create_by`   bigint                                                                 DEFAULT NULL COMMENT '创建人',
    `update_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    `create_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = COMPACT COMMENT ='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role`
    DISABLE KEYS */;
INSERT INTO `sys_role`
VALUES (3, '系统管理员', 1, 1, NULL, NULL, '2019-05-19 22:33:12', '2019-05-19 22:33:12'),
       (4, '项目组长', 2, 1, NULL, NULL, '2019-05-19 22:33:32', '2019-05-19 22:33:32'),
       (6, '管理员', 0, 1, '', NULL, '2024-05-18 12:46:32', '2024-05-18 12:46:32'),
       (7, '用户', 0, 1, '', NULL, '2024-05-18 12:48:23', '2024-05-18 12:48:23');
/*!40000 ALTER TABLE `sys_role`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu`
(
    `id`      bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `role_id` bigint          NOT NULL COMMENT '角色ID',
    `menu_id` bigint          NOT NULL COMMENT '菜单ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 88
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = COMPACT COMMENT ='角色菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu`
    DISABLE KEYS */;
INSERT INTO `sys_role_menu`
VALUES (1, 3, 7),
       (2, 3, 9),
       (3, 3, 1),
       (4, 3, 2),
       (5, 3, 10),
       (6, 3, 12),
       (7, 3, 11),
       (8, 3, 23),
       (10, 3, 20),
       (11, 3, 21),
       (12, 3, 22),
       (14, 3, 13),
       (15, 3, 14),
       (16, 3, 15),
       (17, 3, 4),
       (18, 3, 16),
       (19, 3, 17),
       (20, 3, 18),
       (21, 3, 19),
       (24, 3, 26),
       (34, 3, 27),
       (35, 3, 30),
       (36, 3, 28),
       (37, 3, 29),
       (39, 3, 32),
       (40, 3, 33),
       (41, 3, 34),
       (42, 3, 35),
       (43, 3, 36),
       (44, 4, 7),
       (45, 4, 9),
       (47, 3, 39),
       (48, 3, 38),
       (49, 6, 1),
       (50, 6, 2),
       (51, 6, 10),
       (52, 6, 12),
       (53, 6, 11),
       (54, 6, 23),
       (56, 6, 20),
       (57, 6, 21),
       (58, 6, 22),
       (60, 6, 13),
       (61, 6, 14),
       (62, 6, 15),
       (63, 6, 4),
       (64, 6, 16),
       (65, 6, 17),
       (66, 6, 18),
       (67, 6, 19),
       (68, 6, 27),
       (69, 6, 30),
       (70, 6, 29),
       (71, 6, 28),
       (72, 6, 7),
       (73, 6, 9),
       (74, 6, 39),
       (75, 6, 26),
       (76, 6, 38),
       (77, 6, 36),
       (78, 6, 35),
       (79, 6, 34),
       (80, 6, 33),
       (81, 6, 32),
       (83, 7, 1),
       (84, 7, 27),
       (85, 7, 30),
       (86, 7, 29),
       (87, 7, 28);
/*!40000 ALTER TABLE `sys_role_menu`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user`
(
    `id`          bigint unsigned                                              NOT NULL AUTO_INCREMENT COMMENT '主键',
    `dept_id`     bigint                                                       NOT NULL COMMENT '归属部门',
    `username`    varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录名',
    `password`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
    `realname`    varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
    `sex`         tinyint                                                      NOT NULL DEFAULT '0' COMMENT '性别。0：未知；1：男；2：女',
    `phone`       varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '手机号码',
    `tel`         varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '固定电话',
    `email`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '邮箱',
    `avatar`      varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '用户头像',
    `job_title`   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '职务名称',
    `status`      tinyint                                                      NOT NULL DEFAULT '0' COMMENT '用户状态。0：正常；1：禁用',
    `sort`        int                                                          NOT NULL DEFAULT '0' COMMENT '排序。值越小越靠前',
    `del_flag`    int                                                          NOT NULL DEFAULT '0' COMMENT '删除标识。0：未删除；1：已删除',
    `create_by`   bigint                                                                DEFAULT NULL COMMENT '创建人',
    `update_time` timestamp                                                    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `create_time` timestamp                                                    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = COMPACT COMMENT ='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user`
    DISABLE KEYS */;
INSERT INTO `sys_user`
VALUES (1, 0, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员', 1, '17771649252', '123', '1493182431@qq.com',
        'static/image/avatar/tz.jpeg', '超级管理员', 0, 0, 0, NULL, '2024-05-19 01:26:13', '2019-04-30 22:44:17'),
       (4, 0, 'test', 'e10adc3949ba59abbe56e057f20f883e', 'test', 0, '', '', '', NULL, '', 0, 1, 0, NULL,
        '2024-05-19 01:26:21', '2024-05-18 12:51:02');
/*!40000 ALTER TABLE `sys_user`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id`     bigint                   DEFAULT NULL COMMENT '用户ID',
    `role_id`     bigint                   DEFAULT NULL COMMENT '角色ID',
    `create_time` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = COMPACT COMMENT ='用户与角色对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role`
    DISABLE KEYS */;
INSERT INTO `sys_user_role`
VALUES (2, 2, 5, '2019-05-10 21:25:08'),
       (3, 3, 4, '2019-05-10 21:25:08'),
       (7, 1, 6, '2024-05-18 12:47:33'),
       (8, 4, 7, '2024-05-18 12:51:02');
/*!40000 ALTER TABLE `sys_user_role`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users`
(
    `id`                 int          NOT NULL AUTO_INCREMENT,
    `website`            varchar(100) NOT NULL,
    `username`           varchar(50)  NOT NULL,
    `password`           varchar(255) NOT NULL,
    `created_time`       timestamp    NULL DEFAULT CURRENT_TIMESTAMP,
    `last_modified_time` timestamp    NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `users`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2024-05-19  2:18:21
