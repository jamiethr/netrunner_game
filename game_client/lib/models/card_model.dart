import 'package:flutter/material.dart';

enum Suit {
  hearts,
  clubs,
  diamonds,
  spades,
  other,
}

class CardModel {
  final String image; // image URL
  final Suit suit;
  final String value;

  CardModel({
    required this.image,
    required this.suit,
    required this.value,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
        image: json["image"],
        suit: stringToSuit(json['suit']),
        value: json["value"]);
  }

  static Suit stringToSuit(String suit) {
    switch (suit.toUpperCase().trim()) {
      case "HEARTS":
        return Suit.hearts;
      case "CLUBS":
        return Suit.clubs;
      case "DIAMONDS":
        return Suit.diamonds;
      case "SPADES":
        return Suit.spades;
      default:
        return Suit.other;
    }
  }

  static String suitToString(Suit suit) {
    switch (suit) {
      case Suit.hearts:
        return "HEARTS";
      case Suit.clubs:
        return "CLUBS";
      case Suit.diamonds:
        return "DIAMONDS";
      case Suit.spades:
        return "SPADES";
      default:
        return "OTHER";
    }
  }

  /// Returns the emoji version of the suit.
  static String suitToUnicode(Suit suit) {
    switch (suit) {
      case Suit.hearts:
        return "\u2665";
      case Suit.clubs:
        return "\u2663";
      case Suit.diamonds:
        return "\u2666";
      case Suit.spades:
        return "\u2660";
      default:
        return "\u2754";
    }
  }

  static Color suitToColor(Suit suit) {
    switch (suit) {
      case Suit.hearts: // Fallthrough intentionally
      case Suit.clubs:
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
