<%-- login.jsp --%>
<%@ include file="config.jsp" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>Login</title></head>
<body>
    <h2>Login</h2>
    <form method="post" action="login.jsp">
        User ID: <input type="text" name="user_id" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>

    <%
        if (request.getMethod().equals("POST")) {
            String userId = request.getParameter("user_id");
            String password = request.getParameter("password");

            try {
                PreparedStatement pst = conn.prepareStatement("SELECT * FROM userdata WHERE user_id = ? AND password = ?");
                pst.setString(1, userId);
                pst.setString(2, password);
                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    session.setAttribute("user_id", userId);
                    response.sendRedirect("welcome.jsp");
                } else {
                    out.println("Invalid username or password.");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>