import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_selection/cubit/home_cubit.dart';
import 'package:number_selection/cubit/home_state.dart';

class SelectedSequence extends StatelessWidget {
  const SelectedSequence({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return previous.selectedSequence != current.selectedSequence;
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              state.randomSequence.length,
              (index) {
                final value = state.selectedSequence.elementAtOrNull(index);
                return Container(
                  alignment: Alignment.center,
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Text(
                    '${value ?? ''}',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
