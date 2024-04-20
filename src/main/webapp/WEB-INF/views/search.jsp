<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>

<t:layout>
    
    <div ng-app="my_app" ng-controller="my_ctrl">
        <div class="container-fluid pt-5">
            <div class="container">
                <div class="text-center mx-auto mb-5" style="max-width: 500px;">
                    <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5">Find A Doctor</h5>
                    <h1 class="display-4 mb-4">Find A Healthcare Professionals</h1>
                    <h5 class="fw-normal">Duo ipsum erat stet dolor sea ut nonumy tempor. Tempor duo lorem eos sit sed ipsum
                        takimata ipsum sit est. Ipsum ea voluptua ipsum sit justo</h5>
                </div>
                <div class="mx-auto" style="width: 100%; max-width: 700px;">
                    <div class="input-group">
                        <select ng-model="department" class="form-select border-primary w-25" style="height: 60px;">
                            <option selected>Chose Department</option>
                            <option ng-repeat="o in departments" value="{{ o.name }}">{{ o.name }}</option>
                        </select>
                        <input type="text" class="form-control border-primary w-50" placeholder="Keyword" ng-model="search">
        
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container-fluid py-5">
            <div class="container">
                <div class="row g-4">
                    <div ng-repeat="d in doctors | filter:search | filter:department"
                        class="col-lg-6 team-item">
                        <div class="row g-0 bg-light rounded overflow-hidden">
                            <div class="col-12 col-sm-5 h-100">
                                <img class="img-fluid h-100" src="{{ d.profileUrl }}" style="object-fit: cover;">
                            </div>
                            <div class="col-12 col-sm-7 h-100 d-flex flex-column">
                                <div class=" p-4">
                                    <h3>{{ d.name }}</h3>
                                    <h6 class="fw-normal text-capitalize fst-italic text-primary mb-4">{{ d.department }}
                                        Specialist</h6>
                                    <div class="mb-2">
                                        <i class="fa-solid fa-envelope"></i>
                                        <span class="ms-3">{{ d.email }}</span>
                                    </div>
                                    <div class="mb-2">
                                        <i class="fa-solid fa-phone"></i>
                                        <span class="ms-3">{{ d.phone }}</span>
                                    </div>
                                    <div class="mb-2">
                                        <i class="fa-solid fa-location-dot"></i>
                                        <span class="ms-3">{{ d.address }}</span>
                                    </div>
                                    <div class="mb-2">
                                        <a href="{{ d.resumeUrl }}" class="btn btn-primary">view resume</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 text-center">
                        <button class="btn btn-primary py-3 px-5">Load More</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

    <script>
        var app = angular.module("my_app", [])

        app.controller("my_ctrl", function ($scope, $http) {
            $scope.doctors = [];
            $scope.departments = [];
            
            $http.get("api/all-doctors")
            .then(
                function(resp) {
                    $scope.doctors = resp.data;
                    console.log($scope.doctors);
                },
                function(e) {
                    console.error(e);
                }
            );
                
            $http.get("api/all-departments")
            .then(
                function(resp) {
                    $scope.departments = resp.data;
                    console.log($scope.departments);
                },
                function(e) {
                    console.error(e);
                }
            );
        })
    </script>
</t:layout>
