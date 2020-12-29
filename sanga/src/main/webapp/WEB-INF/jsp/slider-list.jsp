<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/themes/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="slider.list.title"/></title>
    <meta name="menu" content="sliderMenu"/>

	<script src="<c:url value='/themes/admin/global_assets/js/plugins/forms/validation/validate.min.js'/>"></script>
	<script src="<c:url value='/themes/admin/assets/js/repository_form.js'/>"></script>
	<script src="<c:url value='/themes/admin/assets/css/custom_style.css'/>"></script>
</head>

<div class="content">
<form:form id="sliderListForm" modelAttribute="criteria" action="${ctx}/slider/list"  method="post">
	<input type="hidden" name="sliderId" value="${criteria.id}"/>
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-md-8 offset-md-2"><input class="form-control" type="text" name="title" placeholder="Enter title"/></div>
					<div class="col-md-2"><button type="submit" class="btn btn-secondary"> <i class="icon-search4"></i> <fmt:message key="button.search"/></button></div>
		    	</div>	
	    	</div>
	    </div>
	<!-- Start form cage -->
	<div class="card">
		<div class="card-header header-elements-inline">
			<span class="text-uppercase font-size-lg font-weight-bold"><fmt:message key="slider.list"/></span>
			<div class="header-elements">
				<div class="list-icons">
					<a href="<c:url value='/admin/slider/form'/>" class="btn btn-sm btn-primary" title="<fmt:message key="button.add"/>"><i class="icon-plus22"></i><fmt:message key="button.add"/></a>
               	</div>
        	</div>
		</div>
		<div class="card-body"><fmt:message key="slider.list.title.description"/></div>
		<div class="table-responsive">
			<table class="table table-bordered table-striped">
				<thead>
					<tr class="table-success">
						<th class="text-center" style="width: 10px">#</th>									
						<th><fmt:message key="slider.title"/></th>
						<th><fmt:message key="slider.titleKr"/></th>
						<th><fmt:message key="slider.sort"/></th>
						<th class="text-center" style="width:100px;"><i class="icon-menu-open2"></i></th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty page.content}">
						<tr><td colspan="6" class="text-center text-none-data"><fmt:message key="not.data"/></td></tr>
					</c:if>
					<c:forEach var="slider" items="${page.content}" varStatus="cnt">
						<tr>
							<td class="text-center"><c:out value="${cnt.count+page.size*page.number}" /></td>													
							<td>${slider.title}</td>
							<td>${slider.titleKr}</td>
							<td>${slider.sort}</td>
							<td class="text-center"> 
								<div class="list-icon"> 
									<a href="<c:url value="/admin/slider/form?id=${slider.id}"/>" class="list-icons-item text-primary-600"><i class="icon-pencil7"></i></a>
								</div> 
							</td>
						</tr> 
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- Pagination -->
         <jsp:include page="/themes/admin/common/pagination.jsp">
            <jsp:param value="${page.number}" name="pageNumber"/>
            <jsp:param value="${page.totalPages}" name="maxPages"/>
            <jsp:param value="${page.size}" name="size"/>
            <jsp:param value="${page.totalElements}" name="totalElements"/>
         </jsp:include>
	</div>
</form:form>
</div>
