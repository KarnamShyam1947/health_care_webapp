package filters;

import java.io.IOException;

import entities.User;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/dashboard"})
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = null;
        if (req instanceof HttpServletRequest) {
            request = (HttpServletRequest) req;
        }           

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        if(currentUser == null) {
            HttpServletResponse resp = (HttpServletResponse) response;
            session.setAttribute("auth", "ok");
            resp.sendRedirect("login?next="+request.getServletPath().substring(1));
        }
        else {
            chain.doFilter(request, response);
        }
    }
    
}
