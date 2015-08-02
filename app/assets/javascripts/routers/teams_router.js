ScavengerHunt.Routers.Teams = Backbone.Router.extend({
  routes: {
    "": "dashboard"
  },
  dashboard: function() {
    alert("teams router")
  }
});
