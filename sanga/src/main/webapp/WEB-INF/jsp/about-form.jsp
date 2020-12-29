<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/themes/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="about.form"/></title>
    <meta name="menu" content="aboutMenu"/>
    
	<!-- script select -->
<%-- 	<script src="<c:url value='/themes/admin/global_assets/js/plugins/extensions/jquery_ui/interactions.min.js'/>"></script> --%>
	<script src="<c:url value='/themes/admin/global_assets/js/plugins/forms/selects/select2.min.js'/>"></script>

	<script src="<c:url value='/themes/admin/global_assets/js/plugins/forms/styling/uniform.min.js'/>"></script>
	<script src="<c:url value='/themes/admin/global_assets/js/plugins/forms/validation/validate.min.js'/>"></script>
	<script src="<c:url value='/themes/admin/assets/js/staff_form.js'/>"></script>
	<script src="<c:url value='/themes/admin/global_assets/js/plugins/editors/tinymce_4.7.4/tinymce.min.js'/>"></script>
	<script src="<c:url value='/themes/admin/assets/js/about_form.js'/>"></script>
</head>

<form:form id="projectFrom" modelAttribute="about" action="${ctx}/admin/about/save" method="post" role="form" enctype="multipart/form-data">
<!-- Content area -->
<div class="content">
	<!-- Basic layout-->
	<div class="card">
		<div class="card-header header-elements-inline">
			<span class="text-uppercase font-size-lg font-weight-bold"><fmt:message key="about.form"/></span>
			<div class="header-elements">
				<div class="list-icons">
               		<a class="list-icons-item" data-action="collapse"></a>
               		<a class="list-icons-item" data-action="reload"></a>
               		<a class="list-icons-item" data-action="remove"></a>
               	</div>
            </div>
		</div>
	
		<div class="card-body">
			<p class="mb-4"><fmt:message key="project.formDesc"/></p>
			<fieldset class="mb-3">
				<legend class="text-uppercase font-size-sm font-weight-bold"><fmt:message key="template.legend"/></legend>
				<div class="tab-content">
					<!--cau hinh menu  -->
					<div class="card">
						<div class="card-header header-elements-inline"><span class="text-uppercase font-size-lg font-weight-bold"><fmt:message key="project.formDetail"/></span></div>
						<input type="hidden" name="id" value="${about.id}" class="form-control"/>
						<input type="hidden" name="ceoPhoto" value="${about.ceoPhoto}" class="form-control"/>
						<div class="card-body">
								<div class="row">
		        				<div class="col-md-6">
									<div class="form-group">
										<label><fmt:message key="about.form.type"/><span class="help-block"></span></label>
										<form:select path="aboutType"  class="form-control listbox" aria-hidden="true">
											<form:option value="0">CEO Message</form:option>
											<form:option value="1">History</form:option>
											<form:option value="2">News</form:option>
										</form:select>
									</div>
								</div>
								<div class="col-md-3">
		        					<div class="form-group">
		        						<p><fmt:message key="about.form.ceophoto"/></p>
							 			<div class="file-loading col-md-3">
							 				<input type="file" id="file" accept="image/*" name="file" class="file-input-overwrite">
							 			</div>
		        					</div>
		        				</div>
		        				<div class="col-md-3">
		        					<c:if test="${not empty about.ceoPhoto and about.ceoPhoto ne ''}">
		        						<img width="200px" height="200px" alt="" src='<c:url value="${about.ceoPhoto}"/>'>
		        					</c:if>
		        				</div>
		        			</div>
		        			<div class="row">
		        				<div class="col-md-6">
									<div class="form-group">
										<label><fmt:message key="about.form.desc"/><span class="help-block">*</span></label>
										<textarea id="description" rows="4" cols="" name="description" class="form-control" escapeXml="false">${about.description}</textarea>
									</div>
								</div> 
								<div class="col-md-6">
									<div class="form-group">
										<label><fmt:message key="about.form.descKr"/><span class="help-block">*</span></label>
										<textarea rows="4" cols="" id="descriptionKr" name="descriptionKr" class="form-control" escapeXml="false">${about.descriptionKr}</textarea>
									</div>
								</div> 
		        			</div>
				         	<div class="d-flex justify-content-end align-items-center">		
				         		<a href="/admin/about/list" class="btn btn-info ml-3"><fmt:message key="button.back"/><i class="icon-backward2 ml-2"></i></a>
				         		<button type="submit" class="btn btn-primary ml-3"><fmt:message key="button.save"/><i class="icon-database-insert ml-2"></i></button>	
							</div>
						</div>
					</div>
				</div>					
			</fieldset>
		</div>
	</div>
	<!-- /basic layout -->
</div>
<!-- /content area -->
</form:form>


