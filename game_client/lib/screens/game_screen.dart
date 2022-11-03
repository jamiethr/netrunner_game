import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/game_board.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
