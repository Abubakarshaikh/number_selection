import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_selection/cubit/home_cubit.dart';
import 'package:number_selection/cubit/home_state.dart';

class CommonScore extends StatefulWidget {
  const CommonScore({super.key});

  @override
  State<CommonScore> createState() => _CommonScoreState();
}

class _CommonScoreState extends State<CommonScore> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Text(
            'Score: ${state.scores}',
            style: theme.textTheme.displaySmall,
          );
        },
      ),
    );
  }
}
