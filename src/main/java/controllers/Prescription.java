package controllers;

import java.io.IOException;

import dao.PatientDAO;
import dao.UserDAO;
import entities.Patient;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.HibernateUtils;

@WebServlet("/prescription")
public class Prescription extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int uid = Integer.parseInt(req.getParameter("uid"));

        Patient patient = new PatientDAO(HibernateUtils.getSessionFactory()).getPatient(uid);

        req.setAttribute("patient", patient);
        req.setAttribute("user", new UserDAO(HibernateUtils.getSessionFactory()).getUserObject(uid));

        req.getRequestDispatcher("/WEB-INF/views/patient/prescription.jsp").forward(req, resp);
    }
}
