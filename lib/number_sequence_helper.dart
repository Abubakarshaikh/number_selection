import 'dart:math';

import 'package:number_selection/sequence_display_style.dart';

class NumberSequenceHelper {
  NumberSequenceHelper({
    required this.random,
  });
  final Random random;

  // This method generate RandomSequence
  List<int> generateRandomSequence(int length, {bool isShuffle = false}) {
    int start = random.nextInt(10) + 1;
    int step = random.nextInt(5) + 1;

    final generatedNumber = List<int>.generate(
      length,
      (index) => start + (index * step),
    );
    if (isShuffle) {
      generatedNumber.shuffle();
    }
    return generatedNumber;
  }

  // This method generate Random selection number
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

  // This method generate random animation style
  SequenceDisplayStyle getRandomSequenceDisplayStyle() {
    const values = SequenceDisplayStyle.values;
    final randomIndex = random.nextInt(values.length);
    return values[randomIndex];
  }
}
