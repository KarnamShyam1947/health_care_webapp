package controllers.auth;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/logout")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().removeAttribute("currentUser");
        req.getSession().removeAttribute("currentDoctor");
        req.getSession().removeAttribute("currentPatient");
        req.getSession().removeAttribute("admin-user");
        resp.sendRedirect("home");
    }
}
