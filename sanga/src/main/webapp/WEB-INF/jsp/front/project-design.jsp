<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/themes/common/taglibs.jsp"%>
<head>
	<title><fmt:message key="title.page.project"/></title>
</head>

<!-- ============================================== CONTENT ============================================== -->
	<div class="container">
			<div class="col-xs-12 col-sm-12 col-md-12 homebanner-holder mb-5">
				<!-- ============================================== SCROLL TABS ============================================== -->
				<div id="product-tabs-slider" class="outer-top-vs wow fadeInUp">
					<ul class="nav nav-tabs mt-1">
						<c:choose>
						    <c:when test="${type=='0'}">
						       	<li class="active"><a href="#">Architect and construction</a></li>
								<li><a href='<c:url value="/front/project/list?type=1"></c:url>'>Interior design and construction</a></li>
						    </c:when>    
						    <c:otherwise>
						        <li><a href='<c:url value="/front/project/list"></c:url>'>Architect and construction</a></li>
								<li class="active"><a href="#">Interior design and construction</a></li>
						    </c:otherwise>
						</c:choose>
						
					</ul>
					<div class="row mt-2">
						<c:forEach var="project" items="${projects}">
							<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 pr-0 mt-15">
								<div class="project-container">
									<img src='<c:url value="${project.sliderImgUrl}"></c:url>' alt="Can't load image" class="image"/>
									<div class="text-preview">
										<span>${project.name } | <fmt:message key="project.categoryType.${project.projectCatelogType }" /></span>
									</div>
									<a href='<c:url value="/front/project-detail/${project.id}"></c:url>' class="project-text overlay">
										<div class="text-info">
											${project.name }
										</div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div><!-- /.scroll-tabs -->
				<!-- ============================================== SCROLL TABS : END ============================================== -->
			</div><!-- /.homebanner-holder -->
</div>