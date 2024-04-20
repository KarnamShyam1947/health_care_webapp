<%@page isELIgnored="false" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<t:layout_a>
    <div class="content-wrapper">

        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Assign Doctors</h1>
                    </div>
                </div>
            </div>
        </div>


        <div class="content">
            <div class="container">
                <form action="" method="post">
                    <input type="hidden" id="assign" value="${sessionScope.assign}">

                    <c:remove var="assign" scope="session"></c:remove>
                    <div class="row g-3">
                        <div class="col-12 col-md-6 mb-3">
                            <select name="patientId" id="pid" class="form-control">
                                <option value="">select patient</option>
                            </select>
                        </div>
                        
                        <div class="col-12 col-md-6 mb-3">
                            <select name="doctorId" id="did" class="form-control">
                                <option value="">select doctor</option>
                            </select>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center align-items-center ">
                        <input type="submit" class="btn btn-warning" value="Assign">
                    </div>
                </form>
            </div>
        </div>

    </div>

    <script>
        let pid = document.getElementById("pid");
        let did = document.getElementById("did");

        window.onload = function() {
            fetch("api/all-doctors")
            .then(r => r.json())
            .then(data => {
                for(let i = 0; i < data.length; i++) {
                    let option = document.createElement("option");
                    option.value = data[i].doctor_id;
                    option.textContent = data[i].name + " - " + data[i].department;

                    did.appendChild(option);
                }
            });

            fetch("api/all-patients")
            .then(r => r.json())
            .then(data => {
                for(let i = 0; i < data.length; i++) {
                    let option = document.createElement("option");
                    option.value = data[i].patient_id;
                    option.textContent = data[i].name;

                    pid.appendChild(option);
                }
            })
        }

    </script>

    <script>
        let assign = document.getElementById("assign").value;
        if(assign == 'ok') {
            swal("success", "Patient assigned to Doctor successfully", "success");
        }
    </script>
</t:layout_a>
