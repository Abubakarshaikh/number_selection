// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_selection/cubit/home_cubit.dart';
import 'package:number_selection/cubit/home_state.dart';

class NumberSelection extends StatefulWidget {
  const NumberSelection({super.key});

  @override
  State<NumberSelection> createState() => _NumberSelectionState();
}

class _NumberSelectionState extends State<NumberSelection> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) {
          return previous.randomNumbers != current.randomNumbers;
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: NumberSelectionPad(
              values: state.randomNumbers,
            ),
          );
        },
      ),
    );
  }
}

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
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
