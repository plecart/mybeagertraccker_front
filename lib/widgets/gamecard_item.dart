import 'package:flutter/material.dart';
import '../gamecard_model.dart';

class GameCardItem extends StatelessWidget {
  final GameCardModel gameCard;

  const GameCardItem({required this.gameCard});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('ID: ${gameCard.id}',
          style: TextStyle(
          color: Colors.white,)),
        subtitle: Text('Outcome: ${gameCard.outcome}'),
      ),
    );
  }
}