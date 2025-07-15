
CREATE DATABASE IF NOT EXISTS AirlineDB;
USE AirlineDB;



CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE Flights (
    FlightID INT AUTO_INCREMENT PRIMARY KEY,
    FlightNumber VARCHAR(20),
    Origin VARCHAR(50),
    Destination VARCHAR(50),
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    TotalSeats INT
);

CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    FlightID INT,
    BookingTime DATETIME DEFAULT NOW(),
    Status ENUM('Booked', 'Cancelled') DEFAULT 'Booked',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

CREATE TABLE Seats (
    SeatID INT AUTO_INCREMENT PRIMARY KEY,
    FlightID INT,
    SeatNumber VARCHAR(5),
    IsBooked BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);


INSERT INTO Customers (Name, Email, Phone) VALUES
('John Doe', 'john@example.com', '9998887777'),
('Alice Smith', 'alice@example.com', '8887776666');

INSERT INTO Flights (FlightNumber, Origin, Destination, DepartureTime, ArrivalTime, TotalSeats) VALUES
('AI101', 'Chennai', 'Delhi', '2025-07-20 10:00:00', '2025-07-20 12:30:00', 5);


INSERT INTO Seats (FlightID, SeatNumber)
SELECT 1, CONCAT('A', n) FROM (
    SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
) AS nums;


INSERT INTO Bookings (CustomerID, FlightID) VALUES (1, 1);
UPDATE Seats SET IsBooked = TRUE WHERE FlightID = 1 AND SeatNumber = 'A1';


SELECT SeatNumber FROM Seats WHERE FlightID = 1 AND IsBooked = FALSE;

SELECT * FROM Flights WHERE Origin = 'Chennai' AND Destination = 'Delhi';


DELIMITER //
CREATE TRIGGER Cancel_Booking AFTER UPDATE ON Bookings
FOR EACH ROW
BEGIN
    IF NEW.Status = 'Cancelled' THEN
        UPDATE Seats SET IsBooked = FALSE
        WHERE FlightID = NEW.FlightID
        AND SeatID = (
            SELECT SeatID FROM Seats WHERE FlightID = NEW.FlightID AND IsBooked = TRUE LIMIT 1
        );
    END IF;
END;//
DELIMITER ;

SELECT b.BookingID, c.Name, f.FlightNumber, b.Status, b.BookingTime
FROM Bookings b
JOIN Customers c ON b.CustomerID = c.CustomerID
JOIN Flights f ON b.FlightID = f.FlightID;