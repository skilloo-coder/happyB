<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f2f5;
            font-family: Arial, sans-serif;
        }
        .signup-container {
            width: 300px;
            padding: 40px;
            background: white;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            text-align: center;
        }
        .signup-container h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .signup-container input[type="text"], .signup-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .signup-container button {
            width: 100%;
            padding: 10px;
            color: white;
            background-color: #28a745;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .signup-container button:hover {
            background-color: #218838;
        }
        .error-message, .success-message {
            font-size: 14px;
            margin-top: 10px;
        }
        .error-message {
            color: red;
        }
        .success-message {
            color: green;
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <h2>Sign Up</h2>
        <form action="signup.jsp" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Register</button>
            <%
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                if (username != null && password != null) {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_db", "root", "");
                        String sql = "INSERT INTO my_table (username, password) VALUES (?, ?)";
                        PreparedStatement stmt = conn.prepareStatement(sql);
                        stmt.setString(1, username);
                        stmt.setString(2, password);

                        int rowsInserted = stmt.executeUpdate();
                        if (rowsInserted > 0) {
                            out.println("<p class='success-message'>Registration successful! <a href='login.jsp'>Login here</a>.</p>");
                        } else {
                            out.println("<p class='error-message'>Registration failed. Please try again.</p>");
                        }
                        
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        out.println("<p class='error-message'>Database connection error: " + e.getMessage() + "</p>");
                    }
                }
            %>
        </form>
    </div>
</body>
</html>
