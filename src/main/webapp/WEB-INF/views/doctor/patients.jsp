<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>
<%@page isELIgnored="false" %>

<t:layout_d>
    <div 
        ng-app="my_app"
        ng-controller="my_ctrl"
        class="content-wrapper">

        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Patients </h1>
                    </div>
                </div>
            </div>
        </div>

        <input type="hidden" id="ar" value="${sessionScope.ar}">
        <c:remove var="ar" scope="session"></c:remove>

        <div class="content">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Patients
                                <!-- <c:out value='${d.getDepartment().getName()}'></c:out>  -->
                            </h3>
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
                                        <td>{{ d.Address }}</td>
                                        <td>
                                            <a href="add-records?uid={{ d.user_id }}&pid={{ d.patient_id }}" class="btn btn-info ">Add Records</a>
                                            <a href="view-records?uid={{ d.user_id }}" class="btn btn-success ">View Records</a>
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

            $http.get("api/all-patients?doctor-id=${sessionScope.currentDoctor.getId()}")
            .then(
                function(response) {
                    $scope.doctors = response.data;
                    console.log($scope.doctors);
                },
                function() {

                }
            )
        })
    </script>

    <script>
        let ar = document.getElementById("ar").value;
        if(ar == 'ok') {
            swal("success", "Records added successfully", "success");
        }
    </script>
</t:layout_d>