<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pahanaedu Bookshop Login</title>
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
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #9FB3DF 0%, #9EC6F3 50%, #BDDDE4 100%);
            padding: 20px;
        }

        /* Login Container */
        .login-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 2.5rem;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            position: relative;
            overflow: hidden;
        }

        /* Decorative Elements */
        .login-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(to right, #9FB3DF, #9EC6F3);
        }

        /* Header */
        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .logo-icon {
            font-size: 3rem;
            color: #9FB3DF;
            margin-bottom: 1rem;
        }

        .login-title {
            color: #333;
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .login-subtitle {
            color: #666;
            font-size: 0.9rem;
        }

        /* Form */
        .login-form {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
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
            font-size: 1.2rem;
        }

        .input-group input {
            width: 100%;
            padding: 1rem 1rem 1rem 3rem;
            border: 1px solid #BDDDE4;
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: white;
        }

        .input-group input:focus {
            outline: none;
            border-color: #9EC6F3;
            box-shadow: 0 0 0 3px rgba(158, 198, 243, 0.2);
        }

        .input-group input::placeholder {
            color: #999;
        }

        .login-btn {
            background: linear-gradient(to right, #9FB3DF, #9EC6F3);
            color: white;
            border: none;
            padding: 1rem;
            border-radius: 10px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(159, 179, 223, 0.4);
        }

        .login-btn:active {
            transform: translateY(0);
        }

        /* Error Message */
        .error-message {
            background: #FFF1D5;
            color: #d63031;
            padding: 1rem;
            border-radius: 8px;
            margin-top: 1rem;
            font-size: 0.9rem;
            display: none;
            align-items: center;
            gap: 0.5rem;
        }

        .error-message.show {
            display: flex;
        }

        /* Footer */
        .login-footer {
            text-align: center;
            margin-top: 2rem;
            color: #666;
            font-size: 0.9rem;
        }

        .datetime {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            color: #666;
            font-size: 0.8rem;
            margin-top: 1rem;
        }

        /* Responsive Design */
        @media (max-width: 480px) {
            .login-container {
                padding: 2rem;
            }

            .login-title {
                font-size: 1.5rem;
            }

            .input-group input {
                padding: 0.8rem 0.8rem 0.8rem 2.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <div class="logo-icon">
                <i class="fas fa-book"></i>
            </div>
            <h1 class="login-title">Pahanaedu Bookshop</h1>
            <p class="login-subtitle">Sign in to continue to your account</p>
        </div>

        <form id="loginForm" method="post" class="login-form">
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input 
                    type="text" 
                    name="username" 
                    placeholder="Username" 
                    required 
                    autocomplete="username"
                />
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input 
                    type="password" 
                    name="password" 
                    placeholder="Password" 
                    required 
                    autocomplete="current-password"
                />
            </div>
            <button type="submit" class="login-btn">
                <i class="fas fa-sign-in-alt"></i>
                Sign In
            </button>
        </form>

        <div id="errorMsg" class="error-message">
            <i class="fas fa-exclamation-circle"></i>
            <span>Invalid username or password</span>
        </div>

        <div class="login-footer">
            <p>© 2025 Pahanaedu Bookshop. All rights reserved.</p>
            <div class="datetime">
            
            </div>
        </div>
    </div>

    <script src="js/main.js"></script>
</body>
</html>