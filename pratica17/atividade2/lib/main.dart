import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MeuAplicativo());

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeiraRota(),
      routes: {
        SegundaRota.caminhoDaRota: (context) => SegundaRota(),
        TerceiraRota.caminhoDaRota: (context) => TerceiraRota(),
      },
    );
  }
}

class PrimeiraRota extends StatelessWidget {
  TextEditingController valorEmRealController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valor em Real'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: valorEmRealController,
              decoration: InputDecoration(
                labelText: "Informe o valor em real",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    valorEmRealController.clear();
                  },
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton.icon(
              label: const Text("Proximo"),
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  SegundaRota.caminhoDaRota,
                  arguments: double.parse(valorEmRealController.text),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SegundaRota extends StatelessWidget {
  TextEditingController cotacaoDoDolarController = TextEditingController();

  static const String caminhoDaRota = "/segundaRota";

  @override
  Widget build(BuildContext context) {
    double valorEmReal = ModalRoute.of(context)!.settings.arguments as double;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cotaçao'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: cotacaoDoDolarController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Informe a cotaçao do Dólar",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    cotacaoDoDolarController.clear();
                  },
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton.icon(
              icon: Icon(Icons.navigate_next),
              label: const Text('Próximo'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  TerceiraRota.caminhoDaRota,
                  arguments: ArgumentosDaRota(
                    valorEmReal,
                    double.parse(cotacaoDoDolarController.text),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TerceiraRota extends StatelessWidget {
  static const caminhoDaRota = '/terceiraRota';

  converter(double valorEmReal, double cotacao) => valorEmReal / cotacao;

  @override
  Widget build(BuildContext context) {
    ArgumentosDaRota argumentos =
        ModalRoute.of(context)!.settings.arguments as ArgumentosDaRota;
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
      ),
      body: Center(
        child: Text(
          "R\$ ${argumentos.valorEmReal.toStringAsFixed(2)} = US\$ ${converter(argumentos.valorEmReal, argumentos.cotacaoDoDolar).toStringAsFixed(2)}",
          style: TextStyle(
            fontSize: 20,
            color: Colors.amber[700],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ArgumentosDaRota {
  double valorEmReal;
  double cotacaoDoDolar;
  ArgumentosDaRota(this.valorEmReal, this.cotacaoDoDolar);
}
