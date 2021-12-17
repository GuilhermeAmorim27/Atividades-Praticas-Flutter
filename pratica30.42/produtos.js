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
//URL: http://127.0.0.1:8030/produtos/:id
class Produtos {
    constructor(nome, preco) {
        this.nome = nome;
        this.preco = preco;
    }
    toString() {
        return this.nome + ", R$" + this.preco;
    }
}
app.get('/produtos/:id', function (req, res) {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/html; charset=utf-8');
    let id = parseFloat(req.params.id);
    let mensagem = "";
    let produtos = [new Produtos("Sapato", 99.99), new Produtos("Bolsa", 103.00), new Produtos("Camisa", 49.98), new Produtos("Calça", 89.72), new Produtos("Blusa", 97.35)];
   
    if(id < (produtos.length)){
        mensagem = "Id = " + id + ", " + produtos[id];
    }else{
        mensagem = "id inexistente";
    }
    
    let pagina = `
 <html>
 <head>
 <title>Produtos</title>
 <link rel="stylesheet" href="/produtos.css">
 </head>
 <body>
 <h1>Produtos</h1>

 <div class="tipo"> ${mensagem}.</div>


 </body>
 </html>
 `
    res.send(pagina);
});