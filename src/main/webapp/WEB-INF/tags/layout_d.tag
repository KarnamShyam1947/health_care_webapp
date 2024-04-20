<%@taglib tagdir="/WEB-INF/tags" prefix="t" %> 
<%@tag description="" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html lang="en">

    <t:head_d></t:head_d>

    <body class="hold-transition sidebar-mini">
        <div class="wrapper">
            <t:navbar_d></t:navbar_d>

            <t:sidebar_d></t:sidebar_d>

            <jsp:doBody />

            <t:footer_d></t:footer_d>
        </div>
    </body>

</html>