<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/themes/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="project.form.title"/></title>
    <meta name="menu" content="${from}Menu"/>
    
	<!-- script select -->
<%-- 	<script src="<c:url value='/themes/admin/global_assets/js/plugins/extensions/jquery_ui/interactions.min.js'/>"></script> --%>
	<script src="<c:url value='/themes/admin/global_assets/js/plugins/forms/selects/select2.min.js'/>"></script>

	<script src="<c:url value='/themes/admin/global_assets/js/plugins/forms/styling/uniform.min.js'/>"></script>
	<script src="<c:url value='/themes/admin/global_assets/js/plugins/forms/validation/validate.min.js'/>"></script>
	<script src="<c:url value='/themes/admin/global_assets/js/plugins/editors/tinymce_4.7.4/tinymce.min.js'/>"></script>
	<script src="<c:url value='/themes/admin/assets/js/employee_form.js'/>"></script>
</head>

<form:form id="projectFrom" modelAttribute="employee" action="${ctx}/admin/employee/save" method="post" role="form" enctype="multipart/form-data">
<!-- Content area -->
<div class="content">
	<!-- Basic layout-->
	<div class="card">
		<div class="card-header header-elements-inline">
			<span class="text-uppercase font-size-lg font-weight-bold"><fmt:message key="employee.form"/></span>
			<div class="header-elements">
				<div class="list-icons">
               		<a class="list-icons-item" data-action="collapse"></a>
               		<a class="list-icons-item" data-action="reload"></a>
               		<a class="list-icons-item" data-action="remove"></a>
               	</div>
            </div>
		</div>
	
		<div class="card-body">
			<p class="mb-4"><fmt:message key="employee.form.Title"/></p>
			<fieldset class="mb-3">
				<legend class="text-uppercase font-size-sm font-weight-bold"><fmt:message key="template.legend"/></legend>
				<div class="tab-content">
					<!--cau hinh menu  -->
					<div class="card">
						<div class="card-header header-elements-inline"><span class="text-uppercase font-size-lg font-weight-bold"><fmt:message key="project.formDetail"/></span></div>
						<input type="hidden" name="id" value="${employee.id}" class="form-control"/>
						<input type="hidden" name="avatarUrl" value="${employee.avatarUrl}" class="form-control"/>
						<div class="card-body">
								<div class="row">
		        				<div class="col-md-4">
		        					<div class="form-group">
			        					<label><fmt:message key="employee.form.name"/><span class="help-block">*</span></label>
			        					<input name="name" value="${employee.name }" class="form-control"/>
			        				</div>
		        				</div>
		        				<div class="col-md-4">
		        					<div class="form-group">
			        					<label><fmt:message key="employee.form.position"/><span class="help-block">*</span></label>
			        					<input name="position" value="${employee.position}" class="form-control"/>
			        				</div>
		        				</div>
		        				<div class="col-md-4">
		        					<div class="form-group">
			        					<label><fmt:message key="employee.form.positionKr"/><span class="help-block">*</span></label>
			        					<input name="positionKr" value="${employee.positionKr}" class="form-control"/>
			        				</div>
		        				</div>
		        			</div>
								<div class="row">
		        				<div class="col-md-6">
									<div class="form-group">
										<label><fmt:message key="employee.form.projectType"/><span class="help-block"></span></label>
										<form:select path="projectType"  class="form-control listbox" aria-hidden="true">
											<form:option value="0">Architech and Construction</form:option>
											<form:option value="1">Interior design and construction</form:option>
										</form:select>
									</div>
								</div>
								<div class="col-md-6">
		        					<div class="form-group">
		        						<p><fmt:message key="employee.form.avatarUrl"/></p>
							 			<div class="file-loading col-md-3">
							 				<input type="file" id="file" accept="image/*" name="file" class="file-input-overwrite">
							 			</div>
		        					</div>
		        				</div>
		        			</div>
		        			<div class="row">
		        				<div class="col-md-6">
									<div class="form-group">
										<label><fmt:message key="employee.form.profile"/><span class="help-block">*</span></label>
										<textarea rows="4" cols="" name="profile" class="form-control">${employee.profile}</textarea>
									</div>
								</div> 
								<div class="col-md-6">
									<div class="form-group">
										<label><fmt:message key="employee.form.profileKr"/><span class="help-block">*</span></label>
										<textarea rows="4" cols="" name="profileKr" class="form-control">${employee.profileKr}</textarea>
									</div>
								</div> 
		        			</div>
		        			<div class="row">
		        				<div class="col-md-6">
									<div class="form-group">
										<label><fmt:message key="employee.form.project"/><span class="help-block">*</span></label>
										<textarea rows="4" cols="" id="project" name="project" class="form-control">${employee.project}</textarea>
									</div>
								</div> 
								<div class="col-md-6">
									<div class="form-group">
										<label><fmt:message key="employee.form.projectKr"/><span class="help-block">*</span></label>
										<textarea rows="4" cols="" id="projectKr" name="projectKr" class="form-control">${employee.projectKr}</textarea>
									</div>
								</div> 
		        			</div>
				         	<div class="d-flex justify-content-end align-items-center">		
				         		<a href="/admin/employee/list" class="btn btn-info ml-3"><fmt:message key="button.back"/><i class="icon-backward2 ml-2"></i></a>
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


