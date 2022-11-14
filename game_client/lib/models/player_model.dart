import 'card_model.dart';

class PlayerModel {
  final String name;
  final bool isHuman;
  List<CardModel> cards;

  PlayerModel({
    required this.name,
    this.isHuman = false,
    this.cards = const [],
  });

  /// Adds [newCards] to the player's hand.
  addCards(List<CardModel> newCards) {
    cards = [...cards, ...newCards];
  }

  /// Removes a specfied [card] from the player's hand.
  ///
  /// Removes all cards of that type from the player's hand.
  removeCard(CardModel card) {
    cards.removeWhere((c) => c.value == card.value && c.suit == card.suit);
  }

  /// Returns true if the player is a bot; false otherwise.
  bool get isBot {
    return !isHuman;
  }
}
