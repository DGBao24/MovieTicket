<%-- 
    Document   : dashboard
    Created on : 12 thg 2, 2025, 19:32:42
    Author     : Tĩnh ăn loz
--%>

<<<<<<< HEAD
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

=======
<%@ page contentType="text/html; charset=UTF-8" %>
>>>>>>> 0846b438060f7c8b560467be935bd16652350eea
<%@ page import="entity.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
    <h2>Welcome, <%= user.getUsername() %>!</h2>
    <a href="admin.jsp">Admin Page</a> | <a href="user.jsp">User Page</a> | <a href="logout">Logout</a>
</body>
</html>

