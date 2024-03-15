import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/test-ajax")
public class test extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String> options = new LinkedHashMap<>();
        options.put("value1", "label1");
        options.put("value2", "label2");
        options.put("value3", "label3");
        
        Map<String, String> options1 = new LinkedHashMap<>();
        options1.put("value1", "label1");
        options1.put("value2", "label2");
        options1.put("value3", "label3");

        List<Map<String, String>> list = new ArrayList<>();
        list.add(options1);
        list.add(options);

        String json = new Gson().toJson(list);
        System.out.println(req.getServletPath());

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }
}
