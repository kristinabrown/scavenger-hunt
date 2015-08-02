window.ScavengerHunt = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new ScavengerHunt.Routers.Hunts();
    new ScavengerHunt.Views.HuntsNew();
    Backbone.history.start();
  }
};

$(document).ready(function(){
  ScavengerHunt.initialize();
});
