var ProjectComponent = function() {	
	var validateForm = function () {
    	
    }
	
    return {
        init: function() {
            validateForm();
        }
    }
}();


// Initialize module
// ------------------------------

document.addEventListener('DOMContentLoaded', function() {
	ProjectComponent.init();
});

var confirmDel = function () {
	var locale = $('#locales').val();
    
//	bootbox.confirm({
//	    message: "Are you sure delete this project",
//	    locale: locale,
//	    callback: function (result) {
//	        console.log('This was logged in the callback: ' + result);
//	    }
//	});
	
	bootbox.dialog({
	    message:"Are you sure?",
	    buttons: {
	      yes: { //Button Yes
	        label: "Yes",
	        className: "btn-success",
	        callback: function(result) { //Do whatever you want here
	            alert("test");   
	        }
	      },
	      no: { //Button No
	         label: "No",
	        className: "btn-danger",
	        callback: function() {
	        	alert("no");   
	        }
	      }
	    }
	}); 
}
