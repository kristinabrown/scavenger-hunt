ScavengerHunt.Routers.Teams = Backbone.Router.extend({

  routes: {
    "teams/:id"  : "show"    
  },

  show: function(id){
    alert("TEAMS CLIENT"+id)
  }

});
