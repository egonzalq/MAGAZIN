import 'dart:html';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_uno/UI/validar.dart';

import 'ListAlbum.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //diseño
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Magazine Tv '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //wigwt con estado
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      //-----------------------------------------------
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                color: Colors.blueAccent, //color
                margin: const EdgeInsets.all(10.0),
                // ignore: prefer_const_constructors
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Usuario'),
                )),
            Container(
                color: Colors.blueAccent, //color
                margin: const EdgeInsets.all(10.0),
                // ignore: prefer_const_constructors
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Contraseña'),
                  onChanged: (text) {
                    // ignore: unnecessary_string_interpolations
                    print('$text');
                  },
                )),
            // ignore: deprecated_member_use
            SizedBox(height: 40),
            // ignore: deprecated_member_use
            RaisedButton(
              color: Colors.blueAccent, //color
              child: Text('INICIAR SESION'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Editar(),
                ));
              },
            ),
            //------------------------registrarse

            SizedBox(height: 40),
            // ignore: deprecated_member_use

            RaisedButton(
              color: Colors.red, //color
              child: Text('Registarme'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Registar(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

// segunda pantalla App------------

class Editar extends StatefulWidget {
  @override
  _EditarState createState() => _EditarState();
}

class _EditarState extends State<Editar> {
  String _texto = ' B I E N V E N I D O ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magazine Tv '),
      ),
      // ignore: deprecated_member_use
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _texto,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                fontSize: 45,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 40),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text('Iniciar'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Llamar(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

//cuarta pantalla----------------------------
class Registar extends StatefulWidget {
  @override
  // ignore: no_logic_in_create_state
  _RegistrarState createState() => _RegistrarState();
}

class _RegistrarState extends State<Registar> {
  String _texto = ' REGISTRO';
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magazine Tv '),
      ),
      // ignore: deprecated_member_use
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_texto),
            SizedBox(height: 40),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text('Registar'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyApp(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

//---------------Quinta pantalla------------
class Salir extends StatefulWidget {
  @override
  // ignore: no_logic_in_create_state
  _SalirState createState() => _SalirState();
}

class _SalirState extends State<Salir> {
  String _texto = ' H A S T A  P R O N T O';
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magazine Tv '),
      ),
      // ignore: deprecated_member_use
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _texto,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                fontSize: 45,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 40),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text('S a l i r'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyApp(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ************** pagina 6************
class Llamar extends StatefulWidget {
  @override
  // ignore: no_logic_in_create_state
  _LlamarState createState() => _LlamarState();
}

class _LlamarState extends State<Llamar> {
  String _texto = ' H A S T A  P R O N T O';
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListAlbum(),
    );
  }
}
