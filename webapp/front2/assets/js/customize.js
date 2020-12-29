$(document).ready(function(){
    $('.news-type-style li:first-child a').addClass('active');
    $('.news-type-style li a').click(function(){
        $('.news-type-style li a.active').removeClass('active');
        $(this).addClass("active");
    });
});