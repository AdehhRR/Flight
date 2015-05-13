DROP TABLE IF EXISTS `Airport`;
DROP TABLE IF EXISTS `Route`;
DROP TABLE IF EXISTS `Fleet`;
DROP TABLE IF EXISTS `Customer`;
DROP TABLE IF EXISTS `Login`;
DROP TABLE IF EXISTS `AgentProfiles`;
DROP TABLE IF EXISTS `ServiceInventory`;
DROP TABLE IF EXISTS `Seat`;

CREATE TABLE `Airport` (
	`airportID` INT				NOT NULL	AUTO_INCREMENT,
	`name`		VARCHAR(64)		NOT NULL,
	`city`		VARCHAR(32)		NOT NULL,
	`country`	VARCHAR(32)		NOT NULL,
	`IATA` 		VARCHAR(3)		NOT NULL,
	`latitude`	DOUBLE(5,2)		NOT NULL,
	`longitude`	DOUBLE(5,2)		NOT NULL,
	`altitude`	INTEGER(4)		NOT NULL,
	`DST`		VARCHAR(1)		NOT NULL,
	`timeZone`	VARCHAR(32)		NOT NULL,
	CONSTRAINT Airport_PK PRIMARY KEY(`airportID`, `IATA`)
);

CREATE TABLE `Route` (
	`routeID`				INTEGER(4)	NOT NULL	AUTO_INCREMENT,
	`sourceAirport`			VARCHAR(3)	NOT NULL,
	`destinationAirport`	VARCHAR(3)	NOT NULL,
	`codeShare`				VARCHAR(1),
	`stops`					INTEGER(1),
	CONSTRAINT Route_PK PRIMARY KEY(`routeID`)
);


CREATE TABLE `Fleet` (
	`fleetID`		INTEGER(4)		NOT NULL	AUTO_INCREMENT,
	`aircraft`		VARCHAR(32)		NOT NULL,
	`inService`		INTEGER(2)		NOT NULL,
	`firstClass`	INTEGER(2)		NOT NULL,
	`businessClass`	INTEGER(2)		NOT NULL,
	`premiumClass`	INTEGER(2)		NOT NULL,
	`economyClass`	INTEGER(3)		NOT NULL,
	`total`			INTEGER(3)		NOT NULL,
	CONSTRAINT Fleet_PK PRIMARY KEY(`fleetID`)
);

CREATE TABLE `Seat`
(
	`seat_id`		INTEGER(4)		NOT NULL	AUTO_INCREMENT,
	`seat_class`	VARCHAR(16) 	NOT NULL,
	`seat_number`	VARCHAR(3)		NOT NULL,
	`occupied`	BOOLEAN			NOT NULL,
	`fleetID` 	INTEGER(4)		NOT NULL,
	
	CONSTRAINT Seat_PK PRIMARY KEY(`seat_id`),
	CONSTRAINT Seat_NUM UNIQUE (`seat_number`),
	
	CONSTRAINT Seat_FK
	FOREIGN KEY (`fleetID`) 
	REFERENCES `Fleet`(`fleetID`)
	ON DELETE CASCADE
	ON UPDATE NO ACTION
);

CREATE TABLE `Login`
(
	`username`	VARCHAR(32)		NOT NULL,
	`password`	VARCHAR(32)		NOT NULL,
	`role`		VARCHAR(16)		NOT NULL,
	CONSTRAINT Login_PK PRIMARY KEY(`username`)
);

CREATE TABLE `AgentProfiles`
(
	`agent_id`		INTEGER(3)		NOT NULL	AUTO_INCREMENT,
	`travel_agent`	VARCHAR(32)		NOT NULL,
	`phone`			VARCHAR(16)		NOT NULL,
	`email`			VARCHAR(64)		NOT NULL,
	CONSTRAINT Agent_PK PRIMARY KEY(`agent_id`),
	CONSTRAINT unq_agent UNIQUE (`travel_agent`, `phone`, `email`)
);

CREATE TABLE `Customer`
(
	`customer_id` 			INTEGER(4) 		NOT NULL	AUTO_INCREMENT,
	`title`					VARCHAR(16) 	NOT NULL,
	`first_name`			VARCHAR(32)		NOT NULL,
	`last_name`				VARCHAR(32)		NOT NULL,
	`gender`				VARCHAR(8)		NOT NULL,
	`DOB`					DATE			NOT NULL,
	`phone`					VARCHAR(16)		NOT NULL,
	`email`					VARCHAR(64)		NOT NULL,
	`street_address`		VARCHAR(64)		NOT NULL,
	`city`					VARCHAR(32)		NOT NULL,
	`country`				VARCHAR(32)		NOT NULL,
	`credit_card_type` 		VARCHAR(32)		NOT NULL,
	`credit_card_num`		VARCHAR(32)		NOT NULL,
	`frequent_flier_pts`	INTEGER(6)		NOT NULL,
	`passport_holder`		BOOLEAN			NOT NULL,
	`flight_status`			VARCHAR(8),
	`travel_agent`			VARCHAR(32),
	`username` 				VARCHAR(32)		NOT NULL,
	CONSTRAINT Cust_PK PRIMARY KEY(`customer_id`),
	CONSTRAINT usr UNIQUE (`username`),
	
	CONSTRAINT Cust_FK
	FOREIGN KEY (`username`) 
	REFERENCES `Login`(`username`)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
	
	CONSTRAINT Cust_FK2
	FOREIGN KEY (`travel_agent`) 
	REFERENCES `AgentProfiles`(`travel_agent`)
	ON DELETE CASCADE
	ON UPDATE NO ACTION
);

CREATE TABLE `ServiceInventory`
(
	`service_id`	INTEGER(2)	NOT NULL	AUTO_INCREMENT,
	`item`			VARCHAR(32)	NOT NULL,
	`cost`			INTEGER(3)	NOT NULL,
	`avaliablity`	VARCHAR(32)	NOT NULL,
	CONSTRAINT Service_PK PRIMARY KEY(`service_id`)
);
