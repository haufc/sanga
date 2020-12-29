<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/themes/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="about.list.title"/></title>
    <meta name="menu" content="aboutMenu"/>

	<script src="<c:url value='/themes/admin/global_assets/js/plugins/forms/validation/validate.min.js'/>"></script>
	<script src="<c:url value='/themes/admin/assets/js/repository_form.js'/>"></script>
	<script src="<c:url value='/themes/admin/assets/css/custom_style.css'/>"></script>
	<script src="<c:url value='/themes/admin/assets/js/bootbox.min.js'/>"></script>
	<script src="<c:url value='/themes/admin/assets/js/project_list.js'/>"></script>
</head>

<div class="content">
<form:form id="sliderListForm" modelAttribute="aboutSearchCriteria" action="${ctx}/admin/about/list"  method="post">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-md-8 offset-md-2">
						<form:select path="aboutType"  class="form-control listbox" aria-hidden="true">
							<form:option value="">All</form:option>
							<form:option value="0">CEO Message</form:option>
							<form:option value="1">History</form:option>
							<form:option value="2">News</form:option>
						</form:select>
					</div>
					<div class="col-md-2"><button type="submit" class="btn btn-secondary"> <i class="icon-search4"></i> <fmt:message key="button.search"/></button></div>
		    	</div>	
	    	</div>
	    </div>
	<!-- Start form cage -->
	<div class="card">
		<div class="card-header header-elements-inline">
			<span class="text-uppercase font-size-lg font-weight-bold"><fmt:message key="about.list.title"/></span>
			<div class="header-elements">
				<div class="list-icons">
					<a href="<c:url value='/admin/about/form'/>" class="btn btn-sm btn-primary" title="<fmt:message key="button.add"/>"><i class="icon-plus22"></i><fmt:message key="button.add"/></a>
               	</div>
        	</div>
		</div>
		<%-- <div class="card-body"><fmt:message key="cage.list.title.description"/></div> --%>
		<div class="table-responsive">
			<table class="table table-bordered table-striped"> 
				<thead>
					<tr class="table-success">
							<th class="text-center" style="width: 10px">#</th>				
							<th><fmt:message key="about.grid.ceophoto" ></fmt:message></th>
							<th><fmt:message key="about.grid.aboutType" ></fmt:message></th>
							<th><fmt:message key="about.grid.desc"></fmt:message></th>
							<th><fmt:message key="about.grid.descKr" ></fmt:message></th>
							<th class="text-center" style="width:100px;"><i class="icon-menu-open2"></i></th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty page.content}">
						<tr><td colspan="6" class="text-center text-none-data"><fmt:message key="not.data"/></td></tr>
					</c:if>
					<c:forEach var="about" items="${page.content}" varStatus="cnt">
						<tr>
							<td class="text-center"><c:out value="${cnt.count+page.size*page.number}" /></td>													
							<td><img alt="" height="100px" width="100px" src='<c:url value="${about.ceoPhoto}" />'></td>
							<td>${about.aboutType}</td>
							<td>${about.description}</td>
							<td>${about.descriptionKr}</td>
							<td class="text-center"> 
								<div class="list-icon"> 
									<a href="<c:url value="/admin/about/form?id=${about.id}"/>" class="list-icons-item text-primary-600"><i class="icon-pencil7"></i></a>
									<a onclick="confirmDel()" href="<c:url value="/admin/about/delete/${about.id}"/>" class="list-icons-item text-primary-600"><i class="icon-trash"></i></a>
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
