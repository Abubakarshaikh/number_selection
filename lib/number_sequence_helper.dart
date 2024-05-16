import 'dart:math';

class NumberSequenceHelper {
  NumberSequenceHelper({
    required this.random,
  });
  final Random random;

  int randomNumber(int length) {
    final randomValue = (length / 2).round() + random.nextInt(length) + 1;
    return randomValue;
  }

  List<int> generateRandomSequence(int length) {
    int start = random.nextInt(10) + 1;
    int step = random.nextInt(5) + 1;

    return List<int>.generate(
      length,
      (index) => start + (index * step),
    );
  }

  int randomlyPopIndex(List<int> sequence) {
    return random.nextInt(sequence.length);
  }
}
