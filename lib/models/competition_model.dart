import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CompetitionModel {

late int id;
late Map area;
late String name;
late String code;
late String type;
late String emblem;
late String plan;
late Map currentSeason;
late int numberOfAvailableSeasons;
late String lastUpdated;
  CompetitionModel({
    required this.id,
    required this.area,
    required this.name,
    required this.code,
    required this.type,
    required this.emblem,
    required this.plan,
    required this.currentSeason,
    required this.numberOfAvailableSeasons,
    required this.lastUpdated,
  });












  factory CompetitionModel.fromMap(Map<String, dynamic> map) {
    return CompetitionModel(
      id:map['id'],
      area: map['area'] ,
      name: map['name'] ,
      code: map['code'] ,
      type: map['type'],
      emblem: map['emblem'],
      plan: map['plan'],
      currentSeason: map['currentSeason'] ,
      numberOfAvailableSeasons: map['numberOfAvailableSeasons'] ,
      lastUpdated:map['lastUpdated'],
    );
  }

  
}
