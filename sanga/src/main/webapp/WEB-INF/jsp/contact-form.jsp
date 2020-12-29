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
</head>

<form:form id="projectFrom" modelAttribute="contact" action="${ctx}/admin/contact/save" method="post" role="form" enctype="multipart/form-data">
<!-- Content area -->
<div class="content">
	<!-- Basic layout-->
	<div class="card">
		<div class="card-header header-elements-inline">
			<span class="text-uppercase font-size-lg font-weight-bold"><fmt:message key="contact.form"/></span>
			<div class="header-elements">
				<div class="list-icons">
               		<a class="list-icons-item" data-action="collapse"></a>
               		<a class="list-icons-item" data-action="reload"></a>
               		<a class="list-icons-item" data-action="remove"></a>
               	</div>
            </div>
		</div>
	
		<div class="card-body">
			<p class="mb-4"><fmt:message key="contact.form.desc"/></p>
			<fieldset class="mb-3">
				<legend class="text-uppercase font-size-sm font-weight-bold"><fmt:message key="template.legend"/></legend>
				<div class="tab-content">
					<!--cau hinh menu  -->
					<div class="card">
						<div class="card-header header-elements-inline"><span class="text-uppercase font-size-lg font-weight-bold"><fmt:message key="project.formDetail"/></span></div>
						<input type="hidden" name="id" value="${contact.id}" class="form-control"/>
						<div class="card-body">
								<div class="row">
		        				<div class="col-md-4">
									<div class="form-group">
										<label><fmt:message key="contact.form.mainBranch"/><span class="help-block"></span></label>
										<form:select path="mainBranch"  class="form-control listbox" aria-hidden="true">
											<form:option value="1">On</form:option>
											<form:option value="0">Off</form:option>
										</form:select>
									</div>
								</div>
								<div class="col-md-4">
		        					<div class="form-group">
		        						<label><fmt:message key="contact.form.email"/></label>
							 			<input type="email" value="${contact.email}" id="email"  name="email" class="form-control"/>
		        					</div>
		        				</div>
		        				<div class="col-md-4">
									<div class="form-group">
										<label><fmt:message key="contact.form.phone"/><span class="help-block">*</span></label>
										<input type="text" maxlength="20" value="${contact.phone}" id="phone"  name="phone" class="form-control"/>
									</div>
								</div> 
		        			</div>
		        			<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label><fmt:message key="about.form.address"/><span class="help-block">*</span></label>
										<textarea rows="4" cols="" name="address" class="form-control">${contact.address}</textarea>
									</div>
								</div> 
								<div class="col-md-6">
									<div class="form-group">
										<label><fmt:message key="about.form.addressKr"/><span class="help-block">*</span></label>
										<textarea rows="4" cols="" name="addressKr" class="form-control">${contact.addressKr}</textarea>
									</div>
								</div> 
		        			</div>
				         	<div class="d-flex justify-content-end align-items-center">		
				         		<a href="/admin/contact/list" class="btn btn-info ml-3"><fmt:message key="button.back"/><i class="icon-backward2 ml-2"></i></a>
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


