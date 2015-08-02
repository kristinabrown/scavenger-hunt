window.ScavengerHunt = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new ScavengerHunt.Routers.Hunts();
    new ScavengerHunt.Routers.Teams();
    Backbone.history.start();
  }
};

$(document).ready(function(){
  ScavengerHunt.initialize();
});
