import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/game_board.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Netrunner Main Menu"), actions: [
        TextButton(
          onPressed: () {},
          child: const Text(
            "New Game",
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ]),

      body: const GameBoard(),
    );
  }
}
