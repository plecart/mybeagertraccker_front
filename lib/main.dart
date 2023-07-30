import 'package:flutter/material.dart';
import './gamecard_model.dart';
import './api/api_service.dart';
import './widgets/gamecard_item.dart';
import './utils/gamecarditem_switch.dart';
import './utils/convertdate.dart';
import 'package:intl/intl.dart';

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
    List<String> OutcomeStringTab = GameCardSwicth.getOutcomesTabString();
    List<String> CharactersStringTab = GameCardSwicth.getCharactersTabString();
    List<String> RoleStringTab = GameCardSwicth.getRolesTabString();

    TextEditingController outcomeController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController characterController = TextEditingController();
    TextEditingController gameTypeController = TextEditingController();
    TextEditingController roleController = TextEditingController();
    TextEditingController kdaKillController = TextEditingController();
    TextEditingController kdaDeathController = TextEditingController();
    TextEditingController kdaAssistController = TextEditingController();

    //kda
    TextEditingController commentController = TextEditingController();


    // Pré-remplit les champs avec les informations existantes
    GameCardModel gameCard = _gameCardModel[indexOldCard];
    outcomeController.text = GameCardSwicth.outcomeToString(gameCard.outcome);
    gameTypeController.text = GameCardSwicth.gameTypeToString(gameCard.gameType);
    commentController.text = gameCard.comment;
    dateController.text = convertDate(gameCard.date);
    characterController.text = GameCardSwicth.characterToString(gameCard.character);
    roleController.text = GameCardSwicth.roleToString(gameCard.role);
    kdaKillController.text = gameCard.kda[0].toString();
    kdaDeathController.text = gameCard.kda[1].toString();
    kdaAssistController.text = gameCard.kda[2].toString();

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
              //Menu deroulant de Outcome
              DropdownButtonFormField<String>(
                value: outcomeController.text, // Valeur actuelle du menu déroulant
                items: OutcomeStringTab.map((String type) {
                  return DropdownMenuItem<String>(value: type, child: Text(type));
                }).toList(),
                onChanged: (String? newValue) {
                  outcomeController.text = newValue!;
                },
                decoration: const InputDecoration(labelText: 'Outcome'),
              ),

              // Pop up pour rentrer la date
              TextFormField(
                controller: dateController,
                decoration: const InputDecoration(labelText: 'Date'),
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    dateController.text = selectedDate.toLocal().toString();
                  }
                },
              ),

              //Popup pour selectionner le perso
              DropdownButtonFormField<String>(
                value: characterController.text,
                items: CharactersStringTab.map((String type) {
                  return DropdownMenuItem<String>(value: type, child: Text(type));
                }).toList(),
                onChanged: (String? newValue) {
                  characterController.text = newValue!;
                },
                decoration: const InputDecoration(labelText: 'Character'),
              ),

              //Menu déroulant de Game type
              DropdownButtonFormField<String>(
                value: gameTypeController.text, // Valeur actuelle du menu déroulant
                items: gameTypeStringTab.map((String type) {
                  return DropdownMenuItem<String>(value: type, child: Text(type));
                }).toList(),
              onChanged: (String? newValue) {
                gameTypeController.text = newValue!;
              },
              decoration: const InputDecoration(labelText: 'Game Type'),
              ),

              //Menu déroulant de Role
              DropdownButtonFormField<String>(
                value: roleController.text, // Valeur actuelle du menu déroulant
                items: RoleStringTab.map((String type) {
                  return DropdownMenuItem<String>(value: type, child: Text(type));
                }).toList(),
                onChanged: (String? newValue) {
                  roleController.text = newValue!;
                },
                decoration: const InputDecoration(labelText: 'Role'),
              ),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: kdaKillController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Kills'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: kdaDeathController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Deaths'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: kdaAssistController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Assists'),
                    ),
                  ),
                ],
              ),

              TextFormField(
                controller: commentController,
                decoration: const InputDecoration(labelText: 'Comment'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _gameCardModel[indexOldCard].gameType = GameCardSwicth.stringToGameType(gameTypeController.text);
                _gameCardModel[indexOldCard].outcome = GameCardSwicth.stringToOutcome(outcomeController.text);
                _gameCardModel[indexOldCard].comment = commentController.text;
                _gameCardModel[indexOldCard].date = DateFormat('dd/MM/yyyy').format(DateTime.parse(dateController.text));
                _gameCardModel[indexOldCard].character = GameCardSwicth.stringToCharacter(characterController.text);
                _gameCardModel[indexOldCard].role = GameCardSwicth.stringToRole(roleController.text);
                _gameCardModel[indexOldCard].kda[0] = int.tryParse(kdaKillController.text) ?? 0;
                _gameCardModel[indexOldCard].kda[1] = int.tryParse(kdaDeathController.text) ?? 0;
                _gameCardModel[indexOldCard].kda[2] = int.tryParse(kdaAssistController.text) ?? 0;
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