ScavengerHunt.Routers.Hunts = Backbone.Router.extend({
  routes: {
    "admin-dashboard": "dashboard"
  },

  initialize: function() {
    this.collection = new ScavengerHunt.Collections.Hunts;
  },

  dashboard: function() {
    view = new ScavengerHunt.Views.HuntsNew;
    view.render();
  }
});
