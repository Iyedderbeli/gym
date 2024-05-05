package gym;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClientDAO;
import dao.AdminDAO;
import gym.Client;
import gym.Admin;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Client client = ClientDAO.getClientByEmailAndPassword(email, password);
        Admin admin = AdminDAO.getAdminByEmailAndPassword(email, password);

        if (client != null) {
            // Client exists, redirect to client dashboard or info page
            request.getSession().setAttribute("client", client); // Store client object in session
            response.sendRedirect("client_dashboard.jsp");
        } else if (admin != null) {
            // Admin exists, redirect to admin dashboard or info page
            request.getSession().setAttribute("admin", admin); // Store admin object in session
            response.sendRedirect("client_list.jsp");
        } else {
            // Neither client nor admin, redirect to registration or login page
            response.sendRedirect("register.jsp");
        }
    }
}
