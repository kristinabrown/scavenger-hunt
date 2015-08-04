function teamWelcomeView(){
  startHunt();
};

function startHunt(){
  $('#play_on_button').on('click', function(event){
    event.preventDefault();    
    updateTeamName();
  });
};

function updateTeamName(){
  var slug     = getSlug();
  var teamName = $('#name_of_team').val();
  if(teamName.length < 2){
    teamName = "Team"+slug;
  }

  $.ajax({
    url: "/teams/"+slug,
    data: { 
        "slug": slug,
        "team": { "name": teamName, "hunt_initiated": true }
    },
    type: "PUT",
    success: function(response) {
      setView();
    },
    error: function(xhr) {
      console.log("no data error update team");
    }
  });
};