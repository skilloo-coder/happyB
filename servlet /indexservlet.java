// IndexServlet.java
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class IndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("jsp/index.jsp");
    }
}