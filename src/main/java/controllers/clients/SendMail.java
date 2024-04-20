package controllers.clients;

import java.io.IOException;

import dao.ClientDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.HibernateUtils;

@WebServlet("/client-send-mail")
public class SendMail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("path", "client-send-mail");
        req.getRequestDispatcher("/WEB-INF/views/clients/send-mail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String subject = req.getParameter("subject");
        String html = req.getParameter("html");

        ClientDAO clientDAO = new ClientDAO(HibernateUtils.getSessionFactory());
        clientDAO.sendMailToAllClients(subject, html);
        req.getSession().setAttribute("mail", "ok");

        resp.sendRedirect("client-send-mail");
    }
}
