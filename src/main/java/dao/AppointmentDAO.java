package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.MutationQuery;
import org.hibernate.query.Query;

import entities.Appointment;
import entities.Doctor;
import entities.Patient;

public class AppointmentDAO {
    private SessionFactory sessionFactory;

    public AppointmentDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public boolean makeAppointment(int doctorId, int patientId, String time, String date) {
        try {
            Appointment newAppointment = new Appointment();
            
            Session session = sessionFactory.openSession();
            Doctor doctor = session.get(Doctor.class, doctorId);
            Patient patient = session.get(Patient.class, patientId);

            newAppointment.setDate(date);
            newAppointment.setTime(time);
            newAppointment.setDoctor(doctor);
            newAppointment.setPatient(patient);

            Transaction tx = session.beginTransaction();

            session.persist(newAppointment);
            
            tx.commit();
            session.close();

            return true;
        } 
        catch (HibernateException e) {
            System.out.println(e.toString());
            return false;
        }
    }

    public void getDoctorAppointment(int doctorId) {
        Session session = sessionFactory.openSession();
        Query<Appointment> query = session.createQuery("from Appointment a where  a.doctor=:doc", Appointment.class);
        query.setParameter("doc", session.get(Doctor.class, doctorId));

        List<Appointment> list = query.list();

        for (Appointment objects : list) {
            System.out.println(objects);
        }
        session.close();
    }
    
    public void deleteAppointment(int aid) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        MutationQuery query = session.createMutationQuery("delete from Appointment where id = " + aid);
        query.executeUpdate();

        tx.commit();
        session.close();
    }
}
