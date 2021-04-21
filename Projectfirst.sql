CREATE DATABASE Projectfirst;
USE Projectfirst;

Delete FROM USERS WHERE username=' ';
UPDATE USERS SET user_password = 'yolo' WHERE username = 'wjohnson';

CREATE TABLE USERS (

	username           VARCHAR(20)   NOT NULL,
    user_password      VARCHAR(30)   NOT NULL,
    email              VARCHAR(50)   NOT NULL,


PRIMARY KEY (username, user_password, email));

 
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
    creppassword			VARCHAR(30) NOT NULL,
    crepemail 				VARCHAR(50)	NOT NULL,
    
 PRIMARY KEY(crepusername), 
 FOREIGN KEY (crepusername) REFERENCES USERS(username));
 
    
INSERT INTO CUSTOMERREP
VALUES 		('jsmith','dragon','jsmith@gmail.com');
            
            
SELECT * FROM CUSTOMERREP;
 
ALTER table CUSTOMERREP add constraint foreign key (crepusername) references USERS(username);

/* --------------------------------------------------------------------------------------------- */
 
 CREATE TABLE ADMIN_USER(
	adminusername           VARCHAR(20)   NOT NULL,
	adminpassword		VARCHAR(20)   NOT NULL,
    
 PRIMARY KEY(adminusername), 
 FOREIGN KEY (adminusername) REFERENCES USERS(username) );

 
INSERT INTO ADMIN_USER
VALUES		('tmedina','turtle!');

SELECT * FROM ADMIN_USER;
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    sold                tinyint,
=======
    sold 				BOOL 			NOT NULL,
>>>>>>> branch 'master' of https://github.com/abiamallick/databasesproject.git
=======
    sold 				BOOL 			NOT NULL,
>>>>>>> branch 'master' of https://github.com/abiamallick/databasesproject.git
=======
    sold 				BOOL 			NOT NULL,
>>>>>>> refs/remotes/origin/master

PRIMARY KEY (footwear_item_id));
ALTER TABLE FOOTWEAR_ITEMS AUTO_INCREMENT=1000;

SELECT * FROM FOOTWEAR_ITEMS;

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
            INSERT INTO FOOTWEAR_ITEMS (shoe_type,size,item_condition,style,initial_price,brand,title,sold)
VALUES      ('sneakers',9,'New','athletic',15.75,'Adidas','Nike Men Sneakers',true),
			('sandals',8.5,'Slightly Used','casual',35.90,'Converse','Cute Summer Sandals',true),
            ('boots',6,'Slightly Used','casual',50.00,'Sperry','Funky Boots Perfect For Wedding',false),
			('sandals',10.5,'New','fancy',51.35,'Doc Martens','Unique Vintage Sandals',false),
            ('sandals',5,'New','fancy',35.10,'Sperry','Colorful and Comfy Blue Sandals',true),
			('sneakers',6,'Very Used','athletic',100.00,'Converse','Super Comfortable Sneakers for Everyday',true),
			('sneakers',6,'New','athletic',88.70,'Hunter','Perfect Running Shoes for Women',true),
            ('boots',8,'New','fancy',60.00,'Vans','Trendy Boots Perfect For Any Occasion',true),
            ('sandals',9,'Slightly Used','casual',50.50,'Converse','Barely Worn Beach Sandals For Teen Boys',true),
            ('sandals',5,'Very Used','casual',75.79,'Under Armour','Everyday Orange Sandals In Decent Shape',true),
            ('sandals',6,'Slightly Used','casual',20.00,'Reebok','One of a Kind Retro Sandals For Women',true);
=======
            
INSERT INTO FOOTWEAR_ITEMS (shoe_type,size,item_condition,style,initial_price,brand,title,sold)
VALUES      ('sneakers',9,'New','athletic',15.75,'Adidas','Nike Men Sneakers','0'),
			('sandals',8.5,'Slightly Used','casual',35.90,'Converse','Cute Summer Sandals','1'),
            ('boots',6,'Slightly Used','casual',50.00,'Sperry','Funky Boots Perfect For Wedding','1'),
			('sandals',10.5,'New','fancy',51.35,'Doc Martens','Unique Vintage Sandals','0'),
            ('sandals',5,'New','fancy',35.10,'Sperry','Colorful and Comfy Blue Sandals','0'),
			('sneakers',6,'Very Used','athletic',100.00,'Converse','Super Comfortable Sneakers for Everyday','0'),
			('sneakers',6,'New','athletic',88.70,'Hunter','Perfect Running Shoes for Women','0'),
            ('boots',8,'New','fancy',60.00,'Vans','Trendy Boots Perfect For Any Occasion','0'),
            ('sandals',9,'Slightly Used','casual',50.50,'Converse','Barely Worn Beach Sandals For Teen Boys','0'),
            ('sandals',5,'Very Used','casual',75.79,'Under Armour','Everyday Orange Sandals In Decent Shape','0'),
            ('sandals',6,'Slightly Used','casual',20.00,'Reebok','One of a Kind Retro Sandals For Women','0');
=======
            
INSERT INTO FOOTWEAR_ITEMS (shoe_type,size,item_condition,style,initial_price,brand,title,sold)
VALUES      ('sneakers',9,'New','athletic',15.75,'Adidas','Nike Men Sneakers','0'),
			('sandals',8.5,'Slightly Used','casual',35.90,'Converse','Cute Summer Sandals','1'),
            ('boots',6,'Slightly Used','casual',50.00,'Sperry','Funky Boots Perfect For Wedding','1'),
			('sandals',10.5,'New','fancy',51.35,'Doc Martens','Unique Vintage Sandals','0'),
            ('sandals',5,'New','fancy',35.10,'Sperry','Colorful and Comfy Blue Sandals','0'),
			('sneakers',6,'Very Used','athletic',100.00,'Converse','Super Comfortable Sneakers for Everyday','0'),
			('sneakers',6,'New','athletic',88.70,'Hunter','Perfect Running Shoes for Women','0'),
            ('boots',8,'New','fancy',60.00,'Vans','Trendy Boots Perfect For Any Occasion','0'),
            ('sandals',9,'Slightly Used','casual',50.50,'Converse','Barely Worn Beach Sandals For Teen Boys','0'),
            ('sandals',5,'Very Used','casual',75.79,'Under Armour','Everyday Orange Sandals In Decent Shape','0'),
            ('sandals',6,'Slightly Used','casual',20.00,'Reebok','One of a Kind Retro Sandals For Women','0');
=======
            
INSERT INTO FOOTWEAR_ITEMS (shoe_type,size,item_condition,style,initial_price,brand,title,sold)
VALUES      ('sneakers',9,'New','athletic',15.75,'Adidas','Nike Men Sneakers','0'),
			('sandals',8.5,'Slightly Used','casual',35.90,'Converse','Cute Summer Sandals','1'),
            ('boots',6,'Slightly Used','casual',50.00,'Sperry','Funky Boots Perfect For Wedding','1'),
			('sandals',10.5,'New','fancy',51.35,'Doc Martens','Unique Vintage Sandals','0'),
            ('sandals',5,'New','fancy',35.10,'Sperry','Colorful and Comfy Blue Sandals','0'),
			('sneakers',6,'Very Used','athletic',100.00,'Converse','Super Comfortable Sneakers for Everyday','0'),
			('sneakers',6,'New','athletic',88.70,'Hunter','Perfect Running Shoes for Women','0'),
            ('boots',8,'New','fancy',60.00,'Vans','Trendy Boots Perfect For Any Occasion','0'),
            ('sandals',9,'Slightly Used','casual',50.50,'Converse','Barely Worn Beach Sandals For Teen Boys','0'),
            ('sandals',5,'Very Used','casual',75.79,'Under Armour','Everyday Orange Sandals In Decent Shape','0'),
            ('sandals',6,'Slightly Used','casual',20.00,'Reebok','One of a Kind Retro Sandals For Women','0');
            

>>>>>>> refs/remotes/origin/master
            

>>>>>>> branch 'master' of https://github.com/abiamallick/databasesproject.git
            

>>>>>>> branch 'master' of https://github.com/abiamallick/databasesproject.git
            
/* --------------------------------------------------------------------------------------------- */
CREATE TABLE ALERTS (
	alertID					int			NOT NULL AUTO_INCREMENT, 
	alert_message		Varchar(400)	Not NULL,
	footwear_item_id    	INT 	    NOT NULL,
    alert_username		varchar(20)  NOT NULL,
    

PRIMARY KEY (alertID), 
FOREIGN KEY (footwear_item_id) REFERENCES FOOTWEAR_ITEMS(footwear_item_id),
FOREIGN KEY (alert_username) REFERENCES USERS(username) );
ALTER TABLE Alerts
ADD CONSTRAINT alert_username
    FOREIGN KEY (alert_username)
    REFERENCES Users (username)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
    
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
	footwear_sells_id		int				Not Null	AUTO_INCREMENT,
	auction_id				int				Not NULL,
    auction_user			varchar(20)		NOT NULL,
	starting_date			date			Not Null,
	closing_date         	datetime    		NOT NULL,
    initial_price_sells		float     	    , 

Foreign key(footwear_sells_id) references footwear_items(footwear_item_id),
Foreign key(auction_user) references USERS(username),
PRIMARY KEY (auction_id));
ALTER TABLE Auctions AUTO_INCREMENT=1000;

ALTER TABLE Auctions
ADD CONSTRAINT auction_user
    FOREIGN KEY (auction_user)
    REFERENCES Users (username)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
    

INSERT INTO Auctions (auction_id, auction_user,starting_date, closing_date, initial_price_sells)
VALUES      (3844, 'annag', '2021-02-19','2021-04-26 13:10:01',15.75),
			(9880, 'ylopez','2021-02-03','2021-04-17 21:30:45',35.90),
            (9683, 'bwilson','2021-01-31','2021-02-28 20:14:08',50.00),
			(1606, 'bwilson','2021-03-02','2021-05-20 23:25:10',51.35),
            (8451, 'annag','2021-03-11','2021-04-07 14:19:18',35.10),
			(8260, 'smartinez','2021-02-23','2021-05-28 23:22:10',100.00),
			(0978, 'smartinez', '2021-01-26','2021-05-09 20:34:50',88.70),
            (3892, 'ylopez','2021-03-05','2021-05-01 18:19:08',60.00),
            (1010, 'bwilson', '2021-04-15','2021-04-29 14:15:13',50.50),
            (1005, 'annag','2021-02-20','2021-04-16 12:17:19',75.79),
            (1004, 'bwilson','2021-04-06','2021-04-21 13:18:05',20.00);

/* --------------------------------------------------------------------------------------------- */

CREATE TABLE QUESTIONS (

    question_id 		 int     NOT NULL auto_increment,
    q_username 		    VARCHAR(20)   NOT NULL,
    question            VARCHAR(100) NOT NULL,
    answer              VARCHAR(100) NOT NULL,

PRIMARY KEY (question_id),
FOREIGN KEY (q_username) REFERENCES USERS(username) );
ALTER TABLE QUESTIONS AUTO_INCREMENT=10;
ALTER TABLE Questions
ADD CONSTRAINT q_username
    FOREIGN KEY (q_username)
    REFERENCES Users (username)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

INSERT INTO QUESTIONS (q_username, question, answer)
VALUE ('amallick', 'What is an alert?', 'Customer representative will answer soon'),
	('jsmith','How to make an alert?','Customer representative will answer soon'), 
	('wjohnson','How to bid on an item?','Customer representative will answer soon'), 
            ('kbrown','How do automatic bids work?','Customer representative will answer soon'), 
            ('dgarcia','How can I sell an item?','Customer representative will answer soon'), 
            ('tmedina','How can I buy an item?','Customer representative will answer soon');
/* --------------------------------------------------------------------------------------------- */

CREATE TABLE BIDS (
	Bid_ID				INT			     Not Null AUTO_INCREMENT,
    bid_username 		    VARCHAR(20)  NOT NULL,
	bid_footwear_item_id    INT 	     NOT NULL,
    bid_amount			double			 Not Null,
	isAutomatic			tinyint	         NOT NULL,
	upper_limit 		DOUBLE 		,
    bid_increment       DOUBLE      ,
    
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
ALTER TABLE Bids
ADD CONSTRAINT bid_username
    FOREIGN KEY (bid_username)
    REFERENCES Users (username)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

            
/* --------------------------------------------------------------------------------------------- */

 CREATE TABLE BUYERS(

	username           VARCHAR(20)   NOT NULL,


PRIMARY KEY (username), 
FOREIGN KEY (username) REFERENCES USERS(username) );

 
 CREATE TABLE SELLERS (
	sid					int			Not null,
	username           VARCHAR(20)   NOT NULL,
PRIMARY KEY (username), 
FOREIGN KEY (username) REFERENCES USERS(username) );


Select f.title, a.starting_date, a.closing_date, f.sold
FROM Bids b, Auctions a, footwear_items f
where b.bid_username='amallick' AND b.bid_footwear_item_id=f.footwear_item_id AND f.footwear_item_id=a.footwear_sells_id AND date_format(a.closing_date, '%Y-%m')=date_format(now(), '%Y-%m');
/*-- where a.closing_date >= extract(YEAR_MONTH from CURRENT_DATE) 
  and a.closing_date <  extract(YEAR_MONTH from CURRENT_DATE + INTERVAL 1 MONTH)--*/

SELECT b.bid_username, f.title, a.starting_date, a.closing_date, f.sold
FROM Bids b
JOIN footwear_items f
  ON b.bid_footwear_item_id=f.footwear_item_id
JOIN Auctions a
  ON f.footwear_item_id=a.footwear_sells_id
WHERE b.bid_username='amallick' AND  date_format(a.closing_date, '%Y-%m')=date_format(now(), '%Y-%m');

SELECT f.title, f.size, a.closing_date, a.starting_date, a.auction_user
FROM footwear_items f
JOIN Auctions a ON a.footwear_sells_id=f.footwear_item_id
WHERE f.footwear_item_id != '1004' AND f.shoe_type = 'sandals' AND date_format(a.closing_date, '%Y-%m')=date_format(now(), '%Y-%m')
ORDER BY f.title;
/* --------------------------------------------------------------------------------------------- */

