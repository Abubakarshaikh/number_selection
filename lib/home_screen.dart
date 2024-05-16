import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_selection/cubit/home_cubit.dart';
import 'package:number_selection/cubit/home_state.dart';
import 'package:number_selection/widgets/common_score.dart';
import 'package:number_selection/widgets/common_timer.dart';
import 'package:number_selection/widgets/number_selection.dart';
import 'package:number_selection/widgets/number_sequence.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Column(
            children: [
              // Timer Area:
              CommonTimer(),
              // Score Area:
              CommonScore(),
            ],
          ),
          // Score selection (Center):
          const Expanded(
            child: NumberSelectionBoard(),
          ),
          // number sequences (original):
          const NumberSequence(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return TextButton(
                    onPressed: () {
                      context.read<HomeCubit>().start();
                    },
                    child: const Text('Start'),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
