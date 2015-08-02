ScavengerHunt.Routers.Teams = Backbone.Router.extend({

  initialize: function(numberOfTeamsPlaying, huntId) {
    $(".container").html('');
    view = new ScavengerHunt.Views.TeamsNew;
    view.render(numberOfTeamsPlaying);
  },

  routes: {
    "new-team-phone-numbers": "dashboard"
  },

  dashboard: function() {
    alert("teams router")
  }
});
