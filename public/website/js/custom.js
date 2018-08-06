$(window).scroll(function (e) {
    if ($(this).scrollTop() > 1)
    {
        $('header').addClass('page-scrolled');
    } else
    {
        $('header').removeClass('page-scrolled');
    }
});

//start-scroll
$('.scroll-down').click(function (e) {
    e.preventDefault();
    $('html,body').animate({scrollTop: $(this.hash).offset().top - 80}, 1000)
});
$('.mobile-menu').click(function(e){
    $(this).toggleClass('active')
    $(this).parent('.mobile-main-menu-hold').toggleClass('in');
});

