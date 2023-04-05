--Creating the Employee Table
CREATE TABLE Employee(
--Columns for the Employee Table
	EmployeeID int identity,
	EmployeeFirstName varchar(30) not null,
	EmployeeLastName varchar(30) not null,
	EmployeePhoneNumber varchar(15) not null,
	EmployeeEmailAddress varchar(30) not null,
	EmployeeAddress varchar(30) not null,
	JobTitle varchar(20) not null,
	ManagerID int,
--Constraints on the Employee Table
CONSTRAINT PK_Employee PRIMARY KEY (EmployeeID),
CONSTRAINT U1_Employee UNIQUE (EmployeePhoneNumber),
CONSTRAINT U2_Employee UNIQUE (EmployeeEmailAddress)
)

--Creating the SupplyOrder Table
CREATE TABLE SupplyOrder(
--Columns for SupplyOrder Table
	SupplyOrderID int identity,
	CompanyName varchar(50) not null,
	DeliveryDate datetime not null,
	OrderDescription varchar(200) not null,
	SupplyPrice decimal not null,
	EmployeeID int not null,
--Constraints on the Supply Order Table
CONSTRAINT PK_SupplyOrder PRIMARY KEY (SupplyOrderID), 
CONSTRAINT FK_SupplyOrder FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
)

--Creating the Item Table 
CREATE TABLE Item(
--Columns for the Item Table
	ItemID int identity,
	Brand varchar(20) not null,
	SalesPrice int not null,
	Quantity int not null,
--Constraints on the Item Table
CONSTRAINT PK_Item PRIMARY KEY (ItemID)
)

--Creating the LaundromatCard Table
CREATE TABLE LaundromatCard(
--Columns for the LaundromatCard Table
	LaundromatCardID int,
	CardName varchar(50),
	CardPin int not null,
--Constraints on the LaundromatCard Table
CONSTRAINT PK_LaundromatCard PRIMARY KEY (LaundromatCardID),
CONSTRAINT U1_LaundromatCard UNIQUE (CardPin)
)

--Creating the Customer Table
CREATE TABLE Customer(
--Columns for the Customer Table
	CustomerID int,
	CustomerFirstName varchar(30),
	CustomerLastName varchar(30),
	CustomerAddress varchar(40),
	CustomerEmailAddress varchar(30),
	LaundromatCardID int
--Constraints on the Customer Table 
CONSTRAINT PK_Customer PRIMARY KEY (CustomerID)
CONSTRAINT FK_Customer FOREIGN KEY (LaundromatCardID) REFERENCES LaundromatCard(LaundromatCardID)
)

--Creating the SalesOrder Table
CREATE TABLE SalesOrder(
--Columns for the SalesOrder Table
	SalesOrderID int identity,
	ItemID int not null,
	EmployeeID int not null,
	CustomerID int,
--Constraints on the SalesOrder Table
CONSTRAINT PK_SalesOrder PRIMARY KEY (SalesOrderID),
CONSTRAINT FK1_SalesOrder FOREIGN KEY (ItemID) REFERENCES Item(ItemID),
CONSTRAINT FK2_SalesOrder FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
CONSTRAINT FK3_SalesOrder FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
)

--Creating the Washer Table
CREATE TABLE Washer(
--Columns for the Washer Table
	WasherID int identity,
	WasherSize varchar(30) not null,
	WasherPrice varchar(30) not null,
	Duration varchar(30) not null,
	LaundromatCardID int not null,
--Constraints on the Washer Table
CONSTRAINT PK_Washer PRIMARY KEY (WasherID),
CONSTRAINT FK1_Washer FOREIGN KEY (LaundromatCardID) REFERENCES LaundromatCard(LaundromatCardID) 
)

--Creating the Dryer Table
CREATE TABLE Dryer(
--Columns for the Dryer Table
	DryerID int identity,
	Size varchar(30) not null,
	PricePer10Minutes varchar(20) not null,
	LaundromatCardID int,
--Constraints on the Dryer Table
CONSTRAINT PK_Dryer PRIMARY KEY (DryerID),
CONSTRAINT FK1_Dryer FOREIGN KEY (LaundromatCardID) REFERENCES LaundromatCard(LaundromatCardID)
)

--Updating naming error
UPDATE 

--Creating ther DropOffService Table
CREATE TABLE DropOffService(
--Columns for the DropOffService Table
	ServiceID int identity,
	FirstName varchar(30) not null,
	LastName varchar(30) not null,
	PhoneNumber varchar(15) not null,
	Address varchar(40),
	LaundromatCardID int,
	ClothesWeight varchar(30) not null,
	ClothesPrice int not null,
	EmployeeID int not null,
--Constraints on the DropOffService Table
CONSTRAINT PK_DropOffService PRIMARY KEY (ServiceID),
CONSTRAINT FK1_DropOffService FOREIGN KEY (LaundromatCardID) REFERENCES LaundromatCard(LaundromatCardID),
CONSTRAINT FK2_DropOffService FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
CONSTRAINT U1_DropOffService UNIQUE (PhoneNumber) 
)

--Data Manipulation Language - Inserting Data 

--Insert Data for Employee Table
insert into Employee (EmployeeFirstName, EmployeeLastName, EmployeePhoneNumber, EmployeeEmailAddress, EmployeeAddress, JobTitle, ManagerID ) values ('Vivyanne', 'Hanhart', '400-563-4256', 'vhanhart0@sfgate.com', '37 Del Mar Plaza', 'Manager', 1);
insert into Employee (EmployeeFirstName, EmployeeLastName, EmployeePhoneNumber, EmployeeEmailAddress, EmployeeAddress, JobTitle) values ('Adair', 'Websdale', '814-174-0394', 'awebsdale1@forbes.com', '8692 Mendota Road', 'Assistant Manager');
insert into Employee (EmployeeFirstName, EmployeeLastName, EmployeePhoneNumber, EmployeeEmailAddress, EmployeeAddress, JobTitle) values ('Celestine', 'D''Aulby', '412-854-6755', 'cdaulby2@cmu.edu', '4 Melvin Lane', 'Assistant Manager');
insert into Employee (EmployeeFirstName, EmployeeLastName, EmployeePhoneNumber, EmployeeEmailAddress, EmployeeAddress, JobTitle) values ('Nerty', 'Killeen', '225-876-7827', 'nkilleen3@google.ru', '68 Comanche Way', 'Sales Associate');
insert into Employee (EmployeeFirstName, EmployeeLastName, EmployeePhoneNumber, EmployeeEmailAddress, EmployeeAddress, JobTitle) values ('Cary', 'MacGilfoyle', '652-880-0465', 'cmacgilfoyle4@cnbc.com', '056 Darwin Plaza', 'Sales Associate');

SELECT * FROM Employee

--Insert Data for SupplyOrder Table
insert into SupplyOrder (CompanyName, DeliveryDate, OrderDescription, SupplyPrice, EmployeeID) values ('Colgate-Palmolive', '8/4/2022', 'Medium sized order', 490.55, 1);
insert into SupplyOrder (CompanyName, DeliveryDate, OrderDescription, SupplyPrice, EmployeeID) values ('Protector & Gamble', '8/10/2022', 'Smaller than medium sized order', 341.43, 1);
insert into SupplyOrder (CompanyName, DeliveryDate, OrderDescription, SupplyPrice, EmployeeID) values ('Aura Detergent', '8/10/2022', 'Barrel of soap', 238.80, 1);
insert into SupplyOrder (CompanyName, DeliveryDate, OrderDescription, SupplyPrice, EmployeeID) values ('The Clorox Company', '8/16/2022', 'Please do not get this on colored clothes', 192.71, 2);
insert into SupplyOrder (CompanyName, DeliveryDate, OrderDescription, SupplyPrice, EmployeeID) values ('Protector & Gamble', '8/25/2022', 'Hey, us again!', 300.14, 2);

SELECT * FROM SupplyOrder

--Insert Data for Item Table
insert into Item (Brand, SalesPrice, Quantity) values ('Medium Red Tide', 11.00, 80);
insert into Item (Brand, SalesPrice, Quantity) values ('Medium Gain', 10.00 , 95);
insert into Item (Brand, SalesPrice, Quantity) values ('Small Suavitel Blue', 2.25, 9);
insert into Item (Brand, SalesPrice, Quantity) values ('Small Suavitel White', 2.25, 41);
insert into Item (Brand, SalesPrice, Quantity) values ('Small Clorox', 2.25, 81);
insert into Item (Brand, SalesPrice, Quantity) values ('Medium Clorox', 3.50, 58);
insert into Item (Brand, SalesPrice, Quantity) values ('Small Roma', 1.50, 11);
insert into Item (Brand, SalesPrice, Quantity) values ('Medium Roma', 3.00, 15);
insert into Item (Brand, SalesPrice, Quantity) values ('Large Aura', 10.00, 6);
insert into Item (Brand, SalesPrice, Quantity) values ('Shout Spray', 10.00, 1);

SELECT * FROM Item

--Insert Data for LaundromatCard Table
insert into LaundromatCard (LaundromatCardID, CardName, CardPin) values (916679463, 'cmagill0', 1204); 
insert into LaundromatCard (LaundromatCardID, CardName, CardPin) values (568424468, 'wmcginnell1', 4290);
insert into LaundromatCard (LaundromatCardID, CardName, CardPin) values (356331589, 'jrudman2', 8524);
insert into LaundromatCard (LaundromatCardID, CardName, CardPin) values (881872442, 'lwaddams3', 8031);
insert into LaundromatCard (LaundromatCardID, CardName, CardPin) values (160890131, 'jbonefant4', 1446);
insert into LaundromatCard (LaundromatCardID, CardName, CardPin) values (285754330, 'myakunchikov5', 8820);
insert into LaundromatCard (LaundromatCardID, CardName, CardPin) values (736784726, 'lcaress6', 9058);
insert into LaundromatCard (LaundromatCardID, CardName, CardPin) values (450588115, 'rgodain7', 9094);
insert into LaundromatCard (LaundromatCardID, CardName, CardPin) values (174372923, 'ekirkwood8', 3335);
insert into LaundromatCard (LaundromatCardID, CardName, CardPin) values (141613498, 'kpoll9', 4571);

SELECT * FROM LaundromatCard

--Insert Data for Customer Table
insert into Customer (CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerEmailAddress, LaundromatCardID) values (1, 'Debra', 'Place', '37 Erie Plaza', 'dplace0@usatoday.com', 916679463);
insert into Customer (CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerEmailAddress, LaundromatCardID) values (2, 'Lorianne', 'Frazer', '4485 Westridge Place', 'lfrazer1@flickr.com', 568424468);
insert into Customer (CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerEmailAddress, LaundromatCardID) values (3, 'Estel', 'Harrow', '5 Schiller Road', 'eharrow2@eepurl.com', 356331589);
insert into Customer (CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerEmailAddress, LaundromatCardID) values (4, 'Markus', 'Reddan', '6924 Marcy Street', 'mreddan3@baidu.com', 881872442);
insert into Customer (CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerEmailAddress, LaundromatCardID) values (5, 'Ronny', 'Cleal', '3 Schurz Center', 'rcleal4@latimes.com', 160890131);
insert into Customer (CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerEmailAddress) values (6, 'Ole', 'Byrde', '5 Loomis Crossing', 'obyrde5@imageshack.us');
insert into Customer (CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerEmailAddress) values (7, 'Jamil', 'Milton-White', '3012 Declaration Plaza', 'jmiltonwhite6@about.com');
insert into Customer (CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerEmailAddress) values (8, 'Bernelle', 'Priestner', '9 Thackeray Alley', 'bpriestner7@cam.ac.uk');
insert into Customer (CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerEmailAddress) values (9, 'Dierdre', 'Older', '55251 Hoffman Drive', 'dolder8@twitpic.com');
insert into Customer (CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerEmailAddress) values (10, 'Henderson', 'Chiswell', '87 Lighthouse Bay Drive', 'hchiswell9@salon.com');

SELECT * FROM Customer

--Insert Data for SalesOrder Table
insert into SalesOrder (ItemID, EmployeeID, CustomerID) values (1, 4, 1);
insert into SalesOrder (ItemID, EmployeeID, CustomerID) values (1, 4, 3);
insert into SalesOrder (ItemID, EmployeeID, CustomerID) values (3, 4, 4);
insert into SalesOrder (ItemID, EmployeeID, CustomerID) values (3, 4, 5);
insert into SalesOrder (ItemID, EmployeeID) values (5, 5);
insert into SalesOrder (ItemID, EmployeeID) values (9, 5);
insert into SalesOrder (ItemID, EmployeeID) values (8, 5);
insert into SalesOrder (ItemID, EmployeeID, CustomerID) values (10, 5, 7);
insert into SalesOrder (ItemID, EmployeeID) values (2, 1);
insert into SalesOrder (ItemID, EmployeeID, CustomerID) values (12, 2, 9);

SELECT * FROM SalesOrder

--Insert Data for Washer Table
insert into Washer (WasherSize, WasherPrice, Duration, LaundromatCardID) values ('Small', 3.00, 25, 141613498);
insert into Washer (WasherSize, WasherPrice, Duration, LaundromatCardID) values ('Small', 3.00, 25, 160890131);
insert into Washer (WasherSize, WasherPrice, Duration, LaundromatCardID) values ('Small', 3.00, 25, 160890131);
insert into Washer (WasherSize, WasherPrice, Duration, LaundromatCardID) values ('Medium', 5.50, 28, 141613498);
insert into Washer (WasherSize, WasherPrice, Duration, LaundromatCardID) values ('Medium', 5.50, 28, 285754330);
insert into Washer (WasherSize, WasherPrice, Duration, LaundromatCardID) values ('Medium', 5.50, 28, 285754330);
insert into Washer (WasherSize, WasherPrice, Duration, LaundromatCardID) values ('Large', 6.50, 30, 450588115);
insert into Washer (WasherSize, WasherPrice, Duration, LaundromatCardID) values ('Large', 6.50, 30, 736784726);
insert into Washer (WasherSize, WasherPrice, Duration, LaundromatCardID) values ('Extra Large', 10.00, 35, 881872442);
insert into Washer (WasherSize, WasherPrice, Duration, LaundromatCardID) values ('Extra Large', 10.00, 35, 916679463);

SELECT * FROM Washer

--Insert Data for Dryer Table
insert into Dryer (Size, PricePer10Minutes, LaundromatCardID) values ('Large', 0.25, 916679463);
insert into Dryer (Size, PricePer10Minutes, LaundromatCardID) values ('Large', 0.25, 916679463);
insert into Dryer (Size, PricePer10Minutes, LaundromatCardID) values ('Large', 0.25, 450588115);
insert into Dryer (Size, PricePer10Minutes, LaundromatCardID) values ('Large', 0.25, 450588115);
insert into Dryer (Size, PricePer10Minutes, LaundromatCardID) values ('Large', 0.25, 736784726);
insert into Dryer (Size, PricePer10Minutes, LaundromatCardID) values ('Large', 0.25, 141613498);
insert into Dryer (Size, PricePer10Minutes, LaundromatCardID) values ('Extra Large', 0.50, 141613498 );
insert into Dryer (Size, PricePer10Minutes, LaundromatCardID) values ('Extra Large', 0.50, 141613498);
insert into Dryer (Size, PricePer10Minutes, LaundromatCardID) values ('Extra Large', 0.50, 285754330);
insert into Dryer (Size, PricePer10Minutes, LaundromatCardID) values ('Extra Large', 0.50, 285754330);

SELECT * FROM Dryer

--Insert Data for DropOffService Table
insert into DropOffService (FirstName, LastName, PhoneNumber, Address, ClothesWeight, ClothesPrice, EmployeeID) values ('Marlee', 'Trenbey', '127-747-1690', '3323 Fieldstone Pass', 50, 50, 4);
insert into DropOffService (FirstName, LastName, PhoneNumber, Address, ClothesWeight, ClothesPrice, EmployeeID) values ('Forrest', 'Shardlow', '218-618-5833', '02824 Northport Court', 80, 80, 2);
insert into DropOffService (FirstName, LastName, PhoneNumber, Address, ClothesWeight, ClothesPrice, EmployeeID) values ('Blondelle', 'Mugg', '602-382-7755', '1 Northview Way', 93, 93, 3);
insert into DropOffService (FirstName, LastName, PhoneNumber, Address, ClothesWeight, ClothesPrice, EmployeeID) values ('Stanly', 'Crofthwaite', '860-502-7896', '8006 Heffernan Center', 62, 62, 1);
insert into DropOffService (FirstName, LastName, PhoneNumber, Address, ClothesWeight, ClothesPrice, EmployeeID) values ('Celka', 'Nassie', '803-959-7626', '443 Tennyson Lane', 57, 57, 1);
insert into DropOffService (FirstName, LastName, PhoneNumber, Address, ClothesWeight, ClothesPrice, EmployeeID) values ('Ossie', 'Cordoba', '309-935-9536', '70 Hudson Court', 100, 100, 3);
insert into DropOffService (FirstName, LastName, PhoneNumber, Address, LaundromatCardID, ClothesWeight, ClothesPrice, EmployeeID) values ('Evelyn', 'Nuttey', '445-341-5334', '9 Express Park',141613498, 28, 28, 2);

SELECT * FROM DropOffService

--Answering Data Questions

--How much do customers spend on an average wash/dry cycle?

--Convert Washer and dryer to number instead of string to do math
ALTER TABLE Washer
ALTER COLUMN WasherPrice decimal;

ALTER TABLE Dryer
ALTER COLUMN PricePer10Minutes decimal(20);

--Displaying washers used in given day, and which card made these purchases
SELECT 
	Washer.LaundromatCardID,
	Washer.WasherSize,
	Washer.WasherPrice
FROM Washer

SELECT SUM(WasherPrice) AS WasherTotalForDay
FROM Washer

--Dryer
--Displaying Dryers used in given day, and which card made these purchases
SELECT 
	Dryer.LaundromatCardID,
	Dryer.Size,
	Dryer.PricePer10Minutes
FROM Dryer

SELECT SUM(PricePer10Minutes) AS DryerTotalForDay
FROM Dryer

--Average weight of drop-off clothes 

--Displaying all of the Drop-Offs we have on record and which employee did the service
SELECT
	DropOffService.FirstName,
	DropOffService.LastName,
	DropOffService.ClothesWeight,
	DropOffService.ClothesPrice,
	Employee.EmployeeID
FROM DropOffService
JOIN Employee ON DropOffService.EmployeeID = Employee.EmployeeID

--Convert Clothes Weight to number instead of string to do math
ALTER TABLE DropOffService
ALTER COLUMN ClothesWeight INT;

SELECT AVG(ClothesWeight) AS AverageOfClothesWeight
FROM DropOffService

--Which Employee sells the most items?

--Displaying all transactions on record
SELECT 
	SalesOrder.EmployeeID,
	Employee.EmployeeFirstName,
	Employee.EmployeeLastName,
	SalesOrder.ItemID,
	SalesOrder.CustomerID
FROM SalesOrder
JOIN Employee ON SalesOrder.EmployeeID = Employee.EmployeeID

--Who sells the most?
SELECT EmployeeID, COUNT(*) AS TotalEmployeeTransactions
FROM SalesOrder
GROUP BY EmployeeID
ORDER BY TotalEmployeeTransactions DESC

--Inventory of Items
SELECT
	Item.Brand,
	Item.Quantity
FROM Item

--What do we prioritize? 
SELECT
	Item.Brand,
	Item.Quantity
FROM Item
ORDER BY Quantity 

--Find specific brands
SELECT
	Item.Brand,
	Item.Quantity
FROM 
	Item
WHERE
	Item.Brand LIKE '%Suavitel%'

--Update an employees Job Title 
CREATE PROCEDURE UpdateTitle(@EmployeeFirstName varchar(30), @NewJobTitle varchar(20))
AS
BEGIN
	UPDATE Employee SET JobTitle = @NewJobTitle
	WHERE EmployeeFirstName = @EmployeeFirstName
END
GO

EXEC UpdateTitle 'Vivyanne', 'Owner'

SELECT * FROM Employee WHERE EmployeeFirstName = 'Vivyanne'