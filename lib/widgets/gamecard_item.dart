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
    double kdaRatio = (gameCard.kda[0] + gameCard.kda[2]) / gameCard.kda[1];

    print(urlImage);
    return Container(
      // Style de la carte container
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(8.0),

      // Row pour placer tout les éléments de ma gamededans
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Game Type: ${GameCardSwicth.gameTypeToString(gameCard.gameType)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text('Date: ${gameCard.date.toString()}'),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Text('KDA: ${gameCard.kda[0]} / ${gameCard.kda[1]} / ${gameCard.kda[2]}'),
                      SizedBox(width: 4.0),
                      Text(' - KDA Ratio: ${kdaRatio.toStringAsFixed(2)}' )
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Text('Role: ${GameCardSwicth.roleToString(gameCard.role)}'),
                  SizedBox(height: 4.0),
                  Text('Comment: ${gameCard.comment}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}