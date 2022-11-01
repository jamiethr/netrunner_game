import 'card_model.dart';

class DrawModel {
  final int remaining;
  final List<CardModel> cards;

  DrawModel({
    required this.remaining,
    this.cards = const [],
  });
}
