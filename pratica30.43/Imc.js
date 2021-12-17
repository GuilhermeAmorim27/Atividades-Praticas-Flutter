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
app.listen(port, hostname, function () {
    console.log(`O servidor foi iniciado no host ${hostname} e porta ${port}.`);
});
//URL: http://127.0.0.1:8030/
app.get('/', function (req, res) {
    res.send(dir);
});
//URL: http://127.0.0.1:8030/imc/:peso/:altura

app.get('/imc/:peso/:altura', function (req, res) {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/html; charset=utf-8');
    let peso = parseFloat(req.params.peso);
    let altura = parseFloat(req.params.altura);
    let mensagem = "";
    let imc = peso / (altura * altura);

    if(imc < 18.5){
        mensagem = "abaixo do peso";
    }else if (imc >= 18.6 & imc <= 24.9){
        mensagem = " Peso ideal (Parabens)";
    }else if (imc >= 25 & imc <= 29.9){
        mensagem = " Levemente acima do peso";
    }else if (imc >= 30 & imc <= 34.9){
        mensagem = "Obesidade grau I";
    }else if (imc >= 35 & imc <= 39.9){
        mensagem = "Obesidade grau II (severa)";
    }else if (imc >= 40){
        mensagem = "Obesidade grau III (morbida)";
    }
  
    let pagina = `
 <html>
 <head>
 <title>IMC</title>
 <link rel="stylesheet" href="/imc.css">
 </head>
 <body>
 <h1>IMC</h1>

 <div class="imc"> IMC = ${imc.toFixed(2)}</div>
 <div class="resultado"> Resultado = ${mensagem}</div>


 </body>
 </html>
 `
    res.send(pagina);
});