<%-- 
    Document   : home
    Created on : Feb 12, 2025
    Author     : Nhat Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="entity.Account" %>

<%
    // Kiểm tra session có Account hay không
    
    Object accObj = session.getAttribute("account");
    Account account = null;
    if (accObj instanceof Account) {
        account = (Account) accObj;
    }

    boolean isLoggedIn = (account != null);
    Integer customerID = (Integer) session.getAttribute("CustomerID");
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Trang chủ</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 50px;
        }
        .container {
            width: 400px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        }
        a {
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            padding: 10px 15px;
            border-radius: 5px;
            display: inline-block;
            margin: 5px;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Chào mừng đến với trang chủ</h2>

      
            <p><strong>Xin chào, <%= account.getName() %>!</strong></p>
            <p><a href="account?service=changeCustomerProfile&cid=<%= customerID %>">Your Profile</a></p>
            <p><a href="account?service=changePassword">Change Password</a></p>
            <p><a href="logout">Logout</a></p>
            <p><a href="home">Home</a></p>
    </div>
</body>
</html>
