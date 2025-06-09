-- DataBase Management System Project
-- 
-- 23i-2630  
-- 23i-2578  [Leader]
-- 23i-2609

create database sem_proj;
use sem_proj;

CREATE TABLE User 
(
    UserID INT PRIMARY KEY auto_increment,
    Name VARCHAR(100) NOT NULL,
    CNIC VARCHAR(20) NOT NULL,
    Phone VARCHAR(20),
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Role ENUM('Admin', 'Organizer', 'Participant', 'Sponsor', 'Judge') NOT NULL
);

CREATE TABLE Participant 
(
    Participant_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    CNIC VARCHAR(20) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(100) UNIQUE NOT NULL,
    Event_ID INT NOT NULL,
    Category ENUM('Tech', 'Business', 'Gaming', 'General') NOT NULL,
    FOREIGN KEY (Event_ID) REFERENCES Event(EventID)
);



CREATE TABLE Venue 
(
    Venue_ID INT PRIMARY KEY auto_increment,
    Venue_Name VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL,
    Location VARCHAR(100),
    Availability_Status VARCHAR(50)
);

CREATE TABLE Event 
(
    EventID INT PRIMARY KEY auto_increment,
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
    Team_ID INT PRIMARY KEY auto_increment,
    Team_Name VARCHAR(100) NOT NULL,
    Leader_ID INT NOT NULL,
    FOREIGN KEY (Leader_ID) REFERENCES User(UserID)
);

CREATE TABLE Registration 
(
    Registration_ID INT PRIMARY KEY auto_increment,
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
    Judge_ID INT PRIMARY KEY auto_increment,
    Expertise_Area VARCHAR(100),
    Event_ID INT NOT NULL,
    FOREIGN KEY (Judge_ID) REFERENCES User(UserID),
    FOREIGN KEY (Event_ID) REFERENCES Event(EventID)
);


CREATE TABLE Score 
(
    Score_ID INT PRIMARY KEY auto_increment,
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
    Leaderboard_ID INT PRIMARY KEY auto_increment,
    Ranks INT NOT NULL,
    Event_ID INT NOT NULL,
    Participant_ID INT NOT NULL,
    FOREIGN KEY (Event_ID) REFERENCES Event(EventID),
    FOREIGN KEY (Participant_ID) REFERENCES User(UserID)
);

CREATE TABLE Accommodation 
(
    Accommodation_ID INT PRIMARY KEY auto_increment,
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
    Sponsorship_ID INT PRIMARY KEY auto_increment,
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
    Report_ID INT PRIMARY KEY auto_increment,
    Content TEXT NOT NULL,
    Report_Type VARCHAR(50),
    Date_Generated DATE NOT NULL,
    Generated_By INT NOT NULL,
    FOREIGN KEY (Generated_By) REFERENCES User(UserID)
);

CREATE TABLE Payment 
(
    Payment_ID INT PRIMARY KEY auto_increment,
    Amount DECIMAL(10,2) NOT NULL,
    Payment_Type ENUM('Online', 'Manual') NOT NULL,
    Transaction_Date DATE NOT NULL,
    User_ID INT NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES User(UserID)
);






-- USERS
INSERT INTO User (UserID, Name, CNIC, Phone, Password, Email, Role) VALUES
(1001, 'Admin A', '11111-1111111-1', '03000000001', 'adminpass', 'adminA@email.com', 'Admin'),
(1002, 'Organizer B', '22222-2222222-2', '03000000002', 'orgpass', 'organizerB@email.com', 'Organizer'),
(1003, 'Organizer C', '33333-3333333-3', '03000000003', 'orgCpass', 'organizerC@email.com', 'Organizer'),
(2001, 'Judge A', '44444-4444444-4', '03000000004', 'judgeApass', 'judgeA@email.com', 'Judge'),
(2002, 'Judge B', '55555-5555555-5', '03000000005', 'judgeBpass', 'judgeB@email.com', 'Judge'),
(3001, 'Participant 1', '66666-6666666-6', '03000000006', 'part1pass', 'participant1@email.com', 'Participant'),
(3002, 'Participant 2', '77777-7777777-7', '03000000007', 'part2pass', 'participant2@email.com', 'Participant'),
(3003, 'Participant 3', '88888-8888888-8', '03000000008', 'part3pass', 'participant3@email.com', 'Participant'),
(3004, 'Participant 4', '99999-9999999-9', '03000000009', 'part4pass', 'participant4@email.com', 'Participant'),
(4001, 'Sponsor X', '10101-1010101-1', '03000000010', 'sponpass', 'sponsorX@email.com', 'Sponsor');

-- VENUE
INSERT INTO Venue (Venue_ID, Venue_Name, Capacity, Location, Availability_Status) VALUES
(501, 'Auditorium A', 300, 'Block A', 'Available'),
(502, 'Hall B', 200, 'Block B', 'Available');

-- EVENT
INSERT INTO Event (EventID, Event_Name, Description, Date, Time, Reg_Fee, Category, Venue_ID, Organizer_ID, Max_Participants) VALUES
(601, 'Coding Marathon', 'A 24-hour coding challenge.', '2025-06-15', '10:00:00', 1500.00, 'Tech', 501, 1002, 50),
(602, 'Startup Pitch', 'Pitch your startup idea.', '2025-06-16', '12:00:00', 2000.00, 'Business', 502, 1003, 30);

-- JUDGE
INSERT INTO Judge (Judge_ID, Expertise_Area, Event_ID) VALUES
(2001, 'Machine Learning', 601),
(2002, 'Entrepreneurship', 602);

-- TEAM
INSERT INTO Team (Team_ID, Team_Name, Leader_ID) VALUES
(701, 'Code Crushers', 3001),
(702, 'Innovators', 3003);

-- REGISTRATION
INSERT INTO Registration (Registration_ID, Participant_ID, Team_ID, Event_ID, Payment_Status) VALUES
(801, 3001, 701, 601, 'Paid'),
(802, 3002, 701, 601, 'Unpaid'),
(803, 3003, 702, 602, 'Paid'),
(804, 3004, 702, 602, 'Unpaid');

-- SCORE
INSERT INTO Score (Score, Event_ID, Judge_ID, Participant_ID) VALUES
(88, 601, 2001, 3001),
(75, 601, 2001, 3002),
(92, 602, 2002, 3003),
(67, 602, 2002, 3004);

-- LEADERBOARD
INSERT INTO Leaderboard (Leaderboard_ID, Ranks, Event_ID, Participant_ID) VALUES
(901, 1, 601, 3001),
(902, 2, 601, 3002),
(903, 1, 602, 3003),
(904, 2, 602, 3004);

-- ACCOMMODATION
INSERT INTO Accommodation (Accommodation_ID, Room_Number, Check_In_Date, Check_Out_Date, Participant_ID, Hotel_Name, Cost) VALUES
(1001, '101A', '2025-06-14', '2025-06-17', 3001, 'EventInn', 12000.00),
(1002, '102B', '2025-06-14', '2025-06-17', 3003, 'StayEasy', 10000.00);

-- SPONSORSHIP
INSERT INTO Sponsorship (Sponsorship_ID, Contract_Status, Amount, Sponsor_ID) VALUES
(1101, 'Confirmed', 500000.00, 4001);

-- SPONSORSHIP PACKAGE
INSERT INTO Sponsorship_Package (Package_Name, Sponsor_Type, Price) VALUES
('Gold', 'Platinum Sponsor', 1000000.00),
('Silver', 'Standard Sponsor', 500000.00);

-- REPORT
INSERT INTO Report (Report_ID, Content, Report_Type, Date_Generated, Generated_By) VALUES
(1201, 'Event summary generated after Coding Marathon.', 'Event Summary', '2025-06-17', 1001);

-- PAYMENT
INSERT INTO Payment (Payment_ID, Amount, Payment_Type, Transaction_Date, User_ID) VALUES
(1301, 1500.00, 'Online', '2025-06-15', 3001),
(1302, 2000.00, 'Manual', '2025-06-16', 3003);


-- PARTICIPANT
INSERT INTO Participant (Name, CNIC, Phone, Email, Event_ID, Category)
VALUES 
('Ali Khan', '12345-1234567-1', '03001234567', 'ali@email.com', 601, 'Tech'),
('Sara Ahmed', '35202-1234567-8', '03011223344', 'sara.ahmed@email.com', 601, 'Tech'),
('Usman Tariq', '37406-9876543-2', '03019876543', 'usman.tariq@email.com', 602, 'Business'),
('Hania Zafar', '42101-1122334-5', '03101234567', 'hania.zafar@email.com', 601, 'Tech'),
('Bilal Khan', '61101-5566778-1', '03212345678', 'bilal.khan@email.com', 602, 'Business'),
('Areeba Imran', '32103-9988776-3', '03334567890', 'areeba.imran@email.com', 601, 'Tech'),
('Danish Qureshi', '54400-3344556-7', '03456789012', 'danish.q@email.com', 602, 'Business'),
('Mehwish Raza', '37405-7654321-9', '03123456789', 'mehwish.raza@email.com', 601, 'Tech'),
('Zaid Ali', '42301-6677889-6', '03098765432', 'zaid.ali@email.com', 602, 'Business');



select * from payment;

select * from score;

select * from event;


select * from report;

select * from participant;

select * from Registration;

select * from sponsorship;


select * from user;

select * from participant;
