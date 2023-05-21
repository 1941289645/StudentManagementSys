-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 124.71.166.37    Database: stumansys
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `deptid` int NOT NULL,
  `deptname` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phonecode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`deptid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'文学院','东区1号楼','3102312390'),(2,'计算机学院','东区2号楼','31048392482'),(3,'通信学院','东区3号楼','31032312314'),(4,'马克思学院','东区4号楼','31028371823'),(5,'美术学院','本部美术学院楼','31027853459'),(6,'理学院','本部G楼','31057345783'),(7,'音乐学院','本部音乐学院楼','31068594969'),(8,'材料学院','东区5号楼','31068594068'),(9,'生科学院','东区6号楼','31023123411'),(10,'机电学院','东区7号楼','31024128812');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson` (
  `Lnumber` int NOT NULL,
  `Lname` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Lcredit` int DEFAULT NULL,
  `Lcollege` int DEFAULT NULL,
  `gradeindex` int DEFAULT NULL,
  PRIMARY KEY (`Lnumber`) USING BTREE,
  KEY `lesson_academy_Anumber_fk` (`Lcollege`) USING BTREE,
  CONSTRAINT `lesson_department_null_fk` FOREIGN KEY (`Lcollege`) REFERENCES `department` (`deptid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (10032,'大学语文',6,1,37),(20111,'面向对象程序设计',4,2,46),(20123,'数据库原理',4,2,55),(20132,'计算机组成原理(1)',5,2,55),(20133,'计算机组成原理(2)',5,2,46),(30012,'数字电路',6,3,28),(30013,'模拟电路',5,3,55),(30022,'通信原理',5,3,46),(40012,'毛泽东思想概论',3,4,46),(40013,'马克思主义原理',3,4,46),(40014,'形势与政策',1,4,55),(50011,'山水基础',8,5,46),(50012,'花鸟小品',5,5,46),(50013,'创意写生',4,5,46),(60001,'微积分(1)',5,6,46),(60002,'微积分(2)',5,6,46),(60003,'微积分(3)',5,6,46),(60012,'概率论与数理统计',4,6,46),(70012,'中国经典音乐',4,7,46),(70013,'外国经典音乐',4,7,46),(70021,'视唱练耳',4,7,46),(80023,'材料力学',5,8,46),(80027,'高分子材料',4,8,46),(80029,'有机化学',4,8,46),(80030,'无机化学',5,8,55),(90012,'生命科学导论',5,9,55);
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessonchoose`
--

DROP TABLE IF EXISTS `lessonchoose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessonchoose` (
  `snumber` int NOT NULL,
  `Lnumber` int NOT NULL,
  `Tnumber` int NOT NULL,
  `psgrade` int DEFAULT NULL,
  `ksgrade` int DEFAULT NULL,
  `totalgrade` int DEFAULT NULL,
  `GPA` float DEFAULT NULL,
  `semester` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`snumber`,`Tnumber`,`semester`,`Lnumber`) USING BTREE,
  KEY `lessonchoose_lesson_Lnumber_fk` (`Lnumber`) USING BTREE,
  KEY `lessonchoose_teacher_null_fk` (`Tnumber`) USING BTREE,
  CONSTRAINT `lessonchoose_lesson_Lnumber_fk` FOREIGN KEY (`Lnumber`) REFERENCES `lesson` (`Lnumber`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lessonchoose_student_null_fk` FOREIGN KEY (`snumber`) REFERENCES `student` (`studentid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lessonchoose_teacher_Tnumber_fk` FOREIGN KEY (`Tnumber`) REFERENCES `teacher` (`Tnumber`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessonchoose`
--

LOCK TABLES `lessonchoose` WRITE;
/*!40000 ALTER TABLE `lessonchoose` DISABLE KEYS */;
INSERT INTO `lessonchoose` VALUES (20121331,20111,10023,NULL,NULL,NULL,NULL,'22年冬季'),(20121331,20123,10086,70,99,84,3.3,'22年冬季'),(20121331,20132,10086,70,99,84,3.3,'22年冬季'),(20121331,10032,10098,NULL,NULL,NULL,NULL,'22年冬季'),(20121331,40014,10145,NULL,NULL,NULL,NULL,'22年冬季'),(20121331,60012,10189,NULL,NULL,NULL,NULL,'22年冬季'),(20121331,20111,10193,NULL,NULL,NULL,NULL,'22年冬季'),(20121333,20111,10023,NULL,NULL,NULL,NULL,'22年冬季'),(20121333,20132,10086,87,60,74,2.3,'22年冬季'),(20121333,10032,10098,NULL,NULL,NULL,NULL,'22年冬季'),(20121333,60012,10189,NULL,NULL,NULL,NULL,'22年冬季'),(20121333,20111,10193,NULL,NULL,NULL,NULL,'22年冬季'),(20121335,20132,10025,NULL,NULL,NULL,NULL,'22年冬季'),(20121335,40013,10146,NULL,NULL,NULL,NULL,'22年冬季'),(20121336,20132,10023,NULL,NULL,NULL,NULL,'22年冬季'),(20121336,40014,10144,NULL,NULL,NULL,NULL,'22年冬季'),(20121336,20111,10193,NULL,NULL,NULL,NULL,'22年冬季'),(20121337,20111,10023,NULL,NULL,NULL,NULL,'22年冬季'),(20121337,20123,10023,NULL,NULL,NULL,NULL,'22年冬季'),(20121337,20132,10086,95,65,80,3,'22年冬季'),(20121337,10032,10098,NULL,NULL,NULL,NULL,'22年冬季'),(20121341,20123,10086,90,55,72,2.3,'22年冬季'),(20121341,20132,10086,NULL,NULL,NULL,NULL,'22年冬季'),(20121342,20123,10086,77,80,78,3,'22年冬季'),(20121342,20132,10086,NULL,NULL,NULL,NULL,'22年冬季'),(20121345,20123,10023,NULL,NULL,NULL,NULL,'22年冬季'),(20121345,20132,10086,NULL,NULL,NULL,NULL,'22年冬季'),(20121362,20111,10023,NULL,NULL,NULL,NULL,'22年冬季'),(20121362,20132,10023,NULL,NULL,NULL,NULL,'22年冬季'),(20121362,20132,10025,NULL,NULL,NULL,NULL,'22年冬季');
/*!40000 ALTER TABLE `lessonchoose` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `InsertLessonChoose` BEFORE INSERT ON `lessonchoose` FOR EACH ROW BEGIN
    DECLARE current_size INT;
    DECLARE max_size INT;
    
    SELECT currentsize INTO current_size FROM sclass WHERE Lnumber = NEW.Lnumber AND Tnumber = NEW.Tnumber And semester = NEW.semester;
    SELECT maxsize INTO max_size FROM sclass WHERE Lnumber = NEW.Lnumber AND Tnumber = NEW.Tnumber And semester = NEW.semester;
    
    IF current_size >= max_size THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The current class size has reached the maximum capacity';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `tri_update_score` BEFORE UPDATE ON `lessonchoose` FOR EACH ROW BEGIN
        DECLARE total_marks FLOAT;
        DECLARE grade_point FLOAT;
        DECLARE ps_mark FLOAT;
        DECLARE exam_mark FLOAT;
        DECLARE ps_weightage INT;
        DECLARE exam_weightage INT;

        SELECT SUBSTR(gradeindex, 1, 1), SUBSTR(gradeindex, 2, 1) INTO ps_weightage, exam_weightage
        FROM lesson
        WHERE Lnumber = NEW.Lnumber;

        SET ps_mark = NEW.psgrade;
        SET exam_mark = NEW.ksgrade;

        SET total_marks = (ps_mark * ps_weightage / 10) + (exam_mark * exam_weightage / 10);

        IF total_marks >= 90 THEN SET grade_point = 4.0;
        ELSEIF total_marks >= 85 THEN SET grade_point = 3.7;
        ELSEIF total_marks >= 82 THEN SET grade_point = 3.3;
        ELSEIF total_marks >= 78 THEN SET grade_point = 3.0;
        ELSEIF total_marks >= 75 THEN SET grade_point = 2.7;
        ELSEIF total_marks >= 72 THEN SET grade_point = 2.3;
        ELSEIF total_marks >= 68 THEN SET grade_point = 2.0;
        ELSEIF total_marks >= 64 THEN SET grade_point = 1.5;
        ELSEIF total_marks >= 60 THEN SET grade_point = 1.0;
        ELSEIF total_marks >= 0 THEN SET grade_point = 0.0;
        END IF;

        SET NEW.totalgrade = total_marks;
        SET NEW.GPA = grade_point;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `Mnumber` int NOT NULL,
  `Musername` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Mpassword` char(255) DEFAULT NULL,
  `Mname` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `avatarurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Mnumber`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'aimin','117f5560a7e3dfffff283ef55b639d20','艾敏','http://124.71.166.37:9090/file/3b5b88f55f5b46de87398d63c58c9284.jpg'),(2,'luohao','luohao','罗浩',NULL),(3,'zhangyu','zhangyu','张宇',NULL),(4,'lilin','zhangxuefeng','李林',NULL),(5,'wuzhongxiang','wuzhongxiang','武忠祥',NULL),(6,'zhangxuefeng','zhangxuefeng','张雪峰',NULL),(7,'tangjiafeng','tangjiafeng','汤家凤',NULL),(8,'liyongle','liyongle','李永乐',NULL),(9,'songhao','songhao','宋浩',NULL),(10,'liuxiaoyan','liuxiaoyan','刘晓燕',NULL),(11,'tianjing','tianjing','田静',NULL),(12,'tangchi','tangchi','唐迟',NULL),(13,'xutao','xutao','徐涛',NULL);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profession`
--

DROP TABLE IF EXISTS `profession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profession` (
  `Pname` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Pnumber` int DEFAULT NULL,
  `Anumber` int DEFAULT NULL,
  PRIMARY KEY (`Pname`) USING BTREE,
  KEY `profession_department_null_fk` (`Anumber`) USING BTREE,
  CONSTRAINT `profession_department_null_fk` FOREIGN KEY (`Anumber`) REFERENCES `department` (`deptid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profession`
--

LOCK TABLES `profession` WRITE;
/*!40000 ALTER TABLE `profession` DISABLE KEYS */;
INSERT INTO `profession` VALUES ('人工智能',204,2),('大数据',302,3),('智能科学与技术',202,2),('机械工程',1002,10),('汉语言文学',1003,1),('网络空间安全',203,2),('自动化',1001,10),('计算机科学与技术',201,2),('通信工程',301,3);
/*!40000 ALTER TABLE `profession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sclass`
--

DROP TABLE IF EXISTS `sclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sclass` (
  `Tnumber` int NOT NULL,
  `Lnumber` int NOT NULL,
  `semester` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lessontime` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `classroom` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `maxsize` int DEFAULT NULL,
  `currentsize` int DEFAULT NULL,
  PRIMARY KEY (`Tnumber`,`Lnumber`,`semester`) USING BTREE,
  KEY `class_lesson_Lnumber_fk` (`Lnumber`) USING BTREE,
  CONSTRAINT `class_lesson_Lnumber_fk` FOREIGN KEY (`Lnumber`) REFERENCES `lesson` (`Lnumber`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sclass_teacher_Tnumber_fk` FOREIGN KEY (`Tnumber`) REFERENCES `teacher` (`Tnumber`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sclass`
--

LOCK TABLES `sclass` WRITE;
/*!40000 ALTER TABLE `sclass` DISABLE KEYS */;
INSERT INTO `sclass` VALUES (10023,20111,'22年冬季','二1-2，四1-2','计208',60,10),(10023,20123,'22年冬季','一7-8，三9-11','DJ103',40,8),(10023,20132,'22年冬季','一7-8，三7-8','计506',50,2),(10025,20123,'22年冬季','一7-8，三9-11','材226',40,0),(10025,20132,'22年冬季','一1-2，三1-2','计506',50,5),(10086,20123,'22年冬季','一7-8，三9-11','计308',40,2),(10086,20132,'22年冬季','一2-3，三3-4','计308',50,7),(10086,30012,'22年冬季','四9-10','BJ303',100,0),(10098,10032,'22年冬季','三7-8，五7-8','AJ203',100,3),(10098,30012,'22年冬季','一7-8','AJ104',100,0),(10130,30012,'22年冬季','一1-2，三1-2，五1-2','EJ108',60,0),(10130,30013,'22年冬季','一9-11，三9-11','AJ104',60,0),(10130,30022,'22年冬季','二9-11，四9-10','BJ103',50,0),(10132,30012,'22年冬季','一1-2，三1-2，五1-2','GJ203',60,0),(10144,40013,'22年冬季','三9-10','AJ104',100,1),(10144,40014,'22年冬季','三9-10','AJ107',80,1),(10145,40012,'22年冬季','二9-10','AJ208',100,0),(10145,40014,'22年冬季','三11-12','AJ107',80,2),(10146,40013,'22年冬季','四9-10','AJ103',100,2),(10187,60001,'22年冬季','一3-4，三3-4，五7-8','EJ104',60,0),(10187,60012,'22年冬季','一1-2，三1-2','BJ107',60,0),(10200,20111,'22年冬季','二1-2，四1-2','计304',60,60),(10200,30012,'22年冬季','三9-11','DJ304',100,0);
/*!40000 ALTER TABLE `sclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `studentid` int NOT NULL,
  `name` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dataofbirth` date DEFAULT NULL,
  `mobilephone` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Status` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `logn` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pswd` char(255) DEFAULT NULL,
  `Sprofession` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `nativeplace` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `deptid` int DEFAULT NULL,
  `avatarurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`studentid`) USING BTREE,
  KEY `student_profession_Pname_fk` (`Sprofession`) USING BTREE,
  KEY `student_department_null_fk` (`deptid`) USING BTREE,
  CONSTRAINT `student_department_null_fk` FOREIGN KEY (`deptid`) REFERENCES `department` (`deptid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_profession_Pname_fk` FOREIGN KEY (`Sprofession`) REFERENCES `profession` (`Pname`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (20121331,'周鹏飞','男','2002-10-01','13994398510',NULL,'zhoupengfei','f1a6aefd531eec0f7420aa1e9f252baa','计算机科学与技术',22,'山西',NULL,'http://124.71.166.37:9090/file/b6b5a78db5be43728bf68af6a15e2c91.png'),(20121332,'张有临','男',NULL,'13283687758',NULL,'zhangyoulin','2a20bb27e97082c499cee77f386673e4','计算机科学与技术',NULL,NULL,NULL,'http://124.71.166.37:9090/file/3526bad008bb4534acfc1061eb5aa07b.jpg'),(20121333,'李洪辰','男','2001-12-27','13847473985',NULL,'lihongchen','907f5174e36e7f7d3dbdfbb9b394e6ae','计算机科学与技术',22,'湖南',NULL,'http://124.71.166.37:9090/file/dc79ff13bdba4a409917b1c47bbc8f29.jpg'),(20121335,'董非凡','男','2002-10-08','18375834202',NULL,'dongfeifan','b632038a6b71874afd934009d2538c3e','人工智能',22,'上海',NULL,NULL),(20121336,'江俊','男','2001-08-14','13527284949',NULL,'jiangjun','8b4484dee96d9f77d3cd3d16b8dec112','计算机科学与技术',21,'安徽',NULL,NULL),(20121337,'王子潇','男','2023-03-01','13029305859',NULL,'wangzixiao','28f7df60a5e822605b06354c1564d900','计算机科学与技术',20,'江西',NULL,'http://124.71.166.37:9090/file/8a3dc61e445e41678368b2eb166b4140.jpg'),(20121338,'王星月','女','2002-10-16','18364375635',NULL,'wangxingyue','b8832570a4c4faa25bb13f770299e560','汉语言文学',21,'江苏',NULL,NULL),(20121339,'朱清音','女','2002-01-23','18356352435',NULL,'zhuqingyin','9f91b097a4a99aa0399d9effa9cb7e87','汉语言文学',21,'浙江',NULL,NULL),(20121340,'朱卓喜','男','2002-02-13','18320103010',NULL,'zhuzhuoxi','12e5be5f1db2048d95375b38cc3e8d91','通信工程',21,'安徽',NULL,NULL),(20121341,'蔡旭东','男','2002-09-10','13123819922',NULL,'caixudong','4cf57667a394a6c62b24587dfdd09c2d','网络空间安全',21,'云南',NULL,NULL),(20121342,'曾浩','男','2002-07-29','13021291897',NULL,'zenghao','326e2e027af85d0837e2a7d4aa5a575c','自动化',21,'河南',NULL,NULL),(20121343,'高晓冉','男','2001-06-12','13023187481',NULL,'gaoxiaoran','a737a0e888d1aeb5c059b56d7a9f0d31','大数据',20,'吉林',NULL,NULL),(20121344,'张梦婷','女',NULL,'18763544435',NULL,'zhangmengting','95dab530e58b39ed892861323a25a4da','通信工程',NULL,NULL,NULL,NULL),(20121345,'罗志凯','男',NULL,'13298768787',NULL,'luozhikai','b24bb52d658e159f103b8215e505cdd3','通信工程',NULL,NULL,NULL,NULL),(20121346,'张超','男',NULL,'13290987656',NULL,'zhangchao','b4115d1aad2e4012f946da2adda78b96','自动化',NULL,NULL,NULL,NULL),(20121347,'孙一洋','男',NULL,'18632335666',NULL,'sunyiyang','1fe8f85b8f29a4313434d2e6b6c8f9e6','网络空间安全',NULL,NULL,NULL,NULL),(20121348,'李子奇','男',NULL,'13056678444',NULL,'liziqi','5d83355bdf0cf1e36fc6d0c4b2bffead','计算机科学与技术',NULL,NULL,NULL,NULL),(20121349,'吴宇豪','男',NULL,'18656897874',NULL,'wuyuhao','acb1c76c507010c34e862913284283c1','计算机科学与技术',NULL,NULL,NULL,NULL),(20121350,'王唯瀚','男',NULL,'13878675689',NULL,'wangweihan','a22ce2e1d7a6dd481cce8f6ebd2c8a6e','计算机科学与技术',NULL,NULL,NULL,NULL),(20121362,'易津锐','男',NULL,'11231231123',NULL,'yijinrui','9588aa8f871ef3e708a0474a39d914be','计算机科学与技术',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size` bigint DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  `enable` tinyint(1) DEFAULT '1',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
INSERT INTO `sys_file` VALUES (35,'jery.jpg','jpg',11,'http://124.71.166.37:9090/file/8a3dc61e445e41678368b2eb166b4140.jpg',0,1,'a2494faa6a84be9edf45158783e7d6f6'),(36,'aaaaa.jpg','jpg',27,'http://124.71.166.37:9090/file/b4cc0cce3ed14e67bae4a3f9c287f7be.jpg',0,1,'f61253065eb701704768650bc16b6f8e'),(37,'aaaaa.jpg','jpg',27,'http://124.71.166.37:9090/file/b4cc0cce3ed14e67bae4a3f9c287f7be.jpg',0,1,'f61253065eb701704768650bc16b6f8e'),(38,'jery.jpg','jpg',11,'http://124.71.166.37:9090/file/8a3dc61e445e41678368b2eb166b4140.jpg',0,1,'a2494faa6a84be9edf45158783e7d6f6'),(39,'jery.jpg','jpg',11,'http://124.71.166.37:9090/file/8a3dc61e445e41678368b2eb166b4140.jpg',0,1,'a2494faa6a84be9edf45158783e7d6f6'),(40,'jery.jpg','jpg',11,'http://124.71.166.37:9090/file/8a3dc61e445e41678368b2eb166b4140.jpg',0,1,'a2494faa6a84be9edf45158783e7d6f6'),(41,'jery.jpg','jpg',11,'http://124.71.166.37:9090/file/8a3dc61e445e41678368b2eb166b4140.jpg',0,1,'a2494faa6a84be9edf45158783e7d6f6'),(42,'jery.jpg','jpg',11,'http://124.71.166.37:9090/file/8a3dc61e445e41678368b2eb166b4140.jpg',0,1,'a2494faa6a84be9edf45158783e7d6f6'),(43,'jery.jpg','jpg',11,'http://124.71.166.37:9090/file/8a3dc61e445e41678368b2eb166b4140.jpg',0,1,'a2494faa6a84be9edf45158783e7d6f6'),(44,'R.jfif','jfif',51,'http://124.71.166.37:9090/file/d01d1f25fdbb4f9182263ba102c9647f.jfif',0,1,'a4750520f322605304f9b84e75e21274'),(45,'jery.jpg','jpg',11,'http://124.71.166.37:9090/file/8a3dc61e445e41678368b2eb166b4140.jpg',0,1,'a2494faa6a84be9edf45158783e7d6f6'),(46,'jery.jpg','jpg',11,'http://124.71.166.37:9090/file/8a3dc61e445e41678368b2eb166b4140.jpg',0,1,'a2494faa6a84be9edf45158783e7d6f6'),(47,'songanping.jpg','jpg',9,'http://124.71.166.37:9090/file/dc79ff13bdba4a409917b1c47bbc8f29.jpg',0,1,'55b249bacbc6e8ad64b28b7164c6b4aa'),(48,'songanping.jpg','jpg',9,'http://124.71.166.37:9090/file/dc79ff13bdba4a409917b1c47bbc8f29.jpg',0,1,'55b249bacbc6e8ad64b28b7164c6b4aa'),(49,'Best-VPN-to-Unblock-Github-Anywhere.jpg','jpg',11,'http://124.71.166.37:9090/file/d130909338b94b389ed3603230aacf54.jpg',0,1,'a339032c0557adb8da032bfce4fba2e3'),(50,'Best-VPN-to-Unblock-Github-Anywhere.jpg','jpg',11,'http://124.71.166.37:9090/file/d130909338b94b389ed3603230aacf54.jpg',0,1,'a339032c0557adb8da032bfce4fba2e3'),(51,'songanping.jpg','jpg',9,'http://124.71.166.37:9090/file/dc79ff13bdba4a409917b1c47bbc8f29.jpg',0,1,'55b249bacbc6e8ad64b28b7164c6b4aa'),(52,'songanping.jpg','jpg',9,'http://124.71.166.37:9090/file/dc79ff13bdba4a409917b1c47bbc8f29.jpg',0,1,'55b249bacbc6e8ad64b28b7164c6b4aa'),(53,'songanping.jpg','jpg',9,'http://124.71.166.37:9090/file/dc79ff13bdba4a409917b1c47bbc8f29.jpg',0,1,'55b249bacbc6e8ad64b28b7164c6b4aa'),(54,'Best-VPN-to-Unblock-Github-Anywhere.jpg','jpg',11,'http://124.71.166.37:9090/file/d130909338b94b389ed3603230aacf54.jpg',0,1,'a339032c0557adb8da032bfce4fba2e3'),(55,'songanping.jpg','jpg',9,'http://124.71.166.37:9090/file/dc79ff13bdba4a409917b1c47bbc8f29.jpg',0,1,'55b249bacbc6e8ad64b28b7164c6b4aa'),(56,'songanping.jpg','jpg',9,'http://124.71.166.37:9090/file/dc79ff13bdba4a409917b1c47bbc8f29.jpg',0,1,'55b249bacbc6e8ad64b28b7164c6b4aa'),(57,'Best-VPN-to-Unblock-Github-Anywhere.jpg','jpg',11,'http://124.71.166.37:9090/file/d130909338b94b389ed3603230aacf54.jpg',0,1,'a339032c0557adb8da032bfce4fba2e3'),(58,'Best-VPN-to-Unblock-Github-Anywhere.jpg','jpg',11,'http://124.71.166.37:9090/file/d130909338b94b389ed3603230aacf54.jpg',0,1,'a339032c0557adb8da032bfce4fba2e3'),(59,'songanping.jpg','jpg',9,'http://124.71.166.37:9090/file/dc79ff13bdba4a409917b1c47bbc8f29.jpg',0,1,'55b249bacbc6e8ad64b28b7164c6b4aa'),(60,'Best-VPN-to-Unblock-Github-Anywhere.jpg','jpg',11,'http://124.71.166.37:9090/file/d130909338b94b389ed3603230aacf54.jpg',0,1,'a339032c0557adb8da032bfce4fba2e3'),(61,'songanping.jpg','jpg',9,'http://124.71.166.37:9090/file/dc79ff13bdba4a409917b1c47bbc8f29.jpg',0,1,'55b249bacbc6e8ad64b28b7164c6b4aa'),(62,'Best-VPN-to-Unblock-Github-Anywhere.jpg','jpg',11,'http://124.71.166.37:9090/file/d130909338b94b389ed3603230aacf54.jpg',0,1,'a339032c0557adb8da032bfce4fba2e3'),(63,'songanping.jpg','jpg',9,'http://124.71.166.37:9090/file/dc79ff13bdba4a409917b1c47bbc8f29.jpg',0,1,'55b249bacbc6e8ad64b28b7164c6b4aa'),(64,'8283891f64972d1f72f6105619efd5248b42b18f.jpg@1295w.webp','webp',46,'http://124.71.166.37:9090/file/b81c3e56549b431697fe463fd7da9ff6.webp',0,1,'4f502fc9b217a53eed56a21ab9c90849'),(65,'wallhaven-y8zp9k.png','png',360,'http://124.71.166.37:9090/file/4a1a576dec0f4ab2969c1996a9a10a96.png',0,1,'46b03df3547ed239f08af89ef3fde184'),(66,'Best-VPN-to-Unblock-Github-Anywhere.jpg','jpg',11,'http://124.71.166.37:9090/file/d130909338b94b389ed3603230aacf54.jpg',0,1,'a339032c0557adb8da032bfce4fba2e3'),(67,'songanping.jpg','jpg',9,'http://124.71.166.37:9090/file/dc79ff13bdba4a409917b1c47bbc8f29.jpg',0,1,'55b249bacbc6e8ad64b28b7164c6b4aa'),(68,'songanping.jpg','jpg',9,'http://124.71.166.37:9090/file/dc79ff13bdba4a409917b1c47bbc8f29.jpg',0,1,'55b249bacbc6e8ad64b28b7164c6b4aa'),(69,'Best-VPN-to-Unblock-Github-Anywhere.jpg','jpg',11,'http://124.71.166.37:9090/file/d130909338b94b389ed3603230aacf54.jpg',0,1,'a339032c0557adb8da032bfce4fba2e3'),(70,'songanping.jpg','jpg',9,'http://124.71.166.37:9090/file/dc79ff13bdba4a409917b1c47bbc8f29.jpg',0,1,'55b249bacbc6e8ad64b28b7164c6b4aa'),(71,'wallhaven-y8zp9k.png','png',360,'http://124.71.166.37:9090/file/4a1a576dec0f4ab2969c1996a9a10a96.png',0,1,'46b03df3547ed239f08af89ef3fde184'),(72,'8283891f64972d1f72f6105619efd5248b42b18f.jpg@1295w.webp','webp',46,'http://124.71.166.37:9090/file/b81c3e56549b431697fe463fd7da9ff6.webp',0,1,'4f502fc9b217a53eed56a21ab9c90849'),(73,'201991021554113660.jpg','jpg',56,'http://124.71.166.37:9090/file/683babc6ef5a4a40a2765447e0e45cfd.jpg',0,1,'ee1f707324ac3ab7cd1d3935c0957625'),(74,'53021.jpg','jpg',45,'http://124.71.166.37:9090/file/a8b8c7f456ea4447a0ee6218ca507e27.jpg',0,1,'8e552d35b025511d03e7a3b7d9d91f36'),(75,'jery.jpg','jpg',11,'http://124.71.166.37:9090/file/8a3dc61e445e41678368b2eb166b4140.jpg',0,1,'a2494faa6a84be9edf45158783e7d6f6'),(76,'v2-c21eefcf8ddefeae547df071119f953f_r.jpg','jpg',61,'http://124.71.166.37:9090/file/fb0fb31e5d0247929b6fc57139aefb9f.jpg',0,1,'bcfcf761c710382e0995c50012140170'),(77,'01a44c5ab8c186a801218207312123.PNG@2o.png','png',544,'http://124.71.166.37:9090/file/54cdf9a16ca5415db900590e28345d89.png',0,1,'ca5798c488f02403ec9282dff4671cfe'),(78,'Best-VPN-to-Unblock-Github-Anywhere.jpg','jpg',11,'http://124.71.166.37:9090/file/d130909338b94b389ed3603230aacf54.jpg',0,1,'a339032c0557adb8da032bfce4fba2e3'),(79,'songanping.jpg','jpg',9,'http://124.71.166.37:9090/file/dc79ff13bdba4a409917b1c47bbc8f29.jpg',0,1,'55b249bacbc6e8ad64b28b7164c6b4aa'),(80,'OIP-C.jpg','jpg',28,'http://124.71.166.37:9090/file/3526bad008bb4534acfc1061eb5aa07b.jpg',0,1,'d5feab79ce6317879ebfea0e7cdee781'),(81,'20205121143451574.jpg','jpg',21,'http://124.71.166.37:9090/file/36100a14f02b41ada9e6b390b08a4344.jpg',0,1,'b17e352b87d4a9b27003e42f265fd7b3'),(82,'songanping.jpg','jpg',9,'http://124.71.166.37:9090/file/dc79ff13bdba4a409917b1c47bbc8f29.jpg',0,1,'55b249bacbc6e8ad64b28b7164c6b4aa'),(83,'songanping.jpg','jpg',9,'http://124.71.166.37:9090/file/dc79ff13bdba4a409917b1c47bbc8f29.jpg',0,1,'55b249bacbc6e8ad64b28b7164c6b4aa'),(84,'OIP-C.jpg','jpg',22,'http://124.71.166.37:9090/file/3b5b88f55f5b46de87398d63c58c9284.jpg',0,1,'aae778df2f027d5882b4f1750b772a81'),(85,'aaaaa.jpg','jpg',27,'http://124.71.166.37:9090/file/b4cc0cce3ed14e67bae4a3f9c287f7be.jpg',0,1,'f61253065eb701704768650bc16b6f8e'),(86,'aaaaa.jpg','jpg',27,'http://124.71.166.37:9090/file/b4cc0cce3ed14e67bae4a3f9c287f7be.jpg',0,1,'f61253065eb701704768650bc16b6f8e'),(87,'cutcamera.png','png',20,'http://124.71.166.37:9090/file/b6b5a78db5be43728bf68af6a15e2c91.png',0,1,'0eb966042697018fea1bec939deb8f83'),(88,'cutcamera.png','png',20,'http://124.71.166.37:9090/file/b6b5a78db5be43728bf68af6a15e2c91.png',0,1,'0eb966042697018fea1bec939deb8f83'),(89,'image-20230508110518533.png','png',67,'http://124.71.166.37:9090/file/af9f47701c5b45ec84cf120152d26e58.png',0,1,'c166a8a68a5f3eca83eef1891457fbe0');
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `Tnumber` int NOT NULL AUTO_INCREMENT,
  `Tname` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Tsex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Tbirthday` date DEFAULT NULL,
  `Tstatus` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Twage` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Tcollege` int DEFAULT NULL,
  `Tusername` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Tpassword` char(255) DEFAULT NULL,
  `avatarurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Tnumber`) USING BTREE,
  KEY `teacher_department_dept_id_fk` (`Tcollege`) USING BTREE,
  CONSTRAINT `teacher_department_null_fk` FOREIGN KEY (`Tcollege`) REFERENCES `department` (`deptid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=100862 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (10023,'刘洋','女','1986-05-20','副教授','10000',2,'liuyang','6b649039a388694c7306cb4d14041a14',NULL),(10025,'李晓强','男','1986-10-15','副教授','15000',2,'lixiaoqiang','ae293c82715399f180ab1f60ee064b43',NULL),(10086,'宋安平','男','1971-06-19','副教授','10000',2,'songanping','3bbf65e2908718af8538115d74349820','http://124.71.166.37:9090/file/dc79ff13bdba4a409917b1c47bbc8f29.jpg'),(10091,'岳晓东','男',NULL,'副教授',NULL,NULL,'yuexiaodong','13abc38ffc5f816ad788980b70b3e769',NULL),(10098,'王迪','女','1991-09-17','讲师','8000',1,'wangdi','4dc31f6492d79f8bd520a0110816b6a7',NULL),(10130,'肖忠银','男','1969-09-08','教授','10000',3,'xiaozhongyin','71fadc55cb9b9248fa067a716b5d136b',NULL),(10132,'张朝武','男','1974-05-28','教授','10000',3,'zhangchaowu','bbfaaf2454bc03021d36eb01c00ea713',NULL),(10144,'宋景明','男','1966-04-18','教授','10000',4,'songjingm','3816bfc895172810b345155a992de683',NULL),(10145,'李晨','男','1983-05-31','讲师','8000',4,'lichen','40f74e052279b893154464388e070fb1',NULL),(10146,'邱海燕','女','1979-10-29','副教授','10000',4,'qiuhaiyan','e5a800a8aea25f6264470574f92347c0',NULL),(10187,'江琴','女','1975-04-29','副教授','10000',6,'jiangqin','721252a20d8cf5631d30e4ad7e7fe117',NULL),(10189,'赵凤珍','女','1981-06-09','副教授','10000',6,'zhaofengzhen','86a79851e44178c571d22aa9be595738',NULL),(10193,'王冰','女','1976-10-19','教授','15000',2,'wangbing','95e357f2d1c8f85f6d8de5a3f04dde1f',NULL),(10200,'许庆国','男','1971-07-26','副教授','10000',2,'xuqingguo','7d826d63a099df650cbd6e5de2616414',NULL);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-21 16:16:57
