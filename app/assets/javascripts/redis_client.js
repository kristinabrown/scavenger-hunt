function connectToRedis(){
  var socket = io.connect('https://scavenger-hunt-node.herokuapp.com/');

  socket.on('message', function(){
    setView();
    gatherCurrentHuntData();
  });

};