function connectToRedis(){
  console.log("connectToRedis() fired")
  var socket = io.connect('http://localhost:3001/');

  socket.on('message', function(){
    setView();
    gatherCurrentHuntData();
    console.log("WE SHOULD HAVE RE-RENDERED")
  });

};