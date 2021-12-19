import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_uno/Album.dart';
import 'package:flutter_application_uno/Album.dart';

import 'main.dart';

class CarAlbum extends StatelessWidget {
  Album album;
  CarAlbum(this.album);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // ignore: deprecated_member_use
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("Titulo" + album.title)));
        },
        child: Card(
            child: Column(children: <Widget>[
          Container(
            height: 144.0,
            width: 500.0,
            color: album.color,
            child: Image.asset(
              album.image,
              height: 144.0,
              width: 160.0,
            ),
          ),
          SizedBox(height: 40),
          RaisedButton(
            child: Text('Salir'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Salir(),
              ));
            },
          ),
          padding(Text(album.title, style: TextStyle(fontSize: 10))),
          Row(
            children: <Widget>[
              padding(Icon(Icons.mic)),
              padding(Text(
                album.name,
                style: TextStyle(fontSize: 18.0),
              ))
            ],
          )
        ])));
    
  }

  Widget padding(Widget widget) {
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: widget,
    );
  }
}
