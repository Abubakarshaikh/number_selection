import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_selection/cubit/home_cubit.dart';
import 'package:number_selection/cubit/home_state.dart';
import 'package:number_selection/widgets/game_start.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(builder: (context, constrained) {
          if (constrained.maxWidth > 450) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 500,
                  child: BlocBuilder<HomeCubit, HomeState>(
                    buildWhen: (previous, current) {
                      return previous.isActive != current.isActive;
                    },
                    builder: (context, state) {
                      if (state.isActive) {
                        return const GameStart();
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 36),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Welcom to the Number Selection Game'
                                    .toUpperCase(),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 24),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<HomeCubit>().startGame();
                                },
                                child: const Text('START GAME'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            );
          } else {
            return BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) {
                return previous.isActive != current.isActive;
              },
              builder: (context, state) {
                if (state.isActive) {
                  return const GameStart();
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Welcom to the Number Selection Game'.toUpperCase(),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {
                            context.read<HomeCubit>().startGame();
                          },
                          child: const Text('START GAME'),
                        ),
                      ],
                    ),
                  );
                }
              },
            );
          }
        }),
      ),
    );
  }
}
