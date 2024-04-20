package entities;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "doctors")
public class Doctor {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    private Department department;

    private int userId;
    private String resumeUrl;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "doctor", cascade=CascadeType.ALL)
    private List<Patient> patients;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "doctor", cascade=CascadeType.ALL)
    private List<Appointment> appointments;

    public Doctor(int userId, Department department) {
        this.userId = userId;
        this.department = department;
    }

    public Doctor(int id, int userId, Department department, List<Patient> patients, List<Appointment> appointments) {
        this.id = id;
        this.userId = userId;
        this.department = department;
        this.patients = patients;
        this.appointments = appointments;
    }

    public Doctor() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public List<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(List<Appointment> appointments) {
        this.appointments = appointments;
    }

    public String getResumeUrl() {
        return resumeUrl;
    }

    public void setResumeUrl(String resumeUrl) {
        this.resumeUrl = resumeUrl;
    }

    public List<Patient> getPatients() {
        return patients;
    }

    public void setPatients(List<Patient> patients) {
        this.patients = patients;
    }

    @Override
    public String toString() {
        return "Doctor [id=" + id + ", department=" + department + ", userId=" + userId + ", resumeUrl=" + resumeUrl
                + "]";
    }

}
