import 'package:flutter/material.dart';
import 'package:jokenpo/pages/root_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'JokenPO',
    theme: ThemeData(
      primaryColor: Colors.blueAccent,
      brightness: Brightness.light,
    ),
    debugShowCheckedModeBanner: false,
    home: const RootPage(),
  ));
}
