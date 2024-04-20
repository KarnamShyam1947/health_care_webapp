<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false" %>

<%
    String passwordSession = (String) session.getAttribute("password");
    session.removeAttribute("password");
    
    String pr = (String) session.getAttribute("pr");
    session.removeAttribute("pr");
    
    String loginSession = (String) session.getAttribute("login");
    session.removeAttribute("login");
%>
<input type="hidden" id="pr" value="<%= pr %>">
<input type="hidden" id="password" value="<%= passwordSession %>">
<input type="hidden" id="login" value="<%= loginSession %>">

<t:layout>
    <div class="container-fluid py-5">
        <div class="container">
            <div class="row gx-5">
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <div class="mb-4">
                        <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5">Welcome Back</h5>
                        <h1 class="display-4">Login into your account</h1>
                    </div>
                    <p class="mb-5">Eirmod sed tempor lorem ut dolores. Aliquyam sit sadipscing kasd ipsum. Dolor ea et dolore et at sea ea at dolor, justo ipsum duo rebum sea invidunt voluptua. Eos vero eos vero ea et dolore eirmod et. Dolores diam duo invidunt lorem. Elitr ut dolores magna sit. Sea dolore sanctus sed et. Takimata takimata sanctus sed.</p>
                    <a class="btn btn-primary rounded-pill py-3 px-5 me-3" href="register">Apply as Doctor</a>
                    <a class="btn btn-outline-primary rounded-pill py-3 px-5" href="patient-register">Apply as Patient</a>
                </div>
                <div class="col-lg-6">
                    <div class="bg-light rounded p-5">
                        <h1 class="mb-4 text-center">Welcome Back...</h1>
                        <form action="" id="form" method="post">
                            <input type="hidden" name="next" value="${param.next}">
                            <input type="hidden" id="auth" value="${sessionScope.auth}">
                            <c:remove var="auth" scope="session" />

                            <div class="row g-4">
                                <div class="col-12">
                                    <input 
                                        type="text" 
                                        id="username"
                                        name="username"
                                        style="height: 55px;" 
                                        class="form-control bg-white border-0" 
                                        placeholder="Enter your Email" 
                                    />

                                    <div id="usernameError" class="invalid-feedback"> </div>
                                </div>
                                
                                <div class="col-12">
                                    <input 
                                        id="password"
                                        type="password" 
                                        name="password" 
                                        style="height: 55px;" 
                                        class="form-control bg-white border-0" 
                                        placeholder="Enter your Password"
                                    />

                                    <div id="passwordError" class="invalid-feedback"> </div>
                                </div>

                                <div class="d-flex justify-content-between ">
                                    <div>
                                        <input type="checkbox" name="remember" class="form-check-input" id="remember">
                                        <label class="form-check-label" for="remember">Remember Me</label>
                                    </div>
                                    <a href="forgot-password">Forgot password?</a>
                                    
                                </div>
                                
                                <div class="col-12">
                                    <button class="btn btn-secondary w-100 py-3" type="submit">Login</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        let form = document.getElementById("form");
        let username = document.getElementById("username");
        let password = document.getElementById("password");
        let usernameError = document.getElementById("usernameError");
        let passwordError = document.getElementById("passwordError");

        form.onsubmit = function(e) {
            e.preventDefault();

            username.classList.remove("is-invalid");
            username.classList.add("border-0");
            usernameError.innerText = "";

            password.classList.remove("is-invalid");
            password.classList.add("border-0");
            passwordError.innerText = "";
            
            let flag = true;

            if(username.value.trim(" ") == "") {
                username.classList.add("is-invalid");
                username.classList.remove("border-0");
                usernameError.innerText = "Username is required";
                flag = false;
            }
            
            if(password.value.trim(" ") == "") {
                password.classList.add("is-invalid");
                password.classList.remove("border-0");
                passwordError.innerText = "Password is required";
                flag = false;
            }

            if(flag) {
                form.submit();
            }
        }
    </script>

    <script>
        let doctor = document.getElementById("password").value;
        if(doctor === 'ok') {
            swal("Success", "Password set successfully. Now you can login into your account", "success")
        }
        
        let pr = document.getElementById("pr").value;
        if(pr === 'ok') {
            swal("Success", "Account created successfully. Now you can enjoy your services", "success")
        }
        
        let auth = document.getElementById("auth").value;
        if(auth === 'ok') {
            swal("Not Authenticated", "Please login to access this page", "error")
        }
        
        let login = document.getElementById("login").value;
        if(login === 'failed') {
            swal("Login failed", "Invalid email or password. please check your details and try again", "error")
        }
    </script>
</t:layout>