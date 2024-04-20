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

import entities.Department;

public class DepartmentDAO {
    SessionFactory factory;

    public DepartmentDAO(SessionFactory factory) {
        this.factory = factory;
    }
    
    public Department getDepartment(int deptId) {
        Session session = factory.openSession();
        Department department = session.get(Department.class, deptId);
        session.close();

        return department;
    }

    public boolean addDepartment(String name) {
        try {
            Department department = new Department();
            department.setName(name);

            Session session = factory.openSession();
            Transaction tx = session.beginTransaction();
            session.persist(department);
            tx.commit();
            session.close();
            return true;
        }
        catch(Exception e) {
            return false;
        }
    }

    public String getAllDepartments() {
        Session session = factory.openSession();
        Query<Department> query = session.createQuery("from Department", Department.class);
        List<Department> list = query.list();
        List<Map<String, Object>> departments = new ArrayList<>();

        System.out.println(list);
        
        for (Department department : list) {
            Map<String, Object> map = new HashMap<>();
            map.put("id", department.getId());
            map.put("name", department.getName());
            map.put("noOfDoctors", department.getDoctors().size());
            
            departments.add(map);
        }

        String json = new Gson().toJson(departments);
        System.out.println(json);

        return json;
    }

    
}
