<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/themes/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="slider.form.title"/></title>
    <meta name="menu" content="farmMenu"/>
	<script src="<c:url value='/themes/admin/global_assets/js/plugins/extensions/jquery_ui/interactions.min.js'/>"></script>
    <script src="<c:url value='/themes/admin/global_assets/js/plugins/forms/selects/select2.min.js'/>"></script>
    <script src="<c:url value='/themes/admin/global_assets/js/demo_pages/form_select2.js'/>"></script>

    <script src="<c:url value='/themes/admin/global_assets/js/plugins/forms/styling/uniform.min.js'/>"></script>
    <script src="<c:url value='/themes/admin/global_assets/js/plugins/notifications/pnotify.min.js'/>"></script>
    <script src="<c:url value='/themes/admin/global_assets/js/plugins/forms/selects/bootstrap_multiselect.js'/>"></script>
    <script src="<c:url value='/themes/admin/global_assets/js/demo_pages/form_multiselect.js'/>"></script>
    <script src="<c:url value='/themes/admin/global_assets/js/plugins/forms/validation/validate.min.js'/>"></script>
</head>


<!-- Content area -->
<div class="content">
<form:form id="slider" modelAttribute="slider" action="${ctx}/admin/slider/save" method="post" role="form" enctype="multipart/form-data">
<form:hidden path="id"/>
<form:hidden path="sliderImgUrl"/>
	<!-- Basic layout-->
	<div class="card">
		<div class="card-header header-elements-inline"><span class="text-uppercase font-size-lg font-weight-bold"><fmt:message key="slider.form.title"/></span></div>
		<div class="card-body">
			<p class="mb-4"><fmt:message key="slider.form.title.description"/></p>
			<fieldset class="mb-3">
				<legend class="text-uppercase font-size-sm font-weight-bold"><fmt:message key="template.legend"/></legend>
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<div class="form-group">
									<label><fmt:message key="slider.title"/><span class="help-block">*</span></label>
									<input type="text" id="title" name="title" value="${slider.title}" class="form-control" required="required"  maxlength="30"/>
									<div><span id="messageCheckCode" style="display: none;"></span></div>
								</div>
							</div>
							
							<div class="col-xs-12 col-md-6">
								<div class="form-group">
									<label><fmt:message key="slider.titleKr"/><span class="help-block">*</span></label>
									<input type="text" name="titleKr" value="${slider.titleKr}" class="form-control" required="required" maxlength="200"/>
								</div>
							</div>
							
							<div class="col-xs-12 col-md-12">
								<div class="form-group">
									<label><fmt:message key="slider.description"/></label>
									<textarea rows="5" name="description" class="form-control" maxlength="200">${slider.description} </textarea>
								</div>
							</div>
							
							<div class="col-xs-12 col-md-12">
								<div class="form-group">
									<label><fmt:message key="slider.descriptionKr"/></label>
									<textarea rows="5" name="descriptionKr"  class="form-control" maxlength="200">${slider.descriptionKr} </textarea>
								</div>
							</div>
							
							<div class="col-xs-12 col-md-2">
								<div class="form-group">
									<label><fmt:message key="slider.sort"/></label>
									<input type="number" name=sort value="${slider.sort}" class="form-control" max="100" min="0" step="1"/>
								</div>
							</div>
							
							<div class="col-md-4">
								<span class="text-uppercase font-size-sm font-weight-bold"><fmt:message key="file.title"/></span>
								<p><fmt:message key="file.choose"/></p>
								<div class="file-loading col-md-3"><input type="file" id="avatar" accept="image/*" name="file" class="file-input-overwrite"></div>
							</div>
							<div class="col-md-4">
								<c:if test="${not empty slider.sliderImgUrl}">
									<img alt="slider" src="<c:url value='${slider.sliderImgUrl}'/>" width="200px" height="200px">
								</c:if>
								
							</div>

	        			</div>
	        			
					</div>
				</div>
				<div class="d-flex justify-content-end align-items-center">
					<a href="<c:url value="/admin/slider/list"/>" id="back" class="btn btn-light"><i class="icon-point-left mr-2"></i><fmt:message key="button.back"/></a>
					<button type="submit" id="sliderSubmit" class="btn btn-primary ml-3"><fmt:message key="button.save"/><i class="icon-database-insert ml-2"></i></button>
				</div>			
			</fieldset>
		</div>
	</div>
	<!-- /basic layout -->
</form:form>
</div>
<!-- /content area -->
