import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_selection/cubit/home_cubit.dart';
import 'package:number_selection/cubit/home_state.dart';

class GameScore extends StatelessWidget {
  const GameScore({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return previous.score != current.score;
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'score:',
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.end,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  state.score.toString(),
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
