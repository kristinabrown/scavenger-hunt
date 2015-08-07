function connectToRedis(){
  var socket = io.connect('http://localhost:3001/');

  socket.on('message', function(){
    setView();
    gatherCurrentHuntData();
  });

};