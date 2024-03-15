package controllers.invoices;

import java.io.IOException;

import dao.InvoiceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.HibernateUtils;

@WebServlet("/pay-invoice")
public class InvoicePay extends HttpServlet {  
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        InvoiceDAO d = new InvoiceDAO(HibernateUtils.getSessionFactory());

        d.payInvoice(id);

        req.getSession().setAttribute("pay", "ok");
        resp.sendRedirect("my-invoices");
    }
}
