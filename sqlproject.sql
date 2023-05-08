DROP TABLE user_t CASCADE CONSTRAINT;
DROP TABLE listing_t CASCADE CONSTRAINT;
DROP TABLE bid_t CASCADE CONSTRAINT;
DROP TABLE message_t CASCADE CONSTRAINT;
DROP TABLE view_t CASCADE CONSTRAINT;
DROP TABLE Bid_Winner_t CASCADE CONSTRAINT;
DROP TABLE PurchaseHistory_t CASCADE CONSTRAINT;
DROP TABLE Vehical_info_t CASCADE CONSTRAINT;
DROP TABLE Inventory_t CASCADE CONSTRAINT;
DROP TABLE Manufacture_t CASCADE CONSTRAINT;

--ALTER SESSION SET NLS_DATE_FORMAT = 'dd/mm/yyyy';

CREATE TABLE user_t (
    user_id NUMBER,
    first_name VARCHAR(50),
	last_name VARCHAR(50),
	address VARCHAR(50),
    email VARCHAR(50)
);

ALTER TABLE user_t
	ADD CONSTRAINT user_t_pk PRIMARY KEY (user_id);

CREATE TABLE listing_t (
    listing_id NUMBER NULL,
    user_id NUMBER,
    title VARCHAR(50),
    VinNumber VARCHAR2(100),
    listing_price NUMBER NULL,
    end_date DATE NULL
);
ALTER TABLE listing_t
	ADD CONSTRAINT listing_t_pk PRIMARY KEY (listing_id);

CREATE TABLE bid_t(
    bid_id NUMBER,
    listing_id NUMBER,
    user_id NUMBER,
    bid_amount NUMBER
);

ALTER TABLE bid_t
	ADD CONSTRAINT bid_t_pk PRIMARY KEY (bid_id);

CREATE TABLE message_t (
    message_id NUMBER,
    user_id NUMBER,
    listing_id NUMBER,
    usermessage VARCHAR(50)
);

ALTER TABLE message_t 
	ADD CONSTRAINT message_t_pk PRIMARY KEY (message_id);

CREATE TABLE view_t (
    view_id NUMBER,
    user_id NUMBER,
    listing_id NUMBER,
    minutes_viewed NUMBER
);

ALTER TABLE view_t
	ADD CONSTRAINT view_t_pk PRIMARY KEY (view_id);


CREATE TABLE Bid_Winner_t
(
	BidWin_id NUMBER,
	BidPrice NUMBER,
    bid_id NUMBER
);

ALTER TABLE Bid_Winner_t
	ADD CONSTRAINT Bid_Winner_t_pk PRIMARY KEY (BidWin_id);

CREATE TABLE PurchaseHistory_t
(
	user_id NUMBER,
	BidWin_id NUMBER
);

ALTER TABLE PurchaseHistory_t
	ADD CONSTRAINT PurchaseHistory_t_pk PRIMARY KEY (user_id);

CREATE TABLE Vehical_info_t
(
	VinNumber VARCHAR(100),
	VehicalMileage NUMBER,
	ModelNumber NUMBER,
	VehicalMake VARCHAR(50),
	Manufacture_id NUMBER
);

ALTER TABLE Vehical_info_t
	ADD CONSTRAINT Vehical_info_t_pk PRIMARY KEY (VinNumber);

CREATE TABLE Manufacture_t
(
	Manufacture_id NUMBER,
	Manufacture_name VARCHAR(50)
);

ALTER TABLE Manufacture_t
	ADD CONSTRAINT Manufacture_t_pk PRIMARY KEY (Manufacture_id);

CREATE TABLE Inventory_t
(
	VinNumber VARCHAR2(100),
	Inventory_id NUMBER
);

ALTER TABLE Inventory_t
	ADD CONSTRAINT Inventory_t_pk PRIMARY KEY (Inventory_id);
	
	


----------- adding foreign keys
 
ALTER TABLE listing_t
	ADD CONSTRAINT listing_t_fk FOREIGN KEY
	(
		user_id
	)
	REFERENCES user_t
	(
		user_id
	);

ALTER TABLE listing_t
    ADD CONSTRAINT listing_vin_fk FOREIGN KEY
    (
        VinNumber
    )
    REFERENCES Vehical_info_t
    (
        VinNumber
    );

	
ALTER TABLE bid_t
	ADD CONSTRAINT bid_listing_fk FOREIGN KEY
	(
		listing_id
	)
	REFERENCES listing_t
	(
		listing_id
	);
	
ALTER TABLE bid_t
	ADD CONSTRAINT bid_user_fk FOREIGN KEY
	(
		user_id
	)
	REFERENCES user_t
	(
		user_id
	);
    
ALTER TABLE Bid_Winner_t
    ADD CONSTRAINT bid_t_fk FOREIGN KEY
    (
        bid_id
    )
    REFERENCES bid_t
    (
        bid_id
    );
	

ALTER TABLE message_t
	ADD CONSTRAINT message_t_fk FOREIGN KEY
	(
		user_id
	)
	REFERENCES user_t
	(
		user_id
	);
	
ALTER TABLE view_t
	ADD CONSTRAINT view_user_fk FOREIGN KEY
	(
		user_id
	)
	REFERENCES user_t
	(
		user_id
	);	
	
ALTER TABLE view_t
	ADD CONSTRAINT view_listing_fk FOREIGN KEY
	(
		listing_id
	)
	REFERENCES listing_t
	(
		listing_id
	);

ALTER TABLE PurchaseHistory_t
	ADD CONSTRAINT PurchaseHistory_t_fk FOREIGN KEY
	(
		BidWin_id
	)
	REFERENCES Bid_Winner_t
	(
		BidWin_id
	);

ALTER TABLE PurchaseHistory_t
    ADD CONSTRAINT PurchaseHistory_user_fk FOREIGN KEY
    (
        user_id
    )
    REFERENCES user_t
    (
        user_id
    );


ALTER TABLE Vehical_info_t
	ADD CONSTRAINT Vehical_info_t_fk FOREIGN KEY
	(
		Manufacture_id
	)
	REFERENCES Manufacture_t
	(
		Manufacture_id
	);

ALTER TABLE Inventory_t
	ADD CONSTRAINT Inventory_t_fk FOREIGN KEY
	(
		VinNumber
	)
	REFERENCES Vehical_info_t
	(
		VinNumber
	);



------ INSERT VALUES


INSERT INTO user_t (user_id, first_name, last_name, address, email) VALUES (1, 'AJ','Robinson', '123 Main st', 'ajrobinson@gmail.com');
INSERT INTO user_t (user_id, first_name, last_name, address, email) VALUES (2, 'Dave', 'Wilson', '135 Maple St', 'Davewilson@gmail.com');
INSERT INTO user_t (user_id, first_name, last_name, address, email) VALUES (3, 'David', 'Brown', '246 Pine St', 'davidbrown@vcu.edu');
INSERT INTO user_t (user_id, first_name, last_name, address, email) VALUES (4, 'Sam', 'Miller', '357 Cedar St', 'sammiller@hotmail.com');
INSERT INTO user_t (user_id, first_name, last_name, address, email) VALUES (5, 'Chris', 'Moore', '468 Birch St', 'chrismoore@gmail.com');
INSERT INTO user_t (user_id, first_name, last_name, address, email) VALUES (6, 'Ashley', 'Taylor', '579 Ash St', 'ashleytaylor@gmail.com');
INSERT INTO user_t (user_id, first_name, last_name, address, email) VALUES (7, 'Jessica', 'White', '689 Cedar St', 'jessicaWhite@live.com');
INSERT INTO user_t (user_id, first_name, last_name, address, email) VALUES (8, 'James', 'Thomas', '781 Willow St', 'jamesthomas@outlook.com');
INSERT INTO user_t (user_id, first_name, last_name, address, email) VALUES (9, 'Emily', 'Jackson', '821 Elm St', 'emilyjackson@gmail.com');
INSERT INTO user_t (user_id, first_name, last_name, address, email) VALUES (10, 'Matthew', 'White', '931 Oak St', 'matthewwhite@gmail.com');
INSERT INTO user_t (user_id, first_name, last_name, address, email) VALUES (11, 'Olivia', 'Harris', '103 Maple St', 'oliviaharris@gmail.com');

INSERT INTO Manufacture_t (Manufacture_id, Manufacture_name) VALUES (5050, 'Ford');
INSERT INTO Manufacture_t (Manufacture_id, Manufacture_name) VALUES (6000, 'Tesla');
INSERT INTO Manufacture_t (Manufacture_id, Manufacture_name) VALUES (1001, 'Volkswagen');
INSERT INTO Manufacture_t (Manufacture_id, Manufacture_name) VALUES (2005, 'Audi');
INSERT INTO Manufacture_t (Manufacture_id, Manufacture_name) VALUES (4000, 'Porsche');
INSERT INTO Manufacture_t (Manufacture_id, Manufacture_name) VALUES (1200, 'Subaru');
INSERT INTO Manufacture_t (Manufacture_id, Manufacture_name) VALUES (7200, 'Honda');
INSERT INTO Manufacture_t (Manufacture_id, Manufacture_name) VALUES (6520, 'Nissan');
INSERT INTO Manufacture_t (Manufacture_id, Manufacture_name) VALUES (2001, 'Chevy');

INSERT INTO Vehical_info_t (VinNumber, VehicalMileage, ModelNumber, VehicalMake, Manufacture_id) VALUES ('1G1JH6SB1E4190950',89750,500,'Mustang GT',5050);
INSERT INTO Vehical_info_t (VinNumber, VehicalMileage, ModelNumber, VehicalMake, Manufacture_id) VALUES ('KMHWF35H65A134095',1200,1620,'Model S',6000);
INSERT INTO Vehical_info_t (VinNumber, VehicalMileage, ModelNumber, VehicalMake, Manufacture_id) VALUES ('1FT7W2B60DEA30800',115620,705,'EuroVan Camper',1001);
INSERT INTO Vehical_info_t (VinNumber, VehicalMileage, ModelNumber, VehicalMake, Manufacture_id) VALUES ('1FMYU93Z46KC04380',25620,650,'RS3',2005);
INSERT INTO Vehical_info_t (VinNumber, VehicalMileage, ModelNumber, VehicalMake, Manufacture_id) VALUES ('2C3CCARG4DH606563',50205,400,'Cayman S',4000);
INSERT INTO Vehical_info_t (VinNumber, VehicalMileage, ModelNumber, VehicalMake, Manufacture_id) VALUES ('WBA5A5C58FD530593',32560,450,'Outback',1200);
INSERT INTO Vehical_info_t (VinNumber, VehicalMileage, ModelNumber, VehicalMake, Manufacture_id) VALUES ('JTDBT923084013668',5000,1621,'Model S',6000);
INSERT INTO Vehical_info_t (VinNumber, VehicalMileage, ModelNumber, VehicalMake, Manufacture_id) VALUES ('1GNFC13047J166715',10001,821,'CR-V',7200);
INSERT INTO Vehical_info_t (VinNumber, VehicalMileage, ModelNumber, VehicalMake, Manufacture_id) VALUES ('4T1BK3DB8CU423451',8000,629,'Explorer',5050);
INSERT INTO Vehical_info_t (VinNumber, VehicalMileage, ModelNumber, VehicalMake, Manufacture_id) VALUES ('2FMDK49C97BB34882',3542,7000,'Rogue',6520);
INSERT INTO Vehical_info_t (VinNumber, VehicalMileage, ModelNumber, VehicalMake, Manufacture_id) VALUES ('1FMCU9DG3AKA77931',123650,6540,'Silverado',2001);

INSERT INTO listing_t (listing_id, user_id, title, VinNumber, listing_price, end_date) VALUES(1, 1, '2015 Ford Mustang GT','1G1JH6SB1E4190950',20000, '12/31/2022');
INSERT INTO listing_t (listing_id, user_id, title, VinNumber, listing_price, end_date) VALUES (2, 1, '2021 Tesla Model S','KMHWF35H65A134095', 50000, '9/9/2022');
INSERT INTO listing_t (listing_id, user_id, title, VinNumber, listing_price, end_date) VALUES (3, 2, '1995 Volkswagen EuroVan Camper','1FT7W2B60DEA30800', 5000, '1/2/2023');
INSERT INTO listing_t (listing_id, user_id, title, VinNumber, listing_price, end_date) VALUES (4, 2, '2018 Audi RS3','1FMYU93Z46KC04380', 30000, '9/9/2021');
INSERT INTO listing_t (listing_id, user_id, title, VinNumber, listing_price, end_date) VALUES (5, 4, '2007 Porsche Cayman S','2C3CCARG4DH606563', 22000, '12/26/2022');
INSERT INTO listing_t (listing_id, user_id, title, VinNumber, listing_price, end_date) VALUES (6, 6, '2022 Subaru Outback','WBA5A5C58FD530593', 24000, '12/31/2022');
INSERT INTO listing_t (listing_id, user_id, title, VinNumber, listing_price, end_date) VALUES (7, 7, '2021 Tesla Model S','JTDBT923084013668', 48000, '10/30/2022');
INSERT INTO listing_t (listing_id, user_id, title, VinNumber, listing_price, end_date) VALUES (8, 4, '2020 Honda CR-V','1GNFC13047J166715', 32000, '3/24/2023');
INSERT INTO listing_t (listing_id, user_id, title, VinNumber, listing_price, end_date) VALUES (9, 9, '2021 Ford Explorer','4T1BK3DB8CU423451', 38000, '11/20/2022');
INSERT INTO listing_t (listing_id, user_id, title, VinNumber, listing_price, end_date) VALUES (10, 8, '2022 Nissan Rogue','2FMDK49C97BB34882', 34000, '12/30/2022');

INSERT INTO bid_t (bid_id, listing_id, user_id, bid_amount) VALUES (1, 1, 2, 21000);
INSERT INTO bid_t (bid_id, listing_id, user_id, bid_amount) VALUES (2, 2, 3, 52000);
INSERT INTO bid_t (bid_id, listing_id, user_id, bid_amount) VALUES (3, 3, 1, 5500);
INSERT INTO bid_t (bid_id, listing_id, user_id, bid_amount) VALUES (4, 1, 5, 31000);
INSERT INTO bid_t (bid_id, listing_id, user_id, bid_amount) VALUES (5, 7, 4, 52000);
INSERT INTO bid_t (bid_id, listing_id, user_id, bid_amount) VALUES (6, 3, 7, 6500);
INSERT INTO bid_t (bid_id, listing_id, user_id, bid_amount) VALUES (7, 3, 10, 7500);

INSERT INTO message_t (message_id, user_id, listing_id, usermessage) VALUES (1, 4, 1, 'Example message 1');
INSERT INTO message_t (message_id, user_id, listing_id, usermessage) VALUES (2, 1, 10, 'Example message 2');
INSERT INTO message_t (message_id, user_id, listing_id, usermessage) VALUES (3, 6, 2, 'Example message 3');
INSERT INTO message_t (message_id, user_id, listing_id, usermessage) VALUES (4, 9, 5, 'Example message 4');
INSERT INTO message_t (message_id, user_id, listing_id, usermessage) VALUES (5, 11, 8, 'Example message 5');
INSERT INTO message_t (message_id, user_id, listing_id, usermessage) VALUES (6, 7, 4, 'Example message 6');
INSERT INTO message_t (message_id, user_id, listing_id, usermessage) VALUES (7, 9, 3, 'Example message 7');
INSERT INTO message_t (message_id, user_id, listing_id, usermessage) VALUES (8, 5, 2, 'Example message 8');
INSERT INTO message_t (message_id, user_id, listing_id, usermessage) VALUES (9, 2, 1, 'Example message 9');
INSERT INTO message_t (message_id, user_id, listing_id, usermessage) VALUES (10, 4, 9, 'Example message 10');
INSERT INTO message_t (message_id, user_id, listing_id, usermessage) VALUES (11, 10, 8, 'Example message 11');
INSERT INTO message_t (message_id, user_id, listing_id, usermessage) VALUES (12, 7, 2, 'Example message 12');

INSERT INTO view_t (view_id, user_id, listing_id, minutes_viewed) VALUES (1, 9, 1, 5);
INSERT INTO view_t (view_id, user_id, listing_id, minutes_viewed) VALUES (2, 5, 1, 10);
INSERT INTO view_t (view_id, user_id, listing_id, minutes_viewed) VALUES (3, 1, 3, 13);
INSERT INTO view_t (view_id, user_id, listing_id, minutes_viewed) VALUES (4, 7, 7, 4);
INSERT INTO view_t (view_id, user_id, listing_id, minutes_viewed) VALUES (5, 5, 2, 1);
INSERT INTO view_t (view_id, user_id, listing_id, minutes_viewed) VALUES (6, 1, 11, 7);
INSERT INTO view_t (view_id, user_id, listing_id, minutes_viewed) VALUES (7, 2, 4, 19);
INSERT INTO view_t (view_id, user_id, listing_id, minutes_viewed) VALUES (8, 3, 7, 22);
INSERT INTO view_t (view_id, user_id, listing_id, minutes_viewed) VALUES (9, 7, 9, 35);
INSERT INTO view_t (view_id, user_id, listing_id, minutes_viewed) VALUES (10, 3, 5, 100);
INSERT INTO view_t (view_id, user_id, listing_id, minutes_viewed) VALUES (11, 4, 8, 3);
INSERT INTO view_t (view_id, user_id, listing_id, minutes_viewed) VALUES (12, 9, 3, 2);
INSERT INTO view_t (view_id, user_id, listing_id, minutes_viewed) VALUES (13, 8, 6, 1);
INSERT INTO view_t (view_id, user_id, listing_id, minutes_viewed) VALUES (14, 11, 2, 11);
INSERT INTO view_t (view_id, user_id, listing_id, minutes_viewed) VALUES (15, 6, 3, 6);
INSERT INTO view_t (view_id, user_id, listing_id, minutes_viewed) VALUES (16, 10, 10, 2);

INSERT INTO Bid_Winner_t (BidWin_id, BidPrice, bid_id) VALUES (1, 31000, 4);
INSERT INTO Bid_Winner_t (BidWin_id, BidPrice, bid_id) VALUES (2, 52000, 2);
INSERT INTO Bid_Winner_t (BidWin_id, BidPrice, bid_id) VALUES (3, 7500, 7);
INSERT INTO Bid_Winner_t (BidWin_id, BidPrice, bid_id) VALUES (4, 52000, 5);

INSERT INTO PurchaseHistory_t (user_id, BidWin_id) VALUES (5,1);
INSERT INTO PurchaseHistory_t (user_id, BidWin_id) VALUES (3,2);
INSERT INTO PurchaseHistory_t (user_id, BidWin_id) VALUES (10,3);
INSERT INTO PurchaseHistory_t (user_id, BidWin_id) VALUES (4,4);

INSERT INTO Inventory_t (VinNumber, Inventory_id) VALUES ('1FMCU9DG3AKA77931',1);