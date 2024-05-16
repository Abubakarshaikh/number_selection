import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_selection/cubit/home_cubit.dart';
import 'package:number_selection/cubit/home_state.dart';

class CommonTimer extends StatelessWidget {
  const CommonTimer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      child: Container(
        alignment: Alignment.center,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Text(
              'Time: ${state.seconds}',
              style: theme.textTheme.displaySmall,
            );
          },
        ),
      ),
    );
  }
}
