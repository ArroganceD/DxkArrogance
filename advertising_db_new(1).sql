# Host:   (Version: 5.5.47)
# Date: 2018-07-09 17:56:50
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES gb2312 */;

#
# Structure for table "ims_commune_comment"
#

DROP TABLE IF EXISTS `ims_commune_comment`;
CREATE TABLE `ims_commune_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_user_id` int(11) NOT NULL COMMENT '发表评论的用户id',
  `before_comment_user_id` int(11) NOT NULL COMMENT '被评论的用户id:  -1 则为直接评论资讯',
  `comment_content` varchar(566) NOT NULL COMMENT '评论内容',
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `before_comment_user_id_index` (`before_comment_user_id`) USING BTREE,
  KEY `user_before_index` (`comment_user_id`,`before_comment_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

#
# Data for table "ims_commune_comment"
#


#
# Structure for table "ims_commune_comment_news"
#

DROP TABLE IF EXISTS `ims_commune_comment_news`;
CREATE TABLE `ims_commune_comment_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL COMMENT '评论表id',
  `news_id` int(11) NOT NULL COMMENT '新闻id',
  PRIMARY KEY (`id`),
  KEY `news_comment_index` (`news_id`,`comment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论和新闻关联表';

#
# Data for table "ims_commune_comment_news"
#


#
# Structure for table "ims_commune_commercial"
#

DROP TABLE IF EXISTS `ims_commune_commercial`;
CREATE TABLE `ims_commune_commercial` (
  `commercial_id` int(11) NOT NULL AUTO_INCREMENT,
  `commercial_type` int(11) NOT NULL DEFAULT '1' COMMENT '源类型1新闻2咨询',
  `commercial_name` varchar(255) NOT NULL COMMENT '名称',
  `commercial_picture` varchar(255) NOT NULL DEFAULT '' COMMENT '网站logo',
  `commercial_website` varchar(255) DEFAULT NULL COMMENT '网站地址',
  `createtime` bigint(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`commercial_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='新闻源表';

#
# Data for table "ims_commune_commercial"
#

INSERT INTO `ims_commune_commercial` VALUES (1,1,'111','2221','3331',NULL),(3,1,'00','11','22',NULL),(4,2,'3233','33','23',NULL);

#
# Structure for table "ims_commune_commercial_user"
#

DROP TABLE IF EXISTS `ims_commune_commercial_user`;
CREATE TABLE `ims_commune_commercial_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `commercial_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `commercial_Unique_index` (`commercial_id`) USING BTREE,
  KEY `user_index_Normal_index` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻源和用户关联表';

#
# Data for table "ims_commune_commercial_user"
#


#
# Structure for table "ims_commune_information"
#

DROP TABLE IF EXISTS `ims_commune_information`;
CREATE TABLE `ims_commune_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `commercial_id` int(11) NOT NULL COMMENT '第三方商户id',
  `information_title` varchar(566) NOT NULL COMMENT '资讯标题',
  `information_content` varchar(566) NOT NULL COMMENT '资讯内容',
  `like_count` int(25) NOT NULL COMMENT '点赞数',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`information_id`),
  KEY `commercial_id_index` (`commercial_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='资讯表';

#
# Data for table "ims_commune_information"
#

INSERT INTO `ims_commune_information` VALUES (1,1,'2','3',411,NULL);

#
# Structure for table "ims_commune_news"
#

DROP TABLE IF EXISTS `ims_commune_news`;
CREATE TABLE `ims_commune_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `commercial_id` int(11) NOT NULL COMMENT '第三方商户id',
  `news_title` varchar(255) NOT NULL COMMENT '标题',
  `news_content` varchar(560) NOT NULL COMMENT '内容',
  `news_picture` varchar(255) NOT NULL COMMENT '图片',
  `point_rule_id` int(11) NOT NULL COMMENT '积分规则id',
  `origin` varchar(255) NOT NULL COMMENT '来源',
  `comment_count` int(25) DEFAULT NULL COMMENT '评论量',
  `reading_count` int(25) NOT NULL COMMENT '阅读量',
  `good_count` int(25) DEFAULT NULL COMMENT '点赞数',
  `bad_count` int(25) DEFAULT NULL COMMENT '点踩数',
  `delete_flag` tinyint(1) NOT NULL COMMENT '删除标识',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`news_id`),
  KEY `commercial_rule_index` (`commercial_id`,`point_rule_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻表';

#
# Data for table "ims_commune_news"
#

INSERT INTO `ims_commune_news` VALUES (1,22,'323','33','34',4,'4',3,4,31,32,0,NULL),(2,1,'2','3','4',6,'5',7,8,9,10,0,2121243795);

#
# Structure for table "ims_commune_point_log"
#

DROP TABLE IF EXISTS `ims_commune_point_log`;
CREATE TABLE `ims_commune_point_log` (
  `point_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `point` int(25) NOT NULL COMMENT '要变动的积分',
  `before_point` int(25) NOT NULL COMMENT '变动前的积分',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `news_id` int(11) NOT NULL COMMENT '新闻id',
  `ip_address` varchar(25) NOT NULL COMMENT '真实ip地址',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`point_log_id`),
  KEY `user_index` (`user_id`) USING BTREE,
  KEY `news_index` (`news_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分日志表';

#
# Data for table "ims_commune_point_log"
#


#
# Structure for table "ims_commune_point_rule"
#

DROP TABLE IF EXISTS `ims_commune_point_rule`;
CREATE TABLE `ims_commune_point_rule` (
  `point_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `point` int(11) NOT NULL COMMENT '可获得的积分',
  `time` int(10) NOT NULL COMMENT '每次最低阅读时长',
  `get_count` int(25) NOT NULL COMMENT '用户可获得次数',
  `timeout` int(10) NOT NULL COMMENT '规则过期时间',
  `delete_flag` tinyint(1) NOT NULL COMMENT '删除标识',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`point_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分规则表';

#
# Data for table "ims_commune_point_rule"
#

INSERT INTO `ims_commune_point_rule` VALUES (2,'33',3,34,4,5,0,2121206487);

#
# Structure for table "tb_resource"
#

DROP TABLE IF EXISTS `tb_resource`;
CREATE TABLE `tb_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `is_hide` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `source_key` varchar(255) DEFAULT NULL,
  `source_url` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKf5ra2gn0xedeida2op8097sr5` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=gbk;

#
# Data for table "tb_resource"
#

/*!40000 ALTER TABLE `tb_resource` DISABLE KEYS */;
INSERT INTO `tb_resource` VALUES (1,'2017-01-10 13:56:51','用户管理',NULL,0,2,'用户管理',1,'system:user:index','/admin/user/index',1,'2017-01-10 13:59:01',NULL),(2,'2017-01-10 13:56:51','用户编辑',NULL,0,3,'用户编辑',1,'system:user:edit','/admin/user/edit*',2,'2017-01-10 16:26:42',1),(3,'2017-01-11 16:48:48','用户添加',NULL,0,3,'用户添加',2,'system:user:add','/admin/user/add',2,'2017-01-11 16:49:26',1),(4,'2017-01-11 16:48:48','用户删除',NULL,0,3,'用户删除',3,'system:user:deleteBatch','/admin/user/deleteBatch',2,'2017-01-18 14:11:41',1),(5,'2017-01-11 16:48:48','角色分配',NULL,0,3,'角色分配',4,'system:user:grant','/admin/user/grant/**',2,'2017-01-18 14:11:51',1),(6,'2017-01-12 16:45:10','角色管理',NULL,0,2,'角色管理',2,'system:role:index','/admin/role/index',1,'2017-01-12 16:46:52',NULL),(7,'2017-01-12 16:47:02','角色编辑',NULL,0,3,'角色编辑',1,'system:role:edit','/admin/role/edit*',2,'2017-01-18 10:24:06',1),(8,'2017-01-12 16:47:23','角色添加',NULL,0,3,'角色添加',2,'system:role:add','/admin/role/add',2,'2017-01-12 16:49:16',6),(9,'2017-01-12 16:47:23','角色删除',NULL,0,3,'角色删除',3,'system:role:deleteBatch','/admin/role/deleteBatch',2,'2017-01-18 14:12:03',6),(10,'2017-01-12 16:47:23','资源分配',NULL,0,3,'资源分配',4,'system:role:grant','/admin/role/grant/**',2,'2017-01-18 14:12:11',6),(11,'2017-01-17 11:21:12','资源管理',NULL,0,2,'资源管理',3,'system:resource:index','/admin/resource/index',1,'2017-01-17 11:21:42',NULL),(12,'2017-01-17 11:21:52','资源编辑',NULL,0,3,'资源编辑',1,'system:resource:edit','/admin/resource/edit*',2,'2017-01-17 11:22:36',11),(13,'2017-01-17 11:21:54','资源添加',NULL,0,3,'资源添加',2,'system:resource:add','/admin/resource/add',2,'2017-01-17 11:22:39',11),(14,'2017-01-17 11:21:54','资源删除',NULL,0,3,'资源删除',3,'system:resource:deleteBatch','/admin/resource/deleteBatch',2,'2017-01-18 14:12:31',11),(15,NULL,'新闻源管理',NULL,0,2,'新闻源管理',1,'system:commercial:index','/admin/commercial/index',1,'2018-07-07 11:40:07',1);
/*!40000 ALTER TABLE `tb_resource` ENABLE KEYS */;

#
# Structure for table "tb_role"
#

DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role_key` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

#
# Data for table "tb_role"
#

/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;
INSERT INTO `tb_role` VALUES (1,'2017-01-09 17:25:30','超级管理员','administrator','administrator',0,'2017-01-09 17:26:25');
/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;

#
# Structure for table "tb_role_resource"
#

DROP TABLE IF EXISTS `tb_role_resource`;
CREATE TABLE `tb_role_resource` (
  `role_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`resource_id`),
  KEY `FK868kc8iic48ilv5npa80ut6qo` (`resource_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

#
# Data for table "tb_role_resource"
#

/*!40000 ALTER TABLE `tb_role_resource` DISABLE KEYS */;
INSERT INTO `tb_role_resource` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14);
/*!40000 ALTER TABLE `tb_role_resource` ENABLE KEYS */;

#
# Structure for table "tb_user"
#

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `delete_status` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `locked` int(11) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

#
# Data for table "tb_user"
#

/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'成都','2017-01-09 17:26:39','2017-01-09 17:26:41',0,'超级管理员','whoismy8023@163.com',0,'admin','3931MUEQD1939MQMLM4AISPVNE',1,'15923930000','2017-01-09 17:27:11','admin'),(2,'2222','2018-07-27 00:00:00','2018-07-07 10:28:05',0,'121212','1212@11.com',0,'1111111','3931MUEQD1939MQMLM4AISPVNE',0,'212','2018-07-07 10:28:05','1111');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;

#
# Structure for table "tb_user_role"
#

DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKea2ootw6b6bb0xt3ptl28bymv` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

#
# Data for table "tb_user_role"
#

/*!40000 ALTER TABLE `tb_user_role` DISABLE KEYS */;
INSERT INTO `tb_user_role` VALUES (1,1);
/*!40000 ALTER TABLE `tb_user_role` ENABLE KEYS */;
