create database Assertmanagement
go

use Assertmanagement
go

CREATE TABLE Employees (
    Employee_id INT PRIMARY KEY,
    Name VARCHAR(200),
    Department VARCHAR(100),
    Email VARCHAR(254),
    Password VARCHAR(200)
);

alter table Employees alter column Email varchar(254);

CREATE TABLE Assets (
    Asset_id INT PRIMARY KEY,
    Name VARCHAR(200),
    Type VARCHAR(200),
    Serial_number VARCHAR(100) UNIQUE NOT NULL,
    Purchase_date DATE,
    Location VARCHAR(200),
    Status VARCHAR(20) CHECK (status IN ('In use', 'Decommissioned', 'Under maintenance')),
    Owner_id INT,
    FOREIGN KEY (Owner_id) REFERENCES Employees(Employee_id)
);

CREATE TABLE Maintenance_Records (
    Maintenance_id INT PRIMARY KEY,
    Asset_id INT,
    Maintenance_date DATE,
    Description TEXT,
    Cost DECIMAL(10,2),
    FOREIGN KEY (Asset_id) REFERENCES Assets(Asset_id)
);

Create table Asset_Allocations (
    Allocation_id int primary key,
    Asset_id int NOT NULL,
    Employee_id INT NOT NULL,
    Allocation_date DATE NOT NULL,
    Return_date DATE DEFAULT NULL,
	FOREIGN KEY (Asset_id) REFERENCES Assets(Asset_id) ON DELETE CASCADE,
    FOREIGN KEY (Employee_id) REFERENCES employees(Employee_id) ON DELETE CASCADE
);

CREATE TABLE Reservations (
    Reservation_id INT PRIMARY KEY,
    Asset_id INT NOT NULL,
    Employee_id INT NOT NULL,
    Reservation_date DATE NOT NULL,
    Start_date DATE NOT NULL,
    End_date DATE NOT NULL,
	Status VARCHAR(20) NOT NULL DEFAULT 'Pending',
    CHECK (status IN ('Pending', 'Approved', 'Canceled')),
	FOREIGN KEY (Asset_id) REFERENCES Assets(Asset_id),
    FOREIGN KEY (Employee_id) REFERENCES Employees(Employee_id)
);

select * from Employees
select * from Assets
select * from Maintenance_Records
select * from Asset_Allocations
select * from Reservations
