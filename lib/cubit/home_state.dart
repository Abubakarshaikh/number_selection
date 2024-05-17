// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:number_selection/sequence_display_style.dart';

enum Level { easy, hard }

class HomeState extends Equatable {
  final bool isActive;
  final int score;
  final int timer;
  final List<int> selectedSequence;
  final int sequenceDisplay;
  final bool isSequenceDisplayComleted;
  final List<int> randomSequence;
  final List<List<int>> randomNumbers;
  final SequenceDisplayStyle sequenceDisplayStyle;
  final int sequenceTimer;
  final Level level;
  const HomeState({
    this.isActive = false,
    this.score = 0,
    this.timer = 0,
    this.selectedSequence = const [],
    this.sequenceDisplay = 0,
    this.isSequenceDisplayComleted = false,
    this.randomSequence = const [],
    this.randomNumbers = const [],
    this.sequenceDisplayStyle = SequenceDisplayStyle.one,
    this.sequenceTimer = 0,
    this.level = Level.easy,
  });

  @override
  List<Object> get props {
    return [
      isActive,
      score,
      timer,
      selectedSequence,
      sequenceDisplay,
      isSequenceDisplayComleted,
      randomSequence,
      randomNumbers,
      sequenceDisplayStyle,
      sequenceTimer,
      level,
    ];
  }

  HomeState copyWith({
    bool? isActive,
    int? score,
    int? timer,
    List<int>? selectedSequence,
    int? sequenceDisplay,
    bool? isSequenceDisplayComleted,
    List<int>? randomSequence,
    List<List<int>>? randomNumbers,
    SequenceDisplayStyle? sequenceDisplayStyle,
    int? sequenceTimer,
    Level? level,
  }) {
    return HomeState(
      isActive: isActive ?? this.isActive,
      score: score ?? this.score,
      timer: timer ?? this.timer,
      selectedSequence: selectedSequence ?? this.selectedSequence,
      sequenceDisplay: sequenceDisplay ?? this.sequenceDisplay,
      isSequenceDisplayComleted:
          isSequenceDisplayComleted ?? this.isSequenceDisplayComleted,
      randomSequence: randomSequence ?? this.randomSequence,
      randomNumbers: randomNumbers ?? this.randomNumbers,
      sequenceDisplayStyle: sequenceDisplayStyle ?? this.sequenceDisplayStyle,
      sequenceTimer: sequenceTimer ?? this.sequenceTimer,
      level: level ?? this.level,
    );
  }
}
