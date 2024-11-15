<%-- welcome.jsp --%>
<%@ page session="true" %>
<%
    String userId = (String) session.getAttribute("user_id");
    if (userId == null) {
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head><title>Welcome</title></head>
<body>
    <h2>Welcome, <%= userId %></h2>
    <a href="logout.jsp">Logout</a>
</body>
</html>