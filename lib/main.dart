import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_app/listaProdutos.dart';
import 'package:get_app/paginaEntrega.dart';
import 'produto.dart';
import 'paginaProduto.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

void main() {
  runApp(MyApp());
}

/*
class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GET',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Algo deu errado'),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GET',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Carregando'),
    );
  }

}

 */

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GET',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'GET'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {

    final List<String> entries = <String>['Xbox One', 'Xbox X', 'PS4', 'PS5'];

    return Scaffold(

      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListaProduto(entries)
      );
  }
}

class ListaProduto extends StatefulWidget {

  final List<String> entries;
  const ListaProduto(this.entries);

  @override
  _ListaProdutoState createState() => _ListaProdutoState();
}

class _ListaProdutoState extends State<ListaProduto> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: buscarHeight(index),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(0),
                    child: Card(
                      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              buscarTexto(index),
                              style: TextStyle(color: Colors.white, fontSize: 16.0),),
                          ),
                          Icon(buscarIcone(index), color: Colors.white, size: 24),
                        ],
                      ),
                      color: buscarCor(index),
                      elevation: 5.0,
                    ),
                  ),
                  new Positioned.fill(
                      child: new Material(
                          color: Colors.transparent,
                          child: new InkWell(
                            onTap: () {
                              abrirAcao(index);
                            },
                          )))
                ],
              ),
              Text('${widget.entries[index]}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
              Container(
                height: 300,
                child: ListView.builder(
                    itemBuilder: (BuildContext context, int index2){
                      return Row(
                        children: burscarCards(index),
                      );
                    },
                  itemCount: 1,
                  scrollDirection: Axis.horizontal,
                ),
              )
            ],
          ),
        );
      },
      itemCount: widget.entries.length,

    );
  }

  double buscarHeight(int index) {
    if(index <= 2){
      return 65.0;
    } else{
      return 0.0;
    }
  }

  String buscarTexto(int index) {
    switch (index) {
      case 0:
        return "Nossa Entrega";
        break;
      case 1:
        return 'Compre com um clique';
        break;
      case 2:
        return 'Inscreva-se';
        break;
      default:
        return '';
        break;
    }
  }

  void abrirAcao(int index) {
    switch(index){
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaginaEntrega()),
        );
        break;
      case 1:
        dialogUmClique(context);
        break;
      case 2:
        showMyDialog(context);
        break;
      default:
        break;
    }
  }

  List burscarCards(int index) {
    final List<Produto> produto1 = <Produto>[ // xbox one
      Produto(titulo: Strings.titulo_xboxOne_cyberpunk, descricao: Strings.desc_xboxOne_cyberpunk , extra: Strings.extra_xboxOne_cyberpunk, localImagem: Strings.imagem_xboxOne_cyberpunk),
      Produto(titulo: Strings.titulo_xboxOne_pes21, descricao: Strings.desc_xboxOne_pes21 , extra: Strings.extra_xboxOne_pes21, localImagem: Strings.imagem_xboxOne_pes21),
      Produto(titulo: Strings.titulo_xboxOne_avengers, descricao: Strings.desc_xboxOne_avengers , extra: Strings.extra_xboxOne_avengers, localImagem: Strings.imagem_xboxOne_avengers),
      Produto(titulo: Strings.titulo_xboxOne_gta5, descricao: Strings.desc_xboxOne_gta5 , extra: Strings.extra_xboxOne_gta5, localImagem: Strings.imagem_xboxOne_gta5),
      Produto(titulo: Strings.titulo_xboxOne_witcher3, descricao: Strings.desc_xboxOne_witcher3 , extra: Strings.extra_xboxOne_witcher3, localImagem: Strings.imagem_xboxOne_witcher3),
    ];

    final List<Produto> produto2 = <Produto>[ // xbox x
      Produto(titulo: Strings.titulo_xboxX_mk, descricao: Strings.desc_xboxX_mk , extra: Strings.extra_xboxX_mk, localImagem: Strings.imagem_xboxX_mk),
      Produto(titulo: Strings.titulo_xboxX_cod, descricao: Strings.desc_xboxX_cod , extra: Strings.extra_xboxX_cod, localImagem: Strings.imagem_xboxX_cod),
      Produto(titulo: Strings.titulo_xboxX_trainS, descricao: Strings.desc_xboxX_trainS , extra: Strings.extra_xboxX_trainS, localImagem: Strings.imagem_xboxX_trainS),
      Produto(titulo: Strings.titulo_xboxX_farCry, descricao: Strings.desc_xboxX_farCry , extra: Strings.extra_xboxX_farCry, localImagem: Strings.imagem_xboxX_farCry),
      Produto(titulo: Strings.titulo_xboxX_halo, descricao: Strings.desc_xboxX_halo , extra: Strings.extra_xboxX_halo, localImagem: Strings.imagem_xboxX_halo),
    ];

    final List<Produto> produto3 = <Produto>[ // ps4
      Produto(titulo: Strings.titulo_ps4_lastUs, descricao: Strings.desc_ps4_lastUs , extra: Strings.extra_ps4_lastUs, localImagem: Strings.imagem_ps4_lastUs),
      Produto(titulo: Strings.titulo_ps4_daysGone, descricao: Strings.desc_ps4_daysGone , extra: Strings.extra_ps4_daysGone, localImagem: Strings.imagem_ps4_daysGone),
      Produto(titulo: Strings.titulo_ps4_redDead, descricao: Strings.desc_ps4_redDead , extra: Strings.extra_ps4_redDead, localImagem: Strings.imagem_ps4_redDead),
      Produto(titulo: Strings.titulo_ps4_fifa21, descricao: Strings.desc_ps4_fifa21 , extra: Strings.extra_ps4_fifa21, localImagem: Strings.imagem_ps4_fifa21),
      Produto(titulo: Strings.titulo_ps4_watchDogs, descricao: Strings.desc_ps4_watchDogs , extra: Strings.extra_ps4_watchDogs, localImagem: Strings.imagem_ps4_watchDogs),
    ];

    final List<Produto> produto4 = <Produto>[ // ps5 / ps5_destruction
      Produto(titulo: Strings.titulo_ps5_demonSouls, descricao: Strings.desc_ps5_demonSouls , extra: Strings.extra_ps5_demonSouls, localImagem: Strings.imagem_ps5_demonSouls),
      Produto(titulo: Strings.titulo_ps5_spiderMan, descricao: Strings.desc_ps5_spiderMan , extra: Strings.extra_ps5_spiderMan, localImagem: Strings.imagem_ps5_spiderMan),
      Produto(titulo: Strings.titulo_ps5_valhalla, descricao: Strings.desc_ps5_valhalla , extra: Strings.extra_ps5_valhalla, localImagem: Strings.imagem_ps5_valhalla),
      Produto(titulo: Strings.titulo_ps5_sackboy, descricao: Strings.desc_ps5_sackboy , extra: Strings.extra_ps5_sackboy, localImagem: Strings.imagem_ps5_sackboy),
      Produto(titulo: Strings.titulo_ps5_destruction, descricao: Strings.desc_ps5_destruction , extra: Strings.extra_ps5_destruction, localImagem: Strings.imagem_ps5_destruction),
    ];

    switch(index){
      case 0:
        return produto1.map((e) => CardTemplate(e)).toList();
        break;
      case 1:
        return produto2.map((e) => CardTemplate(e)).toList();
        break;
      case 2:
        return produto3.map((e) => CardTemplate(e)).toList();
        break;
      case 3:
        return produto4.map((e) => CardTemplate(e)).toList();
        break;
      default:
        return produto1.map((e) => CardTemplate(e)).toList();
        break;
    }
  }

  Color buscarCor(int index) {
    switch(index){
      case 0:
        return Colors.deepPurple;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.green;
      default:
        return Colors.indigo[400];
    }
  }

  IconData buscarIcone(index) {
    switch(index){
      case 0:
        return Icons.local_shipping;
      case 1:
        return Icons.mouse;
      case 2:
        return Icons.markunread;
      default:
        return Icons.mouse;
    }
  }
}


class CardTemplate extends StatefulWidget {

  final Produto produto;
  CardTemplate(this.produto);

  @override
  _CardTemplateState createState() => _CardTemplateState(produto);
}

class _CardTemplateState extends State<CardTemplate> {

  final Produto produto;
  _CardTemplateState(this.produto);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: <Widget>[
        Container(
          width: 250,
          child: Card(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    produto.titulo,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                Image.asset(
                    produto.localImagem,
                    height: 180,
                    width: 100
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      produto.extra,
                      overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: Text("RS 159,99", textAlign: TextAlign.center,)),
                    Expanded(child: Image.asset('assets/star_icon.png', height: 25, width: 50,))
                  ],
                ),
              ],
            ),

          ),
        ),
        new Positioned.fill(
            child: new Material(
                color: Colors.transparent,
                child: new InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaginaProduto(produto)),
                    );
                  },
                )))
      ],
    );


  }
}

Future<void> initData() async{
  var response = await Parse().initialize(
      Strings.keyApplicationId,
      Strings.keyParseServerUrl,
  masterKey: Strings.keyParseMasterKey,
  clientKey: Strings.keyParseClientKey,
  debug: true,
  );

  print(response.hasParseBeenInitialized().toString());
  final ParseResponse resposta = await Parse().healthCheck();
  print(resposta.success);
}


Future<void> dialogUmClique(context) async {

  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(Strings.titulo_dialog_umClique),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(Strings.texto_dialog_umClique),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    showMyDialog(context);
                  },
                ),
              ],
            );
          }
      );
    },
  );
}




