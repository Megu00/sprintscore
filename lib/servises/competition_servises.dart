import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scoresprint/models/competition_model.dart';

class CompetitionServises {
  Future<List<CompetitionModel>> getCompetitions() async {
    List<CompetitionModel> competitions = [];
    Uri url = Uri.parse('http://api.football-data.org/v4/competitions/');
    var response = await http.get(url,
        headers: {'X-Auth-Token': 'e25adf6473d94126b1a4b0b29ce978f9'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List results = data['competitions'];
      for (var element in results) {
        competitions.add(CompetitionModel.fromMap(element));
      }
    }
    return competitions;
  }

  Future<dynamic> getcompetitioninfo(String codeleague) async {
    Uri url = Uri.parse(
        'http://api.football-data.org/v4/competitions/$codeleague/standings');
    var response = await http.get(url, headers: {
      'X-Auth-Token': 'e25adf6473d94126b1a4b0b29ce978f9',
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
  }
}
