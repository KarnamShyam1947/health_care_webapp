package controllers.doctor;

import java.io.IOException;

import dao.PatientDAO;
import dao.UserDAO;
import entities.Patient;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.HibernateUtils;

@WebServlet("/view-records")
public class ViewRecords extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int uid = Integer.parseInt(req.getParameter("uid"));

        Patient patient = new PatientDAO(HibernateUtils.getSessionFactory()).getPatient(uid);

        req.setAttribute("path", "view-records");
        req.setAttribute("patient", patient);
        req.setAttribute("records", patient.getRecords());
        req.setAttribute("user", new UserDAO(HibernateUtils.getSessionFactory()).getUserObject(uid));

        HttpSession session = req.getSession();

        if(session.getAttribute("currentUser") != null) {
            req.setAttribute("path", "view-records");

            if(session.getAttribute("currentPatient") != null) 
                req.getRequestDispatcher("/WEB-INF/views/patient/view-records.jsp").forward(req, resp);

            if(session.getAttribute("currentDoctor") != null) 
                req.getRequestDispatcher("/WEB-INF/views/doctor/view-records.jsp").forward(req, resp);

            if(session.getAttribute("admin-user") != null)
                req.getRequestDispatcher("/WEB-INF/views/admin/view-records.jsp").forward(req, resp);
        }
        
        else {
            resp.sendRedirect("login?next="+req.getServletPath().substring(1));
        }
    }
}
