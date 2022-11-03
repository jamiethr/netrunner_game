import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_client/constants.dart';

import '../models/card_model.dart';
import 'card_back.dart';

class PlayingCard extends StatelessWidget {
  final CardModel card;
  final double size; // A percent. 1 --> 100% scale. 0.5 --> 50% scale.
  final bool visible;

  const PlayingCard({
    Key? key,
    required this.card,
    this.size = 1,
    this.visible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = CARD_WIDTH * size;
    final height = CARD_HEIGHT * size;

    return Container(
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
    );
  }
}
