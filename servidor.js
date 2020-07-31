var WebSocketServer = require('websocket').server;
var http = require('http');
var os = require('os');

const server = http.createServer();
server.listen(3000);

const wsServer = new WebSocketServer({
    httpServer: server
});

wsServer.on('request', function (request) {
   const connection = request.accept(null, request.origin);

   connection.on('message', function(message){
      console.log('Received Message:', message.utf8Data);
      var cpus = os.cpus();
      if(message.utf8Data === "cpu usage"){
	 for(var i = 0, len = cpus.length; i < len; i++) {
          console.log("CPU %s:", i);
          var cpu = cpus[i], total = 0;
 
          for(var type in cpu.times) {
             total += cpu.times[type];
          }

          for(type in cpu.times) {
               var percentatges = Math.round(100 * cpu.times[type] / total);
               connection.sendUTF(percentatges.toString());
          }
         }
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
