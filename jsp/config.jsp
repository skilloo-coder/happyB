<%-- config.jsp --%>
<%@ page import="java.sql.*" %>
<%
    String dbURL = "jdbc:mysql://localhost:3306/student_db";
    String dbUser = "your_db_username";  // Replace with your DB username
    String dbPass = "your_db_password";  // Replace with your DB password
    Connection conn = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
        session.setAttribute("conn", conn);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
