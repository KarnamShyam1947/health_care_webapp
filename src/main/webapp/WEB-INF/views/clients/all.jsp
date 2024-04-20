<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page import="entities.User" %>

<% User currentUser=(User) session.getAttribute("currentUser"); %>

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

    <input type="hidden" id="clientStatus" value="${sessionScope.clientStatus}">
    <c:remove var="clientStatus" scope="session"></c:remove>

    <div class="wrapper">


        <t:navbar_d></t:navbar_d>


        <t:sidebar_a></t:sidebar_a>


        <div class="content-wrapper">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">Clients List</h1>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Clients List</h3>
                                <div class="card-tools">
                                    <div class="input-group input-group-sm" style="width: 400px;">
                                        <input type="text" name="table_search" class="form-control float-right"
                                            placeholder="Search" ng-model="search">
                                    </div>
                                </div>
                            </div>

                            <div class="card-body table-responsive p-0" style="height: 300px;">
                                <table class="table table-head-fixed table-hover text-nowrap">
                                    <thead>
                                        <tr>
                                            <th>SL. NO. </th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Hospital Name</th>
                                            <th>Hospital Address</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${applications}" var="a" varStatus="i">
                                            <tr>
                                                <td>
                                                    <c:out value="${i.index + 1}"></c:out>
                                                </td>
                                                <td>
                                                    <c:out value="${a.username}"></c:out>
                                                </td>
                                                <td>
                                                    <c:out value="${a.userEmail}"></c:out>
                                                </td>
                                                <td>
                                                    <c:out value="${a.phoneNumber}"></c:out>
                                                </td>
                                                <td>
                                                    <c:out value="${a.hospitalName}"></c:out>
                                                </td>
                                                <td>
                                                    <c:out value="${a.hospitalAddress}"></c:out>
                                                </td>
                                                <td>
                                                    
                                                    <a href="#" class="btn btn-danger">Delete</a>
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

        <script>
            let clientStatus = document.getElementById("clientStatus").value;
            if(clientStatus == "ok") {
                swal("Success", "Client request accepted successfully", "success")
            }
            if(clientStatus == "failed") {
                swal("Success", "Client request rejected successfully", "info")
            }
            
        </script>
    </div>
</body>

</html>