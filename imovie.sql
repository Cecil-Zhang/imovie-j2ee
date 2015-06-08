/*
SQLyog Trial v11.27 (64 bit)
MySQL - 5.6.20 : Database - imovie
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`imovie` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `imovie`;

/*Table structure for table `tb_activity` */

DROP TABLE IF EXISTS `tb_activity`;

CREATE TABLE `tb_activity` (
  `activityId` int(11) NOT NULL AUTO_INCREMENT,
  `activityState` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '进行中，已结束',
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`activityId`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tb_activity` */

insert  into `tb_activity`(`activityId`,`activityState`,`version`) values (26,'进行中',0),(28,'已结束',1),(53,'已结束',1),(60,'进行中',0);

/*Table structure for table `tb_answer` */

DROP TABLE IF EXISTS `tb_answer`;

CREATE TABLE `tb_answer` (
  `answerId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `answer` char(1) COLLATE utf8_bin DEFAULT NULL,
  `prizeCredit` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`answerId`),
  UNIQUE KEY `UK_8abmshdkp1980704y6ky4h0c5` (`questionId`),
  KEY `FK_answerTo` (`questionId`),
  KEY `FK_linkTo3` (`orderId`),
  CONSTRAINT `FK_answerTo` FOREIGN KEY (`questionId`) REFERENCES `tb_questionare` (`questionId`),
  CONSTRAINT `FK_linkTo3` FOREIGN KEY (`orderId`) REFERENCES `tb_order` (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tb_answer` */

insert  into `tb_answer`(`answerId`,`orderId`,`questionId`,`answer`,`prizeCredit`,`version`) values (2,1,9,'A',0,1),(3,1,10,'B',8,1),(4,15,23,'A',NULL,0),(5,15,24,'B',NULL,0);

/*Table structure for table `tb_level` */

DROP TABLE IF EXISTS `tb_level`;

CREATE TABLE `tb_level` (
  `levelId` int(11) NOT NULL AUTO_INCREMENT,
  `levelName` varchar(32) COLLATE utf8_bin NOT NULL,
  `upperLimit` int(11) NOT NULL,
  `lowerLimit` int(11) NOT NULL,
  `discount` float NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`levelId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tb_level` */

insert  into `tb_level`(`levelId`,`levelName`,`upperLimit`,`lowerLimit`,`discount`,`version`) values (1,'普通会员',200,0,0.95,0),(2,'铜牌会员',500,200,0.9,0),(3,'银牌会员',900,500,0.8,0),(4,'金牌会员',10000000,900,0.7,0);

/*Table structure for table `tb_member` */

DROP TABLE IF EXISTS `tb_member`;

CREATE TABLE `tb_member` (
  `memberId` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tb_member` */

/*Table structure for table `tb_memberinfo` */

DROP TABLE IF EXISTS `tb_memberinfo`;

CREATE TABLE `tb_memberinfo` (
  `memberId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_bin NOT NULL,
  `age` int(11) DEFAULT NULL,
  `residence` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `gender` varchar(6) COLLATE utf8_bin DEFAULT 'male',
  `image` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `bank` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `bankAccout` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `balance` float DEFAULT '0',
  `credit` int(11) DEFAULT '0',
  `state` varchar(32) COLLATE utf8_bin DEFAULT '未激活',
  `lastRecharge` timestamp NULL DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`memberId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tb_memberinfo` */

insert  into `tb_memberinfo`(`memberId`,`username`,`age`,`residence`,`gender`,`image`,`bank`,`bankAccout`,`balance`,`credit`,`state`,`lastRecharge`,`version`) values (0,'陈阵',11,'鼓楼区','male','conan.jpg','中国工商银行','99999999',1437.64,1400,'已暂停','2014-03-22 10:57:20',9),(1,'杰克',21,'栖霞区','female','conan670336.jpg','中国建设银行','1234567',1100,0,'已激活','2014-03-24 09:57:43',0),(2,'咸蛋超人',34,'栖霞区','male','conan384517.jpg','支付宝','1234567',4976,114,'已激活','2014-03-24 13:57:59',3),(3,'小龙女',23,'玄武区','female','2_bigAvatar121452.jpg','微信支付','1234567',67,456,'已激活','2015-03-25 15:01:01',3);

/*Table structure for table `tb_movie` */

DROP TABLE IF EXISTS `tb_movie`;

CREATE TABLE `tb_movie` (
  `movieId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `poster` varchar(128) COLLATE utf8_bin NOT NULL,
  `type` varchar(32) COLLATE utf8_bin NOT NULL,
  `duration` int(11) NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `movieState` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`movieId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tb_movie` */

insert  into `tb_movie`(`movieId`,`name`,`poster`,`type`,`duration`,`description`,`movieState`,`version`) values (1,'雪国列车','xglc.jpg','科幻/剧情',150,' 2031年，人类试图阻止全球变暖的实验失败，极寒造成地球上绝大部分生命死亡。 在冰河灾难中幸存下来的所有人登上了一辆如同诺亚方舟的列车，列车依靠永动机绕着地球不停行驶。在这列车厢有着等级之分的列车上， 饱受饥饿之苦、生活在恶劣环境的末节车厢的人们在革命领袖柯蒂斯的带领下，为了生存一节车厢一节车厢的向前突进，掀起了一场向车头进军的“革命”。','已生效',0),(2,'蜘蛛侠3','zzx.jpg','科幻/动作',120,'在经历了重重考验之后，代表正义的蜘蛛侠成为了人人敬仰的正义英雄，抱得美人归。但是，被“毒液”共生体寄生下的帕克开始变得目中无人，邪恶开始在他的心中反客为主。蜘蛛侠的道德准则越来越模糊。','已生效',1),(3,'金刚狼','jgl.jpg','科幻/动作',130,'琴·格雷死后罗根噩梦不断，后来罗根在加拿大一个荒山野岭里度日，之后遇到了日本女孩雪绪，雪绪帮罗根解了围，罗根跟着雪绪到了日本，但让罗根没想到的是，曾经在二战中拼死救过的日本军人矢志田居然恩将仇报要杀死自己，而金刚狼的自愈能力正在减弱，最后金刚狼恢复能力，杀死了矢志田','已下线',1),(5,'狼图腾','ltt471231.jpg','剧情 / 冒险',120,'1967年，北京知青陈阵和杨克响应国家上山下乡的号召，从北京来到了 \r\n狼图腾 剧照、工作照\r\n狼图腾 剧照、工作照(24张)\r\n内蒙古额仑大草原插队。在大草原上，他们结识了蒙古族牧民毕利格一家，也见识到了草原上最令人敬畏的动物：狼。在与狼群的接触过程中，陈阵对这一物种有了强烈的兴趣，甚至有了想自己养一只小狼的念头。就在此时，一群外来人贪婪地掠夺了狼群储存过冬的黄羊，打破了狼群和牧民之间的生态平衡。而以场部主任包顺贵为首的生产队员更是发起了一场灭狼运动，让狼群和人类之间的关系陷入到了剑拔弩张的地步。','已生效',0);

/*Table structure for table `tb_order` */

DROP TABLE IF EXISTS `tb_order`;

CREATE TABLE `tb_order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `planId` int(11) NOT NULL,
  `userId` decimal(7,0) DEFAULT NULL,
  `orderSeat` text COLLATE utf8_bin NOT NULL,
  `purchaseTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `orderPrice` float NOT NULL,
  `orderCredit` int(11) NOT NULL,
  `orderState` tinyint(4) DEFAULT '0' COMMENT '0代表尚未参加活动，1代表已经参加活动',
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FK_buy` (`planId`),
  KEY `FK_own` (`userId`),
  CONSTRAINT `FK_buy` FOREIGN KEY (`planId`) REFERENCES `tb_screeningplan` (`planId`),
  CONSTRAINT `FK_own` FOREIGN KEY (`userId`) REFERENCES `tb_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tb_order` */

insert  into `tb_order`(`orderId`,`planId`,`userId`,`orderSeat`,`purchaseTime`,`orderPrice`,`orderCredit`,`orderState`,`version`) values (1,5,'1234567','1排1座,1排2座,1排3座,','2015-03-18 21:54:51',156.75,157,1,1),(4,7,'1234567','5排1座,5排2座,5排3座,','2015-10-19 13:34:31',162,162,0,0),(5,4,'3761034','3排5座,3排6座,','2015-02-12 17:44:23',114,114,0,0),(6,4,'1234567','2排5座,2排6座,','2015-01-21 17:44:24',96,96,0,0),(7,4,'1234567','3排2座,3排3座,','2015-04-21 17:44:25',120,120,0,0),(8,4,'1234567','3排2座,3排3座,','2015-05-21 17:44:26',120,120,0,0),(9,4,'1234567','3排2座,3排3座,','2015-06-21 17:44:27',120,120,0,0),(10,4,'1234567','3排2座,3排3座,','2015-07-21 17:44:28',120,120,0,0),(11,4,NULL,'2排7座,','2015-08-21 17:44:28',60,60,0,0),(12,4,NULL,'8排7座,','2015-09-21 17:44:32',60,60,0,0),(13,7,'6411743','1排9座,2排9座,3排9座,4排1座,5排9座,6排8座,7排8座,8排8座,','2015-03-25 16:51:22',456,456,0,0),(14,5,'1234567','1排1座,1排2座,','2015-03-26 00:07:52',110,110,0,0),(15,9,'1234567','1排1座,1排2座,','2015-03-26 13:14:42',84,84,1,1);

/*Table structure for table `tb_questionare` */

DROP TABLE IF EXISTS `tb_questionare`;

CREATE TABLE `tb_questionare` (
  `questionId` int(11) NOT NULL AUTO_INCREMENT,
  `activityId` int(11) NOT NULL,
  `questionType` tinyint(1) NOT NULL COMMENT '0代表开放试题，1代表标准试题',
  `questionCredit` int(11) DEFAULT NULL,
  `title` text COLLATE utf8_bin,
  `answerA` text COLLATE utf8_bin,
  `answerB` text COLLATE utf8_bin,
  `answerC` text COLLATE utf8_bin,
  `correct` char(1) COLLATE utf8_bin NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`questionId`),
  KEY `FK_question` (`activityId`),
  CONSTRAINT `FK_question` FOREIGN KEY (`activityId`) REFERENCES `tb_activity` (`activityId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tb_questionare` */

insert  into `tb_questionare`(`questionId`,`activityId`,`questionType`,`questionCredit`,`title`,`answerA`,`answerB`,`answerC`,`correct`,`version`) values (7,26,1,6,'蜘蛛侠的英文名叫什么？','X-man','Iron Man','Spider Man','C',0),(9,28,1,7,'蜘蛛侠的英文名叫什么？','Iron Man','Spider Man','X-man','B',0),(10,28,0,8,'金刚狼女朋友死了吗','死了','没死','不知道','B',1),(23,60,0,5,'地球最后变暖了吗','变暖了','没有','不知道','无',0),(24,60,1,6,'车长最后死了吗','没死','死了','不知道','B',0);

/*Table structure for table `tb_recharge` */

DROP TABLE IF EXISTS `tb_recharge`;

CREATE TABLE `tb_recharge` (
  `rechargeId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` decimal(7,0) NOT NULL,
  `rechargeTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `amount` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`rechargeId`),
  KEY `FK_recharge` (`userId`),
  CONSTRAINT `FK_recharge` FOREIGN KEY (`userId`) REFERENCES `tb_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tb_recharge` */

insert  into `tb_recharge`(`rechargeId`,`userId`,`rechargeTime`,`amount`,`version`) values (1,'6295458','2015-03-20 19:46:10',100,0),(2,'1234567','2015-02-20 21:01:48',100,0),(3,'1234567','2015-01-20 21:01:54',200,0),(4,'6411743','2015-03-25 13:24:44',123,0),(5,'6411743','2015-03-25 14:54:05',200,0),(6,'6411743','2015-03-25 15:01:00',200,0);

/*Table structure for table `tb_screeningplan` */

DROP TABLE IF EXISTS `tb_screeningplan`;

CREATE TABLE `tb_screeningplan` (
  `planId` int(11) NOT NULL AUTO_INCREMENT,
  `activityId` int(11) DEFAULT NULL,
  `movieId` int(11) DEFAULT NULL,
  `screeningTime` timestamp NULL DEFAULT NULL,
  `screeningHall` varchar(32) COLLATE utf8_bin NOT NULL,
  `seatPrice` int(11) NOT NULL,
  `language` varchar(16) COLLATE utf8_bin NOT NULL,
  `planState` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '待批准，已生效，已过时',
  `seatSaled` int(11) DEFAULT '0',
  `seat01` tinyint(1) DEFAULT NULL,
  `seat02` tinyint(1) DEFAULT NULL,
  `seat03` tinyint(1) DEFAULT NULL,
  `seat04` tinyint(1) DEFAULT NULL,
  `seat05` tinyint(1) DEFAULT NULL,
  `seat06` tinyint(1) DEFAULT NULL,
  `seat07` tinyint(1) DEFAULT NULL,
  `seat08` tinyint(1) DEFAULT NULL,
  `seat09` tinyint(1) DEFAULT NULL,
  `seat11` tinyint(1) DEFAULT NULL,
  `seat12` tinyint(1) DEFAULT NULL,
  `seat13` tinyint(1) DEFAULT NULL,
  `seat14` tinyint(1) DEFAULT NULL,
  `seat15` tinyint(1) DEFAULT NULL,
  `seat16` tinyint(1) DEFAULT NULL,
  `seat17` tinyint(1) DEFAULT NULL,
  `seat18` tinyint(1) DEFAULT NULL,
  `seat19` tinyint(1) DEFAULT NULL,
  `seat21` tinyint(1) DEFAULT NULL,
  `seat22` tinyint(1) DEFAULT NULL,
  `seat23` tinyint(1) DEFAULT NULL,
  `seat24` tinyint(1) DEFAULT NULL,
  `seat25` tinyint(1) DEFAULT NULL,
  `seat26` tinyint(1) DEFAULT NULL,
  `seat27` tinyint(1) DEFAULT NULL,
  `seat28` tinyint(1) DEFAULT NULL,
  `seat29` tinyint(1) DEFAULT NULL,
  `seat31` tinyint(1) DEFAULT NULL,
  `seat32` tinyint(1) DEFAULT NULL,
  `seat33` tinyint(1) DEFAULT NULL,
  `seat34` tinyint(1) DEFAULT NULL,
  `seat35` tinyint(1) DEFAULT NULL,
  `seat36` tinyint(1) DEFAULT NULL,
  `seat37` tinyint(1) DEFAULT NULL,
  `seat38` tinyint(1) DEFAULT NULL,
  `seat39` tinyint(1) DEFAULT NULL,
  `seat41` tinyint(1) DEFAULT NULL,
  `seat42` tinyint(1) DEFAULT NULL,
  `seat43` tinyint(1) DEFAULT NULL,
  `seat44` tinyint(1) DEFAULT NULL,
  `seat45` tinyint(1) DEFAULT NULL,
  `seat46` tinyint(1) DEFAULT NULL,
  `seat47` tinyint(1) DEFAULT NULL,
  `seat48` tinyint(1) DEFAULT NULL,
  `seat49` tinyint(1) DEFAULT NULL,
  `seat51` tinyint(1) DEFAULT NULL,
  `seat52` tinyint(1) DEFAULT NULL,
  `seat53` tinyint(1) DEFAULT NULL,
  `seat54` tinyint(1) DEFAULT NULL,
  `seat55` tinyint(1) DEFAULT NULL,
  `seat56` tinyint(1) DEFAULT NULL,
  `seat57` tinyint(1) DEFAULT NULL,
  `seat58` tinyint(1) DEFAULT NULL,
  `seat59` tinyint(1) DEFAULT NULL,
  `seat61` tinyint(1) DEFAULT NULL,
  `seat62` tinyint(1) DEFAULT NULL,
  `seat63` tinyint(1) DEFAULT NULL,
  `seat64` tinyint(1) DEFAULT NULL,
  `seat65` tinyint(1) DEFAULT NULL,
  `seat66` tinyint(1) DEFAULT NULL,
  `seat67` tinyint(1) DEFAULT NULL,
  `seat68` tinyint(1) DEFAULT NULL,
  `seat69` tinyint(1) DEFAULT NULL,
  `seat71` tinyint(1) DEFAULT NULL,
  `seat72` tinyint(1) DEFAULT NULL,
  `seat73` tinyint(1) DEFAULT NULL,
  `seat74` tinyint(1) DEFAULT NULL,
  `seat75` tinyint(1) DEFAULT NULL,
  `seat76` tinyint(1) DEFAULT NULL,
  `seat77` tinyint(1) DEFAULT NULL,
  `seat78` tinyint(1) DEFAULT NULL,
  `seat79` tinyint(1) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`planId`),
  KEY `FK_has` (`activityId`),
  KEY `FK_screen` (`movieId`),
  CONSTRAINT `FK_has` FOREIGN KEY (`activityId`) REFERENCES `tb_activity` (`activityId`),
  CONSTRAINT `FK_screen` FOREIGN KEY (`movieId`) REFERENCES `tb_movie` (`movieId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tb_screeningplan` */

insert  into `tb_screeningplan`(`planId`,`activityId`,`movieId`,`screeningTime`,`screeningHall`,`seatPrice`,`language`,`planState`,`seatSaled`,`seat01`,`seat02`,`seat03`,`seat04`,`seat05`,`seat06`,`seat07`,`seat08`,`seat09`,`seat11`,`seat12`,`seat13`,`seat14`,`seat15`,`seat16`,`seat17`,`seat18`,`seat19`,`seat21`,`seat22`,`seat23`,`seat24`,`seat25`,`seat26`,`seat27`,`seat28`,`seat29`,`seat31`,`seat32`,`seat33`,`seat34`,`seat35`,`seat36`,`seat37`,`seat38`,`seat39`,`seat41`,`seat42`,`seat43`,`seat44`,`seat45`,`seat46`,`seat47`,`seat48`,`seat49`,`seat51`,`seat52`,`seat53`,`seat54`,`seat55`,`seat56`,`seat57`,`seat58`,`seat59`,`seat61`,`seat62`,`seat63`,`seat64`,`seat65`,`seat66`,`seat67`,`seat68`,`seat69`,`seat71`,`seat72`,`seat73`,`seat74`,`seat75`,`seat76`,`seat77`,`seat78`,`seat79`,`version`) values (4,26,1,'2015-05-07 23:39:16','3号厅',60,'国语','已生效',16,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,1,1,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,2),(5,28,2,'2015-04-16 00:00:28','2号厅',55,'国语','已生效',25,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(7,53,3,'2015-04-02 13:39:16','3号厅',60,'英语','已结束',14,1,1,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,3),(8,NULL,3,'2015-04-20 20:39:16','1号厅',60,'国语','已结束',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(9,60,1,'2015-03-26 22:50:41','1号厅',60,'英语','已生效',2,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9),(10,60,1,'2015-03-29 09:50:41','1号厅',55,'英语','已生效',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8),(11,NULL,1,'2013-03-29 10:00:00','1号厅',60,'英语','待批准',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(12,NULL,5,'2015-03-26 21:22:20','1号厅',45,'国语','待批准',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(13,NULL,5,'2015-03-26 21:24:21','1号厅',45,'英语','待批准',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(14,NULL,5,'2015-03-27 10:00:41','1号厅',45,'英语','待批准',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `userId` decimal(7,0) NOT NULL,
  `password` varchar(32) COLLATE utf8_bin NOT NULL,
  `role` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT 'member',
  `memberId` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `UK_qq7iieub3cbdbjucv16ct3qsx` (`memberId`),
  CONSTRAINT `FK_linkkTo` FOREIGN KEY (`memberId`) REFERENCES `tb_memberinfo` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tb_user` */

insert  into `tb_user`(`userId`,`password`,`role`,`memberId`,`version`) values ('1000000','0000000','manager',NULL,0),('1111111','1111111','worker',NULL,0),('1234567','1234567','member',0,0),('3761034','1234567','member',2,3),('6295458','1234567','member',1,0),('6411743','1234567','member',3,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
