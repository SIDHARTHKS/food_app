import 'package:flutter/material.dart';

class FontStyles {
  static TextStyle chip = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black);
  static TextStyle tile = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black);
  static TextStyle title = const TextStyle(
      fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black);
  static TextStyle subtitle = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
  static TextStyle price = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 45, 45, 45));
  static TextStyle price2 = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 45, 45, 45));    
  static TextStyle light =
      const TextStyle(fontSize: 12, color: Color.fromARGB(255, 18, 18, 18));
  static TextStyle italics = const TextStyle(
      fontSize: 12,
      fontStyle: FontStyle.italic,
      color: Color.fromARGB(255, 102, 101, 101));
}
