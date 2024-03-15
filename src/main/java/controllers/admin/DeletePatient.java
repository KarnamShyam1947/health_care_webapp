package controllers.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.PatientDAO;
import utils.HibernateUtils;

@WebServlet("/delete-patient")
public class DeletePatient extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int doctorId = Integer.parseInt(req.getParameter("patient-id"));
        String next = req.getParameter("next");
        
        new PatientDAO(HibernateUtils.getSessionFactory()).deletePatient(doctorId);
        req.getSession().setAttribute("delete-patient", "ok");

        resp.sendRedirect(next);
    }
}
