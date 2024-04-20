package controllers;

import java.io.IOException;
import java.util.List;

import entities.Invoice;
import entities.Patient;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/my-invoices")
public class PatientInvoices extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("currentUser") == null) {
            resp.sendRedirect("login");
        }
        else {
            Patient p = (Patient) session.getAttribute("currentPatient");
            List<Invoice>allInvoices = p.getInvoices();
            
            req.setAttribute("path", "my-invoice");
            req.setAttribute("invoices", allInvoices);
            req.getRequestDispatcher("/WEB-INF/views/patient/invoices.jsp").forward(req, resp);
        }

        
    }
}
