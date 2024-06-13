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
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link href="${contextPath}/assets/admin/pages/css/login-soft.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/admin/pages/css/lock2.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath}/assets/global/plugins/select2/select2.css" rel="stylesheet" type="text/css"/>

	<!-- END PAGE LEVEL STYLES -->
	<link rel="stylesheet" href="./assets/mna/css/style.css">

	<!-- BEGIN THEME STYLES -->
	<!-- <link href="${contextPath}/assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css"/> -->
	<link href="${contextPath}/assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/admin/layout/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<!-- <link href="${contextPath}/assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/> -->
	<!-- END THEME STYLES -->

	<!-- <link rel="shortcut icon" href="./assets/logos/favicon.png"/> -->
	<link rel="icon" href="https://www.mazaonaafya.com/wp-content/uploads/2021/04/cropped-Favicon_-192x192.png" sizes="192x192" />
	<link rel="apple-touch-icon" href="https://www.mazaonaafya.com/wp-content/uploads/2021/04/cropped-Favicon_-180x180.png" />
	<meta name="msapplication-TileImage" content="https://www.mazaonaafya.com/wp-content/uploads/2021/04/cropped-Favicon_-270x270.png" />

</head>
    
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body style="background-image: url(https://www.mazaonaafya.com/wp-content/uploads/2018/11/2-1920x729.jpg);">
	<section class="ftco-section">
		<div class="container">
			<!-- <div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Login #09</h2>
				</div>
			</div> -->
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap py-5">
						<center>
							<img src="https://www.mazaonaafya.com/wp-content/themes/the-landscaper/assets/images/logo.png">
						</center>
		      	<!-- <h3 class="text-center mb-0">Welcome</h3> -->
		      	<p class="text-center">Sign in</p>
						<div class="login-form">
							<div class="Metronic-alerts alert alert-success" style="margin-top:30px;margin-bottom: 40px;padding:20px">
								<center><h4>You are logged out</h4></center>
							</div>
	         
	            <div class="form-group">
	            	<a href="index.jsp"><button class="btn form-control btn-primary rounded submit px-3">Sign In</button></a>
	            </div>
			</div>
	        </div>
				</div>
			</div>
		</div>
	</section>


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
<script src="./assets/mna/js/jquery.min.js"></script>
  <script src="./assets/mna/js/popper.js"></script>
  <script src="./assets/mna/js/bootstrap.min.js"></script>
  <script src="./assets/mna/js/main.js"></script>
<script src="${contextPath}/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${contextPath}/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="${contextPath}/assets/admin/layout/scripts/demo.js" type="text/javascript"></script>
<script>
jQuery(document).ready(function() {    
    Metronic.init(); // init metronic core components
    Layout.init(); // init current layout
    //Lock.init();
    //Demo.init();
    $.backstretch([
        "${contextPath}/assets/admin/pages/media/bg/1.jpg",
        "${contextPath}/assets/admin/pages/media/bg/2.jpg",
        "${contextPath}/assets/admin/pages/media/bg/3.jpg",
        "${contextPath}/assets/admin/pages/media/bg/4.jpg"
        ], {
          fade: 1000,
          duration: 8000
    }
    );
});
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
