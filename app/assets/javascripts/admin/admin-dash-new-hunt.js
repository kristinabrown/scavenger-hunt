function showNewHuntPage() {
  $(".new_hunt").toggle();
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
