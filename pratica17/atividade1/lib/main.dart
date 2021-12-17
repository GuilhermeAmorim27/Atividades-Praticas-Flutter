import 'package:flutter/material.dart';

void main() => runApp(MeuAplicativo());

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeiraRota(),
      routes: {
        RotaGenerica.caminhoDaRota: (context) => RotaGenerica(),
      },
    );
  }
}

class PrimeiraRota extends StatelessWidget {
  TextEditingController celsiusControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Rota'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: celsiusControler,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => celsiusControler.clear(),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'temperatura em graus Celsius',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RotaGenerica.caminhoDaRota,
                    arguments: ArgumentosDaRota(
                      'Graus Farenheit',
                      double.parse(celsiusControler.text),
                    ),
                  );
                },
                child: Text("Converter"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RotaGenerica extends StatelessWidget {
  static const caminhoDaRota = '/rotaGenerica';

  Conversor(double celsius) => celsius * 1.8 + 32;

  @override
  Widget build(BuildContext context) {
    ArgumentosDaRota argumentos =
        ModalRoute.of(context)!.settings.arguments as ArgumentosDaRota;

    return Scaffold(
      appBar: AppBar(
        title: Text(argumentos.titulo),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 100, 10, 10),
              child: Text(
                "Graus celsius: ${argumentos.celsius.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 100, 10, 10),
              child: Text(
                'Graus Farenheit: ${Conversor(argumentos.celsius).toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArgumentosDaRota {
  String titulo;
  double celsius;
  ArgumentosDaRota(this.titulo, this.celsius);
}
