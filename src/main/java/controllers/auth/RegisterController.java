package controllers.auth;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.DoctorDAO;
import utils.HibernateUtils;

@WebServlet("/register")
@MultipartConfig
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String department =  req.getParameter("department");
        String profile =  req.getParameter("profileUrl");
        String resume =  req.getParameter("resumeUrl");
        String address =  req.getParameter("address");
        String name =  req.getParameter("username");
        String gender =  req.getParameter("gender");
        String email =  req.getParameter("email");
        String phone =  req.getParameter("phone");

        DoctorDAO d = new DoctorDAO(HibernateUtils.getSessionFactory());
        boolean result = d.apply(name, email, address, phone, gender, department, profile, resume);
        System.out.println(result);

        HttpSession httpSession = req.getSession();
        if(result) {
            httpSession.setAttribute("doctor", "ok");
            resp.sendRedirect("home");
        }
        else {
            httpSession.setAttribute("doctor", "failed");
            resp.sendRedirect("register");
        }

    }
}
