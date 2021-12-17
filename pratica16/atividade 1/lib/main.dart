import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: PrimeiraRota(),
      ),
    );

  class PrimeiraRota extends StatefulWidget {
  PrimeiraRotaState createState() {
    return PrimeiraRotaState();
  }
}



class Preco {
  double etanol;
  double gasolina;
  Preco(this.etanol, this.gasolina);
 
}

class PrimeiraRotaState extends State<PrimeiraRota> {
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController textoController = TextEditingController();

  String mensagem = '';
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeira Rota"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: tituloController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => tituloController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o valor do etanol',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: textoController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => textoController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o valor da gasolina',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Preco preco = Preco(
                double.parse(tituloController.text),
                double.parse(textoController.text),
              );
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SegundaRota(preco)),).then((mensagem) {
                  setState(() {
                    this.mensagem = mensagem;
                  });
                });
            },
            child: Text('Ir para a Segunda Rota'),
          ),
          Text(
              mensagem,
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue,
              ),
            ),
        ],
      ),
    );
  }
}

class SegundaRota extends StatelessWidget {
  final Preco preco;
  SegundaRota(this.preco);
  razao() => preco.etanol / preco.gasolina;

  calculate() {
    String mensagem;
    if (razao() < 0.7) {
      mensagem = "Abasteça com Etanol";
    } else {
      mensagem = "Abasteça com Gasolina";
    }
    return mensagem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Rota'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '${preco.etanol.toStringAsFixed(2)} / ${preco.gasolina.toStringAsFixed(2)} = ${razao().toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 40,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              calculate(),
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue,
              ),
            ),
            ElevatedButton(
              child: Text('Ir para a Primeira Rota'),
              onPressed: () {
                Navigator.pop(context, calculate());
              },
            ),
          ],
        ),
      ),
    );
  }
}
