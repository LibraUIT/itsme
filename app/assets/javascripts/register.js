  $(document).ready(function () {
    $('#timepicker1').focus(function(){
      $(this).datetimepicker({
      format: 'HH:mm',
      inline: true
      })
   });
    $('#timepicker').focus(function(){
     $(this).datetimepicker({
      format: 'HH:mm',
      inline: true,
      })
    });
    $('#field_birthday').focus(function(){
      $(this).datetimepicker({
          format: 'DD/MM/YYYY',
          inline: true
      });
    })
  });