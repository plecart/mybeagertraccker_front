import '../gamecard_model.dart';

String validateInputs(GameCardModel newGameCard, List<GameCardModel> allGameCards) {
  int characterCount = 0;
  int dateCount = 0;

  if (newGameCard.kda[0] + newGameCard.kda[2] > 20) {
    return "Le nombre de kills + assist d’une partie ne peut pas dépasser 20";
  }

  for (GameCardModel gameCard in allGameCards) {
    if (gameCard.character == newGameCard.character) {
      characterCount++;
    }
    if (gameCard.date == newGameCard.date) {
      dateCount++;
    }
  }

  if (characterCount >= 3 && dateCount >= 3) {
    return "Il est impossible de jouer trois parties le même jour avec un seul personnage.";
  }

  if (dateCount >= 5) {
    return "Il est impossible de jouer plus de 5 parties par jour";
  }

  return "";
}

String isWashedUp(GameCardModel newGameCard, List<GameCardModel> allGameCards, int index){
  if (index != -1) {
    if (allGameCards.length >= 3 && newGameCard.outcome == Outcome.defaite) {
      if (allGameCards[index -1].outcome == Outcome.defaite
          && allGameCards[index -2].outcome == Outcome.defaite) {
        return "T’es aussi éclaté au sol que ma grand mère";
      }
    }
  } else {
    int lastIndex = allGameCards.length - 1;
    if (allGameCards.length >= 2 && newGameCard.outcome == Outcome.defaite) {
      if (allGameCards[lastIndex -1].outcome == Outcome.defaite
          && allGameCards[lastIndex -2].outcome == Outcome.defaite) {
        return "T’es aussi éclaté au sol que ma grand mère";
      }
    }

  }
  return "";
}