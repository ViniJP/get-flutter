import 'package:flutter/material.dart';
import 'package:get_app/listaProdutos.dart';
import 'paginaProduto.dart';

class PaginaEntrega extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GET'),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    "Nossa Entrega",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  Image.asset(
                      'assets/envelope.jpg',
                      height: 300,
                      width: 200
                  ),
                  SizedBox(height: 30),
                  Text(
                    Strings.texto_nossaEntrega,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text('Inscreva-se'),
                      onPressed: () {showMyDialog(context);},
                      color: Colors.indigo,
                      textColor: Colors.white,
                      padding: const EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
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
