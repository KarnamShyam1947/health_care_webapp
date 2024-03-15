<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>

<%
    String applySession = (String) session.getAttribute("apply");
    String doctor = (String) session.getAttribute("doctor-delete");

    session.removeAttribute("apply");
    session.removeAttribute("doctor-delete");
%>
<input type="hidden" id="apply" value="<%= applySession %>">
<input type="hidden" id="dd" value="<%= doctor %>">

<t:layout_a>
    <div class="content-wrapper" ng-app="my_app" ng-controller="my_ctrl">

        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Doctor Applications</h1>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Applications</h3>
                            <div class="card-tools">
                                <div class="input-group input-group-sm" style="width: 350px;">
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
                                        <th>Department</th>
                                        <th>Address</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="a in application | filter:search">
                                        <td>{{ $index + 1}}</td>
                                        <td>{{ a.username }}</td>
                                        <td>{{ a.email }}</td>
                                        <td>{{ a.phone }}</td>
                                        <td>{{ a.department }}</td>
                                        <td>{{ a.address }}</td>
                                        <td>
                                            <span style="cursor: pointer;" data-toggle="dropdown"> : </span>
                                            <ul class="dropdown-menu">
                                                <li class="dropdown-item"><a href="{{ a.resumeUrl }}">View Resume</a></li>
                                                <li class="dropdown-item"><a href="send-password-set-email?uid={{ a.userId }}&next=doctor-applications">Accept Application</a></li>
                                                <li class="dropdown-item"><a href="delete-doctor?doctor-id={{ d.doctor_id }}&next=doctors-list">delete application</a></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>

    <script>
        var app = angular.module("my_app", []);

        app.controller("my_ctrl", function($scope, $http) {
            $scope.application = [];

            $http.get("api/all-applications")
            .then(
                function(resp) {
                    $scope.application = resp.data;
                },
                function() {

                }
            );
        });
    </script> 

    <script>
        let apply = document.getElementById("apply").value;
        let dd = document.getElementById("dd").value;

        if(apply === 'failed') {
            swal("Unknown Error", "Due to some internal server error, we unable to send the mail. Sorry for inconvenience please try again after sometime", "error")
        }
        if(apply === 'ok') {
            swal("Success", "Mail send successfully", "success");
        }
        if(dd == 'ok') {
            swal("Success", "Doctor Application removed successfully", "success");
        }
    </script>
</t:layout_a>