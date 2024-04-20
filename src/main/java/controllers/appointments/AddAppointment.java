package controllers.appointments;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.AppointmentDAO;
import entities.Patient;
import entities.User;
import utils.HibernateUtils;

@WebServlet("/add-appointment")
public class AddAppointment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Patient currentPatient = (Patient) session.getAttribute("currentPatient");
        User currentUser = (User) session.getAttribute("currentUser");

        if(currentUser != null && currentPatient == null) {
            session.setAttribute("auth", "ok");
            resp.sendRedirect("services");
        }

        if(currentPatient == null) 
            resp.sendRedirect("login?next=add-appointment");
        
        else
            req.getRequestDispatcher("/WEB-INF/views/appointment.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        AppointmentDAO dao = new AppointmentDAO(HibernateUtils.getSessionFactory());

        String date = req.getParameter("date");
        String time = req.getParameter("time");
        int doctorId = Integer.parseInt(req.getParameter("doctor"));
        int patientId = ((Patient) session.getAttribute("currentPatient")).getId();
        boolean appointment = dao.makeAppointment(doctorId, patientId, time, date);

        if(appointment) 
            session.setAttribute("add-appointment", "ok");
            
        else
            session.setAttribute("add-appointment", "failed");

        resp.sendRedirect("add-appointment");
    }
}
