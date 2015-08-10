$(document).ready(function() {
  endGame();
  activateHunt();
  createTeams();
  adminViewController();

  teamViewsController();
  teamWelcomeView();
  takePicture()

  connectToRedis();
  
  setTimeout(function(){ 
    $('#flash_errors').remove(); 
  }, 3000);

  setTimeout(function(){ 
    $('#flash_notice').remove(); 
  }, 3000);
});
