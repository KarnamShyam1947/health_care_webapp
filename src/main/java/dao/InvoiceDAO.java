package dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.MutationQuery;
import org.hibernate.query.Query;

import entities.Invoice;
import entities.Patient;
import entities.Product;
import entities.User;

public class InvoiceDAO {
    SessionFactory sessionFactory;

    public InvoiceDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addInvoice(int patientId, String gst, String discount, String[] name, String[] des, String[] price, String[] qty) {
        double amount = 0;

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        Patient patient = session.get(Patient.class, patientId);
        List<Product> products = new ArrayList<>();

        Invoice invoice = new Invoice();
        invoice.setStatus(false);
        invoice.setDiscount(discount);
        invoice.setPatient(patient);
        invoice.setGst(gst);
        invoice.setDate(new Date());
        
        Calendar c = Calendar.getInstance();
        c.setTime(new Date()); 
        c.add(Calendar.DATE, 5); 
        c.getTime();

        invoice.setDueDate(c.getTime());

        for (int i = 0; i < qty.length; i++) {
            Product product = new Product();

            product.setDescription(des[i]);
            product.setName(name[i]);
            product.setQuantity(qty[i]);
            product.setPricePerOne(price[i]);
            product.setInvoice(invoice);

            products.add(product);

            session.persist(product);

            double p = (Double) Double.parseDouble(price[i]); 
            double q = (Double) Double.parseDouble(qty[i]);
            
            amount += q * p;
        }

        double gstAmount = amount * ((Double.parseDouble(gst)) / 100);
        double disAmount = amount * ((Double.parseDouble(discount)) / 100);

        amount = amount + gstAmount - disAmount;

        invoice.setAmount(amount+"");
        invoice.setProducts(products);

        session.persist(invoice);

        tx.commit();
        session.close();
    }

    public List<Invoice> getAllInvoices() {
        Session session = sessionFactory.openSession();
        Query<Invoice> query = session.createQuery("from Invoice", Invoice.class);
        
        List<Invoice> list = query.list();
        for (Invoice invoice : list) {
            System.out.println(invoice);
        }

        session.close();

        return list;
    }

    public Object[] getDetailedInvoice(int invoiceId) {
        Session session = sessionFactory.openSession();

        Invoice invoice = session.get(Invoice.class, invoiceId);
        User user = new UserDAO(sessionFactory).getUserObject(invoice.getPatient().getUserId());

        Object[] objects = new Object[2];
        objects[0] = invoice;
        objects[1] = user;

        session.close();

        return objects;
    }

    public void payInvoice(int iid) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        Invoice invoice = session.get(Invoice.class, iid);
        invoice.setStatus(true);
        session.merge(invoice);
        
        tx.commit();
        session.close();
    }
    
    public void deleteInvoice(int iid) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        Invoice invoice = session.get(Invoice.class, iid);
        for (Product product : invoice.getProducts()) {
            MutationQuery query = session.createMutationQuery("delete from Product where id=:id");
            query.setParameter("id", product.getId());

            query.executeUpdate();
        }
        
        MutationQuery query = session.createMutationQuery("delete from Invoice where id=:id");
        query.setParameter("id", iid);

        query.executeUpdate();
        
        tx.commit();
        session.close();
    }
    
}
