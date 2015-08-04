function showTeamPhoneNUmbersPage(numberOfTeams){
  $(".team_numbers").toggle();
  for (var i = 0; i < numberOfTeams; i++) {
    $("#team_phone_number_list").append("<li><label for='phone_number'>Team #</label><br><input name='phone_number' id='team" + [i] + "'data-hunt-id='" + currentHuntData.id + "'></input></li>");
  }
};

function createTeams() {
  $("#create_teams_button").on("click", function(event) {
    event.preventDefault();

    var number_of_teams = $("#team_phone_number_list").children().length
    for (var i = 0; i < number_of_teams; i++) {
      $.post("/teams", { team: {hunt_id: $( "#team" + i ).data("huntId"), phone_number: $("#team" + i).val() }})
    }
    gatherCurrentHuntData();
  });
};
