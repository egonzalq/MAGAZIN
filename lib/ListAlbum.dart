import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_uno/Album.dart';
import 'package:flutter_application_uno/CardAlbum.dart';
import 'package:flutter_application_uno/main.dart';

class ListAlbum extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListAlbumState();
}

class ListAlbumState extends State<ListAlbum> {
  List<Album> albums = Album.albums();
  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      
        shrinkWrap: true,
        itemCount: albums.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ObjectKey(albums[index]),
            child: CarAlbum(albums[index]),
            onDismissed: (direction) {
              setState(() {
                albums.removeAt(index);
              });
              
            },
            
          );
          
        });
    
  }
  
}
