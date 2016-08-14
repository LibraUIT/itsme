$( document ).ready(function() {
  $('form#new_idol').bind('ajax:success', function (evt, data, status, xhr) {
    if (data != true) {
      $('.messages').html(data);
    } else {
      location.reload();
    }
  });
  $('a.edit-idol').bind('ajax:success', function (evt, data, status, xhr) {
    $('.create-idol-form').addClass('hide');
    $('.edit').html(data);
  });
  $('form#new_banner').bind('ajax:success', function (evt, data, status, xhr) {
    if (data != true) {
      $('.messages').html(data);
    } else {
      location.reload();
    }
  });
  $('a.edit-banner').bind('ajax:success', function (evt, data, status, xhr) {
    $('.create-banner-form').addClass('hide');
    $('.edit').html(data);
  });
  $('a.delete-banner').bind('ajax:success', function (evt, data, status, xhr) {
    location.reload();
  });
  $('a.delete-idol').bind('ajax:success', function (evt, data, status, xhr) {
    location.reload();
  });
});