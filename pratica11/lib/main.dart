import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Home(),
      ),
    );

class Home extends StatelessWidget {
  List<String> newyork = [
    'New York',
    "A cidade de Nova York compreende 5 distritos situados no encontro do rio Hudson com o Oceano Atlantico. No centro da cidade fica Manhattan, um distrito com alta densidade demografica que esta entre os principais centros comerciais, financeiros e culturais do mundo (Wikipedia)."
  ];
  List<String> imagem2 = [
    "tituloimagem2",
    "descricaoimagem2"
  ];
  List<String> imagem3 = [
    "tituloimagem3",
    "descricaoimagem3"
  ];
  List<String> imagem4 = [
    "tituloimagem4",
    "descricaoimagem4"
  ];
  List<String> imagem5 = [
    "tituloimagem5",
    "descricaoimagem5"
  ];
  List<String> imagem6 = [
    "tituloimagem6",
    "descricaoimagem6"
  ];
  List<String> imagem7 = [
    "tituloimagem7",
    "descricaoimagem7"
  ];
  List<String> imagem8 = [
    "tituloimagem8",
    "descricaoimagem8"
  ];
  List<String> imagem9 = [
    "tituloimagem9",
    "descricaoimagem9"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Álbum"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  child: Image.network("https://images.pexels.com/photos/213781/pexels-photo-213781.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute(newyork[0], newyork[1])),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  child: Image.network("https://images.pexels.com/photos/213782/pexels-photo-213782.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute(imagem2[0], imagem2[1])),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  child: Image.network("https://images.pexels.com/photos/213783/pexels-photo-213783.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute(imagem3[0], imagem3[1])),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  child: Image.network("https://images.pexels.com/photos/213784/pexels-photo-213784.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute(imagem4[0], imagem4[1])),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  child: Image.network("https://images.pexels.com/photos/213785/pexels-photo-213785.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute(imagem5[0], imagem5[1])),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  child: Image.network("https://images.pexels.com/photos/213786/pexels-photo-213786.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute(imagem6[0], imagem6[1])),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  child: Image.network("https://images.pexels.com/photos/213787/pexels-photo-213787.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute(imagem7[0], imagem7[1])),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  child: Image.network("https://images.pexels.com/photos/213788/pexels-photo-213788.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute(imagem8[0], imagem8[1])),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  child: Image.network("https://images.pexels.com/photos/213789/pexels-photo-213789.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute(imagem9[0], imagem9[1])),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  String title;
  String text;

  SecondRoute(String title, String text) {
    this.title = title;
    this.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(children: [
          Container(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(1.0),
              ),
            ),
            margin: EdgeInsets.all(80),
          ),
          Container(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
            ),
            margin: EdgeInsets.only(left: 20),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_outlined), //icon inside button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}
