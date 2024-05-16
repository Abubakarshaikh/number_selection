// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_selection/cubit/home_state.dart';
import 'package:number_selection/number_sequence_helper.dart';

class HomeCubit extends Cubit<HomeState> {
  final NumberSequenceHelper _numberSequenceHelper;
  Timer? _timer;
  Timer? _timerForNumberSelection;

  HomeCubit(
    this._numberSequenceHelper,
  ) : super(const HomeState());

  void start() {
    if (_timer != null) {
      _timer?.cancel();
    }

    if (_timerForNumberSelection != null) {
      _timerForNumberSelection?.cancel();
    }
    final numberSequence = _numberSequenceHelper.generateRandomSequence(5);
    final popIndex = _numberSequenceHelper.randomlyPopIndex(numberSequence);
    emit(
      state.copyWith(
        popIndex: popIndex,
        randomSequence: numberSequence,
        isPlaying: true,
      ),
    );
    randoNumber();
    timer();
  }

  void randoNumber() {
    const duration = Duration(seconds: 2);
    _timerForNumberSelection = Timer.periodic(
      duration,
      (Timer timer) {
        final randomNumber = _numberSequenceHelper
            .randomNumber(state.randomSequence[state.popIndex]);
        emit(
          state.copyWith(
            randomNumber: randomNumber,
          ),
        );
      },
    );
  }

  void stop() {
    _timerForNumberSelection?.cancel();
    _timer?.cancel();
    _timer = null;
    _timerForNumberSelection = null;
  }

  void timer() {
    const duration = Duration(seconds: 1);
    _timer = Timer.periodic(
      duration,
      (Timer timer) {
        emit(
          state.copyWith(
            seconds: timer.tick,
          ),
        );
        topTimer();
      },
    );
  }

  void score(int selection) {
    if (selection == state.randomSequence[state.popIndex]) {
      final updatedScore = state.scores + 1;
      final numberSequence = _numberSequenceHelper.generateRandomSequence(5);
      final popIndex = _numberSequenceHelper.randomlyPopIndex(numberSequence);
      emit(state.copyWith(
        scores: updatedScore,
        randomSequence: numberSequence,
        popIndex: popIndex,
      ));
    }
  }

  void topTimer() {
    if ((_timer?.tick ?? 0) > 29) {
      _timer?.cancel();
      _timer = null;
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    _timerForNumberSelection?.cancel();
    return super.close();
  }
}
