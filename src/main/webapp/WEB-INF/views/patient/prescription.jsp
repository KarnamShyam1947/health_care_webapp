<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>healthCare | prescription</title>

    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

    <link rel="stylesheet" href="assets/css/HealthCare.min2167.css?v=3.2.0">
</head>


<body>
    <div class="wrapper container ">

        <section class="invoice">

            <div class="row">
                <div class="col-12">
                    <h2 class="page-header">
                        <i class="fas fa-globe"></i> healthCare, Inc.
                        <small class="float-right">Date: ${patient.updatedOn}</small>
                    </h2>
                </div>

            </div>

            <div class="row invoice-info">
                <div class="col-sm-4 invoice-col">
                    From
                    <address>
                        <strong>Admin, Inc.</strong><br>
                        795 Folsom Ave, Suite 600<br>
                        San Francisco, CA 94107<br>
                        Phone: (804) 123-5432<br>
                        Email: admin.healthcare@gmail.com
                    </address>
                </div>

                <div class="col-sm-4 invoice-col">
                    To
                    <address>
                        <strong>${user.username}</strong><br>
                        ${user.address}<br>
                        Phone: ${user.phone}<br>
                        Email: ${user.email}
                    </address>
                </div>

                <div class="col-sm-4 invoice-col">
                    <b>Prescription #007612</b><br>
                    <br>
                    <!-- <b>Order ID:</b> 4F3S8J<br> -->
                    <b>Date:</b> ${patient.updatedOn}<br>
                    <b>Patient Status:</b> ${patient.status}
                </div>

            </div>

            <hr>
            <div class="card">
                <div class="card-header">
                    <h3 class="text-center" >Prescription</h3>
                </div>
                <div class="d-flex justify-content-center ">
                    <div class="card-body">
                        ${patient.prescription}
                    </div>
                </div>
                <div class="card-footer">
                    <button id="btn" class="btn btn-success">Print</button>
                </div>
            </div>


        </section>

    </div>


    <script>
        let btn = document.getElementById("btn");

        btn.onclick = function() {
            window.print();
        }
    </script>
    
</body>

</html>