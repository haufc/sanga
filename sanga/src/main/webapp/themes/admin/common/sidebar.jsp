<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/themes/common/taglibs.jsp"%>

		<div class="sidebar sidebar-light sidebar-main sidebar-expand-md">
			<!-- Sidebar mobile toggler -->
			<div class="sidebar-mobile-toggler text-center">
				<a href="#" class="sidebar-mobile-main-toggle"><i class="icon-arrow-left8"></i></a>
				Navigation
				<a href="#" class="sidebar-mobile-expand"><i class="icon-screen-full"></i><i class="icon-screen-normal"></i></a>
			</div>
			<!-- /sidebar mobile toggler -->


			<!-- Sidebar content -->
			<div class="sidebar-content">

				<!-- User menu -->
				<div class="sidebar-user">
					<div class="card-body">
						<div class="media">
							<div class="mr-3"><a href="#"><img src="<c:url value='/themes/admin/global_assets/images/avatar.png'/>" width="38" height="38" class="rounded-circle" alt=""></a></div>
							<div class="media-body">
								<div class="media-title font-weight-semibold"><%-- <fmt:message key="label.hello"/> ${USERNAME} --%>Hello, ${pageContext.request.remoteUser} Admin</div>
								<div class="font-size-xs opacity-50"><i class="icon-pin font-size-sm"></i> &nbsp;<!-- Santa Ana, CA --></div>
							</div>
							<div class="ml-3 align-self-center"><a href="#" class="text-white"><i class="icon-cog3"></i></a></div>
						</div>
					</div>
				</div>
				<!-- /user menu -->

				<!-- Main navigation -->
				<div class="card card-sidebar-mobile">
					<ul class="nav nav-sidebar" data-nav-type="accordion">

						<!-- Main -->
						<li class="nav-item-header"><div class="text-uppercase font-size-xs line-height-xs">Main</div> <i class="icon-menu" title="Main"></i></li>
						<li class="nav-item"><a href="<c:url value='/admin'/>" class="nav-link active"><i class="icon-home4"></i><span><fmt:message key="menu.home"/></span></a></li>
						
						
						<!-- /Catalog -->
						
						<!-- Slider Management -->
						<li class="nav-item nav-item"><a menu="SliderMenu" href="<c:url value='/admin/slider/list'/>" class="nav-link"><i class="icon-popout"></i> <span><fmt:message key="menu.slider"/></span></a></li>
						<!-- /Slider Management -->
						
						<!-- Project Management -->
						<li class="nav-item nav-item"><a menu="ProjectMenu" href="<c:url value='/admin/project/list'/>" class="nav-link"><i class="icon-archive"></i> <span><fmt:message key="menu.project"/></span></a></li>
						<!-- /Project Management -->
						
						<!-- Project Management -->
						<li class="nav-item nav-item"><a menu="EmployeeMenu" href="<c:url value='/admin/employee/list'/>" class="nav-link"><i class="icon-reading"></i> <span><fmt:message key="menu.employee"/></span></a></li>
						<!-- /Project Management -->
						
						<!-- Project Management --> 
						<li class="nav-item nav-item"><a menu="AboutMenu" href="<c:url value='/admin/about/list'/>" class="nav-link"><i class="icon-profile"></i> <span><fmt:message key="menu.about"/></span></a></li>
						<!-- /Project Management -->
						
						<!-- Project Management --> 
						<li class="nav-item nav-item"><a menu="AboutMenu" href="<c:url value='/admin/contact/list'/>" class="nav-link"><i class="icon-profile"></i> <span><fmt:message key="menu.contact"/></span></a></li>
						<!-- /Project Management -->
						
						
				<li class="nav-item nav-item" style="bottom: 0px; position: relative;"><a onclick="changeIcon()" href="#" class="cnavbar-nav-link sidebar-control sidebar-main-toggle nav-link"><i class="fa fa-angle-double-left" id="collapse"></i><span><fmt:message key="menu.collapse"/></span></a></li>
						
					</ul>
				</div>
				<!-- /main navigation -->

			</div>
			<!-- /sidebar content -->
			
		</div>
<script>
	function changeIcon() {
		if($('#collapse').hasClass("fa-angle-double-left")) {
			$('i.fa-angle-double-left').replaceWith("<i class='fa fa-angle-double-right' id='collapse'></i>");
			
		} else {
			$('i.fa-angle-double-right').replaceWith("<i class='fa fa-angle-double-left' id='collapse'></i>");
		}
		
	}
</script>