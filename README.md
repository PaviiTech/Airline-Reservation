<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Airline Reservation System - SQL Project</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 30px;
      background: #f7f9fc;
      color: #333;
      line-height: 1.6;
    }
    h1, h2, h3 {
      color: #0f62fe;
    }
    code {
      background: #eef1f5;
      padding: 2px 6px;
      border-radius: 5px;
      font-family: Consolas, monospace;
    }
    pre {
      background: #eef1f5;
      padding: 15px;
      border-radius: 5px;
      overflow-x: auto;
    }
    table {
      border-collapse: collapse;
      width: 100%;
      margin-bottom: 20px;
    }
    table, th, td {
      border: 1px solid #ccc;
    }
    th, td {
      padding: 10px;
      text-align: left;
    }
    .tag {
      display: inline-block;
      background: #d0ebff;
      color: #0c5460;
      padding: 4px 10px;
      margin: 2px;
      border-radius: 6px;
      font-size: 0.85em;
    }
  </style>
</head>
<body>

  <h1>✈️ Airline Reservation System – MySQL Project</h1>
  <p><em>A complete backend SQL system to manage <strong>flights</strong>, <strong>customers</strong>, <strong>bookings</strong>, and <strong>seats</strong> – perfect for demonstrating your database skills in interviews and portfolio projects!</em></p>

  <h2>🚀 Objective</h2>
  <ul>
    <li>Store and manage <strong>flight schedules</strong></li>
    <li>Track <strong>customers</strong> and <strong>bookings</strong></li>
    <li>Check <strong>seat availability</strong></li>
    <li>Handle <strong>cancellations with triggers</strong></li>
    <li>Generate <strong>booking reports</strong></li>
  </ul>

  <h2>🛠️ Tools & Technologies</h2>
  <span class="tag">MySQL Workbench</span>
  <span class="tag">SQL (DDL & DML)</span>
  <span class="tag">Triggers</span>
  <span class="tag">Views</span>

  <h2>🧱 Database Schema Overview</h2>
  <table>
    <tr><th>Table</th><th>Purpose</th></tr>
    <tr><td>Customers</td><td>Stores user information</td></tr>
    <tr><td>Flights</td><td>Holds flight schedule and capacity</td></tr>
    <tr><td>Bookings</td><td>Records customer bookings</td></tr>
    <tr><td>Seats</td><td>Tracks seat numbers and availability</td></tr>
  </table>

  <h3>🧩 Relationships</h3>
  <ul>
    <li><code>Bookings</code> references <code>Customers</code> and <code>Flights</code></li>
    <li><code>Seats</code> references <code>Flights</code></li>
  </ul>

  <h2>📦 Sample Data</h2>
  <ul>
    <li>✔️ 2 Customers (<code>John Doe</code>, <code>Alice Smith</code>)</li>
    <li>✔️ 1 Flight (<code>AI101</code> Chennai → Delhi)</li>
    <li>✔️ 5 Auto-generated seats</li>
    <li>✔️ 1 Booking with auto seat block (<code>A1</code>)</li>
  </ul>

  <h2>📌 How to Use</h2>

  <h3>1️⃣ Create & Use Database</h3>
  <pre><code>CREATE DATABASE AirlineDB;
USE AirlineDB;</code></pre>

  <h3>2️⃣ Paste SQL Code</h3>
  <p>Copy the full SQL script into MySQL Workbench and execute it step-by-step or all at once.</p>

  <h2>🔍 Sample SQL Queries</h2>

  <h3>🔹 Available Seats for a Flight</h3>
  <pre><code>SELECT SeatNumber FROM Seats WHERE FlightID = 1 AND IsBooked = FALSE;</code></pre>

  <h3>🔹 Search Flights by Route</h3>
  <pre><code>SELECT * FROM Flights WHERE Origin = 'Chennai' AND Destination = 'Delhi';</code></pre>

  <h3>🔹 Booking Summary Report</h3>
  <pre><code>
SELECT b.BookingID, c.Name, f.FlightNumber, b.Status, b.BookingTime
FROM Bookings b
JOIN Customers c ON b.CustomerID = c.CustomerID
JOIN Flights f ON b.FlightID = f.FlightID;
</code></pre>

  <p>💡 <strong>Tip:</strong> Use <code>SELECT * FROM Bookings;</code> or <code>SELECT * FROM Seats;</code> to monitor changes as you test triggers and bookings.</p>

</body>
</html>
