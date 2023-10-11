// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'competioninfo_bloc.dart';

sealed class CompetioninfoEvent extends Equatable {
  const CompetioninfoEvent();

  @override
  List<Object> get props => [];
}

class GetCompetitionInfoEvent extends CompetioninfoEvent {
  final String codeleague;
 const GetCompetitionInfoEvent({
    required this.codeleague,
  });
}
