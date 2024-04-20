<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false" %>

<t:layout>

    <input type="hidden" name="clientAdd" id="clientAdd" value="${sessionScope.clientAdd}">
    <c:remove var="clientAdd" scope="session"></c:remove>

    <div class="container-fluid py-5">
        <div class="container">
            <div class="row gx-5">
                <div class="col-lg-5 mb-5 mb-lg-0">
                    <div class="mb-4">
                        <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5">Register</h5>
                        <h1 class="display-4">Register your Hospital</h1>
                    </div>
                    <p class="mb-3">
                        <ul>
                            <li class="fs-5">Enter all details in respective fields</li>
                            <li class="fs-5">Already registered hospital can not be registered again</li>
                            <li class="fs-5">If request sent successfully, please check the given mails regularly for updates</li>
                            <li class="fs-5">Please keep your email, further communication will be through mail only</li>
                        </ul>
                    </p>
                </div>
                <div class="col-lg-7">
                    <div class="bg-light rounded p-5">
                        <form method="post">

                            <div class="row g-3">
                                <div class="col-12 col-sm-6">
                                    <input 
                                        type="text" 
                                        name="hname"
                                        style="height: 45px;" 
                                        placeholder="Enter Your Hospital Name" 
                                        class="form-control bg-white"
                                        required="true" 
                                    />
                                </div>
                                
                                <div class="col-12 col-sm-6">
                                    <input 
                                        type="text" 
                                        name="username"
                                        style="height: 45px;" 
                                        placeholder="Enter Your Name" 
                                        class="form-control bg-white"
                                        required="true" 
                                    />

                                </div>

                                <div class="col-12 col-sm-6">
                                    <input 
                                        id="email"
                                        type="email" 
                                        name="email" 
                                        style="height: 45px;" 
                                        placeholder="Enter Your Email" 
                                        class="form-control bg-white" 
                                        required="true"
                                    />
                                </div>

                                <div class="col-12 col-sm-6">
                                    <input 
                                        type="text" 
                                        name="phone" 
                                        style="height: 45px;" 
                                        placeholder="Your Phone number" 
                                        class="form-control bg-white" 
                                        required="true"
                                    />
                                </div>


                                <div class="col-12">
                                    <textarea 
                                        rows="4" 
                                        id="address"
                                        name="address"
                                        class="bg-white form-control" 
                                        required="true"
                                        placeholder="Enter hospital address"></textarea>
                                </div>

                                <div id="submitBtn" class="col-12">
                                    <button class="btn btn-secondary w-100 py-3" type="submit">Apply</button>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        let clientAdd = document.getElementById("clientAdd").value;
        if(clientAdd == '1') {
            swal("Success", "Your application successfully reached us. Check your mails for regular updates", "success");
        }
        if(clientAdd == '0') {
            swal("Failed", "Hospital already registered", "error");
        }
    </script>

</t:layout>