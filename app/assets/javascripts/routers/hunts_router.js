ScavengerHunt.Routers.Hunts = Backbone.Router.extend({
  routes: {
    "admin-dashboard": "dashboard"
  },

  dashboard: function() {
    console.log("home page hitting")
    alert("Hunt dashboard")
  }
});
