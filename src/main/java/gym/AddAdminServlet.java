package gym;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDAO;

@WebServlet("/add_admin")
public class AddAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        boolean added = AdminDAO.addAdmin(name, email, phone, password);
        if (added) {
            // Redirect to Admin Dashboard after adding admin
            response.sendRedirect("client_list.jsp");
        } else {
            // Handle error appropriately
            request.setAttribute("message", "Failed to add admin.");
            request.getRequestDispatcher("/add_admin.jsp").forward(request, response);
        }
    }
}
