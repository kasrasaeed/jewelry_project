import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './app.dart';

void main() {
  runApp(MainClass());
}

class MainClass extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}
