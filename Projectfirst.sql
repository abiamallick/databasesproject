CREATE DATABASE Projectfirst;

USE Projectfirst;


CREATE TABLE USERS (

	username           VARCHAR(20)   NOT NULL,
    user_password      VARCHAR(30)   NOT NULL,
    email              VARCHAR(50)   NOT NULL,


PRIMARY KEY (username));

 
INSERT INTO USERS
VALUES      ('amallick','sunshine','amallick@gmail.com'),
			('jsmith','dragon','jsmith@gmail.com'), 
            ('wjohnson','google23','wjohnson@gmail.com'), 
            ('kbrown','blue57','kbrown@gmail.com'), 
            ('dgarcia','ducky52','dgarcia@gmail.com'), 
            ('tmedina','turtle!','tmedina@gmail.com');
     
INSERT INTO USERS
VALUES		('twilliams','pineapple','twilliams@gmail.com'),
            ('smartinez','watercup','smartinez@yahoo.com'),
            ('ntaylor','password','ntaylor@aol.com'),
            ('whernandez','basket','whernandez@gmail.com'),
            ('ylopez','lysol','ylopez@aol.com'),
            ('annag','poptart','annag@gmail.com'),
            ('bwilson','lamp','bwilson@gmail.com');
            
SELECT * FROM USERS;


CREATE TABLE CUSTOMERREP(
	crepusername           VARCHAR(20)   NOT NULL,
    
 PRIMARY KEY(crepusername), 
 FOREIGN KEY (crepusername) REFERENCES USERS(username) );
 
ALTER table CUSTOMERREP drop constraint customerrep_ibfk_1;
ALTER table CUSTOMERREP add constraint foreign key (crepusername) references USERS(username);

/* --------------------------------------------------------------------------------------------- */
 
 CREATE TABLE ADMIN_USER(
	adminusername           VARCHAR(20)   NOT NULL,
    
 PRIMARY KEY(adminusername), 
 FOREIGN KEY (adminusername) REFERENCES USERS(username) );

 
INSERT INTO ADMIN_USER
VALUES		('tmedina');

SELECT * FROM ADMIN_USER;

/* --------------------------------------------------------------------------------------------- */

            
INSERT INTO CUSTOMERREP
VALUES 		('amallick'),
			('jsmith');
            
            
SELECT * FROM CUSTOMERREP;

/* --------------------------------------------------------------------------------------------- */



 CREATE TABLE BUYERS(

	username           VARCHAR(20)   NOT NULL,


PRIMARY KEY (username), 
FOREIGN KEY (username) REFERENCES USERS(username) );

/* --------------------------------------------------------------------------------------------- */
 
 CREATE TABLE SELLERS (
	sid					int			Not null,
	username           VARCHAR(20)   NOT NULL,
PRIMARY KEY (username), 
FOREIGN KEY (username) REFERENCES USERS(username) );

/* --------------------------------------------------------------------------------------------- */


CREATE TABLE FOOTWEAR_ITEMS (

	footwear_item_id    INT              NOT NULL AUTO_INCREMENT,
    shoe_type 			VARCHAR(40)  	 NOT NULL,
    size                float           NOT NULL,
	item_condition     	VARCHAR(40)  	 NOT NULL,
    style 				VARCHAR(30)		NOT NULL,
    initial_price		float 			 NOT NULL,
    brand 				VARCHAR(30)		 NOT NULL,
    title 				VARCHAR(75) 	NOT NULL,

PRIMARY KEY (footwear_item_id));
ALTER TABLE FOOTWEAR_ITEMS AUTO_INCREMENT=1000;


SELECT * FROM FOOTWEAR_ITEMS;



            INSERT INTO FOOTWEAR_ITEMS (shoe_type,size,item_condition,style,initial_price,brand,title)
VALUES      ('sneakers',9,'New','athletic',15.75,'Adidas','Nike Men Sneakers'),
			('sandals',8.5,'Slightly Used','casual',35.90,'Converse','Cute Summer Sandals'),
            ('boots',6,'Slightly Used','casual',50.00,'Sperry','Funky Boots Perfect For Wedding'),
			('sandals',10.5,'New','fancy',51.35,'Doc Martens','Unique Vintage Sandals'),
            ('sandals',5,'New','fancy',35.10,'Sperry','Colorful and Comfy Blue Sandals'),
			('sneakers',6,'Very Used','athletic',100.00,'Converse','Super Comfortable Sneakers for Everyday'),
			('sneakers',6,'New','athletic',88.70,'Hunter','Perfect Running Shoes for Women'),
            ('boots',8,'New','fancy',60.00,'Vans','Trendy Boots Perfect For Any Occasion'),
            ('sandals',9,'Slightly Used','casual',50.50,'Converse','Barely Worn Beach Sandals For Teen Boys'),
            ('sandals',5,'Very Used','casual',75.79,'Under Armour','Everyday Orange Sandals In Decent Shape'),
            ('sandals',6,'Slightly Used','casual',20.00,'Reebok','One of a Kind Retro Sandals For Women');
            


/* --------------------------------------------------------------------------------------------- */




CREATE TABLE ALERTS (
	alertID					int			NOT NULL AUTO_INCREMENT, 
	alert_message		Varchar(400)	Not NULL,
	footwear_item_id    	INT 	    NOT NULL,
    alert_username		varchar(20)  NOT NULL,
    

PRIMARY KEY (alertID), 
FOREIGN KEY (footwear_item_id) REFERENCES FOOTWEAR_ITEMS(footwear_item_id),
FOREIGN KEY (alert_username) REFERENCES USERS(username) );

Select alert_message 
from alerts 
WHERE alert_username= 'amallick';

INSERT INTO ALERTS
VALUES      (10,'You have won the auction!',1001,'amallick');

INSERT INTO ALERTS(alert_message, footwear_item_id, alert_username)
VALUES      ('Sorry, unfortunately another user has won the auction',1001,'kbrown');

Select * from alerts;

Select a.alert_message, f.title 
from alerts a, footwear_items f
WHERE a.alert_username= 'amallick' And f.footwear_item_id =1001;





/* --------------------------------------------------------------------------------------------- */
/* AUCTIONS TABLE */
 
CREATE TABLE Auctions (
	footwear_sells_id	int		Not Null	AUTO_INCREMENT,
	auction_id			int		Not NULL,
    auction_user		varchar(20)		NOT NULL,
	starting_date		date	Not Null,
	closing_date         date    NOT NULL,
    initial_price_sells		float     NOT NULL, 

Foreign key(footwear_sells_id) references footwear_items(footwear_item_id),
Foreign key(auction_user) references USERS(username),
PRIMARY KEY (auction_id));
ALTER TABLE Auctions AUTO_INCREMENT=1000;



INSERT INTO Auctions (auction_id, auction_user,starting_date, closing_date, initial_price_sells)
VALUES      (3844, 'annag', '2021-02-19','2021-04-26',15.75),
			(9880, 'ylopez','2021-02-03','2021-03-10',35.90),
            (9683, 'bwilson','2021-01-31','2021-02-28',50.00),
			(1606, 'bwilson','2021-03-02','2021-05-20',51.35),
            (8451, 'annag','2021-03-11','2021-04-07',35.10),
			(8260, 'smartinez','2021-02-23','2021-05-28',100.00),
			(0978, 'smartinez', '2021-01-26','2021-05-09',88.70),
            (3892, 'ylopez','2021-03-05','2021-05-01',60.00),
            (1893, 'bwilson', '2021-01-11','2021-04-29',50.50),
            (2932, 'annag','2021-02-20','2021-04-27',75.79),
            (8562, 'bwilson','2021-03-06','2021-06-21',20.00);
            
            
            
Select * from Auctions;






/* --------------------------------------------------------------------------------------------- */

/* --------------------------------------------------------------------------------------------- */


CREATE TABLE ANSWERS (

	question_id         VARCHAR(5)    NOT NULL,
    username 		    VARCHAR(20)   NOT NULL,
    keywords 		    VARCHAR(25)   NOT NULL, 


PRIMARY KEY (username, question_id), 
FOREIGN KEY (question_id) REFERENCES QUESTIONS(question_id),
FOREIGN KEY (username) REFERENCES USERS(username) );

/* --------------------------------------------------------------------------------------------- */

CREATE TABLE QUESTIONS (

    question_id 		 int     NOT NULL auto_increment,
    q_username 		    VARCHAR(20)   NOT NULL,
    question            VARCHAR(100) NOT NULL,
    answer              VARCHAR(100) NOT NULL,

PRIMARY KEY (question_id),
FOREIGN KEY (q_username) REFERENCES USERS(username) );
ALTER TABLE QUESTIONS AUTO_INCREMENT=10;

INSERT INTO QUESTIONS (q_username, question, answer)
VALUE ('amallick', 'What is an alert?', 'Customer representative will answer soon'),
	('jsmith','How to make an alert?','Customer representative will answer soon'), 
	('wjohnson','How to bid on an item?','Customer representative will answer soon'), 
            ('kbrown','How do automatic bids work?','Customer representative will answer soon'), 
            ('dgarcia','How can I sell an item?','Customer representative will answer soon'), 
            ('tmedina','How can I buy an item?','Customer representative will answer soon');
/* --------------------------------------------------------------------------------------------- */

/* --------------------------------------------------------------------------------------------- */


CREATE TABLE BIDS (
	Bid_ID				INT			Not Null AUTO_INCREMENT,
    bid_username 		    VARCHAR(20)  NOT NULL,
	bid_footwear_item_id    INT 	     NOT NULL,
    bid_amount			double			Not Null,
	isAutomatic			tinyint	     NOT NULL,
	upper_limit 		DOUBLE 		,
    
PRIMARY KEY (Bid_ID),
FOREIGN KEY (bid_username) REFERENCES USERS(username), 
FOREIGN KEY (bid_footwear_item_id) REFERENCES FOOTWEAR_ITEMS(footwear_item_id));
ALTER TABLE BIDS AUTO_INCREMENT=500;

INSERT INTO BIDS (bid_username, bid_footwear_item_id, bid_amount, isAutomatic)
VALUES      ('amallick', 1001, 37.00,false),
			('ntaylor', 1001,49.20 , false),
            ('jsmith', 1005, 111.11 ,false),
			('amallick', 1004,40.50,false),
            ('twilliams', 1002,75.00, false),
            ('dgarcia', 1009,83.20 ,false),
            ('dgarcia', 1001, 60.50,false);
            
select * from bids;
            


            





