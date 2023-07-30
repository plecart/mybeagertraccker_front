import '../gamecard_model.dart';

String validateInputs(GameCardModel newGameCard, List<GameCardModel> allGameCards) {
  int characterCount = 0;
  int dateCount = 0;

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

  return "";
}