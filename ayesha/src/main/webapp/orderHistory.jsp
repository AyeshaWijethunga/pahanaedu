<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order History</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>Order History</h2>
    <div class="filter-section">
        <form id="filterForm">
            <input type="text" id="customerSearch" placeholder="Search by customer name">
            <input type="date" id="fromDate">
            <input type="date" id="toDate">
            <button type="submit">Filter</button>
        </form>
    </div>
    <div class="list-section">
        <table id="orderTable">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer</th>
                    <th>Contact</th>
                    <th>Date/Time</th>
                    <th>Items</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Orders will render here -->
            </tbody>
        </table>
    </div>
    <script src="js/orderHistory.js"></script>
</body>
</html>