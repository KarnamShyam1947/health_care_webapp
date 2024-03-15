package utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

import com.google.gson.Gson;

public class TokenUtils {

    public static String encode(String string) {
        Encoder encoder = Base64.getEncoder();
        return encoder.encodeToString(string.getBytes());
    }

    public static String decode(String text) {
        Decoder decoder = Base64.getDecoder();
        byte[] bytes = decoder.decode(text);
        return new String(bytes);
    }

    public static String getStringFromObject(Object obj) {
        try {
            Gson gson = new Gson();
            String objJson = gson.toJson(obj);
            String encodedObj = URLEncoder.encode(objJson, "UTF-8");
            return encodedObj;
        } 
        catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static Object getObjectFromString(String encodedString, Class<?> cls) {
        try {
            Gson g = new Gson();
            String decode = URLDecoder.decode(encodedString, "UTF-8");
            Object obj = g.fromJson(decode, cls);
            
            return obj;
        } 
        catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

}
