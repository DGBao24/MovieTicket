<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đổi mật khẩu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 15px;
        }

        .message {
            font-size: 14px;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .error {
            background-color: #ffdddd;
            color: #d8000c;
            border: 1px solid #d8000c;
        }

        .success {
            background-color: #ddffdd;
            color: #4CAF50;
            border: 1px solid #4CAF50;
        }

        .input-group {
            position: relative;
            width: 100%;
            margin-bottom: 15px;
        }

        label {
            display: block;
            text-align: left;
            font-weight: bold;
            margin: 10px 0 5px;
        }

        input {
            width: 100%;
            padding: 10px;
            padding-right: 40px; /* Dành chỗ cho biểu tượng mắt */
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box; /* Đảm bảo không tràn ra ngoài */
        }

        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 18px;
            color: #888;
        }

        .toggle-password:hover {
            color: #007BFF;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            transition: 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>
    <div class="container">
        <h2>Đổi mật khẩu</h2>

        <% if (request.getAttribute("errorMessage") != null) { %>
            <p class="message error"><%= request.getAttribute("errorMessage") %></p>
        <% } %>

        <% if (request.getAttribute("successMessage") != null) { %>
            <p class="message success"><%= request.getAttribute("successMessage") %></p>
        <% } %>

        <form action="account" method="post">
            <input type="hidden" name="service" value="changePassword">
            
            <label for="currentPassword">Mật khẩu hiện tại:</label>
            <div class="input-group">
                <input type="password" id="currentPassword" name="currentPassword" required>
                <span class="toggle-password" onclick="togglePassword('currentPassword')">👁️</span>
            </div>

            <label for="newPassword">Mật khẩu mới:</label>
            <div class="input-group">
                <input type="password" id="newPassword" name="newPassword" required>
                <span class="toggle-password" onclick="togglePassword('newPassword')">👁️</span>
            </div>

            <label for="confirmPassword">Nhập lại mật khẩu mới:</label>
            <div class="input-group">
                <input type="password" id="confirmPassword" name="confirmPassword" required>
                <span class="toggle-password" onclick="togglePassword('confirmPassword')">👁️</span>
            </div>

            <button type="submit" name="submit">Đổi mật khẩu</button>
        </form>
            <a href="home.jsp">Về Trang Chủ</a>
    </div>
        

    <script>
        function togglePassword(inputId) {
            let input = document.getElementById(inputId);
            if (input.type === "password") {
                input.type = "text";
            } else {
                input.type = "password";
            }
        }
    </script>
</body>
</html>
