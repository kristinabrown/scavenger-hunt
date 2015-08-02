window.ScavengerHunt = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new ScavengerHunt.Routers.Hunts();
    Backbone.history.start();
  }
};

$(document).ready(function(){
  ScavengerHunt.initialize();
});
