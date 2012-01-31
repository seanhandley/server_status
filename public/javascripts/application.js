$(document).ready(function(){
  $('#login-form').submit(function(){
    $.ajax({
      type: 'POST',
      url: $(this).attr('action'),
      data: $(this).serialize(),
      success: function(data, status, xhr){
        CallCentreApp.admin_page.show_status(data)
      },
    });
    return false;
  });
});
