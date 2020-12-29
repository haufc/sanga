<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/themes/common/taglibs.jsp"%>

<head>
	<title>Main Page</title>
	<script src="<c:url value='/themes/admin/assets/js/dashboard.js'/>"></script>
</head>
<div class="content">
	<!-- Basic layout-->
	<div class="card">
	 <div class="container py-4">
		<div class="row p-4">
		    <br/>
		   <div class="col text-center">
			<h2 class="text-uppercase">Dashboard data</h2>
			<p>The summary data from system</p>
			</div>
			
	             
			
		</div>
			<div class="row text-center">
		        <div class="col">
		        <div class="counter">
	      <a href='<c:url value="/admin/project/list"/>'>
	      	<i class="icon-archive fa-2x"></i>
	      <h2 class="timer count-title count-number" data-to="${projectTotal}" data-speed="1500"></h2>
	       <p class="count-text ">Projects</p>
	      </a>
	    </div>
		        </div>
	              <div class="col">
	               <div class="counter">
	                <a href='<c:url value="/admin/employee/list"/>'>
			      <i class="icon-reading fa-2x"></i>
			      <h2 class="timer count-title count-number" data-to="${employeeTotal}" data-speed="1500"></h2>
			      <p class="count-text ">Employees</p>
			      </a>
	    </div>
	              </div>
	              <div class="col">
	                  <div class="counter">
	                   <a href='<c:url value="/admin/slider/list"/>'>
				      <i class="icon-popout fa-2x"></i>
				      <h2 class="timer count-title count-number" data-to="${sliderTotal}" data-speed="1500"></h2>
				      <p class="count-text ">Slides</p>
	     			 </a>
	    </div></div>
	              <div class="col">
	              <div class="counter">
	               <a href='<c:url value="#"/>'>
				      <i class="fa fa-link fa-2x"></i>
				      <h2 class="timer count-title count-number" data-to="0" data-speed="1500"></h2>
				      <p class="count-text ">Service</p>
				   </a>
	    </div>
	              </div>
	         </div>
	</div>
	</div>
	</div>
