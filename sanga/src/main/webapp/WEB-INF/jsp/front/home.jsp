<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/themes/common/taglibs.jsp"%>

<head>
	<title><fmt:message key="title.page.home"/></title>
</head>

<!-- ============================================== CONTENT ============================================== -->
		<div class="col-xs-12 col-sm-12 col-md-12 homebanner-holder">
			<!-- ========================================== SECTION – HERO ========================================= -->
			<div id="hero">
				<div id="owl-main" class="owl-carousel owl-inner-nav owl-ui-sm">
					<c:forEach var="slider" items="${sliders}" varStatus="cnt">
						<div class="item" style="background-image: url('<c:url value="${slider.sliderImgUrl}" />');">
							<div class="container-fluid">
								<div class="caption bg-color vbertical-center">
									<div class="excerpt fadeInDown-2 hidden-xs">
										<span class="text-white">${slider.title}</span>
									</div>
								</div><!-- /.caption -->
							</div><!-- /.container-fluid -->
						</div><!-- /.item -->
					</c:forEach>
				</div><!-- /.owl-carousel -->
			</div>
<!-- ========================================= SECTION – HERO : END ========================================= -->	
			<!-- ============================================== SCROLL TABS ============================================== -->
		<div id="product-tabs-slider" class="scroll-tabs outer-top-vs wow fadeInUp">
			<div class="more-info-tab clearfix ">
				<h3 class="new-product-title pull-left">
					<a href="#all">All |</a>
					<a href="#news">News</a>
				</h3>
			</div>
			<div class="container-fluid">
				<div class="project-review">
					<div class="row owl-project">
						<c:forEach var="project" items="${projects}" varStatus="cnt">
							<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 item mt-1 padding-pj-review">
								<div class="project">
									<div class="project-image">
										<div class="image">
											<a href='<c:url value="/front/project-detail/${project.id}"></c:url>'><img  src='<c:url value="${project.sliderImgUrl}"></c:url>' class="box-size-img" alt=""></a>
										</div>
									</div>
									<div class="project-review">
										<span>${project.name}</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div><!-- /.scroll-tabs -->
<!-- ============================================== SCROLL TABS : END ============================================== -->
		</div><!-- /.homebanner-holder -->
		<!-- ============================================== CONTENT : END ============================================== -->