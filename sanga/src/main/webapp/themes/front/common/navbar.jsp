<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/themes/common/taglibs.jsp"%>
<header class="header-style-1">
	<!-- ============================================== TOP MENU ============================================== -->
	<div class="top-bar animate-dropdown">
		<div class="container">
			<div class="header-top-inner">
				<div class="cnt-account">
					<!-- <ul class="list-unstyled">
						<li><a href="#"><i class="icon fa fa-user"></i>RECRUIT</a></li>
						<li><a href="#"><i class="icon fa fa-heart"></i>ENGLISH</a></li>   Change language
						<li><a href="#"><i class="icon fa fa-shopping-cart"></i>CONTACT</a></li>
						<li><a href="#"><i class="icon fa fa-check"></i>SITEMAP</a></li>
						<li><a href="#"><i class="icon fa fa-lock"></i>INTRANET</a></li>
					</ul> -->
				</div>
			</div>
			<div class="clearfix"></div>
		</div><!-- /.header-top-inner -->
	</div><!-- /.container -->
	<!-- ============================================== TOP MENU : END ============================================== -->
	<div class="main-header">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-3 logo-holder">
					<!-- ============================================================= LOGO ============================================================= -->
					<div class="logo">
						<a href="home.html">
							<img src="/themes/front/assets/images/logo.png" alt="" height="70">
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
							<ul id="nav-list" class="nav navbar-nav">
								<li class="logo">
									<a href='<c:url value="/" />'>
										<img src="/themes/front/assets/images/logo.png" alt="" height="70">
									</a>
								</li>
								<li class="nav-flag yamm-fw">
									<a href='<c:url value="/front/project/list" />'>Project</a>
								</li>
								<li class="nav-flag yamm mega-menu">
									<a href="<c:url value='/front/employee/list' />">People</a>
								</li>
	
								<li class="nav-flag mega-menu">
									<a href="#">Service</a>
								</li>
								<li class="nav-flag">
									<a href="<c:url value='/front/about/0' />">About</a>
								</li>
								<li class="nav-flag">
									<a href="<c:url value='/front/contact' />">Contact</a>
								</li>
							</ul>
							<!-- /.navbar-nav -->
							<div class="clearfix"></div>				
						</div><!-- /.nav-outer -->
					</div><!-- /.navbar-collapse -->
	            </div><!-- /.nav-bg-class -->
	        </div><!-- /.navbar-default -->
	    </div><!-- /.container-class -->
	
	</div><!-- /.header-nav -->
	<!-- ============================================== NAVBAR : END ============================================== -->
</header>
<script>
	$(document).ready(function() {
		var navLst = document.getElementById('nav-list');
		var navbarArr = navLst.getElementsByClassName('nav-flag');
		for (let i = 0; i < navbarArr.length; i++) {
			navbarArr[i].addEventListener("click", function() {
				var currentActive = document.getElementsByClassName('active');
				if (currentActive[0]) {
					currentActive[0].className = currentActive[0].className.replace(" active", "");
				}
				this.className += " active"
			});
		}
	})
</script>