// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_selection/cubit/home_cubit.dart';
import 'package:number_selection/cubit/home_state.dart';

class NumberSelectionBoard extends StatefulWidget {
  const NumberSelectionBoard({super.key});

  @override
  State<NumberSelectionBoard> createState() => _NumberSelectionBoardState();
}

class _NumberSelectionBoardState extends State<NumberSelectionBoard> {
  final _numberSelection = <NumberSelection>[];

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
       if (timer.tick < 6) {
          _numberSelection.add(
          const NumberSelection(),
        );
       } else {
         timer.cancel();
       }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(
        _numberSelection.length,
        (index) {
          return  Expanded(
            child:_numberSelection[index],
          );
        },
      ),
    );
  }
}

class NumberSelection extends StatefulWidget {
  const NumberSelection({super.key});

  @override
  State<NumberSelection> createState() => _NumberSelectionState();
}

class _NumberSelectionState extends State<NumberSelection> {
  late final Timer _timer;
  final List<AnimatedRandomNumber> _numbers = [
    AnimatedRandomNumber(
      key: UniqueKey(),
    ),
  ];

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 24), (timer) {
      setState(() {
        _numbers.add(
          AnimatedRandomNumber(
            key: UniqueKey(),
          ),
        );
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
        _numbers.length,
        (index) {
          return _numbers[index];
        },
      ),
    );
  }
}

class AnimatedRandomNumber extends StatefulWidget {
  const AnimatedRandomNumber({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedRandomNumber> createState() => _AnimatedRandomNumberState();
}

class _AnimatedRandomNumberState extends State<AnimatedRandomNumber>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(
        minutes: 1,
      ), // Adjust duration for slower movement
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve:
            Curves.linear, // Adding an ease-in-out curve for a ticking effect
      ),
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double targetPosition =
        screenHeight - 100; // Adjust this to your needs
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        // Calculate the position based on the current animation value
        double position = _animation.value * targetPosition;

        // To create a "tick tick" effect, adjust the position incrementally
        // This approach mimics a ticking effect by snapping the position to discrete steps
        position = (position / 10).round() * 10.0;
        return Positioned(
          top: position,
          left: 0, // Center the number horizontally
          child: child!,
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                context.read<HomeCubit>().score(state.randomNumber);
              },
              child: Text(
                '${state.randomNumber}',
                style: theme.textTheme.headlineLarge,
              ),
            );
          },
        ),
      ),
    );
  }
}
