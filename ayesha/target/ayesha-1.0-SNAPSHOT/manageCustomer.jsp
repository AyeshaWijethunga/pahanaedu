<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Customers</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>Manage Customers</h2>
    <div class="form-section">
        <form id="addCustomerForm">
            <input type="text" name="name" placeholder="Customer Name" required>
            <input type="text" name="contact" placeholder="Contact Number" required>
            <button type="submit">Add Customer</button>
        </form>
    </div>
    <div class="search-section">
        <input type="text" id="searchInput" placeholder="Search by name or contact">
    </div>
    <div class="list-section">
        <table id="customerTable">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Customer rows here -->
            </tbody>
        </table>
    </div>
    <!-- Edit Popup -->
    <div id="editPopup" class="popup" style="display:none;">
        <div class="popup-content">
            <h3>Edit Customer</h3>
            <form id="editCustomerForm">
                <input type="hidden" name="id" id="editId">
                <input type="text" name="name" id="editName" required>
                <input type="text" name="contact" id="editContact" required>
                <button type="submit">Update</button>
                <button type="button" onclick="closeEditPopup()">Cancel</button>
            </form>
        </div>
    </div>
    <script src="js/manageCustomer.js"></script>
</body>
</html>