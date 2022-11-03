// Main GUI of our game is going to live here.

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:game_client/components/playing_card.dart';
import 'package:game_client/models/card_model.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final card = CardModel(
        image: "https://deckofcardsapi.com/static/img/KH.png",
        suit: Suit.hearts,
        value: "KING");

    return Center(
      child: PlayingCard(
        card: card,
        visible: true,
      ),
    );
  }
}
