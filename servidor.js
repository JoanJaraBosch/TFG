var WebSocketServer = require('websocket').server;
var http = require('http');
var os = require('os');
const procesFill = require('child_process');

const server = http.createServer();
server.listen(3000);

const wsServer = new WebSocketServer({
    httpServer: server
});

wsServer.on('request', function (request) {
   const connection = request.accept(null, request.origin);

   connection.on('message', function(message){
      console.log('Received Message:', message.utf8Data);
      if(message.utf8Data === "cpu usage"){
          var child = procesFill.spawn('bash', ['./cpu_usage.sh'])
	  child.stdout.on('data', (data) => {
             connection.send(data);
          });
      }
      else{
         connection.sendUTF('HI THIS IS WEBSOCKET DUDES');
      }
   });

   connection.on('close', function(reasonCode, description) { 
      console.log('Client Disconnected');
   }); 
 
});

console.log('Listening');
