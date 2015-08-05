function setClueView(teamData){
  var clue = $('.clue_info')[0]; 
  clue.innerHTML = "";
  clue.innerHTML = teamData.location_info.clue;

  var name = $('.team_name_clue_page')[0];
  name.innerHTML = "";
  name.innerHTML = teamData.team_info.name;

  $('.clue').toggle();
};