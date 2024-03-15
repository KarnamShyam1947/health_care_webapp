package controllers.invoices;

import java.io.IOException;

import dao.InvoiceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.HibernateUtils;

@WebServlet("/add-invoice")
public class AddInvoice extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("path", "invoice-add");
        req.getRequestDispatcher("/WEB-INF/views/patient/add-invoice.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int patientId = Integer.parseInt(req.getParameter("patient-id"));
        String gst = req.getParameter("gst");
        String discount = req.getParameter("discount");
        String[] names = req.getParameterValues("name[]");
        String[] des = req.getParameterValues("des[]");
        String[] qts = req.getParameterValues("qty[]");
        String[] prices = req.getParameterValues("price[]");

        InvoiceDAO dao = new InvoiceDAO(HibernateUtils.getSessionFactory());
        dao.addInvoice(patientId, gst, discount, names, des, prices, qts);

        req.getSession().setAttribute("invoice", "ok");

        resp.sendRedirect("add-invoice");
    }
}
