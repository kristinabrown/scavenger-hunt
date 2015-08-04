function gatherCurrentHuntData(){
  $.getJSON("/hunts", function(xhr){
    renderCorrectTemplate(xhr);
  });
};

function renderCorrectTemplate(currentHuntData){
  resetPageState();

  if(currentHuntData.active && currentHuntData.teams.length > 0){
    showAdminDashboardPage(currentHuntData.teams.length);
  } else if (currentHuntData.active){
    showTeamPhoneNumbersPage(currentHuntData.number_of_teams);
  } else {
    showNewHuntPage();
  }
};

function resetPageState() {
  if(!($(".new_hunt").is(":hidden"))) {$(".new_hunt").toggle();}
  if(!($(".team_numbers").is(":hidden"))) {$(".team_numbers").toggle();}
  if(!($(".dashboard").is(":hidden"))) {$(".dashboard").toggle();}
}
