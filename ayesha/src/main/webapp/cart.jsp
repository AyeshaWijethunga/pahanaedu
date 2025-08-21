<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cart & Checkout - Pahanaedu Bookshop</title>
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

        .user-info {
            display: flex;
            align-items: center;
            gap: 2rem;
        }

        .datetime, .username {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: #666;
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

        /* Cart List Styles */
        .cart-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .cart-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 1rem;
            border-bottom: 1px solid #BDDDE4;
        }

        .cart-item:last-child {
            border-bottom: none;
        }

        .item-details {
            flex: 1;
            display: flex;
            align-items: center;
            gap: 2rem;
        }

        .item-name {
            font-weight: bold;
            color: #333;
            flex: 1;
        }

        .item-price {
            color: #666;
            min-width: 100px;
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .quantity-btn {
            background: #9FB3DF;
            color: white;
            border: none;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s;
        }

        .quantity-btn:hover {
            background: #8BA1CD;
            transform: scale(1.1);
        }

        .quantity-display {
            min-width: 40px;
            text-align: center;
            font-weight: bold;
        }

        .remove-btn {
            background: #FFF1D5;
            color: #333;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s;
        }

        .remove-btn:hover {
            background: #FFE4B5;
            transform: translateY(-2px);
        }

        /* Checkout Section Styles */
        .checkout-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 2rem;
        }

        .checkout-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #9EC6F3;
        }

        .total-amount {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
        }

        .checkout-form {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .form-label {
            color: #666;
            font-weight: 500;
        }

        .form-input {
            padding: 0.8rem;
            border: 1px solid #BDDDE4;
            border-radius: 8px;
            font-size: 1rem;
        }

        .checkout-btn {
            background: #9EC6F3;
            color: white;
            border: none;
            padding: 1rem 2rem;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s;
            margin-top: 2rem;
        }

        .checkout-btn:hover {
            background: #8BB4E1;
            transform: translateY(-2px);
        }

        /* Receipt Popup Styles */
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
            max-width: 600px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        }

        .receipt-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .receipt-logo {
            font-size: 2rem;
            color: #9FB3DF;
            margin-bottom: 1rem;
        }

        .receipt-details {
            border-top: 2px dashed #BDDDE4;
            border-bottom: 2px dashed #BDDDE4;
            padding: 1rem 0;
            margin: 1rem 0;
        }

        .receipt-item {
            display: flex;
            justify-content: space-between;
            margin: 0.5rem 0;
        }

        .receipt-total {
            font-size: 1.2rem;
            font-weight: bold;
            text-align: right;
            margin-top: 1rem;
        }

        .print-btn {
            background: #9EC6F3;
            color: white;
            border: none;
            padding: 0.8rem 1.5rem;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin: 1rem auto;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .header-content {
                flex-direction: column;
                gap: 1rem;
            }

            .user-info {
                flex-direction: column;
                gap: 0.5rem;
            }

            .checkout-form {
                grid-template-columns: 1fr;
            }

            .popup-content {
                margin: 1rem;
                min-width: auto;
                width: 90%;
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
           
        </div>
    </header>

    <div class="container">
        <h1 class="page-title">
            <i class="fas fa-shopping-cart"></i>
            Your Shopping Cart
        </h1>

        <div class="cart-container" id="cartList">
            <!-- Cart items will be dynamically added here -->
        </div>

        <div class="checkout-container" id="checkoutSection">
            <!-- Checkout form will be dynamically added here -->
        </div>
    </div>

    <!-- Receipt Popup -->
    <div id="receiptPopup" class="popup" style="display:none;">
        <div class="popup-content" id="receiptContent">
            <!-- Receipt content will be dynamically added here -->
        </div>
    </div>

    <script src="js/cart.js"></script>
</body>
</html>