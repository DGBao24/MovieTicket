    <%@ page import="entity.Account" %>
    <%@ page contentType="text/html; charset=UTF-8" %>
    <%
        Integer customerID = (Integer) session.getAttribute("CustomerID");
            if (customerID == null) {
            response.sendRedirect("login.jsp");
            return;
}
        Account customer = (Account) session.getAttribute("account");
        String errorMessage = (String) request.getAttribute("errorMessage");
        String successMessage = (String) request.getAttribute("successMessage");
    %>

    <!DOCTYPE html>
    <html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cập nhật thông tin</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #F0E2B6;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                background: #FAF3D5;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
                width: 400px;
            }
            h2 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }
            .form-group {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
            }
            .form-group label {
                font-weight: bold;
                color: #333;
            }
            .form-group input {
                flex: 1;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #F8F8F8;
            }
            .form-group input:focus {
                outline: none;
                border-color: #007BFF;
            }
            .btn-container {
                text-align: center;
                margin-top: 20px;
            }
            .btn {
                background-color: #28a745;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }
            .btn:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h2>Cập nhật thông tin</h2>
            
            <%-- Hiển thị thông báo nếu có lỗi --%>
            <% if (errorMessage != null) { %>
            <div class="alert alert-danger"><%= errorMessage %></div>
            <% } %>
            
            <%-- Hiển thị thông báo thành công nếu có --%>
            <% if (successMessage != null) { %>
            <div class="alert alert-success"><%= successMessage %></div>
            <% } %>
            
            <form action="account" method="post">
                <input type="hidden" name="service" value="changeCustomerProfile">

                <div class="form-group">
                    <label for="Name">Họ và Tên:</label>
                    <input type="text" name="Name" value="<%= customer.getName() %>" required>
                </div>

                <div class="form-group">
                    <label>Năm sinh:</label>
                    <input type="number" name="YearOfBirth" value="<%= customer.getYearOfBirth() %>" required>
                </div>

                <div class="form-group">
                    <label>Email:</label>
                    <input type="email" name="Email" value="<%= customer.getEmail() %>" readonly>
                </div>

                <div class="form-group">
                    <label>Số điện thoại:</label>
                    <input type="text" name="PhoneNum" value="<%= customer.getPhoneNum() %>" required>
                </div>

                <div class="form-group">
                    <label>Địa chỉ:</label>
                    <input type="text" name="Address" value="<%= customer.getAddress() %>" required>
                </div>

                <div class="btn-container">
                    <button type="submit" name="submit" class="btn">Lưu thay đổi</button>
                </div>
            </form>
                <br>
    <a href="account?service=changePassword">Đổi Mật Khẩu</a> |
    <a href="home">Về Trang Chủ</a>
        </div>

    </body>
    </html>
