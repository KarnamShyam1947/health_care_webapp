<%@tag description="" pageEncoding="UTF-8" %>
<%@tag import="entities.User" %>
<%
    String currentPath = request.getRequestURI();
    User user = (User) session.getAttribute("currentUser");
%>
<div class="container-fluid sticky-top bg-white shadow-sm">
    <div class="container">
        <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0">
            <a href="home" class="navbar-brand">
                <h1 class="m-0 text-uppercase text-primary"><i class="fa fa-clinic-medical me-2"></i>
                    HealthCare
                </h1>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-0">
                    <a 
                        href="home" 
                        class='nav-item nav-link 
                        <% if(currentPath.endsWith("/index.jsp")) {
                            out.print("active");
                        } %> '>
                        Home
                    </a>
                    
                    <a 
                        href="about" 
                        class='nav-item nav-link
                        <% if(currentPath.endsWith("/about")) {
                            out.print("active");
                        } %>'>
                        About
                    </a>

                    <a 
                        href="services" 
                        class='nav-item nav-link 
                        <% if(currentPath.endsWith("services")) {
                            out.print("active");
                        } %>'>
                        Service
                    </a>
                    <a 
                        href="contact" 
                        class='nav-item nav-link
                        <% if(currentPath.endsWith("/contact")) {
                            out.print("active");
                        } %>'>
                        Contact
                    </a>

                    <%
                        if(user == null) {
                            %>
                                <a 
                                    href="login" 
                                    class='nav-item nav-link
                                    <% if(currentPath.endsWith("/login.jsp")) {
                                        out.print("active");
                                    } %>'>
                                    Login
                                </a>
                            <%
                        }
                        else {
                            %>
                                <a href="dashboard" class="nav-item nav-link mt-3 p-0">
                                    <img src="<%= user.getProfileUrl() %>" class="rounded-circle" width="50" height="50" alt="">
                                    <%= user.getUsername() %>
                                </a>
                            <%
                        }
                    %>

                </div>
            </div>
        </nav>
    </div>
</div>