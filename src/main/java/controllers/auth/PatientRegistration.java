package controllers.auth;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.PatientDAO;
import dao.UserDAO;
import entities.User;
import utils.HibernateUtils;

@MultipartConfig
@WebServlet("/patient-register")
public class PatientRegistration extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/patient-register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String profileUrl = req.getParameter("profileUrl"); 
        String username = req.getParameter("username"); 
        String password = req.getParameter("password"); 
        String address = req.getParameter("address"); 
        String gender = req.getParameter("gender"); 
        String email = req.getParameter("email"); 
        String phone = req.getParameter("phone"); 
                
        PatientDAO dao = new PatientDAO(HibernateUtils.getSessionFactory());
        boolean apply = dao.apply(username, email, address, phone, gender, profileUrl);

        if(apply) {
            UserDAO uDao = new UserDAO(HibernateUtils.getSessionFactory());
            User user = uDao.getUserByEmail(email);

            uDao.setPassword(user, password);
            session.setAttribute("pr", "ok");
            resp.sendRedirect("login");
        }
        else {
            session.setAttribute("doctor", "failed");
            resp.sendRedirect("patient-register");
        }
    }
}
