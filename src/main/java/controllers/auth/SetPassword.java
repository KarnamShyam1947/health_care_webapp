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

@WebServlet("/set-password")
public class SetPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Check user in session and then redirect 
        req.getRequestDispatcher("/WEB-INF/views/set-password.jsp").forward(req, resp);   
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String password = req.getParameter("password");
        UserDAO dao = new UserDAO(HibernateUtils.getSessionFactory());

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        dao.setPassword(user, password);

        session.setAttribute("password", "ok");
        resp.sendRedirect("login");
    }
}
