import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List imagesOptions = [
    {"image": "assets/images/pedra.png", "option": "pedra"},
    {"image": "assets/images/papel.png", "option": "papel"},
    {"image": "assets/images/tesoura.png", "option": "tesoura"}
  ];

  var _defaultAppChoice = "assets/images/padrao.png";
  String challengeResult = "Escolha uma opção abaixo:";

  void userChosenOption(String userChoice) {
    var indexChoice = Random().nextInt(3);
    var valueAppChoice = imagesOptions[indexChoice]['option'];

    setState(() {
      _defaultAppChoice = imagesOptions[indexChoice]['image'];
      if (valueAppChoice == userChoice) {
        challengeResult = "O resultado foi empate :\ !!!";
      } else if ((valueAppChoice == "pedra" && userChoice == "papel") ||
          (valueAppChoice == "tesoura" && userChoice == "pedra") ||
          (valueAppChoice == "papel" && userChoice == "tesoura")) {
        challengeResult = "Você VENCEU *_* !!!";
      } else {
        challengeResult = "O você Pedreu :c !!!";
      }
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(challengeResult)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [
            const Text(
              "Escolha do Noobot:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Image.asset(_defaultAppChoice),
            const SizedBox(height: 30),
            Text(
              challengeResult,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                imagesOptions.length,
                (index) => GestureDetector(
                  onTap: () => userChosenOption(imagesOptions[index]['option']),
                  child: Image.asset(
                    imagesOptions[index]['image'],
                    width: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
