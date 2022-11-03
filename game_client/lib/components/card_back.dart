import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_client/constants.dart';

class CardBack extends StatelessWidget {
  final double size;

  const CardBack({
    Key? key,
    this.size = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CARD_WIDTH,
      height: CARD_HEIGHT,
      color: Colors.blueGrey,
    );
  }
}
