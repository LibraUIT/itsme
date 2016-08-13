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
});