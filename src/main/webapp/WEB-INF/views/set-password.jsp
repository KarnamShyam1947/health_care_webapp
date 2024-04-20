<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>

<t:layout>

    <div class="container-fluid py-5">
        <div class="container">
            <div class="row gx-5">
                <div class="col-lg-5 mb-5 mb-lg-0">
                    <div class="mb-4">
                        <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5">Set Password</h5>
                        <h1 class="display-4">Set Your Password</h1>
                    </div>
                    <p class="mb-5">Eirmod sed tempor lorem ut dolores. Aliquyam sit sadipscing kasd ipsum. Dolor ea et dolore et at sea ea at dolor, justo ipsum duo rebum sea invidunt voluptua. Eos vero eos vero ea et dolore eirmod et. Dolores diam duo invidunt lorem. Elitr ut dolores magna sit. Sea dolore sanctus sed et. Takimata takimata sanctus sed.</p>
                    <a class="btn btn-primary rounded-pill py-3 px-5 me-3" href="">Find Doctor</a>
                    <a class="btn btn-outline-primary rounded-pill py-3 px-5" href="">Read More</a>
                </div>
                <div class="col-lg-7">
                    <div class="bg-light rounded px-3 py-5">
                        <form action="" method="post">
                            <h1 class="text-center mb-4">Set Your password</h1>
                            <div class="container   ">
                                <input 
                                    class="form-control w-100 mb-4"
                                    style="height: 55px;"
                                    type="password" name="password" placeholder="Enter your new password">

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
</t:layout>