<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>

<t:layout_d>
    <div class="content-wrapper">

        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Dashboard</h1>
                    </div>
                </div>
            </div>
        </div>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <div class="card card-success card-outline">
                            <div class="card-body box-profile">
                                <div class="text-center">
                                    <img class="profile-user-img img-fluid img-circle"
                                        src="../../dist/img/user4-128x128.jpg" alt="User profile picture">
                                </div>
                                <h3 class="profile-username text-center">Nina Mcintire</h3>
                                <ul class="list-group list-group-unbordered mb-3">
                                    <li class="list-group-item">
                                        <b>Reports</b> <span class="float-right">1,322</span>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Invoices</b> <span class="float-right">543</span>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Status</b> <span class="float-right">13,287</span>
                                    </li>
                                </ul>
                                <a style="width: 100%;" href="#" class="btn btn-success">Discharge</a>
                            </div>


                        </div>

                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">About Patient</h3>
                            </div>

                            <div class="card-body">
                                <strong><i class="fas fa-envelope mr-1"></i> Email</strong>
                                <p class="text-muted">
                                    email@example.com 
                                </p>
                                <hr>
                                
                                <strong><i class="fas fa-map-marker-alt mr-1"></i> Location</strong>
                                <p class="text-muted">Malibu, California</p>
                                <hr>
                                
                                <strong><i class="fas fa-phone mr-1"></i> Phone</strong>
                                <p class="text-muted">7894561230</p>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-header">
                                <h1 class="text-center">Prescription</h1>
                            </div>
                            <div class="card-body">
                                <h1>Hello, World</h1>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde, vitae. <br>
                            </div>
                            <div class="card-footer ">
                                <a href="pre.html" class="btn btn-primary">Print</a>
                            </div>
                        </div>
                        <div class="records">
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th>Record Name</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Report one</td>
                                        <td>
                                            <button class="btn btn-warning">View</button>
                                            <button class="btn btn-danger">delete</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Report one</td>
                                        <td>
                                            <button class="btn btn-warning">View</button>
                                            <button class="btn btn-danger">delete</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Report one</td>
                                        <td>
                                            <button class="btn btn-warning">View</button>
                                            <button class="btn btn-danger">delete</button>
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
</t:layout_d>