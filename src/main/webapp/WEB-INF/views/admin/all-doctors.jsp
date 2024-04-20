<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>

<%
    String doctor = (String) session.getAttribute("doctor-delete");
    session.removeAttribute("doctor-delete");
%>
<input type="hidden" id="dd" value="<%= doctor %>">

<t:layout_a>
    <div 
        ng-app="my_app"
        ng-controller="my_ctrl"
        class="content-wrapper">

        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">List Doctors</h1>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Doctors</h3>
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
                                        <th>Department</th>
                                        <th>Address</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="d in doctors | filter:search">
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ d.name }}</td>
                                        <td>{{ d.email }}</td>
                                        <td>{{ d.phone }}</td>
                                        <td>{{ d.department }}</td>
                                        <td>{{ d.address }}</td>
                                        <td>
                                            <a href="{{ d.resumeUrl }}" class="btn btn-warning">View Resume</a>
                                            <a href="delete-doctor?doctor-id={{ d.doctor_id }}&next=doctors-list" class="btn btn-danger ">Delete</a>
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
        var app = angular.module("my_app", [])

        app.controller("my_ctrl", function($scope, $http) {
            $scope.doctors = [];

            $http.get("api/all-doctors")
            .then(
                function(response) {
                    $scope.doctors = response.data;
                },
                function() {

                }
            )
        })
    </script>

    <script>
        let dd = document.getElementById("dd").value;
        if(dd == 'ok') {
            swal("Success", "Doctor account deleted successfully", "success");
        }
    </script>
</t:layout_a>