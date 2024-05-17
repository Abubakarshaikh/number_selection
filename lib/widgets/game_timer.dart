import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_selection/cubit/home_cubit.dart';
import 'package:number_selection/cubit/home_state.dart';

class GameTimer extends StatelessWidget {
  const GameTimer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return previous.timer != current.timer;
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'TIME: ',
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  state.timer.toString(),
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
