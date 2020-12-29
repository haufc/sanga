<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/themes/common/taglibs.jsp"%>

	<head>
		<!-- Meta -->

	    <title>Sang-A Project</title>
	    
		<!-- Bootstrap Core CSS -->
	    <link href="<c:url value='/themes/front/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
	    
		<!-- Customizable CSS -->
		
		<link href="<c:url value='/themes/front/css/style.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/themes/front/css/main.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/themes/front/css/blue.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/themes/front/css/owl.carousel.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/themes/front/css/owl.transitions.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/themes/front/css/animate.min.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/themes/front/css/rateit.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/themes/front/css/bootstrap-select.min.css'/>" rel="stylesheet" type="text/css">
	

		<!-- Icons/Glyphs -->
		<link href="<c:url value='/themes/front/css/font-awesome.css'/>" rel="stylesheet" type="text/css">

        <!-- Fonts --> 
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,600italic,700,700italic,800' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
		<style>
			#product-tabs-slider {
				border-top: 1px solid #cccccc;
			}
		</style>
	</head>
    <body class="cnt-home">
		<!-- ============================================== HEADER ============================================== -->
<header class="header-style-1">

	<!-- ============================================== TOP MENU ============================================== -->
	<div class="top-bar animate-dropdown">
		<div class="container">
			<div class="header-top-inner">
				<div class="cnt-account">
					<ul class="list-unstyled">
						<li><a href="#"><i class="icon fa fa-user"></i>RECRUIT</a></li>
						<li><a href="#"><i class="icon fa fa-heart"></i>ENGLISH</a></li>   <!-- Change language -->
						<li><a href="#"><i class="icon fa fa-shopping-cart"></i>CONTACT</a></li>
						<li><a href="#"><i class="icon fa fa-check"></i>SITEMAP</a></li>
						<li><a href="#"><i class="icon fa fa-lock"></i>INTRANET</a></li>
					</ul>
				</div>
			</div>
			<div class="clearfix"></div>
		</div><!-- /.header-top-inner -->
	</div><!-- /.container -->
</div><!-- /.header-top --> 
<!-- ============================================== TOP MENU : END ============================================== -->
	<div class="main-header">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-3 logo-holder">
					<!-- ============================================================= LOGO ============================================================= -->
					<div class="logo">
						<a href='<c:url value="/" />'>
							<img src="<c:url value='/themes/front/images/logo.png' />" alt="" height="70">
						</a>
					</div><!-- /.logo -->
					<!-- ============================================================= LOGO : END ============================================================= -->	
				</div><!-- /.logo-holder -->
			</div><!-- /.row -->
		</div><!-- /.container -->
	</div><!-- /.main-header -->

	<!-- ============================================== NAVBAR ============================================== -->
<div class="header-nav animate-dropdown">
    <div class="container">
        <div class="yamm navbar navbar-default" role="navigation">
            <div class="navbar-header">
                <button data-target="#mc-horizontal-menu-collapse" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="nav-bg-class">
                <div class="navbar-collapse collapse" id="mc-horizontal-menu-collapse">
					<div class="nav-outer">
						<ul class="nav navbar-nav">
							<li class="logo">
								<a href='<c:url value="/" />'>
									<img src="<c:url value='/themes/front/images/logo.png' />" alt="" height="70">
								</a>
							</li>
							<li class="active yamm-fw">
								<a href='<c:url value="/front/project/list" />'>Project</a>
							</li>
							<li class="yamm mega-menu">
								<a href="<c:url value='/front/people/list' />">People</a>
							</li>

							<li class="mega-menu">
								<a href="#">Service</a>
							</li>
							<li class="">
								<a href="<c:url value='/front/about/list' />">About</a>
							</li>
							<li class="">
								<a href="<c:url value='/front/contact/list' />">Contact</a>
							</li>
						</ul><!-- /.navbar-nav -->
						<div class="clearfix"></div>				
					</div><!-- /.nav-outer -->
				</div><!-- /.navbar-collapse -->
            </div><!-- /.nav-bg-class -->
        </div><!-- /.navbar-default -->
    </div><!-- /.container-class -->

</div><!-- /.header-nav -->
<!-- ============================================== NAVBAR : END ============================================== -->

</header>

<!-- ============================================== HEADER : END ============================================== -->
<div class="body-content outer-top-xs mb-5" id="top-banner-and-menu">
	<div class="container">
		<div class="row">
			<!-- ============================================== CONTENT ============================================== -->
			<div class="col-xs-12 col-sm-12 col-md-12 homebanner-holder">
				<!-- ============================================== SCROLL TABS ============================================== -->
				<div id="product-tabs-slider" class="outer-top-vs wow fadeInUp">
					<ul class="nav nav-tabs mt-1">
						<li class="active"><a href="">Architect and construction</a></li>
						<li><a href="project_design.html">Interior design and construction</a></li>
					</ul>
					<div class="row mt-2">
						<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 pr-0 mt-15">
							<div class="project-container">
								<img src="<c:url value='/themes/front/images/products/p1.jpg' />" alt="Can't load image" class="image"/>
								<div class="text-preview">
									<span>Project small Info</span>
								</div>
								<a href="project-detail.html" class="project-text overlay">
									<div class="text-info">
										Project small Info
									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 pr-0 mt-15">
							<div class="project-container">
								<img src="<c:url value='/themes/front/images/products/p1.jpg' />" alt="Can't load image" class="image"/>
								<div class="text-preview">
									<span>Project small Info</span>
								</div>
								<a href="project-detail.html" class="project-text overlay">
									<div class="text-info">
										Project small Info
									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 pr-0 mt-15">
							<div class="project-container">
								<img src="<c:url value='/themes/front/images/products/p1.jpg' />" alt="Can't load image" class="image"/>
								<div class="text-preview">
									<span>Project small Info</span>
								</div>
								<a href="project-detail.html" class="project-text overlay">
									<div class="text-info">
										Project small Info
									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 pr-0 mt-15">
							<div class="project-container">
								<img src="<c:url value='/themes/front/images/products/p1.jpg' />" alt="Can't load image" class="image"/>
								<div class="text-preview">
									<span>Project small Info</span>
								</div>
								<a href="project-detail.html" class="project-text overlay">
									<div class="text-info">
										Project small Info
									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 pr-0 mt-15">
							<div class="project-container">
								<img src="<c:url value='/themes/front/images/products/p1.jpg' />" alt="Can't load image" class="image"/>
								<div class="text-preview">
									<span>Project small Info</span>
								</div>
								<a href="project-detail.html" class="project-text overlay">
									<div class="text-info">
										Project small Info
									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 pr-0 mt-15">
							<div class="project-container">
								<img src="<c:url value='/themes/front/images/products/p1.jpg' />" alt="Can't load image" class="image"/>
								<div class="text-preview">
									<span>Project small Info</span>
								</div>
								<a href="project-detail.html" class="project-text overlay">
									<div class="text-info">
										Project small Info
									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 pr-0 mt-15">
							<div class="project-container">
								<img src="<c:url value='/themes/front/images/products/p1.jpg' />" alt="Can't load image" class="image"/>
								<div class="text-preview">
									<span>Project small Info</span>
								</div>
								<a href="project-detail.html" class="project-text overlay">
									<div class="text-info">
										Project small Info
									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 pr-0 mt-15">
							<div class="project-container">
								<img src="<c:url value='/themes/front/images/products/p1.jpg' />" alt="Can't load image" class="image"/>
								<div class="text-preview">
									<span>Project small Info</span>
								</div>
								<a href="project-detail.html" class="project-text overlay">
									<div class="text-info">
										Project small Info
									</div>
								</a>
							</div>
						</div>
					</div>
				</div><!-- /.scroll-tabs -->
				<!-- ============================================== SCROLL TABS : END ============================================== -->
			</div><!-- /.homebanner-holder -->
			<!-- ============================================== CONTENT : END ============================================== -->
		</div><!-- /.row -->
	</div><!-- /.container -->
</div><!-- /#top-banner-and-menu -->
</body>
