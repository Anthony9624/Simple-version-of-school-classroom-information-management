

select * from admin;


CREATE TABLE `admin` (
  `userName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` int(4) DEFAULT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `admin` VALUES ('admin','222',0),('s1','222',1),('s2','202',1),('t1','111',2),('t2','002',2);


CREATE TABLE `classroom` (
  `clno` varchar(20) NOT NULL,
  `device` varchar(50) NOT NULL DEFAULT '',
  `hold` int(11) NOT NULL,
  PRIMARY KEY (`clno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `classroom` VALUES ('1-201','',50),('2-205','数据挖掘实验室',200),('3-301','',40),('B-101','数据挖掘实验室',150);


CREATE TABLE `borrow` (
  `clno` varchar(20) NOT NULL,
  `uno` varchar(20) NOT NULL,
  `usedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `period` varchar(10) NOT NULL,
  `usefor` varchar(100) NOT NULL,
  `usestatus` char(1) NOT NULL,
  PRIMARY KEY (`clno`,`uno`,`usedate`,`period`),
  KEY `BorrowFK2` (`uno`),
  CONSTRAINT `BorrowFK1` FOREIGN KEY (`clno`) REFERENCES `classroom` (`clno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `borrow` VALUES ('3-301','t1','2015-03-17 17:02:13','三四节','开班会','F');


select * from course;
CREATE TABLE `course` (
  `cno` varchar(20) NOT NULL,
  `cname` varchar(50) NOT NULL,
  `credit` int(11) NOT NULL,
  `category` char(10) NOT NULL,
  `deptname` varchar(50) NOT NULL,
  PRIMARY KEY (`cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `course` VALUES ('c2','英语',1,'必修','计算机与信息技术学院'),('c3','C语言',2,'必修','计算机与信息技术学院');


select * from student

CREATE TABLE `student` (
  `sno` char(20) NOT NULL DEFAULT '',
  `sname` varchar(20) NOT NULL,
  `deptname` varchar(50) NOT NULL,
  `sex` char(4) NOT NULL DEFAULT '',
  `major` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `student` VALUES ('s1','xc','计算机与信息技术学院','女',''),('s2','sll','计算机科学与技术','女','');

CREATE TABLE `teacher` (
  `tno` varchar(20) NOT NULL,
  `tname` varchar(50) NOT NULL,
  `sex` char(4) NOT NULL DEFAULT '',
  `deptname` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `teacher` VALUES ('t1','张三','男','计算机与信息技术学院','助教'),('t2','李四','男','计算机与信息技术学院','助教');

CREATE TABLE `schedule` (
  `clno` varchar(20) NOT NULL,
  `weekday` varchar(10) NOT NULL,
  `period` varchar(10) NOT NULL,
  `cno` varchar(20) NOT NULL,
  `tno` varchar(20) NOT NULL,
  PRIMARY KEY (`clno`,`weekday`,`period`),
  KEY `ScheduleFK2` (`cno`),
  KEY `ScheduleFK3` (`tno`),
  CONSTRAINT `ScheduleFK1` FOREIGN KEY (`clno`) REFERENCES `classroom` (`clno`),
  CONSTRAINT `ScheduleFK2` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`),
  CONSTRAINT `ScheduleFK3` FOREIGN KEY (`tno`) REFERENCES `teacher` (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `schedule` VALUES ('2-205','星期二','三四节','c2','t2'),('B-101','星期一','一二节','c3','t1');






















