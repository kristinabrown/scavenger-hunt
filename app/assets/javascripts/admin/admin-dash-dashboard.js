function showAdminDashboardPage(data) {
  $(".dashboard").toggle();
  for (var i = 0; i < data.teams.length; i++) {
    $(".standings_list").append("<tr><td>" + data.teams[i].name + "</td><td>" + data.teams[i].location_id + "</td><td>" + data.teams[i].found_locations + "</td></tr>");


    //this is a sample submission it needs to be removed when we implement submissions
    $("#submissions").append("<div class='row'>" +
                               "<div class='col s12 m9'>" +
                                 "<div class='card'>" +
                                   "<div class='card-image hoverable'>" +
                                     "<img src='https://icorockies.com/wp-content/uploads/2010/11/colorado_capital.jpg'>" +
                                     "<span class='card-title'>Card Title</span>" +
                                   "</div>" +
                                     "<div class='card-content'>" +
                                       "<p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>" +
                                     "</div>" +
                                     "<div class='card-action'><a href='#'>This is a link</a>" +
                                     "</div>" +
                                   "</div>" +
                                "</div>" +
                              "</div>");
  }
}
