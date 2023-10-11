import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoresprint/bloc/competioninfo_bloc.dart';
import 'package:scoresprint/blocs/bloc/competition_bloc.dart';
import 'package:scoresprint/screens/home_screen.dart';
import 'package:scoresprint/screens/test.dart';
import 'package:scoresprint/servises/competition_servises.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CompetitionBloc(competitionServises: CompetitionServises())
                ..add(GetCompetitionEvent()),
        ),
        BlocProvider(
          create: (context) => CompetionInfoBloc(competitionServises: CompetitionServises()),
        ),
      ],
      child: ScreenUtilInit(
          builder: (context, child) {
            return MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData.dark(useMaterial3: true),
                home: child);
          },
          child: HomeScreen()),
    );
  }
}
