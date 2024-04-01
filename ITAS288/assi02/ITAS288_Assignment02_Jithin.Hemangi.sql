-- PART B

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema itas288_assign02_jose
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema itas288_assign02_jose
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `itas288_assign02_jose` DEFAULT CHARACTER SET latin1 ;
USE `itas288_assign02_jose` ;

-- -----------------------------------------------------
-- Table `itas288_assign02_jose`.`instructor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itas288_assign02_jose`.`instructor` (
  `Instructor_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Instructor` VARCHAR(50) NOT NULL DEFAULT '0',
  `Instructor_Office` VARCHAR(50) NOT NULL DEFAULT '0',
  `Instructor_Phonenumber` VARCHAR(50) NOT NULL DEFAULT '0',
  `Instructor_Homephone` VARCHAR(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Instructor_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itas288_assign02_jose`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itas288_assign02_jose`.`course` (
  `Course_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Course_Name` VARCHAR(100) NOT NULL DEFAULT '0',
  `Course_Data` VARCHAR(100) NOT NULL DEFAULT '0',
  `Classroom` VARCHAR(100) NOT NULL DEFAULT '0',
  `Instructor_ID` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Course_ID`),
  INDEX `FK_course_instructor` (`Instructor_ID` ASC) VISIBLE,
  CONSTRAINT `FK_course_instructor`
    FOREIGN KEY (`Instructor_ID`)
    REFERENCES `itas288_assign02_jose`.`instructor` (`Instructor_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itas288_assign02_jose`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itas288_assign02_jose`.`student` (
  `Student_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Student_Firstname` VARCHAR(50) NOT NULL DEFAULT '0',
  `Student_Lastname` VARCHAR(50) NOT NULL DEFAULT '0',
  `Student_Birthdate` VARCHAR(50) NOT NULL DEFAULT '0',
  `Student_Phonenumber` VARCHAR(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Student_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itas288_assign02_jose`.`grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itas288_assign02_jose`.`grade` (
  `Grade_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Student_ID` INT(11) NULL DEFAULT NULL,
  `Course_ID` INT(11) NULL DEFAULT NULL,
  `Course_Credit` INT(11) NULL DEFAULT NULL,
  `Final_Grade` INT(11) NULL DEFAULT NULL,
  `Letter_Grade` CHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Grade_ID`),
  INDEX `FK_grade_student` (`Student_ID` ASC) VISIBLE,
  INDEX `FK_grade_course` (`Course_ID` ASC) VISIBLE,
  CONSTRAINT `FK_grade_course`
    FOREIGN KEY (`Course_ID`)
    REFERENCES `itas288_assign02_jose`.`course` (`Course_ID`),
  CONSTRAINT `FK_grade_student`
    FOREIGN KEY (`Student_ID`)
    REFERENCES `itas288_assign02_jose`.`student` (`Student_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 344
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itas288_assign02_jose`.`srs_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itas288_assign02_jose`.`srs_data` (
  `StudentFirstname` CHAR(32) NOT NULL,
  `StudentLastname` CHAR(32) NOT NULL,
  `StudentBirthDate` VARCHAR(50) NOT NULL,
  `StudentPhone` CHAR(15) NOT NULL,
  `CourseData` CHAR(32) NOT NULL,
  `CourseName` CHAR(64) NOT NULL,
  `Classroom` CHAR(10) NULL DEFAULT NULL,
  `CourseCredits` TINYINT(1) NOT NULL,
  `FinalGrade` TINYINT(3) NOT NULL,
  `LetterGrade` CHAR(2) NOT NULL,
  `Instructor` CHAR(64) NOT NULL,
  `Office` CHAR(10) NOT NULL,
  `InstructorOfficePhone` CHAR(15) NOT NULL,
  `InstructorHomePhone` CHAR(15) NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- PART c

CREATE TABLE `srs_data` (
`StudentFirstname` CHAR(32) NOT NULL,
`StudentLastname` CHAR(32) NOT NULL,
`StudentBirthDate` VARCHAR(50) NOT NULL,
`StudentPhone` CHAR(15) NOT NULL,
`CourseData` CHAR(32) NOT NULL,
`CourseName` CHAR(64) NOT NULL,
`Classroom` CHAR(10) NULL,
`CourseCredits` TINYINT(1) NOT NULL,
`FinalGrade` TINYINT(3) NOT NULL,
`LetterGrade` CHAR(2) NOT NULL,
`Instructor` CHAR(64) NOT NULL,
`Office` CHAR(10) NOT NULL,
`InstructorOfficePhone` CHAR(15) NOT NULL,
`InstructorHomePhone` CHAR(15) NOT NULL
);

-- Load the CSV File
LOAD DATA INFILE 'SRSData2018.csv' INTO TABLE `ITAS288_Assignment02_jose`.`srs_data`
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(`StudentFirstname`, `StudentLastname`, `StudentBirthDate`, `StudentPhone`, `CourseData`, `CourseName`, `Classroom`, `CourseCredits`, `FinalGrade`, `LetterGrade`, `Instructor`, `Office`, `InstructorOfficePhone`, `InstructorHomePhone`);


-- Creation of the table 

INSERT INTO `course` ( `CourseData`, `CourseName`, `Classroom`) SELECT DISTINCT `CourseData`, `CourseName`, `Classroom` FROM `srs_data`;
INSERT INTO `Instructor` ( `InstructorName`, `Office`, `InstructorHomePhone`, `InstructorOfficePhone`) SELECT DISTINCT `Instructor`, `Office`, `InstructorHomePhone`, `InstructorOfficePhone` FROM `srs_data`;
INSERT INTO `student` ( `StudentFirstname`, `StudentLastname`, `StudentBirthDate`, `StudentPhone`) SELECT DISTINCT `StudentFirstname`, `StudentLastname`, `StudentBirthDate`, `StudentPhone` FROM `srs_data`;
INSERT INTO `grade` ( `CourseCredits`, `FinalGrade`, `LetterGrade`) SELECT  `CourseCredits`, `FinalGrade`, `LetterGrade` FROM `srs_data`;

-- PART D
SELECT `StudentFirstname`, `StudentLastname`FROM `srs_data` WHERE `CourseData` = 'ITAS290_I12N01';
SELECT DISTINCT `StudentFirstname`, `StudentLastname`, `Instructor` FROM `srs_data` WHERE `Instructor` = 'Dutchuk, Mark' order BY `StudentFirstname` ;
SELECT `Instructor` AS InstructorName, count(DISTINCT `CourseName`) AS 'Number Of Courses' FROM `srs_data` GROUP BY `Instructor` order by count(DISTINCT CourseName) DESC;
SELECT `CourseData` , count(DISTINCT `StudentFirstname`, `StudentLastname`) AS 'Number Of Students' FROM `srs_data` GROUP BY `CourseData`;
SELECT concat(`StudentFirstname`,' ', `StudentLastname`) AS 'student’s full name' ,  SUM(`CourseCredits`) AS 'Total number of credits taken' FROM `srs_data` GROUP BY `StudentFirstname` ,`StudentLastname`;
