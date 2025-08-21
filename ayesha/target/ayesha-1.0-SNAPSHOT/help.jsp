<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Help - Pahanaedu Bookshop System</title>
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

        /* Help Content Styles */
        .help-container {
            max-width: 1000px;
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

        .help-section {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }

        .section-title {
            color: #333;
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid #9EC6F3;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .feature-list {
            list-style: none;
            padding: 0;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
        }

        .feature-item {
            background: rgba(159, 179, 223, 0.1);
            padding: 1.5rem;
            border-radius: 10px;
            display: flex;
            align-items: flex-start;
            gap: 1rem;
            transition: transform 0.3s;
        }

        .feature-item:hover {
            transform: translateY(-2px);
            background: rgba(159, 179, 223, 0.2);
        }

        .feature-item i {
            color: #9EC6F3;
            font-size: 1.5rem;
            padding-top: 0.2rem;
        }

        .feature-content {
            flex: 1;
        }

        .feature-title {
            font-weight: bold;
            color: #333;
            margin-bottom: 0.5rem;
        }

        .issues-list {
            list-style: none;
            padding: 0;
        }

        .issue-item {
            background: #FFF1D5;
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .issue-item i {
            color: #9FB3DF;
        }

        .contact-section {
            text-align: center;
            background: linear-gradient(135deg, #9FB3DF 0%, #9EC6F3 100%);
            color: white;
            padding: 2rem;
            border-radius: 10px;
            margin-top: 2rem;
        }

        .contact-section h3 {
            margin-bottom: 1rem;
        }

        .contact-section a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .contact-section a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .feature-list {
                grid-template-columns: 1fr;
            }

            .header-content {
                flex-direction: column;
                gap: 1rem;
            }

            .help-container {
                padding: 1rem;
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

    <div class="help-container">
        <h1 class="page-title">
            <i class="fas fa-question-circle"></i>
            Help & Support
        </h1>

        <div class="help-section">
            <h2 class="section-title">
                <i class="fas fa-book-reader"></i>
                System Features
            </h2>
            <ul class="feature-list">
                <li class="feature-item">
                    <i class="fas fa-sign-in-alt"></i>
                    <div class="feature-content">
                        <div class="feature-title">Login</div>
                        <p>Enter your username and password to access the system</p>
                    </div>
                </li>
                <li class="feature-item">
                    <i class="fas fa-th-large"></i>
                    <div class="feature-content">
                        <div class="feature-title">Main Menu</div>
                        <p>Navigate through different system functions using intuitive card interface</p>
                    </div>
                </li>
                <li class="feature-item">
                    <i class="fas fa-users"></i>
                    <div class="feature-content">
                        <div class="feature-title">Manage Customers</div>
                        <p>Add, edit, search, and manage customer information</p>
                    </div>
                </li>
                <li class="feature-item">
                    <i class="fas fa-box-open"></i>
                    <div class="feature-content">
                        <div class="feature-title">Add Items</div>
                        <p>Manage inventory by adding and updating items</p>
                    </div>
                </li>
                <li class="feature-item">
                    <i class="fas fa-shopping-cart"></i>
                    <div class="feature-content">
                        <div class="feature-title">Start Order</div>
                        <p>Create new orders and manage shopping cart</p>
                    </div>
                </li>
                <li class="feature-item">
                    <i class="fas fa-history"></i>
                    <div class="feature-content">
                        <div class="feature-title">Order History</div>
                        <p>View and manage past orders and transactions</p>
                    </div>
                </li>
            </ul>
        </div>

        <div class="help-section">
            <h2 class="section-title">
                <i class="fas fa-exclamation-triangle"></i>
                Common Issues
            </h2>
            <ul class="issues-list">
                <li class="issue-item">
                    <i class="fas fa-key"></i>
                    <p>If you can't log in, check your username and password then contact admin</p>
                </li>
                <li class="issue-item">
                    <i class="fas fa-wifi"></i>
                    <p>If items or customers don't appear, ensure your internet connection and backend server are running</p>
                </li>
                <li class="issue-item">
                    <i class="fas fa-exclamation-circle"></i>
                    <p>If you see error messages during order or checkout, verify your item quantities and customer details</p>
                </li>
            </ul>
        </div>

        <div class="contact-section">
            <h3><i class="fas fa-headset"></i> Need Further Assistance?</h3>
            <p>
                Email us at <a href="mailto:support@pahanaedu.lk">support@pahanaedu.lk</a><br>
                Or call us at +94 4651404
            </p>
        </div>
    </div>
</body>
</html>