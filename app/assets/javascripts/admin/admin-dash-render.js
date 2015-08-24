function adminViewController(){
  window.adminData = 'no adminData window';
  gatherCurrentHuntData();
  setInterval(gatherCurrentHuntData, 30000);
}

function gatherCurrentHuntData(){
  $.getJSON("/hunts", function(xhr){
    if(!(_.isEqual(xhr, adminData))){
      resetPageState();
      renderCorrectTemplate(xhr);
    };
    adminData = _.clone(xhr);
  });
};

function renderCorrectTemplate(currentHuntData){

  if(currentHuntData.active && currentHuntData.teams.length > 0){
    showAdminDashboardPage(currentHuntData);
  } else if (currentHuntData.active){
    showTeamPhoneNumbersPage(currentHuntData);
  } else {
    showNewHuntPage();
  }
};

function resetPageState() {
  if(!($(".new_hunt").is(":hidden"))) {$(".new_hunt").toggle();}
  if(!($(".team_numbers").is(":hidden"))) {$(".team_numbers").toggle();}
  if(!($(".dashboard").is(":hidden"))) {$(".dashboard").toggle();}
}
