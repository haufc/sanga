var AreaComponent = function() {	
	
	var initForm = function() {
        if (!$().select2) {
            console.warn('Warning - select2.js is not loaded.');
            return;
        }

    	// select2
   	 	$('.select2').select2();

	}
	
    // Uniform
    var initUniform = function() {
        if (!$().uniform) {
            console.warn('Warning - uniform.min.js is not loaded.');
            return;
        }

        // Default initialization
        $('.form-check-input-styled').uniform();


        //
        // Contextual colors
        //

        // Primary
        $('.form-check-input-styled-primary').uniform({
            wrapperClass: 'border-primary-600 text-primary-800'
        });

        // Danger
        $('.form-check-input-styled-danger').uniform({
            wrapperClass: 'border-danger-600 text-danger-800'
        });

        // Success
        $('.form-check-input-styled-success').uniform({
            wrapperClass: 'border-success-600 text-success-800'
        });

        // Warning
        $('.form-check-input-styled-warning').uniform({
            wrapperClass: 'border-warning-600 text-warning-800'
        });

        // Info
        $('.form-check-input-styled-info').uniform({
            wrapperClass: 'border-info-600 text-info-800'
        });

        // Custom color
        $('.form-check-input-styled-custom').uniform({
            wrapperClass: 'border-indigo-600 text-indigo-800'
        });
    };

    // Switchery
    var initSwitchery = function() {
        if (typeof Switchery == 'undefined') {
            console.warn('Warning - switchery.min.js is not loaded.');
            return;
        }

        // Initialize multiple switches
        var elems = Array.prototype.slice.call(document.querySelectorAll('.form-check-input-switchery'));
        elems.forEach(function(html) {
          var switchery = new Switchery(html);
        });
    };

    // Bootstrap switch
    var initBootstrapSwitch = function() {
        if (!$().bootstrapSwitch) {
            console.warn('Warning - switch.min.js is not loaded.');
            return;
        }

        // Initialize
        $('.form-check-input-switch').bootstrapSwitch();
    };


    //
    // Return objects assigned to module
    //
    
    var validateForm = function() {
    	var validator = $('.form-validate-jquery').validate({
    		 ignore: 'input[type=hidden], .select2-search__field', // ignore hidden fields
             errorClass: 'validation-invalid-label',
             successClass: 'validation-valid-label',
             validClass: 'validation-valid-label',
             highlight: function(element, errorClass) {
                 $(element).removeClass(errorClass);
             },
             unhighlight: function(element, errorClass) {
                 $(element).removeClass(errorClass);
             },
            /* success: function(label) {
                 label.addClass('validation-valid-label').text('Success.'); // remove to hide Success message
             },*/

             // Different components require proper error label placement
             errorPlacement: function(error, element) {

                 // Unstyled checkboxes, radios
                 if (element.parents().hasClass('form-check')) {
                     error.appendTo( element.parents('.form-check').parent() );
                 }

                 // Input with icons and Select2
                 else if (element.parents().hasClass('form-group-feedback') || element.hasClass('select2-hidden-accessible')) {
                     error.appendTo( element.parent() );
                 }

                 // Input group, styled file input
                 else if (element.parent().is('.uniform-uploader, .uniform-select') || element.parents().hasClass('input-group')) {
                     error.appendTo( element.parent().parent() );
                 }

                 // Other elements
                 else {
                     error.insertAfter(element);
                 }
             },
            rules: {
            },
            messages: {
            	"code": {
            		required: "Trường này không được bỏ trống",
	            },
	            "printPosCode": {
	            	required: "Trường này không được bỏ trống"
	            },
	            "name": {
            		required: "Trường này không được bỏ trống"
	            },
	            "printerName": {
	            	required: "Trường này không được bỏ trống"
	            }
            }
    	});
    	// Reset form
        $('#reset').on('click', function() {
            validator.resetForm();
        });
    };
    
    return {
        init: function() {
        	initForm();
            initUniform();
            initSwitchery();
            initBootstrapSwitch();
            validateForm();
        }
    }
}();


// Initialize module
// ------------------------------

document.addEventListener('DOMContentLoaded', function() {
	AreaComponent.init();
});