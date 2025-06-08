-- DataBase Management System Project
-- 
-- 23i-2630  
-- 23i-2578  [Leader]
-- 23i-2609

create database sem_proj;
use sem_proj;

CREATE TABLE User 
(
    UserID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    CNIC VARCHAR(20) NOT NULL,
    Phone VARCHAR(20),
    Participant_ID INT NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Role ENUM('Admin', 'Organizer', 'Participant', 'Sponsor', 'Judge') NOT NULL
);

CREATE TABLE Venue 
(
    Venue_ID INT PRIMARY KEY,
    Venue_Name VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL,
    Location VARCHAR(100),
    Availability_Status VARCHAR(50)
);

CREATE TABLE Event 
(
    EventID INT PRIMARY KEY,
    Event_Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    Reg_Fee DECIMAL(10,2) NOT NULL,
    Category ENUM('Tech', 'Business', 'Gaming', 'General') NOT NULL,
    Venue_ID INT NOT NULL,
    Organizer_ID INT NOT NULL,
    Max_Participants INT NOT NULL,
    FOREIGN KEY (Venue_ID) REFERENCES Venue(Venue_ID),
    FOREIGN KEY (Organizer_ID) REFERENCES User(UserID)
);

CREATE TABLE Team 
(
    Team_ID INT PRIMARY KEY,
    Team_Name VARCHAR(100) NOT NULL,
    Leader_ID INT NOT NULL,
    FOREIGN KEY (Leader_ID) REFERENCES User(UserID)
);

CREATE TABLE Registration 
(
    Registration_ID INT PRIMARY KEY,
    Participant_ID INT NOT NULL,
    Team_ID INT,
    Event_ID INT NOT NULL,
    Payment_Status VARCHAR(50),
    FOREIGN KEY (Participant_ID) REFERENCES User(UserID),
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID),
    FOREIGN KEY (Event_ID) REFERENCES Event(EventID)
);

CREATE TABLE Judge 
(
    Judge_ID INT PRIMARY KEY,
    Expertise_Area VARCHAR(100),
    Event_ID INT NOT NULL,
    FOREIGN KEY (Judge_ID) REFERENCES User(UserID),
    FOREIGN KEY (Event_ID) REFERENCES Event(EventID)
);

CREATE TABLE Score 
(
    Score_ID INT PRIMARY KEY,
    Score INT NOT NULL CHECK (Score >= 0 AND Score <= 100),
    Event_ID INT NOT NULL,
    Judge_ID INT NOT NULL,
    Participant_ID INT NOT NULL,
    FOREIGN KEY (Event_ID) REFERENCES Event(EventID),
    FOREIGN KEY (Judge_ID) REFERENCES Judge(Judge_ID),
    FOREIGN KEY (Participant_ID) REFERENCES User(UserID)
);

CREATE TABLE Leaderboard 
(
    Leaderboard_ID INT PRIMARY KEY,
    Ranks INT NOT NULL,
    Event_ID INT NOT NULL,
    Participant_ID INT NOT NULL,
    FOREIGN KEY (Event_ID) REFERENCES Event(EventID),
    FOREIGN KEY (Participant_ID) REFERENCES User(UserID)
);

CREATE TABLE Accommodation 
(
    Accommodation_ID INT PRIMARY KEY,
    Room_Number VARCHAR(20),
    Check_In_Date DATE NOT NULL,
    Check_Out_Date DATE NOT NULL,
    Participant_ID INT NOT NULL,
    Hotel_Name VARCHAR(100),
    Cost DECIMAL(10,2),
    FOREIGN KEY (Participant_ID) REFERENCES User(UserID)
);

CREATE TABLE Sponsorship 
(
    Sponsorship_ID INT PRIMARY KEY,
    Contract_Status VARCHAR(50),
    Amount DECIMAL(10,2) NOT NULL,
    Sponsor_ID INT NOT NULL,
    FOREIGN KEY (Sponsor_ID) REFERENCES User(UserID)
);

CREATE TABLE Sponsorship_Package 
(
    Package_Name VARCHAR(50) PRIMARY KEY,
    Sponsor_Type VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Report 
(
    Report_ID INT PRIMARY KEY,
    Content TEXT NOT NULL,
    Report_Type VARCHAR(50),
    Date_Generated DATE NOT NULL,
    Generated_By INT NOT NULL,
    FOREIGN KEY (Generated_By) REFERENCES User(UserID)
);

CREATE TABLE Payment 
(
    Payment_ID INT PRIMARY KEY,
    Amount DECIMAL(10,2) NOT NULL,
    Payment_Type ENUM('Online', 'Manual') NOT NULL,
    Transaction_Date DATE NOT NULL,
    User_ID INT NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES User(UserID)
);


select * from events;
