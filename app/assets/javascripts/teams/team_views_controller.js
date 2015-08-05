function teamViewsController(){
  window.teamData = "data placeholder";
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
      if(!(_.isEqual(response, teamData))){
        resetAllViews();
        toggleViews(response);  
      };
      teamData = jQuery.extend(true, {}, response);
    },
    error: function(xhr) {
      console.log("no data error set View");
    }
  });

};

function toggleViews(currentTeamData){
  var submission = currentTeamData.submission_info; 
  if(currentTeamData.team_info.hunt_initiated === false){
    $('.team_welcome').toggle();
  } else if(submission.responded_to && submission.accepted){
    setClueView(currentTeamData);
  } else if(!submission.responded_to && !submission.accepted){
    $('.waiting').toggle();
  } else if(submission.responded_to && !submission.accepted){
    console.log('hitting response view!!!');
    setResponseView(submission.correct, currentTeamData);
  } else {
    console.log('unregistered team client state');
  };
};

function resetAllViews(){
  var views = [$('.team_welcome'), $('.team_welcome'), $('.waiting'), $('.submission_response'), $('.success_response'), $('.failure_response')];
  
  views.forEach(function(view){
    if(!view.is(':hidden')){ view.toggle() };
  });
};

function getSlug(){
  var slug = _.last(document.URL.split('/')); 
  return slug;
}