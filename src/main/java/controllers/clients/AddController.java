package controllers.clients;

import java.io.IOException;

import dao.ClientDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.HibernateUtils;

@WebServlet("/client-register-services")
public class AddController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/clients/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username=req.getParameter("username");
        String userEmail=req.getParameter("email");
        String phone=req.getParameter("phone");
        String hospitalName=req.getParameter("hname");
        String hospitalAddress=req.getParameter("address");

        ClientDAO clientDAO = new ClientDAO(HibernateUtils.getSessionFactory());

        boolean saveClient = clientDAO.saveClient(username, userEmail, hospitalName, phone, hospitalAddress);
        if (saveClient)
            req.getSession().setAttribute("clientAdd", "1");
        
        else
            req.getSession().setAttribute("clientAdd", "0");

        resp.sendRedirect("client-register");
    }
}
