import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import entities.Invoice;
import entities.Patient;
import utils.HibernateUtils;

public class App {
    public static void main(String[] args) {
        // int patientId = 1;
        // String gst = "3";
        // String discount = "2";
        // String[] name = {"name1", "name2"};
        // String[] des = {"des1", "des2"};
        // String[] qty = {"1", "2"};
        // String[] price = {"1000", "2000"};

        // UserDAO dao = new UserDAO(HibernateUtils.getSessionFactory());
        // dao.addAdmin("Admin", "admin.healthcare@gmail.com", "admin");

        // InvoiceDAO d = new InvoiceDAO(HibernateUtils.getSessionFactory());
        // d.addInvoice(patientId, gst, discount, name, des, price, qty);
        // d.getAllInvoices();
        // d.getInvoiceByPatientId(3);

        SessionFactory f = HibernateUtils.getSessionFactory();
        Session s = f.openSession();
        Patient p = s.get(Patient.class, 3);
        List<Invoice> invoices = p.getInvoices();
        System.out.println(invoices);
        s.close();
        f.close();
        
    }
}
