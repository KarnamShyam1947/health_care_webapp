package controllers.auth;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.DoctorDAO;
import dao.PatientDAO;
import dao.UserDAO;
import entities.Doctor;
import entities.Patient;
import entities.User;
import utils.HibernateUtils;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String next = req.getParameter("next");

        UserDAO dao = new UserDAO(HibernateUtils.getSessionFactory());
        User user = dao.login(username, password);

        if(user == null) {
            session.setAttribute("login", "failed");
            resp.sendRedirect("login");
        }
        else {
            if("Patient".equals(user.getRole())) {
                Patient patient = new PatientDAO(HibernateUtils.getSessionFactory()).getPatient(user.getId());
                session.setAttribute("currentPatient", patient);
            }
            if("Doctor".equals(user.getRole())) {
                Doctor doctor = new DoctorDAO(HibernateUtils.getSessionFactory()).getDoctor(user.getId());
                System.out.println(doctor);
                session.setAttribute("currentDoctor", doctor);
            }
            if("Admin".equals(user.getRole())) {
                session.setAttribute("admin-user", true);
            }
            session.setAttribute("currentUser", user);

            if("".equals(next))
                resp.sendRedirect("home");
            
            else
                resp.sendRedirect(next);
        }
    }
}
