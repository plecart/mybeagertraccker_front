import 'package:flutter/material.dart';
import './gamecard_model.dart';
import './api/api_service.dart';
import './widgets/gamecard_item.dart';
import './utils/gamecarditem_switch.dart';

void main() => runApp( const MaterialApp(
    home: Home() //Widget Principal contenant toute mon appli'
));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List<GameCardModel> _gameCardModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _updateGameCard(int indexOldCard) {

    List<String> gameTypeStringTab = GameCardSwicth.getGameTypesTabString();
    //Outcome
    //date
    TextEditingController gameTypeController = TextEditingController();
    //character
    //kda
    //role
    TextEditingController commentController = TextEditingController();

    // Ajoutez plus de contrôleurs pour les autres champs du formulaire...

    // Pré-remplit les champs avec les informations existantes
    GameCardModel gameCard = _gameCardModel[indexOldCard];
    gameTypeController.text = GameCardSwicth.gameTypeToString(gameCard.gameType);
    commentController.text = gameCard.comment;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            indexOldCard != 0 ? 'Modifier ma partie' : 'Créer une partie',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
              value: gameTypeController.text, // Valeur actuelle du menu déroulant

            items: gameTypeStringTab.map((String type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(type),
              );
            }).toList(),
            onChanged: (String? newValue) {
              gameTypeController.text = newValue!;
            },


            decoration: InputDecoration(labelText: 'Game Type'),
              ),

              TextFormField(
                controller: commentController,
                decoration: InputDecoration(labelText: 'Comment'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _gameCardModel[indexOldCard].gameType = GameCardSwicth.stringToGameType(gameTypeController.text);
                _gameCardModel[indexOldCard].comment = commentController.text;
                ApiService().updateGameCard(
                    _gameCardModel[indexOldCard].id,
                    _gameCardModel[indexOldCard])
                    .then((changedGameCard) {
                  if (changedGameCard != null) {
                    setState(() {});
                  }
                });
                Navigator.pop(context);
              },
              child: Text('Sauvegarder'),
            ),
            TextButton(
              onPressed: () { Navigator.pop(context); },
              child: Text('Annuler'),
            ),
          ],
        );
      },
    );
  }

  // Récupération et stockage dans le stat de mes parties
  void _getData() async {
    List<GameCardModel>? apiGameCardModel = await ApiService().getAllCards();
    if (apiGameCardModel != null) {
      setState(() {
        _gameCardModel = apiGameCardModel;
      });
    }
  }

  // Fonction qui vient retirer du serveur et du state la game selectionné
  void removeGameCard(int index) {
    if (index >= 0 && index < _gameCardModel.length) {
      ApiService().deleteCard(_gameCardModel[index].id).then((isDeleted) {
        if (isDeleted) {
          setState(() {
            _gameCardModel.removeAt(index);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 25, 25, 1),

      appBar: AppBar(
        backgroundColor: Color.fromRGBO(40, 40, 40, 1),
        centerTitle: true,
        // Le Le style et descriptif de mon header
        title: const Text(
          'Historique de partie',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              letterSpacing: 2.0,
              fontFamily: 'Valorant',
              shadows: [
                Shadow(
                  color: Colors.white38,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 1.5,
                ),
            ],
          ),
        ),
      ),

      // "Boucle" qui affichera toutes les games récupéré depuis le serveur
      body: ListView.builder(
        itemCount: _gameCardModel.length,
        itemBuilder: (context, index) {
          return Row(
              children: [
                Expanded(
                  child : GameCardItem(gameCard: _gameCardModel[index]),
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () { _updateGameCard(index); },
                      icon: const Icon(Icons.edit, color: Colors.grey),
                    ),
                    SizedBox(height: 8.0),
                    IconButton(
                      onPressed: () { removeGameCard(index); },
                      icon: const Icon(Icons.delete, color: Colors.grey),
                    ),
                  ],
                )
              ]
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //_updateGameCard(0);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green, // Change the background color of the button
      ),

    );
  }
}