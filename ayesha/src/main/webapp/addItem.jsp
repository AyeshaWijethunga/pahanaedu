<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Items</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>Add Items</h2>
    <div class="form-section">
        <form id="addItemForm">
            <input type="text" name="name" placeholder="Item Name" required>
            <input type="number" step="0.01" name="price" placeholder="Price Per Unit" required>
            <input type="number" name="quantity" placeholder="Quantity" required>
            <button type="submit">Add Item</button>
        </form>
    </div>
    <div class="search-section">
        <input type="text" id="searchInput" placeholder="Search by item name">
    </div>
    <div class="list-section">
        <table id="itemTable">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Price Per Unit</th>
                    <th>Quantity</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Item rows here -->
            </tbody>
        </table>
    </div>
    <!-- Edit Popup -->
    <div id="editPopup" class="popup" style="display:none;">
        <div class="popup-content">
            <h3>Edit Item</h3>
            <form id="editItemForm">
                <input type="hidden" name="id" id="editId">
                <input type="text" name="name" id="editName" required>
                <input type="number" step="0.01" name="price" id="editPrice" required>
                <input type="number" name="quantity" id="editQuantity" required>
                <button type="submit">Update</button>
                <button type="button" onclick="closeEditPopup()">Cancel</button>
            </form>
        </div>
    </div>
    <script src="js/addItem.js"></script>
</body>
</html>