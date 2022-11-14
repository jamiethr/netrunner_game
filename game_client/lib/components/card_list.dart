import 'package:flutter/material.dart';
import 'package:game_client/components/playing_card.dart';
import 'package:game_client/constants.dart';
import 'package:game_client/models/card_model.dart';

import '../models/player_model.dart';

/// A horizontal list of cards (the "hand") owned by a given [player].
///
/// Returns a [PlayingCard] from the list once a card is tapped on.
class CardList extends StatelessWidget {
  /// The scale of this as a percent; 1 = 100% scale.
  final double size;

  /// The player who owns this.
  final PlayerModel player;

  /// The set of actions the performed when the card is played.
  final Function(CardModel)? onPlayCard;

  const CardList({
    Key? key,
    required this.player,
    this.size = 1,
    this.onPlayCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// uses a builder, which is super efficient and uses the least amount of
    /// memory possible to build our list.
    ///
    /// The function is called for the number of `itemCount`
    return SizedBox(
        height: CARD_HEIGHT * size,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: player.cards.length,
          itemBuilder: (context, index) {
            final card = player.cards[index];
            return PlayingCard(
              card: card,
              size: size,
              visible: true,
              onPlayCard: onPlayCard,
            );
          },
        ));
  }
}
