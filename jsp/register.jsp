<%-- register.jsp --%>
<%@ include file="config.jsp" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>Register</title></head>
<body>
    <h2>Registration</h2>
    <form method="post" action="register.jsp">
        Roll Number: <input type="text" name="roll_number" required><br>
        User ID: <input type="text" name="user_id" required><br>
        Password: <input type="password" name="password" required><br>
        Name: <input type="text" name="name" required><br>
        Branch: <input type="text" name="branch" required><br>
        <input type="submit" value="Register">
    </form>
    
    <% 
        if (request.getMethod().equals("POST")) {
            String rollNumber = request.getParameter("roll_number");
            String userId = request.getParameter("user_id");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String branch = request.getParameter("branch");

            try {
                PreparedStatement pst1 = conn.prepareStatement("INSERT INTO userdata (roll_number, user_id, password) VALUES (?, ?, ?)");
                pst1.setString(1, rollNumber);
                pst1.setString(2, userId);
                pst1.setString(3, password);  // For security, consider hashing the password
                
                PreparedStatement pst2 = conn.prepareStatement("INSERT INTO stddetails (roll_number, name, branch) VALUES (?, ?, ?)");
                pst2.setString(1, rollNumber);
                pst2.setString(2, name);
                pst2.setString(3, branch);

                int rows1 = pst1.executeUpdate();
                int rows2 = pst2.executeUpdate();
                
                if (rows1 > 0 && rows2 > 0) {
                    out.println("Registration successful!");
                } else {
                    out.println("Registration failed.");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>