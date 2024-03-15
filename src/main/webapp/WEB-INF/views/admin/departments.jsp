<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>

<t:layout_a>
    <div 
        ng-app="my_app"
        ng-controller="my_ctrl"
        class="content-wrapper">

        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">All Departments</h1>
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
                                        <th>Department Name</th>
                                        <th>Number of Doctors</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <tr ng-repeat="d in departments | filter:search">
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ d.name }}</td>
                                        <td>{{ d.noOfDoctors }}</td>
                                        <td>
                                            <a href="#" class="btn btn-danger">Delete</a>
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
            $scope.departments = [];

            $http.get("api/all-departments")
            .then(
                function(response) {
                    $scope.departments = response.data;
                },
                function() {

                }
            )
        })
    </script>
</t:layout_a>