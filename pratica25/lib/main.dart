import 'package:flutter/material.dart';

void main() => runApp(Aplicativo());

class Aplicativo extends StatefulWidget {
  @override
  AplicativoState createState() => AplicativoState();
}

class AplicativoState extends State<Aplicativo> {
  final itens = List<String>.generate(10, (i) => 'Item ${i + 1}');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exclusão de Itens'),
        ),
        body: ListView.builder(
          itemCount: this.itens.length,
          itemBuilder: (context, index) {
            final item = this.itens[index];

            return Dismissible(
              /* Cada widget Dismissible precisa ter uma chave (Key).
 * A chave permite itentificar cada widget unicamente.
 */
              key: Key(item),
              onDismissed: (direcao) {
                setState(() => this.itens.removeAt(index));
                switch (direcao) {
                  case DismissDirection.startToEnd:
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$item removido'),
                      ),
                    );
                    break;

                  case DismissDirection.endToStart:
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$item arquivado'),
                      ),
                    );
                    break;
                  default:
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('ação não reconhecida.'),
                      ),
                    );
                }
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              secondaryBackground: Container(
                color: Colors.green,
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.archive,
                  color: Colors.white,
                ),
              ),
              child: ListTile(title: Text('$item')),
            );
          },
        ),
      ),
    );
  }
}
