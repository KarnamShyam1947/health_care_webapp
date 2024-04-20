package controllers.api;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.DepartmentDAO;
import utils.HibernateUtils;

@WebServlet("/api/all-departments")
public class AllDepartments extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();

        String json = new DepartmentDAO(HibernateUtils.getSessionFactory()).getAllDepartments();
        out.write(json);

        out.close();
    }
}
