$( document ).ready(function() {
  $('.banner-con').slick({
    dots: false,
    infinite: true,
    speed: 500,
    fade: false,
    cssEase: 'linear',
    autoplay: true,
    autoplaySpeed: 2000
  });

  $('.slick-arrow').hide();
});
