package gym;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClientDAO;

@WebServlet("/register")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String membership_type = request.getParameter("membership_type");

        if (name.trim().isEmpty() || address.trim().isEmpty() || phone.trim().isEmpty()
                || email.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("message", "Please fill in all the required fields.");
            request.getRequestDispatcher("/add_client.jsp").forward(request, response);
        } else {
            Date registrationDate = new Date(System.currentTimeMillis());
            Client client = new Client(name, address, phone, email, password, membership_type, registrationDate);
            boolean added = ClientDAO.addClient(client);
            if (added) {
                request.setAttribute("message", "Client added successfully.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Failed to add client.");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            }
        }
    }
}
