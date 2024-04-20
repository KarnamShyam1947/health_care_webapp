package controllers.admin;

import java.io.IOException;

import dao.PatientDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.HibernateUtils;

@WebServlet("/assign-doctor")
public class AssignDoctor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("path", "/assign-doctor");
        req.getRequestDispatcher("/WEB-INF/views/admin/assign-doctor.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PatientDAO dao = new PatientDAO(HibernateUtils.getSessionFactory());
        int patientId = Integer.parseInt(req.getParameter("patientId"));
        int doctorId = Integer.parseInt(req.getParameter("doctorId"));
        System.out.println(patientId);
        System.out.println(doctorId);

        dao.assignDoctor(patientId, doctorId);

        req.getSession().setAttribute("assign", "ok");

        resp.sendRedirect("assign-doctor");
    }
}
