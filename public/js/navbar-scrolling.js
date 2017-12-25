//jQuery to collapse the navbar on scroll
$(window).scroll(function() {
    if ($(".navbar").offset().top > 50) {
        $(".navbar-fixed-top").addClass("top-nav-collapse");
        $('.fyyd').css('display','none');
    } else {
        $(".navbar-fixed-top").removeClass("top-nav-collapse");
         $('.fyyd').css('display','block');
    }
});
