//variables needed to create the server
var WebSocketServer = require('websocket').server;
var https = require('https');
var os = require('os');
var fs = require('fs');
const procesFill = require('child_process');

//getting the certificates to do the connection secure
const server = https.createServer({
  cert: fs.readFileSync('/etc/nginx/ssl/nginx.crt'),
  key: fs.readFileSync('/etc/nginx/ssl/nginx.key'),
  passphrase: 'odroid'
});

//listen the port 
server.listen(3000, '0.0.0.0');
const wsServer = new WebSocketServer({
   httpServer: server
});

var whoami;
//the server gets a requets, he reads it and then responds it
wsServer.on('request', function (request) {
   //get the request
   const connection = request.accept(null, request.origin);
   //responds it
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
   //close the connection
   connection.on('close', function(reasonCode, description) { 
     
   }); 
 
});
