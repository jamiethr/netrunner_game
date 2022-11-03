class DeckModel {
  final String deck_id;
  bool shuffled;
  int remaining;

  DeckModel({
    required this.deck_id,
    required this.shuffled,
    required this.remaining,
  });

  // note to self: 'dynamic' in this map means that could be passing in a map
  //                of strings to ints, strings to strings, or whatever! This
  //                makes sense, because this is the nature of JSON.
  factory DeckModel.fromJson(Map<String, dynamic> json) {
    return DeckModel(
      deck_id: json["deck_id"],
      shuffled: json["shuffled"],
      remaining: json["remaining"],
    );
  }
}
