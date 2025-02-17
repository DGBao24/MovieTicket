<%@ page import="entity.Account" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
                font-family: "Poppins", sans-serif;
                color: #0c0c0c;
                background-color: #ffffff;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            body {
                background-image: url('images/hero-bg.png');
                background-size: cover; /* Lấp đầy toàn bộ trang */
                background-position: center; /* Căn giữa ảnh */
                background-attachment: fixed; /* Giữ ảnh nền cố định khi cuộn */
            }


            .container {

                background: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
                width: 500px; /* Đổi kích thước container */
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
                width: 150px; /* Căn chỉnh tên bên trái */
                flex-shrink: 0; /* Đảm bảo tên không bị thu nhỏ */
            }
            .form-group input{
                width: calc(100% - 160px); /* Đảm bảo ô điền chiếm không gian còn lại */
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #F8F8F8;
            }
            .form-group input:focus,
            .form-group select:focus {
                outline: none;
                border-color: #007BFF;
            }
            .btn-container {
                text-align: center;
                margin-top: 20px;
            }
            .btn {
                background-color:#c82333;
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
            .form-control {
                width: 100%;
                padding: 8px 12px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 4px;
                background-color: #fff;
            }
            .form-group select{
                background-color: #F8F8F8;
            }
            .form-group label {
                font-size: 16px;
                font-weight: bold;
                margin-bottom: 8px;
            }
            .alert-banner {
                width: 100%;
                padding: 10px;
                text-align: center;
                font-size: 16px;
                position: absolute;
                top: 0;
                left: 0;
                z-index: 9999; /* Đảm bảo thông báo luôn hiển thị trên cùng */
                border-radius: 0; /* Giảm bớt góc nếu muốn */
            }

            .alert-danger {
                background-color: #f8d7da;
                color: #721c24;
            }

            .alert-success {
                background-color: #d4edda;
                color: #155724;
            }
            
            #change{
                background-color: #0056b3;
            }


        </style>

</head>
<body>
        <%-- Hiển thị thông báo nếu có lỗi --%>
        <% if (errorMessage != null) { %>
    <div class="alert alert-danger alert-banner"><%= errorMessage %></div>
    <% } %>

    <%-- Hiển thị thông báo thành công nếu có --%>
    <% if (successMessage != null) { %>
    <div class="alert alert-success alert-banner"><%= successMessage %></div>
    <% } %>

    <div class="container">
        <h2>Cập nhật thông tin</h2>


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
                <label>Gender:</label>
                <select name="Gender" required class="form-control">
                    <option value="Male" <%= customer.getGender().equals("Male") ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= customer.getGender().equals("Female") ? "selected" : "" %>>Female</option>
                    <option value="Others" <%= customer.getGender().equals("Others") ? "selected" : "" %>>Others</option>
                </select>
            </div>

            <div class="form-group">
                <label>Số điện thoại:</label>
                <input type="text" name="PhoneNum" value="<%= customer.getPhoneNum() %>" required>
            </div>

            <div class="form-group">
                <label>Địa chỉ:</label>
                <input type="text" name="Address" value="<%= customer.getAddress() %>" required>
            </div>

            <div class="btn-container ">
                <button type="submit" name="submit" class="btn " id="change" >Lưu thay đổi</button>
            </div>
        </form>
        <br>

        <div class="btn-container">
            <button class="btn" onclick="window.location.href = 'account?service=changePassword'">Đổi Mật Khẩu</button>
            <button class="btn" onclick="window.location.href = 'home'">Về Trang Chủ</button>
        </div>

    </div>

</body>
</html>
