<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Start Order</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>Start Order</h2>
    <div class="search-section">
        <input type="text" id="searchInput" placeholder="Search by item name">
        <button onclick="redirectToCart()">Cart</button>
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
    <!-- Add to Cart Popup -->
    <div id="addToCartPopup" class="popup" style="display:none;">
        <div class="popup-content">
            <h3>Add to Cart</h3>
            <form id="addToCartForm">
                <input type="hidden" id="popupItemId">
                <div>
                    <label for="popupItemName">Item:</label>
                    <span id="popupItemName"></span>
                </div>
                <div>
                    <label for="popupAvailableQty">Available:</label>
                    <span id="popupAvailableQty"></span>
                </div>
                <div>
                    <label for="popupPrice">Price per unit:</label>
                    <span id="popupPrice"></span>
                </div>
                <div>
                    <label for="popupQty">Quantity:</label>
                    <input type="number" id="popupQty" min="1" required>
                </div>
                <button type="submit">Add</button>
                <button type="button" onclick="closeAddToCartPopup()">Cancel</button>
            </form>
        </div>
    </div>
    <script src="js/startOrder.js"></script>
</body>
</html>