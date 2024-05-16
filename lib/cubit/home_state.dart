// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int seconds;
  final int scores;
  final int randomNumber;
  final List<int> randomSequence;
  final bool isPlaying;
  final int popIndex;
  const HomeState({
    this.seconds = 0,
    this.scores = 0,
    this.randomNumber = 0,
    this.randomSequence = const [],
    this.isPlaying = false,
    this.popIndex = 0,
  });

  HomeState copyWith({
    int? seconds,
    int? scores,
    int? randomNumber,
    List<int>? randomSequence,
    bool? isPlaying,
    int? popIndex,
  }) {
    return HomeState(
      seconds: seconds ?? this.seconds,
      scores: scores ?? this.scores,
      randomNumber: randomNumber ?? this.randomNumber,
      randomSequence: randomSequence ?? this.randomSequence,
      isPlaying: isPlaying ?? this.isPlaying,
      popIndex: popIndex ?? this.popIndex,
    );
  }

  @override
  List<Object?> get props => [
        seconds,
        scores,
        randomNumber,
        randomSequence,
        isPlaying,
        popIndex,
      ];
}
