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
	<title>Yocean Group Limited</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<meta content="" name="description"/>
	<meta content="" name="author"/>
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	
	<link href="${contextPath}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/bootstrap-5/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="${contextPath}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link href="${contextPath}/assets/admin/pages/css/login-soft.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/admin/pages/css/lock2.css" rel="stylesheet" type="text/css" />
	<!-- END PAGE LEVEL STYLES -->
	
	<link rel="stylesheet" type="text/css" href="${contextPath}/assets/yocean/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/assets/yocean/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/assets/yocean/fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/assets/yocean/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/assets/yocean/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/assets/yocean/vendor/animsition/css/animsition.min.css">
	
	<link rel="stylesheet" type="text/css" href="${contextPath}/assets/yocean/css/util.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/assets/yocean/css/main.css?11">
	<!-- BEGIN THEME STYLES -->
	
	<!-- END THEME STYLES -->

	<link rel="shortcut icon" href="https://static.tildacdn.com/img/tildafavicon.ico" type="image/x-icon"/>
</head>
    
<!-- END HEAD -->
<!-- BEGIN BODY -->
<div class="limiter">
			
	<div class="container-login100" style="background-image: url('./assets/images/original.jpeg');">
		
		<div class="wrap-login100">
					<center><img src="./assets/logos/yocean_logo.png" width="100%" style="margin-bottom: 30px;">
					</center>
				

				<div class="Metronic-alerts alert alert-success" style="margin-bottom:20px;padding:20px">
					<center><h4>You are logged out</h4></center>
				</div>
				
				<div class="container-login100-form-btn">
					<a href="index.jsp"><button class="login100-form-btn">
						Login
					</button></a>
				</div>
			</div>
		</div>
	</div>


<!--===============================================================================================-->	

<script src="${contextPath}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<script src="./assets/bootstrap-5/js/bootstrap.min.js" ></script>

<script src="${contextPath}/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->

<script src="${contextPath}/assets/global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->


<script src="${contextPath}/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${contextPath}/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
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
