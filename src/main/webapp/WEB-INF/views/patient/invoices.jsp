<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page import="entities.User" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    String in = (String) session.getAttribute("pay");
    session.removeAttribute("pay");
%>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HealthCare</title>

    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">

    <link rel="stylesheet" href="assets/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

    <link rel="stylesheet" href="assets/css/HealthCare.min2167.css">

    <script src="assets/js/angular.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/HealthCare.min2167.js"></script>
    <script src="assets/js/sweetalert.min.js"></script>
</head>

<body class="hold-transition sidebar-mini">
    <input type="hidden" value="<%= in %>" id="in">
    <div class="wrapper">


        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <a href="home" class="nav-link">Home</a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <a href="logout" class="nav-link">logout</a>
                </li>
            </ul>

        </nav>


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
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-th"></i>
                                <p>
                                    Dashboard
                                </p>
                            </a>
                        </li>
                        
                        <li class="nav-item">
                            <a href="appointment-list" class='nav-link'>
                                <i class="nav-icon fas fa-calendar-check"></i>
                                <p>
                                    Appointments
                                </p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="#" class="nav-link active"> 
                                <i class="nav-icon fas fa-file-invoice-dollar"></i>
                                <p>
                                    Invoices
                                </p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="view-records?uid=<%= currentUser.getId() %>" class='nav-link'> 
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


        <div class="content-wrapper">

            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">Invoices List</h1>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">All Invoices</h3>
                            </div>

                            <div class="card-body table-responsive p-0" style="height: 300px;">
                                <table class="table table-head-fixed table-hover text-nowrap">
                                    <thead>
                                        <tr>
                                            <th>SL. NO. </th>
                                            <th>Amount</th>
                                            <th>GST</th>
                                            <th>Discount</th>
                                            <th>Date</th>
                                            <th>Due Date</th>
                                            <th>Status</th>
                                            <th>Number of products</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${invoices}" var="ic" varStatus="i">
                                            <tr>
                                                <td>
                                                    <c:out value="${i.index + 1}"></c:out>
                                                </td>
                                                <td>
                                                    <c:out value="${ic.amount}"></c:out>
                                                </td>
                                                <td>
                                                    <c:out value="${ic.gst}">%</c:out>
                                                </td>
                                                <td>
                                                    <c:out value="${ic.getDiscount()}">%</c:out>
                                                </td>
                                                <td>
                                                    <c:out value="${ic.date}"></c:out>
                                                </td>
                                                <td>
                                                    <c:out value="${ic.dueDate}"></c:out>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${ic.status}">
                                                            <span class="right badge badge-success">Paid</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="right badge badge-danger">Not Paid</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:out value="${ic.getProducts().size()}"></c:out>
                                                </td>
                                                <td>
                                                    <a target="_blank" href="invoice?aid=<c:out value='${ic.id}'></c:out>" class="btn btn-info">View</a>
                                                    <c:choose>
                                                        <c:when test="${ic.status}">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="pay-invoice?id=<c:out value='${ic.id}'></c:out>" class="btn btn-warning">pay</a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>


        <footer class="main-footer">

            <div class="float-right d-none d-sm-inline">
                Anything you want
            </div>

            <strong>Copyright &copy; 2024 <a href="#">HealthCare.com</a>.</strong> All rights reserved.

        </footer>
    </div>

    <script>
        let pay = document.getElementById("in").value;
        if(pay == 'ok') {
            swal("success", "invoice paid successfully", "success");
        }
    </script>
</body>

</html>