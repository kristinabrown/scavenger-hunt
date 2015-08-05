function updateAccept(){
  var slug = getSlug();

  $.ajax({
    url: "/update_accept",
    data: { 
        "slug": slug
    },
    type: "PUT",
    success: function(response) {
      setView();
    },
    error: function(xhr) {
      console.log("no data error update team");
    }
  });

};


function tryAgain(){
  $('#failure_response_button').on('click', function(){
    updateAccept();
  });
};

function nextClue(){
  $('#success_response_button').on('click', function(){
    updateAccept();
  });
};

function setResponseView(isClueCorrect, currentTeamData){
  var slug = getSlug();
  tryAgain();
  nextClue();

  $.ajax({
    url: "/next_location/"+slug,
    data: { 
        "slug": slug,
        "team": { "correct": isClueCorrect }
    },
    type: "PUT",
    success: function(response) {
      isClueCorrect ? $('.success_response').toggle() : $('.failure_response').toggle()
      $('.submission_response').toggle();
    },
    error: function(xhr) {
      console.log("no data error set View");
    }
  });
  
};