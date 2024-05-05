package gym;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClientDAO;

@WebServlet("/search_client")
public class SearchClient extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        Client client = ClientDAO.searchClient(name);
        if (client != null) {
            request.setAttribute("message", "Client found!");
            request.setAttribute("client", client);
        } else {
            request.setAttribute("message", "Client with the name " + name + " not found.");
        }
        request.getRequestDispatcher("/search_client.jsp").forward(request, response);
    }
}
