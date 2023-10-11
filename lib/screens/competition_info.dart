// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:scoresprint/bloc/competioninfo_bloc.dart';

import 'package:scoresprint/models/team_stand.dart';

import 'package:scoresprint/widgets/shimmer_widgets.dart';
import 'package:scoresprint/widgets/teams_standigns.dart';

class CompetitionInfo extends StatefulWidget {
  const CompetitionInfo({
    Key? key,
    required this.codeleague,
  }) : super(key: key);
  final String codeleague;
  @override
  State<CompetitionInfo> createState() => _CompetitionInfoState();
}

class _CompetitionInfoState extends State<CompetitionInfo> {


  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CompetionInfoBloc>(
      context,
    ).add(GetCompetitionInfoEvent(codeleague: widget.codeleague));

    return Scaffold(
      backgroundColor: const Color(0xFF161616),
      body: BlocBuilder<CompetionInfoBloc, CompetionInfoState>(
        builder: (context, state) {
          if (state is LoadingCompetitionInfoState) {
            return const Center(
              child: ShimmerWidget(),
            );
          }
          if (state is LoaddedCompetitionInfoState) {
            final List<TeamStand> teams = [];
            final List tableteams = state.data['standings'][0]['table'];
            for (var element in tableteams) {
              teams.add(TeamStand.fromMap(element));
            }
            return TeamsStandings(
              data: state.data,
              teams: teams,
            );
          }
          return const Text('Loading');
        },
      ),
    );
  }
}
