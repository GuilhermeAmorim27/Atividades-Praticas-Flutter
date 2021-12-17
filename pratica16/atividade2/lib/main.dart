import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Home(),
      ),
    );

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álbum"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: <Widget>[
          InkWell(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Image.network(
                  "https://images.pexels.com/photos/213781/pexels-photo-213781.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SegundaRota(
                  descricao: Descricao(
                      tituloAppBar: 'Nova York',
                      tituloMensagem: 'Nova York, EUA',
                      descricao:
                          'A cidade de Nova York compreende 5 distritos situados no encontro do rio Hudson com o Oceano Atlântico. No centro da cidade fica Manhattan, um distrito com alta densidade demográfica que está entre os principais centros comerciais, financeiros e culturais do mundo (Wikipedia).'),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.network(
                "https://images.pexels.com/photos/213782/pexels-photo-213782.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.network(
                "https://images.pexels.com/photos/213783/pexels-photo-213783.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.network(
                "https://images.pexels.com/photos/213784/pexels-photo-213784.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.network(
                "https://images.pexels.com/photos/213785/pexels-photo-213785.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.network(
                "https://images.pexels.com/photos/213786/pexels-photo-213786.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.network(
                "https://images.pexels.com/photos/213787/pexels-photo-213787.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.network(
                "https://images.pexels.com/photos/213788/pexels-photo-213788.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.network(
                "https://images.pexels.com/photos/213789/pexels-photo-213789.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          ),
        ],
      ),
    );
  }
}

class Descricao {
  Descricao(
      {required this.tituloAppBar,
      required this.tituloMensagem,
      required this.descricao});

  final String tituloAppBar;
  final String tituloMensagem;
  final String descricao;
}

class SegundaRota extends StatelessWidget {
  SegundaRota({required this.descricao});

  final Descricao descricao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(child: Text(descricao.tituloAppBar)),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text(
                descricao.tituloMensagem,
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20.0,
                ),
              ),
              margin: EdgeInsets.all(75),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                descricao.descricao,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back,
        ),
        backgroundColor: Colors.green,
        tooltip: "voltar",
        onPressed: () => Navigator.pop(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}
