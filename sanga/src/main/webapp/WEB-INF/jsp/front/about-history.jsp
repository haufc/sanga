<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/themes/common/taglibs.jsp"%>

<head>
	<title><fmt:message key="title.page.about.history"/></title>
</head>

<!-- ============================================== HEADER : END ============================================== -->
<div class="body-content outer-top-xs mb-5" id="top-banner-and-menu">
	<div class="container">
		<div class="row">
			<!-- ============================================== CONTENT ============================================== -->
			<div class="col-xs-12 col-sm-12 col-md-12 homebanner-holder">
				<!-- ============================================== SCROLL TABS ============================================== -->
				<div id="product-tabs-slider" class="outer-top-vs wow fadeInUp">
					<ul class="nav nav-tabs mt-1">
						<li><a href="<c:url value='/front/about/0' />">CEO Message</a></li>
						<li class="active"><a href="#">History</a></li>
						<li><a href="<c:url value='/front/about/2' />">News</a></li>
					</ul>
				</div><!-- /.scroll-tabs -->
				<!-- ============================================== SCROLL TABS : END ============================================== -->
			</div><!-- /.homebanner-holder -->
			<div class="wrapper-about col-xs-12 col-sm-12 col-md-12">
				<div class="title">
					<h3>History</h3>
				</div>
				<div class="row message-info">
						<%-- <div class="col-md-4 col-sm-4 col-xs-12 ">
							<c:if test="${not empty abouts and abouts.size() gt 0}">
								<img src="<c:url value='${abouts[0].ceoPhoto}' />" alt="">
							</c:if>
						</div> --%>
						<div class="col-col-12 col-sm-12 col-xs-12">
							<div class="content">
								<c:if test="${not empty abouts and abouts.size() gt 0}">
									<c:out value="${abouts[0].description}" escapeXml="false"/>
								</c:if>
							</div>
						</div>
					</div>
			</div>
			<!-- ============================================== CONTENT : END ============================================== -->
		</div><!-- /.row -->	
	</div><!-- /.container -->
</div><!-- /#top-banner-and-menu -->
