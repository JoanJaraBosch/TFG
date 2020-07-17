// require: Trae la librería express del npm.
var express = require('express');
var os = require('os');

// Se invoca la función (de la variable express) y se almacena en la variable app.
var app = express();

// Define el home de la página y que función se va a ejecutar.
// La función tiene como parámetro el request y el response.
app.get('/', function (req, res) {
  var paso;
  for (paso = 0; paso < 5; paso++) {
  // Se ejecuta 5 veces, con valores desde paso desde 0 hasta 4.
    res.render	
    res.send('Free memory espace, '+os.freemem())
  };  
})

app.get('/cursos', function (req, res) {
  res.send('Estos son los cursos');
  console.log("Página de cursos");
})

// Correr el servidor con el puerto 8989.
app.listen(8989);
