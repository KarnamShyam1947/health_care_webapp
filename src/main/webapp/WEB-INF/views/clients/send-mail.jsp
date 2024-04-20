<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page import="entities.User" %>

<% User currentUser=(User) session.getAttribute("currentUser"); %>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HealthCare</title>

    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">

    <link rel="stylesheet" href="assets/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

    <link rel="stylesheet" href="assets/css/HealthCare.min2167.css">

    <script src="assets/js/angular.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/HealthCare.min2167.js"></script>
    <script src="assets/js/sweetalert.min.js"></script>
    <script src="//cdn.ckeditor.com/4.5.6/standard/ckeditor.js"></script>
</head>

<body class="hold-transition sidebar-mini">

    <input type="hidden" id="mail" value="${sessionScope.mail}">
    <c:remove var="mail" scope="session"></c:remove>

    <div class="wrapper">


        <t:navbar_d></t:navbar_d>


        <t:sidebar_a></t:sidebar_a>


        <div class="content-wrapper">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">Send mail</h1>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="row">
                    <div class="col-12">
                        <form action="" method="post">
                            <span>Send mail to all registered clients</span>
                            <input style="margin-bottom: 20px;" type="text" name="subject" class="form-control" placeholder="enter the subject">

                            <span>compose your mail</span>
                            <textarea name="html" style="width: 100%;" id="editor" rows="10"></textarea>
                            <input type="submit" style="margin-top: 10px;" class="btn btn-primary" value="send mail">
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <footer class="main-footer">

            <div class="float-right d-none d-sm-inline">
                Anything you want
            </div>

            <strong>Copyright &copy; 2024 <a href="#">HealthCare.com</a>.</strong> All rights reserved.

        </footer>

        <script>
            CKEDITOR.replace('editor');
            CKEDITOR.editorConfig = function( config ) {
    
                config.language = 'en';
                
                config.extraPlugins = 'jsplus_image_editor';
                
                config.toolbar = 'custom';
                config.toolbar_custom = [
                    { name: 'clipboard', groups: [ 'clipboard', 'undo' ], items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
                    { name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ], items: [ 'Scayt' ] },
                    { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
                    { name: 'insert', items: [ 'Image', 'Table', 'HorizontalRule', 'SpecialChar' ] },
                    { name: 'tools', items: [ 'Maximize' ] },
                    { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source' ] },
                    { name: 'others', items: [ '-' ] },
                    '/',
                    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Strike', '-', 'RemoveFormat' ] },
                    { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] },
                    { name: 'styles', items: [ 'Styles', 'Format' ] },
                    { name: 'about', items: [ 'About' ] },
                    { name : 'new_group', items: ['jsplus_image_editor'] }
                ];}
        </script>

        <script>
            let mail = document.getElementById("mail").value;
            if(mail == 'ok') {
                swal("Success", "Mails successfully send to all clients", "success");
            }
        </script>

    </div>
</body>

</html>