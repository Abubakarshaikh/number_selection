import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_selection/cubit/home_cubit.dart';
import 'package:number_selection/cubit/home_state.dart';

class NumberSequence extends StatelessWidget {
  const NumberSequence({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) {
          return previous.randomSequence != current.randomSequence;
        },
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(state.randomSequence.length, (index) {
              if (state.popIndex == index) {
                return Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.center,
                  child: Text(
                    '?',
                    style: theme.textTheme.displaySmall,
                  ),
                );
              } else {
                return Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.center,
                  child: Text(
                    '${state.randomSequence.elementAt(index)}',
                    style: theme.textTheme.displaySmall,
                  ),
                );
              }
            }),
          );
        },
      ),
    );
  }
}
