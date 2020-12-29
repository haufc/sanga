<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/themes/common/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title><fmt:message key="webapp.title"/> | <sitemesh:write property='title'/></title>


	<!-- Global stylesheets -->
	<!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="/themes/front/assets/css/bootstrap.min.css">
	    
	<!-- Customizable CSS -->
	<link rel="stylesheet" href="/themes/front/assets/css/style.css">
	<link rel="stylesheet" href="/themes/front/assets/css/style-hautk.css">
    <link rel="stylesheet" href="/themes/front/assets/css/main.css">
    <link rel="stylesheet" href="/themes/front/assets/css/blue.css">
    <link rel="stylesheet" href="/themes/front/assets/css/owl.carousel.css">
	<link rel="stylesheet" href="/themes/front/assets/css/owl.transitions.css">
	<link rel="stylesheet" href="/themes/front/assets/css/animate.min.css">
	<link rel="stylesheet" href="/themes/front/assets/css/rateit.css">
	<link rel="stylesheet" href="/themes/front/assets/css/bootstrap-select.min.css">

	<!-- Icons/Glyphs -->
	<link rel="stylesheet" href="/themes/front/assets/css/font-awesome.css">

       <!-- Fonts --> 
	<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,600italic,700,700italic,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="/themes/admin/assets/css/lib.css">

	<!-- Script -->
	<script src="/themes/front/assets/js/jquery-1.11.1.min.js"></script>
	
	<script src="/themes/front/assets/js/bootstrap.min.js"></script>
	
	<script src="/themes/front/assets/js/bootstrap-hover-dropdown.min.js"></script>
	<script src="/themes/front/assets/js/owl.carousel.min.js"></script>
	
	<script src="/themes/front/assets/js/echo.min.js"></script>
	<script src="/themes/front/assets/js/jquery.easing-1.3.min.js"></script>
	<script src="/themes/front/assets/js/bootstrap-slider.min.js"></script>
    <script src="/themes/front/assets/js/jquery.rateit.min.js"></script>
    <script type="text/javascript" src="/themes/front/assets/js/lightbox.min.js"></script>
    <script src="/themes/front/assets/js/bootstrap-select.min.js"></script>
    <script src="/themes/front/assets/js/wow.min.js"></script>
	<script src="/themes/front/assets/js/scripts.js"></script>
	<script src="/themes/front/assets/js/customize.js"></script>
	<script src="/themes/admin/assets/js/lib.js"></script>
	<script>
		function getContext() {
			return '${ctx}';
		}
	</script>
	<!-- /theme JS files -->

	<sitemesh:write property='head'/>
</head>

<body class="cnt-home"> 
  <c:set var="currentMenu" scope="request"><sitemesh:write property='currentMenu'/></c:set>
  <input id="currentMenu" type="hidden" value='<sitemesh:write property="meta.menu" />'/>
	<button type="button" id="backToTop">
			<i class="fa fa-arrow-circle-o-up" aria-hidden="true"></i>
	</button>
	<!-- Main navbar -->
	<%@include file="/themes/front/common/navbar.jsp"%>
	<!-- /main navbar -->


	<!-- Page content -->
	<div class="body-content" id="top-banner-and-menu">
		<div class="container">
			<div class="row">
				<!-- Content area -->
				<sitemesh:write property='body'/>
				<!-- /content area -->
			</div>
		</div>
	</div>
	<!-- /page content -->
	<!-- Footer -->
		<%@include file="/themes/front/common/footer.jsp"%>
	<!-- /footer -->

</body>
</html>
