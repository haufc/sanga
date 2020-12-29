<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/themes/common/taglibs.jsp"%>
<head>
	<title></title>
	<link href="/themes/front/assets/css/product-detail.css"  rel="stylesheet"/>
</head>

<!-- ============================================== CONTENT ============================================== -->
	<div class="container">
			<div class="col-xs-12 col-sm-7 col-md-7 homebanner-holder">
				<section class="carousel" aria-label="Gallery">
					<ol class="carousel__viewport">
						<li id="carousel__slide1" tabindex="0" class="carousel__slide">
							<div class="carousel-img">
								<img src='<c:url value="${project.sliderImgUrl}"></c:url>' alt="">
							</div>
						</li>
						<c:forEach var="imgThumb" items="${project.imageThumbnails}" varStatus="loop">
							<li id='<c:out value="carousel__slide${loop.index + 2}"></c:out>'  tabindex="0" class="carousel__slide">
								<div class="carousel-img">
									<img src='<c:url value="${imgThumb.imgUrl}"></c:url>' alt="">
								</div>
							</li>
						</c:forEach>
					</ol>
					<aside class="carousel__navigation">
						<ol class="carousel__navigation-list">
							<li class="carousel__navigation-item">
								<a href="#carousel__slide1"
									class="carousel__navigation-button">
									<span>1</span>
								</a>
							</li>
							<c:forEach var="imgThumb" items="${project.imageThumbnails}" varStatus="loop">
								<li class="carousel__navigation-item">
									<a href='<c:out value="#carousel__slide${loop.index + 2}"></c:out>'
										class="carousel__navigation-button">
										<span>${loop.index + 2}</span>
									</a>
								</li>
							</c:forEach>
						</ol>
					</aside>
				</section>
			</div><!-- /.homebanner-holder -->
			<div class="wrapper-detail col-xs-12 col-sm-5 col-md-5">
				<div class="pj-wrapper">
					<h3>${project.name }</h3>
					<h6 class="pj-position">${project.title}</h6>
					<div class="architect-desc">
						${project.description}
					</div>
				</div>
				<div class="view-text-wrapper">
					<div class="row"><div class="col-md-3 hr-style"></div>
					<div class="col-md-9 hr-style-o"></div></div>
					<div class="row">
						<div class="col-md-3">Year</div>
						<div class="col-md-9 text">2020</div>
					</div>
					<div class="row">
						<div class="col-md-3">Location</div>
						<div class="col-md-9 text">${project.location}</div>
					</div>
					<div class="row">
						<div class="col-md-3">Principle use</div>
						<div class="col-md-9 text">${project.principleUse }</div>
					</div>
					<div class="row">
						<div class="col-md-3">Scale</div>
						<div class="col-md-9 text">${project.scale }</div>
					</div>
				</div>
			</div>
	</div>