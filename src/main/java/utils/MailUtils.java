package utils;

import java.io.File;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import entities.Client;

public class MailUtils {

    static Properties mailProperties = new Properties();

    public static Session getMailSession() {

        Properties properties = System.getProperties();

        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                Properties mailProperties = new Properties();
                try {
                    mailProperties.load(MailUtils.class.getClassLoader().getResourceAsStream("mail.properties"));
                    String email = mailProperties.getProperty("mail.id");
                    String password = mailProperties.getProperty("mail.password");
                    return new PasswordAuthentication(email, password);
                } 
                catch (IOException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        });

        session.setDebug(true);
        return session;
    }

    public static boolean sendMessage(String from, String subject, String[] to, String message) {
        Session session = getMailSession();

        MimeMessage m = new MimeMessage(session);

        try {
            m.setFrom(from);

            for (int i = 0; i < to.length; i++) {
                m.addRecipient(Message.RecipientType.TO, new InternetAddress(to[i]));
            }

            m.setSubject(subject);
            m.setText(message);

            Transport.send(m);

            System.out.println("Sent success...................");
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    public static boolean sendHtmlMail(String from, String subject, String[] to, String url, String username) {
        try {
            Session session = getMailSession();

            MimeMessage m = new MimeMessage(session);

            MimeMultipart mimeMultipart = new MimeMultipart();
            MimeBodyPart htmlBodyPart = new MimeBodyPart();

            String html = "Hello &nbsp;"
                    + username + "<br>"
                    + "&nbsp; &nbsp; &nbsp; I hope this email finds you well. We are very happy to appoint you in your hospital. <br>"
                    + "please click the following link to set your password<br>"
                    + "<br>"
                    + url
                    + "<br><br>"
                    + "Thanking you<br>"
                    + "Team HealthCare";

            htmlBodyPart.setContent(html, "text/html");

            for (int i = 0; i < to.length; i++) {
                m.addRecipient(Message.RecipientType.TO, new InternetAddress(to[i]));
            }

            mimeMultipart.addBodyPart(htmlBodyPart);

            m.setContent(mimeMultipart);
            m.setSubject(subject);
            m.setFrom(from);
            Transport.send(m);
            return true;
        } catch (MessagingException e) {
            System.out.println(e);
            return false;
        }
    }

    public static boolean sendMessageWithAttachments(String from, String subject, String[] to, String message,
            String[] paths) {
        try {
            Session session = getMailSession();

            MimeMessage m = new MimeMessage(session);

            m.setSubject(subject);
            m.setFrom(from);

            for (int i = 0; i < to.length; i++) {
                m.addRecipient(Message.RecipientType.TO, new InternetAddress(to[i]));
            }

            MimeMultipart mimeMultipart = new MimeMultipart();

            MimeBodyPart textMime = new MimeBodyPart();
            textMime.setText(message);

            MimeBodyPart fileMime = new MimeBodyPart();
            for (int i = 0; i < paths.length; i++) {
                try {
                    File file = new File(paths[i]);
                    fileMime.attachFile(file);
                } catch (IOException e) {
                    System.out.println(e);
                }
            }

            mimeMultipart.addBodyPart(textMime);
            mimeMultipart.addBodyPart(fileMime);
            m.setContent(mimeMultipart);

            Transport.send(m);

            return true;
        } catch (MessagingException e) {
            System.out.println(e);
            return false;
        }
    }

    public static boolean sendAcceptOrRejectMail(String from, String[] to, boolean accept, Client client) {
        try {
            Session session = getMailSession();
            String html;
            MimeMessage m = new MimeMessage(session);

            MimeMultipart mimeMultipart = new MimeMultipart();
            MimeBodyPart htmlBodyPart = new MimeBodyPart();

            if (accept) {
                m.setSubject("Your request as client is accepted");
                html = "<p>Dear " + client.getUsername() + ",</p>\n" +
                        "<p>I hope this email finds you well.</p>\n" +
                        "<p>I am writing to confirm that we have received and processed your request." +
                        "We are pleased to inform you that your request has been accepted and will be acted upon accordingly.</p>\n"
                        +
                        "<p>If you have any further questions fell free to contact us</p>" +
                        "<br><br>" +
                        "Thanking you<br>" +
                        "Team HealthCare";

            }

            else {
                m.setSubject("Your request as client is rejected.");
                html = "<p>Dear " + client.getUsername() + ",</p>\n" +
                        "<p>I hope this email finds you well.</p>\n" +
                        "<p>I am writing to confirm that we have received and processed your request." +
                        "we are sorry to inform you that your hospital doesn't match our requirement. So we rejected your request\n"
                        +
                        "<p>If you have any further questions fell free to contact us</p>" +
                        "<br><br>" +
                        "Thanking you<br>" +
                        "Team HealthCare";
            }

            htmlBodyPart.setContent(html, "text/html");

            for (int i = 0; i < to.length; i++) {
                m.addRecipient(Message.RecipientType.TO, new InternetAddress(to[i]));
            }

            mimeMultipart.addBodyPart(htmlBodyPart);

            m.setContent(mimeMultipart);
            m.setFrom(from);
            Transport.send(m);
            return true;
        } catch (MessagingException e) {
            System.out.println(e);
            return false;
        }
    }

    public static boolean sendHtmlMailToClients(String from, String subject, String[] to, String html) {
        try {
            Session session = getMailSession();

            MimeMessage m = new MimeMessage(session);

            MimeMultipart mimeMultipart = new MimeMultipart();
            MimeBodyPart htmlBodyPart = new MimeBodyPart();

            // String htmlString = "Hello," +
            //                     html +
            //                     "<br>Thanking You"+
            //                     "<br>Team HealthCare";

            htmlBodyPart.setContent(html, "text/html");

            for (int i = 0; i < to.length; i++) {
                m.addRecipient(Message.RecipientType.TO, new InternetAddress(to[i]));
            }

            mimeMultipart.addBodyPart(htmlBodyPart);

            m.setContent(mimeMultipart);
            m.setSubject(subject);
            m.setFrom(from);
            Transport.send(m);
            return true;
        } catch (MessagingException e) {
            System.out.println(e);
            return false;
        }
    }

}
