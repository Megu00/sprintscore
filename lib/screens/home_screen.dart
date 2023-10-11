import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoresprint/blocs/bloc/competition_bloc.dart';
import 'package:scoresprint/widgets/custom_text.dart';
import 'package:scoresprint/widgets/listcompetitions.dart';
import 'package:scoresprint/widgets/shimmer_widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SizedBox.expand(
      child: BlocBuilder<CompetitionBloc, CompetitionState>(
          builder: (context, state) {
        if (state is LoadingCompetitionState) {
          return const Center(
            child: ShimmerWidget(),
          );
        }
        if (state is ErrorCompetitionState) {
          return Center(
            child: CustomText(
              text: state.errortext,
              fontWeight: FontWeight.bold,
              size: 22.sp,
            ),
          );
        }

        if (state is LoaddedCompetitionState) {
          return ListCompetitions(competitions: state.competitions.where((element) => element.type!='CUP').toList(),);
        }

        return Center(
          child: CustomText(
            text: 'SomeThing Wrong',
            fontWeight: FontWeight.bold,
            size: 20.sp,
          ),
        );
      }),
    ));
  }
}
