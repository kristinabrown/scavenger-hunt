$(document).ready(function() {
  activateHunt();
  createTeams();
  adminViewController();

  teamViewsController();
  teamWelcomeView();
  
  setTimeout(function(){ 
    $('#flash_errors').remove(); 
  }, 3000);

  setTimeout(function(){ 
    $('#flash_notice').remove(); 
  }, 3000);
});
