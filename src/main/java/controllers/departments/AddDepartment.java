package controllers.departments;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.DepartmentDAO;
import utils.HibernateUtils;

@WebServlet("/add-department")
public class AddDepartment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("path", "/department-add");
        req.getRequestDispatcher("/WEB-INF/views/admin/add-department.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String deptName = req.getParameter("dept-name");
        DepartmentDAO dao = new DepartmentDAO(HibernateUtils.getSessionFactory());

        boolean dept = dao.addDepartment(deptName);

        if(dept) 
            session.setAttribute("dept", "ok");
        
        else
            session.setAttribute("dept", "failed");

        resp.sendRedirect("add-department");
    }
}
