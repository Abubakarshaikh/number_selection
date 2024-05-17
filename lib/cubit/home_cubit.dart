import 'dart:async';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:number_selection/constants.dart';
import 'package:number_selection/cubit/home_state.dart';
import 'package:number_selection/number_sequence_helper.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._numberSequenceHelper,
  ) : super(const HomeState());

  Timer? _timerForGame;
  Timer? _timerForSequence;
  final AudioPlayer audioPlayer = AudioPlayer();

  final NumberSequenceHelper _numberSequenceHelper;

  // this event start the game
  void startGame() {
    final randomSequence = _numberSequenceHelper.generateRandomSequence(
      5,
      isShuffle: state.level == Level.easy ? false : true,
    );
    emit(
      HomeState(
        level: state.level,
        isActive: true,
        randomSequence: randomSequence,
        score: state.score,
        sequenceTimer: 5,
      ),
    );
    gameTimer();
    sequenceDisplay();
    numberSelection(randomSequence);
  }

  // this event stop the game entirely
  void stopGame() {
    if (_timerForGame != null) {
      if (_timerForGame?.isActive ?? false) {
        _timerForGame?.cancel();
      }
    }

    if (_timerForSequence != null) {
      if (_timerForSequence?.isActive ?? false) {
        _timerForSequence?.cancel();
      }
    }

    emit(const HomeState());
  }

  // this event display sequence number with certain interval
  void sequenceDisplay() {
    // display sequence with 3 seconds one by one
    // emit sequence each by each

    if (_timerForSequence != null) {
      if (_timerForSequence?.isActive ?? false) {
        _timerForSequence?.cancel();
      }
    }
    _timerForSequence = Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        if (state.randomSequence.length > timer.tick - 1) {
          log((timer.tick - 1).toString());
          final sequenceDisplayStyle =
              _numberSequenceHelper.getRandomSequenceDisplayStyle();
          emit(state.copyWith(
            isSequenceDisplayComleted: false,
            sequenceDisplayStyle: sequenceDisplayStyle,
            sequenceDisplay: state.randomSequence.elementAt(timer.tick - 1),
            sequenceTimer: timer.tick,
          ));
        } else {
          emit(state.copyWith(
            isSequenceDisplayComleted: true,
            sequenceDisplay: 0,
            sequenceTimer: 0,
          ));
          timer.cancel();
        }
      },
    );
  }

  // this event is use for select number selection for Sequence Matching
  void selectedSequence(int selectedNumber) async {
    // number selection is complete now show the selected sequence
    // emits number selection value
    if (state.selectedSequence.length < state.randomSequence.length) {
      emit(
        state.copyWith(
          selectedSequence: [
            ...state.selectedSequence,
            selectedNumber,
          ],
        ),
      );

      if (state.selectedSequence.length == state.randomSequence.length) {
        await Future.delayed(const Duration(milliseconds: 200));
        gameScore();
      }
    }
  }

  // this event generate timer
  void gameTimer() async {
    // emits timer value second by second for 10 seconds
    // after 10 seconds, next sequence is generated
    // each sequence completion time is 10 seconds
    if (_timerForGame != null) {
      if (_timerForGame?.isActive ?? false) {
        _timerForGame?.cancel();
      }
    }

    _timerForGame = Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        if (timer.tick <= 30) {
          emit(state.copyWith(
            timer: timer.tick,
          ));
        } else {
          await playSound(AppConstant.inCorrect);

          emit(
            state.copyWith(
              score: state.score >= 2 ? state.score - 2 : 0,
            ),
          );
          timer.cancel();
          startGame();
        }
      },
    );
  }

  // this event manage all score
  void gameScore() async {
    // emit score: increase or decrease base on
    // correct selection
    // make sure, it will run when user complete sequence
    // and press submit/enter

    state.randomSequence.sort();
    log('state.randomSequence: ${state.randomSequence}');
    log('state.selectedSequence: ${state.selectedSequence}');
    if (const ListEquality()
        .equals(state.randomSequence, state.selectedSequence)) {
      await playSound(AppConstant.correct);
      emit(
        state.copyWith(
          score: state.score + 2,
        ),
      );
    } else {
      await playSound(AppConstant.inCorrect);
      emit(
        state.copyWith(
          score: state.score >= 2 ? state.score - 2 : 0,
        ),
      );
    }

    startGame();
  }

  // this event display selection number accordinf Sequence number
  void numberSelection(List<int> randomSequence) {
    final randomSelections =
        _numberSequenceHelper.generateRandomSelection(randomSequence);

    int sublistLength = 5;

    List<List<int>> splitList = [
      for (int i = 0; i < randomSelections.length; i += sublistLength)
        randomSelections.sublist(
          i,
          i + sublistLength > randomSelections.length
              ? randomSelections.length
              : i + sublistLength,
        )
    ];

    emit(state.copyWith(
      randomNumbers: splitList,
    ));
  }

  // this event play sound
  Future<void> playSound(String source) async {
    final playerAssetSource = AudioSource.asset(source);
    await audioPlayer.setAudioSource(playerAssetSource);
    await audioPlayer.play();
  }

  void changeLevel(Level level) {
    emit(
      state.copyWith(
        level: level,
      ),
    );
    startGame();
  }

  // from here we are clean our memory
  @override
  Future<void> close() {
    _timerForGame?.cancel();
    _timerForSequence?.cancel();
    return super.close();
  }
}
