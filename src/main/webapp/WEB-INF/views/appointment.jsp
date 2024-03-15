<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>

<%
    String appointmentSession = (String) session.getAttribute("add-appointment");
    session.removeAttribute("add-appointment");
%>
<input type="hidden" id="appointment" value="<%= appointmentSession %>">

<t:layout>
    <div class="container-fluid py-5">
        <div class="container">
            <div class="row gx-5">
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <div class="mb-4">
                        <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5">Appointment</h5>
                        <h1 class="display-4">Make An Appointment For Your Family</h1>
                    </div>
                    <p class="mb-5">Eirmod sed tempor lorem ut dolores. Aliquyam sit sadipscing kasd ipsum. Dolor ea et dolore et at sea ea at dolor, justo ipsum duo rebum sea invidunt voluptua. Eos vero eos vero ea et dolore eirmod et. Dolores diam duo invidunt lorem. Elitr ut dolores magna sit. Sea dolore sanctus sed et. Takimata takimata sanctus sed.</p>
                    <a class="btn btn-primary rounded-pill py-3 px-5 me-3" href="">Find Doctor</a>
                    <a class="btn btn-outline-primary rounded-pill py-3 px-5" href="">Read More</a>
                </div>
                <div class="col-lg-6">
                    <div class="bg-light text-center rounded p-5">
                        <h1 class="mb-4">Book An Appointment</h1>

                        <form action="" method="post">
                            <div class="row g-3">
                                <div class="col-12 ">
                                    <select 
                                        id="department" 
                                        name="department" 
                                        class="form-select bg-white border-0" 
                                        style="height: 55px;">

                                        <option selected>Choose Department</option>
                                    </select>
                                </div>

                                <div class="col-12 ">
                                    <select 
                                        id="doctor" 
                                        name="doctor" 
                                        class="form-select bg-white border-0" 
                                        style="height: 55px;">

                                        <option selected>Choose doctor</option>
                                    </select>
                                </div>

                                <div class="col-12 ">
                                    <input 
                                        type="date" 
                                        name="date" 
                                        style="height: 55px;"
                                        class="form-control bg-white border-0 datetimepicker-input" 
                                    />
                                </div>
                                <div class="col-12 ">
                                    <select 
                                        id="time" 
                                        name="time" 
                                        class="form-select bg-white border-0" 
                                        style="height: 55px;">

                                        <option selected>select time slot</option>
                                        <option value="10:00AM-11:00AM">10:00AM-11:00AM</option>
                                        <option value="11:00AM-12:30PM">11:00AM-12:30PM</option>
                                        <option value="01:00PM-02:30PM">01:00PM-02:30PM</option>
                                        <option value="03:00PM-04:30PM">03:00PM-04:30PM</option>
                                    </select>
                                </div>
                                <div class="col-12">
                                    <button class="btn btn-primary w-100 py-3" type="submit">Make An Appointment</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        let department = document.getElementById("department");
        let doctor = document.getElementById("doctor");

        window.onload = function() {
            fetch("api/all-departments")
            .then((r) => r.json())
            .then((d) => {
                for(let i = 0; i < d.length; i++) {
                    let option = document.createElement("option");
                    option.value = d[i].id;
                    option.text = d[i].name;

                    department.append(option);
                }
            })
            .catch((e) => console.log(e))
        }

        department.onchange = function() {
            fetch("api/all-doctors?dept-id=" + department.value)
            .then((r) => r.json())
            .then((d) => {
                doctor.innerHTML = "";

                let option = document.createElement("option");
                option.text = "select doctor"
                doctor.append(option);

                for(let i = 0; i < d.length; i++) {
                    let option = document.createElement("option");
                    option.value = d[i].doctorId;
                    option.text = d[i].username;

                    doctor.append(option);
                }
            })
            .catch((e) => console.log(e))
        }
    </script>

    <script>
        let appointment = document.getElementById("appointment").value;
        if(appointment === 'ok') {
            swal("Success", "Appointment successfully booked.", "success")
        }
        
        if(appointment === 'failed') {
            swal("Operation failed", "Failed to book an appointment on given time and date", "error")
        }
    </script>

</t:layout>