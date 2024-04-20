<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>

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
                    <div class="col-lg-3 col-6">

                        <div class="small-box bg-info">
                            <div class="inner">
                                <h3 id="doctor">150</h3>
                                <p>Doctors</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-bag"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i
                                    class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-6">

                        <div class="small-box bg-success">
                            <div class="inner">
                                <h3 id="patient">53</h3>
                                <p>Patients</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i
                                    class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-6">

                        <div class="small-box bg-warning">
                            <div class="inner">
                                <h3 id="application">44</h3>
                                <p>Applications</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person-add"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i
                                    class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-6">

                        <div class="small-box bg-danger">
                            <div class="inner">
                                <h3 id="department">65</h3>
                                <p>Departments</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-pie-graph"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i
                                    class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>

                </div>

            </div>
        </div>

    </div>

    <script>
        let doctor = document.getElementById("doctor");
        let patient = document.getElementById("patient");
        let department = document.getElementById("department");
        let application = document.getElementById("application");

        fetch("api/all-doctors")
        .then(r => r.json())
        .then(res => {
            doctor.innerHTML = res.length;
        })
        .catch((e) => console.log(e));

        fetch("api/all-patients")
        .then(r => r.json())
        .then(res => {
            patient.innerHTML = res.length;
        })
        .catch((e) => console.log(e));

        fetch("api/all-applications")
        .then(r => r.json())
        .then(res => {
            application.innerHTML = res.length;
        })
        .catch((e) => console.log(e));

        fetch("api/all-departments")
        .then(r => r.json())
        .then(res => {
            department.innerHTML = res.length;
        })
        .catch((e) => console.log(e));

    </script>
</t:layout_a>
