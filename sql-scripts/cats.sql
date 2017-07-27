DROP SCHEMA IF EXISTS cats;
CREATE DATABASE cats;
USE cats;

/*  breed table creation (comes first because cat has a dependancy)  */

DROP TABLE IF EXISTS `breed`;
CREATE TABLE `breed` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `breed` varchar(50) NOT NULL,
  `desc` varchar(300) DEFAULT 'No desc provided',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `breed` VALUES
(1,'American Bobtail','The American Bobtail is an uncommon breed of domestic cat developed in the late 1960s. It is most notable for its stubby \'bobbed\' tail about one-third to one-half the length of a normal cat\'s tail.'),
(2,'pixie bob','This breed is very, very, very, very good.'),
(3,'Siamese','The Siamese cat is one of the first distinctly recognized breeds of Asian cat. Derived from the rtgs: wichianmat landrace, one of several varieties of cat native to Thailand.'),
(4,'tabby','Stripped cat...');

/*  cat table creation  */

DROP TABLE IF EXISTS `cat`;
CREATE TABLE `cat` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ownerId` varchar(50) NOT NULL,
  `weightLbs` int(10) unsigned NOT NULL,
  `breedId` int(10) unsigned NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_breed_breedId_idx` (`breedId`),
  CONSTRAINT `FK_breed_breedId` FOREIGN KEY (`breedId`) REFERENCES `breed` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO `cat` VALUES
(1,'Fatty Butterpants','owner_2222',22,4,'M'),
(2,'fluffikins','owner_1234',8,3,NULL),
(3,'fluffy','owner_2222',3,4,'F'),
(4,'Jimi Hendrix','owner_1234',17,4,'M'),
(5,'Jinx','owner_111',8,4,'M'),
(6,'Jr','owner_2222',12,3,'M'),
(7,'Muffin','owner_111',15,4,'F'),
(8,'Nancy','owner_111',14,4,'F'),
(9,'RJ','owner_1234',15,4,'M'),
(10,'Tom','owner_111',11,4,'M');
