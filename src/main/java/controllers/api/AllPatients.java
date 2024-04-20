package controllers.api;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.PatientDAO;
import utils.HibernateUtils;

@WebServlet("/api/all-patients")
public class AllPatients extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        String json = "";
        String doctorString = req.getParameter("doctor-id");

        json = new PatientDAO(HibernateUtils.getSessionFactory()).getAllPatients();

        if(doctorString != null) {
            int doctorId = Integer.parseInt(doctorString);
            json = new PatientDAO(HibernateUtils.getSessionFactory()).getPatientByDoctors(doctorId);
        }

        resp.getWriter().write(json);
    }
}
