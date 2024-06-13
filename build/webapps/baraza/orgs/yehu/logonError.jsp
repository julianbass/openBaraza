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
	<title>YEHU Microfinance</title>
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
	<link rel="stylesheet" href="./assets/yehu/css/style.css?13">

	<!-- BEGIN THEME STYLES -->
	<!-- <link href="${contextPath}/assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/assets/admin/layout/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="${contextPath}/assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/> -->
	<!-- END THEME STYLES -->

	<link rel="icon" href="https://yehu.org/wp-content/uploads/2021/02/cropped-yehu-logo-tr-32x32.png" sizes="32x32" />
<link rel="icon" href="https://yehu.org/wp-content/uploads/2021/02/cropped-yehu-logo-tr-192x192.png" sizes="192x192" />
<link rel="apple-touch-icon" href="https://yehu.org/wp-content/uploads/2021/02/cropped-yehu-logo-tr-180x180.png" />
<meta name="msapplication-TileImage" content="https://yehu.org/wp-content/uploads/2021/02/cropped-yehu-logo-tr-270x270.png" />

</head>
    
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body style="background-image: url('./assets/yehu/images/finance.jpg') !important; background-size: cover !important;">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<!-- <div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Login #01</h2>
				</div> -->
			</div>
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-5">
					<div class="login-wrap p-4 p-md-5">
						<center><img src="./assets/yehu/images/logo.jpg" width="180px" style="margin-bottom: 30px;"></center>
		      	<!-- <div class="icon d-flex align-items-center justify-content-center">
		      		<span class="fa fa-user-o"></span>
		      	</div> -->
				<div class="login-form">
					
					<div class="alert alert-danger" role="alert" style="padding: 20px; background-color: rgba(255, 0, 0, 0.83); color: white;font-weight: bold;margin-bottom:40px;text-align: center;"> 
						<strong>ERROR..!</strong> Wrong Username OR Password...!                           
					</div>

	            <div class="form-group">
	            	<a href="index.jsp"><button class="form-control btn btn-primary rounded submit px-3">Login</button></a>
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
<script src="./assets/yehu/js/popper.js"></script>
  <script src="./assets/yehu/js/main.js"></script>
<script src="${contextPath}/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${contextPath}/assets/admin/layout/scripts/demo.js" type="text/javascript"></script>
<script>
jQuery(document).ready(function() {    
    Metronic.init(); // init metronic core components

});
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
