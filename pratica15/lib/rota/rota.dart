import 'package:flutter/material.dart';

import '../main.dart';


class PrimeiraRotaState extends State<PrimeiraRota> {
  String mensagem = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Rota'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '$mensagem',
              style: TextStyle(
                fontSize: 40,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              child: Text('Ir para a Segunda Rota'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SegundaRota()),
                ).then((resposta) {
                  setState(() {
                    mensagem = resposta;
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SegundaRota extends StatelessWidget {
  TextEditingController num01Controller = TextEditingController();
  TextEditingController num02Controller = TextEditingController();

 soma(){
  int num01 = int.parse(num01Controller.text);
  int num02 = int.parse(num02Controller.text);
  int soma = num01 + num02;
  return "$num01 + $num02 = $soma";
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: num01Controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => num01Controller.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o primeiro número',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: num02Controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => num02Controller.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o segundo número',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, soma());
            },
            child: Text('Voltar para a Primeira Rota'),
          ),
        ],
      ),
    );
  }
}
