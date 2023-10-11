// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'competioninfo_bloc.dart';

class CompetionInfoState extends Equatable {
  const CompetionInfoState();
  
  @override
  List<Object> get props => [];
}

 class CompetionInfoInitial extends CompetionInfoState {}
class LoadingCompetitionInfoState extends CompetionInfoState{}

class LoaddedCompetitionInfoState extends CompetionInfoState {
  final dynamic data;
 const LoaddedCompetitionInfoState({
    required this.data,
  });
}

class ErrorCompetitionInfoState extends CompetionInfoState {
  final String errortext;
 const ErrorCompetitionInfoState({
    required this.errortext,
  });
}

