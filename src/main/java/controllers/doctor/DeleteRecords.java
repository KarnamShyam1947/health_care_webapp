package controllers.doctor;

import java.io.IOException;

import dao.PatientDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.HibernateUtils;

@WebServlet("/delete-record")
public class DeleteRecords extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int patientId = Integer.parseInt(req.getParameter("pid"));
        int recordId = Integer.parseInt(req.getParameter("rid"));
        int userId = Integer.parseInt(req.getParameter("uid"));

        PatientDAO dao = new PatientDAO(HibernateUtils.getSessionFactory());

        boolean res = dao.deleteRecord(patientId, recordId);

        if(res)
            req.getSession().setAttribute("recordDelete", "ok");
            
        else
            req.getSession().setAttribute("recordDelete", "fail");
            
        resp.sendRedirect("view-records?uid=" + userId);
    }
}
