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

  $("img.lazy").lazyload({
    threshold : 200
  });

  $('p.markdown').each(function(){
    var md_content = $(this).text();
    html_content = markdown.toHTML( md_content );
    html_content = html_content.split('.');
    $(this).html(html_content[0]);
  });

  $('p.markdown-content').each(function(){
      var md_content = $(this).text();
      html_content = markdown.toHTML( md_content );
      $(this).html(html_content);
  });

});
