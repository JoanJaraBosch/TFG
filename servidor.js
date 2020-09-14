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
	if(message.utf8Data === "json test"){
		var child = procesFill.spawn('bash', ['./json_test.sh', whoami])
        	child.stdout.on('data', (data) => {
                	connection.send(data);
			console.log('json test:', data);
        	});
	}
	else{
		whoami=message.utf8Data;
		console.log(whoami);
	}
   });

   connection.on('close', function(reasonCode, description) { 
      console.log('Client Disconnected');
   }); 
 
});

console.log('Listening');
