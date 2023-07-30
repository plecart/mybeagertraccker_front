import 'dart:developer';
import 'package:http/http.dart' as http;
import './constants.dart';
import '../gamecard_model.dart';
import 'dart:core';
import 'dart:convert';

class ApiService {

  Future<List<GameCardModel>?> getAllCards() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.getAllCards);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<GameCardModel> _model = gameCardModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<bool> deleteCard(int id) async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.getAllCards}/$id');
      var response = await http.delete(url);
      if (response.statusCode == 200) {
        return true;      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future<GameCardModel?> updateGameCard(int id, GameCardModel updatedCard) async {

    try {
      var url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.getAllCards}/$id');
      var response = await http.put(
          url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(updatedCard.toJson()));
      if (response.statusCode == 200) {
        return updatedCard;
      }
    } catch (e) {
      log(e.toString());
    }

    Future<bool> deleteGameCard(int id) async {
      try {
        var url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.getAllCards}/$id');
        var response = await http.delete(url);
        if (response.statusCode == 200) {
          return true;
        }
      } catch (e) {
        log(e.toString());
      }
      return false;
    }
  }
}