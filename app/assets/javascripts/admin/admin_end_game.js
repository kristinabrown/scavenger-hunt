function endGame(){

  $('#end_game_button').on('click', function(){

    $.ajax({
      url: "/end_hunt",
      type: "DELETE",
      success: function(response) {
        adminViewController();
      },
      error: function(xhr) {
        console.log("hunt could not be ended");
      }
    });

  });

};