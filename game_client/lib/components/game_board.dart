// Main GUI of our game is going to live here.

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:game_client/components/card_list.dart';
import 'package:game_client/components/deck_pile.dart';
import 'package:game_client/components/discard_pile.dart';
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await model.drawCards(model.turn.currentPlayer);
                        },
                        child: DeckPile(
                          remaining: model.currentDeck!.remaining,
                        ),
                      ),
                      const SizedBox(width: 8),
                      DiscardPile(cards: model.discards),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: CardList(player: model.players[1]),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (model.turn.currentPlayer == model.players[0])
                              ElevatedButton(
                                  onPressed: model.canEndTurn
                                      ? () {
                                          model.endTurn();
                                        }
                                      : null,
                                  child: const Text("End Turn"))
                          ],
                        ),
                      ),
                      CardList(
                        player: model.players[0],
                        onPlayCard: (CardModel card) {
                          model.playCard(player: model.players[0], card: card);
                        },
                      ),
                    ],
                  ),
                ),
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
