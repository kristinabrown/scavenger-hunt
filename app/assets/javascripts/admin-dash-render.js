function gatherCurrentHuntData(){
  $.getJSON("/hunts", function(xhr){
    renderCorrectTemplate(xhr);
  });
};


function renderCorrectTemplate(currentHuntData){
  if(!($(".new_hunt").is(":hidden"))) {$(".new_hunt").toggle();}
  if(!($(".team_numbers").is(":hidden"))) {$(".team_numbers").toggle();}
  if(!($(".dashboard").is(":hidden"))) {$(".dashboard").toggle();}

    if(currentHuntData.active && currentHuntData.teams.length > 0){
      $(".dashboard").toggle();
      for (var i = 0; i < currentHuntData.teams.length; i++) {
        $(".standings_list").append("<tr><td>" + currentHuntData.teams[i].name + "</td><td>" + currentHuntData.teams[i].current_location + "</td><td>" + currentHuntData.teams[i].found_locations + "</td></tr>");
        $("#submissions").append("<div class='row'>"
                                  + "<div class='col s12 m9'>"
                                    + "<div class='card'>"
                                      + "<div class='card-image hoverable'>"
                                        + "<img src='https://icorockies.com/wp-content/uploads/2010/11/colorado_capital.jpg'>"
                                        + "<span class='card-title'>Card Title</span>"
                                      + "</div>"
                                        + "<div class='card-content'>"
                                          + "<p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>"
                                        + "</div>"
                                        + "<div class='card-action'><a href='#'>This is a link</a>"
                                        + "</div>"
                                      + "</div>"
                                    +"</div>"
                                  +"</div>");
      }
    } else if (currentHuntData.active){
      $(".team_numbers").toggle();
      for (var i = 0; i < currentHuntData.number_of_teams; i++) {
        $("#team_phone_number_list").append("<li><label for='phone_number'>Team #</label><br><input name='phone_number' id='team" + [i] + "'data-hunt-id='" + currentHuntData.id + "'></input></li>");
      }
    } else {
      $(".new_hunt").toggle();
    }
  };

function createTeams() {
  $("#create_teams_button").on("click", function(event) {
    event.preventDefault();

    var number_of_teams = $("#team_phone_number_list").children().length
    for (var i = 0; i < number_of_teams; i++) {
      debugger
      $.post("/teams", { team: {hunt_id: $( "#team" + i ).data("huntId"), phone_number: $("#team" + i).val() }})
    }
  });
};

function activateHunt() {
  $("#new_hunt_button").on("click", function(event){
    event.preventDefault();

    var number_of_teams = $("#number_of_teams").val()
    var name_of_hunt = $("#name_of_hunt").val()
    var data = {hunt: {number_of_teams: number_of_teams, name: name_of_hunt }}

    $.post("/hunts", data).then(gatherCurrentHuntData())
  });
}
