package utils;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import entities.Appointment;
import entities.Client;
import entities.Department;
import entities.Doctor;
import entities.Invoice;
import entities.Patient;
import entities.Product;
import entities.Record;
import entities.User;

public class HibernateUtils {
    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        if(sessionFactory == null) {
            Configuration configuration = new Configuration();
            
            configuration.configure();
            configuration.addAnnotatedClass(User.class);
            configuration.addAnnotatedClass(Doctor.class);
            configuration.addAnnotatedClass(Record.class);
            configuration.addAnnotatedClass(Client.class);
            configuration.addAnnotatedClass(Product.class);
            configuration.addAnnotatedClass(Invoice.class);
            configuration.addAnnotatedClass(Patient.class);
            configuration.addAnnotatedClass(Department.class);
            configuration.addAnnotatedClass(Appointment.class);

            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
                                                .applySettings(configuration.getProperties())
                                                .build();

            sessionFactory = configuration.buildSessionFactory(serviceRegistry);
        }
        return sessionFactory;
    }
}
