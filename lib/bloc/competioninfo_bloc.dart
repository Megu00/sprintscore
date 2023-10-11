import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scoresprint/servises/competition_servises.dart';

part 'competioninfo_event.dart';
part 'competioninfo_state.dart';

class CompetionInfoBloc extends Bloc<CompetioninfoEvent, CompetionInfoState> {
  final CompetitionServises _competitionServises;
  CompetionInfoBloc({required CompetitionServises competitionServises})
      : _competitionServises = competitionServises,
        super(CompetionInfoInitial()) {
    on<GetCompetitionInfoEvent>((event, emit) async {
      emit(LoadingCompetitionInfoState());
      try {
        final dynamic  data = await _competitionServises.getcompetitioninfo(event.codeleague);
        emit(LoaddedCompetitionInfoState(data: data));
      } catch (e) {
        emit(ErrorCompetitionInfoState(errortext: e.toString()));
      }
    });
  }
}
