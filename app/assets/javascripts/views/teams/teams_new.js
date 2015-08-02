ScavengerHunt.Views.TeamsNew = Backbone.View.extend({

  

  template: JST['teams/new'],

  render: function(numberOfTeamsPlaying){
    $(".container").html(this.$el.html(this.template()));

  }

});
