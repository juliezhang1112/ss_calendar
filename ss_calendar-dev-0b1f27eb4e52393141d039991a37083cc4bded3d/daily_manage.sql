-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2019-04-07 18:08:26
-- 服务器版本： 5.5.57-log
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `daily_manage`
--

-- --------------------------------------------------------

--
-- 表的结构 `log_user`
--

CREATE TABLE IF NOT EXISTS `log_user` (
  `id` int(11) NOT NULL COMMENT '日志编号',
  `user_id` int(11) NOT NULL COMMENT '操作人ID',
  `operate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `operate_action` text NOT NULL COMMENT '操作行为',
  `user_agent` varchar(100) NOT NULL COMMENT 'Http Header中的user-agent',
  `ip` varchar(20) NOT NULL COMMENT '操作人IP地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作日志表';

-- --------------------------------------------------------

--
-- 表的结构 `manage_info`
--

CREATE TABLE IF NOT EXISTS `manage_info` (
  `id` int(11) NOT NULL COMMENT '管理员编号',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `telephone` varchar(15) NOT NULL COMMENT '手机号',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否被删除（0存在，1已删除）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  `delete_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录软删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员信息表';

-- --------------------------------------------------------

--
-- 表的结构 `schedule_default`
--

CREATE TABLE IF NOT EXISTS `schedule_default` (
  `id` int(11) NOT NULL COMMENT '默认项编号',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `place_id` int(11) NOT NULL COMMENT '地点ID',
  `item_id` int(11) NOT NULL COMMENT '事项ID',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否被删除：0存在，1已删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录更新时间',
  `delete_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录软删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='默认地点、事项表';

-- --------------------------------------------------------

--
-- 表的结构 `schedule_info`
--

CREATE TABLE IF NOT EXISTS `schedule_info` (
  `id` int(11) NOT NULL COMMENT '日程信息编号',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time_id` int(11) NOT NULL COMMENT '时间ID',
  `place_id` int(11) NOT NULL COMMENT '地点ID',
  `item_id` int(11) NOT NULL COMMENT '事项类型ID',
  `note` text COMMENT '日程详细信息',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否被删除：0存在，1已删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录更新时间',
  `delete_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录软删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户日程信息表';

-- --------------------------------------------------------

--
-- 表的结构 `schedule_item`
--

CREATE TABLE IF NOT EXISTS `schedule_item` (
  `id` int(11) NOT NULL COMMENT '事项编号',
  `name` varchar(30) NOT NULL COMMENT '事项类型名称',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否被删除：0存在，1已删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录更新时间',
  `delete_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录软删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='日程事项类型表';

-- --------------------------------------------------------

--
-- 表的结构 `schedule_place`
--

CREATE TABLE IF NOT EXISTS `schedule_place` (
  `id` int(11) NOT NULL COMMENT '地点编号',
  `name` varchar(30) NOT NULL COMMENT '地点名称',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否被删除：0存在，1已删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录更新时间',
  `delete_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录软删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='日程地点信息';

-- --------------------------------------------------------

--
-- 表的结构 `schedule_time`
--

CREATE TABLE IF NOT EXISTS `schedule_time` (
  `id` int(11) NOT NULL COMMENT '时间编号',
  `name` varchar(30) NOT NULL COMMENT '时间名称',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否被删除：0存在，1已删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录更新时间',
  `delete_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录软删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='日程时间表';

-- --------------------------------------------------------

--
-- 表的结构 `user_depart`
--

CREATE TABLE IF NOT EXISTS `user_depart` (
  `id` int(11) NOT NULL COMMENT '部门编号',
  `name` varchar(30) NOT NULL COMMENT '部门名称',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否被删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录更新时间',
  `delete_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录软删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='部门信息表';

-- --------------------------------------------------------

--
-- 表的结构 `user_info`
--

CREATE TABLE IF NOT EXISTS `user_info` (
  `id` int(11) NOT NULL COMMENT '用户编号',
  `name` varchar(30) NOT NULL COMMENT '用户姓名',
  `work_id` varchar(30) NOT NULL COMMENT '用户工号/学号',
  `type_id` int(11) NOT NULL COMMENT '用户类型：0普通用户、1院领导、2部门领导、3系领导',
  `depart_id` int(11) NOT NULL COMMENT '所属部门/系：0学院',
  `image` varchar(300) DEFAULT NULL COMMENT '用户头像',
  `position_id` int(11) NOT NULL COMMENT '职位',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否被删除：0存在，1已删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录更新时间',
  `delete_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录软删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `user_position`
--

CREATE TABLE IF NOT EXISTS `user_position` (
  `id` int(11) NOT NULL COMMENT '职位编号',
  `name` varchar(30) NOT NULL COMMENT '职位名称',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否被删除：0存在，1已删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录更新时间',
  `delete_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录软删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户职位表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log_user`
--
ALTER TABLE `log_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manage_info`
--
ALTER TABLE `manage_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_default`
--
ALTER TABLE `schedule_default`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_info`
--
ALTER TABLE `schedule_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_item`
--
ALTER TABLE `schedule_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_place`
--
ALTER TABLE `schedule_place`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_time`
--
ALTER TABLE `schedule_time`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_depart`
--
ALTER TABLE `user_depart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_position`
--
ALTER TABLE `user_position`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log_user`
--
ALTER TABLE `log_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志编号';
--
-- AUTO_INCREMENT for table `manage_info`
--
ALTER TABLE `manage_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员编号';
--
-- AUTO_INCREMENT for table `schedule_default`
--
ALTER TABLE `schedule_default`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '默认项编号';
--
-- AUTO_INCREMENT for table `schedule_info`
--
ALTER TABLE `schedule_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日程信息编号';
--
-- AUTO_INCREMENT for table `schedule_item`
--
ALTER TABLE `schedule_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '事项编号';
--
-- AUTO_INCREMENT for table `schedule_place`
--
ALTER TABLE `schedule_place`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地点编号';
--
-- AUTO_INCREMENT for table `schedule_time`
--
ALTER TABLE `schedule_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '时间编号';
--
-- AUTO_INCREMENT for table `user_depart`
--
ALTER TABLE `user_depart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门编号';
--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号';
--
-- AUTO_INCREMENT for table `user_position`
--
ALTER TABLE `user_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职位编号';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
