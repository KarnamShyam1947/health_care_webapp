package controllers.api;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import dao.DoctorDAO;
import utils.HibernateUtils;

@WebServlet("/api/all-doctors")
public class AllDoctors extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        PrintWriter out = resp.getWriter();
        String json = "";
        String deptString = req.getParameter("dept-id");

        
        json = new DoctorDAO(HibernateUtils.getSessionFactory()).getAllDoctors();
        
        if(deptString != null) {
            int deptId = Integer.parseInt(deptString);
            json = new DoctorDAO(HibernateUtils.getSessionFactory()).getDoctorsByDepartmentId(deptId);
        }

        out.write(json);

        out.close();
    }
}
