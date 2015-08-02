ScavengerHunt.Routers.Hunts = Backbone.Router.extend({
  routes: {
    // ""                 : 'dashboard'
    "admin_dashboard" : "dashboard" //#dashboard
  },

  dashboard: function(){
    alert('we are here on dashboard')
  }

});

 