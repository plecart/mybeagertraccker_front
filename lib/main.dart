import 'package:flutter/material.dart';

void main() => runApp( const MaterialApp(
    home: Home() //Widget Principal contenant toute mon appli'
));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      //body: ColumnnContainer(), // L'espace dans lequel sera placé mes cartes
      backgroundColor: Color.fromRGBO(25,25,25,1), // Couleur du Background
    );
  }
}