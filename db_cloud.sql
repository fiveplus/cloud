/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Version : 50715
 Source Host           : localhost
 Source Database       : db_cloud

 Target Server Version : 50715
 File Encoding         : utf-8

 Date: 11/07/2016 11:22:46 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `sys_dept_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_permission`;
CREATE TABLE `sys_dept_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` varchar(100) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- ----------------------------
--  Records of `sys_dept_permission`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept_permission` VALUES ('1', 'department', '1'), ('2', 'handle', '1'), ('3', 'user', '1'), ('4', 'group', '1'), ('5', 'content', '1'), ('6', 'project', '1'), ('7', 'theme', '1'), ('8', 'level', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` text,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `create_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_log`
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES ('1', '4', '日程消息', '你的日程 \"这是一个事件\"发布成功,请耐心等待用户Max的审核哦~', '1473133622103'), ('2', '4', '日程消息', '你的日程\"这是一个事件\"审核通过，哎哟不错哦~', '1473134059273'), ('3', '4', '日程消息', '你的日程 \"坑爹啊坑爹啊坑爹啊\"发布成功,请耐心等待用户Max的审核哦~', '1473134093359'), ('4', '4', '日程消息', '你的日程\"坑爹啊坑爹啊坑爹啊\"审核通过，哎哟不错哦~', '1473134111093'), ('5', '4', '日程消息', '你的日程 \"tyrtyryryy...\"发布成功,请耐心等待用户Max的审核哦~', '1473140052795'), ('6', '4', '日程消息', '你的日程\"tyrtyryryy...\"审核通过，哎哟不错哦~', '1473140082628'), ('7', '4', '日程消息', '你的日程 \"dfdfgdgdgd...\"发布成功,请耐心等待用户Max的审核哦~', '1473143869775'), ('8', '4', '日程消息', '你的日程\"dfdfgdgdgd...\"审核通过，哎哟不错哦~', '1473143875874'), ('9', '4', '日程消息', '你的日程 \"rtryrtyrty\"发布成功,请耐心等待用户Max的审核哦~', '1473143896437'), ('10', '4', '日程消息', '你的日程\"rtryrtyrty\"审核通过，哎哟不错哦~', '1473143902825'), ('11', '4', '日程消息', '你的日程 \"adsadsadas...\"发布成功,请耐心等待用户Max的审核哦~', '1473144194305'), ('12', '4', '日程消息', '你的日程\"adsadsadas...\"审核通过，哎哟不错哦~', '1473144205254');
COMMIT;

-- ----------------------------
--  Table structure for `sys_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `parent_id` varchar(100) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `is_menu` varchar(2) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `class_name` varchar(500) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `status` varchar(2) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `menu_index` int(11) DEFAULT NULL,
  `image_url` varchar(1000) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `url` varchar(1000) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `create_time` varchar(100) COLLATE utf8_hungarian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- ----------------------------
--  Records of `sys_permission`
-- ----------------------------
BEGIN;
INSERT INTO `sys_permission` VALUES ('content', '帖子管理', 'contentManage', 'Y', '', 'Y', '1', '', 'admin/content/list?page=1', '1448418356682'), ('contentManage', '帖子管理', 'admin', 'Y', 'icon-list', 'Y', '2', '', '', '1448418356682'), ('department', '部门管理', 'main', 'Y', '', 'Y', '3', '', 'admin/dept/list?page=1', '1448418356682'), ('group', '组管理 ', 'main', 'Y', '', 'Y', '4', '', 'admin/group/list?page=1', '1447671578621'), ('handle', '菜单/权限', 'main', 'Y', '', 'Y', '1', '', 'admin/permission/list?page=1', '1440666423850'), ('level', '职位级别管理', 'main', 'Y', '', 'Y', '5', '', 'admin/level/list?page=1', '1474874270456'), ('main', '后台管理', 'admin', 'Y', 'icon-desktop', 'Y', '1', '', '', '1440664698162'), ('project', '项目管理', 'contentManage', 'Y', '', 'Y', '2', '', 'admin/project/list?page=1', '1448418577902'), ('theme', '主题管理', 'contentManage', 'Y', '', 'Y', '3', '', 'admin/theme/list?page=1', '1448418611182'), ('user', '用户管理', 'main', 'Y', '', 'Y', '2', '', 'admin/user/list?page=1', '1440665159555');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_calendar`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_calendar`;
CREATE TABLE `tbl_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `create_user` int(11) DEFAULT NULL,
  `assign_user` int(11) DEFAULT NULL,
  `start_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbl_calendar`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_calendar` VALUES ('2', '阿萨德', '阿萨德', '4', '4', '1472088600000', '1472095800000', 'Y'), ('3', 'asdasd史蒂夫', '啊实打实的', '4', '4', '1472087700000', '1472095800000', 'Y'), ('4', 'ugh', 'dfgdfg', '4', '4', '1472086800000', '1472098500000', 'Y'), ('5', 'gdfgdfg', 'dfgdfgdfg', '4', '4', '1472004900000', '1472013900000', 'Y'), ('6', '这是个标题', '这是个标题', '4', '4', '1472705100000', '1472715900000', 'Y'), ('7', '呵呵哒', '呵呵哒我的天', '4', '4', '1472787000000', '1472795100000', 'Y'), ('8', '实打实的', '萨达达', '4', '4', '1472877000000', '1472890500000', 'Y'), ('9', '哎哟我操', '哎哟我操', '4', '4', '1472520600000', '1472538600000', 'Y'), ('10', '这是一个事件', '这个事件是一个超级重要的事件', '4', '4', '1473124500000', '1473130800000', 'Y'), ('11', '坑爹啊坑爹啊坑爹啊', '坑爹啊坑爹啊坑爹啊', '4', '4', '1473124500000', '1473132600000', 'Y'), ('12', 'tyrtyryryyrtyrtyrty', 'rtyrtyrtyrtytrtyrtyrty', '4', '4', '1473123600000', '1473138000000', 'Y'), ('13', 'dfdfgdgdgdfgdfg', 'dfgdfgdfgdfgdgdgdfg', '4', '4', '1473389100000', '1473399000000', 'Y'), ('14', 'rtryrtyrty', 'rtyrtyrtyryrty', '4', '4', '1473307200000', '1473314400000', 'Y'), ('15', 'adsadsadasdasd', 'ghjghjghjghj', '4', '4', '1473224400000', '1473231600000', 'Y');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_content`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_content`;
CREATE TABLE `tbl_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `theme_id` int(11) DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `is_public` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remind_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `read_count` int(11) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `tbl_content`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_content` VALUES ('34', '1', '1', '一直觉得星战里最萌的机器人是R2-D2，看了预告片发现BB-8更萌，果然圆滚滚在萌的世界里就是王道啊<a target=\"_blank\" class=\"a_topic\" href=\"http://huati.weibo.com/k/%E6%98%9F%E7%90%83%E5%A4%A7%E6%88%98%EF%BC%9A%E5%8E%9F%E5%8A%9B%E8%A7%89%E9%86%92?from=501\">#星球大战：原力觉醒#</a>', 'N', '1419735600000', '4', '1449718520056', '11', 'Y'), ('35', '15', '1', '团子 过来抱一个<a target=\"_blank\" class=\"a_topic\" href=\"http://huati.weibo.com/k/%E6%98%9F%E7%90%83%E5%A4%A7%E6%88%98%EF%BC%9A%E5%8E%9F%E5%8A%9B%E8%A7%89%E9%86%92?from=501\"></a>', 'N', '1419735600000', '4', '1449718550782', '55', 'Y'), ('36', '15', '1', '最近在Facebook玩live玩得起勁，讓一大波人問我是不是卸載微博了⋯沒有啦⋯只是微博沒得做Live。哈哈哈，為了補償大家，送兩張獨家圖，是前幾天家裡開Party的照片～麵包蟹夾鼻子～～<a target=\"_blank\" class=\"a_topic\" href=\"http://huati.weibo.com/k/%E6%98%9F%E7%90%83%E5%A4%A7%E6%88%98%EF%BC%9A%E5%8E%9F%E5%8A%9B%E8%A7%89%E9%86%92?from=501\"></a>', 'N', '1419735600000', '4', '1449718564228', '12', 'Y'), ('37', '15', '1', 'Keep it simple... 感谢！<a target=\"_blank\" class=\"a_topic\" href=\"http://huati.weibo.com/k/%E6%98%9F%E7%90%83%E5%A4%A7%E6%88%98%EF%BC%9A%E5%8E%9F%E5%8A%9B%E8%A7%89%E9%86%92?from=501\"></a>', 'N', '1419735600000', '4', '1449718703189', '33', 'Y'), ('38', '16', '1', '作为920爱牙日生人 让我来告诉你 用按的也能武装到牙齿<a target=\"_blank\" class=\"a_topic\" href=\"http://huati.weibo.com/k/%E6%98%9F%E7%90%83%E5%A4%A7%E6%88%98%EF%BC%9A%E5%8E%9F%E5%8A%9B%E8%A7%89%E9%86%92?from=501\"></a>', 'N', '1419735600000', '4', '1449718726820', '15', 'Y'), ('39', '16', '1', '天气好的人在拉仇恨<a target=\"_blank\" class=\"a_topic\" href=\"http://huati.weibo.com/k/%E6%98%9F%E7%90%83%E5%A4%A7%E6%88%98%EF%BC%9A%E5%8E%9F%E5%8A%9B%E8%A7%89%E9%86%92?from=501\"></a>', 'N', '1419735600000', '4', '1449718743400', '5', 'Y'), ('40', '16', '1', '一起拼快车去看《怦然星动》，万一拼到了那个让你心动的人呢～<a target=\"_blank\" class=\"a_topic\" href=\"http://huati.weibo.com/k/%E6%98%9F%E7%90%83%E5%A4%A7%E6%88%98%EF%BC%9A%E5%8E%9F%E5%8A%9B%E8%A7%89%E9%86%92?from=501\"></a>', 'N', '1419735600000', '4', '1449718761586', '25', 'Y'), ('41', '16', '1', '这个游乐场被任性“小公举”全包了！赞助商就是这么财大气粗~<a target=\"_blank\" class=\"a_topic\" href=\"http://huati.weibo.com/k/%E6%98%9F%E7%90%83%E5%A4%A7%E6%88%98%EF%BC%9A%E5%8E%9F%E5%8A%9B%E8%A7%89%E9%86%92?from=501\"></a>', 'N', '1419735600000', '4', '1449718775612', '10', 'Y'), ('44', '15', '1', '主人拍到家里的喵正在狠狠的揍老虎公仔......你谁啊你？！到家这么些天一句话不说，打招呼也不理，我发起火来自己都怕，这个家只能有我一个公主！', 'N', '1419737760000', '4', '1450064221612', '55', 'Y'), ('45', '15', '1', '<a target=\"_blank\" class=\"a_topic\" href=\"http://huati.weibo.com/k/%E5%85%AC%E7%A5%AD%E6%97%A5?from=501\">#公祭日#</a>【南京大屠杀死难者国家公祭仪式举行】今日，南京大屠杀死难者国家公祭仪式举行，约10:01，全南京市主城区范围内行驶的机动车停驶鸣笛致哀1分钟，道路上的行人就地默哀1分钟。10:22，公祭仪式结束，现场放飞3000只和平鸽。以国家的名义，祭奠同胞，珍爱和平！', 'N', null, '4', '1450064401316', '11', 'Y'), ('46', '1', '1', '<a target=\"_blank\" class=\"a_topic\" href=\"http://huati.weibo.com/k/%E5%9C%86%E8%84%B8%E6%AF%94%E5%B0%96%E8%84%B8%E5%A5%BD%E7%9C%8B?from=501\">#圆脸比尖脸好看#</a>真的吗真的吗真的吗，我已圆脸多年。', 'N', null, '4', '1450074951636', '222', 'Y'), ('47', '15', '1', '<p>\r\n	共和国好几个规划局规划局感觉感觉\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 'N', null, '5', '1467270923613', '58', 'Y'), ('48', '15', '1', '<p>\r\n	共和国好几个规划局规划局感觉感觉\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 'N', null, '5', '1467270925530', '55', 'Y'), ('49', '15', '1', '<p>\r\n	共和国好几个规划局规划局感觉感觉\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 'N', null, '5', '1467270930569', '2', 'Y'), ('50', '15', '1', '<p>\r\n	共和国好几个规划局规划局感觉感觉\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 'N', null, '5', '1467270930738', '58', 'Y'), ('51', '15', '1', '<p>\r\n	共和国好几个规划局规划局感觉感觉\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 'N', null, '5', '1467270930900', '87', 'Y'), ('52', '15', '1', '<p>\r\n	共和国好几个规划局规划局感觉感觉\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 'N', null, '5', '1467270931090', '12', 'Y'), ('53', '15', '1', '<p>\r\n	共和国好几个规划局规划局感觉感觉\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 'N', null, '5', '1467270932058', '445', 'Y'), ('54', '15', '1', '<p>\r\n	共和国好几个规划局规划局感觉感觉\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 'N', null, '5', '1467270932235', '220', 'Y'), ('55', '15', '1', '<p>\r\n	共和国好几个规划局规划局感觉感觉\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 'N', null, '5', '1467270932409', '45', 'Y'), ('56', '15', '1', '<p>\r\n	共和国好几个规划局规划局感觉感觉\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 'N', null, '5', '1467270936274', '45', 'Y'), ('57', '15', '1', '<p>\r\n	共和国好几个规划局规划局感觉感觉\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 'N', '1451200500000', '5', '1467270942095', '88', 'Y'), ('58', null, '1', '555555', 'N', '1451192400000', '4', '1467347991831', '0', 'Y'), ('59', null, '1', 'hfghfhfghfghfghfhgftyutdutyutyu', 'N', null, '5', '1467355937192', '0', 'Y'), ('60', '15', '1', 'rtyryrtyrty', 'N', null, '5', '1467355982178', '0', 'Y'), ('61', null, '1', 'dfgdfgdfgdgfdfg', 'N', null, '5', '1467357037694', '0', 'Y'), ('62', null, '1', 'hjkhkhjkhjk', 'N', null, '5', '1467357086598', '0', 'Y'), ('63', null, '1', 'fghfghfhfghfghfgh', 'N', null, '5', '1467357173992', '0', 'Y'), ('64', null, '1', 'Rggggg', 'N', null, '5', '1467357204150', '0', 'Y'), ('65', null, '1', 'ggghghhh', 'N', null, '5', '1467357217216', '0', 'Y'), ('66', '17', '1', 'sdfsdfsdf', 'N', null, '5', '1467357387700', '0', 'Y'), ('67', null, '1', 'yutyutyutututyu', 'N', null, '5', '1467357478577', '0', 'Y'), ('68', '1', '1', 'sdfsdfsdfsdfsdf', 'N', null, '5', '1467357629026', '0', 'Y'), ('69', null, '1', 'dfgdfgdfgdfg', 'N', null, '5', '1467357811499', '0', 'Y'), ('70', '15', '1', 'ertertetetertertert', 'N', null, '5', '1467357947022', '0', 'Y'), ('71', null, '1', 'hjkhjkhjkhjkhjk', 'N', null, '5', '1467358145933', '0', 'Y'), ('72', null, '1', 'werwerwrewerwerwer', 'N', null, '5', '1467358157998', '0', 'Y'), ('73', null, '1', 'dfgdgfdfgdgrtyrtutyyuiijuouioiuo', 'N', null, '5', '1467358325677', '0', 'Y'), ('74', null, '1', 'asdasdasdasfgerrtyrty', 'N', null, '5', '1467358626797', '0', 'Y'), ('75', null, '1', 'asdasdaasd', 'N', null, '5', '1467358720819', '0', 'Y'), ('76', '1', '1', 'asdadsewrwrwerwerwwerwer', 'N', null, '5', '1467358771664', '0', 'Y'), ('77', '1', '1', 'werwerwrwergbghbgggbg', 'N', null, '5', '1467359427161', '0', 'Y'), ('78', '1', '1', 'dfdfdfdfrtrtrtrt', 'N', null, '5', '1467359485708', '0', 'N'), ('79', null, '1', 'gtyutyutyutyutyu', 'N', null, '5', '1467611974474', '0', 'N'), ('80', '1', '1', '<span style=\"color:#333333;font-family:Helvetica, STHeiti;font-size:14px;background-color:#FFFFFF;\">《龙池篇》（唐享龙池乐章第三章）(唐：沈佺期）龙池跃龙龙已飞，龙德先天天不违。池开天汉分黄道， 龙向天门入紫微。邸第楼台多气色，君王凫雁有光辉。 为报寰中百川水，来朝此地莫东归。</span>', 'Y', null, '4', '1467614859107', '0', 'Y'), ('81', '15', '1', 'uiouiououio', 'N', null, '4', '1467615163708', '0', 'Y'), ('82', '15', '1', '逗比', 'N', null, '4', '1467615226775', '0', 'Y'), ('83', '1', '1', '这是一条公开信息.', 'Y', null, '5', '1467616450181', '0', 'N'), ('84', '1', '1', 'ABBBCCC', 'N', null, '4', '1471232830227', '8', 'Y'), ('85', null, '1', '<span style=\"color:#333333;font-family:Arial, \'Microsoft YaHei\';font-size:14px;background-color:#FFFFFF;\">【七旬老人卖粮收到1.2万 全是假币</span><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/7c/angrya_org.gif\" title=\"[怒]\" alt=\"[怒]\" /><span style=\"color:#333333;font-family:Arial, \'Microsoft YaHei\';font-size:14px;background-color:#FFFFFF;\">】27日，陕西泾阳一七旬老人拿5000元到银行存款，被工作人员发现都是假币，随即报警。老人称，家中还有7100元，是春节前有人来收粮时给的。经查，剩余的钱也均为假币。民警称，这相当于老人全年的收入…警方已立案。</span>', 'Y', null, '4', '1472628025832', '35', 'Y'), ('86', null, '1', '<span style=\"color:#333333;font-family:Arial, \'Microsoft YaHei\';font-size:14px;background-color:#FFFFFF;\">【七旬老人卖粮收到1.2万 全是假币</span><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/7c/angrya_org.gif\" title=\"[怒]\" alt=\"[怒]\" /><span style=\"color:#333333;font-family:Arial, \'Microsoft YaHei\';font-size:14px;background-color:#FFFFFF;\">】27日，陕西泾阳一七旬老人拿5000元到银行存款，被工作人员发现都是假币，随即报警。老人称，家中还有7100元，是春节前有人来收粮时给的。经查，剩余的钱也均为假币。民警称，这相当于老人全年的收入…警方已立案。</span>', 'Y', null, '4', '1472628072965', '8', 'Y'), ('87', null, '1', '<p style=\"font-size:11px;font-family:Monaco;\">\r\n	<p style=\"font-size:11px;font-family:Menlo;\">\r\n		Last login: Tue Aug 30 14:04:23 on ttys000\r\n	</p>\r\n	<p style=\"font-size:11px;font-family:Menlo;\">\r\n		zhangshenwudeMacBook-Pro:~ zhangshenwu$&nbsp;\r\n	</p>\r\n</p>', 'N', null, '4', '1472628378246', '24', 'Y'), ('88', null, '1', '出大事了！！！！潭州日语VIP班优惠活动最后3个名额！名额结束后不再赠送万元大礼包+终身答疑卡，答疑权限调整为一年。支持分期预订（大专以上学历者最高可分12期，每月仅需500元）。想咨询马上回【参加报名】，不然名额就没有了！！！！！！！', 'N', null, '4', '1472628512153', '56', 'Y'), ('89', null, '1', '出大事了！！！！潭州日语VIP班优惠活动最后3个名额！名额结束后不再赠送万元大礼包+终身答疑卡，答疑权限调整为一年。支持分期预订（大专以上学历者最高可分12期，每月仅需500元）。想咨询马上回【参加报名】，不然名额就没有了！！！！！！！', 'N', null, '4', '1472628581001', '39', 'Y'), ('90', null, '1', '出大事了！！！！潭州日语VIP班优惠活动最后3个名额！名额结束后不再赠送万元大礼包+终身答疑卡，答疑权限调整为一年。支持分期预订（大专以上学历者最高可分12期，每月仅需500元）。想咨询马上回【参加报名】，不然名额就没有了！！！！！！！', 'N', null, '4', '1472628598600', '32', 'N'), ('91', null, '1', '出大事了！！！！潭州日语VIP班优惠活动最后3个名额！名额结束后不再赠送万元大礼包+终身答疑卡，答疑权限调整为一年。支持分期预订（大专以上学历者最高可分12期，每月仅需500元）。想咨询马上回【参加报名】，不然名额就没有了！！！！！！！', 'N', null, '4', '1472628621078', '97', 'N');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_dept`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE `tbl_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` text COLLATE utf8_unicode_ci,
  `phone` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `tbl_dept`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_dept` VALUES ('1', '超级管理', '0', '', null, null), ('2', '总经办', '1448359191007', '', null, null), ('3', '综管部', '1448359201217', '', null, null), ('4', '招商部', '1448359209827', '', null, null), ('5', '投融资', '1448359217557', '', null, null), ('6', '平台管理', '1448359225517', '', null, null), ('7', '电子商务', '1448359233487', '', null, null), ('8', '项目部', '1448359240177', '', null, null), ('9', '技术部', '1448359247457', '', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `tbl_group`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_group`;
CREATE TABLE `tbl_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `tbl_group`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_group` VALUES ('1', '电子商务', '1448243921117', '', '2'), ('2', '集团总部', '1448243921117', '', null), ('3', '总经办', '1448243939093', '', '2'), ('4', '综管部', '1448243947329', '', '2'), ('5', '招商部', '1448243961256', '', '2'), ('6', '投融资', '1448243969780', '', '2'), ('7', '平台管理', '1448243978741', '', '2'), ('8', '项目部', '1448243987147', '', '2'), ('9', '技术部', '1448243994090', '', '2'), ('10', '超级管理', '0', '', '2');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_level`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_level`;
CREATE TABLE `tbl_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` text COLLATE utf8_unicode_ci,
  `create_time` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `tbl_level`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_level` VALUES ('1', 'P', '<span style=\"color: rgb(42, 42, 42); font-family: Arial, Helvetica, \'Microsoft Yahei\', \'Hiragino Sans GB\', sans-serif; font-size: 18px; text-align: center; text-indent: 36px;\">技术岗</span>', '1474877142353', null), ('2', 'M', '<span style=\"color: rgb(42, 42, 42); font-family: Arial, Helvetica, \'Microsoft Yahei\', \'Hiragino Sans GB\', sans-serif; font-size: 18px; text-align: center; text-indent: 36px;\">管理岗</span>', '1474877158552', null), ('3', '1', '一般空缺，为非常低端岗位预留', '1474877294636', '1'), ('4', '2', '一般空缺，为非常低端岗位预留', '1474877332771', '1'), ('5', '3', '助理', '1474877361756', '1'), ('6', '4', '初级专员', '1474877378618', '1'), ('7', '5', '高级工程师', '1474877399827', '1'), ('8', '6', '资深工程师', '1474877412430', '1'), ('9', '7', '技术专家', '1474877425057', '1'), ('10', '8', '高级专家', '1474877443030', '1'), ('11', '9', '资深专家', '1474877456201', '1'), ('12', '10', '研究员', '1474877467646', '1'), ('13', '1', '主管', '1474877483057', '2'), ('14', '2', '经理', '1474877499606', '2'), ('15', '3', '高级经理', '1474877512819', '2'), ('16', '4', '核心总监', '1474877527464', '2'), ('17', '5', '高级总监', '1474877540137', '2');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_message`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message`;
CREATE TABLE `tbl_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_user_id` int(11) DEFAULT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `create_time` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_read` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `tbl_message`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_message` VALUES ('91', '5', '4', '发送离线消息', '1467270110761', 'Y'), ('92', '5', '4', '测试离线消息', '1467270461062', 'Y'), ('93', '4', '5', '测试离线恢复消息', '1467270519836', 'Y'), ('94', '5', '4', '测试成功...', '1467270549410', 'Y'), ('95', '5', '4', '测试消息', '1467270754237', 'Y'), ('96', '4', '5', '太屌了 \r\n', '1467270808031', 'Y'), ('97', '5', '4', 'sdsda实打实的阿斯顿阿斯顿', '1467270826159', 'Y'), ('98', '4', '5', '放假的说法', '1467270833702', 'Y'), ('99', '5', '4', '让他人同人图', '1467270842319', 'Y'), ('100', '5', '4', '什么鬼', '1467276381895', 'Y'), ('101', '4', '5', 'tryrtyrtyrtyrtyrty', '1467276431557', 'Y'), ('102', '4', '5', 'TTTTTTBBBBBBB', '1467276628871', 'Y'), ('103', '4', '5', '表白YYDD', '1467276681768', 'Y'), ('104', '5', '4', 'fertertesrtertert', '1467277285019', 'Y'), ('105', '5', '4', 'gtyutyutyutyutyu', '1467277372303', 'Y'), ('106', '4', '5', 'rty5675675675', '1467277495944', 'Y'), ('107', '5', '4', 'dfgdfgdfgdfgdfg', '1467277606177', 'Y'), ('108', '5', '4', 'ertertetert', '1467277717889', 'Y'), ('109', '5', '4', 'ertertetetert', '1467277860636', 'Y'), ('110', '4', '5', 'gfhhfghfghfgh', '1467278055199', 'Y'), ('111', '5', '4', 'dfgdfgdgdgfdfg', '1467278255904', 'Y'), ('112', '4', '5', 'rtyrtyrtyrtyrty', '1467278287822', 'Y'), ('113', '5', '4', 'fghfghfghfgh', '1467278352152', 'Y'), ('114', '4', '5', 'yuityutuytyutyu', '1467278378531', 'Y'), ('115', '4', '5', 'rtyrtyryryrty', '1467278504270', 'Y'), ('116', '5', '4', 'rtyryrtyryrty', '1467278539928', 'Y'), ('117', '4', '5', 'fhfghfgh', '1467278699025', 'Y'), ('118', '5', '4', 'rtyrtyrty', '1467278803324', 'Y'), ('119', '4', '5', 'ertertetetertet', '1467278963558', 'Y'), ('120', '5', '4', '玩儿玩儿玩儿', '1467280586358', 'Y'), ('121', '4', '5', 'ertertertert', '1467280653478', 'Y'), ('122', '5', '4', 'werwerwer', '1467280733017', 'Y'), ('123', '4', '5', 'asdadasdadasd', '1467280803553', 'Y'), ('124', '5', '4', '45645646456', '1467280822918', 'Y'), ('125', '5', '4', 'ertetert', '1467280840724', 'Y'), ('126', '4', '5', '4564645646456', '1467280867876', 'Y'), ('127', '5', '4', 'r6yrtyrtyryrty', '1467280887699', 'Y'), ('128', '5', '4', 'fghfghfhfghfgh', '1467348093100', 'Y'), ('129', '4', '5', 'yuiyuiyuiyui', '1467354497129', 'Y'), ('130', '5', '4', 'baby 你好帅', '1467689937801', 'Y'), ('131', '4', '5', 'Sm gui', '1467690334372', 'Y'), ('132', '4', '5', 'Hhhhfff', '1467690572088', 'Y'), ('133', '5', '4', 'gjgjgjgjhggjhghj', '1467690587318', 'Y'), ('134', '5', '4', 'gjhgjhgjgjgj\r\n', '1467690600012', 'Y'), ('135', '5', '4', 'gdfgdgdgdf\r\n', '1467690710474', 'Y'), ('136', '4', '5', 'Djjfjedjjd', '1467690732749', 'Y'), ('137', '5', '4', '54654646456', '1467690746241', 'Y'), ('138', '4', '5', '这是一则离线消息', '1472713041832', 'Y'), ('139', '4', '5', '你在干吗？', '1473818717810', 'Y'), ('140', '5', '4', '什么鬼啊', '1473818759047', 'Y'), ('141', '4', '5', '阿里嘎多裹扎伊马斯', '1473818783306', 'Y'), ('142', '4', '5', '你缺点个？\r\n', '1473818812464', 'Y'), ('143', '5', '4', '孙子', '1474948165966', 'Y'), ('144', '5', '4', '什么鬼', '1474948347445', 'Y'), ('145', '5', '4', '徐DNF', '1474948364132', 'Y'), ('146', '5', '4', '非常关键', '1474948383149', 'Y'), ('147', '5', '4', '法国环境', '1474948400341', 'Y'), ('148', '4', '5', 'fgfgfg', '1474948416420', 'Y'), ('149', '5', '4', '发布会', '1474948424802', 'Y'), ('150', '5', '4', '干干净净', '1474948436363', 'Y'), ('151', '5', '4', '解放军妇女', '1474948754419', 'Y'), ('152', '5', '4', '刚刚哈哈', '1474948765677', 'Y'), ('153', '5', '4', '法国共和国', '1474948785729', 'Y'), ('154', '5', '4', '刚刚好', '1474948800974', 'Y'), ('155', '5', '4', 'AAA', '1474961183576', 'Y');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_progress`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_progress`;
CREATE TABLE `tbl_progress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_time` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `tbl_progress`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_progress` VALUES ('1', '这是一个计划', '1449417600000', '1449676799000', '1449494313117', '这是一个计划', '15', '5', null), ('2', '你想干什么', '1449417600000', '1449763199000', '1449494898290', '你想干什么', '15', '8', null), ('3', '我是设呢但是dddd哈哈哈哈', '1449676800000', '1450454399000', '1449495283015', '我是设呢但是', '1', '6', null), ('4', 'BBBB', '1449417600000', '1449503999000', '1449495482762', 'AAAA', '1', '8', null), ('5', '这个事件好屌', '1449504000000', '1451231999000', '1449557894538', '这个事件好屌', '15', '4', null), ('7', '设呢么鬼啊', '1454256000000', '1455119999000', '1449558417203', '设呢么鬼啊', '15', '6', null), ('8', 'AASDASD', '1449676800000', '1449935999000', '1449710480305', 'ASDASDASD', '16', '4', null), ('9', '25545', '1468512000000', '1469116799000', '1467347925667', '56555', '1', '6', null), ('12', '项目创建', '1467648000000', '1467734399000', '1467689290785', '项目创建', '19', '4', 'N'), ('13', '项目正式开始', '1467648000000', '1468079999000', '1467689720691', '项目正式开始', '19', '5', 'Y');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_project`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_project`;
CREATE TABLE `tbl_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `leader` int(11) DEFAULT NULL,
  `create_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_index` int(11) DEFAULT NULL,
  `info` text COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `tbl_project`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_project` VALUES ('1', '肺癌早期检测产品的开发', null, '1448502788917', '0', '通过检测肺癌相关性高度的miRNA来实现早期癌症的诊断，最终产品以试剂盒和软件的形式投放市场', '4'), ('15', '可吸收性生物工程专用材料', null, '1449107034043', '0', '', '4'), ('16', 'HPV检测试剂盒', null, '1449108314944', '0', '', '4'), ('17', '哈哈哈', null, '1450150651873', '0', '', '5'), ('19', 'CAR-T细胞再生繁殖', null, '1467689197913', '0', '', '4'), ('21', '干细胞及免疫细胞', null, '1472630766828', '0', null, '4');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_theme`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_theme`;
CREATE TABLE `tbl_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme_index` int(11) DEFAULT NULL,
  `info` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `tbl_theme`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_theme` VALUES ('1', '肺癌', '1448503960087', '0', '肺癌');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_user`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `portrait` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `tbl_user`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_user` VALUES ('1', 'admin', '12345678901', '管理员', 'c26be8aaf53b15054896983b43eb6a65', 'upload_images/admin.jpg', '超级管理员', '1449490318152', '1', '10', null), ('4', 'imks@qq.com', '15171455782', 'Max', 'c26be8aaf53b15054896983b43eb6a65', 'upload_images/imks@qq.com.jpg', '开发工程师', '1446452936083', '7', '1', '12'), ('5', 'ims@qq.com', '15020005510', '马昇', 'c26be8aaf53b15054896983b43eb6a65', '', '产品经理', '1448364251225', '7', '1', null), ('6', 'xli@qq.com', '13585079115', '李雪飞', 'c26be8aaf53b15054896983b43eb6a65', '', '这个我也不知道', '1448364287215', '2', '3', null), ('7', 'junjie.yang@qq.com', '12345678901', '杨俊杰', 'c26be8aaf53b15054896983b43eb6a65', '', '这个我该怎么填', '1449490237817', '2', '3', null), ('8', 'lisa.li@qq.com', '12345678901', '李莎', 'c26be8aaf53b15054896983b43eb6a65', '', '我该填什么呢', '1449490276469', '3', '4', null), ('9', 'runqing.li@qq.com', '12345678901', '李润清', 'c26be8aaf53b15054896983b43eb6a65', '', '好像很厉害', '1449490318152', '4', '5', null);
COMMIT;

-- ----------------------------
--  Table structure for `tbl_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_group`;
CREATE TABLE `tbl_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `tbl_user_project`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_project`;
CREATE TABLE `tbl_user_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `create_time` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `tbl_user_project`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_user_project` VALUES ('2', '6', '15', '1449457764815'), ('3', '5', '15', '1449458011795'), ('7', '6', '1', '1449458792311'), ('11', '5', '1', '1449460218915'), ('12', '6', '16', '1449488738578'), ('13', '7', '15', '1449494952607'), ('14', '4', '17', '1450150682817'), ('15', '8', '1', '1467347873070');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
