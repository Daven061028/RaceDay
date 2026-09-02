CREATE DATABASE RaceDay;
GO

USE RaceDay;
GO


-- USERS TABLE


CREATE TABLE Users
(
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    Role NVARCHAR(20) NOT NULL,
    PhoneNumber NVARCHAR(20),
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT CK_Users_Role
    CHECK (Role IN ('Organiser', 'Participant'))
);


-- ORGANISERS TABLE


CREATE TABLE Organisers
(
    OrganiserID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL UNIQUE,
    OrganisationName NVARCHAR(100) NOT NULL,
    ContactEmail NVARCHAR(100) NOT NULL,
    ContactNumber NVARCHAR(20) NOT NULL,

    CONSTRAINT FK_Organisers_Users
    FOREIGN KEY (UserID)
    REFERENCES Users(UserID)
);


-- PARTICIPANTS TABLE


CREATE TABLE Participants
(
    ParticipantID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL UNIQUE,
    DateOfBirth DATE NOT NULL,
    EmergencyContact NVARCHAR(100) NOT NULL,

    CONSTRAINT FK_Participants_Users
    FOREIGN KEY (UserID)
    REFERENCES Users(UserID)
);


-- EVENTS TABLE


CREATE TABLE Events
(
    EventID INT IDENTITY(1,1) PRIMARY KEY,
    OrganiserID INT NOT NULL,
    EventName NVARCHAR(150) NOT NULL,
    EventDate DATE NOT NULL,
    Location NVARCHAR(200) NOT NULL,
    Description NVARCHAR(500),
    Status NVARCHAR(20) NOT NULL DEFAULT 'Upcoming',

    CONSTRAINT FK_Events_Organisers
    FOREIGN KEY (OrganiserID)
    REFERENCES Organisers(OrganiserID),

    CONSTRAINT CK_Events_Status
    CHECK (Status IN ('Upcoming', 'Active', 'Completed'))
);


-- CATEGORIES TABLE


CREATE TABLE Categories
(
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    EventID INT NOT NULL,
    CategoryName NVARCHAR(100) NOT NULL,
    DistanceKM DECIMAL(5,2) NOT NULL,
    EntryFee DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_Categories_Events
    FOREIGN KEY (EventID)
    REFERENCES Events(EventID),

    CONSTRAINT CK_Categories_Distance
    CHECK (DistanceKM > 0),

    CONSTRAINT CK_Categories_EntryFee
    CHECK (EntryFee >= 0)
);


-- ENROLMENTS TABLE


CREATE TABLE Enrolments
(
    EnrolmentID INT IDENTITY(1,1) PRIMARY KEY,
    ParticipantID INT NOT NULL,
    CategoryID INT NOT NULL,
    EnrolmentDate DATETIME NOT NULL DEFAULT GETDATE(),
    RaceNumber INT,
    PaymentStatus NVARCHAR(20) NOT NULL DEFAULT 'Pending',

    CONSTRAINT FK_Enrolments_Participants
    FOREIGN KEY (ParticipantID)
    REFERENCES Participants(ParticipantID),

    CONSTRAINT FK_Enrolments_Categories
    FOREIGN KEY (CategoryID)
    REFERENCES Categories(CategoryID),

    CONSTRAINT UQ_Enrolments_Participant_Category
    UNIQUE (ParticipantID, CategoryID),

    CONSTRAINT CK_Enrolments_PaymentStatus
    CHECK (PaymentStatus IN ('Paid', 'Pending'))
);


-- RESULTS TABLE


CREATE TABLE Results
(
    ResultID INT IDENTITY(1,1) PRIMARY KEY,
    EnrolmentID INT NOT NULL UNIQUE,
    FinishTime TIME,
    Position INT,
    ResultStatus NVARCHAR(20) NOT NULL,

    CONSTRAINT FK_Results_Enrolments
    FOREIGN KEY (EnrolmentID)
    REFERENCES Enrolments(EnrolmentID),

    CONSTRAINT CK_Results_Position
    CHECK (Position IS NULL OR Position > 0),

    CONSTRAINT CK_Results_Status
    CHECK (ResultStatus IN ('Finished', 'DNF', 'DNS'))
);


-- SAMPLE USERS


INSERT INTO Users
(FirstName, LastName, Email, PasswordHash, Role, PhoneNumber)
VALUES
('Thabo', 'Mokoena', 'thabo@raceday.co.za',
 'Password123!', 'Organiser', '0821112233'),

('Lerato', 'Molefe', 'lerato@raceday.co.za',
 'Password123!', 'Organiser', '0832223344'),

('Sipho', 'Nkosi', 'sipho@gmail.com',
 'Password123!', 'Participant', '0843334455'),

('Naledi', 'Mahlangu', 'naledi@gmail.com',
 'Password123!', 'Participant', '0854445566');

 
-- SAMPLE ORGANISERS


INSERT INTO Organisers
(UserID, OrganisationName, ContactEmail, ContactNumber)
VALUES
(1, 'Johannesburg Road Runners',
 'info@jrr.co.za', '0821112233'),

(2, 'Gauteng Cycling Events',
 'info@gce.co.za', '0832223344');


-- SAMPLE PARTICIPANTS


INSERT INTO Participants
(UserID, DateOfBirth, EmergencyContact)
VALUES
(3, '2005-06-15', 'Mary Nkosi - 0825556677'),

(4, '2006-03-20', 'John Mahlangu - 0836667788');


-- SAMPLE EVENTS

INSERT INTO Events
(OrganiserID, EventName, EventDate, Location, Description, Status)
VALUES
(1, 'Johannesburg City Run', '2026-10-10',
 'Johannesburg', 'Annual road running event.', 'Upcoming'),

(1, 'Soweto Community Marathon', '2026-11-15',
 'Soweto', 'Community marathon supporting local charities.', 'Upcoming'),

(2, 'Gauteng Cycle Challenge', '2026-12-05',
 'Pretoria', 'Road cycling challenge for amateur cyclists.', 'Upcoming');

 
-- SAMPLE CATEGORIES


INSERT INTO Categories
(EventID, CategoryName, DistanceKM, EntryFee)
VALUES
(1, '5 KM Fun Run', 5.00, 100.00),
(1, '10 KM Run', 10.00, 150.00),
(2, '21 KM Half Marathon', 21.10, 250.00),
(2, '42 KM Marathon', 42.20, 350.00),
(3, '50 KM Cycle', 50.00, 300.00),
(3, '100 KM Cycle', 100.00, 450.00);


-- SAMPLE ENROLMENTS
 

INSERT INTO Enrolments
(ParticipantID, CategoryID, RaceNumber, PaymentStatus)
VALUES
(1, 1, 101, 'Paid'),
(1, 3, 102, 'Paid'),
(2, 2, 103, 'Pending'),
(2, 5, 104, 'Paid');


-- SAMPLE RESULTS


INSERT INTO Results
(EnrolmentID, FinishTime, Position, ResultStatus)
VALUES
(1, '00:32:15', 25, 'Finished'),
(2, '01:45:30', 42, 'Finished');