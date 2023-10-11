import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scoresprint/models/team_stand.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
           List<TeamStand> team=[];
              try {
                Uri url =
                    Uri.parse('http://api.football-data.org/v4/competitions/PL/standings');
                var response = await http.get(url, headers: {
                  'X-Auth-Token': 'e25adf6473d94126b1a4b0b29ce978f9'
                });
                if (response.statusCode == 200) {
                  var data = jsonDecode(response.body);
                List standings=data['standings'][0]['table'];
                   
                for (var element in standings) {
                  
                 team.add(TeamStand.fromMap(element));

                }

                print(team.length);
             
                 
                
                }
              } catch (e) {
                print(e);
              }
            },
            child: const Text('Test')),
      ),
    );
  }
}
