import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:game_client/models/player_model.dart';
import 'package:game_client/providers/game_provider.dart';
import 'package:provider/provider.dart';

import '../components/game_board.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final GameProvider _gameProvider;

  @override
  void initState() {
    // TODO: implement initState
    _gameProvider = Provider.of<GameProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Netrunner Main Menu"), actions: [
        TextButton(
          onPressed: () async {
            // TODO: provide some function to create new players?
            final players = [
              PlayerModel(name: "Jamie", isHuman: true),
              PlayerModel(name: "Bot", isHuman: false),
            ];
            await _gameProvider.newGame(players);
          },
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
