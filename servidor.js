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
	if(message.utf8Data === "monitor"){
		var child = procesFill.spawn('bash', ['./monitoring.sh', whoami])
        	child.stdout.on('data', (data) => {
                	connection.send(data);
        	});
	}
	else{
		whoami=message.utf8Data;
	}
   });

   connection.on('close', function(reasonCode, description) { 
     
   }); 
 
});
