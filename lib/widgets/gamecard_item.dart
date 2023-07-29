import 'package:flutter/material.dart';
import '../gamecard_model.dart';
import '../utils/gamecarditem_switch.dart';

class GameCardItem extends StatelessWidget {
  final GameCardModel gameCard;

  const GameCardItem({required this.gameCard});

  @override
  Widget build(BuildContext context) {

    Color cardColor = GameCardSwicth.getOutcomeColor(gameCard.outcome);
    String urlImage = GameCardSwicth.getCharacterUrl(gameCard.character);

    print(urlImage);
    return Container(
      // Style de la carte container
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(8.0),

      // Row pour placer tout les éléments dedans
      child: Row(
        children: [
          // Container de mon image character
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image.network(urlImage),
          ),



          Expanded(
            child: ListTile(
              title: Text('ID: ${gameCard.id}'),
              subtitle: Text('COMMENT: ${gameCard.comment}'),
            ),
          ),
        ],
      ),
    );
  }
}