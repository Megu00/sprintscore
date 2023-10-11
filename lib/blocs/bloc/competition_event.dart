part of 'competition_bloc.dart';

sealed class CompetitionEvent extends Equatable {
  const CompetitionEvent();

  @override
  List<Object> get props => [];
}



class GetCompetitionEvent extends CompetitionEvent{}