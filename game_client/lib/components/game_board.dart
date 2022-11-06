// Main GUI of our game is going to live here.

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:game_client/components/deck_pile.dart';
import 'package:game_client/components/playing_card.dart';
import 'package:game_client/models/card_model.dart';
import 'package:game_client/providers/game_provider.dart';
import 'package:provider/provider.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, model, child) {
      return model.currentDeck != null
          ? Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () async {
                      await model.drawCards(model.players.first);
                    },
                    child: DeckPile(
                      remaining: model.currentDeck!.remaining,
                    ),
                  ),
                )
              ],
            )
          : Center(child: Text("New Game?"));
    });

    // final card = CardModel(
    //     image: "https://deckofcardsapi.com/static/img/KH.png",
    //     suit: Suit.hearts,
    //     value: "KING");

    // return Center(
    //   child: PlayingCard(
    //     card: card,
    //     visible: true,
    //   ),
    // );
  }
}
