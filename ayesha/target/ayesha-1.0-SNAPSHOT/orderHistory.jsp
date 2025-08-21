<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order History - Pahanaedu Bookshop</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #9FB3DF 0%, #9EC6F3 50%, #BDDDE4 100%);
            min-height: 100vh;
        }

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
            color: #666;
        }

        .username, .datetime {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        /* Main Content */
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

        /* Filter Section */
        .filter-section {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }

        .filter-form {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            align-items: end;
        }

        .input-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .input-group label {
            color: #666;
            font-size: 0.9rem;
        }

        .input-group input {
            padding: 0.8rem;
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

        .filter-btn {
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
            height: 42px;
        }

        .filter-btn:hover {
            background: #8BB4E1;
            transform: translateY(-2px);
        }

        /* Table Section */
        .list-section {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        #orderTable {
            width: 100%;
            border-collapse: collapse;
        }

        #orderTable th {
            background: #9FB3DF;
            color: white;
            padding: 1rem;
            text-align: left;
        }

        #orderTable td {
            padding: 1rem;
            border-bottom: 1px solid #BDDDE4;
        }

        #orderTable tr:hover {
            background: rgba(159, 179, 223, 0.1);
        }

        .order-id {
            font-weight: bold;
            color: #333;
        }

        .customer-info {
            display: flex;
            flex-direction: column;
            gap: 0.2rem;
        }

        .customer-name {
            font-weight: 500;
        }

        .customer-contact {
            color: #666;
            font-size: 0.9rem;
        }

        .datetime-cell {
            color: #666;
            font-size: 0.9rem;
        }

        .items-list {
            max-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }

        .view-btn, .delete-btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s;
        }

        .view-btn {
            background: #9EC6F3;
            color: white;
        }

        .delete-btn {
            background: #FFF1D5;
            color: #333;
        }

        .view-btn:hover, .delete-btn:hover {
            transform: translateY(-2px);
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

            .filter-form {
                grid-template-columns: 1fr;
            }

            .list-section {
                overflow-x: auto;
            }

            #orderTable {
                min-width: 800px;
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
            <i class="fas fa-history"></i>
            Order History
        </h1>

        <div class="filter-section">
            <form id="filterForm" class="filter-form">
                <div class="input-group">
                    <label><i class="fas fa-user"></i> Customer Name</label>
                    <input type="text" id="customerSearch" placeholder="Search by customer name">
                </div>
                <div class="input-group">
                    <label><i class="fas fa-calendar"></i> From Date</label>
                    <input type="date" id="fromDate">
                </div>
                <div class="input-group">
                    <label><i class="fas fa-calendar"></i> To Date</label>
                    <input type="date" id="toDate">
                </div>
                <button type="submit" class="filter-btn">
                    <i class="fas fa-filter"></i>
                    Filter
                </button>
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
    </div>

    <script src="js/orderHistory.js"></script>
</body>
</html>