import 'package:flutter/material.dart';
import '../gamecard_model.dart';

class GameCardSwicth {

  static Color getOutcomeColor(Outcome outcome) {
    switch (outcome) {
      case Outcome.victoire: return Colors.green.shade800;
      case Outcome.defaite: return Colors.red.shade700;
      case Outcome.annule: return Colors.grey.shade800;
      default: return Colors.grey.shade800;
    }
  }

  static String getCharacterUrl(Character character) {

    String wikiUrl = 'https://static.wikia.nocookie.net/valorant/images';
    String suffix = '_icon.png/';

    switch (character) {
      case Character.astra: return '$wikiUrl/0/08/Astra$suffix';
      case Character.breach: return '$wikiUrl/5/53/Breach$suffix';
      case Character.brimstone: return '$wikiUrl/4/4d/Brimstone$suffix';
      case Character.chamber: return '$wikiUrl/0/09/Chamber$suffix';
      case Character.cypher: return '$wikiUrl/8/88/Cypher$suffix';
      case Character.deadlock: return '$wikiUrl/e/eb/Deadlock$suffix';
      case Character.fade: return '$wikiUrl/a/a6/Fade$suffix';
      case Character.gekko: return '$wikiUrl/6/66/Gekko$suffix';
      case Character.harbor: return '$wikiUrl/f/f3/Harbor$suffix';
      case Character.jett: return '$wikiUrl/3/35/Jett$suffix';
      case Character.kayo: return '$wikiUrl/f/f0/KAYO$suffix';
      case Character.killjoy: return '$wikiUrl/1/15/Killjoy$suffix';
      case Character.neon: return '$wikiUrl/d/d0/Neon$suffix';
      case Character.omen: return '$wikiUrl/b/b0/Omen$suffix';
      case Character.pheonix: return '$wikiUrl/1/14/Phoenix$suffix';
      case Character.raze: return '$wikiUrl/9/9c/Raze$suffix';
      case Character.reyna: return '$wikiUrl/b/b0/Reyna$suffix';
      case Character.sage: return '$wikiUrl/7/74/Sage$suffix';
      case Character.syke: return '$wikiUrl/3/33/Skye$suffix';
      case Character.sova: return '$wikiUrl/4/49/Sova$suffix';
      case Character.viper: return '$wikiUrl/5/5f/Viper$suffix';
      case Character.yoru: return '$wikiUrl/d/d4/Yoru$suffix';
      default: return '$wikiUrl/b/be/Crusader$suffix';
    }
  }

  static String gameTypeToString(GameType gameType) {
    switch (gameType) {
      case GameType.nonClasse: return 'Non classé';
      case GameType.competition: return 'Compétition';
      case GameType.velocite: return 'Vélocité';
      case GameType.spikeRush: return 'Spike Rush';
      case GameType.combatAMort: return 'Combat à mort';
      case GameType.intensification: return 'Intensification';
      case GameType.combatAMortParEquipe: return 'Comabt à mort par équipe';
      case GameType.partiePersonnalisee: return 'Partie Personnalisée';
      default: return 'Inconnu';
    }
  }

  static GameType stringToGameType(String gameType) {
    switch (gameType) {
      case 'Non classé' : return GameType.nonClasse;
      case 'Compétition': return GameType.competition;
      case 'Vélocité' : return GameType.velocite;
      case 'Spike Rush' : return GameType.spikeRush;
      case 'Combat à mort' : return  GameType.combatAMort;
      case 'Intensification' : return GameType.intensification;
      case 'Comabt à mort par équipe' : return GameType.combatAMortParEquipe;
      case 'Partie Personnalisée' : return GameType.partiePersonnalisee;
      default: return GameType.partiePersonnalisee;
    }
  }

}
