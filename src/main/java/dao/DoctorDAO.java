package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.google.gson.Gson;

import entities.Appointment;
import entities.Department;
import entities.Doctor;
import entities.User;

public class DoctorDAO {
    SessionFactory sessionFactory;
    final static String DOCTOR_HQL = "select u.username, u.email, u.phone, u.address, d.resumeUrl, u.id user_id, d.id doctor_id, d.department, u.profileUrl from User u, Doctor d where u.id = d.userId and u.isActive=:st"; 

    public DoctorDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public boolean apply(String username, String email, String address, String phone, String gender, String department, String profileUrl, String resumeUrl) {
        UserDAO userDAO = new UserDAO(sessionFactory);
        DepartmentDAO dao = new DepartmentDAO(sessionFactory);

        int uid = userDAO.insertUser(username, email, "Doctor", address, phone, gender, profileUrl);
        
        if(uid > 0) {
            Doctor doctor = new Doctor();
            doctor.setUserId(uid);
            
            doctor.setDepartment(dao.getDepartment(Integer.parseInt(department)));
            doctor.setResumeUrl(resumeUrl);

            Session session = sessionFactory.openSession();
            Transaction tx = session.beginTransaction();

            session.persist(doctor); 

            tx.commit();
            session.close();

            return true;
        }

        return false;
    }

    public List<Object[]> getAppointments(int doctorId) {
        Session session = sessionFactory.openSession();

        Query<Appointment> query = session.createQuery("from Appointment where doctor=:em", Appointment.class);
        query.setParameter("em", session.get(Doctor.class, doctorId));
        List<Appointment> list = query.list();
        List<Object[]> appointmentList = new ArrayList<>();

        for (Appointment appointment : list) {
            User user = session.get(User.class, appointment.getPatient().getUserId());
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

    public String getAllDoctors() {
        Session session = sessionFactory.openSession();

        Query<Object[]> query = session.createQuery(DOCTOR_HQL, Object[].class);
        query.setParameter("st", true);
        
		List<Object[]> list = query.list();
        List<Map<String, Object>> doctors = new ArrayList<>();

        for(Object[] object : list) {
            Map<String, Object> map = new HashMap<>();
            map.put("name", object[0]);
            map.put("email", object[1]);
            map.put("phone", object[2]);
            map.put("address", object[3]);
            map.put("resumeUrl", object[4]);
            map.put("user_id", object[5]);
            map.put("doctor_id", object[6]);
            map.put("department",  ((Department) object[7]).getName());
            map.put("profileUrl",  object[8]);

            doctors.add(map);
        }

        String json = new Gson().toJson(doctors);

        return json;		
    }

    public String getDoctorsByDepartmentId(int deptId) {
        
        Session session = sessionFactory.openSession();
        Query<Object[]> query = session.createQuery("from Doctor where department=:dept ", Object[].class);
        query.setParameter("dept", new DepartmentDAO(sessionFactory).getDepartment(deptId));
        List<Object[]> list = query.list();
        List<Map<String, Object>> doctors = new ArrayList<>();

        for (Object[] objects : list) {
            Map<String, Object> map = new HashMap<>();

            int doctorId = ((Doctor)objects[0]).getUserId();
            String username = new UserDAO(sessionFactory).getUserObject(doctorId).getUsername();
            map.put("doctorId", ((Doctor)objects[0]).getId());
            map.put("username", username);

            doctors.add(map);
        }
        String json = new Gson().toJson(doctors);
        System.out.println(json);
        session.close();

        return json;
    }

    public void deleteDoctor(int doctorId) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        Doctor doctor = session.get(Doctor.class, doctorId);
        int userId = doctor.getUserId();

        User user = session.get(User.class, userId);

        session.remove(user);
        session.remove(doctor);
        
        tx.commit();
        session.close();
    }

    public Doctor getDoctor(int userId) {
        Session session = sessionFactory.openSession();

        Query<Doctor> query = session.createQuery("from Doctor where userId=:uid", Doctor.class);
        query.setParameter("uid", userId);
        
        Doctor doctor = query.uniqueResult();

        session.close();

        return doctor;
    }

}
