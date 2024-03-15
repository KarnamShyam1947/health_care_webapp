package controllers.auth;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.UserDAO;
import entities.User;
import utils.HibernateUtils;

@WebServlet("/verify")
public class VerifyUsers extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        
        String token = req.getParameter("token");
        if(token == null) {
            session.setAttribute("verify", "failed");
            resp.sendRedirect("home");
        }

        UserDAO dao = new UserDAO(HibernateUtils.getSessionFactory());
        User user = dao.isValidToken(token);

        if(user == null) {
            session.setAttribute("verify", "failed");
            resp.sendRedirect("home");
        }
        else {
            session.setAttribute("user", user);
            resp.sendRedirect("set-password");
        }

    }    
}
