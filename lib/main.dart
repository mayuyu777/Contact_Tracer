import 'package:contact_tracer/main/landing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(brightness: Brightness.dark,accentColor: Colors.yellow[700].withOpacity(0.9)), 
    home: Landing(),
  ));
}
