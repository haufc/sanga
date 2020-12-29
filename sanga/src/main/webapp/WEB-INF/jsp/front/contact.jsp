<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/themes/common/taglibs.jsp"%>

<head>
	<title><fmt:message key="title.page.contact"/></title>
	<script type="text/javascript" src='<c:url value="/themes/front/assets/js/sendmail_form.js"></c:url>'></script>
</head>
<div class="container">
	<div class="contact-page">
			<div class="row" id="form-contact">
				<div class="col-md-12 contact-map outer-bottom-vs">
						<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3131.9272415934156!2d105.8058942855078!3d21.0122637945422!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abd89135b73f%3A0x5932d90d069309dd!2zVG_DoCBOaMOgIDE2OSBOZ3V54buFbiBOZ-G7jWMgVsWp!5e0!3m2!1svi!2s!4v1608473440187!5m2!1svi!2s" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
				</div>
				<div class="col-md-9 contact-form">
				<div class="col-md-12 contact-title">
					<h4>Contact Form</h4>
				</div>
				<div class="col-md-4 ">
					<div class="register-form" role="form">
						<div class="form-group">
						<label class="info-title" for="exampleInputName">Your Name <span>*</span></label>
						<input type="text" name="name" class="form-control unicase-form-control text-input" id="exampleInputName" placeholder="">
					</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="register-form" role="form">
						<div class="form-group">
						<label class="info-title" for="exampleInputEmail1">Email Address <span>*</span></label>
						<input type="email" name="email" class="form-control unicase-form-control text-input" id="exampleInputEmail1" placeholder="">
					</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="register-form" role="form">
						<div class="form-group">
						<label class="info-title" for="exampleInputTitle">Title <span>*</span></label>
						<input type="email" name="title" class="form-control unicase-form-control text-input" id="exampleInputTitle" placeholder="Title">
					</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="register-form" role="form">
						<div class="form-group">
						<label class="info-title" for="exampleInputComments">Your Comments <span>*</span></label>
						<textarea name="comment" class="form-control unicase-form-control" id="exampleInputComments"></textarea>
					</div>
					</div>
				</div>
				<div class="col-md-12 outer-bottom-small m-t-20">
					<button type="button" onclick="sendMail()" class="btn-upper btn btn-primary checkout-page-button">Send Message</button>
				</div>
			</div>
			<div class="col-md-3 contact-info">
				<div class="contact-title">
					<h4>Information</h4>
				</div>
				<div class="clearfix address">
					<span class="contact-i"><i class="fa fa-map-marker"></i></span>
					<span class="contact-span">${contact.address }</span>
				</div>
				<div class="clearfix phone-no">
					<span class="contact-i"><i class="fa fa-mobile"></i></span>
					<span class="contact-span">${contact.phone}</span>
				</div>
				<div class="clearfix email">
					<span class="contact-i"><i class="fa fa-envelope"></i></span>
					<span class="contact-span"><a href="#">${contact.email}</a></span>
				</div>
			</div>			
		</div><!-- /.contact-page -->
	</div>
</div>