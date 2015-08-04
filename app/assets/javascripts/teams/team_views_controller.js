function teamViewsController(){
  setView();
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
      resetTeamView();
      toggleViews(response);
    },
    error: function(xhr) {
      console.log("no data");
    }
  });

};

function toggleViews(currentTeamData){
  if(currentTeamData.team_info.hunt_initiated === false){
    $('.team_welcome').toggle();
  } else {
    $('.clue').toggle();
  }
};

function resetTeamView(){
  var welcomeView = $('.team_welcome'); 
  var clueView    = $('.team_welcome');

  if(!welcomeView.is(':hidden')){
    welcomeView.toggle();
  } else if(!clueView.is(':hidden')) {
    clueView.toggle();
  } else {
    console.log('nothing to hide');
  };
};

function getSlug(){
  var slug = _.last(document.URL.split('/')); 
  return slug;
}