CREATE DATABASE Projectfirst;
USE Projectfirst;

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
 
 CREATE TABLE ADMIN_USER(
	adminusername           VARCHAR(20)   NOT NULL,
	adminpassword		VARCHAR(20)   NOT NULL,
    
 PRIMARY KEY(adminusername), 
 FOREIGN KEY (adminusername) REFERENCES USERS(username) );

 
INSERT INTO ADMIN_USER
VALUES		('tmedina','turtle!');

SELECT * FROM ADMIN_USER;



CREATE TABLE FOOTWEAR_ITEMS (

	footwear_item_id    INT              NOT NULL AUTO_INCREMENT,
    shoe_type 			VARCHAR(40)  	 NOT NULL,
    size                float           NOT NULL,
	item_condition     	VARCHAR(40)  	 NOT NULL,
    style 				VARCHAR(30)		NOT NULL,
    initial_price		float 			 NOT NULL,
    brand 				VARCHAR(30)		 NOT NULL,
    title 				VARCHAR(75) 	NOT NULL,
    sold                tinyint,

PRIMARY KEY (footwear_item_id));
ALTER TABLE FOOTWEAR_ITEMS AUTO_INCREMENT=1000;

SELECT * FROM FOOTWEAR_ITEMS;

INSERT INTO FOOTWEAR_ITEMS (shoe_type,size,item_condition,style,initial_price,brand,title,sold)
VALUES      ('sneakers',9,'New','athletic',15.75,'Adidas','Adidas Men Sneakers',false),
			('sandals',8.5,'Slightly Used','casual',35.90,'Converse','Comfortable Running Sneakers',true),
            ('boots',6,'Slightly Used','casual',50.00,'Sperry','Funky Boots Perfect For Sledding',true),
			('boots',10.5,'New','fancy',51.35,'Doc Martens','Unique Vintage Tall Boots',false),
            ('sandals',5,'New','fancy',35.10,'Uggs','Colorful and Comfy Blue Sandals',true),
			('sneakers',6,'Very Used','athletic',100.00,'Reebok','Super Comfortable Sneakers for Everyday',false),
			('sneakers',6,'New','athletic',88.70,'Vans','Perfect Running Shoes for Women',false),
            ('boots',8,'New','fancy',60.00,'Hunter','Trendy Boots Perfect For Any Occasion',false),
            ('sandals',9,'Slightly Used','casual',50.50,'Converse','Barely Worn Beach Sandals For Teen Boys',false),
            ('sandals',5,'Very Used','casual',75.79,'Under Armour','Everyday Orange Sandals In Decent Shape',true),
            ('sneakers',6,'Slightly Used','casual',20.00,'Reebok','Reebok Retro Sneakers For Women',true);
            
CREATE TABLE ALERTS (
	alertID					int			NOT NULL AUTO_INCREMENT, 
	alert_message		Varchar(400)	Not NULL,
	footwear_item_id    	INT 	    NOT NULL,
    alert_username		varchar(20)  NOT NULL,
    

PRIMARY KEY (alertID), 
FOREIGN KEY (footwear_item_id) REFERENCES FOOTWEAR_ITEMS(footwear_item_id),
FOREIGN KEY (alert_username) REFERENCES USERS(username) );

INSERT INTO ALERTS
VALUES      (10,'You have won the auction!',1001,'amallick');

INSERT INTO ALERTS(alert_message, footwear_item_id, alert_username)
VALUES      ('Sorry, unfortunately another user has won the auction',1001,'kbrown');

Select * from alerts;

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

select * from auctions;

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

CREATE TABLE BIDS (
    bid_username 		    VARCHAR(20)  NOT NULL,
	bid_footwear_item_id    INT 	     NOT NULL,
    bid_amount			double			 Not Null,
	isAutomatic			int	         NOT NULL,
	upper_limit 		DOUBLE 		,
    bid_increment       DOUBLE      ,
    
PRIMARY KEY (bid_username, bid_amount),
FOREIGN KEY (bid_username) REFERENCES USERS(username), 
FOREIGN KEY (bid_footwear_item_id) REFERENCES FOOTWEAR_ITEMS(footwear_item_id));



INSERT INTO BIDS (bid_username, bid_footwear_item_id, bid_amount, isAutomatic)
VALUES      ('amallick', 1001, 37.00,0),
			('ntaylor', 1001,49.20 , 0),
            ('jsmith', 1005, 111.11 ,0),
			('amallick', 1004,40.50,0),
            ('twilliams', 1002,75.00, 0),
            ('dgarcia', 1009,83.20 ,0),
            ('dgarcia', 1001, 60.50,0);
            
select * from bids;


create table wishlist(
	wishlist_id 		 int     NOT NULL auto_increment,
	wishlistUser		varchar(20)	Not null,
	shoe_type 			VARCHAR(40)  	 NOT NULL,
    size                float           NOT NULL,
    brand 				VARCHAR(30)		 NOT NULL,
    primary key(wishlist_id),
    foreign key(wishlistUser) references Users(username));


CREATE TABLE WINNER (

    w_username 		    VARCHAR(20)   NOT NULL,
    w_amount            DOUBLE        NOT NULL,
    w_auction_id			INT 		  NOT NULL,
    w_footwear_id			INT 		NOT NULL,
    status_winner        INT,        

PRIMARY KEY (w_auction_id),
FOREIGN KEY(w_auction_id) REFERENCES AUCTIONS(auction_id),
FOREIGN KEY(w_footwear_id) REFERENCES footwear_items(footwear_item_id),
FOREIGN KEY(w_username) REFERENCES USERS(username) );

INSERT INTO WINNER(w_username,w_amount,w_auction_id,w_footwear_id,status_winner)
VALUES ('dgarcia','60.5','9880','1001','1'),
		('dgarcia','83.2','1005','1009','1'),
        ('amallick','40.50','8451','1004','1'),
        ('twilliams','75','9683','1002','1');

select * from winner;
