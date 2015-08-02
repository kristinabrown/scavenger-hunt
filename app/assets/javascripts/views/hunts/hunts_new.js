ScavengerHunt.Views.HuntsNew = Backbone.View.extend({

  initialize: function() {
    this.collection = new ScavengerHunt.Collections.Hunts;
  },

  templateNew: JST['hunts/new'],
  templateTeamPhoneNumbers: JST['hunts/phone'],
  templateDashboard: JST['hunts/dashboard'],

  render: function(currentHuntData) {
    renderCorrectTemplate(currentHuntData);
    return this
  },

  renderCorrectTemplate: function(currentHuntData){
    if(currentHuntData.active && currentHuntData.teams.length > 0){
      return $(".container").html(this.$el.html(this.templateDashboard()));
    } else if(currentHuntData.active){
      return $(".container").html(this.$el.html(this.templateTeamPhoneNumbers()));
      for (var i = 0; i < currentHuntData.teams.length; i++) {
        $(".phone-numbers").append("<li><label for='phone_number'>" + i + "</label><br><input name='phone_number' id='team" + currentHuntData.teams[i].id + "'></input></li>")
      }
    } else {
      return $(".container").html(this.$el.html(this.templateNew()));
      for (var i = 0; i < currentHuntData.teams.length; i++) {
        $("#standings").append("<tr><td>" + currentHuntData.teams[i].name + "</td><td>" + currentHuntData.teams[i].current_location + "</td><td>" + currentHuntData.teams[i].found_locations + "</td></tr>")
        $("#submissions").append("<div class='row'><div class='col s12 m7'><div class='card'><div class='card-image'>"
        + "<img src='images/sample-1.jpg'>"
        + "<span class='card-title'>Card Title</span>"
        + "</div><div class='card-content'>"
        + "<p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>"
        + "</div><div class='card-action'><a href='#'>This is a link</a></div>"
        + "</div></div></div>)"
      }
      $("#standings").append("<table>")
    }
  },

  events: {
    "click #new-game-button": "setupGame"
  },

  setupGame: function(event) {
    event.preventDefault();
    this.createNewHunt();
  },

  createNewHunt: function(){
    var huntName = $("#name-of-hunt-input").val()
    var numberOfTeams = $("#number-of-teams-input").val()
    this.collection.create({
      name: huntName,
      number_of_teams: numberOfTeams
    },
      {
    wait: true,
    success: function(xhr){new ScavengerHunt.Routers.Teams(numberOfTeams, xhr.id)},
    error: function(){alert("Error when creating your hunt. Try again.")}
    }
  );
}
});
