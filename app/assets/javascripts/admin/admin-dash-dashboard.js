function showAdminDashboardPage(data) {
  $(".dashboard").toggle();
    $("#submissions").empty();
    $(".standings_list").empty();
  for (var i = 0; i < data.teams.length; i++) {
    $(".standings_list").append("<tr><td>" + data.teams[i].team.name + "</td><td>" + data.teams[i].location_name + "</td><td>" + data.teams[i].team.found_locations + "</td></tr>");
  }
    var submissions = data.submissions;
    var renderedSubmissions = submissions.map(renderSubmission);
    renderedSubmissions.forEach(bindUpdateSubmissonEvent);
    $("#submissions").append(renderedSubmissions);
  }

function renderSubmission(submission){
  return $("<div class='row' data-id='" + submission.data.id + "'>" +
                             "<div class='col s12 m9'>" +
                               "<div class='card'>" +
                                 "<div class='card-image hoverable'>" +
                                 "<img src='" + submission.attachment_url + "'>" +
                                 "</div>" +
                                   "<div class='card-content'>" +
                                     "<p>Location: " + submission.location_name + "</p>" +
                                      "<p>Team: " + submission.team_name + "</p>" +
                                   "</div>" +
                                   "<div class='card-action center-align '><a class='btn-floating btn-large waves-effect waves-light red incorrect'><i class='material-icons'>BOO</i></a>" +
                                   "<a class='btn-floating btn-large waves-effect waves-light green correct'><i class='material-icons'>Ya!</i></a>" +
                                   "</div>" +
                                 "</div>" +
                              "</div>" +
                            "</div>");
}

function bindUpdateSubmissonEvent(submission){
  $(submission).find(".incorrect").on("click", function() {
    var $submission = $(this).parents(".row")
    var id = $submission.data("id")
    $.ajax({
      url: "/submissions/" + id,
      dataType: "json",
      method: "patch",
      data: {submission: {correct: false, responded_to: true} },
      success: function(){
        $submission.remove();
      }

    })
  })
  $(submission).find(".correct").on("click", function() {
    var $submission = $(this).parents(".row")
    var id = $submission.data("id")
    $.ajax({
      url: "/submissions/" + id,
      dataType: "json",
      method: "patch",
      data: {submission: {correct: true, responded_to: true} },
      success: function(){
        $submission.remove();
      }

    })
  })
}
