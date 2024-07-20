REM   Script: Session 04
REM   project

CREATE TABLE Apartment ( 
    Apt_ID INT PRIMARY KEY, 
    Address VARCHAR(100), 
    Bedrooms INT, 
    Bathrooms INT, 
    Sqft INT, 
    Rent DECIMAL(10, 2), 
    Available varchar(20) 
);

CREATE TABLE Tenant ( 
    Tenant_ID INT PRIMARY KEY, 
    Name VARCHAR(50), 
    Phone VARCHAR(15), 
    Email VARCHAR(50), 
    Apt_ID INT, 
    Lease_Start_Date DATE, 
    Lease_End_Date DATE, 
    FOREIGN KEY (Apt_ID) REFERENCES Apartment(Apt_ID) 
);

CREATE TABLE Payment ( 
    Payment_ID INT PRIMARY KEY, 
    Tenant_ID INT, 
    Apt_ID INT, 
    Amount DECIMAL(10, 2), 
    Pdate DATE, 
    FOREIGN KEY (Tenant_ID) REFERENCES Tenant(Tenant_ID), 
    FOREIGN KEY (Apt_ID) REFERENCES Apartment(Apt_ID) 
);

insert into Apartment  values (1,'A101',2,2,4.1,1500,'yes');

insert into Apartment  values (2,'A102',3,2,4.5,1500,'no');

insert into Apartment  values (3,'A103',4,3,5.0,1500,'yes');

insert into Tenant  values (4,'Manav','9874562565','manav5@gmail.com',3,'24-may-2000','24-may-2010');

insert into Tenant  values (5,'Sam','8874562565','Sam5@gmail.com',1,'4-may-2000','24-may-2011');

insert into Tenant  values (6,'anav','7874562565','anav5@gmail.com',2,'2-may-2000','24-may-2009');

insert into Payment values (7,4,3,500,'30-may-2000');

insert into Payment values (8,5,1,800,'24-may-2000');

insert into Payment values (9,6,2,700,'20-may-2000');

select * from Apartment;

select * from Tenant;

select * from Payment;

SELECT * FROM Apartment WHERE Available = 'yes';

SELECT * FROM Tenant WHERE Tenant_ID = 5;

SELECT * FROM Payment WHERE Tenant_ID = 6;

UPDATE Apartment SET Rent = 2000 WHERE Apt_ID = 3;

SELECT Tenant.Tenant_ID, Tenant.Name, Tenant.Phone, Tenant.Email, Apartment.Address, Apartment.Rent 
FROM Tenant 
JOIN Apartment ON Tenant.Apt_ID = Apartment.Apt_ID;

SELECT Tenant.Name, Apartment.Address, Payment.Amount, Payment.Date 
FROM Tenant 
JOIN Apartment ON Tenant.Apt_ID = Apartment.Apt_ID 
JOIN Payment ON Tenant.Tenant_ID = Payment.Tenant_ID;

SELECT Apartment.Address, Tenant.Name, Tenant.Phone, Tenant.Email 
FROM Apartment 
LEFT JOIN Tenant ON Apartment.Apt_ID = Tenant.Apt_ID 
WHERE Apartment.Available = 'yes';

SELECT Tenant.Name, Apartment.Address, Payment.Amount, Payment.Pdate 
FROM Tenant 
JOIN Apartment ON Tenant.Apt_ID = Apartment.Apt_ID 
JOIN Payment ON Tenant.Tenant_ID = Payment.Tenant_ID;

