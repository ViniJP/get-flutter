import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_app/listaProdutos.dart';
import 'produto.dart';

class PaginaProduto extends StatelessWidget {

  final Produto produto;
  const PaginaProduto(this.produto);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GET"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  produto.titulo,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                    produto.localImagem,
                    height: 300,
                    width: 200
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(child: Text("RS 9,99",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22),
                    )),
                    Expanded(child: Image.asset('assets/star_icon.png', height: 25, width: 50,))
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  produto.extra,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[500],
                  ),
                ),
                Divider(height: 20),
                Text(
                  produto.descricao,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
                Divider(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text('Comprar'),
                      onPressed: () {showMyDialog(context);},
                      color: Colors.indigo,
                      textColor: Colors.white,
                      padding: const EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


Future<void> showMyDialog(context) async {


  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      String dialogText;
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text(Strings.titulo_alertdialog),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(Strings.texto_alertdialog),
                  SizedBox(height: 10.0),
                  TextField(
                    onChanged: (String textTyped) {
                      setState(() {
                        dialogText = textTyped;
                      });
                    },
                      decoration: InputDecoration(
                        hintText: 'Digite o email',
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Enviar'),
                onPressed: () {
                  print(dialogText);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
      );
    },
  );
}
