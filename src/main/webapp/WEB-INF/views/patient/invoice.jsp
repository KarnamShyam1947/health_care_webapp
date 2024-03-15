<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>HealthCare</title>

        <link rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">

        <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
            integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

        <link rel="stylesheet" href="assets/css/HealthCare.min2167.css?v=3.2.0">
    </head>


    <body>

        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Invoice</h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="container">
                <div class="row">
                    <div class="col-12">

                        <div class="invoice p-3 mb-3">

                            <div class="row">
                                <div class="col-12">
                                    <h4>
                                        <i class="fas fa-globe"></i> HealthCare, Inc.
                                        <small class="float-right">Date: ${invoice.date}</small>
                                    </h4>
                                </div>

                            </div>

                            <div class="row invoice-info">
                                <div class="col-sm-4 invoice-col">
                                    From
                                    <address>
                                        <strong>Admin, Inc.</strong><br>
                                        VIT-AP University, AP, India <br>
                                        Phone: (+91) 148-123-5432<br>
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
                                    <b>Invoice #00${invoice.id}</b><br>
                                    <br>
                                    <b>Order ID:</b> 4F3S8J<br>
                                    <b>Payment Due:</b> ${invoice.dueDate}<br>
                                    <b>Status:</b> 
                                    <c:choose>
                                        <c:when test="${invoice.status}">
                                            Paid
                                        </c:when>
                                        <c:otherwise>
                                            Not Paid
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                            </div>


                            <div class="row">
                                <div class="col-12 table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>SL. No.</th>
                                                <th>Product</th>
                                                <th>Description</th>
                                                <th>Qty</th>
                                                <th>Price</th>
                                                <th>Subtotal</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="total" value="0"></c:set>
                                            <c:forEach items="${products}" var="p" varStatus="i">
                                                <tr >
                                                    <td>
                                                        <c:out value="${i.index + 1}"></c:out>
                                                    </td>
                                                    <td>
                                                        <c:out value="${p.name}"></c:out>
                                                    </td>
                                                    <td>
                                                        <c:out value="${p.description}"></c:out>
                                                    </td>
                                                    <td>
                                                        <c:out value="${p.quantity}"></c:out>
                                                    </td>
                                                    <td>
                                                        <c:out value="${p.pricePerOne}"></c:out>
                                                    </td>
                                                    <td>
                                                        <c:out value="${p.quantity * p.pricePerOne}"></c:out>
                                                    </td>

                                                    <c:set var="total" value="${total + p.quantity * p.pricePerOne}"></c:set>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                            </div>

                            <div class="row">

                                <div class="col-6">
                                    <p class="lead">Payment Methods:</p>
                                    <img src="assets/img/credit/visa.png" alt="Visa">
                                    <img src="assets/img/credit/mastercard.png" alt="Mastercard">
                                    <img src="assets/img/credit/american-express.png" alt="American Express">
                                    <img src="assets/img/credit/paypal2.png" alt="Paypal">
                                    <p class="text-muted well well-sm shadow-none" style="margin-top: 10px;">
                                        Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning
                                        heekya handango imeem
                                        plugg
                                        dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra.
                                    </p>
                                </div>

                                <div class="col-6">
                                    <p class="lead">Amount Due ${invoice.dueDate}</p>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tr>
                                                <th style="width:50%">Subtotal:</th>
                                                <td>${total}</td>
                                            </tr>
                                            <tr>
                                                <th>Tax(+${invoice.gst}%) : </th>
                                                <td>${total * (invoice.gst / 100)}</td>
                                            </tr>
                                            <tr>
                                                <th>Discount(-${invoice.discount}%) : </th>
                                                <td>${total * (invoice.discount / 100)}</td>
                                            </tr>
                                            <tr>
                                                <th>Total:</th>
                                                <td>${invoice.amount} Rs.</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>

                            </div>


                            <div class="row no-print">
                                <div class="col-12">
                                    <% if(session.getAttribute("admin-user") != null) {
                                        %>
                                            <button href="pay-invoice?id=<c:out value='${ic.id}'></c:out>" class="btn btn-success float-right">
                                                <i class="far fa-credit-card"></i> Submit Payment
                                            </button> 
                                        <%
                                    }
                                    %>
                                    <button onclick="downloadPdf()" type="button" class="btn btn-primary float-right"
                                        style="margin-right: 5px;">
                                        <i class="fas fa-download"></i> Generate PDF
                                    </button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>


                
        <script src="assets/js/jquery.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/HealthCare.min2167.js?v=3.2.0"></script>

        <script>
            function downloadPdf() {
                window.print();
            }
        </script>

    </body>


</html>