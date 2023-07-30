import 'dart:convert';
import './utils/gamecarditem_switch.dart';

List<GameCardModel> gameCardModelFromJson(String str) =>
    List<GameCardModel>.from(json.decode(str).map((x) => GameCardModel.fromJson(x)));

String gameCardModelToJson(List<GameCardModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

enum Outcome {
  victoire, defaite, egalite, annule
}

enum GameType {
  nonClasse, competition, velocite, spikeRush, combatAMort,
  intensification, combatAMortParEquipe, partiePersonnalisee
}

enum Character {
  astra, breach, brimstone, chamber, cypher, deadlock, fade,
  gekko, harbor, jett, kayo, killjoy, neon, omen,
  pheonix, raze, reyna, sage, syke, sova, viper, yoru
}

enum Role {
  controleur, duelliste, sentinelle, initiateur
}

String enumToString(dynamic enumValue) {
  return enumValue.toString().split('.').last;
}

class GameCardModel {
  int id;
  Outcome outcome;
  String date; // Devrait être au format Date
  GameType gameType;
  Character character;
  List<int> kda;
  Role role;
  String comment;

  GameCardModel({
    required this.id,
    required this.outcome,
    required this.date,
    required this.gameType,
    required this.character,
    required this.kda,
    required this.role,
    required this.comment,
  });

  static Outcome parseOutcome(String value) {
    return Outcome.values.firstWhere((e) => e.toString().split('.').last == value);
  }

  static GameType parseGameType(String value) {
    return GameType.values.firstWhere((e) => e.toString().split('.').last == value);
  }

  static Character parseCharacter(String value) {
    return Character.values.firstWhere((e) => e.toString().split('.').last == value);
  }
  static Role parseRole(String value) {
    return Role.values.firstWhere((e) => e.toString().split('.').last == value);
  }

  factory GameCardModel.fromJson(Map<String, dynamic> json) => GameCardModel(
    id: json["id"],
    outcome: parseOutcome(json["outcome"]),
    date: json["date"],
    gameType: parseGameType(json["game_type"]),
    character: parseCharacter(json["character"]),
    kda: List<int>.from(json["kda"].map((x) => x)), // Convert JSON array to List<int>
    role: parseRole(json["role"]),
    comment: json["comment"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "outcome": enumToString(outcome),
    "date": date,
    "game_type": enumToString(gameType),
    "character": enumToString(character),
    "kda": kda,
    "role": enumToString(role),
    "comment": comment,
  };
}