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
	<script src="<c:url value='/themes/admin/assets/js/project_form.js'/>"></script>"
</head>

<form:form id="projectFrom" modelAttribute="project" action="${ctx}/admin/project/save" method="post" role="form" enctype="multipart/form-data">
<!-- Content area -->
<div class="content">
	<!-- Basic layout-->
	<div class="card">
		<div class="card-header header-elements-inline">
			<span class="text-uppercase font-size-lg font-weight-bold"><fmt:message key="project.form"/></span>
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
						<input type="hidden" name="id" value="${project.id}" class="form-control"/>
						<input type="hidden" name="sliderImgUrl" value="${project.sliderImgUrl}" class="form-control"/>
						<div class="card-body">
			        			<div class="row">
			        				<div class="col-md-4">
										<div class="form-group">
											<label><fmt:message key="project.form.name"/><span class="help-block">*</span></label>
											<input type="text" name="name" value="${project.name}" class="form-control" required="required"  maxlength="100"/>
										</div>
									</div> 
									<div class="col-md-4">
										<div class="form-group">
											<label><fmt:message key="project.form.title"/><span class="help-block">*</span></label>
											<input type="text" name="title" value="${project.title}" class="form-control" required="required"  maxlength="100"/>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label><fmt:message key="project.form.titleKr"/><span class="help-block"></span></label>
											<input type="text" name="titleKr" value="${project.titleKr}" class="form-control" maxlength="100"/>
										</div>
									</div>
			        			</div>
			        			<div class="row">
			        				<div class="col-md-6">
										<div class="form-group">
											<label><fmt:message key="project.form.type"/><span class="help-block"></span></label>
											<form:select path="projectType"  class="form-control listbox" aria-hidden="true">
												<form:option value="0">Architech and Construction</form:option>
												<form:option value="1">Interior design and construction</form:option>
											</form:select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label><fmt:message key="project.form.categoryType"/><span class="help-block"></span></label>
											<form:select path="projectCatelogType"  class="form-control listbox" aria-hidden="true">
												<form:option value="0">Hotel</form:option>
												<form:option value="1">Bank</form:option>
												<form:option value="2">Apartment</form:option>
												<form:option value="3">Factory</form:option>
												<form:option value="4">Education</form:option>
												<form:option value="5">Master Plan</form:option>
											</form:select>
										</div>
									</div>
			        			</div>
			        			<div class="row">
			        				<div class="col-md-6">
										<div class="form-group">
											<label><fmt:message key="project.form.des"/><span class="help-block"></span></label>
											<textarea rows="5" name="description" class="form-control" maxlength="200">${project.description}</textarea>
										</div>
									</div> 
								
									<div class="col-md-6">
										<div class="form-group">
											<label><fmt:message key="project.form.desKr"/><span class="help-block"></span></label>
											<textarea rows="5" name="descriptionKr" class="form-control" maxlength="200">${project.descriptionKr}</textarea>
										</div>
									</div>
			        			</div>
			        			<div class="row">
									<div class="col-md-3 form-group">
										<label><fmt:message key="project.form.isDisplay" /></label>
										<form:select path="isDisplay"  class="form-control listbox" aria-hidden="true">
											<form:option value="1">On</form:option>
											<form:option value="0">Off</form:option>
										</form:select>
									</div>
									<div class="col-md-3 form-group">
										<label><fmt:message key="project.form.location" /></label>
										<input type="text" name="location" value="${project.location}" class="form-control" maxlength="100"/>
									</div>
									<div class="col-md-3 form-group">
										<label><fmt:message key="project.form.locationKr" /></label>
										<input type="text" name="locationKr" value="${project.locationKr}" class="form-control" maxlength="100"/>
									</div>
									<div class="col-md-3 form-group">
										<label><fmt:message key="project.form.square" /></label>
										<input type="text" name="square" value="${project.square}" class="form-control" maxlength="100"/>
									</div>
								</div> 
								<div class="row">
									<div class="col-md-3 form-group">
										<label><fmt:message key="project.form.budget" /></label>
										<input type="text" name="budget" value="${project.budget}" class="form-control" maxlength="100"/>
									</div>
									<div class="col-md-3 form-group">
										<label><fmt:message key="project.form.partner" /></label>
										<input type="text" name="partner" value="${project.partner}" class="form-control" maxlength="100"/>
									</div>
									<div class="col-md-3 form-group">
										<label><fmt:message key="project.form.architech" /></label>
										<input type="text" name="architech" value="${project.architech}" class="form-control" maxlength="100"/>
									</div>
							 		<div class="col-md-3 form-group">
										<label><fmt:message key="project.form.principle" /></label>
										<input type="text" name="principleUse" value="${project.principleUse}" class="form-control" maxlength="100"/>
									</div>
								</div>
								<div class="row">
								<div class="col-md-3 form-group">
										<label><fmt:message key="project.form.scale" /></label>
										<input type="text" name="scale" value="${project.scale}" class="form-control" maxlength="100"/>
									</div>
									<div class="col-md-3 form-group">
										<label><fmt:message key="project.form.scaleKr" /></label>
										<input type="text" name="scaleKr" value="${project.scaleKr}" class="form-control" maxlength="100"/>
									</div>
									<div class="col-md-3">	
							 			<p><fmt:message key="project.form.imageUrl"/></p>
							 			<div class="file-loading col-md-3">
							 				<input type="file" id="file" accept="image/*" name="file" class="file-input-overwrite">
							 			</div>
							 		</div>
							 		<div class="col-md-3">	
							 			<c:if test="${not empty project.sliderImgUrl and project.sliderImgUrl ne ''}">
											<img alt="slider" src="<c:url value='${project.sliderImgUrl}'/>" width="200px" height="200px" />
										</c:if>
							 		</div>
								</div>
								<!-- <p>Image thumbnail</p>
								<div class="file-loading col-md-3"><input type="file" id="thumbs" name="thumbs" class="file-input-preview" multiple></div>
								<div class="row">
				                    <div class="col-sm-6 col-xs-12">
				                    	
				                        <div class="file-loading col-md-3">
							 				<input type="file" accept="image/*" name="fileThumb" class="file-input-overwrite">
							 			</div>
				                    </div>
				                    <div class="col-sm-6 col-xs-12">
				                        <div class="form-group">
				                            <div class="label-text">Sort</div>
				                            <input name="sortThumb" type="text" class="form-control" placeholder="Enter sort">
				                        </div>
				                    </div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<a href="javascript:void(0);" onclick="addThumbImageAction()" class="btn btn-sm btn-primary" title="Add" id="addThumb"><i class="icon-plus22"></i>Add thumbnail image</a>
									</div>
								</div> -->
								<div class="row my-3">
									<div class="col-md-12">
										<table class="table table-bordered table-striped">
										<thead>
											<tr class="table-success">
												<th id="thumb-index">#</th>
												<th>Choose Image</th>
												<th>Image Preview</th>
												<th>Sort</th>
												<th>Action</th>
											</tr>
										</thead>
										<c:set var="imageSize" scope="session" value="${fn:length(project.imageThumbnails)}" />
										<c:set var="lastSource" scope="session" value="${imageSize gt 0 ? (imageSize -1) : imageSize}" />
										<tbody id="thumb-body">
											<c:forEach begin="0" end="${lastSource}" varStatus="count">
												
												<tr class="clonableSourceRow" cloneSourceIndex="${count.index}">
												<form:hidden class="imageThumbnailsId" path="imageThumbnails[${count.index}].id"/>
													<td class="stt">${count.index + 1}</td>
													<td>
														<div class="form-group">
															<form:input type="file" accept="image/*" class="form-control" path="imageThumbnails[${count.index}].file"/>
														</div>
													</td>
													<td class="imgThumbnail">
														<c:if test="${not empty project.imageThumbnails[count.index].imgUrl}">
															<img alt="slider" src="<c:url value='${project.imageThumbnails[count.index].imgUrl}'/>" width="200px" height="200px" />
														</c:if>
														
													</td>
													<td>
														<form:input type="number" id="imageThumbnails${count.index}" step="1" class="form-control float" maxlength="6" max="100.00" min="1" path="imageThumbnails[${count.index}].sort"/>
													</td>
													<td>
														<div style="white-space: nowrap;">
															<button type="button" class="btn btn-primary btn-xs addSourceRow" title="Add Row" style="display: inline-block; float: none">
																<i class="fa fa-plus "></i>
															</button>
															<button type="button" class="btn btn-danger btn-xs removeSourceRow" title="Remove Row" style="display: inline-block; float: none">
																<i class="fa fa-times"></i>
															</button>
														</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									</div>
								</div>
				         	<div class="d-flex justify-content-end align-items-center">		
				         		<a href="/admin/project/list" class="btn btn-info ml-3"><fmt:message key="button.back"/><i class="icon-backward2 ml-2"></i></a>
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
</form:form>

<script type="text/javascript">
	var formId = '#form_add_thum';
	var thumbImageData = {};
	
	/* function addThumbImageAction () {
		thumbImageData.url = $('input[name="fileThumb"]').val().replace(/.*(\/|\\)/, ''); 
		thumbImageData.sort = $('input[name= "sortThumb"]').val();
		
		if (thumbImageData.url == '' || thumbImageData.sort == '') {
			return alert('Please choose data');
		}

		var content = "<tr> <td>" + 1 + "</td>" + "<td>" + thumbImageData.url + "</td>" + "<td>" + thumbImageData.sort + "</td> </tr>";
		$('#thumb-body').append(content);
		
		$('input[name="fileThumb"]').val('');
		$('input[name="sortThumb"]').val('');
	} */

		function addSourceRow() {
	    	if ($(".clonableSourceRow").length >= 1) {
	    		$("button.removeSourceRow").removeAttr('disabled');
	        } 
	    	
	        var regex = /^(imageThumbnails\[)(?:[0-9]\d?|100)(\].*)$/i;
	        
	        var tableBody = $(this).closest('tbody').find('tr');
	        
	        $lastClonableRow = $(tableBody.last());

	        var cloneSourceIndex = parseInt($lastClonableRow.attr('cloneSourceIndex')) + 1;
	        
	        
	        $lastClonableRow.clone(true).attr('cloneSourceIndex', cloneSourceIndex)
	            .insertAfter($lastClonableRow)
	            .find("*")
	                .each(function() {
	                    $.each(this.attributes, function(i, attrib){
	                        var value = attrib.value || "";
	                        var match = value.match(regex) || [];
	                        if (match.length == 3) {
	                            this.value = match[1] + (cloneSourceIndex) + match[2];
	                        }
	                     })
	                })
	                .find('input').val('');
	        $('.clonableId').last().val('');
	        $('.imgThumbnail').last().html('');
	        $('.imageThumbnailsId').last().val('');
	         
	        var stt = cloneSourceIndex+1;
	        $('.stt').last().text(''+ stt);
	    }
	    
	    function removeSourceRow() {
	        if ($(".clonableSourceRow").length > 1) {
	            $(this).parents(".clonableSourceRow").remove();
	        }
	        
	        if ($(".clonableSourceRow").length == 1) {
	        	$("button.removeSourceRow").attr('disabled', 'disabled');
	        }
	    }
	    
	    $("button.addSourceRow").on("click", addSourceRow);
	    $("button.removeSourceRow").on("click", removeSourceRow);
	
	
	function getLastIndex(){
		$(formId).hideDialog();
	}
</script>
<!-- /content area -->


