<%@tag description="" pageEncoding="UTF-8" %>
<%@tag import="entities.User" %>
<%
    String url = (String) request.getServletPath();
    String path = (String) request.getAttribute("path");
    User currentUser = (User) session.getAttribute("currentUser");
%>

<aside class="main-sidebar sidebar-dark-primary elevation-4">

    <a style="text-decoration: none;" href="index3.html" class="brand-link">
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
            
                <%-- dashboard  --%>
                <li class="nav-item">
                    <a href="dashboard" class='nav-link 
                        <%
                            if("dashboard".equals(path)) {
                                out.print("active");
                            }
                        %>
                    '>
                        <i class="nav-icon fas fa-th"></i>
                        <p>
                            Dashboard   
                        </p>
                    </a>
                </li>

                <%-- doctor --%>
                <li class='nav-item
                    <%
                        if(url.startsWith("/doc")) {
                            out.print("menu-open");
                        }
                    %>
                '>

                    <a href="#" class='nav-link 
                        <%
                            if(url.startsWith("/doc")) {
                                out.print("active");
                            }
                        %>
                    '>
                        <i class="nav-icon fas fa-user-doctor"></i>
                        <p>
                            Doctors
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>

                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="#" class="nav-link"> <!-- active -->
                                <i class="fas fa-notes-medical nav-icon"></i>
                                <p>Add Doctors</p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="doctors-list" class='nav-link 
                                <%
                                    if("/doctors-list".equals(url)) {
                                        out.print("active");
                                    }
                                %>
                            '> <!-- active -->
                                <i class="fas fa-list nav-icon"></i>
                                <p>Doctors List</p>
                            </a>
                        </li>
                        
                        <li class="nav-item">
                            <a href="doctor-applications" class='nav-link
                                <%
                                    if(url.endsWith("applications")) {
                                        out.print("active");
                                    }
                                %>
                            '>
                                <i class="fas fa-user-nurse nav-icon"></i>
                                <p>Doctors Application</p>
                            </a>
                        </li>
                    </ul>
                </li>
                
                <%-- patient --%>
                <li class='nav-item
                    <%
                        if(url.startsWith("/pat") ||(path != null && path.startsWith("/assign"))) {
                            out.print("menu-open");
                        }
                    %>
                '>
                    
                    <a href="#" class='nav-link 
                        <%
                            if("/patient-list".equals(url) || (path != null && path.startsWith("/assign"))) {
                                out.print("active");
                            }
                        %>'>  
                        <i class="nav-icon fas fa-bed"></i>
                        <p>
                            Patient
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>

                    <ul class="nav nav-treeview">

                        <li class="nav-item">
                            <a href="patient-list" class='nav-link 
                                <%
                                    if("/patient-list".equals(url) || "view-records".equals(path)) {
                                        out.print("active");
                                    }
                                %>
                            '> 
                                <i class="fas fa-list nav-icon"></i>
                                <p>Patient List</p>
                            </a>
                        </li>
                        
                        <li class="nav-item">
                            <a href="assign-doctor" class='nav-link
                                <%
                                    if(path != null && path.startsWith("/assign")) {
                                        out.print("active");
                                    }
                                %>
                            '>
                                <i class="fas fa-people-arrows nav-icon"></i>
                                <p>Assign Doctor</p>
                            </a>
                        </li>
                    </ul>
                </li>
                
                <%-- department --%>
                <li class='nav-item
                    <%
                        if(url.startsWith("/dep") || (path != null && path.startsWith("/dep"))) {
                            out.print("menu-open");
                        }
                    %>
                '>

                    <a href="#" class='nav-link 
                        <%
                            if(url.startsWith("/dep") || (path != null && path.startsWith("/dep"))) {
                                out.print("active");
                            }
                        %>
                    '> <!-- active -->
                        <i class="nav-icon fas fa-graduation-cap"></i>
                        <p>
                            Department
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>

                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="add-department" class='nav-link
                                <%
                                    if("/department-add".equals(path)) {
                                        out.print("active");
                                    }
                                %>
                            '> <!-- active -->
                                <i class="fas fa-notes-medical nav-icon"></i>
                                <p>Add Department</p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="department-list" class='nav-link
                                <%
                                    if("/department-list".equals(url)) {
                                        out.print("active");
                                    }
                                %>
                            '> <!-- active -->
                                <i class="fas fa-list nav-icon"></i>
                                <p>All Departments</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <%-- clients --%>
                <li class='nav-item
                    <%
                        if(path != null && path.startsWith("client")) {
                            out.print("menu-open");
                        }
                    %>
                '>

                    <a href="#" class='nav-link 
                        <%
                            if(path != null && path.startsWith("client")) {
                                out.print("active");
                            }
                        %>
                    '>
                        <i class="nav-icon fas fa-users"></i>
                        <p>
                            Clients
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>

                    <ul class="nav nav-treeview">

                        <li class="nav-item">
                            <a href="clients-list" class='nav-link 
                                <%
                                    if(path != null && "clients-list".equals(path)) {
                                        out.print("active");
                                    }
                                %>
                            '> <!-- active -->
                                <i class="fas fa-list nav-icon"></i>
                                <p>Clients List</p>
                            </a>
                        </li>
                        
                        <li class="nav-item">
                            <a href="client-applications" class='nav-link
                                <%
                                    if(path != null && "clients-applications".equals(path)) {
                                        out.print("active");
                                    }
                                %>
                            '>
                                <i class="fas fa-user-plus nav-icon"></i>
                                <p>Clients Applications</p>
                            </a>
                        </li>
                        
                        <li class="nav-item">
                            <a href="client-send-mail" class='nav-link
                                <%
                                    if(path != null && "client-send-mail".equals(path)) {
                                        out.print("active");
                                    }
                                %>
                            '>
                                <i class="fas fa-th nav-icon"></i>
                                <p>Send Mail</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <%-- invoice --%>
                <li class='nav-item
                    <%
                        if(path != null && path.startsWith("invoice")) {
                            out.print("menu-open");
                        }
                    %> '>

                    <a href="#" class='nav-link
                        <%
                            if(path != null && path.startsWith("invoice")) {
                                out.print("active");
                            }
                        %> '> 

                        <i class="nav-icon fas fa-file-invoice-dollar"></i>
                        <p>
                            Invoice
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>

                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="add-invoice" class='nav-link
                                <%
                                    if("invoice-add".equals(path)) {
                                        out.print("active");
                                    }
                                %> '> 
                                <i class="fas fa-notes-medical nav-icon"></i>
                                <p>Add Invoice</p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="all-invoices" class='nav-link
                                <%
                                    if("invoice-list".equals(path)) {
                                        out.print("active");
                                    }
                                %> '> 
                                <i class="fas fa-list nav-icon"></i>
                                <p>All Invoice</p>
                            </a>
                        </li>
                    </ul>
                </li>
                
            </ul>
        </nav>

    </div>
</aside>