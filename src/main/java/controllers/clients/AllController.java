package controllers.clients;

import java.io.IOException;

import java.util.List;

import dao.ClientDAO;
import entities.Client;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.HibernateUtils;

@WebServlet("/clients-list")
public class AllController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ClientDAO clientDAO = new ClientDAO(HibernateUtils.getSessionFactory());
        List<Client> clients = clientDAO.getClients();

        System.out.println(clients);
        req.setAttribute("applications", clients);
        req.setAttribute("path", "clients-list");
        req.getRequestDispatcher("/WEB-INF/views/clients/all.jsp").forward(req, resp);
    }
}
