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
      default: return 'Partie Personnalisée';
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

  static List<String> getGameTypesTabString() {
    return [
      gameTypeToString(GameType.nonClasse),
      gameTypeToString(GameType.competition),
      gameTypeToString(GameType.velocite),
      gameTypeToString(GameType.spikeRush),
      gameTypeToString(GameType.combatAMort),
      gameTypeToString(GameType.intensification),
      gameTypeToString(GameType.combatAMortParEquipe),
      gameTypeToString(GameType.partiePersonnalisee),
    ];
  }

  static String outcomeToString(Outcome outcome) {
    switch (outcome) {
      case Outcome.victoire: return 'Victoire';
      case Outcome.defaite: return 'Défaite';
      case Outcome.egalite: return 'Égalité';
      case Outcome.annule: return 'Annulé';
      default: return 'Annulé';
    }
  }

  static Outcome stringToOutcome(String outcome) {
    switch (outcome) {
      case 'Victoire': return Outcome.victoire;
      case 'Défaite': return Outcome.defaite;
      case 'Égalité': return Outcome.egalite;
      case 'Annulé': return Outcome.annule;
      default: return Outcome.annule;
    }
  }

  static List<String> getOutcomesTabString() {
    return [
      outcomeToString(Outcome.victoire),
      outcomeToString(Outcome.defaite),
      outcomeToString(Outcome.egalite),
      outcomeToString(Outcome.annule),
    ];
  }

  static String characterToString(Character character) {
    switch (character) {
      case Character.astra: return 'Astra';
      case Character.breach: return 'Breach';
      case Character.brimstone: return 'Brimstone';
      case Character.chamber: return 'Chamber';
      case Character.cypher: return 'Cypher';
      case Character.deadlock: return 'Deadlock';
      case Character.fade: return 'Fade';
      case Character.gekko: return 'Gekko';
      case Character.harbor: return 'Harbor';
      case Character.jett: return 'Jett';
      case Character.kayo: return 'Kay/0';
      case Character.killjoy: return 'Killjoy';
      case Character.neon: return 'Neon';
      case Character.omen: return 'Omen';
      case Character.pheonix: return 'Pheonix';
      case Character.raze: return 'Raze';
      case Character.reyna: return 'Reyna';
      case Character.sage: return 'Sage';
      case Character.syke: return 'Syke';
      case Character.sova: return 'Sova';
      case Character.viper: return 'Viper';
      case Character.yoru: return 'Yoru';
      default: return 'Unknown';
    }
  }

  static Character stringToCharacter(String character) {
    switch (character) {
      case 'Astra': return Character.astra;
      case 'Breach': return Character.breach;
      case 'Brimstone': return Character.brimstone;
      case 'Chamber': return Character.chamber;
      case 'Cypher': return Character.cypher;
      case 'Deadlock': return Character.deadlock;
      case 'Fade': return Character.fade;
      case 'Gekko': return Character.gekko;
      case 'Harbor': return Character.harbor;
      case 'Jett': return Character.jett;
      case 'Kay/0': return Character.kayo;
      case 'Killjoy': return Character.killjoy;
      case 'Neon': return Character.neon;
      case 'Omen': return Character.omen;
      case 'Pheonix': return Character.pheonix;
      case 'Raze': return Character.raze;
      case 'Reyna': return Character.reyna;
      case 'Sage': return Character.sage;
      case 'Syke': return Character.syke;
      case 'Sova': return Character.sova;
      case 'Viper': return Character.viper;
      case 'Yoru': return Character.yoru;
      default: return Character.yoru;
    }
  }

  static List<String> getCharactersTabString() {
    return [
      characterToString(Character.astra),
      characterToString(Character.breach),
      characterToString(Character.brimstone),
      characterToString(Character.chamber),
      characterToString(Character.cypher),
      characterToString(Character.deadlock),
      characterToString(Character.fade),
      characterToString(Character.gekko),
      characterToString(Character.harbor),
      characterToString(Character.jett),
      characterToString(Character.kayo),
      characterToString(Character.killjoy),
      characterToString(Character.neon),
      characterToString(Character.omen),
      characterToString(Character.pheonix),
      characterToString(Character.raze),
      characterToString(Character.reyna),
      characterToString(Character.sage),
      characterToString(Character.syke),
      characterToString(Character.sova),
      characterToString(Character.viper),
      characterToString(Character.yoru),
    ];
  }

  static String roleToString(Role role) {
    switch (role) {
      case Role.controleur: return 'Contrôleur';
      case Role.duelliste: return 'Duelliste';
      case Role.sentinelle: return 'Sentinelle';
      case Role.initiateur: return 'Initiateur';
      default: return 'Initiateur';
    }
  }

  static Role stringToRole(String role) {
    switch (role) {
      case 'Contrôleur': return Role.controleur;
      case 'Duelliste': return Role.duelliste;
      case 'Sentinelle': return Role.sentinelle;
      case 'Initiateur': return Role.initiateur;
      default: return Role.initiateur;
    }
  }

  static List<String> getRolesTabString() {
    return [
      roleToString(Role.controleur),
      roleToString(Role.duelliste),
      roleToString(Role.sentinelle),
      roleToString(Role.initiateur),
    ];
  }




}
