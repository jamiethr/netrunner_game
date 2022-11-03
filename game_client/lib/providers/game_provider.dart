import 'package:flutter/cupertino.dart';
import 'package:game_client/services/deck_service.dart';

/// The meat and potatoes of our game.
/// Controls the state of our game, where bot logic happens.
/// Base card game class where you can draw a card and discard a card.

// uses a package called Provider to manage state; when the state changes, the
// UI will update for us. River bot (?) could be nice to try.

// TODO: make into abstract class
class GameProvider with ChangeNotifier {
  // note to self: uses a mixin called ChangeNotifier; gets its functionality
  // without directly relying on it.

  GameProvider() {
    _service = DeckService();
  }

  // Late is like making a final variable, but it doesn't happen until after
  // your constructor happens?
  // The underscore makes it kind of private.
  late DeckService _service;

  // '?' means it's "nullable"
  DeckModel? _currentDeck;

  /// Returns the current deck.
  DeckModel? get currentDeck => currentDeck;
}
