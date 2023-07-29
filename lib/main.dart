import 'package:flutter/material.dart';
import './gamecard_model.dart';
import './api/api_service.dart';
import './widgets/gamecard_item.dart';

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

  void _getData() async {
    List<GameCardModel>? apiGameCardModel = await ApiService().getAllCards();
    print(apiGameCardModel);
    if (apiGameCardModel != null) {
      setState(() {
        _gameCardModel = apiGameCardModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 25, 25, 1),

      appBar: AppBar(
        backgroundColor: Color.fromRGBO(40, 40, 40, 1), // Slightly lighter background color
        centerTitle: true,

        title: const Text(
          'Historique de partie',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              letterSpacing: 2.0,
              fontFamily: 'Valorant',
              shadows: [
                Shadow(
                  color: Colors.white38, // Shadow color
                  offset: Offset(2.0, 2.0), // Shadow offset
                  blurRadius: 1.5, // Shadow blur radius
                ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _gameCardModel.length,
        itemBuilder: (context, index) {
          return GameCardItem(gameCard: _gameCardModel[index]);
        },
      ),
    );
  }
}