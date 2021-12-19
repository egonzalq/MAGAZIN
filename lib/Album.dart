// ignore: file_names
import 'dart:ui';
import 'package:flutter/material.dart';

class Album {
  String title;
  String name;
  Color color;
  String image;
  Album(
    this.title,
    this.name,
    this.image,
    this.color,
  );
  static List<Album> albums() {
    return [
      Album("foto", "uno", "assets/50.png", Colors.green),
      Album("que bueno", "dos", "assets/50.1.png", Colors.grey),
      Album("Edgar", "tres", "assets/foto.png", Colors.blue),
    ];
  }
}
