package gym;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClientDAO;

@WebServlet("/remove_client")
public class RemoveClient extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");

        if (name.trim().isEmpty()) {
            request.setAttribute("message", "Please provide the name of the client.");
            request.getRequestDispatcher("/remove_client.jsp").forward(request, response);
        } else {
            boolean removed = ClientDAO.removeClient(name);
            if (removed) {
                request.setAttribute("message", "Client removed successfully!");
            } else {
                request.setAttribute("message", "Client with the name " + name + " not found.");
            }
            request.getRequestDispatcher("/client_list.jsp").forward(request, response);
        }
    }
}
