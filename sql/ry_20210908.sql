/*
 Navicat Premium Data Transfer

 Source Server         : localhost_mysql_3306
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : localhost:3306
 Source Schema         : rice-point

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 29/12/2022 21:50:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'rice_canteen', '食堂表', NULL, NULL, 'Canteen', 'crud', 'com.rice.dish', 'dish', 'canteen', '食堂', 'panghai', '0', '/', NULL, 'admin', '2021-10-23 21:49:46', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (2, 'rice_canteen_dish_type', '食堂菜品类型表', NULL, NULL, 'CanteenDishType', 'crud', 'com.rice.dish', 'dish', 'type', '食堂菜品类型', 'panghai', '0', '/', NULL, 'admin', '2021-10-23 21:49:48', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'rice_coupon', '优惠卷表', NULL, NULL, 'Coupon', 'crud', 'com.rice.dish', 'dish', 'coupon', '优惠卷', 'panghai', '0', '/', NULL, 'admin', '2021-10-23 21:49:48', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (5, 'rice_dish_order', '菜品订单表', NULL, NULL, 'DishOrder', 'crud', 'com.rice.order', 'order', 'order', '菜品订单', 'panghai', '0', '/', '{\"parentMenuId\":2002}', 'admin', '2021-10-23 21:49:50', '', '2021-11-09 10:44:55', NULL);
INSERT INTO `gen_table` VALUES (6, 'rice_dish_type', '菜品类型表', NULL, NULL, 'DishType', 'crud', 'com.rice.dish', 'dish', 'type', '菜品类型', 'panghai', '0', '/', NULL, 'admin', '2021-10-23 21:49:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (7, 'rice_gift', '礼品表', NULL, NULL, 'Gift', 'crud', 'com.rice.dish', 'dish', 'gift', '礼品', 'panghai', '0', '/', NULL, 'admin', '2021-10-23 21:49:51', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (8, 'rice_ticket', '投票表', NULL, NULL, 'Ticket', 'crud', 'com.ruoyi.ticket', 'ticket', 'info', '投票信息', 'panghai', '0', '/', '{}', 'admin', '2021-10-23 21:49:52', '', '2021-10-23 23:10:51', NULL);
INSERT INTO `gen_table` VALUES (9, 'rice_top', '榜单表', NULL, NULL, 'Top', 'crud', 'com.rice.dish', 'dish', 'top', '榜单', 'panghai', '0', '/', NULL, 'admin', '2021-10-23 21:49:52', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (11, 'rice_canteen', '食堂表', NULL, NULL, 'Canteen', 'crud', 'com.rice.dish', 'dish', 'canteen', '食堂', 'panghai', '0', '/', NULL, 'admin', '2021-10-23 21:49:53', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (12, 'rice_canteen_dish_type', '食堂菜品类型表', NULL, NULL, 'CanteenDishType', 'crud', 'com.rice.dish', 'dish', 'type', '食堂菜品类型', 'panghai', '0', '/', NULL, 'admin', '2021-10-23 21:49:55', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (13, 'rice_coupon', '优惠卷表', NULL, NULL, 'Coupon', 'crud', 'com.rice.dish', 'dish', 'coupon', '优惠卷', 'panghai', '0', '/', NULL, 'admin', '2021-10-23 21:49:55', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (14, 'rice_dish', '菜品表', '', '', 'Dish', 'crud', 'com.rice.dish', 'dish', 'dish', '菜品', 'panghai', '0', '/', '{}', 'admin', '2021-10-23 21:49:55', '', '2021-10-23 22:53:37', NULL);
INSERT INTO `gen_table` VALUES (15, 'rice_dish_order', '菜品订单表', NULL, NULL, 'DishOrder', 'crud', 'com.rice.dish', 'dish', 'dishOrder', '菜品订单', 'panghai', '0', '/', '{}', 'admin', '2021-10-23 21:49:57', '', '2021-11-09 10:45:21', NULL);
INSERT INTO `gen_table` VALUES (16, 'rice_dish_type', '菜品类型表', NULL, NULL, 'DishType', 'crud', 'com.rice.dish', 'dish', 'type', '菜品类型', 'panghai', '0', '/', NULL, 'admin', '2021-10-23 21:49:57', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (17, 'rice_gift', '礼品表', NULL, NULL, 'Gift', 'crud', 'com.rice.dish', 'dish', 'gift', '礼品', 'panghai', '0', '/', NULL, 'admin', '2021-10-23 21:49:58', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (19, 'rice_top', '榜单表', NULL, NULL, 'Top', 'crud', 'com.rice.dish', 'dish', 'top', '榜单', 'panghai', '0', '/', NULL, 'admin', '2021-10-23 21:49:59', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (21, 'rice_android_user', '安卓用户表', NULL, NULL, 'AndroidUser', 'crud', 'com.ruoyi.android', 'android', 'user', '安卓用户操作', 'panghai', '0', '/', '{\"parentMenuId\":\"1\"}', 'admin', '2021-11-03 16:38:03', '', '2021-11-03 16:48:22', NULL);
INSERT INTO `gen_table` VALUES (22, 'rice_order', '订单表', NULL, NULL, 'Order', 'crud', 'com.ruoyi.order', 'order', 'historyOrder', '历史订单', 'panghai', '0', '/', '{\"parentMenuId\":\"2002\"}', 'admin', '2021-11-04 11:08:01', '', '2021-11-07 17:05:27', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 159 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'canteen_id', '食堂id', 'bigint(20)', 'Long', 'canteenId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-23 21:49:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (2, '1', 'canteen_name', '食堂名称', 'varchar(30)', 'String', 'canteenName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-10-23 21:49:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (3, '1', 'location', '详细地址', 'varchar(255)', 'String', 'location', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-10-23 21:49:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (4, '1', 'tude', '经纬度', 'varchar(100)', 'String', 'tude', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-10-23 21:49:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (5, '1', 'canteen_url', '食堂图片', 'varchar(255)', 'String', 'canteenUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-10-23 21:49:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (6, '1', 'average', '人均消费', 'decimal(10,2)', 'BigDecimal', 'average', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-10-23 21:49:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (7, '1', 'leader', '负责人', 'varchar(20)', 'String', 'leader', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-10-23 21:49:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (8, '1', 'phone', '联系电话', 'varchar(11)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-10-23 21:49:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, '1', 'email', '邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-10-23 21:49:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, '1', 'status', '食堂状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 10, 'admin', '2021-10-23 21:49:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, '1', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2021-10-23 21:49:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, '1', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2021-10-23 21:49:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2021-10-23 21:49:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, '1', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2021-10-23 21:49:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2021-10-23 21:49:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, '2', 'type_id', '菜品类型id', 'bigint(20)', 'Long', 'typeId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-23 21:49:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, '2', 'canteen_id', '食堂id', 'bigint(20)', 'Long', 'canteenId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2021-10-23 21:49:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, '3', 'coupon_id', '优惠卷id', 'bigint(20)', 'Long', 'couponId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-23 21:49:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, '3', 'coupon_type', '优惠卷类型', 'varchar(30)', 'String', 'couponType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2021-10-23 21:49:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, '3', 'value', '满减', 'double', 'Long', 'value', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-10-23 21:49:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, '5', 'order_id', '订单id', 'bigint(20)', 'Long', 'orderId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-23 21:49:50', '', '2021-11-09 10:44:55');
INSERT INTO `gen_table_column` VALUES (34, '5', 'dish_id', '菜品id', 'bigint(20)', 'Long', 'dishId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2021-10-23 21:49:50', '', '2021-11-09 10:44:55');
INSERT INTO `gen_table_column` VALUES (35, '5', 'number', '菜品数量', 'int(11)', 'Long', 'number', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2021-10-23 21:49:50', '', '2021-11-09 10:44:56');
INSERT INTO `gen_table_column` VALUES (36, '6', 'type_id', '菜品类型id', 'bigint(20)', 'Long', 'typeId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-23 21:49:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, '6', 'type_name', '类型名称', 'varchar(30)', 'String', 'typeName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-10-23 21:49:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, '6', 'status', '数据状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 3, 'admin', '2021-10-23 21:49:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, '6', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2021-10-23 21:49:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, '6', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2021-10-23 21:49:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2021-10-23 21:49:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, '6', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2021-10-23 21:49:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, '6', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2021-10-23 21:49:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, '7', 'gift_id', '礼品id', 'bigint(20)', 'Long', 'giftId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-23 21:49:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, '7', 'gift_name', '礼品名称', 'varchar(255)', 'String', 'giftName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-10-23 21:49:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, '7', 'point', '礼品所需积分', 'int(11)', 'Long', 'point', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-10-23 21:49:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (47, '7', 'status', '数据状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2021-10-23 21:49:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (48, '7', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2021-10-23 21:49:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (49, '7', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2021-10-23 21:49:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (50, '7', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2021-10-23 21:49:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (51, '7', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2021-10-23 21:49:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (52, '7', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-10-23 21:49:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (53, '8', 'ticket_id', '投票id', 'bigint(20)', 'Long', 'ticketId', '1', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-23 21:49:52', '', '2021-10-23 23:10:51');
INSERT INTO `gen_table_column` VALUES (54, '8', 'dish_id', '菜品id', 'bigint(20)', 'Long', 'dishId', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 2, 'admin', '2021-10-23 21:49:52', '', '2021-10-23 23:10:51');
INSERT INTO `gen_table_column` VALUES (55, '8', 'ticket_number', '票数', 'int(11)', 'Integer', 'ticketNumber', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2021-10-23 21:49:52', '', '2021-10-23 23:10:51');
INSERT INTO `gen_table_column` VALUES (56, '9', 'top_id', '榜单id', 'bigint(20)', 'Long', 'topId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-23 21:49:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (57, '9', 'dish_id', '菜品id', 'bigint(20)', 'Long', 'dishId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-10-23 21:49:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, '9', 'ticket_number', '票数', 'int(11)', 'Long', 'ticketNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-10-23 21:49:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (59, '9', 'period', '期数', 'int(11)', 'Long', 'period', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-10-23 21:49:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (60, '9', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2021-10-23 21:49:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (64, '11', 'canteen_id', '食堂id', 'bigint(20)', 'Long', 'canteenId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-23 21:49:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (66, '11', 'canteen_name', '食堂名称', 'varchar(30)', 'String', 'canteenName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-10-23 21:49:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (68, '11', 'location', '详细地址', 'varchar(255)', 'String', 'location', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-10-23 21:49:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (70, '11', 'tude', '经纬度', 'varchar(100)', 'String', 'tude', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-10-23 21:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (71, '11', 'canteen_url', '食堂图片', 'varchar(255)', 'String', 'canteenUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-10-23 21:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (72, '11', 'average', '人均消费', 'decimal(10,2)', 'BigDecimal', 'average', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-10-23 21:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (73, '11', 'leader', '负责人', 'varchar(20)', 'String', 'leader', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-10-23 21:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (74, '11', 'phone', '联系电话', 'varchar(11)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-10-23 21:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (75, '11', 'email', '邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-10-23 21:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (76, '11', 'status', '食堂状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 10, 'admin', '2021-10-23 21:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (77, '11', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2021-10-23 21:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (78, '11', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2021-10-23 21:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (79, '11', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2021-10-23 21:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (80, '11', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2021-10-23 21:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (81, '11', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2021-10-23 21:49:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (82, '12', 'type_id', '菜品类型id', 'bigint(20)', 'Long', 'typeId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-23 21:49:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (83, '12', 'canteen_id', '食堂id', 'bigint(20)', 'Long', 'canteenId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2021-10-23 21:49:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (84, '13', 'coupon_id', '优惠卷id', 'bigint(20)', 'Long', 'couponId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-23 21:49:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (85, '13', 'coupon_type', '优惠卷类型', 'varchar(30)', 'String', 'couponType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2021-10-23 21:49:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (86, '13', 'value', '满减', 'double', 'Long', 'value', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-10-23 21:49:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (87, '14', 'dish_id', '菜品id', 'int(11)', 'Long', 'dishId', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-23 21:49:56', '', '2021-10-23 22:53:37');
INSERT INTO `gen_table_column` VALUES (88, '14', 'dishes_name', '菜品名称', 'varchar(50)', 'String', 'dishesName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-10-23 21:49:56', '', '2021-10-23 22:53:37');
INSERT INTO `gen_table_column` VALUES (89, '14', 'dishes_type', '菜品类型', 'int(11)', 'Long', 'dishesType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2021-10-23 21:49:56', '', '2021-10-23 22:53:37');
INSERT INTO `gen_table_column` VALUES (90, '14', 'url', '菜品图片', 'varchar(255)', 'String', 'url', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'imageUpload', '', 4, 'admin', '2021-10-23 21:49:56', '', '2021-10-23 22:53:37');
INSERT INTO `gen_table_column` VALUES (91, '14', 'price', '菜品价格', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-10-23 21:49:56', '', '2021-10-23 22:53:37');
INSERT INTO `gen_table_column` VALUES (92, '14', 'onsale', '月售量', 'int(11)', 'Long', 'onsale', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 6, 'admin', '2021-10-23 21:49:56', '', '2021-10-23 22:53:37');
INSERT INTO `gen_table_column` VALUES (93, '14', 'status', '菜品状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'radio', 'sys_status', 7, 'admin', '2021-10-23 21:49:56', '', '2021-10-23 22:53:37');
INSERT INTO `gen_table_column` VALUES (94, '14', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', 'sys_del_flag', 8, 'admin', '2021-10-23 21:49:56', '', '2021-10-23 22:53:37');
INSERT INTO `gen_table_column` VALUES (95, '14', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2021-10-23 21:49:56', '', '2021-10-23 22:53:38');
INSERT INTO `gen_table_column` VALUES (96, '14', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2021-10-23 21:49:56', '', '2021-10-23 22:53:38');
INSERT INTO `gen_table_column` VALUES (97, '14', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2021-10-23 21:49:57', '', '2021-10-23 22:53:38');
INSERT INTO `gen_table_column` VALUES (98, '14', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2021-10-23 21:49:57', '', '2021-10-23 22:53:38');
INSERT INTO `gen_table_column` VALUES (99, '15', 'order_id', '订单id', 'bigint(20)', 'Long', 'orderId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-23 21:49:57', '', '2021-11-09 10:45:21');
INSERT INTO `gen_table_column` VALUES (100, '15', 'dish_id', '菜品id', 'bigint(20)', 'Long', 'dishId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2021-10-23 21:49:57', '', '2021-11-09 10:45:21');
INSERT INTO `gen_table_column` VALUES (101, '15', 'number', '菜品数量', 'int(11)', 'Long', 'number', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-10-23 21:49:57', '', '2021-11-09 10:45:21');
INSERT INTO `gen_table_column` VALUES (102, '16', 'type_id', '菜品类型id', 'bigint(20)', 'Long', 'typeId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-23 21:49:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (103, '16', 'type_name', '类型名称', 'varchar(30)', 'String', 'typeName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-10-23 21:49:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (104, '16', 'status', '数据状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 3, 'admin', '2021-10-23 21:49:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (105, '16', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2021-10-23 21:49:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (106, '16', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2021-10-23 21:49:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (107, '16', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2021-10-23 21:49:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (108, '16', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2021-10-23 21:49:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (109, '16', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2021-10-23 21:49:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (110, '17', 'gift_id', '礼品id', 'bigint(20)', 'Long', 'giftId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-23 21:49:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (111, '17', 'gift_name', '礼品名称', 'varchar(255)', 'String', 'giftName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-10-23 21:49:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (112, '17', 'point', '礼品所需积分', 'int(11)', 'Long', 'point', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-10-23 21:49:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (113, '17', 'status', '数据状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2021-10-23 21:49:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (114, '17', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2021-10-23 21:49:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (115, '17', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2021-10-23 21:49:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (116, '17', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2021-10-23 21:49:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (117, '17', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2021-10-23 21:49:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (118, '17', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-10-23 21:49:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (122, '19', 'top_id', '榜单id', 'bigint(20)', 'Long', 'topId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-23 21:50:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (123, '19', 'dish_id', '菜品id', 'bigint(20)', 'Long', 'dishId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-10-23 21:50:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (124, '19', 'ticket_number', '票数', 'int(11)', 'Long', 'ticketNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-10-23 21:50:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (125, '19', 'period', '期数', 'int(11)', 'Long', 'period', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-10-23 21:50:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (126, '19', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2021-10-23 21:50:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (133, '8', 'time', '第几期', 'int(11)', 'Integer', 'time', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, '', '2021-10-23 23:09:11', '', '2021-10-23 23:10:52');
INSERT INTO `gen_table_column` VALUES (134, '8', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, '', '2021-10-23 23:09:11', '', '2021-10-23 23:10:52');
INSERT INTO `gen_table_column` VALUES (135, '21', 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-11-03 16:38:04', '', '2021-11-03 16:48:22');
INSERT INTO `gen_table_column` VALUES (136, '21', 'user_name', '用户账号', 'varchar(30)', 'String', 'userName', '0', '0', '1', '1', NULL, NULL, NULL, 'LIKE', 'input', '', 2, 'admin', '2021-11-03 16:38:04', '', '2021-11-03 16:48:22');
INSERT INTO `gen_table_column` VALUES (137, '21', 'nick_name', '用户昵称', 'varchar(30)', 'String', 'nickName', '0', '0', '1', '1', NULL, '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-11-03 16:38:04', '', '2021-11-03 16:48:23');
INSERT INTO `gen_table_column` VALUES (138, '21', 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2021-11-03 16:38:04', '', '2021-11-03 16:48:23');
INSERT INTO `gen_table_column` VALUES (139, '21', 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2021-11-03 16:38:04', '', '2021-11-03 16:48:23');
INSERT INTO `gen_table_column` VALUES (140, '21', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'select', '', 6, 'admin', '2021-11-03 16:38:04', '', '2021-11-03 16:48:23');
INSERT INTO `gen_table_column` VALUES (141, '21', 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-11-03 16:38:04', '', '2021-11-03 16:48:23');
INSERT INTO `gen_table_column` VALUES (142, '21', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2021-11-03 16:38:04', '', '2021-11-03 16:48:23');
INSERT INTO `gen_table_column` VALUES (143, '21', 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'radio', 'sys_status', 9, 'admin', '2021-11-03 16:38:04', '', '2021-11-03 16:48:23');
INSERT INTO `gen_table_column` VALUES (144, '21', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', 'sys_del_flag', 10, 'admin', '2021-11-03 16:38:04', '', '2021-11-03 16:48:23');
INSERT INTO `gen_table_column` VALUES (145, '21', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2021-11-03 16:38:05', '', '2021-11-03 16:48:23');
INSERT INTO `gen_table_column` VALUES (146, '21', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2021-11-03 16:38:05', '', '2021-11-03 16:48:23');
INSERT INTO `gen_table_column` VALUES (147, '21', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2021-11-03 16:38:05', '', '2021-11-03 16:48:23');
INSERT INTO `gen_table_column` VALUES (148, '21', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2021-11-03 16:38:05', '', '2021-11-03 16:48:24');
INSERT INTO `gen_table_column` VALUES (149, '21', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 15, 'admin', '2021-11-03 16:38:05', '', '2021-11-03 16:48:24');
INSERT INTO `gen_table_column` VALUES (150, '22', 'order_id', '订单id', 'bigint(20)', 'Long', 'orderId', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-11-04 11:08:01', '', '2021-11-07 17:05:28');
INSERT INTO `gen_table_column` VALUES (151, '22', 'order_code', '取餐号码', 'varchar(16)', 'String', 'orderCode', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 2, 'admin', '2021-11-04 11:08:02', '', '2021-11-07 17:05:28');
INSERT INTO `gen_table_column` VALUES (152, '22', 'canteen_id', '就餐食堂id', 'bigint(20)', 'Long', 'canteenId', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2021-11-04 11:08:02', '', '2021-11-07 17:05:28');
INSERT INTO `gen_table_column` VALUES (153, '22', 'order_price', '订单价格合计', 'decimal(10,2)', 'BigDecimal', 'orderPrice', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2021-11-04 11:08:02', '', '2021-11-07 17:05:28');
INSERT INTO `gen_table_column` VALUES (154, '22', 'status', '订单状态（0待支付 1已支付 2已取消）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'order_status', 5, 'admin', '2021-11-04 11:08:02', '', '2021-11-07 17:05:28');
INSERT INTO `gen_table_column` VALUES (155, '22', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2021-11-04 11:08:02', '', '2021-11-07 17:05:28');
INSERT INTO `gen_table_column` VALUES (156, '22', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2021-11-04 11:08:02', '', '2021-11-07 17:05:28');
INSERT INTO `gen_table_column` VALUES (157, '22', 'meal_number', '取餐号', 'int(11)', 'Long', 'mealNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, '', '2021-11-07 16:59:55', '', '2021-11-07 17:05:28');
INSERT INTO `gen_table_column` VALUES (158, '22', 'error_reason', '处理失败原因', 'varchar(255)', 'String', 'errorReason', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, '', '2021-11-07 16:59:55', '', '2021-11-07 17:05:28');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME100', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME101', 'SYSTEM', '0 0 0 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME102', 'SYSTEM', '0 0 0 1 * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME104', 'SYSTEM', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/40 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME100', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017CFAD5E3F078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000064740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME101', 'SYSTEM', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D14CC34F878707400007070707400013174000B3020302030202A202A203F7400197469636B65745461736B2E726573657455736572566F74657374000653595354454D7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000065740021E9878DE7BDAEE794A8E688B7E6AF8FE697A5E68A95E7A5A8E99990E588B6E695B074000133740001307800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME102', 'SYSTEM', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D14CE5BC078707400007070707400013174000B30203020302031202A203F7400197469636B65745461736B2E726573657444697368566F74657374000653595354454D7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000006674001BE8BF9BE585A5E4B88BE4B880E69C9FE88F9CE59381E68A95E7A5A874000133740001307800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME104', 'SYSTEM', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017DA5D16F9078707400007070707400013174000E3020302F3330202A202A202A203F7400186F726465725461736B2E726573657455736572566F74657374000653595354454D7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000068740018E5AE9AE697B6E5A484E79086E8B685E697B6E8AEA2E58D9574000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017CAF1121A078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017CAF1121A078707400007070707400013174000E302F3430202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-0ISA1SK1672320486457', 1672321839384, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME100', 'DEFAULT', 'TASK_CLASS_NAME100', 'DEFAULT', NULL, 1672321650000, -1, 5, 'PAUSED', 'CRON', 1672321647000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME101', 'SYSTEM', 'TASK_CLASS_NAME101', 'SYSTEM', NULL, 1672329600000, -1, 5, 'WAITING', 'CRON', 1672321647000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME102', 'SYSTEM', 'TASK_CLASS_NAME102', 'SYSTEM', NULL, 1672502400000, -1, 5, 'WAITING', 'CRON', 1672321647000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME104', 'SYSTEM', 'TASK_CLASS_NAME104', 'SYSTEM', NULL, 1672322400000, -1, 5, 'PAUSED', 'CRON', 1672321647000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1672321650000, -1, 5, 'PAUSED', 'CRON', 1672321647000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1672321660000, -1, 5, 'PAUSED', 'CRON', 1672321647000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for rice_canteen
-- ----------------------------
DROP TABLE IF EXISTS `rice_canteen`;
CREATE TABLE `rice_canteen`  (
  `canteen_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '食堂id',
  `canteen_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '食堂名称',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `tude` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经纬度',
  `canteen_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '食堂图片',
  `average` decimal(10, 2) NULL DEFAULT NULL COMMENT '人均消费',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '食堂状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`canteen_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '食堂表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rice_canteen
-- ----------------------------
INSERT INTO `rice_canteen` VALUES (1, '八坡食堂', '南宁市西乡塘区相思湖餐厅', '108.23947,22.840747', '/profile/upload/2021/11/21/006cdc76-131e-4ef1-94c6-f6b1d090afab.jpg', 11.00, '张三', '13788395907', '1928491@qq.com', '0', '0', '', '2021-10-05 12:30:10', '', '2022-12-29 05:55:27');
INSERT INTO `rice_canteen` VALUES (2, '四坡食堂', '南宁市西乡塘区四坡食堂', '108.232734,22.842943', '/profile/upload/2021/12/06/473f5010-3ef7-4d56-8cf4-1826f4844004.jpg', 12.00, '李四', '13883123291', '214879190@qq.com', '0', '0', '', '2021-10-05 12:34:00', '', '2021-12-06 22:57:04');
INSERT INTO `rice_canteen` VALUES (3, '五坡食堂', '南宁市西乡塘区大学东路105号广西职业师范学院', '108.23902,22.83092', '/profile/upload/2021/12/05/150ccf55-c215-42c0-a8fa-c7c6d5ddbb13.jpg', 11.00, '王五', '13788412859', '741892@email.cn', '0', '0', '', '2021-10-06 15:52:37', '', '2022-07-27 16:26:31');
INSERT INTO `rice_canteen` VALUES (27, '教职工食堂', '南宁市西乡塘区广场东路广西民族大学相思湖校区', '108.235913,22.84449', '/profile/upload/2021/12/10/54cc1822-f051-4c4b-9fe7-c1e68c85ccbe.jpg', NULL, '何静', NULL, NULL, '0', '0', '', '2021-11-26 10:08:45', '', '2021-12-10 11:40:50');

-- ----------------------------
-- Table structure for rice_canteen_dish
-- ----------------------------
DROP TABLE IF EXISTS `rice_canteen_dish`;
CREATE TABLE `rice_canteen_dish`  (
  `canteen_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '食堂id',
  `dish_id` int(11) NOT NULL COMMENT '菜品id',
  PRIMARY KEY (`canteen_id`, `dish_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '食堂菜品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rice_canteen_dish
-- ----------------------------
INSERT INTO `rice_canteen_dish` VALUES (1, 1);
INSERT INTO `rice_canteen_dish` VALUES (1, 4);
INSERT INTO `rice_canteen_dish` VALUES (1, 5);
INSERT INTO `rice_canteen_dish` VALUES (1, 6);
INSERT INTO `rice_canteen_dish` VALUES (1, 8);
INSERT INTO `rice_canteen_dish` VALUES (1, 10);
INSERT INTO `rice_canteen_dish` VALUES (1, 11);
INSERT INTO `rice_canteen_dish` VALUES (1, 12);
INSERT INTO `rice_canteen_dish` VALUES (1, 13);
INSERT INTO `rice_canteen_dish` VALUES (1, 14);
INSERT INTO `rice_canteen_dish` VALUES (1, 15);
INSERT INTO `rice_canteen_dish` VALUES (1, 16);
INSERT INTO `rice_canteen_dish` VALUES (1, 17);
INSERT INTO `rice_canteen_dish` VALUES (1, 18);
INSERT INTO `rice_canteen_dish` VALUES (1, 19);
INSERT INTO `rice_canteen_dish` VALUES (1, 20);
INSERT INTO `rice_canteen_dish` VALUES (1, 21);
INSERT INTO `rice_canteen_dish` VALUES (1, 22);
INSERT INTO `rice_canteen_dish` VALUES (1, 23);
INSERT INTO `rice_canteen_dish` VALUES (1, 24);
INSERT INTO `rice_canteen_dish` VALUES (1, 25);
INSERT INTO `rice_canteen_dish` VALUES (1, 26);
INSERT INTO `rice_canteen_dish` VALUES (1, 27);
INSERT INTO `rice_canteen_dish` VALUES (1, 28);
INSERT INTO `rice_canteen_dish` VALUES (1, 30);
INSERT INTO `rice_canteen_dish` VALUES (1, 31);
INSERT INTO `rice_canteen_dish` VALUES (1, 32);
INSERT INTO `rice_canteen_dish` VALUES (1, 34);
INSERT INTO `rice_canteen_dish` VALUES (1, 35);
INSERT INTO `rice_canteen_dish` VALUES (1, 36);
INSERT INTO `rice_canteen_dish` VALUES (1, 37);
INSERT INTO `rice_canteen_dish` VALUES (1, 38);
INSERT INTO `rice_canteen_dish` VALUES (1, 39);
INSERT INTO `rice_canteen_dish` VALUES (1, 40);
INSERT INTO `rice_canteen_dish` VALUES (1, 41);
INSERT INTO `rice_canteen_dish` VALUES (1, 42);
INSERT INTO `rice_canteen_dish` VALUES (1, 43);
INSERT INTO `rice_canteen_dish` VALUES (1, 44);
INSERT INTO `rice_canteen_dish` VALUES (1, 45);
INSERT INTO `rice_canteen_dish` VALUES (1, 46);
INSERT INTO `rice_canteen_dish` VALUES (1, 47);
INSERT INTO `rice_canteen_dish` VALUES (1, 48);
INSERT INTO `rice_canteen_dish` VALUES (1, 50);
INSERT INTO `rice_canteen_dish` VALUES (1, 51);
INSERT INTO `rice_canteen_dish` VALUES (1, 52);
INSERT INTO `rice_canteen_dish` VALUES (1, 53);
INSERT INTO `rice_canteen_dish` VALUES (1, 54);
INSERT INTO `rice_canteen_dish` VALUES (1, 55);
INSERT INTO `rice_canteen_dish` VALUES (1, 56);
INSERT INTO `rice_canteen_dish` VALUES (1, 57);
INSERT INTO `rice_canteen_dish` VALUES (1, 58);
INSERT INTO `rice_canteen_dish` VALUES (1, 59);
INSERT INTO `rice_canteen_dish` VALUES (1, 60);
INSERT INTO `rice_canteen_dish` VALUES (1, 61);
INSERT INTO `rice_canteen_dish` VALUES (1, 62);
INSERT INTO `rice_canteen_dish` VALUES (1, 63);
INSERT INTO `rice_canteen_dish` VALUES (1, 64);
INSERT INTO `rice_canteen_dish` VALUES (1, 65);
INSERT INTO `rice_canteen_dish` VALUES (1, 66);
INSERT INTO `rice_canteen_dish` VALUES (1, 67);
INSERT INTO `rice_canteen_dish` VALUES (1, 68);
INSERT INTO `rice_canteen_dish` VALUES (1, 69);
INSERT INTO `rice_canteen_dish` VALUES (1, 70);
INSERT INTO `rice_canteen_dish` VALUES (1, 71);
INSERT INTO `rice_canteen_dish` VALUES (1, 72);
INSERT INTO `rice_canteen_dish` VALUES (1, 73);
INSERT INTO `rice_canteen_dish` VALUES (1, 74);
INSERT INTO `rice_canteen_dish` VALUES (1, 75);
INSERT INTO `rice_canteen_dish` VALUES (1, 76);
INSERT INTO `rice_canteen_dish` VALUES (1, 77);
INSERT INTO `rice_canteen_dish` VALUES (1, 78);
INSERT INTO `rice_canteen_dish` VALUES (1, 79);
INSERT INTO `rice_canteen_dish` VALUES (1, 80);
INSERT INTO `rice_canteen_dish` VALUES (1, 81);
INSERT INTO `rice_canteen_dish` VALUES (1, 82);
INSERT INTO `rice_canteen_dish` VALUES (1, 83);
INSERT INTO `rice_canteen_dish` VALUES (1, 84);
INSERT INTO `rice_canteen_dish` VALUES (1, 85);
INSERT INTO `rice_canteen_dish` VALUES (1, 86);
INSERT INTO `rice_canteen_dish` VALUES (1, 87);
INSERT INTO `rice_canteen_dish` VALUES (1, 88);
INSERT INTO `rice_canteen_dish` VALUES (1, 89);
INSERT INTO `rice_canteen_dish` VALUES (1, 90);
INSERT INTO `rice_canteen_dish` VALUES (1, 91);
INSERT INTO `rice_canteen_dish` VALUES (1, 92);
INSERT INTO `rice_canteen_dish` VALUES (1, 93);
INSERT INTO `rice_canteen_dish` VALUES (1, 94);
INSERT INTO `rice_canteen_dish` VALUES (1, 95);
INSERT INTO `rice_canteen_dish` VALUES (1, 96);
INSERT INTO `rice_canteen_dish` VALUES (1, 97);
INSERT INTO `rice_canteen_dish` VALUES (1, 98);
INSERT INTO `rice_canteen_dish` VALUES (1, 99);
INSERT INTO `rice_canteen_dish` VALUES (1, 100);
INSERT INTO `rice_canteen_dish` VALUES (1, 101);
INSERT INTO `rice_canteen_dish` VALUES (1, 102);
INSERT INTO `rice_canteen_dish` VALUES (1, 103);
INSERT INTO `rice_canteen_dish` VALUES (1, 104);
INSERT INTO `rice_canteen_dish` VALUES (1, 105);
INSERT INTO `rice_canteen_dish` VALUES (1, 106);
INSERT INTO `rice_canteen_dish` VALUES (1, 107);
INSERT INTO `rice_canteen_dish` VALUES (1, 108);
INSERT INTO `rice_canteen_dish` VALUES (1, 109);
INSERT INTO `rice_canteen_dish` VALUES (2, 4);
INSERT INTO `rice_canteen_dish` VALUES (2, 5);
INSERT INTO `rice_canteen_dish` VALUES (2, 6);
INSERT INTO `rice_canteen_dish` VALUES (2, 8);
INSERT INTO `rice_canteen_dish` VALUES (2, 10);
INSERT INTO `rice_canteen_dish` VALUES (2, 11);
INSERT INTO `rice_canteen_dish` VALUES (2, 12);
INSERT INTO `rice_canteen_dish` VALUES (2, 13);
INSERT INTO `rice_canteen_dish` VALUES (2, 14);
INSERT INTO `rice_canteen_dish` VALUES (2, 15);
INSERT INTO `rice_canteen_dish` VALUES (2, 16);
INSERT INTO `rice_canteen_dish` VALUES (2, 17);
INSERT INTO `rice_canteen_dish` VALUES (2, 18);
INSERT INTO `rice_canteen_dish` VALUES (2, 20);
INSERT INTO `rice_canteen_dish` VALUES (2, 21);
INSERT INTO `rice_canteen_dish` VALUES (2, 22);
INSERT INTO `rice_canteen_dish` VALUES (2, 24);
INSERT INTO `rice_canteen_dish` VALUES (2, 27);
INSERT INTO `rice_canteen_dish` VALUES (2, 28);
INSERT INTO `rice_canteen_dish` VALUES (2, 30);
INSERT INTO `rice_canteen_dish` VALUES (2, 31);
INSERT INTO `rice_canteen_dish` VALUES (2, 32);
INSERT INTO `rice_canteen_dish` VALUES (2, 33);
INSERT INTO `rice_canteen_dish` VALUES (2, 34);
INSERT INTO `rice_canteen_dish` VALUES (2, 35);
INSERT INTO `rice_canteen_dish` VALUES (2, 36);
INSERT INTO `rice_canteen_dish` VALUES (2, 38);
INSERT INTO `rice_canteen_dish` VALUES (2, 40);
INSERT INTO `rice_canteen_dish` VALUES (2, 42);
INSERT INTO `rice_canteen_dish` VALUES (2, 45);
INSERT INTO `rice_canteen_dish` VALUES (2, 48);
INSERT INTO `rice_canteen_dish` VALUES (2, 49);
INSERT INTO `rice_canteen_dish` VALUES (2, 50);
INSERT INTO `rice_canteen_dish` VALUES (2, 52);
INSERT INTO `rice_canteen_dish` VALUES (2, 53);
INSERT INTO `rice_canteen_dish` VALUES (2, 54);
INSERT INTO `rice_canteen_dish` VALUES (2, 55);
INSERT INTO `rice_canteen_dish` VALUES (2, 56);
INSERT INTO `rice_canteen_dish` VALUES (2, 58);
INSERT INTO `rice_canteen_dish` VALUES (2, 59);
INSERT INTO `rice_canteen_dish` VALUES (2, 60);
INSERT INTO `rice_canteen_dish` VALUES (2, 61);
INSERT INTO `rice_canteen_dish` VALUES (2, 62);
INSERT INTO `rice_canteen_dish` VALUES (2, 63);
INSERT INTO `rice_canteen_dish` VALUES (2, 64);
INSERT INTO `rice_canteen_dish` VALUES (2, 65);
INSERT INTO `rice_canteen_dish` VALUES (2, 66);
INSERT INTO `rice_canteen_dish` VALUES (2, 67);
INSERT INTO `rice_canteen_dish` VALUES (2, 68);
INSERT INTO `rice_canteen_dish` VALUES (2, 69);
INSERT INTO `rice_canteen_dish` VALUES (2, 70);
INSERT INTO `rice_canteen_dish` VALUES (2, 71);
INSERT INTO `rice_canteen_dish` VALUES (2, 72);
INSERT INTO `rice_canteen_dish` VALUES (2, 73);
INSERT INTO `rice_canteen_dish` VALUES (2, 74);
INSERT INTO `rice_canteen_dish` VALUES (2, 75);
INSERT INTO `rice_canteen_dish` VALUES (2, 78);
INSERT INTO `rice_canteen_dish` VALUES (2, 80);
INSERT INTO `rice_canteen_dish` VALUES (2, 81);
INSERT INTO `rice_canteen_dish` VALUES (2, 84);
INSERT INTO `rice_canteen_dish` VALUES (2, 88);
INSERT INTO `rice_canteen_dish` VALUES (2, 91);
INSERT INTO `rice_canteen_dish` VALUES (2, 92);
INSERT INTO `rice_canteen_dish` VALUES (2, 93);
INSERT INTO `rice_canteen_dish` VALUES (2, 94);
INSERT INTO `rice_canteen_dish` VALUES (2, 95);
INSERT INTO `rice_canteen_dish` VALUES (2, 98);
INSERT INTO `rice_canteen_dish` VALUES (2, 101);
INSERT INTO `rice_canteen_dish` VALUES (2, 103);
INSERT INTO `rice_canteen_dish` VALUES (2, 104);
INSERT INTO `rice_canteen_dish` VALUES (2, 106);
INSERT INTO `rice_canteen_dish` VALUES (2, 107);
INSERT INTO `rice_canteen_dish` VALUES (2, 108);
INSERT INTO `rice_canteen_dish` VALUES (3, 5);
INSERT INTO `rice_canteen_dish` VALUES (3, 6);
INSERT INTO `rice_canteen_dish` VALUES (3, 8);
INSERT INTO `rice_canteen_dish` VALUES (3, 10);
INSERT INTO `rice_canteen_dish` VALUES (3, 11);
INSERT INTO `rice_canteen_dish` VALUES (3, 12);
INSERT INTO `rice_canteen_dish` VALUES (3, 14);
INSERT INTO `rice_canteen_dish` VALUES (3, 15);
INSERT INTO `rice_canteen_dish` VALUES (3, 16);
INSERT INTO `rice_canteen_dish` VALUES (3, 17);
INSERT INTO `rice_canteen_dish` VALUES (3, 18);
INSERT INTO `rice_canteen_dish` VALUES (3, 20);
INSERT INTO `rice_canteen_dish` VALUES (3, 21);
INSERT INTO `rice_canteen_dish` VALUES (3, 22);
INSERT INTO `rice_canteen_dish` VALUES (3, 25);
INSERT INTO `rice_canteen_dish` VALUES (3, 27);
INSERT INTO `rice_canteen_dish` VALUES (3, 28);
INSERT INTO `rice_canteen_dish` VALUES (3, 30);
INSERT INTO `rice_canteen_dish` VALUES (3, 31);
INSERT INTO `rice_canteen_dish` VALUES (3, 33);
INSERT INTO `rice_canteen_dish` VALUES (3, 34);
INSERT INTO `rice_canteen_dish` VALUES (3, 35);
INSERT INTO `rice_canteen_dish` VALUES (3, 38);
INSERT INTO `rice_canteen_dish` VALUES (3, 40);
INSERT INTO `rice_canteen_dish` VALUES (3, 42);
INSERT INTO `rice_canteen_dish` VALUES (3, 45);
INSERT INTO `rice_canteen_dish` VALUES (3, 48);
INSERT INTO `rice_canteen_dish` VALUES (3, 49);
INSERT INTO `rice_canteen_dish` VALUES (3, 50);
INSERT INTO `rice_canteen_dish` VALUES (3, 51);
INSERT INTO `rice_canteen_dish` VALUES (3, 52);
INSERT INTO `rice_canteen_dish` VALUES (3, 53);
INSERT INTO `rice_canteen_dish` VALUES (3, 54);
INSERT INTO `rice_canteen_dish` VALUES (3, 55);
INSERT INTO `rice_canteen_dish` VALUES (3, 56);
INSERT INTO `rice_canteen_dish` VALUES (3, 58);
INSERT INTO `rice_canteen_dish` VALUES (3, 59);
INSERT INTO `rice_canteen_dish` VALUES (3, 60);
INSERT INTO `rice_canteen_dish` VALUES (3, 61);
INSERT INTO `rice_canteen_dish` VALUES (3, 62);
INSERT INTO `rice_canteen_dish` VALUES (3, 63);
INSERT INTO `rice_canteen_dish` VALUES (3, 64);
INSERT INTO `rice_canteen_dish` VALUES (3, 65);
INSERT INTO `rice_canteen_dish` VALUES (3, 66);
INSERT INTO `rice_canteen_dish` VALUES (3, 67);
INSERT INTO `rice_canteen_dish` VALUES (3, 68);
INSERT INTO `rice_canteen_dish` VALUES (3, 69);
INSERT INTO `rice_canteen_dish` VALUES (3, 70);
INSERT INTO `rice_canteen_dish` VALUES (3, 71);
INSERT INTO `rice_canteen_dish` VALUES (3, 72);
INSERT INTO `rice_canteen_dish` VALUES (3, 73);
INSERT INTO `rice_canteen_dish` VALUES (3, 74);
INSERT INTO `rice_canteen_dish` VALUES (3, 75);
INSERT INTO `rice_canteen_dish` VALUES (3, 78);
INSERT INTO `rice_canteen_dish` VALUES (3, 80);
INSERT INTO `rice_canteen_dish` VALUES (3, 81);
INSERT INTO `rice_canteen_dish` VALUES (3, 82);
INSERT INTO `rice_canteen_dish` VALUES (3, 83);
INSERT INTO `rice_canteen_dish` VALUES (3, 84);
INSERT INTO `rice_canteen_dish` VALUES (3, 88);
INSERT INTO `rice_canteen_dish` VALUES (3, 91);
INSERT INTO `rice_canteen_dish` VALUES (3, 92);
INSERT INTO `rice_canteen_dish` VALUES (3, 93);
INSERT INTO `rice_canteen_dish` VALUES (3, 94);
INSERT INTO `rice_canteen_dish` VALUES (3, 95);
INSERT INTO `rice_canteen_dish` VALUES (3, 98);
INSERT INTO `rice_canteen_dish` VALUES (3, 101);
INSERT INTO `rice_canteen_dish` VALUES (3, 105);
INSERT INTO `rice_canteen_dish` VALUES (3, 106);
INSERT INTO `rice_canteen_dish` VALUES (3, 107);
INSERT INTO `rice_canteen_dish` VALUES (3, 108);
INSERT INTO `rice_canteen_dish` VALUES (27, 6);
INSERT INTO `rice_canteen_dish` VALUES (27, 8);
INSERT INTO `rice_canteen_dish` VALUES (27, 10);
INSERT INTO `rice_canteen_dish` VALUES (27, 11);
INSERT INTO `rice_canteen_dish` VALUES (27, 12);
INSERT INTO `rice_canteen_dish` VALUES (27, 13);
INSERT INTO `rice_canteen_dish` VALUES (27, 14);
INSERT INTO `rice_canteen_dish` VALUES (27, 15);
INSERT INTO `rice_canteen_dish` VALUES (27, 16);
INSERT INTO `rice_canteen_dish` VALUES (27, 17);
INSERT INTO `rice_canteen_dish` VALUES (27, 18);
INSERT INTO `rice_canteen_dish` VALUES (27, 21);
INSERT INTO `rice_canteen_dish` VALUES (27, 22);
INSERT INTO `rice_canteen_dish` VALUES (27, 23);
INSERT INTO `rice_canteen_dish` VALUES (27, 27);
INSERT INTO `rice_canteen_dish` VALUES (27, 28);
INSERT INTO `rice_canteen_dish` VALUES (27, 30);
INSERT INTO `rice_canteen_dish` VALUES (27, 31);
INSERT INTO `rice_canteen_dish` VALUES (27, 32);
INSERT INTO `rice_canteen_dish` VALUES (27, 34);
INSERT INTO `rice_canteen_dish` VALUES (27, 35);
INSERT INTO `rice_canteen_dish` VALUES (27, 36);
INSERT INTO `rice_canteen_dish` VALUES (27, 38);
INSERT INTO `rice_canteen_dish` VALUES (27, 40);
INSERT INTO `rice_canteen_dish` VALUES (27, 42);
INSERT INTO `rice_canteen_dish` VALUES (27, 45);
INSERT INTO `rice_canteen_dish` VALUES (27, 46);
INSERT INTO `rice_canteen_dish` VALUES (27, 48);
INSERT INTO `rice_canteen_dish` VALUES (27, 50);
INSERT INTO `rice_canteen_dish` VALUES (27, 52);
INSERT INTO `rice_canteen_dish` VALUES (27, 53);
INSERT INTO `rice_canteen_dish` VALUES (27, 54);
INSERT INTO `rice_canteen_dish` VALUES (27, 55);
INSERT INTO `rice_canteen_dish` VALUES (27, 56);
INSERT INTO `rice_canteen_dish` VALUES (27, 58);
INSERT INTO `rice_canteen_dish` VALUES (27, 59);
INSERT INTO `rice_canteen_dish` VALUES (27, 60);
INSERT INTO `rice_canteen_dish` VALUES (27, 61);
INSERT INTO `rice_canteen_dish` VALUES (27, 62);
INSERT INTO `rice_canteen_dish` VALUES (27, 63);
INSERT INTO `rice_canteen_dish` VALUES (27, 64);
INSERT INTO `rice_canteen_dish` VALUES (27, 66);
INSERT INTO `rice_canteen_dish` VALUES (27, 68);
INSERT INTO `rice_canteen_dish` VALUES (27, 69);
INSERT INTO `rice_canteen_dish` VALUES (27, 70);
INSERT INTO `rice_canteen_dish` VALUES (27, 71);
INSERT INTO `rice_canteen_dish` VALUES (27, 72);
INSERT INTO `rice_canteen_dish` VALUES (27, 73);
INSERT INTO `rice_canteen_dish` VALUES (27, 74);
INSERT INTO `rice_canteen_dish` VALUES (27, 75);
INSERT INTO `rice_canteen_dish` VALUES (27, 78);
INSERT INTO `rice_canteen_dish` VALUES (27, 80);
INSERT INTO `rice_canteen_dish` VALUES (27, 84);
INSERT INTO `rice_canteen_dish` VALUES (27, 88);
INSERT INTO `rice_canteen_dish` VALUES (27, 91);
INSERT INTO `rice_canteen_dish` VALUES (27, 92);
INSERT INTO `rice_canteen_dish` VALUES (27, 93);
INSERT INTO `rice_canteen_dish` VALUES (27, 94);
INSERT INTO `rice_canteen_dish` VALUES (27, 95);
INSERT INTO `rice_canteen_dish` VALUES (27, 98);
INSERT INTO `rice_canteen_dish` VALUES (27, 101);
INSERT INTO `rice_canteen_dish` VALUES (27, 103);
INSERT INTO `rice_canteen_dish` VALUES (27, 104);
INSERT INTO `rice_canteen_dish` VALUES (27, 106);
INSERT INTO `rice_canteen_dish` VALUES (27, 107);
INSERT INTO `rice_canteen_dish` VALUES (27, 108);
INSERT INTO `rice_canteen_dish` VALUES (27, 109);

-- ----------------------------
-- Table structure for rice_canteen_dish_type
-- ----------------------------
DROP TABLE IF EXISTS `rice_canteen_dish_type`;
CREATE TABLE `rice_canteen_dish_type`  (
  `type_id` bigint(20) NOT NULL COMMENT '菜品类型id',
  `canteen_id` bigint(20) NOT NULL COMMENT '食堂id',
  PRIMARY KEY (`type_id`, `canteen_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '食堂菜品类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rice_canteen_dish_type
-- ----------------------------
INSERT INTO `rice_canteen_dish_type` VALUES (100, 1);
INSERT INTO `rice_canteen_dish_type` VALUES (100, 2);
INSERT INTO `rice_canteen_dish_type` VALUES (100, 3);
INSERT INTO `rice_canteen_dish_type` VALUES (101, 1);
INSERT INTO `rice_canteen_dish_type` VALUES (101, 2);
INSERT INTO `rice_canteen_dish_type` VALUES (101, 3);
INSERT INTO `rice_canteen_dish_type` VALUES (101, 27);
INSERT INTO `rice_canteen_dish_type` VALUES (103, 1);
INSERT INTO `rice_canteen_dish_type` VALUES (103, 2);
INSERT INTO `rice_canteen_dish_type` VALUES (103, 3);
INSERT INTO `rice_canteen_dish_type` VALUES (103, 27);
INSERT INTO `rice_canteen_dish_type` VALUES (123, 1);
INSERT INTO `rice_canteen_dish_type` VALUES (123, 2);
INSERT INTO `rice_canteen_dish_type` VALUES (123, 3);
INSERT INTO `rice_canteen_dish_type` VALUES (123, 27);
INSERT INTO `rice_canteen_dish_type` VALUES (124, 1);
INSERT INTO `rice_canteen_dish_type` VALUES (124, 2);
INSERT INTO `rice_canteen_dish_type` VALUES (124, 3);
INSERT INTO `rice_canteen_dish_type` VALUES (124, 27);
INSERT INTO `rice_canteen_dish_type` VALUES (126, 1);
INSERT INTO `rice_canteen_dish_type` VALUES (126, 2);
INSERT INTO `rice_canteen_dish_type` VALUES (126, 3);
INSERT INTO `rice_canteen_dish_type` VALUES (126, 27);
INSERT INTO `rice_canteen_dish_type` VALUES (127, 1);
INSERT INTO `rice_canteen_dish_type` VALUES (127, 2);
INSERT INTO `rice_canteen_dish_type` VALUES (127, 3);
INSERT INTO `rice_canteen_dish_type` VALUES (127, 27);
INSERT INTO `rice_canteen_dish_type` VALUES (129, 1);
INSERT INTO `rice_canteen_dish_type` VALUES (129, 2);
INSERT INTO `rice_canteen_dish_type` VALUES (129, 3);
INSERT INTO `rice_canteen_dish_type` VALUES (129, 27);
INSERT INTO `rice_canteen_dish_type` VALUES (131, 1);
INSERT INTO `rice_canteen_dish_type` VALUES (131, 2);
INSERT INTO `rice_canteen_dish_type` VALUES (131, 3);
INSERT INTO `rice_canteen_dish_type` VALUES (131, 27);
INSERT INTO `rice_canteen_dish_type` VALUES (133, 1);
INSERT INTO `rice_canteen_dish_type` VALUES (133, 2);
INSERT INTO `rice_canteen_dish_type` VALUES (133, 3);
INSERT INTO `rice_canteen_dish_type` VALUES (133, 27);
INSERT INTO `rice_canteen_dish_type` VALUES (134, 1);
INSERT INTO `rice_canteen_dish_type` VALUES (134, 2);
INSERT INTO `rice_canteen_dish_type` VALUES (134, 3);
INSERT INTO `rice_canteen_dish_type` VALUES (134, 27);

-- ----------------------------
-- Table structure for rice_coupon
-- ----------------------------
DROP TABLE IF EXISTS `rice_coupon`;
CREATE TABLE `rice_coupon`  (
  `coupon_id` bigint(20) NOT NULL COMMENT '优惠卷id',
  `coupon_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠卷类型',
  `value` double NULL DEFAULT NULL COMMENT '满减',
  PRIMARY KEY (`coupon_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠卷表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rice_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for rice_dish
-- ----------------------------
DROP TABLE IF EXISTS `rice_dish`;
CREATE TABLE `rice_dish`  (
  `dish_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '菜品id',
  `type_id` bigint(11) NULL DEFAULT NULL COMMENT '菜品类型id',
  `dishes_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜品名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜品图片',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品价格',
  `shelf_date` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '上架日期(1,2,3,4,5,6代表周一至周六上架,周末不上架)',
  `onsale` int(11) NULL DEFAULT NULL COMMENT '月售量',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜品状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dish_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rice_dish
-- ----------------------------
INSERT INTO `rice_dish` VALUES (1, 100, '番茄炒蛋', '/profile/upload/2021/11/25/ca875341-c031-4a34-93fc-ed399d876fa5.jpeg', 3.00, '1,2,3,4,5,6', 8, '0', '0', '', '2021-10-24 10:45:46', '', '2021-12-06 22:45:04');
INSERT INTO `rice_dish` VALUES (6, 131, '鸡腿', '/profile/upload/2021/11/25/69a01da7-193e-49d0-9f11-35453d844bc4.jpeg', 4.50, '1,2,3,4,6,5', 4, '0', '0', '', '2021-10-26 08:23:21', '', '2021-11-30 23:25:44');
INSERT INTO `rice_dish` VALUES (8, 131, '鸭腿', '/profile/upload/2021/11/25/7ccdf562-717d-42af-b711-187f79540dfa.jpeg', 4.00, '2,3,4,5,0', 4, '0', '0', '', '2021-10-26 11:27:20', '', '2021-11-30 23:25:49');
INSERT INTO `rice_dish` VALUES (10, 101, '白菜', '/profile/upload/2021/11/25/fb0c1ac8-3597-4311-b5ed-8f0f9a581200.jpeg', 3.00, '0,1,2,3,4,5,6', 4, '0', '0', '', '2021-10-26 13:08:16', '', '2021-11-30 23:16:40');
INSERT INTO `rice_dish` VALUES (11, 100, '胡萝卜炒肉末', '/profile/upload/2021/11/25/557813cc-1ac3-4eb2-a28e-7bbeb387b1b3.jpeg', 3.00, '0,1,2,3,4,5,6', 5, '0', '0', '', '2021-11-09 09:34:00', '', '2021-11-30 23:13:17');
INSERT INTO `rice_dish` VALUES (12, 100, '煎蛋', '/profile/upload/2021/11/25/2609829e-c8af-4c0c-96a3-5ec0f5c7e2b6.jpeg', 1.50, '0,1,2,3,4,5,6', 2, '0', '0', '', '2021-11-09 19:56:24', '', '2021-11-30 23:13:37');
INSERT INTO `rice_dish` VALUES (13, 100, '扣肉', '/profile/upload/2021/11/25/4c93e29e-1f43-4bb1-be0a-ff4dfb5c23f6.jpeg', 3.00, '0,2,3,4,5', 0, '0', '0', '', '2021-11-09 22:16:17', '', '2021-11-30 23:29:36');
INSERT INTO `rice_dish` VALUES (14, 101, '烧鸭', '/profile/upload/2021/11/25/9e25907d-a004-4c6a-b5f0-091ab14a981d.jpeg', 3.00, '0,1,2,3,4,5,6', 2, '0', '0', '', '2021-11-09 22:16:36', '', '2021-11-30 23:16:45');
INSERT INTO `rice_dish` VALUES (15, 100, '肉末茄子', '/profile/upload/2021/11/25/e0255561-c473-4fae-b924-2ba00f32a8c6.jpg', 2.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-09 22:17:08', '', '2021-11-30 23:13:25');
INSERT INTO `rice_dish` VALUES (16, 100, '鸡米花', '/profile/upload/2021/11/25/6af44f04-3c13-4503-9aa0-29aff830447e.jpg', 3.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-09 22:17:27', '', '2021-11-30 23:13:50');
INSERT INTO `rice_dish` VALUES (17, 101, '净炒白萝卜', '/profile/upload/2021/11/25/b927010d-500a-41c5-900e-5c7bcec75f1c.jpg', 0.80, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-21 16:36:47', '', '2021-11-30 23:16:56');
INSERT INTO `rice_dish` VALUES (18, 101, '冬瓜', '/profile/upload/2021/11/25/73347246-e14d-4453-a331-e0a16efe9421.jpg', 1.00, '1', 8, '0', '0', '', '2021-11-21 16:37:01', '', '2021-11-30 23:17:05');
INSERT INTO `rice_dish` VALUES (19, 101, '豆芽', '/profile/upload/2021/11/25/a5588b84-bccc-46d0-9f2b-3203cb9d5f53.jpg', 1.00, '0,1,2,3,4,5', 1, '0', '0', '', '2021-11-21 16:37:13', '', '2021-11-25 10:20:21');
INSERT INTO `rice_dish` VALUES (20, 101, '淮山木耳', '/profile/upload/2021/11/25/821b6fea-b198-481f-bcc4-2395e3943983.jpg', 2.00, '1', 1, '0', '0', '', '2021-11-24 08:11:45', '', '2021-11-30 23:17:24');
INSERT INTO `rice_dish` VALUES (21, 101, '辣豆芽', '/profile/upload/2021/11/25/ab16f8ae-5409-4d92-bdb3-52faaa2af182.jpg', 1.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:12:29', '', '2021-11-30 23:17:37');
INSERT INTO `rice_dish` VALUES (22, 133, '香米饭', '/profile/upload/2021/11/25/cc801cf3-df27-4065-83bd-c167837a0b9b.jpg', 0.40, '0,1,2,3,4,5,6', 8, '0', '0', '', '2021-11-24 08:13:05', '', '2021-11-30 23:26:47');
INSERT INTO `rice_dish` VALUES (23, 101, '莲藕木耳', '/profile/upload/2021/11/25/cf4bcf26-a807-4825-a951-1bc2987bcec6.jpg', 2.00, '0,1,2,3,4', 1, '0', '0', '', '2021-11-24 08:14:01', '', '2021-11-30 23:18:14');
INSERT INTO `rice_dish` VALUES (24, 101, '南瓜', '/profile/upload/2021/11/25/e1dffd18-e5c7-4858-956c-aacc072c6cdc.jpg', 1.00, '0,1,2,3,4', 1, '0', '0', '', '2021-11-24 08:14:45', '', '2021-11-30 23:18:10');
INSERT INTO `rice_dish` VALUES (25, 101, '豆芽三丝', '/profile/upload/2021/11/25/f9b384b6-10a3-4970-94d2-46b9b59371cf.jpg', 1.50, '5,6', 1, '0', '0', '', '2021-11-24 08:18:07', '', '2021-11-30 23:18:06');
INSERT INTO `rice_dish` VALUES (26, 100, '猪红', '/profile/upload/2021/11/25/1c78173a-6f34-4990-a1f8-ab5e14d3bf42.jpg', 2.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:18:26', '', '2021-11-25 10:05:56');
INSERT INTO `rice_dish` VALUES (27, 101, '红萝卜', '/profile/upload/2021/11/25/13e9ff89-0f8c-48d3-a99f-72e3edf6a058.jpg', 1.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:19:04', '', '2021-11-30 23:18:24');
INSERT INTO `rice_dish` VALUES (28, 101, '酸辣菜梗', '/profile/upload/2021/11/25/f88d9674-6205-4e5f-8841-cdecfef833f6.jpg', 1.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:19:33', '', '2021-11-30 23:18:29');
INSERT INTO `rice_dish` VALUES (29, 101, '净抄白萝卜', '/profile/upload/2021/11/25/55363124-06de-4c1f-be42-99b56bcaf520.jpg', 0.80, '', 1, '0', '2', '', '2021-11-24 08:19:56', '', '2021-11-25 10:08:47');
INSERT INTO `rice_dish` VALUES (30, 101, '土豆丝', '/profile/upload/2021/11/25/cb46f364-0ba9-4bcb-ae1a-7511795e1ea2.jpg', 1.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:20:11', '', '2021-11-30 23:18:34');
INSERT INTO `rice_dish` VALUES (31, 101, '干煸豆角', '/profile/upload/2021/11/25/9096c32a-2a47-4fab-b22c-52184e0a49cf.jpg', 2.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:20:33', '', '2021-11-30 23:18:40');
INSERT INTO `rice_dish` VALUES (32, 123, '凉拌鸭肾', '/profile/upload/2021/11/25/8c721f85-1ed7-425d-978d-a281f2a6fbd2.jpg', 5.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:28:42', '', '2021-11-30 23:19:49');
INSERT INTO `rice_dish` VALUES (33, 123, '凉拌猪耳朵', '/profile/upload/2021/11/25/9b0c897c-6eae-404a-87cb-b48eb0c14bf6.jpg', 4.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:31:04', '', '2021-11-30 23:19:54');
INSERT INTO `rice_dish` VALUES (34, 103, '蒸草鱼', '/profile/upload/2021/11/25/d62a7129-c725-46ec-87d8-d3403455951a.jpg', 3.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:32:06', '', '2021-11-30 23:19:11');
INSERT INTO `rice_dish` VALUES (35, 123, '凉拌黄瓜', '/profile/upload/2021/11/25/8737c8a7-c611-428f-a5da-2e4f258ff1a2.jpg', 2.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:32:28', '', '2021-11-30 23:19:59');
INSERT INTO `rice_dish` VALUES (36, 103, '蒸罗非鱼', '/profile/upload/2021/11/25/9fd4a18e-257b-416d-b779-f52aeea5ecb1.jpg', 3.50, '0,1,2,3,4,5,6', 7, '0', '0', '', '2021-11-24 08:32:44', '', '2021-11-30 23:19:16');
INSERT INTO `rice_dish` VALUES (37, 103, '蒸塘角鱼', '/profile/upload/2021/11/25/67d4c896-eab1-4bb9-ba1c-a17f5bec9d0e.jpg', 4.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:33:36', '', '2021-11-25 10:25:41');
INSERT INTO `rice_dish` VALUES (38, 123, '凉拌海带', '/profile/upload/2021/11/25/cf73486e-1b1e-4c33-842a-0eda1aaf5ee1.jpg', 2.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:33:57', '', '2021-11-30 23:20:05');
INSERT INTO `rice_dish` VALUES (39, 103, '水煮鱼', '/profile/upload/2021/11/25/7d6e124f-6ad8-4154-97ba-78b16f6787db.jpg', 5.00, '0,1,2,3,4,5,6', 7, '0', '0', '', '2021-11-24 08:33:58', '', '2021-11-25 10:26:57');
INSERT INTO `rice_dish` VALUES (40, 123, '凉拌杏鲍菇', '/profile/upload/2021/11/25/4494af2f-1660-40ad-985b-9deb48d8cb4f.jpg', 3.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:34:20', '', '2021-11-30 23:20:10');
INSERT INTO `rice_dish` VALUES (41, 103, '爆炒塘角鱼', '/profile/upload/2021/11/25/c7357301-4617-472e-bf9f-23d79167e18a.jpg', 4.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:34:37', '', '2021-11-25 10:29:24');
INSERT INTO `rice_dish` VALUES (42, 123, '干捞柠檬鸭', '/profile/upload/2021/11/25/789cbfa9-7e98-4291-bdcc-cf006810a597.jpg', 4.00, '0,3,4', 1, '0', '0', '', '2021-11-24 08:35:10', '', '2021-11-30 23:20:16');
INSERT INTO `rice_dish` VALUES (43, 103, '蒸鱼楠', '/profile/upload/2021/11/25/44d63e4f-261d-4d3f-9823-bb1affaabab7.jpg', 4.00, '0,1,3,5', 1, '0', '0', '', '2021-11-24 08:35:19', '', '2021-11-25 10:32:49');
INSERT INTO `rice_dish` VALUES (44, 123, '凉拌千张豆腐', '/profile/upload/2021/11/25/463815f1-9781-475f-a51b-07d616211a0a.jpg', 2.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:35:41', '', '2021-11-25 10:33:31');
INSERT INTO `rice_dish` VALUES (45, 103, '酸甜鱼', '/profile/upload/2021/11/25/abc7734d-b715-4040-b7a7-8bb255bed232.jpg', 4.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:35:48', '', '2021-11-30 23:19:34');
INSERT INTO `rice_dish` VALUES (46, 103, '禾花鱼', '/profile/upload/2021/11/25/087b3455-1d55-4378-a499-86ae1b924a16.jpg', 4.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:37:10', '', '2021-11-30 23:19:23');
INSERT INTO `rice_dish` VALUES (47, 103, '香辣鱼', '/profile/upload/2021/11/25/05ef35a1-d9bf-4e49-a010-c72515507781.jpg', 4.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:37:35', '', '2021-11-25 10:35:36');
INSERT INTO `rice_dish` VALUES (48, 123, '凉拌豆腐皮蛋', '/profile/upload/2021/11/25/4307c7e4-8578-46b6-aef6-6c85c8c3fce4.jpg', 2.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:37:54', '', '2021-11-30 23:20:20');
INSERT INTO `rice_dish` VALUES (49, 103, '鱼蛋', '/profile/upload/2021/11/25/bfd7b394-c035-4e2f-94e6-3f99f0563f32.jpg', 3.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:38:01', '', '2021-11-30 23:19:28');
INSERT INTO `rice_dish` VALUES (50, 123, '凉拌双蛋', '/profile/upload/2021/11/25/1f82008c-db9c-43ee-8e17-839058d50720.jpg', 3.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:38:18', '', '2021-11-30 23:20:26');
INSERT INTO `rice_dish` VALUES (51, 126, '酸甜炸鸡蛋', '/profile/upload/2021/11/25/899304b2-0e98-42ca-86be-58e37e6e787d.jpg', 3.00, '', 1, '0', '0', '', '2021-11-24 08:39:15', '', '2021-11-30 23:21:56');
INSERT INTO `rice_dish` VALUES (52, 129, '卤鸭', '/profile/upload/2021/11/25/d03f85ea-f4d5-4168-8a87-1168c9470a1e.jpg', 4.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:39:24', '', '2021-11-30 23:23:41');
INSERT INTO `rice_dish` VALUES (53, 124, '酿茄子', '/profile/upload/2021/11/25/aee97e05-c9af-462f-8b24-3db67b263586.jpeg', 3.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:39:44', '', '2021-11-30 23:20:39');
INSERT INTO `rice_dish` VALUES (54, 124, '酿丝瓜', '/profile/upload/2021/11/25/64b36fbb-2bba-487e-97dd-64ed30df74a8.jpg', 3.00, '', 1, '0', '0', '', '2021-11-24 08:40:41', '', '2021-11-30 23:20:44');
INSERT INTO `rice_dish` VALUES (55, 124, '酿苦瓜', '/profile/upload/2021/11/25/2b6641a0-3b12-4319-97b0-ab6c1ddcf0df.jpg', 3.00, '', 1, '0', '0', '', '2021-11-24 08:40:56', '', '2021-11-30 23:21:08');
INSERT INTO `rice_dish` VALUES (56, 124, '酿豆腐', '/profile/upload/2021/11/25/5213ffc6-543a-4453-9c4c-6444d59291f6.jpeg', 2.00, '', 1, '0', '0', '', '2021-11-24 08:43:01', '', '2021-11-30 23:21:02');
INSERT INTO `rice_dish` VALUES (57, 126, '鸡蛋苦瓜', '/profile/upload/2021/11/25/c67abc7f-cd9e-49bc-94a5-bb155395e5dc.jpeg', 2.50, '', 1, '0', '0', '', '2021-11-24 08:43:02', '', '2021-11-25 10:29:22');
INSERT INTO `rice_dish` VALUES (58, 126, '蒸鸡蛋', '/profile/upload/2021/11/25/9cea3369-756f-41fa-bde3-9689b199c036.jpg', 2.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:43:28', '', '2021-11-30 23:21:42');
INSERT INTO `rice_dish` VALUES (59, 124, '蒜蓉茄子', '/profile/upload/2021/11/25/312c51bf-5a22-4014-a0a4-c7e0dafeceff.jpg', 3.50, '', 1, '0', '0', '', '2021-11-24 08:43:37', '', '2021-11-30 23:21:27');
INSERT INTO `rice_dish` VALUES (60, 126, '煎鸡蛋', '/profile/upload/2021/11/25/8f946d8d-7740-4c4b-a808-aec19acf3178.jpeg', 1.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:43:47', '', '2021-11-30 23:21:50');
INSERT INTO `rice_dish` VALUES (61, 129, '卤鸡', '/profile/upload/2021/11/25/3d9d1e39-9a89-4bc0-87af-06376a233f5e.jpeg', 4.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:46:13', '', '2021-11-30 23:23:46');
INSERT INTO `rice_dish` VALUES (62, 129, '卤鸭腿', '/profile/upload/2021/11/25/12fb698e-1111-46e5-9ea0-ba45e67f1ab3.jpeg', 3.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:46:41', '', '2021-11-30 23:23:51');
INSERT INTO `rice_dish` VALUES (63, 129, '卤鸡腿', '/profile/upload/2021/11/25/04f6ecc0-d6f5-4f17-b5c8-12a4871f6367.jpeg', 3.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 08:47:02', '', '2021-11-30 23:23:35');
INSERT INTO `rice_dish` VALUES (64, 129, '卤鸭掌', '/profile/upload/2021/11/25/9626a2d4-52cf-4eaf-8eee-d2cf4b9b212b.jpeg', 2.50, '', 1, '0', '0', '', '2021-11-24 08:47:30', '', '2021-11-30 23:24:01');
INSERT INTO `rice_dish` VALUES (65, 129, '卤鸡爪', '/profile/upload/2021/11/25/5d5ac637-26cc-44af-a4fc-7a27e5e5b70a.jpeg', 2.50, '', 1, '0', '0', '', '2021-11-24 08:52:35', '', '2021-11-25 10:45:00');
INSERT INTO `rice_dish` VALUES (66, 129, '卤鸭脖', '/profile/upload/2021/11/25/e293c54c-573c-4a4f-a3a1-5b3052829e9c.jpg', 5.50, '', 1, '0', '0', '', '2021-11-24 09:05:01', '', '2021-11-30 23:24:08');
INSERT INTO `rice_dish` VALUES (67, 129, '卤鸭架', '/profile/upload/2021/11/25/b9b35f70-a367-4f0f-b18d-8be2254416a5.jpg', 5.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 09:05:57', '', '2021-11-25 10:48:05');
INSERT INTO `rice_dish` VALUES (68, 129, '卤毛豆', '/profile/upload/2021/11/25/c44374cd-3463-4ceb-afa8-5a55d3dfa15d.jpg', 3.00, '', 1, '0', '0', '', '2021-11-24 09:06:31', '', '2021-11-30 23:24:30');
INSERT INTO `rice_dish` VALUES (69, 129, '卤莲藕', '/profile/upload/2021/11/25/120a68dc-e6aa-47c5-888e-a960b6b3e330.jpg', 3.00, '0,4', 1, '0', '0', '', '2021-11-24 09:08:22', '', '2021-11-30 23:24:34');
INSERT INTO `rice_dish` VALUES (70, 127, '肉末豆腐', '/profile/upload/2021/11/25/38960bbc-4505-4ead-84d6-145072137d36.jpeg', 4.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 09:10:41', '', '2021-11-30 23:22:16');
INSERT INTO `rice_dish` VALUES (71, 127, '肉末玉米', '/profile/upload/2021/11/25/e47a837e-03af-4858-b628-852e41ac17e8.jpeg', 4.00, '0,1,2,3,4', 1, '0', '0', '', '2021-11-24 09:11:04', '', '2021-11-30 23:22:20');
INSERT INTO `rice_dish` VALUES (72, 127, '肉末冬瓜', '/profile/upload/2021/11/25/62ad8007-c8d8-47d7-8642-6b2d88832d9a.jpeg', 4.00, ',1,6', 1, '0', '0', '', '2021-11-24 09:12:26', '', '2021-11-30 23:22:37');
INSERT INTO `rice_dish` VALUES (73, 127, '肉末豆角', '/profile/upload/2021/11/25/bae49ab6-38f3-4c8e-b955-4d1e0a46cca0.jpeg', 4.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-24 09:22:37', '', '2021-11-30 23:22:44');
INSERT INTO `rice_dish` VALUES (74, 100, '豆角火腿丁', '/profile/upload/2021/11/25/2e20f7c0-42a1-471e-a33a-db173556e5b4.jpg', 3.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:26:42', '', '2021-11-30 23:13:57');
INSERT INTO `rice_dish` VALUES (75, 100, '雪花鸡排', '/profile/upload/2021/11/25/e79df92e-bec6-4360-ab34-b5d7c113ea97.jpg', 5.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:27:03', '', '2021-11-30 23:14:05');
INSERT INTO `rice_dish` VALUES (76, 100, '战斗鸡排', '/profile/upload/2021/11/25/ae008ae7-304b-4a03-9fa5-9bd8427dd320.jpg', 4.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:27:27', '', '2021-11-25 10:50:20');
INSERT INTO `rice_dish` VALUES (77, 100, '香菇鸡肉饼', '/profile/upload/2021/11/25/1372b2c2-d416-41e8-a22a-c1a2947b4438.jpg', 3.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:27:54', '', '2021-11-25 10:36:38');
INSERT INTO `rice_dish` VALUES (78, 100, '牛肉丸（3个）', '/profile/upload/2021/11/25/17361c48-5f46-41eb-a191-b9a317252748.jpg', 3.50, '', 1, '0', '0', '', '2021-11-25 10:28:47', '', '2021-11-30 23:14:12');
INSERT INTO `rice_dish` VALUES (79, 100, '黄金鸡肉卷', '/profile/upload/2021/11/25/dd708e93-4b93-45dd-ae13-e569ce714369.jpg', 4.00, '', 1, '0', '0', '', '2021-11-25 10:30:04', '', '2021-11-25 10:39:15');
INSERT INTO `rice_dish` VALUES (80, 101, '玉米布丁酥', '/profile/upload/2021/11/25/bb94e506-ab4e-458a-bf03-cf64f327d20d.JPG', 3.00, ',1,1', 1, '0', '0', '', '2021-11-25 10:30:45', '', '2021-11-30 23:18:46');
INSERT INTO `rice_dish` VALUES (81, 100, '鸡肉洋葱圈', '/profile/upload/2021/11/25/9c693871-94f7-4dec-a3bb-4729d9ecd69b.jpg', 3.50, ',0,4,1,2,3', 1, '0', '0', '', '2021-11-25 10:31:21', '', '2021-11-30 23:14:22');
INSERT INTO `rice_dish` VALUES (82, 100, '时菜香菇鸡肉饼', '/profile/upload/2021/11/25/2f90c683-79bf-4d06-98e6-5533646cddce.jpg', 3.50, ',6,2,3', 1, '0', '0', '', '2021-11-25 10:32:06', '', '2021-11-30 23:14:37');
INSERT INTO `rice_dish` VALUES (83, 100, '川菜回锅肉', '/profile/upload/2021/11/25/3514e25e-16ab-4539-a635-d985475de0eb.jpg', 4.50, ',5,1,4,6,2,3', 1, '0', '0', '', '2021-11-25 10:32:46', '', '2021-11-30 23:14:41');
INSERT INTO `rice_dish` VALUES (84, 131, '酸甜闷排骨', '/profile/upload/2021/11/25/b12b79e6-531a-48e4-bfb0-7495b0968ba7.jpg', 5.00, '', 1, '0', '0', '', '2021-11-25 10:33:26', '', '2021-11-30 23:25:54');
INSERT INTO `rice_dish` VALUES (85, 100, '毛氏红烧肉', '/profile/upload/2021/11/25/2ad1bc40-713d-4066-8607-63d7afe12144.jpg', 5.00, ',3,2,5', 1, '0', '0', '', '2021-11-25 10:41:05', '', '2021-11-25 10:46:45');
INSERT INTO `rice_dish` VALUES (86, 100, '时菜炒猪肝', '/profile/upload/2021/11/25/51b57dcd-cdbe-4b7b-bffd-438201f3db2f.jpg', 3.50, ',1,5', 1, '0', '0', '', '2021-11-25 10:41:33', '', '2021-11-25 10:51:55');
INSERT INTO `rice_dish` VALUES (87, 100, '淮山炒肉片', '/profile/upload/2021/11/25/2a908a35-ba6b-4718-90b4-dd931a15c671.jpg', 4.50, ',6,2', 1, '0', '0', '', '2021-11-25 10:42:05', '', '2021-11-25 10:52:45');
INSERT INTO `rice_dish` VALUES (88, 100, '土豆蒸扣肉', '/profile/upload/2021/11/25/db02b968-fb69-4c78-9dc6-5f5f6e9bf592.jpg', 5.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:42:32', '', '2021-11-30 23:29:30');
INSERT INTO `rice_dish` VALUES (89, 100, '酸甜里脊肉', '/profile/upload/2021/11/25/b171fef2-026a-4372-ac75-7804eeaa1f82.jpg', 5.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:43:28', '', '2021-11-25 10:53:57');
INSERT INTO `rice_dish` VALUES (90, 100, '干煸豆角肉丝', '/profile/upload/2021/11/25/1ee210b9-2370-411a-9fa6-8515b5e37060.jpg', 4.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:44:05', '', '2021-11-25 10:54:20');
INSERT INTO `rice_dish` VALUES (91, 100, '炒香菇鸡肉片', '/profile/upload/2021/11/25/de1d975b-7f45-4d4b-9d3f-889f8fb7ce0b.jpg', 4.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:45:41', '', '2021-11-30 23:15:42');
INSERT INTO `rice_dish` VALUES (92, 131, '手撕鸡', '/profile/upload/2021/11/25/93abb03e-f5a9-4850-8ec4-6d8850a03865.jpg', 5.00, '0,1,2,3,4,5', 1, '0', '0', '', '2021-11-25 10:46:55', '', '2021-11-30 23:25:37');
INSERT INTO `rice_dish` VALUES (93, 100, '木耳鸡', '/profile/upload/2021/11/25/b82ffb9f-b8d8-447f-8a30-887936822dec.jpg', 3.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:49:39', '', '2021-11-30 23:15:35');
INSERT INTO `rice_dish` VALUES (94, 100, '辣子鸡', '/profile/upload/2021/11/25/2036630d-031a-408b-a06d-7c32a8d18ab9.jpg', 4.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:49:55', '', '2021-11-30 23:15:29');
INSERT INTO `rice_dish` VALUES (95, 100, '口水鸡', '/profile/upload/2021/11/25/893b5d9b-efef-49b3-81c4-9a869ee335e3.jpg', 5.00, '0,1,2,3,4,5,6', 2, '0', '0', '', '2021-11-25 10:50:11', '', '2021-11-30 23:15:21');
INSERT INTO `rice_dish` VALUES (96, 100, '宫保鸡丁', '/profile/upload/2021/11/25/1be480a6-c53d-41e8-9d42-c5017bcd6fa4.jpg', 3.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:50:40', '', '2021-11-25 10:51:30');
INSERT INTO `rice_dish` VALUES (97, 100, '香菇蒸鸡', '/profile/upload/2021/11/25/28483e2b-1b2f-4f2d-8831-56d9d418657c.jpg', 4.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:51:45', '', '2021-11-25 10:53:30');
INSERT INTO `rice_dish` VALUES (98, 100, '土豆鸡肉片', '/profile/upload/2021/11/25/dd72d1de-8222-4fe3-8fd7-473aff79668f.jpg', 3.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:52:03', '', '2021-11-30 23:15:15');
INSERT INTO `rice_dish` VALUES (99, 100, '鱼香鸡肉丝', '/profile/upload/2021/11/25/30dba0f2-858c-442f-9ecb-3f72bac52f16.jpg', 4.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:52:22', '', '2021-11-25 10:54:46');
INSERT INTO `rice_dish` VALUES (100, 100, '时菜鸡肉片', '/profile/upload/2021/11/25/d4380cc4-334c-4f8a-90d6-fe4243e26ffa.jpg', 4.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:52:48', '', '2021-11-25 10:57:24');
INSERT INTO `rice_dish` VALUES (101, 131, '炸鸡小腿', '/profile/upload/2021/11/25/4088ea45-095d-41e1-aaf0-c1070737ada1.jpg', 3.00, '', 1, '0', '0', '', '2021-11-25 10:53:30', '', '2021-11-30 23:26:05');
INSERT INTO `rice_dish` VALUES (102, 100, '子姜炒鸭', '/profile/upload/2021/11/25/356c0e9d-99e5-4ecd-957e-5396416a8988.jpg', 4.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:54:30', '', '2021-11-25 10:55:52');
INSERT INTO `rice_dish` VALUES (103, 100, '酸菜鸭', '/profile/upload/2021/11/25/40545f87-c3ef-48b1-a1a7-0f36635ce4fd.jpg', 3.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:54:56', '', '2021-11-30 23:15:57');
INSERT INTO `rice_dish` VALUES (104, 100, '土豆鸭', '/profile/upload/2021/11/25/4c4200a8-6492-4998-a29d-2e814c4f8302.jpg', 3.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:55:23', '', '2021-11-30 23:15:51');
INSERT INTO `rice_dish` VALUES (105, 100, '鸭喉', '/profile/upload/2021/11/25/634f76d9-81ea-4598-9a73-73ded45ca11b.jpg', 3.50, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:55:53', '', '2021-11-30 23:16:16');
INSERT INTO `rice_dish` VALUES (106, 100, '鸭心', '/profile/upload/2021/11/25/34a41306-69e6-470f-828b-c6cee84d9ba9.jpg', 3.00, '0,1,2,3,4,5,6', 1, '0', '0', '', '2021-11-25 10:56:09', '', '2021-11-30 23:16:10');
INSERT INTO `rice_dish` VALUES (107, 131, '烧鸭腿', '/profile/upload/2021/11/25/463daff0-03ac-4daa-a6ef-1f8dd855f031.jpg', 5.00, '', 1, '0', '0', '', '2021-11-25 10:56:46', '', '2021-11-30 23:26:10');
INSERT INTO `rice_dish` VALUES (108, 131, '鸭肠', '/profile/upload/2021/11/25/00a52a5a-cd47-42b2-9421-95d25189b87c.jpg', 4.00, ',2,3,4,5,6,1,0', 1, '0', '0', '', '2021-11-25 10:57:05', '', '2021-11-30 23:26:15');
INSERT INTO `rice_dish` VALUES (109, 100, '时菜火腿片', '/profile/upload/2021/11/25/d79ef4e9-6372-4dec-9397-faaf3d2338e3.jpg', 3.00, '0,1,2,3,4,5', 1, '0', '0', '', '2021-11-25 10:57:31', '', '2021-11-30 23:16:05');

-- ----------------------------
-- Table structure for rice_dish_order
-- ----------------------------
DROP TABLE IF EXISTS `rice_dish_order`;
CREATE TABLE `rice_dish_order`  (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `dish_id` bigint(20) NOT NULL COMMENT '菜品id',
  `number` int(11) NULL DEFAULT NULL COMMENT '菜品数量',
  PRIMARY KEY (`order_id`, `dish_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜品订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rice_dish_order
-- ----------------------------
INSERT INTO `rice_dish_order` VALUES (1, 1, 2);
INSERT INTO `rice_dish_order` VALUES (1, 6, 1);
INSERT INTO `rice_dish_order` VALUES (1, 8, 2);
INSERT INTO `rice_dish_order` VALUES (2, 10, 1);
INSERT INTO `rice_dish_order` VALUES (3, 1, 1);
INSERT INTO `rice_dish_order` VALUES (3, 11, 1);
INSERT INTO `rice_dish_order` VALUES (4, 6, 1);
INSERT INTO `rice_dish_order` VALUES (4, 8, 1);
INSERT INTO `rice_dish_order` VALUES (5, 10, 1);
INSERT INTO `rice_dish_order` VALUES (5, 11, 1);
INSERT INTO `rice_dish_order` VALUES (6, 1, 1);
INSERT INTO `rice_dish_order` VALUES (6, 6, 1);
INSERT INTO `rice_dish_order` VALUES (7, 8, 1);
INSERT INTO `rice_dish_order` VALUES (7, 10, 1);
INSERT INTO `rice_dish_order` VALUES (8, 11, 1);
INSERT INTO `rice_dish_order` VALUES (9, 1, 1);
INSERT INTO `rice_dish_order` VALUES (10, 6, 1);
INSERT INTO `rice_dish_order` VALUES (11, 8, 1);
INSERT INTO `rice_dish_order` VALUES (12, 10, 1);
INSERT INTO `rice_dish_order` VALUES (13, 11, 1);
INSERT INTO `rice_dish_order` VALUES (26, 1, 2);
INSERT INTO `rice_dish_order` VALUES (26, 6, 3);
INSERT INTO `rice_dish_order` VALUES (27, 8, 2);
INSERT INTO `rice_dish_order` VALUES (27, 10, 3);
INSERT INTO `rice_dish_order` VALUES (28, 1, 3);
INSERT INTO `rice_dish_order` VALUES (28, 11, 2);
INSERT INTO `rice_dish_order` VALUES (29, 6, 2);
INSERT INTO `rice_dish_order` VALUES (29, 8, 3);
INSERT INTO `rice_dish_order` VALUES (32, 12, 1);
INSERT INTO `rice_dish_order` VALUES (32, 14, 1);
INSERT INTO `rice_dish_order` VALUES (32, 18, 1);
INSERT INTO `rice_dish_order` VALUES (32, 22, 3);
INSERT INTO `rice_dish_order` VALUES (33, 18, 1);
INSERT INTO `rice_dish_order` VALUES (33, 22, 3);
INSERT INTO `rice_dish_order` VALUES (33, 36, 1);
INSERT INTO `rice_dish_order` VALUES (33, 39, 1);
INSERT INTO `rice_dish_order` VALUES (34, 18, 1);
INSERT INTO `rice_dish_order` VALUES (34, 22, 3);
INSERT INTO `rice_dish_order` VALUES (34, 36, 1);
INSERT INTO `rice_dish_order` VALUES (34, 39, 1);
INSERT INTO `rice_dish_order` VALUES (35, 18, 1);
INSERT INTO `rice_dish_order` VALUES (35, 22, 3);
INSERT INTO `rice_dish_order` VALUES (35, 36, 1);
INSERT INTO `rice_dish_order` VALUES (35, 39, 1);
INSERT INTO `rice_dish_order` VALUES (36, 18, 1);
INSERT INTO `rice_dish_order` VALUES (36, 22, 3);
INSERT INTO `rice_dish_order` VALUES (36, 36, 1);
INSERT INTO `rice_dish_order` VALUES (36, 39, 1);
INSERT INTO `rice_dish_order` VALUES (37, 18, 1);
INSERT INTO `rice_dish_order` VALUES (37, 22, 3);
INSERT INTO `rice_dish_order` VALUES (37, 36, 1);
INSERT INTO `rice_dish_order` VALUES (37, 39, 1);
INSERT INTO `rice_dish_order` VALUES (38, 18, 1);
INSERT INTO `rice_dish_order` VALUES (38, 22, 3);
INSERT INTO `rice_dish_order` VALUES (38, 36, 1);
INSERT INTO `rice_dish_order` VALUES (38, 39, 1);
INSERT INTO `rice_dish_order` VALUES (39, 18, 1);
INSERT INTO `rice_dish_order` VALUES (39, 22, 3);
INSERT INTO `rice_dish_order` VALUES (39, 36, 1);
INSERT INTO `rice_dish_order` VALUES (39, 39, 1);
INSERT INTO `rice_dish_order` VALUES (40, 18, 1);
INSERT INTO `rice_dish_order` VALUES (40, 22, 3);
INSERT INTO `rice_dish_order` VALUES (40, 36, 1);
INSERT INTO `rice_dish_order` VALUES (40, 39, 1);
INSERT INTO `rice_dish_order` VALUES (41, 1, 1);
INSERT INTO `rice_dish_order` VALUES (42, 1, 1);
INSERT INTO `rice_dish_order` VALUES (43, 1, 1);
INSERT INTO `rice_dish_order` VALUES (44, 1, 1);
INSERT INTO `rice_dish_order` VALUES (45, 1, 1);
INSERT INTO `rice_dish_order` VALUES (46, 1, 1);
INSERT INTO `rice_dish_order` VALUES (46, 11, 2);
INSERT INTO `rice_dish_order` VALUES (47, 95, 5);

-- ----------------------------
-- Table structure for rice_dish_type
-- ----------------------------
DROP TABLE IF EXISTS `rice_dish_type`;
CREATE TABLE `rice_dish_type`  (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜品类型id',
  `type_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '数据状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜品类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rice_dish_type
-- ----------------------------
INSERT INTO `rice_dish_type` VALUES (100, '肉菜', '0', '0', '', '2021-10-05 17:26:56', '', '2022-07-27 16:32:16');
INSERT INTO `rice_dish_type` VALUES (101, '素菜', '0', '0', '', '2021-10-05 17:26:56', '', '2021-11-30 23:12:30');
INSERT INTO `rice_dish_type` VALUES (102, '肉垫菜', '0', '2', '', '2021-10-24 08:59:24', '', '2021-11-17 22:00:08');
INSERT INTO `rice_dish_type` VALUES (103, '鱼', '0', '0', '', '2021-10-24 11:14:23', '', '2021-11-30 23:12:25');
INSERT INTO `rice_dish_type` VALUES (104, '牛肉', '0', '2', '', '2021-10-24 21:33:54', '', '2021-11-24 08:45:02');
INSERT INTO `rice_dish_type` VALUES (105, '猪肉', '0', '2', '', '2021-10-24 21:47:10', '', '2021-11-17 22:00:25');
INSERT INTO `rice_dish_type` VALUES (123, '凉拌菜类', '0', '0', '', '2021-11-21 16:32:40', '', '2021-11-30 23:11:43');
INSERT INTO `rice_dish_type` VALUES (124, '酿菜类', '0', '0', '', '2021-11-21 16:32:58', '', '2021-11-30 23:11:49');
INSERT INTO `rice_dish_type` VALUES (125, '鱼类', '0', '2', '', '2021-11-21 16:33:15', '', '2021-11-21 16:33:41');
INSERT INTO `rice_dish_type` VALUES (126, '鸡蛋类', '0', '0', '', '2021-11-21 16:33:25', '', '2021-11-30 23:11:57');
INSERT INTO `rice_dish_type` VALUES (127, '肉末', '0', '0', '', '2021-11-21 16:33:56', '', '2021-11-30 23:12:03');
INSERT INTO `rice_dish_type` VALUES (128, '青菜类', '0', '2', '', '2021-11-21 16:34:03', '', '2021-11-30 23:12:09');
INSERT INTO `rice_dish_type` VALUES (129, '卤菜类', '0', '0', '', '2021-11-21 16:35:09', '', '2021-11-30 23:12:14');
INSERT INTO `rice_dish_type` VALUES (130, '牛肉类', '0', '2', '', '2021-11-21 16:35:18', '', NULL);
INSERT INTO `rice_dish_type` VALUES (131, '肉类', '0', '0', '', '2021-11-21 16:35:52', '', '2021-11-30 23:12:20');
INSERT INTO `rice_dish_type` VALUES (132, ' 肉末', '0', '2', '', '2021-11-24 08:23:26', '', NULL);
INSERT INTO `rice_dish_type` VALUES (133, '米饭', '0', '0', '', '2021-11-25 12:26:26', '', '2021-11-30 23:12:43');
INSERT INTO `rice_dish_type` VALUES (134, '饮料', '0', '0', '', '2021-11-25 12:26:41', '', '2021-11-30 23:12:47');
INSERT INTO `rice_dish_type` VALUES (135, 'test', '0', '2', '', '2021-12-02 00:21:27', '', '2021-12-02 00:21:46');

-- ----------------------------
-- Table structure for rice_gift
-- ----------------------------
DROP TABLE IF EXISTS `rice_gift`;
CREATE TABLE `rice_gift`  (
  `gift_id` bigint(20) NOT NULL COMMENT '礼品id',
  `gift_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '礼品名称',
  `point` int(11) NULL DEFAULT NULL COMMENT '礼品所需积分',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '数据状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`gift_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '礼品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rice_gift
-- ----------------------------

-- ----------------------------
-- Table structure for rice_order
-- ----------------------------
DROP TABLE IF EXISTS `rice_order`;
CREATE TABLE `rice_order`  (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `order_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `meal_number` int(11) NULL DEFAULT NULL COMMENT '取餐号',
  `canteen_id` bigint(20) NULL DEFAULT NULL COMMENT '就餐食堂id',
  `order_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单价格合计',
  `order_paid` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单实付',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '订单状态（0未处理 1已完成 2处理失败 3已取消）',
  `error_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '处理失败原因',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rice_order
-- ----------------------------
INSERT INTO `rice_order` VALUES (1, 1, '2021112220352402', 1, 1, 20.00, 20.00, '2', '菜品无剩余', '0', '2021-11-05 22:42:10');
INSERT INTO `rice_order` VALUES (2, 1, '2021112220352302', 2, 1, 12.00, 12.00, '2', '', '0', '2021-11-12 15:24:54');
INSERT INTO `rice_order` VALUES (3, 1, '2021112220352202', 3, 2, 9.00, 9.00, '1', '', '0', '2021-11-14 17:53:14');
INSERT INTO `rice_order` VALUES (4, 1, '2021112220352102', 4, 3, 10.70, 10.70, '1', '', '0', '2021-11-14 17:54:19');
INSERT INTO `rice_order` VALUES (5, 1, '2021112220353902', 5, 2, 11.30, 11.30, '1', '', '0', '2021-11-14 17:54:28');
INSERT INTO `rice_order` VALUES (6, 1, '2021112220353802', 6, 1, 12.40, 12.40, '1', '', '0', '2021-11-15 18:25:02');
INSERT INTO `rice_order` VALUES (7, 1, '2021112220353702', 7, 2, 8.20, 8.20, '1', '', '0', '2021-11-15 18:27:04');
INSERT INTO `rice_order` VALUES (8, 1, '2021112220353602', 2, 2, 9.30, 9.30, '1', '', '0', '2021-11-17 20:37:06');
INSERT INTO `rice_order` VALUES (9, 1, '2021112220353502', 8, 3, 9.00, 9.00, '1', '', '0', '2021-11-17 20:40:14');
INSERT INTO `rice_order` VALUES (10, 1, '2021112220353402', 9, 1, 13.00, 13.00, '2', '菜品无剩余', '0', '2021-11-17 20:40:20');
INSERT INTO `rice_order` VALUES (12, 1, '2021112220353302', 10, 1, 12.10, 12.10, '1', '', '0', '2021-11-17 22:48:57');
INSERT INTO `rice_order` VALUES (13, 1, '2021112220353202', 11, 1, 11.40, 11.40, '1', '', '0', '2021-11-18 22:49:09');
INSERT INTO `rice_order` VALUES (26, 1, '2021112219595602', 1, 1, 25.50, 25.50, '1', '', '0', '2021-11-22 19:59:56');
INSERT INTO `rice_order` VALUES (27, 1, '2021112220085402', 2, 1, 25.50, 25.50, '1', '', '0', '2021-11-22 20:08:55');
INSERT INTO `rice_order` VALUES (28, 1, '2021112220263802', 3, 1, 25.50, 25.50, '1', '', '0', '2021-11-22 20:26:38');
INSERT INTO `rice_order` VALUES (29, 1, '2021112220353102', 4, 1, 25.50, 25.50, '1', '', '0', '2021-11-22 20:35:32');
INSERT INTO `rice_order` VALUES (32, 102, '2021120110544702', 1, 1, 9.10, 9.10, '1', '', '0', '2021-12-01 10:54:48');
INSERT INTO `rice_order` VALUES (33, 105, '2021120110552305', 2, 1, 13.10, 13.10, '1', '', '0', '2021-12-01 10:55:24');
INSERT INTO `rice_order` VALUES (34, 105, '2021121015404505', 1, 1, 13.10, 13.10, '1', '', '0', '2021-12-10 15:40:46');
INSERT INTO `rice_order` VALUES (35, 105, '20211210154718ll', 2, 1, 10.70, 10.70, '1', '', '0', '2021-12-10 15:47:19');
INSERT INTO `rice_order` VALUES (36, 136, '2021121015485936', 3, 1, 10.70, 10.70, '1', '', '0', '2021-12-10 15:49:00');
INSERT INTO `rice_order` VALUES (37, 102, '2021121015541702', 4, 1, 10.70, 10.70, '1', '', '0', '2021-12-10 15:54:18');
INSERT INTO `rice_order` VALUES (38, 102, '2021121016001802', 5, 1, 10.70, 10.70, '1', '', '0', '2021-12-10 16:00:19');
INSERT INTO `rice_order` VALUES (39, 136, '2021121016025636', 6, 1, 10.70, NULL, '2', '订单已超时', '0', '2021-12-10 16:02:56');
INSERT INTO `rice_order` VALUES (40, 102, '2021121018520002', 7, 27, 10.70, 10.70, '1', '', '0', '2021-12-10 18:52:00');
INSERT INTO `rice_order` VALUES (41, 136, '2021121111344236', 1, 1, 3.00, 3.00, '1', '', '0', '2021-12-11 11:34:43');
INSERT INTO `rice_order` VALUES (42, 136, '2021121111440036', 2, 1, 3.00, 3.00, '1', '', '0', '2021-12-11 11:44:00');
INSERT INTO `rice_order` VALUES (43, 136, '2021121111452136', 3, 1, 3.00, NULL, '2', '菜品无剩余', '0', '2021-12-11 11:45:21');
INSERT INTO `rice_order` VALUES (44, 136, '2021121111464736', 4, 1, 3.00, 3.00, '1', '', '0', '2021-12-11 11:46:47');
INSERT INTO `rice_order` VALUES (45, 136, '2021121111474136', 5, 1, 3.00, 3.00, '1', '', '0', '2021-12-11 11:47:41');
INSERT INTO `rice_order` VALUES (46, 136, '2021121111493736', 6, 1, 9.00, 9.00, '1', '', '0', '2021-12-11 11:49:38');
INSERT INTO `rice_order` VALUES (47, 136, '2021121111512336', 7, 1, 25.00, 25.00, '1', '', '0', '2021-12-11 11:51:24');

-- ----------------------------
-- Table structure for rice_point
-- ----------------------------
DROP TABLE IF EXISTS `rice_point`;
CREATE TABLE `rice_point`  (
  `point_id` bigint(20) NOT NULL COMMENT '积分id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `point` int(11) NULL DEFAULT NULL COMMENT '积分',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '积分状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`point_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '积分表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rice_point
-- ----------------------------

-- ----------------------------
-- Table structure for rice_ticket
-- ----------------------------
DROP TABLE IF EXISTS `rice_ticket`;
CREATE TABLE `rice_ticket`  (
  `ticket_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '投票id',
  `dish_id` bigint(20) NULL DEFAULT NULL COMMENT '菜品id',
  `ticket_number` int(11) NULL DEFAULT NULL COMMENT '票数',
  `time` int(11) NULL DEFAULT NULL COMMENT '第几期',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ticket_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '投票表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rice_ticket
-- ----------------------------
INSERT INTO `rice_ticket` VALUES (1, 1, 33, 1, '2021-11-09 20:04:37');
INSERT INTO `rice_ticket` VALUES (2, 2, 6, 1, '2021-11-10 16:06:04');
INSERT INTO `rice_ticket` VALUES (3, 4, 3, 1, '2021-11-11 21:07:15');
INSERT INTO `rice_ticket` VALUES (4, 6, 12, 1, '2021-11-11 21:07:15');
INSERT INTO `rice_ticket` VALUES (5, 8, 41, 1, '2021-11-11 21:07:38');
INSERT INTO `rice_ticket` VALUES (6, 9, 1, 1, '2021-11-11 21:07:48');
INSERT INTO `rice_ticket` VALUES (7, 10, 31, 1, '2021-11-11 21:07:15');
INSERT INTO `rice_ticket` VALUES (8, 11, 21, 1, '2021-11-11 21:07:15');
INSERT INTO `rice_ticket` VALUES (9, 12, 23, 1, '2021-11-11 21:07:38');
INSERT INTO `rice_ticket` VALUES (10, 13, 18, 1, '2021-11-11 21:07:48');
INSERT INTO `rice_ticket` VALUES (11, 14, 23, 1, '2021-11-11 20:07:02');
INSERT INTO `rice_ticket` VALUES (12, 15, 32, 1, '2021-11-09 20:04:37');
INSERT INTO `rice_ticket` VALUES (13, 16, 12, 1, '2021-11-10 16:05:43');
INSERT INTO `rice_ticket` VALUES (14, 1, 9, 2, '2021-11-10 16:05:55');
INSERT INTO `rice_ticket` VALUES (15, 2, 44, 2, '2021-11-10 16:06:04');
INSERT INTO `rice_ticket` VALUES (16, 4, 6, 2, '2021-11-10 16:06:04');
INSERT INTO `rice_ticket` VALUES (17, 6, 3, 2, '2021-11-10 16:06:04');
INSERT INTO `rice_ticket` VALUES (18, 8, 12, 2, '2021-11-10 16:06:04');
INSERT INTO `rice_ticket` VALUES (19, 9, 41, 2, '2021-11-10 16:06:04');
INSERT INTO `rice_ticket` VALUES (20, 10, 1, 2, '2021-11-10 16:06:04');
INSERT INTO `rice_ticket` VALUES (21, 11, 31, 2, '2021-11-10 16:06:04');
INSERT INTO `rice_ticket` VALUES (22, 12, 21, 2, '2021-11-10 16:06:04');
INSERT INTO `rice_ticket` VALUES (23, 13, 23, 2, '2021-11-10 16:06:04');
INSERT INTO `rice_ticket` VALUES (24, 14, 18, 2, '2021-11-10 16:06:04');
INSERT INTO `rice_ticket` VALUES (25, 15, 23, 2, '2021-11-10 16:06:04');
INSERT INTO `rice_ticket` VALUES (26, 16, 32, 2, '2021-11-10 16:06:04');
INSERT INTO `rice_ticket` VALUES (27, 1, 44, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (28, 6, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (29, 8, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (30, 10, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (31, 11, 1, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (32, 12, 6, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (33, 13, 2, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (34, 14, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (35, 15, 4, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (36, 16, 1, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (37, 17, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (38, 18, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (39, 19, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (40, 20, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (41, 21, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (42, 22, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (43, 23, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (44, 24, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (45, 25, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (46, 26, 1, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (47, 27, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (48, 28, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (49, 30, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (50, 31, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (51, 32, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (52, 33, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (53, 34, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (54, 35, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (55, 36, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (56, 37, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (57, 38, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (58, 39, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (59, 40, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (60, 41, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (61, 42, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (62, 43, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (63, 44, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (64, 45, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (65, 46, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (66, 47, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (67, 48, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (68, 49, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (69, 50, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (70, 51, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (71, 52, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (72, 53, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (73, 54, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (74, 55, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (75, 56, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (76, 57, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (77, 58, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (78, 59, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (79, 60, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (80, 61, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (81, 62, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (82, 63, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (83, 64, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (84, 65, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (85, 66, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (86, 67, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (87, 68, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (88, 69, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (89, 70, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (90, 71, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (91, 72, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (92, 73, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (93, 74, 1, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (94, 75, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (95, 76, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (96, 77, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (97, 78, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (98, 79, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (99, 80, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (100, 81, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (101, 82, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (102, 83, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (103, 84, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (104, 85, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (105, 86, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (106, 87, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (107, 88, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (108, 89, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (109, 90, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (110, 91, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (111, 92, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (112, 93, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (113, 94, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (114, 95, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (115, 96, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (116, 97, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (117, 98, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (118, 99, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (119, 100, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (120, 101, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (121, 102, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (122, 103, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (123, 104, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (124, 105, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (125, 106, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (126, 107, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (127, 108, 0, 3, '2021-12-01 00:22:23');
INSERT INTO `rice_ticket` VALUES (128, 109, 0, 3, '2021-12-01 00:22:23');

-- ----------------------------
-- Table structure for rice_top
-- ----------------------------
DROP TABLE IF EXISTS `rice_top`;
CREATE TABLE `rice_top`  (
  `top_id` bigint(20) NOT NULL COMMENT '榜单id',
  `dish_id` bigint(20) NULL DEFAULT NULL COMMENT '菜品id',
  `ticket_number` int(11) NULL DEFAULT NULL COMMENT '票数',
  `period` int(11) NULL DEFAULT NULL COMMENT '期数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`top_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '榜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rice_top
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-10-23 21:33:35', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-10-23 21:33:35', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-10-23 21:33:35', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2021-10-23 21:33:35', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-10-23 21:33:35', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '广西民族大学', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-23 21:33:35', 'admin', '2021-10-24 13:23:42');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '广西', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-12-29 12:50:40', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '启用', '0', 'sys_status', '', 'success', 'N', '0', 'admin', '2021-10-23 22:24:12', 'admin', '2021-10-24 09:53:28', NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, '停用', '1', 'sys_status', NULL, 'danger', 'N', '0', 'admin', '2021-10-23 22:24:52', 'admin', '2021-10-23 22:25:01', NULL);
INSERT INTO `sys_dict_data` VALUES (102, 1, '存在', '0', 'sys_del_flag', NULL, 'success', 'N', '0', 'admin', '2021-10-23 22:25:20', 'admin', '2021-10-23 22:25:25', NULL);
INSERT INTO `sys_dict_data` VALUES (103, 2, '已删除', '2', 'sys_del_flag', NULL, 'danger', 'N', '0', 'admin', '2021-10-23 22:25:39', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 0, '未处理', '0', 'order_status', NULL, 'warning', 'N', '0', 'admin', '2021-11-04 11:14:20', 'admin', '2021-11-04 11:15:19', NULL);
INSERT INTO `sys_dict_data` VALUES (106, 1, '已完成', '1', 'order_status', NULL, 'success', 'N', '0', 'admin', '2021-11-04 11:14:40', 'admin', '2021-11-05 23:07:30', NULL);
INSERT INTO `sys_dict_data` VALUES (108, 2, '处理失败', '2', 'order_status', NULL, 'danger', 'N', '0', 'admin', '2021-11-04 11:16:04', 'admin', '2021-11-05 23:07:35', NULL);
INSERT INTO `sys_dict_data` VALUES (109, 3, '已取消', '3', 'order_status', NULL, 'info', 'N', '0', 'admin', '2021-11-05 22:04:37', 'admin', '2021-11-05 23:07:39', NULL);
INSERT INTO `sys_dict_data` VALUES (110, 0, '菜品无剩余', '1', 'order_error', NULL, 'warning', 'N', '0', 'admin', '2021-11-07 10:56:48', 'admin', '2021-11-07 10:57:52', NULL);
INSERT INTO `sys_dict_data` VALUES (111, 1, '食堂已打烊', '2', 'order_error', NULL, 'warning', 'N', '0', 'admin', '2021-11-07 10:58:37', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '表数据状态', 'sys_status', '0', 'admin', '2021-10-23 22:23:11', 'admin', '2021-10-23 22:23:44', '表数据状态列表');
INSERT INTO `sys_dict_type` VALUES (101, '表数据删除标志', 'sys_del_flag', '0', 'admin', '2021-10-23 22:23:35', 'admin', '2021-10-23 22:23:53', '表数据删除标志列表');
INSERT INTO `sys_dict_type` VALUES (102, '订单数据状态', 'order_status', '0', 'admin', '2021-11-04 11:13:13', 'admin', '2021-11-04 11:13:36', '订单状态列表');
INSERT INTO `sys_dict_type` VALUES (103, '订单处理失败原因', 'order_error', '0', 'admin', '2021-11-07 10:56:07', '', NULL, '订单处理失败原因列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-10-23 21:31:48', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/40 * * * * ?', '3', '1', '1', 'admin', '2021-10-23 21:31:48', 'admin', '2021-11-22 14:53:40', '');
INSERT INTO `sys_job` VALUES (100, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-11-07 14:38:14', '', NULL, '');
INSERT INTO `sys_job` VALUES (101, '重置用户每日投票限制数', 'SYSTEM', 'ticketTask.resetUserVotes', '0 0 0 * * ?', '3', '1', '0', 'admin', '2021-11-12 15:37:47', '', '2021-11-13 09:32:39', '');
INSERT INTO `sys_job` VALUES (102, '进入下一期菜品投票', 'SYSTEM', 'ticketTask.resetDishVotes', '0 0 0 1 * ?', '3', '1', '0', 'admin', '2021-11-12 15:40:08', 'admin', '2021-11-13 09:32:41', '');
INSERT INTO `sys_job` VALUES (104, '定时处理超时订单', 'SYSTEM', 'orderTask.resetUserVotes', '0 0/30 * * * ?', '3', '1', '1', 'admin', '2021-12-10 19:28:26', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43948 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (43920, '重置用户每日投票限制数', 'SYSTEM', 'ticketTask.resetUserVotes', '重置用户每日投票限制数 总共耗时：300毫秒', '0', '', '2021-12-01 00:00:00');
INSERT INTO `sys_job_log` VALUES (43921, '进入下一期菜品投票', 'SYSTEM', 'ticketTask.resetDishVotes', '进入下一期菜品投票 总共耗时：113毫秒', '1', 'java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.binding.BindingException: Parameter \'dishId\' not found. Available parameters are [arg0, collection, list]\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:96)\r\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:441)\r\n	at com.sun.proxy.$Proxy115.insert(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemplate.insert(SqlSessionTemplate.java:272)\r\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:62)\r\n	at org.apache.ibatis.binding.MapperProxy$PlainMethodInvoker.invoke(MapperProxy.java:152)\r\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:85)\r\n	at com.sun.proxy.$Proxy138.insertTickets(Unknown Source)\r\n	at com.ruoyi.ticket.service.impl.TicketServiceImpl.resetDishVotes(TicketServiceImpl.java:161)\r\n	at com.ruoyi.quartz.task.TicketTask.resetDishVotes(TicketTask.java:25)\r\n	... 10 more\r\nCaused by: org.apache.ibatis.binding.BindingException: Parameter \'dishId\' not found. Available parameters are [arg0, collection, list]\r\n	at org.apa', '2021-12-01 00:00:01');
INSERT INTO `sys_job_log` VALUES (43922, '进入下一期菜品投票', 'SYSTEM', 'ticketTask.resetDishVotes', '进入下一期菜品投票 总共耗时：254毫秒', '1', 'java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.binding.BindingException: Parameter \'dishId\' not found. Available parameters are [arg0, collection, list]\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:96)\r\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:441)\r\n	at com.sun.proxy.$Proxy115.insert(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemplate.insert(SqlSessionTemplate.java:272)\r\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:62)\r\n	at org.apache.ibatis.binding.MapperProxy$PlainMethodInvoker.invoke(MapperProxy.java:152)\r\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:85)\r\n	at com.sun.proxy.$Proxy138.insertTickets(Unknown Source)\r\n	at com.ruoyi.ticket.service.impl.TicketServiceImpl.resetDishVotes(TicketServiceImpl.java:161)\r\n	at com.ruoyi.quartz.task.TicketTask.resetDishVotes(TicketTask.java:25)\r\n	... 10 more\r\nCaused by: org.apache.ibatis.binding.BindingException: Parameter \'dishId\' not found. Available parameters are [arg0, collection, list]\r\n	at org.apa', '2021-12-01 00:05:19');
INSERT INTO `sys_job_log` VALUES (43923, '进入下一期菜品投票', 'SYSTEM', 'ticketTask.resetDishVotes', '进入下一期菜品投票 总共耗时：35260毫秒', '1', 'java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.binding.BindingException: Parameter \'dishId\' not found. Available parameters are [arg0, collection, list]\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:96)\r\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:441)\r\n	at com.sun.proxy.$Proxy115.insert(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemplate.insert(SqlSessionTemplate.java:272)\r\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:62)\r\n	at org.apache.ibatis.binding.MapperProxy$PlainMethodInvoker.invoke(MapperProxy.java:152)\r\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:85)\r\n	at com.sun.proxy.$Proxy138.insertTickets(Unknown Source)\r\n	at com.ruoyi.ticket.service.impl.TicketServiceImpl.resetDishVotes(TicketServiceImpl.java:161)\r\n	at com.ruoyi.quartz.task.TicketTask.resetDishVotes(TicketTask.java:25)\r\n	... 10 more\r\nCaused by: org.apache.ibatis.binding.BindingException: Parameter \'dishId\' not found. Available parameters are [arg0, collection, list]\r\n	at org.apa', '2021-12-01 00:07:05');
INSERT INTO `sys_job_log` VALUES (43924, '进入下一期菜品投票', 'SYSTEM', 'ticketTask.resetDishVotes', '进入下一期菜品投票 总共耗时：4126毫秒', '1', 'java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: org.springframework.jdbc.BadSqlGrammarException: \r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \' \n            6,\n            0,\n            3,\n            \'2021-12-01 00:09:36.\' at line 9\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\企业项目实践\\代码\\rice-point\\rice-ticket\\target\\classes\\mapper\\ticket\\TicketMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into rice_ticket          ( dish_id,ticket_number,`time`,create_time )          values          (               ?,             ?,             ?,             ?,          ,              ?,             ?,             ?,             ?,          ,              ?,             ?,             ?,             ?,          ,              ?,             ?,             ?,             ?,          ,              ?,             ?,             ?,             ?,          ,              ?,             ?,             ?,             ?,          ,              ?,        ', '2021-12-01 00:09:37');
INSERT INTO `sys_job_log` VALUES (43925, '进入下一期菜品投票', 'SYSTEM', 'ticketTask.resetDishVotes', '进入下一期菜品投票 总共耗时：457毫秒', '1', 'java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: org.springframework.jdbc.BadSqlGrammarException: \r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\n         , \n            (6,0,3,\'2021-12-01 00:11:50.081\',)\n         , \n       \' at line 5\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\企业项目实践\\代码\\rice-point\\rice-ticket\\target\\classes\\mapper\\ticket\\TicketMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into rice_ticket          ( dish_id,ticket_number,`time`,create_time )          values                        (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,   ', '2021-12-01 00:11:50');
INSERT INTO `sys_job_log` VALUES (43926, '进入下一期菜品投票', 'SYSTEM', 'ticketTask.resetDishVotes', '进入下一期菜品投票 总共耗时：390毫秒', '1', 'java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: org.springframework.jdbc.BadSqlGrammarException: \r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\n         , \n            (6,0,3,\'2021-12-01 00:19:36.805\',)\n         , \n       \' at line 5\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\企业项目实践\\代码\\rice-point\\rice-ticket\\target\\classes\\mapper\\ticket\\TicketMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into rice_ticket          ( dish_id,ticket_number,`time`,create_time )          values                        (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,              (?,?,?,?,)          ,   ', '2021-12-01 00:19:37');
INSERT INTO `sys_job_log` VALUES (43927, '进入下一期菜品投票', 'SYSTEM', 'ticketTask.resetDishVotes', '进入下一期菜品投票 总共耗时：394毫秒', '0', '', '2021-12-01 00:22:23');
INSERT INTO `sys_job_log` VALUES (43928, '重置用户每日投票限制数', 'SYSTEM', 'ticketTask.resetUserVotes', '重置用户每日投票限制数 总共耗时：251毫秒', '0', '', '2021-12-02 00:00:01');
INSERT INTO `sys_job_log` VALUES (43929, '重置用户每日投票限制数', 'SYSTEM', 'ticketTask.resetUserVotes', '重置用户每日投票限制数 总共耗时：347毫秒', '0', '', '2021-12-03 00:00:01');
INSERT INTO `sys_job_log` VALUES (43930, '重置用户每日投票限制数', 'SYSTEM', 'ticketTask.resetUserVotes', '重置用户每日投票限制数 总共耗时：291毫秒', '0', '', '2021-12-04 00:00:00');
INSERT INTO `sys_job_log` VALUES (43931, '重置用户每日投票限制数', 'SYSTEM', 'ticketTask.resetUserVotes', '重置用户每日投票限制数 总共耗时：317毫秒', '0', '', '2021-12-05 00:00:01');
INSERT INTO `sys_job_log` VALUES (43932, '重置用户每日投票限制数', 'SYSTEM', 'ticketTask.resetUserVotes', '重置用户每日投票限制数 总共耗时：85毫秒', '0', '', '2021-12-06 00:00:00');
INSERT INTO `sys_job_log` VALUES (43933, '重置用户每日投票限制数', 'SYSTEM', 'ticketTask.resetUserVotes', '重置用户每日投票限制数 总共耗时：326毫秒', '0', '', '2021-12-07 00:00:01');
INSERT INTO `sys_job_log` VALUES (43934, '重置用户每日投票限制数', 'SYSTEM', 'ticketTask.resetUserVotes', '重置用户每日投票限制数 总共耗时：324毫秒', '0', '', '2021-12-08 00:00:00');
INSERT INTO `sys_job_log` VALUES (43935, '重置用户每日投票限制数', 'SYSTEM', 'ticketTask.resetUserVotes', '重置用户每日投票限制数 总共耗时：77毫秒', '0', '', '2021-12-09 00:00:00');
INSERT INTO `sys_job_log` VALUES (43936, '重置用户每日投票限制数', 'SYSTEM', 'ticketTask.resetUserVotes', '重置用户每日投票限制数 总共耗时：62毫秒', '0', '', '2021-12-10 00:00:00');
INSERT INTO `sys_job_log` VALUES (43937, '定时处理超时订单', 'SYSTEM', 'orderTask.resetUserVotes', '定时处理超时订单 总共耗时：32毫秒', '0', '', '2021-12-10 19:28:50');
INSERT INTO `sys_job_log` VALUES (43938, '定时处理超时订单', 'SYSTEM', 'orderTask.resetUserVotes', '定时处理超时订单 总共耗时：35122毫秒', '0', '', '2021-12-10 19:31:03');
INSERT INTO `sys_job_log` VALUES (43939, '定时处理超时订单', 'SYSTEM', 'orderTask.resetUserVotes', '定时处理超时订单 总共耗时：24500毫秒', '0', '', '2021-12-10 19:32:13');
INSERT INTO `sys_job_log` VALUES (43940, '定时处理超时订单', 'SYSTEM', 'orderTask.resetUserVotes', '定时处理超时订单 总共耗时：159毫秒', '0', '', '2021-12-10 19:33:01');
INSERT INTO `sys_job_log` VALUES (43941, '定时处理超时订单', 'SYSTEM', 'orderTask.resetUserVotes', '定时处理超时订单 总共耗时：142毫秒', '0', '', '2021-12-10 19:33:17');
INSERT INTO `sys_job_log` VALUES (43942, '定时处理超时订单', 'SYSTEM', 'orderTask.resetUserVotes', '定时处理超时订单 总共耗时：38731毫秒', '0', '', '2021-12-10 19:34:04');
INSERT INTO `sys_job_log` VALUES (43943, '定时处理超时订单', 'SYSTEM', 'orderTask.resetUserVotes', '定时处理超时订单 总共耗时：46808毫秒', '0', '', '2021-12-10 19:35:39');
INSERT INTO `sys_job_log` VALUES (43944, '定时处理超时订单', 'SYSTEM', 'orderTask.resetUserVotes', '定时处理超时订单 总共耗时：22673毫秒', '0', '', '2021-12-10 19:36:58');
INSERT INTO `sys_job_log` VALUES (43945, '定时处理超时订单', 'SYSTEM', 'orderTask.resetUserVotes', '定时处理超时订单 总共耗时：2175毫秒', '0', '', '2021-12-10 19:37:32');
INSERT INTO `sys_job_log` VALUES (43946, '重置用户每日投票限制数', 'SYSTEM', 'ticketTask.resetUserVotes', '重置用户每日投票限制数 总共耗时：322毫秒', '0', '', '2021-12-11 00:00:01');
INSERT INTO `sys_job_log` VALUES (43947, '重置用户每日投票限制数', 'SYSTEM', 'ticketTask.resetUserVotes', '重置用户每日投票限制数 总共耗时：280毫秒', '0', '', '2021-12-12 00:00:00');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2039 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-10-23 21:33:35', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2021-10-23 21:33:35', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '1', '0', '', 'tool', 'admin', '2021-10-23 21:33:35', 'admin', '2022-12-29 12:34:08', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-10-23 21:33:35', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-10-23 21:33:35', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-10-23 21:33:35', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '院校管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2021-10-23 21:33:35', 'admin', '2022-12-29 12:49:49', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '1', '0', 'system:post:list', 'post', 'admin', '2021-10-23 21:33:35', '1188596300', '2021-12-10 15:05:05', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '1', '0', 'system:dict:list', 'dict', 'admin', '2021-10-23 21:33:35', '1188596300', '2021-12-10 15:05:16', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '1', '0', 'system:config:list', 'edit', 'admin', '2021-10-23 21:33:35', '1188596300', '2021-12-10 15:05:21', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '1', '0', 'system:notice:list', 'message', 'admin', '2021-10-23 21:33:35', '1188596300', '2021-12-10 15:05:24', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-10-23 21:33:35', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2021-10-23 21:33:35', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2021-10-23 21:33:35', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2021-10-23 21:33:35', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2021-10-23 21:33:35', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2021-10-23 21:33:35', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-10-23 21:33:35', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-10-23 21:33:35', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-10-23 21:33:35', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2021-10-23 21:33:35', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2021-10-23 21:33:35', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '食堂管理', 0, 4, 'canteen/info', 'canteen/info/index', NULL, 1, 0, 'C', '0', '0', 'canteen:info:list', 'build', 'admin', '2021-10-23 21:57:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '菜品管理', 0, 5, 'dish', '', NULL, 1, 0, 'M', '0', '0', '', 'table', 'admin', '2021-10-23 21:58:33', 'admin', '2021-10-23 22:11:17', '');
INSERT INTO `sys_menu` VALUES (2002, '订单管理', 0, 6, 'order', NULL, NULL, 1, 0, 'M', '0', '0', '', 'date', 'admin', '2021-10-23 22:05:28', 'admin', '2021-11-04 12:59:35', '');
INSERT INTO `sys_menu` VALUES (2003, '订单处理', 2002, 6, 'order', 'order/order/index', NULL, 1, 0, 'C', '0', '0', 'order:order:list', 'checkbox', 'admin', '2021-10-23 22:06:48', 'admin', '2021-11-04 13:03:23', '');
INSERT INTO `sys_menu` VALUES (2004, '菜品类型', 2001, 1, 'type', 'dish/type/index', NULL, 1, 0, 'C', '0', '0', 'dish:type:list', 'nested', 'admin', '2021-10-23 22:07:54', 'admin', '2021-10-23 22:11:44', '');
INSERT INTO `sys_menu` VALUES (2006, '导出食堂信息', 2000, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'canteen:info:export', '#', 'admin', '2021-10-23 22:13:04', 'admin', '2021-10-23 22:15:02', '');
INSERT INTO `sys_menu` VALUES (2008, '新增食堂信息', 2000, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'canteen:info:add', '#', 'admin', '2021-10-23 22:13:37', 'admin', '2021-10-23 22:17:36', '');
INSERT INTO `sys_menu` VALUES (2009, '修改食堂信息', 2000, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'canteen:info:edit', '#', 'admin', '2021-10-23 22:13:51', 'admin', '2021-10-23 22:17:41', '');
INSERT INTO `sys_menu` VALUES (2010, '删除食堂信息', 2000, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'canteen:info:remove', '#', 'admin', '2021-10-23 22:14:05', 'admin', '2021-10-23 22:17:45', '');
INSERT INTO `sys_menu` VALUES (2011, '食堂信息列表', 2000, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'canteen:info:list', '#', 'admin', '2021-10-23 22:14:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '菜品类型列表', 2004, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dish:type:list', '#', 'admin', '2021-10-23 22:16:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '导出菜品类型', 2004, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dish:type:export', '#', 'admin', '2021-10-23 22:16:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '新增菜品类型', 2004, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dish:type:add', '#', 'admin', '2021-10-23 22:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '修改菜品类型', 2004, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dish:type:edit', '#', 'admin', '2021-10-23 22:17:20', 'admin', '2021-10-23 22:17:29', '');
INSERT INTO `sys_menu` VALUES (2016, '删除菜品类型', 2004, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dish:type:remove', '#', 'admin', '2021-10-23 22:18:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '菜品信息', 2001, 2, 'dish', 'dish/dish/index', NULL, 1, 0, 'C', '0', '0', 'dish:dish:list', 'color', 'admin', '2021-10-23 22:20:13', 'admin', '2021-10-23 22:20:56', '');
INSERT INTO `sys_menu` VALUES (2018, '菜品查询', 2017, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'dish:dish:query', '#', 'admin', '2021-10-23 22:46:52', 'admin', '2021-10-23 22:47:46', '');
INSERT INTO `sys_menu` VALUES (2019, '菜品新增', 2017, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'dish:dish:add', '#', 'admin', '2021-10-23 22:46:52', 'admin', '2021-10-23 22:47:51', '');
INSERT INTO `sys_menu` VALUES (2020, '菜品修改', 2017, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'dish:dish:edit', '#', 'admin', '2021-10-23 22:46:52', 'admin', '2021-10-23 22:47:55', '');
INSERT INTO `sys_menu` VALUES (2021, '菜品删除', 2017, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'dish:dish:remove', '#', 'admin', '2021-10-23 22:46:53', 'admin', '2021-10-23 22:47:59', '');
INSERT INTO `sys_menu` VALUES (2022, '菜品导出', 2017, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'dish:dish:export', '#', 'admin', '2021-10-23 22:46:53', 'admin', '2021-10-23 22:47:38', '');
INSERT INTO `sys_menu` VALUES (2023, '投票统计', 0, 7, 'info', 'ticket/info/index', NULL, 1, 0, 'C', '0', '0', 'ticket:info:list', 'button', 'admin', '2021-10-23 23:11:33', 'admin', '2021-11-11 21:06:41', '投票信息菜单');
INSERT INTO `sys_menu` VALUES (2024, '投票信息查询', 2023, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'ticket:info:query', '#', 'admin', '2021-10-23 23:11:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '投票信息新增', 2023, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'ticket:info:add', '#', 'admin', '2021-10-23 23:11:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '投票信息修改', 2023, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'ticket:info:edit', '#', 'admin', '2021-10-23 23:11:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '投票信息删除', 2023, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'ticket:info:remove', '#', 'admin', '2021-10-23 23:11:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '投票信息导出', 2023, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'ticket:info:export', '#', 'admin', '2021-10-23 23:11:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '订单查询', 2003, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'order:order:query', '#', 'admin', '2021-11-04 13:04:27', 'admin', '2021-11-04 13:04:49', '');
INSERT INTO `sys_menu` VALUES (2030, '订单新增', 2003, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'order:order:add', '#', 'admin', '2021-11-04 13:04:27', 'admin', '2021-11-04 13:04:56', '');
INSERT INTO `sys_menu` VALUES (2031, '订单修改', 2003, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'order:order:edit', '#', 'admin', '2021-11-04 13:04:27', 'admin', '2021-11-04 13:05:01', '');
INSERT INTO `sys_menu` VALUES (2032, '订单删除', 2003, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'order:order:remove', '#', 'admin', '2021-11-04 13:04:27', 'admin', '2021-11-04 13:05:06', '');
INSERT INTO `sys_menu` VALUES (2033, '订单导出', 2003, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'order:order:export', '#', 'admin', '2021-11-04 13:04:27', 'admin', '2021-11-04 13:05:11', '');
INSERT INTO `sys_menu` VALUES (2034, '首页', 0, 1, 'index', NULL, NULL, 1, 0, 'M', '1', '0', '', 'dashboard', 'admin', '2021-11-18 13:11:03', 'admin', '2021-11-18 13:11:33', '');
INSERT INTO `sys_menu` VALUES (2035, '面板组统计', 2034, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'board:info:initBoard', '#', 'admin', '2021-11-18 13:14:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '折线图统计', 2034, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'board:info:initLine', '#', 'admin', '2021-11-18 13:14:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '菜品上架', 2017, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dish:dish:upload', '#', 'admin', '2021-11-29 21:28:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '饼状图统计', 2034, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'board:info:initBar', '#', 'admin', '2021-12-10 20:56:06', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2021-10-23 21:33:35', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2021-10-23 21:33:35', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (2, '操作日志', 3, 'com.ruoyi.web.controller.monitor.SysOperlogController.remove()', 'DELETE', 1, 'admin', NULL, '/monitor/operlog/1', '127.0.0.1', '内网IP', '{operIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-29 12:55:31');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-10-23 21:33:35', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '1', 'admin', '2021-10-23 21:33:35', 'admin', '2021-10-24 15:48:55', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-10-23 21:33:35', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 4, '1', 1, 1, '0', '0', 'admin', '2021-10-23 21:33:35', 'admin', '2021-12-01 11:47:50', '普通角色');
INSERT INTO `sys_role` VALUES (100, '订单处理员', 'order', 3, '1', 1, 1, '0', '0', 'admin', '2021-10-24 17:40:07', 'admin', '2021-11-04 23:21:25', NULL);
INSERT INTO `sys_role` VALUES (101, '食堂管理员', 'canteen_manager', 2, '1', 1, 1, '0', '0', 'admin', '2021-10-24 17:40:28', 'admin', '2021-12-10 20:56:27', NULL);
INSERT INTO `sys_role` VALUES (102, '测试角色', 'test', 5, '1', 1, 1, '0', '0', 'admin', '2021-11-09 18:21:08', 'admin', '2021-11-25 11:00:01', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2017);
INSERT INTO `sys_role_menu` VALUES (2, 2018);
INSERT INTO `sys_role_menu` VALUES (2, 2023);
INSERT INTO `sys_role_menu` VALUES (2, 2024);
INSERT INTO `sys_role_menu` VALUES (2, 2025);
INSERT INTO `sys_role_menu` VALUES (2, 2026);
INSERT INTO `sys_role_menu` VALUES (2, 2029);
INSERT INTO `sys_role_menu` VALUES (2, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2029);
INSERT INTO `sys_role_menu` VALUES (100, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (101, 1);
INSERT INTO `sys_role_menu` VALUES (101, 100);
INSERT INTO `sys_role_menu` VALUES (101, 101);
INSERT INTO `sys_role_menu` VALUES (101, 102);
INSERT INTO `sys_role_menu` VALUES (101, 103);
INSERT INTO `sys_role_menu` VALUES (101, 104);
INSERT INTO `sys_role_menu` VALUES (101, 105);
INSERT INTO `sys_role_menu` VALUES (101, 106);
INSERT INTO `sys_role_menu` VALUES (101, 107);
INSERT INTO `sys_role_menu` VALUES (101, 108);
INSERT INTO `sys_role_menu` VALUES (101, 500);
INSERT INTO `sys_role_menu` VALUES (101, 501);
INSERT INTO `sys_role_menu` VALUES (101, 1001);
INSERT INTO `sys_role_menu` VALUES (101, 1002);
INSERT INTO `sys_role_menu` VALUES (101, 1003);
INSERT INTO `sys_role_menu` VALUES (101, 1004);
INSERT INTO `sys_role_menu` VALUES (101, 1005);
INSERT INTO `sys_role_menu` VALUES (101, 1006);
INSERT INTO `sys_role_menu` VALUES (101, 1007);
INSERT INTO `sys_role_menu` VALUES (101, 1008);
INSERT INTO `sys_role_menu` VALUES (101, 1009);
INSERT INTO `sys_role_menu` VALUES (101, 1010);
INSERT INTO `sys_role_menu` VALUES (101, 1011);
INSERT INTO `sys_role_menu` VALUES (101, 1012);
INSERT INTO `sys_role_menu` VALUES (101, 1013);
INSERT INTO `sys_role_menu` VALUES (101, 1014);
INSERT INTO `sys_role_menu` VALUES (101, 1015);
INSERT INTO `sys_role_menu` VALUES (101, 1016);
INSERT INTO `sys_role_menu` VALUES (101, 1017);
INSERT INTO `sys_role_menu` VALUES (101, 1018);
INSERT INTO `sys_role_menu` VALUES (101, 1019);
INSERT INTO `sys_role_menu` VALUES (101, 1020);
INSERT INTO `sys_role_menu` VALUES (101, 1021);
INSERT INTO `sys_role_menu` VALUES (101, 1022);
INSERT INTO `sys_role_menu` VALUES (101, 1023);
INSERT INTO `sys_role_menu` VALUES (101, 1024);
INSERT INTO `sys_role_menu` VALUES (101, 1025);
INSERT INTO `sys_role_menu` VALUES (101, 1026);
INSERT INTO `sys_role_menu` VALUES (101, 1027);
INSERT INTO `sys_role_menu` VALUES (101, 1028);
INSERT INTO `sys_role_menu` VALUES (101, 1029);
INSERT INTO `sys_role_menu` VALUES (101, 1030);
INSERT INTO `sys_role_menu` VALUES (101, 1031);
INSERT INTO `sys_role_menu` VALUES (101, 1032);
INSERT INTO `sys_role_menu` VALUES (101, 1033);
INSERT INTO `sys_role_menu` VALUES (101, 1034);
INSERT INTO `sys_role_menu` VALUES (101, 1035);
INSERT INTO `sys_role_menu` VALUES (101, 1036);
INSERT INTO `sys_role_menu` VALUES (101, 1037);
INSERT INTO `sys_role_menu` VALUES (101, 1038);
INSERT INTO `sys_role_menu` VALUES (101, 1039);
INSERT INTO `sys_role_menu` VALUES (101, 1040);
INSERT INTO `sys_role_menu` VALUES (101, 1041);
INSERT INTO `sys_role_menu` VALUES (101, 1042);
INSERT INTO `sys_role_menu` VALUES (101, 1043);
INSERT INTO `sys_role_menu` VALUES (101, 1044);
INSERT INTO `sys_role_menu` VALUES (101, 1045);
INSERT INTO `sys_role_menu` VALUES (101, 2000);
INSERT INTO `sys_role_menu` VALUES (101, 2001);
INSERT INTO `sys_role_menu` VALUES (101, 2004);
INSERT INTO `sys_role_menu` VALUES (101, 2006);
INSERT INTO `sys_role_menu` VALUES (101, 2008);
INSERT INTO `sys_role_menu` VALUES (101, 2009);
INSERT INTO `sys_role_menu` VALUES (101, 2010);
INSERT INTO `sys_role_menu` VALUES (101, 2011);
INSERT INTO `sys_role_menu` VALUES (101, 2012);
INSERT INTO `sys_role_menu` VALUES (101, 2013);
INSERT INTO `sys_role_menu` VALUES (101, 2014);
INSERT INTO `sys_role_menu` VALUES (101, 2015);
INSERT INTO `sys_role_menu` VALUES (101, 2016);
INSERT INTO `sys_role_menu` VALUES (101, 2017);
INSERT INTO `sys_role_menu` VALUES (101, 2018);
INSERT INTO `sys_role_menu` VALUES (101, 2019);
INSERT INTO `sys_role_menu` VALUES (101, 2020);
INSERT INTO `sys_role_menu` VALUES (101, 2021);
INSERT INTO `sys_role_menu` VALUES (101, 2022);
INSERT INTO `sys_role_menu` VALUES (101, 2023);
INSERT INTO `sys_role_menu` VALUES (101, 2024);
INSERT INTO `sys_role_menu` VALUES (101, 2025);
INSERT INTO `sys_role_menu` VALUES (101, 2026);
INSERT INTO `sys_role_menu` VALUES (101, 2027);
INSERT INTO `sys_role_menu` VALUES (101, 2028);
INSERT INTO `sys_role_menu` VALUES (101, 2034);
INSERT INTO `sys_role_menu` VALUES (101, 2035);
INSERT INTO `sys_role_menu` VALUES (101, 2036);
INSERT INTO `sys_role_menu` VALUES (101, 2037);
INSERT INTO `sys_role_menu` VALUES (101, 2038);
INSERT INTO `sys_role_menu` VALUES (102, 1);
INSERT INTO `sys_role_menu` VALUES (102, 2);
INSERT INTO `sys_role_menu` VALUES (102, 3);
INSERT INTO `sys_role_menu` VALUES (102, 100);
INSERT INTO `sys_role_menu` VALUES (102, 101);
INSERT INTO `sys_role_menu` VALUES (102, 102);
INSERT INTO `sys_role_menu` VALUES (102, 103);
INSERT INTO `sys_role_menu` VALUES (102, 104);
INSERT INTO `sys_role_menu` VALUES (102, 105);
INSERT INTO `sys_role_menu` VALUES (102, 106);
INSERT INTO `sys_role_menu` VALUES (102, 107);
INSERT INTO `sys_role_menu` VALUES (102, 108);
INSERT INTO `sys_role_menu` VALUES (102, 109);
INSERT INTO `sys_role_menu` VALUES (102, 110);
INSERT INTO `sys_role_menu` VALUES (102, 111);
INSERT INTO `sys_role_menu` VALUES (102, 112);
INSERT INTO `sys_role_menu` VALUES (102, 113);
INSERT INTO `sys_role_menu` VALUES (102, 114);
INSERT INTO `sys_role_menu` VALUES (102, 115);
INSERT INTO `sys_role_menu` VALUES (102, 116);
INSERT INTO `sys_role_menu` VALUES (102, 500);
INSERT INTO `sys_role_menu` VALUES (102, 501);
INSERT INTO `sys_role_menu` VALUES (102, 1001);
INSERT INTO `sys_role_menu` VALUES (102, 1002);
INSERT INTO `sys_role_menu` VALUES (102, 1003);
INSERT INTO `sys_role_menu` VALUES (102, 1004);
INSERT INTO `sys_role_menu` VALUES (102, 1005);
INSERT INTO `sys_role_menu` VALUES (102, 1006);
INSERT INTO `sys_role_menu` VALUES (102, 1007);
INSERT INTO `sys_role_menu` VALUES (102, 1008);
INSERT INTO `sys_role_menu` VALUES (102, 1009);
INSERT INTO `sys_role_menu` VALUES (102, 1010);
INSERT INTO `sys_role_menu` VALUES (102, 1011);
INSERT INTO `sys_role_menu` VALUES (102, 1012);
INSERT INTO `sys_role_menu` VALUES (102, 1013);
INSERT INTO `sys_role_menu` VALUES (102, 1014);
INSERT INTO `sys_role_menu` VALUES (102, 1015);
INSERT INTO `sys_role_menu` VALUES (102, 1016);
INSERT INTO `sys_role_menu` VALUES (102, 1017);
INSERT INTO `sys_role_menu` VALUES (102, 1018);
INSERT INTO `sys_role_menu` VALUES (102, 1019);
INSERT INTO `sys_role_menu` VALUES (102, 1020);
INSERT INTO `sys_role_menu` VALUES (102, 1021);
INSERT INTO `sys_role_menu` VALUES (102, 1022);
INSERT INTO `sys_role_menu` VALUES (102, 1023);
INSERT INTO `sys_role_menu` VALUES (102, 1024);
INSERT INTO `sys_role_menu` VALUES (102, 1025);
INSERT INTO `sys_role_menu` VALUES (102, 1026);
INSERT INTO `sys_role_menu` VALUES (102, 1027);
INSERT INTO `sys_role_menu` VALUES (102, 1028);
INSERT INTO `sys_role_menu` VALUES (102, 1029);
INSERT INTO `sys_role_menu` VALUES (102, 1030);
INSERT INTO `sys_role_menu` VALUES (102, 1031);
INSERT INTO `sys_role_menu` VALUES (102, 1032);
INSERT INTO `sys_role_menu` VALUES (102, 1033);
INSERT INTO `sys_role_menu` VALUES (102, 1034);
INSERT INTO `sys_role_menu` VALUES (102, 1035);
INSERT INTO `sys_role_menu` VALUES (102, 1036);
INSERT INTO `sys_role_menu` VALUES (102, 1037);
INSERT INTO `sys_role_menu` VALUES (102, 1038);
INSERT INTO `sys_role_menu` VALUES (102, 1039);
INSERT INTO `sys_role_menu` VALUES (102, 1040);
INSERT INTO `sys_role_menu` VALUES (102, 1041);
INSERT INTO `sys_role_menu` VALUES (102, 1042);
INSERT INTO `sys_role_menu` VALUES (102, 1043);
INSERT INTO `sys_role_menu` VALUES (102, 1044);
INSERT INTO `sys_role_menu` VALUES (102, 1045);
INSERT INTO `sys_role_menu` VALUES (102, 1046);
INSERT INTO `sys_role_menu` VALUES (102, 1047);
INSERT INTO `sys_role_menu` VALUES (102, 1048);
INSERT INTO `sys_role_menu` VALUES (102, 1049);
INSERT INTO `sys_role_menu` VALUES (102, 1050);
INSERT INTO `sys_role_menu` VALUES (102, 1051);
INSERT INTO `sys_role_menu` VALUES (102, 1052);
INSERT INTO `sys_role_menu` VALUES (102, 1053);
INSERT INTO `sys_role_menu` VALUES (102, 1054);
INSERT INTO `sys_role_menu` VALUES (102, 1055);
INSERT INTO `sys_role_menu` VALUES (102, 1056);
INSERT INTO `sys_role_menu` VALUES (102, 1057);
INSERT INTO `sys_role_menu` VALUES (102, 1058);
INSERT INTO `sys_role_menu` VALUES (102, 1059);
INSERT INTO `sys_role_menu` VALUES (102, 1060);
INSERT INTO `sys_role_menu` VALUES (102, 2000);
INSERT INTO `sys_role_menu` VALUES (102, 2001);
INSERT INTO `sys_role_menu` VALUES (102, 2002);
INSERT INTO `sys_role_menu` VALUES (102, 2003);
INSERT INTO `sys_role_menu` VALUES (102, 2004);
INSERT INTO `sys_role_menu` VALUES (102, 2006);
INSERT INTO `sys_role_menu` VALUES (102, 2008);
INSERT INTO `sys_role_menu` VALUES (102, 2009);
INSERT INTO `sys_role_menu` VALUES (102, 2010);
INSERT INTO `sys_role_menu` VALUES (102, 2011);
INSERT INTO `sys_role_menu` VALUES (102, 2012);
INSERT INTO `sys_role_menu` VALUES (102, 2013);
INSERT INTO `sys_role_menu` VALUES (102, 2014);
INSERT INTO `sys_role_menu` VALUES (102, 2015);
INSERT INTO `sys_role_menu` VALUES (102, 2016);
INSERT INTO `sys_role_menu` VALUES (102, 2017);
INSERT INTO `sys_role_menu` VALUES (102, 2018);
INSERT INTO `sys_role_menu` VALUES (102, 2019);
INSERT INTO `sys_role_menu` VALUES (102, 2020);
INSERT INTO `sys_role_menu` VALUES (102, 2021);
INSERT INTO `sys_role_menu` VALUES (102, 2022);
INSERT INTO `sys_role_menu` VALUES (102, 2023);
INSERT INTO `sys_role_menu` VALUES (102, 2024);
INSERT INTO `sys_role_menu` VALUES (102, 2025);
INSERT INTO `sys_role_menu` VALUES (102, 2026);
INSERT INTO `sys_role_menu` VALUES (102, 2027);
INSERT INTO `sys_role_menu` VALUES (102, 2028);
INSERT INTO `sys_role_menu` VALUES (102, 2029);
INSERT INTO `sys_role_menu` VALUES (102, 2030);
INSERT INTO `sys_role_menu` VALUES (102, 2031);
INSERT INTO `sys_role_menu` VALUES (102, 2032);
INSERT INTO `sys_role_menu` VALUES (102, 2033);
INSERT INTO `sys_role_menu` VALUES (102, 2034);
INSERT INTO `sys_role_menu` VALUES (102, 2035);
INSERT INTO `sys_role_menu` VALUES (102, 2036);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/default/avatar/default_avatar.png' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `votes` int(255) NULL DEFAULT 0 COMMENT '今日投票数',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, NULL, 'admin', '若依', '00', 'ry@163.com', '15888888888', '0', '/profile/avatar/2021/12/03/dfa84cfd-9e94-4ef1-ad30-c4f1eed650d1.jpeg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', 0, '0', '127.0.0.1', '2022-12-29 12:49:16', 'admin', '2021-10-23 21:33:35', '', '2022-12-29 12:49:16', '管理员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (149, 101);
INSERT INTO `sys_user_role` VALUES (150, 100);
INSERT INTO `sys_user_role` VALUES (151, 100);
INSERT INTO `sys_user_role` VALUES (152, 100);

SET FOREIGN_KEY_CHECKS = 1;
