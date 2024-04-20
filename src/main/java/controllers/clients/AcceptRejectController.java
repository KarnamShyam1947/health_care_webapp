package controllers.clients;

import java.io.IOException;

import dao.ClientDAO;
import entities.Client;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.HibernateUtils;
import utils.MailUtils;

@WebServlet("/client-action")
public class AcceptRejectController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
  
        int cid = Integer.parseInt(req.getParameter("cid"));
        String accept = req.getParameter("accept");
        String reject = req.getParameter("reject");
        HttpSession session = req.getSession();

        ClientDAO clientDAO = new ClientDAO(HibernateUtils.getSessionFactory());

        if("ok".equals(accept)) {
            Client client = clientDAO.getClient(cid);
            String[] to = {
                client.getUserEmail()
            };

            clientDAO.changeStatus(cid);
            session.setAttribute("clientStatus", "ok");
            MailUtils.sendAcceptOrRejectMail("admin@gmail.com", to, true, client);

            resp.sendRedirect("clients-list");
        }
        
        if("ok".equals(reject)) {
            System.out.println("reject");
            Client client = clientDAO.getClient(cid);
            String[] to = {
                client.getUserEmail()
            };
            session.setAttribute("clientStatus", "failed");

            MailUtils.sendAcceptOrRejectMail("admin@gmail.com", to, false, client);
            clientDAO.deleteClient(cid);

            resp.sendRedirect("clients-list");
        }

    }
}
