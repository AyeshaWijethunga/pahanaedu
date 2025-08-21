<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Start Order - Pahanaedu Bookshop</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* Header Styles */
        .main-header {
            background-color: #FFF1D5;
            padding: 1rem 2rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
            cursor: pointer;
        }

        .logo i {
            color: #9FB3DF;
        }

        .user-actions {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        /* Main Content Styles */
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        .page-title {
            text-align: center;
            color: #333;
            margin-bottom: 2rem;
            font-size: 2.2rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 1rem;
        }

        .page-title i {
            color: #9EC6F3;
        }

        /* Search and Cart Section */
        .search-section {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            align-items: center;
            justify-content: center;
        }

        .search-container {
            position: relative;
            flex: 1;
            max-width: 500px;
        }

        .search-container i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #9FB3DF;
        }

        #searchInput {
            width: 100%;
            padding: 1rem 1rem 1rem 2.5rem;
            border: none;
            border-radius: 25px;
            background: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            font-size: 1rem;
        }

        .cart-btn {
            background: #9EC6F3;
            color: white;
            border: none;
            padding: 1rem 2rem;
            border-radius: 25px;
            cursor: pointer;
            font-size: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s;
        }

        .cart-btn:hover {
            background: #8BB4E1;
            transform: translateY(-2px);
        }

        /* Table Styles */
        .list-section {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        #itemTable {
            width: 100%;
            border-collapse: collapse;
        }

        #itemTable th {
            background: #9FB3DF;
            color: white;
            padding: 1rem;
            text-align: left;
        }

        #itemTable td {
            padding: 1rem;
            border-bottom: 1px solid #BDDDE4;
        }

        #itemTable tr:hover {
            background: rgba(159, 179, 223, 0.1);
        }

        .add-to-cart-btn {
            background: #9EC6F3;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s;
        }

        .add-to-cart-btn:hover {
            background: #8BB4E1;
            transform: translateY(-2px);
        }

        /* Popup Styles */
        .popup {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(5px);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .popup-content {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            min-width: 400px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        }

        .popup-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid #9EC6F3;
        }

        .popup-title {
            font-size: 1.5rem;
            color: #333;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .popup-form-group {
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
        }

        .popup-label {
            width: 120px;
            color: #666;
        }

        .popup-value {
            font-weight: bold;
            color: #333;
        }

        .popup-input {
            padding: 0.5rem;
            border: 1px solid #BDDDE4;
            border-radius: 5px;
            width: 100px;
        }

        .popup-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .popup-submit-btn, .popup-cancel-btn {
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s;
        }

        .popup-submit-btn {
            background: #9EC6F3;
            color: white;
        }

        .popup-cancel-btn {
            background: #FFF1D5;
            color: #333;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .search-section {
                flex-direction: column;
            }

            .popup-content {
                margin: 1rem;
                min-width: auto;
                width: 90%;
            }

            .header-content {
                flex-direction: column;
                gap: 1rem;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="main-header">
        <div class="header-content">
            <div class="logo" onclick="location.href='main.jsp'">
                <i class="fas fa-book"></i>
                <span>Pahanaedu Bookshop</span>
            </div>
            <div class="user-actions">
                <span class="username">Welcome, <%= session.getAttribute("username") %></span>
                <div class="datetime">
                    <i class="far fa-clock"></i>
                    <%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()) %>
                </div>
            </div>
        </div>
    </header>

    <div class="container">
        <h1 class="page-title">
            <i class="fas fa-shopping-cart"></i>
            Start Order
        </h1>

        <div class="search-section">
            <div class="search-container">
                <i class="fas fa-search"></i>
                <input type="text" id="searchInput" placeholder="Search by item name">
            </div>
            <button class="cart-btn" onclick="redirectToCart()">
                <i class="fas fa-shopping-cart"></i>
                View Cart
            </button>
        </div>

        <div class="list-section">
            <table id="itemTable">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Price Per Unit</th>
                        <th>Available Quantity</th>
                        <th>Add to Cart</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Items will be rendered here -->
                </tbody>
            </table>
        </div>
    </div>

    <!-- Add to Cart Popup -->
    <div id="addToCartPopup" class="popup" style="display:none;">
        <div class="popup-content">
            <div class="popup-header">
                <h3 class="popup-title">
                    <i class="fas fa-cart-plus"></i>
                    Add to Cart
                </h3>
            </div>
            <form id="addToCartForm">
                <input type="hidden" id="popupItemId">
                <div class="popup-form-group">
                    <span class="popup-label">Item:</span>
                    <span class="popup-value" id="popupItemName"></span>
                </div>
                <div class="popup-form-group">
                    <span class="popup-label">Available:</span>
                    <span class="popup-value" id="popupAvailableQty"></span>
                </div>
                <div class="popup-form-group">
                    <span class="popup-label">Price per unit:</span>
                    <span class="popup-value" id="popupPrice"></span>
                </div>
                <div class="popup-form-group">
                    <span class="popup-label">Quantity:</span>
                    <input type="number" id="popupQty" class="popup-input" min="1" required>
                </div>
                <div class="popup-buttons">
                    <button type="submit" class="popup-submit-btn">
                        <i class="fas fa-plus"></i>
                        Add to Cart
                    </button>
                    <button type="button" class="popup-cancel-btn" onclick="closeAddToCartPopup()">
                        <i class="fas fa-times"></i>
                        Cancel
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script src="js/startOrder.js"></script>
</body>
</html>