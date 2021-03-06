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
	//if we want the json for monitoring
	if(message.utf8Data.includes("monitor-")){
		var child = procesFill.spawn('bash', ['./monitoring.sh', whoami, message.utf8Data.split("-")[1]])
        	child.stdout.on('data', (data) => {
                	connection.send(data);
        	});
	}
	else{
		//if we want to send commands to make manteniment
		if(message.utf8Data.includes("manteniment")){
			console.log(message.utf8Data);
			text = message.utf8Data.substring(12, message.utf8Data.length);
			console.log(text);
			text= text.split(" ");
			try{
				var child = procesFill.spawn('./maintenance.sh', text);

				child.stdout.on('data', (data) => {
					console.log('stdout: '+data.toString());
        		                connection.send("stdout: "+data.toString());
                		});

  				child.stderr.on('data', (data) => {
   					console.log('stderr: ' + data.toString());
					connection.send("stderr: "+data.toString());

				});

  				child.on('exit', (code) => {
    					console.log('child process exited with code ' + code.toString());
  				});
			}
			catch(error){
				connection.send(" ");
			}
		}else{
			//or our first message to tell who we are
			whoami=message.utf8Data;
		}
	}
   });
   //close the connection
   connection.on('close', function(reasonCode, description) { 
     
   }); 
 
});
