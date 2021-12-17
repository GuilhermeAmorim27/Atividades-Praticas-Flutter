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
 var preco1 = parseFloat(req.query.preco1);
 var preco2 = parseFloat(req.query.preco2);
 var preco3 = parseFloat(req.query.preco3);

 var media = (preco1 + preco2 + preco3) / 3;

 res.send(`Media = ${media}`);
});
