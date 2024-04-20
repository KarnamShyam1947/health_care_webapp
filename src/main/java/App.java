import java.util.List;

import dao.ClientDAO;
import entities.Client;
import utils.HibernateUtils;

public class App {
    public static void main(String[] args) {
        // String username="shyam";
        // String userEmail="karnamshyam1947@gmail.com";
        // String hospitalName="ABC";
        // String hospitalAddress="DEF";

        ClientDAO clientDAO = new ClientDAO(HibernateUtils.getSessionFactory());

        // boolean saveClient = clientDAO.saveClient(username, userEmail, hospitalName, hospitalAddress);
        // if (saveClient)
        //     System.out.println("Registered");
        
        // else
        //     System.out.println("failed");        

        List<Client> clientApplications = clientDAO.getClientApplications();
        System.out.println(clientApplications);
    }
}
