<%-- 
    Document   : admin
    Created on : 12 thg 2, 2025, 19:33:23
    Author     : Tĩnh ăn loz
--%>

<<<<<<< HEAD

<%@ page import="entity.User, utils.Role" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

=======
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="entity.User, utils.Role" %>
>>>>>>> 0846b438060f7c8b560467be935bd16652350eea
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !Role.ADMIN.equals(user.getRole())) {
        response.sendRedirect("error.jsp");
        return;
    }
%>
<html>
<head>
    <title>Admin Page</title>
</head>
<body>
    <h2>Admin Panel</h2>
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>

