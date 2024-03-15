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

@WebServlet("/forgot-password")
public class ForgotPassword extends HttpServlet  {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(req, resp);
    }    

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        UserDAO dao = new UserDAO(HibernateUtils.getSessionFactory());
        User user = dao.getUserByEmail(email);
        if(user == null) {
            HttpSession session = req.getSession();
            session.setAttribute("forgot", "failed");
            resp.sendRedirect("forgot-password");
        }
        else {
            int uid = user.getId();
            resp.sendRedirect("send-password-set-email?uid=" + uid +"&next=forgot-password");
        }
    }
}
