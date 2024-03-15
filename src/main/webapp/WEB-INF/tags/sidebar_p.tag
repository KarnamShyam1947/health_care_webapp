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
                    <% if("dashboard".equals(path)) {
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
                    <% if("appointments".equals(path)) {
                            out.print("active");
                        }  %>'>
                        <i class="nav-icon fas fa-calendar-check"></i>
                        <p>
                            Appointments
                        </p>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="my-invoices" class='nav-link 
                    <% if("my-invoice".equals(path)) {
                            out.print("active");
                        }  %>'> 
                        <i class="nav-icon fas fa-file-invoice-dollar"></i>
                        <p>
                            Invoices
                        </p>
                    </a>
                </li>
                
                <li class="nav-item">
                    <a href="view-records?uid=<%= currentUser.getId() %>" class='nav-link 
                    <% if("view-records".equals(path)) {
                            out.print("active");
                        }  %>'> 
                        <i class="nav-icon fas fa-user"></i>
                        <p>
                            My Details
                        </p>
                    </a>
                </li>

            </ul>
        </nav>

    </div>

</aside>