enum Suit {
  hearts,
  clubs,
  diamonds,
  spades,
  other,
}


class CardModel {
  final String image; // image URL
  final String suit;
  final String value;

  CardModel({
    required this.image,
    required this.suit,
    required this.value,
  });
}
