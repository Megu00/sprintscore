import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scoresprint/models/competition_model.dart';
import 'package:scoresprint/servises/competition_servises.dart';

part 'competition_event.dart';
part 'competition_state.dart';

class CompetitionBloc extends Bloc<CompetitionEvent, CompetitionState> {
  final CompetitionServises _competitionServises;
  CompetitionBloc({required CompetitionServises competitionServises})
      : _competitionServises = competitionServises,
        super(LoadingCompetitionState()) {
    on<GetCompetitionEvent>((event, emit) async {
      emit(LoadingCompetitionState());
      try {
        List<CompetitionModel> competitions = [];
        competitions = await _competitionServises.getCompetitions();

        emit(LoaddedCompetitionState(competitions: competitions));
      } catch (e) {
        emit(ErrorCompetitionState(errortext: e.toString()));
      }
    });
  }
}
