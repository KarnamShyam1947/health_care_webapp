<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false" %>

<%
    String deleteAppointment = (String) session.getAttribute("delete-appointment");
    session.removeAttribute("delete-appointment");
%>
<input type="hidden" value="<%= deleteAppointment %>" id="delete">

<t:layout_d>
    <div class="content-wrapper">

        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Appointments List</h1>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Appointments</h3>
                        </div>

                        <div class="card-body table-responsive p-0" style="height: 300px;">
                            <table class="table table-head-fixed table-hover text-nowrap">
                                <thead>
                                    <tr>
                                        <th>SL. NO. </th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Address</th>
                                        <th>Phone</th>
                                        <th>Date</th>
                                        <th>Time</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${appointments}" var="a" varStatus="i">
                                        <tr>
                                            <td>
                                                <c:out value="${i.index + 1}"></c:out>
                                            </td>
                                            <td>
                                                <c:out value="${a[3]}"></c:out>
                                            </td>
                                            <td>
                                                <c:out value="${a[4]}"></c:out>
                                            </td>
                                            <td>
                                                <c:out value="${a[5]}"></c:out>
                                            </td>
                                            <td>
                                                <c:out value="${a[6]}"></c:out>
                                            </td>
                                            <td>
                                                <c:out value="${a[1]}"></c:out>
                                            </td>
                                            <td>
                                                <c:out value="${a[2]}"></c:out>
                                            </td>
                                            <td>
                                                <a href="delete-appointment?aid=<c:out value='${a[0]}'></c:out>" class="btn btn-danger">cancel</a>
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

    <script>
        let da = document.getElementById("delete").value;

        if(da == 'ok') {
            swal("success", "Appointment canceled successfully", "success");
        }
    </script>
</t:layout_d>