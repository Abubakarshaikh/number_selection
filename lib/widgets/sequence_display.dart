// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_selection/cubit/home_cubit.dart';
import 'package:number_selection/cubit/home_state.dart';
import 'package:number_selection/sequence_display_style.dart';

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
          builder: (context, state) {
            if (!state.isSequenceDisplayComleted) {
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

class AnimatedSequenceNumber extends StatefulWidget {
  final int number;
  final SequenceDisplayStyle sequenceDisplayStyle;
  const AnimatedSequenceNumber({
    Key? key,
    required this.number,
    required this.sequenceDisplayStyle,
  }) : super(key: key);

  @override
  State<AnimatedSequenceNumber> createState() => _AnimatedSequenceNumberState();
}

class _AnimatedSequenceNumberState extends State<AnimatedSequenceNumber>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.0, 1.0),
    ).animate(_animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    switch (widget.sequenceDisplayStyle) {
      case SequenceDisplayStyle.one:
        return Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.bounceIn,
              left: _animation.value.dx * 200,
              top: _animation.value.dy * 200,
              child: Text(
                widget.number.toString(),
                style: theme.textTheme.displaySmall,
              ),
            ),
          ],
        );
      case SequenceDisplayStyle.two:
        return Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.bounceOut,
              right: _animation.value.dx * 200,
              top: _animation.value.dy * 200,
              child: Text(
                widget.number.toString(),
                style: theme.textTheme.displaySmall,
              ),
            ),
          ],
        );
      case SequenceDisplayStyle.three:
        return Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              left: _animation.value.dx * 200,
              top: _animation.value.dy * 200,
              child: Text(
                widget.number.toString(),
                style: theme.textTheme.displaySmall,
              ),
            ),
          ],
        );
      case SequenceDisplayStyle.four:
        return Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              right: _animation.value.dx * 200,
              top: _animation.value.dy * 200,
              child: Text(
                widget.number.toString(),
                style: theme.textTheme.displaySmall,
              ),
            ),
          ],
        );
      case SequenceDisplayStyle.five:
        return Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
              left: _animation.value.dx * 200,
              top: _animation.value.dy * 200,
              child: Text(
                widget.number.toString(),
                style: theme.textTheme.displaySmall,
              ),
            ),
          ],
        );
      case SequenceDisplayStyle.six:
        return Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.elasticIn,
              right: _animation.value.dx * 200,
              top: _animation.value.dy * 200,
              child: Text(
                widget.number.toString(),
                style: theme.textTheme.displaySmall,
              ),
            ),
          ],
        );
      case SequenceDisplayStyle.seven:
        return Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastEaseInToSlowEaseOut,
              right: _animation.value.dx * 200,
              top: _animation.value.dy * 200,
              child: Text(
                widget.number.toString(),
                style: theme.textTheme.displaySmall,
              ),
            ),
          ],
        );
      case SequenceDisplayStyle.eight:
        return Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutCubicEmphasized,
              left: _animation.value.dx * 200,
              top: _animation.value.dy * 200,
              child: Text(
                widget.number.toString(),
                style: theme.textTheme.displaySmall,
              ),
            ),
          ],
        );
      case SequenceDisplayStyle.nine:
        return Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.linearToEaseOut,
              right: _animation.value.dx * 200,
              top: _animation.value.dy * 200,
              child: Text(
                widget.number.toString(),
                style: theme.textTheme.displaySmall,
              ),
            ),
          ],
        );
      case SequenceDisplayStyle.ten:
        return Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              left: _animation.value.dx * 200,
              top: _animation.value.dy * 200,
              child: Text(
                widget.number.toString(),
                style: theme.textTheme.displaySmall,
              ),
            ),
          ],
        );

      default:
        return Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              right: _animation.value.dx * 200,
              top: _animation.value.dy * 200,
              child: Text(
                widget.number.toString(),
                style: theme.textTheme.displaySmall,
              ),
            ),
          ],
        );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
