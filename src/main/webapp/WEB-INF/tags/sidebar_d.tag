<%@tag description="" pageEncoding="UTF-8" %>
<%@tag import="entities.User" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    String path = (String) request.getAttribute("path");
    String url = (String) request.getServletPath();
%>

<aside class="main-sidebar sidebar-dark-primary elevation-4">

    <a style="text-decoration: none;" href="index3.html" class="brand-link">
        <img src="dist/img/HealthCareLogo.png" alt="HealthCare Logo" class="brand-image img-circle elevation-3"
            style="opacity: .8">
        <span class="brand-text font-weight-light">HealthCare</span>
    </a>

    <div class="sidebar">

        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="<%= currentUser.getProfileUrl() %>" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a style="text-decoration: none;" href="#" class="d-block">
                    <%= currentUser.getUsername() %>
                </a>
            </div>
        </div>


        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                data-accordion="false">

                <li class="nav-item">
                    <a href="dashboard" class='nav-link
                    <% if(path != null && "dashboard".equals(path)) {
                            out.print("active");
                        }  %>'>
                        <i class="nav-icon fas fa-th"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>
                </li>
                
                <li class="nav-item">
                    <a href="appointment-list" class='nav-link
                    <% if(path != null && "appointments".equals(path)) {
                            out.print("active");
                        }  %>'>
                        <i class="nav-icon fas fa-calendar-check"></i>
                        <p>
                            Appointments
                        </p>
                    </a>
                </li>
                
                <li class="nav-item">
                    <a href="my-patients-list" class='nav-link
                    <% if("/my-patients-list".equals(url)) {
                            out.print("active");
                        }  %>'>
                        <i class="nav-icon fas fa-bed"></i>
                        <p>
                            Patients
                        </p>
                    </a>
                </li>

            </ul>
        </nav>

    </div>

</aside>