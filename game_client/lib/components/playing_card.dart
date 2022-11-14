import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_client/constants.dart';

import '../models/card_model.dart';
import 'card_back.dart';

/// A widget representing a card that the user can interact with.
class PlayingCard extends StatelessWidget {
  /// The card this represents.
  final CardModel card;

  /// The scale of this as a percent; 1 = 100% scale.
  final double size;

  /// Whether this should be "face up".
  final bool visible;

  /// Performs a set of actions once this has been played.
  final Function(CardModel)? onPlayCard;

  const PlayingCard({
    Key? key,
    required this.card,
    this.size = 1,
    this.visible = false,
    this.onPlayCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = CARD_WIDTH * size;
    final height = CARD_HEIGHT * size;

    return GestureDetector(
      onTap: () {
        if (onPlayCard != null) onPlayCard!(card);
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BORDER_RAD),
        ),
        clipBehavior: Clip.antiAlias,
        child: visible
            ? CachedNetworkImage(
                imageUrl: card.image,
                width: width,
                height: height,
              )
            : CardBack(size: size),
      ),
    );
  }
}
