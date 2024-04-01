-- Table 1

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema itas288assign03_jose.hemangi
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema itas288assign03_jose.hemangi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `itas288assign03_jose.hemangi` DEFAULT CHARACTER SET latin1 ;
USE `itas288assign03_jose.hemangi` ;

-- -----------------------------------------------------
-- Table `itas288assign03_jose.hemangi`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itas288assign03_jose.hemangi`.`course` (
  `CourseId` VARCHAR(45) NOT NULL ,
  `CourseName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CourseId`, `CourseName`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itas288assign03_jose.hemangi`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itas288assign03_jose.hemangi`.`faculty` (
  `FacultyId` INT(11) NOT NULL AUTO_INCREMENT,
  `FacultyName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`FacultyId`, `FacultyName`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itas288assign03_jose.hemangi`.`qualified`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itas288assign03_jose.hemangi`.`qualified` (
  `DateQualified` DATE NOT NULL,
  `FacultyID` INT(11) NULL DEFAULT NULL,
  `CourseID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CourseID`,`FacultyID`,`DateQualified`),
  CONSTRAINT `CourseID`
    FOREIGN KEY (`CourseID`)
    REFERENCES `itas288assign03_jose.hemangi`.`course` (`CourseId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FacultyID`
    FOREIGN KEY (`FacultyID`)
    REFERENCES `itas288assign03_jose.hemangi`.`faculty` (`FacultyId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itas288assign03_jose.hemangi`.`section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itas288assign03_jose.hemangi`.`section` (
  `SectionNo` INT(11) NOT NULL,
  `Semster`  INT(11) NOT NULL,
  `CourseID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`SectionNo`, `Semster`, `CourseID`),
  CONSTRAINT `section_ibfk_1`
    FOREIGN KEY (`CourseID`)
    REFERENCES `itas288assign03_jose.hemangi`.`course` (`CourseId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itas288assign03_jose.hemangi`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itas288assign03_jose.hemangi`.`student` (
  `StudentId` INT(11) NOT NULL AUTO_INCREMENT,
  `Studentame` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`StudentId`, `Studentame`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itas288assign03_jose.hemangi`.`registration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itas288assign03_jose.hemangi`.`registration` (
  `StudentID` INT(11) NOT NULL,
  `SectionNo` INT(11) NOT NULL,
  `Semester`  INT(11) NOT NULL,
  PRIMARY KEY (`StudentID`, `SectionNo`, `Semester`),
  CONSTRAINT `FK_registration_section`
    FOREIGN KEY (`SectionNo`)
    REFERENCES `itas288assign03_jose.hemangi`.`section` (`SectionNo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
 CONSTRAINT `registration_ibfk_1`
    FOREIGN KEY (`StudentID`)
    REFERENCES `itas288assign03_jose.hemangi`.`student` (`StudentId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- Table 2
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema itas288assign03table2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema itas288assign03table2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `itas288assign03table2` DEFAULT CHARACTER SET latin1 ;
USE `itas288assign03table2` ;

-- -----------------------------------------------------
-- Table `itas288assign03table2`.`tutor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itas288assign03table2`.`tutor` (
  `TutorId` INT(11) NOT NULL,
  `CertDate` DATE NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `Subject` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`TutorId`, `CertDate`, `Status`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itas288assign03table2`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itas288assign03table2`.`student` (
  `StudentId` INT(11) NOT NULL,
  `Read` DOUBLE NOT NULL,
  `MathScore` DOUBLE NOT NULL,
  `Math Score` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`StudentId`, `Read`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itas288assign03table2`.`matchhistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itas288assign03table2`.`matchhistory` (
  `MatchId` INT(11) NOT NULL,
  `TutorID` INT(11) NOT NULL,
  `StudentID` INT(11) NOT NULL,
  `StartDate` DATE NOT NULL,
  `EndDate` DATE NOT NULL,
  PRIMARY KEY (`MatchId`, `TutorID`, `StudentID`, `StartDate`, `EndDate`),
  INDEX `TutorID` (`TutorID` ASC) VISIBLE,
  INDEX `sdc` (`StudentID` ASC) VISIBLE,
  CONSTRAINT `TutorID`
    FOREIGN KEY (`TutorID`)
    REFERENCES `itas288assign03table2`.`tutor` (`TutorId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `sdc`
    FOREIGN KEY (`StudentID`)
    REFERENCES `itas288assign03table2`.`student` (`StudentId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itas288assign03table2`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itas288assign03table2`.`person` (
  `PersonId` INT(11) NOT NULL,
  `PersonName` VARCHAR(45) NOT NULL,
  `PersonAddress` VARCHAR(45) NOT NULL,
  `PersonPhone` VARCHAR(45) NOT NULL,
  `PersonEmail` VARCHAR(45) NOT NULL,
  `TutorID` INT(11) NOT NULL,
  `StudentID` INT(11) NOT NULL,
  PRIMARY KEY (`PersonId`, `PersonName`, `PersonAddress`, `PersonPhone`, `PersonEmail`, `TutorID`, `StudentID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itas288assign03table2`.`tutorreport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itas288assign03table2`.`tutorreport` (
  `MatchID` INT(11) NOT NULL,
  `Month` VARCHAR(45) NOT NULL,
  `Hours` INT(11) NOT NULL,
  `Lessons` INT(11) NOT NULL,
  PRIMARY KEY (`MatchID`, `Month`, `Hours`, `Lessons`),
  CONSTRAINT `afsf`
    FOREIGN KEY (`MatchID`)
    REFERENCES `itas288assign03table2`.`matchhistory` (`MatchId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


---Chapter 6

-- Q2: 
INSERT INTO `itas288assign03_jose.hemangi`.`student` (`StudentId`, `StudentName`) VALUES ('70524', 'Marra'), ('66324', 'Aiken'),('54907', 'Altvater'),('38214', 'Letersky');



-- Q4:
-- a
INSERT INTO `itas288assign03_jose.hemangi`.`student` (`StudentId`, `StudentName`) VALUES ('70524', 'Marra');
-- b
Drop TABLE `registration`
-- c
ALTER TABLE `faculty`
	CHANGE COLUMN `FacultyName` `FacultyName` VARCHAR(45) NOT NULL AFTER `FacultyId`;
	
-- Q5
-- a
-- 1 method
INSERT INTO `itas288assign03_jose.hemangi`.`student` (`StudentId`, `StudentName`) VALUES ('70524', 'Marra');
-- 2 method
INSERT INTO `itas288assign03_jose.hemangi`.`student` VALUES ('70524', 'Marra');

-- b
SELECT `StudentName` FROM `student` WHERE `StudentId` < 50000;

-- c
SELECT `FacultyName` FROM `faculty` WHERE `FacultyId` = 4756;

DELETE FROM `itas288assign03_jose.hemangi`.`student` WHERE  `StudentName`='Lopez';

-- c
UPDATE `itas288assign03_jose.hemangi`.`course` SET `CourseName`='Introduction to Relational Database' WHERE  `CourseId`='ISM 4212' AND `CourseName`='Database';

-- Q6
-- a
SELECT `StudentName` FROM `student` WHERE `StudentId` < 50000;

-- b
SELECT `FacultyName` FROM `faculty` WHERE `FacultyId` = 4756;
-- c
SELECT MIN(SectionNo),`Semester` FROM `section` ;

-- Q7
-- a
SELECT COUNT(`StudentID`)  FROM `registration` WHERE SectionNo= 2714 ;

-- b
SELECT *  FROM `qualified` WHERE `DateQualified` >= '1993-09-01' ;

-- Q8
-- a
SELECT `StudentID`  FROM `registration` JOIN `section` ON `registration`.`SectionNo`=`section`.`SectionNo` WHERE `section`.`CourseID` = 'ISM 4212' OR `section`.`CourseID`= 'ISM 4930';

-- b
SELECT *  FROM `qualified` JOIN `faculty` ON `faculty`.`FacultyId`=`qualified`.`FacultyID` WHERE `CourseID` != 'ISM 3113' AND `CourseID` != 'ISM 3112';

-- Q9
-- a
SELECT `CourseID`, `CourseName`  FROM `course` inner JOIN `section` USING (`CourseID`) GROUP BY `CourseID` ;

--  b
SELECT  DISTINCT `StudentName`  FROM `student` ORDER BY `StudentName` ;

-- c
SELECT `StudentId`, `StudentName`  FROM `student` inner JOIN `registration` USING (`StudentId`) Group BY `SectionNO`  ;

-- d
SELECT `CourseId`, `CourseName`  FROM `course`  Group BY `CourseID`  ;


-- Q10
SELECT COUNT(`tutorID`) FROM `tutor` WHERE `Status` = 'temp stop' ;
SELECT `tutorID` FROM `tutor` WHERE  `Status` = 'active';

-- Q11
SELECT * FROM `tutor` WHERE  `CertDate` LIKE '%-01-%'

-- Q12
SELECT COUNT(`StudentID`)  FROM `matchhistory` WHERE `startDAte`<= '2008-05-28'; 

-- Q13
SELECT `StudentID`,MAX(`read`)  FROM `student` ; 

-- Q14
SELECT `StudentID`,DATEDIFF(`EndDate`,`StartDate`)  FROM `matchHistory` ; 


--- Chapter 7

-- Q1
-- a
SELECT `CourseID`,`CourseName`  FROM `course` WHERE `courseID` LIKE '%' GROUP BY `courseID` ; 
-- b
SELECT `CourseID`  FROM `qualified` JOIN `faculty` ON `qualified`.`facultyID`=`faculty`.`facultyID` WHERE `facultyName` = 'Berndt'  ; 

-- c
SELECT * FROM `REGISTRATION`
RIGHT JOIN `STUDENT` USING(`StudentID` )
LEFT JOIN `SECTION` USING(`SectionNO`, `Semester`)
WHERE `SectionNo` = 2714 AND `SECTION`.`CourseID` = 'ISM 4212';

-- Q2
SELECT * FROM `QUALIFIED`
 JOIN `FACULTY` USING(`FacultyID`)
WHERE `CourseID` = 'ISM 3113';

-- Q3
SELECT * FROM `QUALIFIED`
 JOIN `FACULTY` USING(`FacultyID`)
WHERE `CourseID` = 'ISM 3113' or `CourseID` = 'ISM 4930'

-- Q4
-- a
SELECT COUNT(*) FROM `REGISTRATION`
 JOIN `STUDENT` USING(`StudentID` )
 JOIN `SECTION` USING(`SectionNO`, `Semester`)
WHERE `SectionNo` = 2714 AND `Semester` = 'I-2008'

-- b
SELECT COUNT(*) FROM `REGISTRATION`
 JOIN `STUDENT` USING(`StudentID` )
 JOIN `SECTION` USING(`SectionNO`, `Semester`)
WHERE `SectionNo` = 2714 AND `Semester` = 'I-2008'

-- Q5
SELECT * FROM `STUDENT`
WHERE NOT EXISTS (SELECT 1 FROM `REGISTRATION` WHERE `STUDENT`.`StudentID` = `REGISTRATION`.`StudentID`);

-- Q6
-- Along with the zip file

-- Q7
ALTER TABLE `student`
	ADD COLUMN `MathScore` DOUBLE NOT NULL AFTER `Read`;
	
-- Q8
ALTER TABLE `tutor` add column `subject` varchar(10) check (Subject IN('Reading','MAth','ESL'));

-- Q10
SELECT `MatchID`
FROM (SELECT count(*) as 'nb', `MatchID`, `Month`
FROM `TUTOR REPORT`
GROUP BY `MatchID`
HAVING COUNT(*) = 1 and `Month` != '07/08') `aq`
UNION
SELECT `MatchID` FROM `MATCH HISTORY`
WHERE NOT EXISTS (SELECT 1 FROM `TUTOR REPORT` WHERE `MATCH HISTORY`.`MatchID` = `TUTOR REPORT`.`MatchID`);

-- Q11
CREATE TABLE IF NOT EXISTS `Person` (
`PersonID` INT NOT NULL,
`Name` VARCHAR(45) NULL,
`Address` VARCHAR(45) NULL,
`Phone` VARCHAR(45) NULL,
`Email` VARCHAR(45) NULL,
PRIMARY KEY (`PersonID`))
ENGINE = InnoDB;

-- Q12
SELECT `s`.`stuuentid`, `m`.`enddate`, `p`.`lastname` , SUM(`T`.`hours`) AS TotalHours, SUM(`t`.`lesson`) as TotalLessons
FROM (`Person` JOIN `student` s ON `p`.`personID` = `S`.`studentID`) inner join (`matchhistory` M Left JOIN `tutorreport` t ON `m`.`matchid` = `t`.`matchid` ) ON 
`s`.`studentID` = `m`.`studentID` group BY `s`.`studentID`, `m`.`Enddate` , `p`.`LAstname` HAVING (((`M`.`Enddate`)is NULL)); 

-- Q13
SELECT `p`.`personName`, `t`.`status` FROM `person` p  join
`tutor` t ON `p`.`personid`=`t`.`tutorId`  WHERE(((`t`.`status`)="Active"));

-- Q14
SELECT `MatchID`
FROM (SELECT count(*) as 'nb', `MatchID`, `Month`
FROM `tutorreport`
GROUP BY `MatchID`
HAVING COUNT(*) = 1 and `Month` != '07/08') `aq`
UNION
SELECT `MatchID` FROM `matchhistory`
WHERE NOT EXISTS (SELECT 1 FROM `tutorreport` WHERE 
`Matchhistory`.`MatchID` = `tutorreport`.`MatchID`)



