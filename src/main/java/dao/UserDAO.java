package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.google.gson.Gson;

import entities.Department;
import entities.Doctor;
import entities.User;
import utils.MailUtils;
import utils.PasswordUtils;
import utils.TokenUtils;

public class UserDAO {
    SessionFactory sessionFactory;

    public UserDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public int insertUser(String username, String email, String role, String address, String phone, String gender, String profileUrl) {
        try {
            User newUser = new User();

            newUser.setActive(false);
            newUser.setProfileUrl(profileUrl);

            if("Patient".equals(role))
                newUser.setActive(true);
            
            if("".equals(profileUrl) || "undefined".equals(profileUrl) || profileUrl.isEmpty())
                newUser.setProfileUrl("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzCb4DonWw5pT1-A3Su9HzG6TTN4nMOmj7tg&usqp=CAU");
                
            newUser.setUsername(username);
            newUser.setAddress(address);
            newUser.setGender(gender);
            newUser.setPhone(phone);
            newUser.setEmail(email);
            newUser.setRole(role);

            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();

            session.persist(newUser);
            session.flush();
            int uid = newUser.getId();

            transaction.commit();
            session.close();

            return uid;
        } 
        catch (HibernateException e) {
            System.out.println(e);
        }
        return 0;
    }
    
    public User getUserObject(int id) {

        Session session = sessionFactory.openSession();
        User user = session.get(User.class, id);
        session.close();

        return user;
    }
    
    public User getUserByEmail(String email) {

        Session session = sessionFactory.openSession();
        Query<User> query = session.createQuery("from User where email=:em", User.class);
        query.setParameter("em", email);

        User user = query.uniqueResult();

        session.close();

        return user;
    }

    public User isValidToken(String token) {
        try {
            String email = TokenUtils.decode(token);

            Session session = sessionFactory.openSession();
            Query<?> query = session.createQuery("from User where email=:em", User.class);       
            query.setParameter("em", email);

            User user = (User) query.uniqueResult();
            session.close();

            return user;
        } 
        catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public void setPassword(User user, String password) {
        String salt = PasswordUtils.generateSalt(20);
        String hashedPassword = PasswordUtils.hashPassword(password, salt);

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        user.setActive(true);
        user.setSalt(salt);
        user.setPassword(hashedPassword);
        session.merge(user);

        tx.commit();
        session.close();
    }

    // get doctor applications role + status
    public String getDoctorApplications() {
        Session session = sessionFactory.openSession();

        Query<Object[]> query = session.createQuery("select u.username, u.email, u.phone, u.address, d.resumeUrl, u.id user_id, d.id doctor_id, d.department from User u, Doctor d where u.id = d.userId and u.isActive=:st and u.role=:em ", Object[].class);
        query.setParameter("em", "Doctor");
        query.setParameter("st", false);
        List<Object[]> list = query.getResultList();
        List<Map<String, Object>> applications = new ArrayList<>();
        
        for (Object[] objects : list) {
            Map<String, Object> map = new HashMap<>();
            map.put("username", objects[0]);
            map.put("email", objects[1]);
            map.put("phone", objects[2]);
            map.put("address", objects[3]);
            map.put("resumeUrl", objects[4]);
            map.put("userId", objects[5]);
            map.put("doctorId", objects[6]);
            map.put("department", ((Department) objects[7]).getName());

            applications.add(map);
        }
        System.out.println(applications);
        String json = new Gson().toJson(applications);

        session.close();

        return json;
    }

    // get patient applications
    public List<?> getPatientApplications() {
        Session session = sessionFactory.openSession();
        Query<?> query = session.createQuery("from User where role=:em and isActive=:st", Doctor.class);
        query.setParameter("em", "Patient");
        query.setParameter("st", false);
        List<?> list = query.list();

        System.out.println(list);
        session.close();

        return list;
    }

    public User login(String email, String password) {
        Session session = sessionFactory.openSession();
        Query<User> query = session.createQuery("from User where email=:em", User.class);
        query.setParameter("em", email);
        User user = query.uniqueResult();
        session.close();

        if(user == null) 
            return null;

        else {
            boolean status = PasswordUtils.checkPassword(password, user.getPassword(), user.getSalt());
            if(status) 
                return user;

            else 
                return null;
        }
    }

    public boolean SendPasswordSetEmail(int uid) {
        User user = getUserObject(uid);

        if(user != null) {
            String email = user.getEmail();

            String token = TokenUtils.encode(email);
            String[] to = {
                email
            };

            String url = "http://localhost:8080/health_care/verify?token=" + token ;


            boolean status = MailUtils.sendHtmlMail("karnamshyam@gmail.com", "Set your password", to, url, user.getUsername());
            return status;
        }
        return false;
    }

    public void deleteUser(int userId) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        User user = session.get(User.class, userId);
        session.remove(user);
        
        tx.commit();
        session.close();
    }

    public void addAdmin(String username, String email, String password) {
        int uid = insertUser(username, email, "Admin", null, null, null, "");

        User u = getUserObject(uid);

        setPassword(u, password);
    }

}
