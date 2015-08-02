class ScavengerHunt.Routers.Hunts = Backbone.Routers.extend({
  routes: {
    '/admin-dashboard': 'dashboard' //#dashboard
  }

  initialize: {
    alert('Hello from Backbone!');
  }
});
