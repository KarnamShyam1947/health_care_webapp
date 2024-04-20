<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false" %>

<t:layout_a>
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
                                        src="${user.profileUrl}" alt="User profile picture">
                                </div>
                                <h3 class="profile-username text-center">${user.username}</h3>
                                <ul class="list-group list-group-unbordered mb-3">
                                    <li class="list-group-item">
                                        <b>Reports</b> <span class="float-right">${records.size()}</span>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Invoices</b> <span class="float-right">${patient.getInvoices().size()}</span>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Status</b> <span class="float-right">${patient.status}</span>
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
                                    ${user.email}
                                </p>
                                <hr>
                                
                                <strong><i class="fas fa-map-marker-alt mr-1"></i> Location</strong>
                                <p class="text-muted">${user.address}</p>
                                <hr>
                                
                                <strong><i class="fas fa-phone mr-1"></i> Phone</strong>
                                <p class="text-muted">${user.phone}</p>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-header">
                                <h1 class="text-center">Prescription</h1>
                            </div>
                            <div class="card-body">
                                ${patient.prescription}
                            </div>
                            <div class="card-footer ">
                                <div class="d-flex justify-content-between">
                                    <a href="pre.html" class="btn btn-primary">Print</a>
                                    <span>Update on : ${patient.updatedOn}</span>
                                </div>
                            </div>
                        </div>
                        <div class="records">
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th>Record Name</th>
                                        <th>Uploaded On</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${records}" var="r">
                                        <tr>
                                            <td>
                                                <c:out value="${r.name}"></c:out>
                                            </td>
                                            <td>
                                                <c:out value="${r.updatedOn}"></c:out>
                                            </td>
                                            <td>
                                                <a target="_blank" href="<c:out value='${r.urls}'></c:out>" class="btn btn-warning">View</a>
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
</t:layout_a>