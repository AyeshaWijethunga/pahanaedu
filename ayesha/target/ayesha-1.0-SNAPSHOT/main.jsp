<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Main - Pahanaedu Bookshop</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h1>Welcome to Pahanaedu Bookshop</h1>
    <div class="card-container">
        <div class="card" onclick="location.href='addCustomer.jsp'">Add Customer</div>
        <div class="card" onclick="location.href='manageCustomer.jsp'">Manage Customers</div>
        <div class="card" onclick="location.href='addItem.jsp'">Add Item</div>
        <div class="card" onclick="location.href='viewItems.jsp'">View Items</div>
        <div class="card" onclick="location.href='orderHistory.jsp'">Order History</div>
        <div class="card" onclick="location.href='help.jsp'">Help</div>
        <div class="card" onclick="location.href='startOrder.jsp'">Start Order</div>
    </div>
</body>
</html>