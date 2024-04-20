<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>

<%
    String applySession = (String) session.getAttribute("apply");
    session.removeAttribute("apply");
    
    String forgotSession = (String) session.getAttribute("forgot");
    session.removeAttribute("forgot");
%>
<input type="hidden" id="apply" value="<%= applySession %>">
<input type="hidden" id="forgot" value="<%= forgotSession %>">

<t:layout>
    <div class="container-fluid py-5">
        <div class="container">
            <div class="row gx-5">
                <div class="col-lg-5 mb-5 mb-lg-0">
                    <div class="mb-4">
                        <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5">Forgot Password</h5>
                        <h1 class="display-4">Forgot Password</h1>
                    </div>
                    <p class="mb-5">Eirmod sed tempor lorem ut dolores. Aliquyam sit sadipscing kasd ipsum. Dolor ea et dolore et at sea ea at dolor, justo ipsum duo rebum sea invidunt voluptua. Eos vero eos vero ea et dolore eirmod et. Dolores diam duo invidunt lorem. Elitr ut dolores magna sit. Sea dolore sanctus sed et. Takimata takimata sanctus sed.</p>
                    <a class="btn btn-primary rounded-pill py-3 px-5 me-3" href="">Find Doctor</a>
                    <a class="btn btn-outline-primary rounded-pill py-3 px-5" href="">Read More</a>
                </div>
                <div class="col-lg-7">
                    <div class="bg-light rounded px-3 py-5">
                        <form method="post">
                            <h1 class="text-center mb-4">Forgot password</h1>
                            <div class="container   ">
                                <input 
                                    class="form-control w-100 mb-4"
                                    style="height: 55px;"
                                    type="email" name="email" placeholder="Enter your register email-id">

                                <div id="submitBtn">
                                    <button class="btn btn-secondary w-100 py-3" type="submit">Submit</button>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        let forgot = document.getElementById("forgot").value;
        let apply = document.getElementById("apply").value;
        if(apply === 'failed') {
            swal("Unknown Error", "Due to some internal server error, we unable to send the mail. Sorry for inconvenience please try again after sometime", "error")
        }
        if(forgot === 'failed') {
            swal("Invalid Email", "Given is not register with us. Please enter only registered mail only", "error")
        }

        if(apply === 'ok') {
            swal("Success", "Mail send successfully", "success");
        }
    </script>
</t:layout>
