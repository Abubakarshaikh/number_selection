import 'package:flutter/material.dart';
import 'package:number_selection/sequence_display_style.dart';

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
    final displayValue = widget.number == 0 ? '' : widget.number.toString();
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
                displayValue,
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
                displayValue,
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
              top: _animation.value.dy * 300,
              child: Text(
                displayValue,
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
              top: _animation.value.dy * 400,
              child: Text(
                displayValue,
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
              top: _animation.value.dy * 100,
              child: Text(
                displayValue,
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
              top: _animation.value.dy * 250,
              child: Text(
                displayValue,
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
              top: _animation.value.dy * 50,
              child: Text(
                displayValue,
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
              top: _animation.value.dy * 600,
              child: Text(
                displayValue,
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
              top: _animation.value.dy * 300,
              child: Text(
                displayValue,
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
              top: _animation.value.dy * 300,
              child: Text(
                displayValue,
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
              top: _animation.value.dy * 100,
              child: Text(
                displayValue,
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
