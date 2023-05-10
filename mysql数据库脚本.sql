-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- �������汾: 5.1.29
-- PHP �汾: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_productClass` (
  `productClassId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��Ʒ���id',
  `productClassName` varchar(40)  NOT NULL COMMENT '��Ʒ�������',
  PRIMARY KEY (`productClassId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_product` (
  `productNo` varchar(40)  NOT NULL COMMENT 'productNo',
  `productClassObj` int(11) NOT NULL COMMENT '��Ʒ���',
  `productName` varchar(20)  NOT NULL COMMENT '��Ʒ����',
  `productPhoto` varchar(60)  NOT NULL COMMENT '��ƷͼƬ',
  `count` int(11) NOT NULL COMMENT '��Ʒ���',
  `price` float NOT NULL COMMENT '�г���',
  `madeAddress` varchar(50)  NULL COMMENT '����',
  `guige` varchar(50)  NULL COMMENT '���',
  `madeDate` varchar(20)  NULL COMMENT '��������',
  `yxq` varchar(30)  NULL COMMENT '��Ч��',
  `beizhu` varchar(500)  NULL COMMENT '��ע',
  PRIMARY KEY (`productNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_employee` (
  `employeeNo` varchar(40)  NOT NULL COMMENT 'employeeNo',
  `password` varchar(40)  NULL COMMENT '��¼����',
  `name` varchar(30)  NOT NULL COMMENT '����',
  `sex` varchar(4)  NOT NULL COMMENT '�Ա�',
  `photo` varchar(60)  NOT NULL COMMENT 'Ա����Ƭ',
  `department` varchar(30)  NOT NULL COMMENT '���ڲ���',
  `birthDate` varchar(20)  NULL COMMENT '��������',
  `telephone` varchar(20)  NULL COMMENT '��ϵ�绰',
  `address` varchar(80)  NULL COMMENT '��ϵ��ַ',
  PRIMARY KEY (`employeeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_attendance` (
  `attendanceId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `employeeObj` varchar(40)  NOT NULL COMMENT 'Ա��',
  `year` varchar(20)  NOT NULL COMMENT '���',
  `month` varchar(20)  NOT NULL COMMENT '�·�',
  `shouldComeDays` float NOT NULL COMMENT 'Ӧ������',
  `leaveDays` float NOT NULL COMMENT '�������',
  `absenceDays` float NOT NULL COMMENT 'ȱ������',
  PRIMARY KEY (`attendanceId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_salary` (
  `salaryId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `employeeObj` varchar(40)  NOT NULL COMMENT 'Ա��',
  `year` varchar(20)  NOT NULL COMMENT '���',
  `month` varchar(20)  NOT NULL COMMENT '�·�',
  `attendanceMoney` float NOT NULL COMMENT '���ڿ۳�',
  `secureMoney` float NOT NULL COMMENT '���տ۳�',
  `salaryMoney` float NOT NULL COMMENT '���ʽ��',
  PRIMARY KEY (`salaryId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_purchase` (
  `purchaseId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `productObj` varchar(40)  NOT NULL COMMENT '������Ʒ',
  `supplierObj` int(11) NOT NULL COMMENT '��Ӧ��',
  `price` float NOT NULL COMMENT '��������',
  `count` int(11) NOT NULL COMMENT '��������',
  `purchaseDate` varchar(20)  NULL COMMENT '��������',
  `employeeObj` varchar(40)  NOT NULL COMMENT '����Ա��',
  `memo` varchar(500)  NULL COMMENT '��ע',
  PRIMARY KEY (`purchaseId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_sale` (
  `saleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `productObj` varchar(40)  NOT NULL COMMENT '������Ʒ',
  `userObj` varchar(50)  NOT NULL COMMENT '���ۿͻ�',
  `price` float NOT NULL COMMENT '���۵���',
  `count` int(11) NOT NULL COMMENT '��������',
  `saleDate` varchar(20)  NULL COMMENT '��������',
  `employeeObj` varchar(40)  NOT NULL COMMENT '����Ա��',
  `memo` varchar(500)  NULL COMMENT '��ע',
  PRIMARY KEY (`saleId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_userInfo` (
  `user_name` varchar(50)  NOT NULL COMMENT 'user_name',
  `password` varchar(40)  NULL COMMENT '��¼����',
  `name` varchar(80)  NOT NULL COMMENT '��Աȫ��',
  `legalMan` varchar(20)  NOT NULL COMMENT '��ϵ��',
  `telephone` varchar(20)  NULL COMMENT '��ϵ�绰',
  `address` varchar(80)  NULL COMMENT '��ַ',
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_supplier` (
  `supplierId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��Ӧ��id',
  `supplierName` varchar(60)  NOT NULL COMMENT '��Ӧ������',
  `personName` varchar(20)  NOT NULL COMMENT '��ϵ��',
  `telephone` varchar(20)  NULL COMMENT '��ϵ�绰',
  `address` varchar(80)  NULL COMMENT '��ַ',
  PRIMARY KEY (`supplierId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

ALTER TABLE t_product ADD CONSTRAINT FOREIGN KEY (productClassObj) REFERENCES t_productClass(productClassId);
ALTER TABLE t_attendance ADD CONSTRAINT FOREIGN KEY (employeeObj) REFERENCES t_employee(employeeNo);
ALTER TABLE t_salary ADD CONSTRAINT FOREIGN KEY (employeeObj) REFERENCES t_employee(employeeNo);
ALTER TABLE t_purchase ADD CONSTRAINT FOREIGN KEY (productObj) REFERENCES t_product(productNo);
ALTER TABLE t_purchase ADD CONSTRAINT FOREIGN KEY (supplierObj) REFERENCES t_supplier(supplierId);
ALTER TABLE t_purchase ADD CONSTRAINT FOREIGN KEY (employeeObj) REFERENCES t_employee(employeeNo);
ALTER TABLE t_sale ADD CONSTRAINT FOREIGN KEY (productObj) REFERENCES t_product(productNo);
ALTER TABLE t_sale ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_sale ADD CONSTRAINT FOREIGN KEY (employeeObj) REFERENCES t_employee(employeeNo);


