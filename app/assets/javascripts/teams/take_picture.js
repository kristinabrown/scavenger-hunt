function takePicture(){
  
  $('#take_picture').on('click', function(){
    $('#camera').trigger( "click" );
    $('#send_picture')[0].style.display = "block";
    $('#take_picture')[0].style.display = "none";
  });

  $('#send_picture').on('click', function(){
    $('#take_picture')[0].style.display = "block";
    $('#send_picture')[0].style.display = "none";
  });
};