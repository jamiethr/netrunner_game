import 'package:flutter/cupertino.dart';
import 'package:game_client/models/card_model.dart';
import 'package:game_client/models/deck_model.dart';
import 'package:game_client/models/player_model.dart';
import 'package:game_client/models/turn_model.dart';
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

  late Turn _turn;
  Turn get turn => _turn;

  // '?' means it's "nullable"
  DeckModel? _currentDeck;

  /// Returns the current deck.
  DeckModel? get currentDeck => _currentDeck;

  List<PlayerModel> _players = [];
  List<PlayerModel> get players => _players;

  List<CardModel> _discards = [];
  List<CardModel> get discards => _discards;
  CardModel? get discardTop => _discards.isEmpty ? null : _discards.last;

  /// Used to store random values that may be relevant to games that extend this
  /// class.
  Map<String, dynamic> gameState = {};

  Future<void> newGame(List<PlayerModel> players) async {
    final deck = await _service.newDeck();
    _currentDeck = deck;
    _players = players;
    _discards = [];
    _turn = Turn(players: players, currentPlayer: players.first);
    setupBoard();

    notifyListeners(); // updated the UI to reflect the new changes.
  }

  /// Sets up the gameboard.
  ///
  /// Can be used to create mutliple draw piles, discards, etc.
  Future<void> setupBoard() async {}

  Future<void> drawCards(PlayerModel player, {int count = 1}) async {
    if (currentDeck == null) return;

    final draw = await _service.drawCards(_currentDeck!, count: count);

    _turn.drawCount += count;
    _currentDeck!.remaining = draw.remaining;
    notifyListeners();
  }
}

// mixin DeckModel {}
