$(document).ready(function(){
    $('.news-type-style li:first-child a').addClass('active');
    $('.news-type-style li a').click(function(){
        $('.news-type-style li a.active').removeClass('active');
        $(this).addClass("active");
    });
});

window.onscroll = function () {this.eventBackToTop()};

function eventBackToTop() {
    var btnBackToTop = document.getElementById('backToTop');
    var HEIGHT_TO_DISPLAY = 200;
    if ( btnBackToTop ) {
        if (document.body.scrollTop > HEIGHT_TO_DISPLAY || document.documentElement.scrollTop > HEIGHT_TO_DISPLAY) {
            btnBackToTop.style.display = "block";
        } else {
            btnBackToTop.style.display = "none";
        }
    }
}

$(function() {
    $('#backToTop').on('click', function() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    })
});