<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Customers - Pahanaedu Bookshop</title>
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

        .logout-btn {
            background-color: #9FB3DF;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: background-color 0.3s;
        }

        .logout-btn:hover {
            background-color: #8BA1CD;
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

        /* Form Section Styles */
        .form-section {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1rem;
        }

        .input-group {
            position: relative;
        }

        .input-group i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #9FB3DF;
        }

        .input-group input {
            width: 100%;
            padding: 0.8rem 1rem 0.8rem 2.5rem;
            border: 1px solid #BDDDE4;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
        }

        .input-group input:focus {
            outline: none;
            border-color: #9EC6F3;
            box-shadow: 0 0 0 2px rgba(158, 198, 243, 0.2);
        }

        .submit-btn {
            background: #9EC6F3;
            color: white;
            border: none;
            padding: 0.8rem 1.5rem;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s;
            width: 100%;
            justify-content: center;
            margin-top: 1rem;
        }

        .submit-btn:hover {
            background: #8BB4E1;
            transform: translateY(-2px);
        }

        /* Search Section Styles */
        .search-section {
            margin-bottom: 2rem;
        }

        .search-container {
            position: relative;
            max-width: 500px;
            margin: 0 auto;
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

        /* Table Styles */
        .list-section {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        #customerTable {
            width: 100%;
            border-collapse: collapse;
        }

        #customerTable th {
            background: #9FB3DF;
            color: white;
            padding: 1rem;
            text-align: left;
        }

        #customerTable td {
            padding: 1rem;
            border-bottom: 1px solid #BDDDE4;
        }

        #customerTable tr:hover {
            background: #FFF1D5;
        }

        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }

        .edit-btn, .delete-btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s;
        }

        .edit-btn {
            background: #9EC6F3;
            color: white;
        }

        .delete-btn {
            background: #FFF1D5;
            color: #333;
        }

        .edit-btn:hover, .delete-btn:hover {
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
        }

        .popup-title {
            font-size: 1.5rem;
            color: #333;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .close-btn {
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            color: #666;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
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
                <span class="username">Welcome,</span>
                <button class="logout-btn" onclick="location.href='login.jsp'">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </button>
            </div>
        </div>
    </header>

    <div class="container">
        <h1 class="page-title">
            <i class="fas fa-users"></i>
            Manage Customers
        </h1>

        <div class="form-section">
            <form id="addCustomerForm">
                <div class="form-grid">
                    <div class="input-group">
                        <i class="fas fa-user"></i>
                        <input type="text" name="name" placeholder="Customer Name" required>
                    </div>
                    <div class="input-group">
                        <i class="fas fa-phone"></i>
                        <input type="text" name="contact" placeholder="Contact Number" required>
                    </div>
                </div>
                <button type="submit" class="submit-btn">
                    <i class="fas fa-plus"></i>
                    Add Customer
                </button>
            </form>
        </div>

        <div class="search-section">
            <div class="search-container">
                <i class="fas fa-search"></i>
                <input type="text" id="searchInput" placeholder="Search by name or contact">
            </div>
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
                    <!-- Customer rows will be dynamically added here -->
                </tbody>
            </table>
        </div>
    </div>

    <!-- Edit Popup -->
    <div id="editPopup" class="popup" style="display:none;">
        <div class="popup-content">
            <div class="popup-header">
                <h3 class="popup-title">
                    <i class="fas fa-edit"></i>
                    Edit Customer
                </h3>
                <button class="close-btn" onclick="closeEditPopup()">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <form id="editCustomerForm">
                <input type="hidden" name="id" id="editId">
                <div class="input-group">
                    <i class="fas fa-user"></i>
                    <input type="text" name="name" id="editName" required>
                </div>
                <div class="input-group" style="margin-top: 1rem;">
                    <i class="fas fa-phone"></i>
                    <input type="text" name="contact" id="editContact" required>
                </div>
                <div style="display: flex; gap: 1rem; margin-top: 1.5rem;">
                    <button type="submit" class="submit-btn">
                        <i class="fas fa-check"></i>
                        Update
                    </button>
                    <button type="button" class="delete-btn" onclick="closeEditPopup()">
                        <i class="fas fa-times"></i>
                        Cancel
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script src="js/manageCustomer.js"></script>
</body>
</html>