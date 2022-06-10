import 'package:flutter/material.dart';
import 'package:jokenpo/pages/home_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo"),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Bem Vindo ao JokenPo')));
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
              size: 25.0,
            ),
          ),
          IconButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Informações'),
                content: const Text(
                    'Esse app é um simples app para jogar pedra, papel e tesoura!'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
            icon: const Icon(
              Icons.announcement,
              color: Colors.white,
              size: 25.0,
            ),
          )
        ],
      ),
      body: const HomePage(),
    );
  }
}
