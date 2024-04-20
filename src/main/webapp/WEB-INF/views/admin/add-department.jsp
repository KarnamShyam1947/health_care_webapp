<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>

<%
    String dept = (String) session.getAttribute("dept");
    session.removeAttribute("dept");
%>
<input type="hidden" id="dept" value="<%= dept %>">

<t:layout_a>
    <div class="content-wrapper">

        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Add Department</h1>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="d-flex justify-content-center ">
                <form class="w-50" action="" method="post">
                    <input type="text" name="dept-name" placeholder="Enter department name" class="form-control mb-3">
                    <div class="d-flex justify-content-center ">
                        <input class="btn btn-primary" type="submit" value="add department">
                    </div>
                </form>
            </div>
        </div>

    </div>

    <script>
        let dept = document.getElementById("dept").value;

        if(dept === 'ok') {
            swal("Department Added", "Successfully a new department was added", "success");
        }
        if(dept === 'failed') {
            swal("Already exists", "Failed to add the department. Already a department exists with same name", "error");
        }
    </script>
</t:layout_a>