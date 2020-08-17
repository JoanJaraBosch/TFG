var WebSocketServer = require('websocket').server;
var https = require('https');
var os = require('os');
var fs = require('fs');
const procesFill = require('child_process');

const server = https.createServer({
  cert: fs.readFileSync('/etc/nginx/ssl/nginx.crt'),
  key: fs.readFileSync('/etc/nginx/ssl/nginx.key'),
  passphrase: 'odroid'
});

server.listen(3000, '0.0.0.0');

const wsServer = new WebSocketServer({
   httpServer: server
});

var whoami;

wsServer.on('request', function (request) {
   const connection = request.accept(null, request.origin);

   connection.on('message', function(message){
      console.log('Received Message:', message.utf8Data);
      if(message.utf8Data === "cpu usage"){
          var child = procesFill.spawn('bash', ['./cpu_usage.sh', whoami])
	  child.stdout.on('data', (data) => {
             connection.send(data);
          });
      }
      else{
          if(message.utf8Data === "mem usage"){
          	var child = procesFill.spawn('bash', ['./mem_usage.sh', whoami])
          	child.stdout.on('data', (data) => {
             		connection.send(data);
          	});
      	  }else{
		if(message.utf8Data === "mem avail"){
			var child = procesFill.spawn('bash', ['./mem_available.sh', whoami])
	                child.stdout.on('data', (data) => {
        	                connection.send(data);
                	});

		}
		else{
			whoami=message.utf8Data;
			console.log(whoami);
		}
	  }
      }
   });

   connection.on('close', function(reasonCode, description) { 
      console.log('Client Disconnected');
   }); 
 
});

console.log('Listening');
