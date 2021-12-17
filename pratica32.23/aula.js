var express = require('express');
var bodyParser = require('body-parser');
var app = express();

app.use(express.json());

app.use(express.urlencoded({ extended: true }));
var port = 8030;
var hostname = 'localhost';


app.listen(port, hostname, function() {
 console.log(`O servidor foi iniciado no host ${hostname} e porta ${port}`);
});
//URL: http://127.0.0.1:8030/equacao/:a/:b/:c
app.post('/equacao', function(req, res) {
 res.statusCode = 200;
 res.setHeader('Content-Type', 'text/plain; charset=utf-8');
 
 let a = req.body.a;
 let b = req.body.b;
 let c = req.body.c;
 let mensagem = "";

 let delta = b * b - 4 * a * c;

 if(a == 0 & b == 0 & c != 0){
      mensagem = "Coeficinetes informados incorretamente"
 }else if (c == 0){
     mensagem = "Igualdade confirmada: 0 = 0"
 }else if(a == 0 & b != 0){
     mensagem = `Esta é uma equaçao de primeiro grau: x =' ${(c/-b)}`;
 }else if(delta < 0){
     mensagem = "Esta equaçao nao possui raizes reais iguais";
 }else if(delta > 0){
    var raiz1 = (-b + Math.sqrt(delta) )/(2*a);
    var raiz2 = (-b - Math.sqrt(delta) )/(2*a);
    mensagem = `Esta equaçao possui duas raizes reais diferente: x = ${raiz1}, x = ${raiz2}`;  
 }else{
     var raiz = (-b + Math.sqrt(delta) )/(2*a);
     mensagem = `Esta equaçao possui duas raizes reais iguais: x = ${raiz}`;
 }
    console.log(req.body);
    res.send(mensagem)
}
);