package controllers.invoices;

import java.io.IOException;
import java.util.List;

import dao.InvoiceDAO;
import entities.Invoice;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.HibernateUtils;

@WebServlet("/all-invoices")
public class AllInvoices extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        InvoiceDAO dao = new InvoiceDAO(HibernateUtils.getSessionFactory());
        List<Invoice>allInvoices = dao.getAllInvoices();

        req.setAttribute("path", "invoice-list");
        req.setAttribute("invoices", allInvoices);
        
        req.getRequestDispatcher("/WEB-INF/views/all-invoices.jsp").forward(req, resp);
    }
}
