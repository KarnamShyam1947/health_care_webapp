package controllers.appointments;

import java.io.IOException;

import dao.AppointmentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.HibernateUtils;

@WebServlet("/delete-appointment")
public class DeleteAppointment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer aid = Integer.parseInt(req.getParameter("aid"));
        AppointmentDAO dao = new AppointmentDAO(HibernateUtils.getSessionFactory());
        dao.deleteAppointment(aid);

        req.getSession().setAttribute("delete-appointment", "ok");
        resp.sendRedirect("appointment-list");
    }
}
