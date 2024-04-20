package controllers.invoices;

import java.io.IOException;

import dao.InvoiceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.HibernateUtils;

@WebServlet("/delete-invoice")
public class DeleteInvoice extends HttpServlet {  
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        InvoiceDAO d = new InvoiceDAO(HibernateUtils.getSessionFactory());

        d.deleteInvoice(id);

        req.getSession().setAttribute("di", "ok");
        resp.sendRedirect("all-invoices");
    }
}
