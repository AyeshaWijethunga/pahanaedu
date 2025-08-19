<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cart & Checkout</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>Your Cart</h2>
    <div id="cartList"></div>
    <div id="checkoutSection"></div>
    <!-- Receipt Popup -->
    <div id="receiptPopup" class="popup" style="display:none;">
        <div class="popup-content" id="receiptContent"></div>
    </div>
    <script src="js/cart.js"></script>
</body>
</html>