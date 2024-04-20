package controllers.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.DoctorDAO;
import utils.HibernateUtils;

@WebServlet("/delete-doctor")
public class DeleteDoctor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int doctorId = Integer.parseInt(req.getParameter("doctor-id"));
        String next = req.getParameter("next");
        
        new DoctorDAO(HibernateUtils.getSessionFactory()).deleteDoctor(doctorId);
        req.getSession().setAttribute("doctor-delete", "ok");

        resp.sendRedirect(next);
    }
}
