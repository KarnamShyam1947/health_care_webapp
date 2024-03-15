package controllers;

import java.io.IOException;

import entities.Doctor;
import entities.Patient;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/dashboard")
public class Dashboard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        req.setAttribute("path", "dashboard");

        if(session.getAttribute("currentPatient") != null) {
            Patient p = (Patient) session.getAttribute("currentPatient");
            int appointments = p.getAppointments().size();
            int invoices = p.getInvoices().size();

            req.setAttribute("appointments", appointments);
            req.setAttribute("invoices", invoices);

            req.getRequestDispatcher("/WEB-INF/views/patient/index.jsp").forward(req, resp);
        }

        if(session.getAttribute("currentDoctor") != null) {
            Doctor d = (Doctor) session.getAttribute("currentDoctor");
            int appointments = d.getAppointments().size();
            int patients = d.getPatients().size();

            req.setAttribute("appointments", appointments);
            req.setAttribute("patients", patients);

            req.getRequestDispatcher("/WEB-INF/views/doctor/index.jsp").forward(req, resp);
        }

        if(session.getAttribute("admin-user") != null)
            req.getRequestDispatcher("/WEB-INF/views/admin/index.jsp").forward(req, resp);
    
    }
}
