import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_selection/cubit/home_cubit.dart';
import 'package:number_selection/cubit/home_state.dart';
import 'package:number_selection/widgets/game_score.dart';
import 'package:number_selection/widgets/game_timer.dart';
import 'package:number_selection/widgets/number_selection.dart';
import 'package:number_selection/widgets/selected_sequence.dart';
import 'package:number_selection/widgets/sequence_display.dart';

class GameStart extends StatelessWidget {
  const GameStart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 12,
        ),
        const GameTimer(),
        const GameScore(),
        const SizedBox(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Row(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: Level.easy,
                        groupValue: state.level,
                        onChanged: (value) {
                          context
                              .read<HomeCubit>()
                              .changeLevel(value ?? Level.easy);
                        },
                      ),
                      const Text('Easy'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: Level.hard,
                        groupValue: state.level,
                        onChanged: (value) {
                          context
                              .read<HomeCubit>()
                              .changeLevel(value ?? Level.hard);
                        },
                      ),
                      const Text('Hard'),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<HomeCubit>().stopGame();
                },
                child: const Text('STOP'),
              ),
            ],
          ),
        ),
        const SequenceDisplay(),
        const SelectedSequence(),
        const SizedBox(height: 12),
        const NumberSelection(),
        const SizedBox(height: 12),
      ],
    );
  }
}
