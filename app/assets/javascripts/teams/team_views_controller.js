function teamViewsController(){
  window.teamData = 'no data window';
  setView();
  setInterval(setView, 5000);
};

function setView() {
  var slug     = getSlug();

  $.ajax({
    url: "/team_data/"+slug,
    data: { 
        "slug": slug 
    },
    type: "GET",
    success: function(response) {
      console.log(response);
      console.log(teamData);
      if(!(_.isEqual(response, teamData))){
        resetTeamView();
        toggleViews(response);  
      };
      teamData = _.clone(response);
    },
    error: function(xhr) {
      console.log("no data error set View");
    }
  });

};

function toggleViews(currentTeamData){
  if(currentTeamData.team_info.hunt_initiated === false){
    $('.team_welcome').toggle();
  } else if(currentTeamData.submission_info.responded_to === false){
    $('.waiting').toggle();
  } else {
    $('.clue').toggle();
  }
};

function resetTeamView(){
  var welcomeView = $('.team_welcome'); 
  var clueView    = $('.team_welcome');
  var waitingView = $('.waiting');

  if(!welcomeView.is(':hidden')){
    welcomeView.toggle();
  } else if(!clueView.is(':hidden')) {
    clueView.toggle();
  } else if(!waitingView.is(':hidden')){
    waitingView.toggle();
  } else {
  };
};

function getSlug(){
  var slug = _.last(document.URL.split('/')); 
  return slug;
}