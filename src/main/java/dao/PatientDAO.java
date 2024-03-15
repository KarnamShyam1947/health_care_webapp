package dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.MutationQuery;
import org.hibernate.query.Query;

import com.google.gson.Gson;

import entities.Appointment;
import entities.Doctor;
import entities.Patient;
import entities.Record;
import entities.User;
import utils.HibernateUtils;

public class PatientDAO {
    SessionFactory sessionFactory;
    final static String DOCTOR_HQL = "select u.username, u.email, u.phone, u.address, u.id user_id, d.id patient_id from User u, Patient d where u.id = d.userId and u.isActive=:st"; 
    final static String PATIENT_DOCTOR_HQL = "select u.username, u.email, u.phone, u.address, u.id user_id, d.id patient_id from User u, Patient d where u.id = d.userId and u.isActive=:st and d.doctor=:doc"; 

    public PatientDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public boolean apply(String username, String email, String address, String phone, String gender, String profileUrl) {
        UserDAO userDAO = new UserDAO(sessionFactory);
        int uid = userDAO.insertUser(username, email, "Patient", address, phone, gender, profileUrl);
        
        if(uid > 0) {
            Patient patient = new Patient();
            patient.setUserId(uid);

            Session session = sessionFactory.openSession();
            Transaction tx = session.beginTransaction();

            session.persist(patient);

            tx.commit();
            session.close();

            return true;
        }

        return false;
    }

    public List<Object[]> getAppointments(int patientId) {
        Session session = sessionFactory.openSession();

        Query<Appointment> query = session.createQuery("from Appointment where patient=:em", Appointment.class);
        query.setParameter("em", session.get(Patient.class, patientId));
        List<Appointment> list = query.list();
        List<Object[]> appointmentList = new ArrayList<>();

        for (Appointment appointment : list) {
            User user = session.get(User.class, appointment.getDoctor().getUserId());
            Object[] objects = new Object[8];

            objects[0] = appointment.getId();
            objects[1] = appointment.getTime();
            objects[2] = appointment.getDate();
            objects[3] = user.getUsername();
            objects[4] = user.getEmail();
            objects[5] = user.getAddress();
            objects[6] = user.getPhone();
            objects[7] = appointment.getDoctor().getDepartment().getName();

            appointmentList.add(objects);
        }
        session.close();

        return appointmentList;
    }


    public String getAllPatients() {
        Session session = sessionFactory.openSession();

        Query<Object[]> query = session.createQuery(DOCTOR_HQL, Object[].class);
        query.setParameter("st", true);
        
		List<Object[]> list = query.list();
        for (Object[] objects : list) {
            System.out.println(Arrays.toString(objects));
        }
        List<Map<String, Object>> doctors = new ArrayList<>();

        for(Object[] object : list) {
            Map<String, Object> map = new HashMap<>();
            map.put("name", object[0]);
            map.put("email", object[1]);
            map.put("phone", object[2]);
            map.put("address", object[3]);
            map.put("user_id", object[4]);
            map.put("patient_id", object[5]);

            doctors.add(map);
        }

        String json = new Gson().toJson(doctors);

        return json;		
    }

    public Patient getPatient(int userId) {
        Session session = sessionFactory.openSession();

        Query<Patient> query = session.createQuery("from Patient where userId=:uid", Patient.class);
        query.setParameter("uid", userId);
        
        Patient patient = query.uniqueResult();

        session.close();

        return patient;
    }

    public void assignDoctor(int patientId, int doctorId) {
        Session session = sessionFactory.openSession();
        
        Patient patient = session.get(Patient.class, patientId);
        Doctor doctor = session.get(Doctor.class, doctorId);

        Transaction tx = session.beginTransaction();
        patient.setDoctor(doctor);
        tx.commit();
        session.close();
    }

    public String getPatientByDoctors(int doctorId) {
        Session session = sessionFactory.openSession();
        Doctor doctor = session.get(Doctor.class, doctorId);
        System.out.println(doctor);
        
        Query<Object[]> query = session.createQuery(PATIENT_DOCTOR_HQL, Object[].class);
        query.setParameter("doc", doctor);
        query.setParameter("st", true);

        List<Object[]> list = query.list();
        List<Map<String, Object>> patients = new ArrayList<>();

        for (Object[] objects : list) {
            Map<String, Object> map = new HashMap<>();

            map.put("name", objects[0]);
            map.put("email", objects[1]);
            map.put("phone", objects[2]);
            map.put("Address", objects[3]);
            map.put("user_id", objects[4]);
            map.put("patient_id", objects[5]);

            patients.add(map);
        }

        String json = new Gson().toJson(patients);
        System.out.println(json);

        session.close();

        return json;
    }

    public void deletePatient(int patientId) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        
        Patient patient = session.get(Patient.class, patientId);
        User user = session.get(User.class, patient.getUserId());
        session.remove(user);
        session.remove(patient);

        tx.commit();
        session.close();
    }

    public void insertRecords(int patientId, String prescription, String[] names, String[] urls) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        Patient patient = session.get(Patient.class, patientId);

        if (prescription.trim() != "") {
            patient.setPrescription(prescription);
            patient.setUpdatedOn(new Date());
        }

        for (int i = 0; i < urls.length; i++) {
            Record newRecord = new Record();

            newRecord.setName(names[i]);
            newRecord.setUrls(urls[i]);
            newRecord.setPatient(patient);
            newRecord.setUpdatedOn(new Date());

            session.persist(newRecord);
        }

        tx.commit();
        session.close();
    }

    public boolean deleteRecord(int patientId, int recordId) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        MutationQuery query = session.createMutationQuery("delete from Record where id =: id and patient =: p");
        query.setParameter("id", recordId);
        query.setParameter("p", session.get(Patient.class, patientId));

        int result = query.executeUpdate();

        tx.commit();
        session.close();

        if(result > 0)
            return true;

        return false;
    }
    
    public static void main(String[] args) {
        new PatientDAO(HibernateUtils.getSessionFactory()).deleteRecord(2, 13);
    }
}
