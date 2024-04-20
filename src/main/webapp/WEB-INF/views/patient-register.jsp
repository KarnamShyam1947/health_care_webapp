<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>

<%
    String doctorSession = (String) session.getAttribute("doctor");
    session.removeAttribute("doctor");
%>
<input type="hidden" id="doctor" value="<%= doctorSession %>">

<t:layout>
    <div class="container-fluid py-5">
        <div class="container">
            <div class="row gx-5">
                <div class="col-lg-5 mb-5 mb-lg-0">
                    <div class="mb-4">
                        <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5">Register</h5>
                        <h1 class="display-4">Apply as Doctor</h1>
                    </div>
                    <p class="mb-5">Eirmod sed tempor lorem ut dolores. Aliquyam sit sadipscing kasd ipsum. Dolor ea et dolore et at sea ea at dolor, justo ipsum duo rebum sea invidunt voluptua. Eos vero eos vero ea et dolore eirmod et. Dolores diam duo invidunt lorem. Elitr ut dolores magna sit. Sea dolore sanctus sed et. Takimata takimata sanctus sed.</p>
                    <a class="btn btn-primary rounded-pill py-3 px-5 me-3" href="">Find Doctor</a>
                    <a class="btn btn-outline-primary rounded-pill py-3 px-5" href="">Read More</a>
                </div>
                <div class="col-lg-7">
                    <div class="bg-light rounded p-5">
                        <form 
                            ng-app 
                            id="form" 
                            name="form" 
                            method="post"
                            enctype="multipart/form-data"
                            action="" >
                            <div class="row g-3">
                                <div class="col-12 col-sm-6">
                                    <input
                                        type="text"
                                        name="username"
                                        ng-model="username"
                                        style="height: 45px;"
                                        ng-minlength="6"
                                        placeholder="Enter Your Name"
                                        class="form-control bg-white"
                                        required="true"
                                        ng-class="{'is-invalid' : form.username.$touched && form.username.$invalid }"
                                    />
                                    <span
                                        ng-show="form.username.$touched && form.username.$error.required"
                                        class="invalid-feedback">Username is required </span>
                                
                                    <span
                                        ng-show="form.username.$touched && form.username.$error.minlength"
                                        class="invalid-feedback">Username must contain 6 characters </span>
                                </div>
                                
                                <div class="col-12 col-sm-6">
                                    <input
                                        id="email"
                                        type="email"
                                        name="email"
                                        ng-model="email"
                                        style="height: 45px;"
                                        placeholder="Enter Your Email"
                                        class="form-control bg-white"
                                        required="true"
                                        ng-class="{'is-invalid' : form.email.$touched && form.email.$invalid }"
                                    />
                                    <span
                                        ng-show="form.email.$touched && form.email.$error.required"
                                        class="invalid-feedback">Email is required </span>
                                    <span
                                        ng-show="form.email.$touched && form.email.$error.email"
                                        class="invalid-feedback">Please enter an valid email</span>
                                </div>
                                
                                <div class="col-12 col-sm-6">
                                    <input
                                        type="text"
                                        name="phone"
                                        ng-model="phone"
                                        ng-maxlength="10"
                                        ng-minlength="10"
                                        style="height: 45px;"
                                        placeholder="Enter Your Phone number"
                                        class="form-control bg-white"
                                        required="true"
                                        ng-class="{'is-invalid' : form.phone.$touched && form.phone.$invalid }"
                                    />
                                    <span
                                        ng-show="form.phone.$touched && form.phone.$error.required"
                                        class="invalid-feedback">Phone number is required </span>
                                    <span
                                        ng-show="form.phone.$touched && form.phone.$error.maxlength"
                                        class="invalid-feedback">Please enter an valid phone number</span>
                                
                                    <span
                                        ng-show="form.phone.$touched && form.phone.$error.minlength"
                                        class="invalid-feedback">Please enter an valid phone number</span>
                                </div>
                                
                                
                                <div class="col-12 col-sm-6">
                                    <select
                                        required="true"
                                        ng-model="gender"
                                        name="gender"
                                        style="height: 45px;"
                                        class="form-select"
                                        ng-class="{'is-invalid' : form.gender.$touched && form.gender.$error.required}">
                                        <option value="">--select gender--</option>
                                        <option value="male">Male</option>
                                        <option value="female">female</option>
                                        <option value="others">others</option>
                                    </select>
                                    <span class="invalid-feedback">
                                        Please select the gender
                                    </span>
                                </div>
                                
                                <div class="col-12 col-sm-6">
                                    <input 
                                        ng-class="{'is-invalid' : form.password.$invalid && form.password.$touched}"
                                        class="form-control"
                                        style="height: 45px;"
                                        placeholder="Enter password"
                                        ng-model="password"
                                        ng-minlength="6"
                                        required="true"
                                        name="password"
                                        type="password"
                                    />

                                    <span 
                                        ng-show="form.password.$invalid && form.password.$error.required"
                                        class="invalid-feedback">
                                            Password is required
                                    </span>
                                    
                                    <span 
                                        ng-show="form.password.$invalid && form.password.$error.minlength"
                                        class="invalid-feedback">
                                            Minium length of Password must be 6
                                    </span>
                                </div>
                                
                                <div class="col-12 col-sm-6">
                                    <input 
                                        ng-class="{'is-invalid' : (form.password1.$invalid && form.password1.$touched) ||
                                                                    form.password.$modelValue != form.password1.$modelValue}"
                                        class="form-control"
                                        style="height: 45px;"
                                        placeholder="Reenter password"
                                        ng-model="password1"
                                        required="true"
                                        name="password1"
                                        type="password"
                                    />

                                    <span 
                                        ng-show="form.password1.$invalid && form.password1.$error.required"
                                        class="invalid-feedback">
                                            Password is required
                                    </span>

                                    <span 
                                        ng-show="form.password.$modelValue != form.password1.$modelValue"
                                        class="invalid-feedback">
                                        password and renter password fields must match
                                    </span>
                                </div>
                                
                                <div class="col-12 col-sm-6">
                                    <input
                                        type="file"
                                        id="profile"
                                        style="height: 45px;"
                                        onchange="profileSelected()"
                                        class="form-control"
                                    />
                                    <input type="hidden" name="profileUrl" id="profileUrl">
                                </div>
                                
                                <div class="col-12 col-sm-6">
                                    <img
                                        style="height: 50px; width: 50px;"
                                        alt="preview"
                                        id="profileImage"
                                        class="rounded-circle"
                                    />
                                </div>
                                
                                <div class="col-12">
                                    <textarea
                                        rows="5"
                                        name="address"
                                        required="true"
                                        ng-model="address"
                                        ng-class="{'is-invalid' : form.address.$touched && form.address.$invalid }"
                                        class="form-control">
                                    </textarea>
                                    <span class="invalid-feedback">Address is required</span>
                                </div>
                                
                                <div id="submitBtn" class="col-12">
                                    <button
                                        ng-disabled="form.$invalid" 
                                        class="btn btn-secondary w-100 py-3" type="submit">Apply</button>
                                </div>
                                
                                <div id="loadingBtn" class="col-12 border-2">
                                    <div style="border-radius: 8px;" class="py-2  text-light bg-secondary d-flex justify-content-center">
                                        <div class="spinner-border" role="status">
                                        </div>
                                        <span class="ps-2 fs-5">Applying....</span>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="assets/js/angular.js"></script>
    <script>
        let doctor = document.getElementById("doctor").value;
        if(doctor === 'failed') {
            swal("Error", "Email already in use. Try with anther one", "error");
        }

        let form = document.getElementById("form");
        let email = document.getElementById("email");
        let profile = document.getElementById("profile");
        let submitBtn = document.getElementById("submitBtn");
        let loadingBtn = document.getElementById("loadingBtn");
        let profileUrl = document.getElementById("profileUrl");
        let profileImage = document.getElementById("profileImage");
        
        loadingBtn.style.display = 'none';
        
        let profileFlag = false;
        function profileSelected() {
            profileFlag = true;
            renderImage();
        }
        
        function renderImage() {
            let file = profile.files[0];
            let reader = new FileReader();
            console.log(file);
            
            reader.readAsDataURL(file);
            reader.onload = function() {
                profileImage.setAttribute("src", reader.result);
            }
        }
        
        form.onsubmit = async function(e) {
            let flag = true;
            e.preventDefault();
    
            let fileData = new FormData();
            
            submitBtn.style.display = "none";
            loadingBtn.style.display = "block";
    
            if(profileFlag) {
                flag = false;
                fileData.append("email", email.value);
                fileData.append("profile", profile.files[0])
                r = await uploadFiles(fileData);
                if(r === null) {
                    swal("Error", "Failed to upload the files to cloud. please check your internet connection try again after some time", "error");    
                    submitBtn.style.display = "block";
                    loadingBtn.style.display = "none";
                }
                else {
                    flag = true;
                }
            }
        
            if(flag) {
                form.submit();
            }
        }

        const abortSignal = new AbortController();
        const signal = abortSignal.signal;
    
        async function uploadFiles(data) {
            setTimeout(() => {
                abortSignal.abort();
            }, 5000);

            let result=null
            await fetch("http://localhost:5000/upload/file",{
                method: 'POST',
                body: data,
                signal: signal
            })
            .then((res) => res.json())
            .then(data => {
                console.log(data);
                profileUrl.value=data.profile;
                result = true;
            })
            .catch((e) => {
                if(e.name === 'AbortError') {
                    console.error("Unable to upload the files")
                }
                else {
                    console.log(e)
                }
            });
    
            return result;
        }

    </script>
</t:layout>
