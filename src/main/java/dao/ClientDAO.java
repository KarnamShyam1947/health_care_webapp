package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entities.Client;
import utils.MailUtils;

public class ClientDAO {
    
    private SessionFactory sessionFactory;

    public ClientDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public boolean saveClient(
        String username,
        String userEmail,
        String hospitalName,
        String phoneNumber,
        String hospitalAddress
    ) {
        Client newClient = new Client();

        Client clientByHospitalName = getClientByHospitalName(hospitalName);

        if(clientByHospitalName == null) {
            newClient.setHospitalAddress(hospitalAddress);
            newClient.setHospitalName(hospitalName);
            newClient.setPhoneNumber(phoneNumber);
            newClient.setUserEmail(userEmail);
            newClient.setStatus(false);
            newClient.setUsername(username);

            Session session = sessionFactory.openSession();
            Transaction tx = session.beginTransaction();

            session.persist(newClient);

            tx.commit();
            session.close();

            return true;
        }

        return false;
    }

    public Client getClientByHospitalName(String name) {
        Session session = sessionFactory.openSession();

        Query<Client> query = session
                                .createQuery(
                                    "from Client where hospitalName= :hospitalName", 
                                    Client.class
                                );

        query.setParameter("hospitalName", name);

        Client uniqueResult = query.uniqueResult();

        session.close();
        return uniqueResult;
    }
    
    public List<Client> getClientApplications() {
        Session session = sessionFactory.openSession();

        Query<Client> query = session
                                .createQuery(
                                    "from Client where status= :status", 
                                    Client.class
                                );

        query.setParameter("status", false);
        List<Client> list = query.list();

        session.close();

        return list;
    }
    
    public List<Client> getClients() {
        Session session = sessionFactory.openSession();

        Query<Client> query = session
                                .createQuery(
                                    "from Client where status= :status", 
                                    Client.class
                                );

        query.setParameter("status", true);
        List<Client> list = query.list();

        session.close();

        return list;
    }

    public void deleteClient(int cid) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        Client client = session.get(Client.class, cid);
        session.remove(client);

        tx.commit();
        session.close();
    }

    public Client getClient(int cid) {
        Session session = sessionFactory.openSession();
        Client client = session.get(Client.class, cid);
        session.close();

        return client;
    }

    public void changeStatus(int cid) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        Client client = session.get(Client.class, cid);
        client.setStatus(true);
        session.merge(client);
        
        tx.commit();
        session.close();
    }

    public void sendMailToAllClients(String subject, String html) {
        Session session = sessionFactory.openSession();

        Query<Client> query = session
                                .createQuery(
                                    "from Client", 
                                    Client.class
                                );

        List<Client> list = query.list();
        String[] clientMails = new String[list.size()];

        for (int i = 0; i < clientMails.length; i++) {
            clientMails[i] = list.get(i).getUserEmail();
        }

        MailUtils.sendHtmlMailToClients("karnamshyam1947@gmail.com", subject, clientMails, html);
        session.close();

        return ;
    }

}
