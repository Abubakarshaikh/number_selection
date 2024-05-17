import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_selection/cubit/home_cubit.dart';
import 'package:number_selection/cubit/home_state.dart';
import 'package:number_selection/widgets/animated_sequence_number.dart';

class SequenceDisplay extends StatelessWidget {
  const SequenceDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 6,
        ),
        decoration: const BoxDecoration(),
        alignment: Alignment.center,
        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) {
            return previous.sequenceTimer != current.sequenceTimer;
          },
          builder: (context, state) {
            log('SequenceDisplay');
            if (state.isSequenceDisplayComleted == false) {
              return AnimatedSequenceNumber(
                number: state.sequenceDisplay,
                sequenceDisplayStyle: state.sequenceDisplayStyle,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
