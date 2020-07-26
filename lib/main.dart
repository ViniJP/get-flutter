import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_app/listaProdutos.dart';
import 'package:get_app/paginaEntrega.dart';
import 'produto.dart';
import 'paginaProduto.dart';

void main() {
  runApp(MyApp());
}

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
  Widget build(BuildContext context) {

    final List<String> entries = <String>['Prudence', 'Jontex', 'Olla', 'Preserv'];

    return Scaffold(

      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListaProduto(entries)
      );
  }
}

class ListaProduto extends StatefulWidget {

  final List<String> entries;
  const ListaProduto(this.entries);

  @override
  _ListaProdutoState createState() => _ListaProdutoState(entries);
}

class _ListaProdutoState extends State<ListaProduto> {

  final List<String> entries;

  _ListaProdutoState(this.entries);

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
              Text('${entries[index]}',
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
      itemCount: entries.length,

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
    final List<Produto> produtoPrudence2 = <Produto>[
      Produto(titulo: Strings.titulo_prudence_classico, descricao: Strings.desc_prudence_classico , extra: Strings.extra_prudence_classico, localImagem: Strings.imagem_prudence_classico),
      Produto(titulo: Strings.titulo_prudence_ice, descricao: Strings.desc_prudence_ice , extra: Strings.extra_prudence_ice, localImagem: Strings.imagem_prudence_ice),
      Produto(titulo: Strings.titulo_prudence_morango, descricao: Strings.desc_prudence_morango , extra: Strings.extra_prudence_morango, localImagem: Strings.imagem_prudence_morango),
      Produto(titulo: Strings.titulo_prudence_retardante, descricao: Strings.desc_prudence_retardante , extra: Strings.extra_prudence_retardante, localImagem: Strings.imagem_prudence_retardante),
      Produto(titulo: Strings.titulo_prudence_ultraSensivel, descricao: Strings.desc_prudence_ultraSensivel , extra: Strings.extra_prudence_ultraSensivel, localImagem: Strings.imagem_prudence_ultraSensivel),
    ];

    final List<Produto> produtoJontex = <Produto>[
      Produto(titulo: Strings.titulo_Jontex_classico, descricao: Strings.desc_Jontex_classico , extra: Strings.extra_Jontex_classico, localImagem: Strings.imagem_Jontex_classico),
      Produto(titulo: Strings.titulo_Jontex_maca, descricao: Strings.desc_Jontex_maca , extra: Strings.extra_Jontex_maca, localImagem: Strings.imagem_Jontex_maca),
      Produto(titulo: Strings.titulo_Jontex_sensation, descricao: Strings.desc_Jontex_sensation , extra: Strings.extra_Jontex_sensation, localImagem: Strings.imagem_Jontex_sensation),
      Produto(titulo: Strings.titulo_Jontex_sensitive, descricao: Strings.desc_Jontex_sensitive , extra: Strings.extra_Jontex_sensitive, localImagem: Strings.imagem_Jontex_sensitive),
      Produto(titulo: Strings.titulo_Jontex_xl, descricao: Strings.desc_Jontex_xl , extra: Strings.extra_Jontex_xl, localImagem: Strings.imagem_Jontex_xl),
    ];

    final List<Produto> produtoOlla = <Produto>[
      Produto(titulo: Strings.titulo_Olla_classico, descricao: Strings.desc_Olla_classico , extra: Strings.extra_Olla_classico, localImagem: Strings.imagem_Olla_classico),
      Produto(titulo: Strings.titulo_Olla_menta, descricao: Strings.desc_Olla_menta , extra: Strings.extra_Olla_menta, localImagem: Strings.imagem_Olla_menta),
      Produto(titulo: Strings.titulo_Olla_morango, descricao: Strings.desc_Olla_morango , extra: Strings.extra_Olla_morango, localImagem: Strings.imagem_Olla_morango),
      Produto(titulo: Strings.titulo_Olla_sensitive, descricao: Strings.desc_Olla_sensitive , extra: Strings.extra_Olla_sensitive, localImagem: Strings.imagem_Olla_sensitive),
      Produto(titulo: Strings.titulo_Olla_stimulus, descricao: Strings.desc_Olla_stimulus , extra: Strings.extra_Olla_stimulus, localImagem: Strings.imagem_Olla_stimulus),
    ];

    final List<Produto> produtoPreserv = <Produto>[
      Produto(titulo: Strings.titulo_Preserve_altaProt, descricao: Strings.desc_Preserve_altaProt , extra: Strings.extra_Preserve_altaProt, localImagem: Strings.imagem_Preserve_altaProt),
      Produto(titulo: Strings.titulo_Preserve_Extra_sensivel, descricao: Strings.desc_Preserve_Extra_sensivel , extra: Strings.extra_Preserve_Extra_sensivel, localImagem: Strings.imagem_Preserve_Extra_sensivel),
      Produto(titulo: Strings.titulo_Preserve_Lite, descricao: Strings.desc_Preserve_Lite , extra: Strings.extra_Preserve_Lite, localImagem: Strings.imagem_Preserve_Lite),
      Produto(titulo: Strings.titulo_Preserve_Prolong, descricao: Strings.desc_Preserve_Prolong , extra: Strings.extra_Preserve_Prolong, localImagem: Strings.imagem_Preserve_Prolong),
      Produto(titulo: Strings.titulo_Preserve_Teen, descricao: Strings.desc_Preserve_Teen , extra: Strings.extra_Preserve_Teen, localImagem: Strings.imagem_Preserve_Teen),
    ];

    switch(index){
      case 0:
        return produtoPrudence2.map((e) => CardTemplate(e)).toList();
        break;
      case 1:
        return produtoJontex.map((e) => CardTemplate(e)).toList();
        break;
      case 2:
        return produtoOlla.map((e) => CardTemplate(e)).toList();
        break;
      case 3:
        return produtoPreserv.map((e) => CardTemplate(e)).toList();
        break;
      default:
        return produtoPrudence2.map((e) => CardTemplate(e)).toList();
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
                    Expanded(child: Text("RS 9,99", textAlign: TextAlign.center,)),
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




