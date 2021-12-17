const express = require('express');
const path = require('path');
const app = express();
const port = 8030;
const hostname = '127.0.0.1';
const dir_css = path.join(__dirname, 'css');
const dir_fig = path.join(__dirname, 'fig');
app.use(express.static(dir_css));
app.use(express.static(dir_fig));
//Iniciar:
app.listen(port, hostname, function() {
 console.log(`O servidor foi iniciado no host ${hostname} e porta ${port}.`);
});
//URL: http://127.0.0.1:8030/
app.get('/', function(req, res) {
 res.send(dir);
});
//URL: http://127.0.0.1:8030/MediaDoAluno/:nota1/:nota2/:nota3
app.get('/MediaDoAluno/:nota1/:nota2/:nota3', function(req, res) {
 res.statusCode = 200;
 res.setHeader('Content-Type', 'text/html; charset=utf-8');

 let nota1 = parseFloat(req.params.nota1);
 let nota2 = parseFloat(req.params.nota2);
 let nota3 = parseFloat(req.params.nota3);
 let media = (nota1 + nota2 + nota3) / 3;
 let imagem = "";
 let resultado;

 if(media >= 0 & media < 3){
     resultado = "Reprovado"
     imagem = "/reprovado.jpg"
 }else if(media >= 3 & media < 7){
     resultado = "Exame";
 }else if(media >= 7){
     resultado = "Aprovado";
     imagem = "/aprovado.jpg"
 }

 let pagina = `
 <html>
 <head>
 <title>Media Escolar</title>
 <link rel="stylesheet" href="/CalcularMedia.css">
 </head>
 <body>
 <h1>Media Escolar</h1>
 <div class="nota">Primeira nota: ${nota1}.</div>
 <div class="nota">Segunda nota: ${nota2}.</div>
 <div class="nota">Terceira nota: ${nota3}.</div>
 <div class="resultado">Media: ${media}.</div>
 <div class="resultado">Situaçao: ${resultado}.</div>
 <div class="fig"><img src="${imagem}" alt="Imagem de Aprovaçao"></
div>
 </body>
 </html>
 `
 res.send(pagina);
});