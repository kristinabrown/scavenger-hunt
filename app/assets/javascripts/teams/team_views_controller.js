function teamViewsController(){
  window.teamData    = "initialize";
  window.checkStatus = false; 
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
      shouldItChangeViews = compareResponseForChanges(response, teamData); 
      if(shouldItChangeViews){
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
  } else if(currentTeamData.location_info.location_id == "14"){
    $('.winning-condition').toggle();
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
  var views = [$('.team_welcome'), $('.clue'), $('.waiting'), $('.submission_response'), $('.success_response'), $('.failure_response'), $('.winning-condition')];
  
  views.forEach(function(view){
    if(!view.is(':hidden')){ view.toggle() };
  });
};

function getSlug(){
  var slug = _.last(document.URL.split('/')); 
  return slug;
}

function compareResponseForChanges(newData, oldData){
  if(oldData === "initialize"){ return true };
  var newDataMash = newData.location_info.location_id+":"+newData.team_info.hunt_initiated +":"+ newData.submission_info.responded_to +":"+ newData.submission_info.accepted;
  var oldDataMash = oldData.location_info.location_id+":"+oldData.team_info.hunt_initiated +":"+ oldData.submission_info.responded_to +":"+ oldData.submission_info.accepted;
  var areNewDataAndOldDataTheSame = _.isEqual(newDataMash, oldDataMash);
  return !areNewDataAndOldDataTheSame;
};