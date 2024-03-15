package controllers.appointments;

import java.io.IOException;
import java.util.List;

import dao.DoctorDAO;
import dao.PatientDAO;
import entities.Doctor;
import entities.Patient;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.HibernateUtils;

@WebServlet("/appointment-list")
public class Appointments extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        req.setAttribute("path", "appointments");

        if(session.getAttribute("currentUser") == null) {
            resp.sendRedirect("login?next="+req.getServletPath().substring(1));
        }

        if(session.getAttribute("currentPatient") != null) {
            Patient patient = (Patient) session.getAttribute("currentPatient");
            List<Object[]> appointments = new PatientDAO(HibernateUtils.getSessionFactory()).getAppointments(patient.getId());
            req.setAttribute("appointments", appointments);
            req.getRequestDispatcher("/WEB-INF/views/patient/appointment.jsp").forward(req, resp);
        }
        
        if(session.getAttribute("currentDoctor") != null) {
            Doctor doctor = (Doctor) session.getAttribute("currentDoctor");
            List<Object[]> appointments = new DoctorDAO(HibernateUtils.getSessionFactory()).getAppointments(doctor.getId());
            req.setAttribute("appointments", appointments);
            req.getRequestDispatcher("/WEB-INF/views/doctor/appointment.jsp").forward(req, resp);
        }
    }
}
