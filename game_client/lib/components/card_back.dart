import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_client/constants.dart';

class CardBack extends StatelessWidget {
  final double size;
  final Widget? child;

  const CardBack({
    Key? key,
    this.size = 1,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CARD_WIDTH,
      height: CARD_HEIGHT,
      decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(BORDER_RAD)),
      child: child ?? Container(), // if child != null use child else container
    );
  }
}
