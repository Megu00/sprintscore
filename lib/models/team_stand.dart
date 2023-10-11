import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TeamStand {
  late int position;
  late Map team;
  late int playedGames;
  
  late int won;
  late int draw;
  late int lost;
  late int points;
  late int goalsFor;
  late int goalsAgainst;
  late int goalDifference;
  TeamStand({
    required this.position,
    required this.team,
    required this.playedGames,
    
    required this.won,
    required this.draw,
    required this.lost,
    required this.points,
    required this.goalsFor,
    required this.goalsAgainst,
    required this.goalDifference,
  });

  factory TeamStand.fromMap(Map<String, dynamic> map) {
    return TeamStand(
      position: map['position'],
      team: map['team'],
      playedGames: map['playedGames'],
      
      won: map['won'],
      draw: map['draw'],
      lost: map['lost'],
      points: map['points'],
      goalsFor: map['goalsFor'],
      goalsAgainst: map['goalsAgainst'],
      goalDifference: map['goalDifference'],
    );
  }
}
