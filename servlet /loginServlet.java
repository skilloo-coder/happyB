// LoginServlet.java
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("user_id");
        String password = request.getParameter("password");

        try (Connection conn = Config.getConnection()) {
            String sql = "SELECT * FROM userdata WHERE user_id = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, userId);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("user_id", userId);
                response.sendRedirect("welcome.jsp");
            } else {
                response.sendRedirect("login.jsp?error=Invalid credentials");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}