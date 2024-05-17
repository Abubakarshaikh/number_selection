import 'dart:math';

import 'package:number_selection/sequence_display_style.dart';

class NumberSequenceHelper {
  NumberSequenceHelper({
    required this.random,
  });
  final Random random;

  List<int> generateRandomSequence(int length) {
    int start = random.nextInt(10) + 1;
    int step = random.nextInt(5) + 1;

    return List<int>.generate(
      length,
      (index) => start + (index * step),
    );
  }

  List<int> generateRandomSelection(
    List<int> randomSequence,
  ) {
    int start = random.nextInt(10) + 1;
    int step = random.nextInt(5) + 1;

    final randomNumber = List<int>.generate(
      20,
      (index) => start + (index * step),
    );

    randomNumber.addAll(randomSequence);

    randomNumber.shuffle();
    return randomNumber;
  }

  SequenceDisplayStyle getRandomSequenceDisplayStyle() {
    const values = SequenceDisplayStyle.values;
    final randomIndex = random.nextInt(values.length);
    return values[randomIndex];
  }
}
