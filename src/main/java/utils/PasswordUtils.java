package utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

public class PasswordUtils {
    public static String hashPassword(String password, String salt) {

        MessageDigest messageDigest;
        StringBuilder hashedPassword = new StringBuilder();
        password = preparePassword(password, salt);

        try {
            messageDigest = MessageDigest.getInstance("SHA-256");
            messageDigest.update(password.getBytes());
            byte[] passwordBytes = messageDigest.digest();
            for(byte b:passwordBytes) {
                hashedPassword.append(String.format("%02x", b));
            }
        }
        catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        return hashedPassword.toString();
    }

    public static boolean checkPassword(String password, String hash, String salt) {
        String hashPassword = hashPassword(password, salt);
        return hash.equals(hashPassword);
    }

    public static String preparePassword(String password, String salt) {
        int len = salt.length();
        int i = len / 2;

        String left = salt.substring(0, i);
        String right = salt.substring(i, len);

        String newPassword = left + password + right;

        return newPassword;
    }

    public static String generateSalt(int rounds) {
        Random rn = new Random();

        char[] letters = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
                          'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 
                          'u', 'v', 'w', 'x', 'y', 'z'};

        StringBuilder salt = new StringBuilder();

        for(int i = 0; i < rounds; i++) {
            int r = rn.nextInt(25);
            salt.append(letters[r]);
        }

        return salt.toString();
    }     
}