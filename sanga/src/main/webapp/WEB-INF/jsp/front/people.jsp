<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/themes/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="title.page.people"/></title>
</head>
   <body class="cnt-home" id="cnt-container">
	<div class="body-content mb-5" id="top-banner-and-menu">
		<div class="container" id="size-container">
			<div class="row">
				<!-- ============================================== CONTENT ============================================== -->
				<div class="col-xs-12 col-sm-12 col-md-12 homebanner-holder">
					<!-- ============================================== SCROLL TABS ============================================== -->
					<div id="wrapper-people" class="wrapper-people row mt-2">
						<c:forEach var="employee" items="${employees}" varStatus="cnt">
							<div class="flag-item col-lg-3 col-md-4 col-sm-6 col-xs-12 mt-15" id="people_${cnt.index + 1 }">
								<div class="people-container">
									<c:choose>
										<c:when test="${empty employee.avatarUrl }">
											<img src="/themes/front/assets/images/people/img_avatar2.png" alt="Can't load image" class="image"/>
										</c:when>
										<c:otherwise>
											<img src="<c:url value='${employee.avatarUrl }'/>" alt="Can't load image" class="image"/>
										</c:otherwise>
									</c:choose>
									
									<div class="text-preview">
										<span>${ employee.position } ${ employee.name }</span>
									</div>
									<a href="#collap_${cnt.index + 1}" id="peopleCode_${employee.id}" class="project-text overlay collapsible" onclick="eventPullDownInfo(this);">
										<div class="text-info">
											<span class="name">
												${ employee.name }
											</span>
											<div class="position">
												<span class="info">${ employee.position }</span>
												<!-- <span class="detail">Architect</span> -->
											</div>
										</div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- ============================================== SCROLL TABS : END ============================================== -->
				</div><!-- /.homebanner-holder -->
				<div class="people-body-wrapper col-md-12" id="people-item-info">
					<div class="people-wrapper">
						<div class="close">
							<button id="btn-remove"><i class="fa fa-times" aria-hidden="true"></i></button>
						</div>
						<div class="row" id="people-infor-wrapper">
						
						</div>
					</div>
				</div>
				<!-- ============================================== CONTENT : END ============================================== -->
			</div><!-- /.row -->
		</div><!-- /.container -->
	</div><!-- /#top-banner-and-menu -->
	
<script src="/themes/front/assets/js/people.js"></script>
<script>
	$(document).ready(function() {
		// close collapse
		$('#btn-remove').on('click', function() {
			$('#people-item-info').removeClass('show');
			$('#people-infor-wrapper').html('');
			const elementArr = document.getElementsByClassName('flag-item');
			for (let i = 0; i < elementArr.length; i++) {
				const element = elementArr[i];
				$(element).removeClass('active');
			}
		});
		// add style active for choice employee
		var navLst = document.getElementById('wrapper-people');
		var navbarArr = navLst.getElementsByClassName('flag-item');
		for (let i = 0; i < navbarArr.length; i++) {
			navbarArr[i].addEventListener("click", function() {
				var currentActive = document.getElementsByClassName('active-item');
				if (currentActive[0]) {
					currentActive[0].className = currentActive[0].className.replace(" active-item", "");
				}
				this.className += " active-item"
			});
		}
	});
	
	var eventPullDownInfo = function(e) {
		const item_count = [4, 3, 2, 1];
		var itemHash = e && e.hash;
		var itemNumberArr = itemHash.split('_');
		var idx = itemNumberArr[1];
		
		let width = window.innerWidth 
					|| document.documentElement.clientWidth 
					|| document.body.clientWidth;

		if (width < 1200 && width >= 992) {			// Interactive for md screen
			eventSearchEndingItem(idx, item_count[1]);
		} else if (width < 992 && width >= 768){	// Interactive for sm screen
			eventSearchEndingItem(idx, item_count[2]);
		} else if (width < 768) {					// Interactive for xs screen
			eventSearchEndingItem(idx, item_count[3]);
		} else {									// Interactive for lg screen
			eventSearchEndingItem(idx, item_count[0]);
		}
		
		// ajax call api to show data
		var peopleId = e.id;
		var elmntID = document.getElementById(peopleId);
		var peopleIdArr = peopleId.split('_');
		$('#people-infor-wrapper').html('');
		var avaWidth = elmntID.offsetWidth + 'px';
		
		$.ajax({
			url: getContext() + '/front/employee/' + peopleIdArr[1],
			method: 'GET',
			data: {},
			success: function(data) {
				if (data) {
					$('#people-infor-wrapper').html(displayPeopleFramework(data, avaWidth));
				}
			},
			error: function(err) {
				console.log('err', err);
			}
		})
	}
	
	function displayPeopleFramework(employee, avaWidth) {
		return `<div class="col-md-4 col-sm-4 col-xs-12 box-personal">
					<div class="people-img" style="width: ` + avaWidth + `;">
						<img src=` + getContext() + employee.avatarUrl + ` alt="">
					</div>
					<div class="text-preview" style="width: ` + avaWidth + `;">
						<span>` + employee.position + ` ` + employee.name +`</span>
					</div>
					<div class="people-name">` + employee.name + `</div>
					<div class="people-position">
						` + employee.position + ` | Architect
					</div>
				</div>
				<div class="col-md-4 col-sm-4 col-sm-12">
					<h3>PROFILE</h3>
					<div class="people-history">
						<div class="history-item">` + employee.profile + `</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 col-sm-12">
					<h3>PROJECT</h3>
					<div class="people-history">
						<div class="history-item">` + employee.project + `</div>
					</div>
				</div>`;
	}

	function eventSearchEndingItem(a, b) {
		var quotient = Math.floor(a/b);
		var number = a % b;
		var elementEndingItem;
		var idx = 0;
		var scrollTopElmt = 0;
		//----------------------------------------------
		// Remove ending item have 'active' class
		//----------------------------------------------
		const elementArr = document.getElementsByClassName('flag-item');
		for (let i = 0; i < elementArr.length; i++) {
			const element = elementArr[i];
			$(element).removeClass('active');
		}
		//----------------------------------------------
		if ( number === 0 && quotient > 0) {
			idx = (quotient - 1) * b + b;
			elementEndingItem = document.getElementById('people_' + idx);
			$('#people_' + idx).addClass('active');
		} else {
			idx = quotient*b + b;
			elementEndingItem = document.getElementById('people_' + idx);
			if (elementEndingItem) {
				$('#people_' + idx).addClass('active');
			} else {
				for (let i = b - 1; i >= 0; i--) {
					var index = quotient*b + i;
					if (document.getElementById('people_' + index)) {
						elementEndingItem = document.getElementById('people_' + index);
						$('#people_' + index).addClass('active');
						break;
					}
				}
			}
		}
		//---------------------------------------------
		var windowScroll = window.scrollY;
		var rect = elementEndingItem.getBoundingClientRect();
		var heightElmt = rect.bottom + windowScroll;

		var elementWrapperInfo = document.getElementById('people-item-info');
		$('#people-item-info').addClass('show');
		elementWrapperInfo.style.top = heightElmt + 'px';
		elementWrapperInfo.style.width = getWidthElement('size-container');
	}

	function getWidthElement(e) {
		var elmt = document.getElementById(e);
		return elmt.offsetWidth + "px";
	}
</script>
</body>
