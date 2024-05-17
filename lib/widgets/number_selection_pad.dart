import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_selection/cubit/home_cubit.dart';

class NumberSelectionPad extends StatelessWidget {
  final List<List<int>> values;
  const NumberSelectionPad({
    Key? key,
    required this.values,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(
        values.length,
        (index) => SelectionColumn(
          values: values.elementAt(index),
        ),
      ),
    );
  }
}

class SelectionColumn extends StatelessWidget {
  final List<int> values;
  const SelectionColumn({
    Key? key,
    required this.values,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        values.length,
        (index) => InkWell(
          onTap: () {
            context.read<HomeCubit>().selectedSequence(values.elementAt(index));
          },
          child: Container(
            alignment: Alignment.center,
            height: 42,
            width: 42,
            // decoration: BoxDecoration(
            //   border: Border.all(),
            // ),
            child: Text(
              values.elementAt(index).toString(),
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
