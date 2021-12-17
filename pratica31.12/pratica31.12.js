
const express = require('express');
const app = express();
const port = 8030;
const hostname = '127.0.0.1';
//Iniciar:
app.listen(port, hostname, function() {
 console.log(`O servidor foi iniciado no host ${hostname} e porta ${port}`);
});
//URL: http://127.0.0.1:8030?nomeAluno=Ana <-- Query String.
app.get('/', function(req, res) {
 res.statusCode = 200;
 res.setHeader('Content-Type', 'text/plain; charset=utf-8');
 var x = parseFloat(req.query.x);
 var y = parseFloat(req.query.y);
 var z = parseFloat(req.query.z);
 var mensagem = "";

 if (x < (y + z) & y < (x + z) & z < (x + y) ){
     mensagem = "Os valores pertencem a um triangulo"
 }else{
     mensagem = "Os valores nao pertencem a um triangulo "
 }
 res.send(`${mensagem}`);
});
