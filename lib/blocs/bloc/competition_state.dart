// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'competition_bloc.dart';

sealed class CompetitionState extends Equatable {
  const CompetitionState();
  
  @override
  List<Object> get props => [];
}

final class CompetitionInitial extends CompetitionState {}


class LoadingCompetitionState extends CompetitionState{}
class LoaddedCompetitionState extends CompetitionState{
   final List<CompetitionModel>competitions;

  const LoaddedCompetitionState({required this.competitions});




}
class ErrorCompetitionState extends CompetitionState {
  final String errortext;
 const  ErrorCompetitionState({
    required this.errortext,
  });
}
