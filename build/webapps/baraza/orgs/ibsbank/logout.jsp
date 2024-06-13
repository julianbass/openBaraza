<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	session.removeAttribute("xmlcnf");
	session.invalidate();
%>


<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8"/>
	<title><%= pageContext.getServletContext().getInitParameter("login_title") %></title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<meta content="" name="description"/>
	<meta content="" name="author"/>
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL STYLES -->
	<!-- <link href="${contextPath}/assets/admin/pages/css/login-soft.css" rel="stylesheet" type="text/css"/> -->
	<link href="${contextPath}/assets/admin/pages/css/lock2.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath}/assets/global/plugins/select2/select2.css" rel="stylesheet" type="text/css"/>

	<!-- END PAGE LEVEL STYLES -->
	<link href="./assets/ibsbank/css/style.css" rel="stylesheet" type="text/css"/>
	<!-- BEGIN THEME STYLES -->
	<!-- <link href="${contextPath}/assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/admin/layout/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="${contextPath}/assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/> -->
	<!-- END THEME STYLES -->

	<link rel="shortcut icon" href="./assets/logos/favicon.png"/>
</head>
    
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body >
	<div class="page" style="background-image: url(./assets/ibsbank/images/save.png);background-size: cover;">
        <div class="container1">
          <div class="left">
            <div class="logo-box">
                <img src="./assets/ibsbank/images/logo.png" alt="ibs logo" width="200px">
            </div>
            <div class="eula">Staying true to our heritage while supporting sustainable growth</div>
          </div>
          <div class="right">
			<div class="alert alert-danger" role="alert" style="padding: 20px; background-color: rgb(46, 158, 0);; color: white;font-weight: bold;margin:90px 40px 0px 40px; text-align: center;"> 
				<strong>You are logged out</strong>                             
			</div>


                <div class="login-button">
                    <a href="index.jsp">
						<center><button class="form-button">
                        LOGIN
                    </button></center></a>
                </div>
			</div>
          </div>
        </div>
      </div>

<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="../../assets/global/plugins/respond.min.js"></script>
<script src="../../assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="${contextPath}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${contextPath}/assets/global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->

<script src="${contextPath}/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${contextPath}/assets/admin/layout/scripts/demo.js" type="text/javascript"></script>
<script>
jQuery(document).ready(function() {    
    Metronic.init(); // init metronic core components
    Layout.init(); // init current layout

});
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
