package controllers.doctor;

import java.io.IOException;

import dao.PatientDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.HibernateUtils;

@WebServlet("/add-records")
@MultipartConfig
public class AddPRecords extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int uid = Integer.parseInt(req.getParameter("uid"));

        req.setAttribute("patient", new PatientDAO(HibernateUtils.getSessionFactory()).getPatient(uid));
        req.setAttribute("user", new UserDAO(HibernateUtils.getSessionFactory()).getUserObject(uid));

        req.getRequestDispatcher("/WEB-INF/views/doctor/add-records.jsp").forward(req, resp);
    }   

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String prescription = req.getParameter("pre");
        String[] urls = req.getParameterValues("urls[]");
        String[] names = req.getParameterValues("names[]");
        int pid = Integer.parseInt(req.getParameterValues("pid")[0]);

        PatientDAO d = new PatientDAO(HibernateUtils.getSessionFactory());
        d.insertRecords(pid, prescription, names, urls);

        req.getSession().setAttribute("ar", "ok");
        resp.sendRedirect("my-patients-list");
    }
}
