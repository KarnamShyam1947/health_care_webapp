package controllers.auth;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.UserDAO;
import utils.HibernateUtils;

@WebServlet("/send-password-set-email")
public class SendPasswordSetEmail extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Integer uid = Integer.parseInt(req.getParameter("uid"));
        String next = req.getParameter("next");
        
        UserDAO dao = new UserDAO(HibernateUtils.getSessionFactory());
        boolean status = dao.SendPasswordSetEmail(uid);

        if(status) {
            session.setAttribute("apply", "ok");
        }
        else {
            session.setAttribute("apply", "failed");
        }

        resp.sendRedirect(next);
    }
}
