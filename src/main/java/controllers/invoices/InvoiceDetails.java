package controllers.invoices;

import java.io.IOException;

import dao.InvoiceDAO;
import entities.Invoice;
import entities.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.HibernateUtils;

@WebServlet("/invoice")
public class InvoiceDetails extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int aid = Integer.parseInt(req.getParameter("aid"));
        InvoiceDAO i = new InvoiceDAO(HibernateUtils.getSessionFactory());

        Object[] detailedInvoice = i.getDetailedInvoice(aid);
        req.setAttribute("products", ((Invoice)detailedInvoice[0]).getProducts());
        req.setAttribute("invoice", (Invoice)detailedInvoice[0]);
        req.setAttribute("user", (User)detailedInvoice[1]);

        req.getRequestDispatcher("/WEB-INF/views/patient/invoice.jsp").forward(req, resp);
    }
}
