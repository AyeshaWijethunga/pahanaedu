<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Main - Pahanaedu Bookshop</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <header class="main-header">
        <div class="header-content">
            <div class="logo">
                <i class="fas fa-book"></i>
                <span>Pahanaedu Bookshop</span>
            </div>
            <div class="user-actions">
                <span class="username">Welcome,</span>
                <button class="logout-btn" onclick="location.href='login.jsp'">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </button>
            </div>
        </div>
    </header>

    <main class="main-content">
        <h1>Dashboard</h1>
        <div class="card-container">
            <div class="card" onclick="location.href='startOrder.jsp'">
                <i class="fas fa-shopping-cart"></i>
                <h3>Start Order</h3>
                <p>Create a new customer order</p>
            </div>
            <div class="card" onclick="location.href='manageCustomer.jsp'">
                <i class="fas fa-users"></i>
                <h3>Manage Customers</h3>
                <p>View and edit customer details</p>
            </div>
            <div class="card" onclick="location.href='addItem.jsp'">
                <i class="fas fa-plus-circle"></i>
                <h3>Add Item</h3>
                <p>Add new items to inventory</p>
            </div>
            <div class="card" onclick="location.href='orderHistory.jsp'">
                <i class="fas fa-history"></i>
                <h3>Order History</h3>
                <p>View past transactions</p>
            </div>
            <div class="card" onclick="location.href='help.jsp'">
                <i class="fas fa-question-circle"></i>
                <h3>Help</h3>
                <p>Get support and guidance</p>
            </div>
        </div>
    </main>
</body>
</html>