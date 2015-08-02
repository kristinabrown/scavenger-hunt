window.ScavengerHunt = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new ScavengerHunt.Routers.Hunts({});
    alert('Hello from Backbone!');
  }
};

$(document).ready(function(){
  ScavengerHunt.initialize();
});
