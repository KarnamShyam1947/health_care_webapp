<%@tag description="" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>

<!DOCTYPE html>
<html lang="en">

    <t:head></t:head>

    <body>
        
        <%-- <t:topbar></t:topbar> --%>

        <t:navbar></t:navbar>
        
        <jsp:doBody />

        <t:footer></t:footer>

        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </body>

</html>