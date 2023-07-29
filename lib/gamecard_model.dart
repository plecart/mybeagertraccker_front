import 'dart:convert';

List<GameCardModel> gameCardModelFromJson(String str) =>
    List<GameCardModel>.from(json.decode(str).map((x) => GameCardModel.fromJson(x)));

String gameCardModelToJson(List<GameCardModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

enum Outcome {
  victoire, defaite, egalite, annule
}

enum GameType {
  nonClasse, competition, velocite, spikeRush, combatAMort,
  intensification, combatAMortPartEquipe, partiePersonnalisee
}

enum Character {
  astra, breach, brimstone, chamber, cypher, deadlock, fade,
  gekko, harbor, jett, kayo, killjoy, neon, omen,
  pheonix, raze, reyna, sage, syke, sova, viper, yoru
}

enum Role {
  controleur, duelliste, sentinelle, initiateur
}

class GameCardModel {
  int id;
  Outcome outcome;
  GameType gameType;
  Character character;
  List<int> kda;
  Role role;
  String comment;

  GameCardModel({
    required this.id,
    required this.outcome,
    required this.gameType,
    required this.character,
    required this.kda,
    required this.role,
    required this.comment,
  });

  //Toutes les fonctions qui me permettent de passer de Enum a String
  String _enumToString(dynamic enumValue) {
    return enumValue.toString().split('.').last;
  }
  static Outcome _parseOutcome(String value) {
    return Outcome.values.firstWhere((e) => e.toString().split('.').last == value);
  }
  static GameType _parseGameType(String value) {
    return GameType.values.firstWhere((e) => e.toString().split('.').last == value);
  }
  static Character _parseCharacter(String value) {
    return Character.values.firstWhere((e) => e.toString().split('.').last == value);
  }
  static Role _parseRole(String value) {
    return Role.values.firstWhere((e) => e.toString().split('.').last == value);
  }

  factory GameCardModel.fromJson(Map<String, dynamic> json) => GameCardModel(
    id: json["id"],
    outcome: _parseOutcome(json["outcome"]),
    gameType: _parseGameType(json["game_type"]),
    character: _parseCharacter(json["character"]),
    kda: List<int>.from(json["kda"].map((x) => x)), // Convert JSON array to List<int>
    role: _parseRole(json["role"]),
    comment: json["comment"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "outcome": _enumToString(outcome),
    "game_type": _enumToString(gameType),
    "character": _enumToString(character),
    "kda": kda,
    "role": _enumToString(role),
    "comment": comment,
  };
}