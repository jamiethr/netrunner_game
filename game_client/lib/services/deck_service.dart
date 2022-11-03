import 'package:game_client/services/api_service.dart';

import '../models/deck_model.dart';
import '../models/draw_model.dart';

/// A API service for the server-side deck API

class DeckService extends ApiService {
  /// note to self: Tyler said "Every time I make an API call, it's going to be a Future." Why?
  ///               "It's going to be a Future because it's async."

  /// Builds a new deck.
  ///
  /// Use this when starting a new game. Builds a GET request and sends it to the game server's deck API
  /// Code from Tyler Codes on YouTube:
  /// https://www.youtube.com/c/TylerCodes
  Future<DeckModel> newDeck([int deckCount = 1]) async {
    final data = await httpGet(
      '/deck/new/shuffle',
      params: {'deck_count': deckCount},
    );
    return DeckModel.fromJson(data);
  }

  /// Draws a card from the deck.
  ///
  /// Code from Tyler Codes on YouTube:
  /// https://www.youtube.com/c/TylerCodes
  Future<DrawModel> drawCards(DeckModel deck, {int count = 1}) async {
    final data = await httpGet(
      '/deck/${deck.deck_id}/draw',
      params: {'count': count},
    );

    return DrawModel.fromJson(data);
  }
}
