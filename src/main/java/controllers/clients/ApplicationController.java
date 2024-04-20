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

@WebServlet("/client-applications")
public class ApplicationController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ClientDAO clientDAO = new ClientDAO(HibernateUtils.getSessionFactory());
        List<Client> clientApplications = clientDAO.getClientApplications();

        System.out.println(clientApplications);
        req.setAttribute("applications", clientApplications);
        req.setAttribute("path", "clients-applications");
        req.getRequestDispatcher("/WEB-INF/views/clients/applications.jsp").forward(req, resp);
    }
}
